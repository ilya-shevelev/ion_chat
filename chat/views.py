from django.shortcuts import render
from chat.models import Room
from accounts.models import CustomUser


def index_view(request):
    return render(
        request,
        "index.html",
        {
            "rooms": Room.objects.all(),
            "users": CustomUser.objects.all(),
        },
    )


def room_view(request, room_name):
    chat_room, created = Room.objects.get_or_create(name=room_name)
    return render(
        request,
        "room.html",
        {
            "room": chat_room,
        },
    )

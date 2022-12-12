from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from chat.models import Room, Message
from accounts.models import CustomUser


def index_view(request):
    return render(request, "chat/index.html", {
            "rooms": Room.objects.all(),
            "users": CustomUser.objects.all(),
        },
    )


@login_required(login_url='chat-index')
def room_view(request, room_name):
    return render(request, "chat/room.html", {"room_name": room_name, 'messages': Message.objects.filter(room__name=room_name)})

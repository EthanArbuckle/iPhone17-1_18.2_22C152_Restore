@interface MRServiceHandleNowPlayingPlaybackQueueRequest
@end

@implementation MRServiceHandleNowPlayingPlaybackQueueRequest

void ___MRServiceHandleNowPlayingPlaybackQueueRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v8 = reply;
    if (reply)
    {
      MRAddPlaybackQueueToXPCMessage(reply, v9);
      MRAddClientErrorToXPCMessage(v8, (uint64_t)v5);
      xpc_connection_send_message(v6, v8);
    }
  }
}

@end
@interface MRServiceHandleAudioAmplitudeSamplesRequest
@end

@implementation MRServiceHandleAudioAmplitudeSamplesRequest

void ___MRServiceHandleAudioAmplitudeSamplesRequest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    connection = v6;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      if (a2)
      {
        id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];
        xpc_dictionary_set_data(reply, "MRXPC_AUDIO_AMPLITUDE_ARRAY_DATA_KEY", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
      }
      MRAddClientErrorToXPCMessage(reply, a3);
      xpc_connection_send_message(connection, reply);
    }

    v6 = connection;
  }
}

@end
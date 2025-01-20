@interface MRServiceHandleVoiceInputMessage
@end

@implementation MRServiceHandleVoiceInputMessage

void ___MRServiceHandleVoiceInputMessage_block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x900000000000005)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    if (v7 && *(void *)(v7 + 24))
    {
      xpc_object_t xdicta = v8;
      uint64_t v9 = xpc_dictionary_get_uint64(v8, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      v10 = (UInt8 *)MRCreateDataFromXPCMessage(xdicta, "MRXPC_VOICE_DATA_PROTOBUF_DATA_KEY");
      if (v10)
      {
        uint64_t v11 = MRAudioDataBlockCreateFromExternalRepresentation(*MEMORY[0x1E4F1CF80], (uint64_t)v10);
        v12 = (void *)v11;
        if (v11)
        {
          v13 = MRAudioDataBlockGetBuffer(v11);
          double Timestamp = MRAudioDataBlockGetTimestamp(v12);
          double v16 = v15;
          float Gain = MRAudioDataBlockGetGain(v12);
        }
        else
        {
          v13 = 0;
          double v16 = 0.0;
          float Gain = 0.0;
          double Timestamp = 0.0;
        }
      }
      else
      {
        v13 = 0;
        double v16 = 0.0;
        float Gain = 0.0;
        double Timestamp = 0.0;
      }
      (*(void (**)(uint64_t, void *, void, double, double, float))(v7 + 24))(v9, v13, *(void *)v7, Timestamp, v16, Gain);

      id v8 = xdicta;
    }
    goto LABEL_25;
  }
  uint64_t v3 = uint64;
  if (uint64 == 0x900000000000003)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    xpc_object_t xdict = v5;
    if (v18 && *(void *)(v18 + 16))
    {
      uint64_t v19 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      (*(void (**)(uint64_t, void))(v18 + 16))(v19, *(void *)v18);
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v20 = 6;
    goto LABEL_17;
  }
  if (uint64 == 0x900000000000002)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    xpc_object_t xdict = v5;
    if (v4 && *(void *)(v4 + 8))
    {
      uint64_t v6 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      (*(void (**)(uint64_t, void))(v4 + 8))(v6, *(void *)v4);
LABEL_15:
      id v5 = xdict;
      uint64_t v20 = 0;
LABEL_17:
      _MRServiceSendReply(v5, v20);
      id v8 = xdict;
LABEL_25:

      return;
    }
    goto LABEL_16;
  }
  v21 = _MRLogForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v3;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Voice recording client message %lu not handled", buf, 0xCu);
  }
}

@end
@interface MRSyncOutputDevicesMessage
- (BOOL)shouldVerboselyLog;
- (MRSyncOutputDevicesMessage)initWithOutputDevices:(id)a3;
- (NSArray)outputDevices;
- (unint64_t)type;
@end

@implementation MRSyncOutputDevicesMessage

- (MRSyncOutputDevicesMessage)initWithOutputDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MRSyncOutputDevicesMessage;
  v6 = [(MRProtocolMessage *)&v33 init];
  v7 = v6;
  if (v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&v6->_outputDevices, a3);
    v8 = objc_alloc_init(_MRUpdateOutputDevicesMessageProtobuf);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v14 = [v13 descriptor];
          if (v14)
          {
            [(_MRUpdateOutputDevicesMessageProtobuf *)v8 addClusterAwareOutputDevices:v14];
            if ([v13 deviceSubtype] == 15)
            {
              long long v27 = 0u;
              long long v28 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              v15 = [v13 clusterComposition];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v26;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v26 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    v20 = [*(id *)(*((void *)&v25 + 1) + 8 * j) descriptor];
                    [(_MRUpdateOutputDevicesMessageProtobuf *)v8 addOutputDevices:v20];
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
                }
                while (v17);
              }
            }
            else
            {
              [(_MRUpdateOutputDevicesMessageProtobuf *)v8 addOutputDevices:v14];
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v10);
    }

    v7 = v22;
    [(MRProtocolMessage *)v22 setUnderlyingCodableMessage:v8];

    id v5 = v23;
  }

  return v7;
}

- (NSArray)outputDevices
{
  outputDevices = self->_outputDevices;
  if (!outputDevices)
  {
    v4 = +[MRUserSettings currentSettings];
    int v5 = [v4 useClusterDevices];

    v6 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v7 = v6;
    if (v5)
    {
      v8 = [v6 clusterAwareOutputDevices];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        uint64_t v11 = [(MRProtocolMessage *)self underlyingCodableMessage];
        id v10 = [v11 outputDevices];
      }
    }
    else
    {
      id v10 = [v6 outputDevices];
    }

    objc_msgSend(v10, "mr_map:", &__block_literal_global_3);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_outputDevices;
    self->_outputDevices = v12;

    outputDevices = self->_outputDevices;
  }

  return outputDevices;
}

MRAVDistantOutputDevice *__43__MRSyncOutputDevicesMessage_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v2];

  return v3;
}

- (unint64_t)type
{
  return 65;
}

- (BOOL)shouldVerboselyLog
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
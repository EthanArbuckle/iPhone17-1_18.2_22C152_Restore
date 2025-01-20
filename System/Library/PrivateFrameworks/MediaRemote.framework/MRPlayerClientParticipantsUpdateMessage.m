@interface MRPlayerClientParticipantsUpdateMessage
- (MRPlayerClientParticipantsUpdateMessage)initWithPlayerPath:(id)a3 participants:(id)a4;
- (MRPlayerPath)playerPath;
- (NSArray)participants;
- (unint64_t)type;
@end

@implementation MRPlayerClientParticipantsUpdateMessage

- (MRPlayerClientParticipantsUpdateMessage)initWithPlayerPath:(id)a3 participants:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MRPlayerClientParticipantsUpdateMessage;
  v8 = [(MRProtocolMessage *)&v22 init];
  if (v8)
  {
    v9 = objc_alloc_init(_MRPlayerClientParticipantsUpdateMessageProtobuf);
    v10 = [v6 protobuf];
    [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)v9 setPlayerPath:v10];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "protobufWithEncoding:", 0, (void)v18);
          [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)v9 addParticipants:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }

  return v8;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  id v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (NSArray)participants
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 participants];
  id v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v8 = [v7 participants];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [[MRPlaybackQueueParticipant alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v6 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v6 copy];

  return (NSArray *)v14;
}

- (unint64_t)type
{
  return 131;
}

@end
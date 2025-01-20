@interface MRUpdateContentItemArtworkMessage
- (MRPlayerPath)playerPath;
- (MRUpdateContentItemArtworkMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5;
- (NSArray)contentItems;
- (unint64_t)type;
@end

@implementation MRUpdateContentItemArtworkMessage

- (MRUpdateContentItemArtworkMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MRUpdateContentItemArtworkMessage;
  v10 = [(MRProtocolMessage *)&v25 init];
  if (v10)
  {
    v11 = objc_alloc_init(_MRUpdateContentItemArtworkMessageProtobuf);
    v12 = [v9 skeleton];
    v13 = [v12 protobuf];
    [(_MRUpdateContentItemArtworkMessageProtobuf *)v11 setPlayerPath:v13];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "protobufWithEncoding:", a5, (void)v21);
          [(_MRUpdateContentItemArtworkMessageProtobuf *)v11 addContentItems:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }

    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v11];
  }

  return v10;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (NSArray)contentItems
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 contentItems];
  v4 = objc_msgSend(v3, "mr_map:", &__block_literal_global_114);

  return (NSArray *)v4;
}

MRContentItem *__49__MRUpdateContentItemArtworkMessage_contentItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRContentItem alloc] initWithProtobuf:v2];

  return v3;
}

- (unint64_t)type
{
  return 57;
}

@end
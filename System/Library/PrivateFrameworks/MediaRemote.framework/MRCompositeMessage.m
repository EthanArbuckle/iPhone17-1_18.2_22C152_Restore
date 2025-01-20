@interface MRCompositeMessage
- (MRCompositeMessage)init;
- (NSArray)messages;
- (id)description;
- (id)transportOptions;
- (void)addMessage:(id)a3;
- (void)setTransportOptions:(id)a3;
@end

@implementation MRCompositeMessage

- (MRCompositeMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRCompositeMessage;
  v2 = [(MRProtocolMessage *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    messages = v2->_messages;
    v2->_messages = v3;
  }
  return v2;
}

- (void)addMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSMutableArray *)v5->_messages addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSArray)messages
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableArray *)v2->_messages copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)transportOptions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  transportOptions = v2->_transportOptions;
  obj = v2;
  if (transportOptions)
  {
    id v4 = transportOptions;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = v2->_messages;
    char v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v12 = [v11 transportOptions];
          if ([v12 priority] < 1)
          {
            uint64_t v14 = 3;
          }
          else
          {
            v13 = [v11 transportOptions];
            uint64_t v14 = [v13 priority];
          }
          if (v14 > v7) {
            uint64_t v7 = v14;
          }
          v15 = [v11 transportOptions];
          char v16 = [v15 isWaking];

          v6 |= v16;
        }
        uint64_t v8 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    if ((v7 > 0) | v6 & 1)
    {
      id v4 = objc_alloc_init(MRProtocolMessageOptions);
      [(MRProtocolMessageOptions *)v4 setPriority:v7];
      [(MRProtocolMessageOptions *)v4 setWaking:v6 & 1];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_sync_exit(obj);

  return v4;
}

- (void)setTransportOptions:(id)a3
{
  id v4 = (MRProtocolMessageOptions *)a3;
  obj = self;
  objc_sync_enter(obj);
  transportOptions = obj->_transportOptions;
  obj->_transportOptions = v4;

  objc_sync_exit(obj);
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@, Messages:\n", objc_opt_class()];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_messages;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        uint64_t v9 = [v8 componentsSeparatedByString:@"\n"];

        v10 = objc_msgSend(v9, "mr_map:", &__block_literal_global_71);
        v11 = [v10 componentsJoinedByString:@"\n"];

        [v3 appendFormat:@"%@\n", v11];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [v3 appendString:@">"];

  return v3;
}

uint64_t __33__MRCompositeMessage_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return [@"\t" stringByAppendingString:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end
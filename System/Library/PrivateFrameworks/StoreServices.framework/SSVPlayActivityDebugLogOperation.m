@interface SSVPlayActivityDebugLogOperation
- (NSArray)playActivityEvents;
- (void)main;
- (void)setPlayActivityEvents:(id)a3;
@end

@implementation SSVPlayActivityDebugLogOperation

- (void)main
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(SSVPlayActivityDebugLogOperation *)self playActivityEvents];
  if ([v2 count])
  {
    v3 = NSTemporaryDirectory();
    v4 = [v3 stringByAppendingPathComponent:@"com.apple.PlayActivityFeed"];

    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
    v18 = v4;
    v16 = [v4 stringByAppendingPathComponent:@"PlayActivityEvents.log"];
    v5 = objc_msgSend(MEMORY[0x1E4F1CAA8], "outputStreamToFileAtPath:append:");
    [v5 open];
    id v19 = [@"\n-----------------------------------------\n" dataUsingEncoding:4];
    v6 = objc_alloc_init(SSVPlayActivityFeedSerialization);
    v7 = +[SSDevice currentDevice];
    v8 = [v7 storeFrontIdentifier];
    [(SSVPlayActivityFeedSerialization *)v6 setCurrentStoreFrontID:v8];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v2;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(SSVPlayActivityFeedSerialization *)v6 propertyListObjectWithPlayActivityEvent:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v14
            && [MEMORY[0x1E4F28F98] writePropertyList:v14 toStream:v5 format:100 options:0 error:0] >= 1)
          {
            id v15 = v19;
            objc_msgSend(v5, "write:maxLength:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v5 close];
  }
}

- (NSArray)playActivityEvents
{
  return self->_playActivityEvents;
}

- (void)setPlayActivityEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
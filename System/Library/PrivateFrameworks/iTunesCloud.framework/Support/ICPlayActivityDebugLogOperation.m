@interface ICPlayActivityDebugLogOperation
- (NSArray)playActivityEvents;
- (void)main;
- (void)setPlayActivityEvents:(id)a3;
@end

@implementation ICPlayActivityDebugLogOperation

- (void).cxx_destruct
{
}

- (void)setPlayActivityEvents:(id)a3
{
}

- (NSArray)playActivityEvents
{
  return self->_playActivityEvents;
}

- (void)main
{
  v2 = [(ICPlayActivityDebugLogOperation *)self playActivityEvents];
  if ([v2 count])
  {
    v3 = NSTemporaryDirectory();
    v4 = [v3 stringByAppendingPathComponent:@"com.apple.PlayActivityFeed"];

    v18 = +[NSFileManager defaultManager];
    [v18 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
    v19 = v4;
    v17 = [v4 stringByAppendingPathComponent:@"PlayActivityEvents.log"];
    v5 = +[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:");
    [v5 open];
    id v20 = [@"\n-----------------------------------------\n" dataUsingEncoding:4];
    v6 = objc_alloc_init(ICPlayActivityFeedSerialization);
    v7 = +[ICUserIdentityStore defaultIdentityStore];
    v8 = [v7 localStoreAccountProperties];

    v9 = [v8 storefrontIdentifier];
    [(ICPlayActivityFeedSerialization *)v6 setCurrentStoreFrontID:v9];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v2;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [(ICPlayActivityFeedSerialization *)v6 propertyListObjectWithPlayActivityEvent:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v15
            && +[NSPropertyListSerialization writePropertyList:v15 toStream:v5 format:100 options:0 error:0] >= 1)
          {
            id v16 = v20;
            objc_msgSend(v5, "write:maxLength:", objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    [v5 close];
  }
}

@end
@interface ATSSignpostPlistCapture
- (ATSSignpostPlistCapture)initWithLogger:(id)a3;
- (id)describeChunkWithTag:(unsigned int)a3;
- (void)addChunksToFile:(ktrace_file *)a3;
@end

@implementation ATSSignpostPlistCapture

- (ATSSignpostPlistCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATSSignpostPlistCapture;
  v6 = [(ATSSignpostPlistCapture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)addChunksToFile:(ktrace_file *)a3
{
  v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSURL fileURLWithPath:@"/AppleInternal/Library/Ariadne/Plists/"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = _signpostSpecPathsForURL(v5);
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = _deserializeSignpostSpecs(v11);
        [v4 setObject:v12 forKeyedSubscript:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v20 = 0;
  v13 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v20];
  id v14 = v20;
  v15 = v14;
  if (!v13)
  {
    v19 = [v14 localizedDescription];
    v18 = +[NSString stringWithFormat:@"Failed to serialize signposts to a plist. Error: %@", v19];

    goto LABEL_12;
  }
  id v16 = v13;
  [v16 bytes];
  [v16 length];
  if (!ktrace_file_append_chunk())
  {
    v17 = __error();
    v18 = +[NSString stringWithFormat:@"Failed to append signpost plist chunk. Error: %s", strerror(*v17)];
LABEL_12:
    [(KTProviderLogger *)self->_logger failWithReason:v18];
  }
}

- (id)describeChunkWithTag:(unsigned int)a3
{
  if (a3 == 20986) {
    return @"KDebug Signpost Plists";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end
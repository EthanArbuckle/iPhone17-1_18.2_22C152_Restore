@interface _TUIFeedCaptureDynamicStateProvider
+ (id)imageResourceProviderWithURL:(id)a3;
- (NSDictionary)instanceMap;
- (NSString)kind;
- (_TUIFeedCaptureDynamicStateProvider)initWithKind:(id)a3 instancesMap:(id)a4;
- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
@end

@implementation _TUIFeedCaptureDynamicStateProvider

+ (id)imageResourceProviderWithURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  unsigned int v6 = [v5 isEqualToString:@"json"];

  if (v6)
  {
    v33 = (objc_class *)a1;
    v7 = [v4 URLByDeletingPathExtension];
    v32 = [v7 lastPathComponent];

    uint64_t v8 = objc_opt_class();
    id v34 = v4;
    v9 = +[NSData dataWithContentsOfURL:v4];
    v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:0];
    v11 = TUIDynamicCast(v8, v10);

    uint64_t v12 = objc_opt_class();
    v31 = v11;
    v13 = [v11 objectForKeyedSubscript:@"instances"];
    v14 = TUIDynamicCast(v12, v13);

    id v36 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v14 count]];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v20 = objc_opt_class();
          v21 = TUIDynamicCast(v20, v19);
          v22 = [v21 objectForKeyedSubscript:@"instance"];
          v23 = [v21 objectForKeyedSubscript:@"parameters"];
          uint64_t v24 = objc_opt_class();
          v25 = [v21 objectForKeyedSubscript:@"value"];
          v26 = TUIDynamicCast(v24, v25);

          if (v22)
          {
            v27 = [[_TUIFeedCaptureInstanceKey alloc] initWithInstance:v22 options:v23];
            v28 = [[TUIDynamicValue alloc] initWithValue:v26];
            [v36 setObject:v28 forKeyedSubscript:v27];
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }

    id v29 = [[v33 alloc] initWithKind:v32 instancesMap:v36];
    id v4 = v34;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (_TUIFeedCaptureDynamicStateProvider)initWithKind:(id)a3 instancesMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureDynamicStateProvider;
  v9 = [(_TUIFeedCaptureDynamicStateProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kind, a3);
    objc_storeStrong((id *)&v10->_instanceMap, a4);
  }

  return v10;
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEqualToString:self->_kind])
  {
    instanceMap = self->_instanceMap;
    v11 = [[_TUIFeedCaptureInstanceKey alloc] initWithInstance:v8 options:v9];
    objc_super v12 = [(NSDictionary *)instanceMap objectForKeyedSubscript:v11];
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (NSDictionary)instanceMap
{
  return self->_instanceMap;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end
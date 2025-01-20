@interface _TUIFeedCaptureImageResourceProvider
+ (id)imageResourceProviderWithURL:(id)a3;
- (NSDictionary)instancesMap;
- (NSString)kind;
- (_TUIFeedCaptureImageResourceProvider)initWithKind:(id)a3 instancesMap:(id)a4;
- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6;
- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4;
@end

@implementation _TUIFeedCaptureImageResourceProvider

+ (id)imageResourceProviderWithURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  unsigned int v6 = [v5 isEqualToString:@"json"];

  if (v6)
  {
    v30 = (objc_class *)a1;
    v7 = [v4 URLByDeletingPathExtension];
    v29 = [v7 lastPathComponent];

    uint64_t v8 = objc_opt_class();
    id v31 = v4;
    v9 = +[NSData dataWithContentsOfURL:v4];
    v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:0];
    v11 = TUIDynamicCast(v8, v10);

    uint64_t v12 = objc_opt_class();
    v28 = v11;
    v13 = [v11 objectForKeyedSubscript:@"instances"];
    v14 = TUIDynamicCast(v12, v13);

    id v33 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v14 count]];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v20 = objc_opt_class();
          v21 = TUIDynamicCast(v20, v19);
          v22 = [v21 objectForKeyedSubscript:@"instance"];
          v23 = [v21 objectForKeyedSubscript:@"options"];
          if (v22)
          {
            v24 = [[_TUIFeedCaptureInstanceKey alloc] initWithInstance:v22 options:v23];
            v25 = [[_TUIFeedCaptureImageResourceInstance alloc] initWithDictionary:v21];
            [v33 setObject:v25 forKeyedSubscript:v24];
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v16);
    }

    id v26 = [[v30 alloc] initWithKind:v29 instancesMap:v33];
    id v4 = v31;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (_TUIFeedCaptureImageResourceProvider)initWithKind:(id)a3 instancesMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureImageResourceProvider;
  v9 = [(_TUIFeedCaptureImageResourceProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kind, a3);
    objc_storeStrong((id *)&v10->_instancesMap, a4);
  }

  return v10;
}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  v10 = [[_TUIFeedCaptureInstanceKey alloc] initWithInstance:v9 options:v8];

  v11 = [(NSDictionary *)self->_instancesMap objectForKeyedSubscript:v10];

  return v11;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_TUIFeedCaptureInstanceKey alloc] initWithInstance:v7 options:v6];

  id v9 = [(NSDictionary *)self->_instancesMap objectForKeyedSubscript:v8];

  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSDictionary)instancesMap
{
  return self->_instancesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instancesMap, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

@end
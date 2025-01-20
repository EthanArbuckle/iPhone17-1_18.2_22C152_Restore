@interface RMECacheDeleter
- (RMECacheDeleter)init;
@end

@implementation RMECacheDeleter

- (RMECacheDeleter)init
{
  v3 = +[RMECacheEnumerator getLogContainer:1];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if (self)
    {
      v9.receiver = self;
      v9.super_class = (Class)RMECacheDeleter;
      v6 = [(RMECacheDeleter *)&v9 init];
      self = v6;
      if (v6) {
        objc_storeStrong((id *)&v6->_archivesDirectory, v4);
      }
    }

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end
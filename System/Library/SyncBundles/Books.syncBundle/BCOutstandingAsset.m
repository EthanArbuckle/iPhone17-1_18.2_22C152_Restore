@interface BCOutstandingAsset
- (NSDictionary)assetDictionaryAsDictionary;
- (void)setAssetDictionaryAsDictionary:(id)a3;
@end

@implementation BCOutstandingAsset

- (void)setAssetDictionaryAsDictionary:(id)a3
{
  uint64_t v8 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:100 options:0 error:&v8];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v8 == 0;
  }
  if (!v6)
  {
    v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_15034((uint64_t)a3, v7);
    }
  }
  [(BCOutstandingAsset *)self setAssetDictionary:v5];
}

- (NSDictionary)assetDictionaryAsDictionary
{
  uint64_t v8 = 0;
  v4 = +[NSPropertyListSerialization propertyListWithData:[(BCOutstandingAsset *)self assetDictionary] options:0 format:0 error:&v8];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v8 == 0;
  }
  if (!v5)
  {
    BOOL v6 = BCDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_150AC((uint64_t)self, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCOutstandingAsset.m", 44, @"Data was not an NSDictionary: %@", v4 object file lineNumber description];
  }
  return v4;
}

@end
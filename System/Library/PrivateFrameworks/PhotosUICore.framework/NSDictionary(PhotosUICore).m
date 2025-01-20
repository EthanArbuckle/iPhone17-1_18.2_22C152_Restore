@interface NSDictionary(PhotosUICore)
- (id)px_dictionaryByAddingEntriesFromDictionary:()PhotosUICore;
- (id)px_dictionaryBySettingObject:()PhotosUICore forKey:;
@end

@implementation NSDictionary(PhotosUICore)

- (id)px_dictionaryByAddingEntriesFromDictionary:()PhotosUICore
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

- (id)px_dictionaryBySettingObject:()PhotosUICore forKey:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[a1 mutableCopy];
  [v8 setObject:v7 forKeyedSubscript:v6];

  v9 = (void *)[v8 copy];
  return v9;
}

@end
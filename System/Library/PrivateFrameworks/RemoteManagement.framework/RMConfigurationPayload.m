@interface RMConfigurationPayload
+ (BOOL)isSignificantChange:(id)a3;
- (id)reportDetails;
@end

@implementation RMConfigurationPayload

+ (BOOL)isSignificantChange:(id)a3
{
  id v3 = a3;
  v4 = +[NSSet setWithObject:@"ui"];
  unsigned __int8 v5 = [v3 isSubsetOfSet:v4];

  return v5 ^ 1;
}

- (id)reportDetails
{
  v16.receiver = self;
  v16.super_class = (Class)RMConfigurationPayload;
  id v3 = [(RMDeclarationPayload *)&v16 reportDetails];
  id v4 = [v3 mutableCopy];

  unsigned __int8 v5 = [(RMConfigurationPayload *)self assetReferences];
  if ([v5 count])
  {
    v6 = [v5 valueForKey:@"assetIdentifier"];
    v7 = [v6 allObjects];
    v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  }
  else
  {
    v8 = &__NSArray0__struct;
  }
  [v4 setObject:v8 forKeyedSubscript:@"assetReferences"];

  v9 = [(RMConfigurationPayload *)self ui];
  v10 = v9;
  if (v9)
  {
    unsigned int v11 = [v9 visible];
    v12 = @"hidden";
    if (v11) {
      v12 = @"visible";
    }
    v13 = v12;
  }
  else
  {
    v13 = @"undefined";
  }
  [v4 setObject:v13 forKeyedSubscript:@"ui"];

  id v14 = [v4 copy];

  return v14;
}

@end
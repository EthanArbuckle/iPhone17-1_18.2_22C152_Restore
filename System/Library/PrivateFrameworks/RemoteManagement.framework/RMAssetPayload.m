@interface RMAssetPayload
- (id)reportDetails;
@end

@implementation RMAssetPayload

- (id)reportDetails
{
  v8.receiver = self;
  v8.super_class = (Class)RMAssetPayload;
  v3 = [(RMDeclarationPayload *)&v8 reportDetails];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithBool:[(RMAssetPayload *)self prefetch]];
  [v4 setObject:v5 forKeyedSubscript:@"prefetch"];

  id v6 = [v4 copy];

  return v6;
}

@end
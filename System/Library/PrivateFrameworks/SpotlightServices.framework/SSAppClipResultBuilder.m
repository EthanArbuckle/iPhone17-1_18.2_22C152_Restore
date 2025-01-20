@interface SSAppClipResultBuilder
+ (id)bundleId;
- (id)buildCommand;
@end

@implementation SSAppClipResultBuilder

+ (id)bundleId
{
  return @"com.apple.app-clips";
}

- (id)buildCommand
{
  v2 = [(SSResultBuilder *)self result];
  if ([v2 type] == 24 || objc_msgSend(v2, "type") == 22)
  {
    v3 = objc_opt_new();
    v4 = [v2 identifier];
    [v3 setClipIdentifier:v4];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
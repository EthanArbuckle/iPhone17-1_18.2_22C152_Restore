@interface TUIElementInclude
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementInclude

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v11 = a6;
  v8 = [a5 stringForAttribute:213 node:a4.var0];
  if (v8)
  {
    v9 = [v11 baseURLForNode:a4.var0];
    v10 = +[NSURL URLWithString:v8 relativeToURL:v9];
  }
  else
  {
    v10 = 0;
  }
  [v11 includeTemplateWithURL:v10];
}

@end
@interface WFTagFactory
+ (id)defaultFactory;
+ (id)tagsForWebpage:(id)a3;
- (WFTagFactory)init;
- (id)tagWithClass:(Class)a3 webpage:(id)a4;
- (void)dealloc;
@end

@implementation WFTagFactory

+ (id)tagsForWebpage:(id)a3
{
  id v4 = +[WFTagFactory defaultFactory];
  v5 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v6 = [v4 tagWithClass:objc_opt_class() webpage:a3];
  uint64_t v7 = [v4 tagWithClass:objc_opt_class() webpage:a3];
  uint64_t v8 = [v4 tagWithClass:objc_opt_class() webpage:a3];
  if (v6) {
    [v5 appendString:v6];
  }
  if (v7)
  {
    [v5 appendString:@"\n"];
    [v5 appendString:v7];
  }
  if (v8)
  {
    [v5 appendString:@"\n"];
    [v5 appendString:v8];
  }
  return v5;
}

+ (id)defaultFactory
{
  if (defaultFactory_TagFactory)
  {
    id v2 = (id)defaultFactory_TagFactory;
    return (id)defaultFactory_TagFactory;
  }
  else
  {
    objc_opt_class();
    id result = (id)objc_opt_new();
    defaultFactory_TagFactory = (uint64_t)result;
  }
  return result;
}

- (WFTagFactory)init
{
  v4.receiver = self;
  v4.super_class = (Class)WFTagFactory;
  id v2 = [(WFTagFactory *)&v4 init];
  if (v2) {
    v2->sharedTags = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (id)tagWithClass:(Class)a3 webpage:(id)a4
{
  uint64_t v7 = NSStringFromClass(a3);
  id v8 = (id)[(NSMutableDictionary *)self->sharedTags objectForKey:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(a3);
    [(NSMutableDictionary *)self->sharedTags setObject:v8 forKey:v7];
  }
  v9 = (void *)[v8 tagWithWebpage:a4];
  v10 = v9;
  if (v9)
  {
    [v9 insertString:@"[ " atIndex:0];
    [v10 appendString:@" ]"];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFTagFactory;
  [(WFTagFactory *)&v3 dealloc];
}

@end
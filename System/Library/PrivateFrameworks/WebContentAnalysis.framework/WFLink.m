@interface WFLink
+ (id)linkWithNode:(_xmlNode *)a3;
- (id)title;
- (id)url;
- (void)dealloc;
@end

@implementation WFLink

+ (id)linkWithNode:(_xmlNode *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithNode:a3];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFLink;
  [(XMLNode *)&v2 dealloc];
}

- (id)title
{
  return [(XMLNode *)self _stringValueFromAttribute:@"title"];
}

- (id)url
{
  id result = [(XMLNode *)self _stringValueFromAttribute:@"href"];
  if (result)
  {
    id v3 = result;
    v4 = NSURL;
    return (id)[v4 URLWithString:v3];
  }
  return result;
}

@end
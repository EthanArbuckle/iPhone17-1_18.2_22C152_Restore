@interface SXAutoPlacement
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
- (NSString)description;
@end

@implementation SXAutoPlacement

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"advertisement"]
    || [v6 isEqualToString:@"suggestedArticles"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXAutoPlacement;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(SXAutoPlacement *)self advertisement];

  if (v4)
  {
    v5 = [(SXAutoPlacement *)self advertisement];
    [v3 appendFormat:@"; advertisement: %@", v5];
  }
  id v6 = [(SXAutoPlacement *)self suggestedArticles];

  if (v6)
  {
    id v7 = [(SXAutoPlacement *)self suggestedArticles];
    [v3 appendFormat:@"; suggestedArticles: %@", v7];
  }
  [v3 appendString:@">"];
  return (NSString *)v3;
}

@end
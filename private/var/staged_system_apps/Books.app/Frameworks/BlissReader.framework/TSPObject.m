@interface TSPObject
- (PFDContext)drmContext;
@end

@implementation TSPObject

- (PFDContext)drmContext
{
  objc_opt_class();
  [(TSPObject *)self documentRoot];
  id v3 = [(id)TSUCheckedDynamicCast() bookDescription];

  return (PFDContext *)[v3 drmContext];
}

@end
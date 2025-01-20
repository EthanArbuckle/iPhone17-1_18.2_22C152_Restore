@interface IPAImageIdentityTransform
- (BOOL)canAlignToPixelsExactly;
- (id)description;
@end

@implementation IPAImageIdentityTransform

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p>", v5, self];

  return v6;
}

- (BOOL)canAlignToPixelsExactly
{
  return 1;
}

@end
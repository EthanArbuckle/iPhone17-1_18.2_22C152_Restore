@interface NSCoder(UIKitCAPoint3DAdditions)
- (double)ui_decodeCAPoint3DForKey:()UIKitCAPoint3DAdditions;
- (void)ui_encodeCAPoint3D:()UIKitCAPoint3DAdditions forKey:;
@end

@implementation NSCoder(UIKitCAPoint3DAdditions)

- (double)ui_decodeCAPoint3DForKey:()UIKitCAPoint3DAdditions
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  double v6 = _CAPoint3DFromString(v5);
  return v6;
}

- (void)ui_encodeCAPoint3D:()UIKitCAPoint3DAdditions forKey:
{
  id v10 = a6;
  _NSStringFromCAPoint3D(a2, a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v11 forKey:v10];
}

@end
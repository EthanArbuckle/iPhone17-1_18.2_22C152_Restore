@interface NSCoder(UISize3D)
- (double)decodeUISize3DForKey:()UISize3D;
- (void)encodeUISize3D:()UISize3D forKey:;
@end

@implementation NSCoder(UISize3D)

- (double)decodeUISize3DForKey:()UISize3D
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  [v5 UISize3DValue];
  double v7 = v6;

  return v7;
}

- (void)encodeUISize3D:()UISize3D forKey:
{
  v10 = (void *)MEMORY[0x1E4F29238];
  id v11 = a6;
  objc_msgSend(v10, "valueWithUISize3D:", a2, a3, a4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v12 forKey:v11];
}

@end
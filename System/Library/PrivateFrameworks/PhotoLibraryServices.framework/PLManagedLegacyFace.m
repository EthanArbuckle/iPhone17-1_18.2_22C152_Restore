@interface PLManagedLegacyFace
+ (id)entityName;
- (CGRect)relativeRect;
- (void)delete;
- (void)setRelativeRect:(CGRect)a3;
@end

@implementation PLManagedLegacyFace

+ (id)entityName
{
  return @"LegacyFace";
}

- (void)delete
{
  id v3 = [(PLManagedLegacyFace *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)setRelativeRect:(CGRect)a3
{
  CGRect v5 = a3;
  if (CGRectIsEmpty(a3))
  {
    [(PLManagedLegacyFace *)self setRelativeRectValue:0];
  }
  else
  {
    v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    -[PLManagedLegacyFace setRelativeRectValue:](self, "setRelativeRectValue:", v4, *(void *)&v5.origin.x, *(void *)&v5.origin.y, *(void *)&v5.size.width, *(void *)&v5.size.height);
  }
}

- (CGRect)relativeRect
{
  v2 = [(PLManagedLegacyFace *)self relativeRectValue];
  id v3 = v2;
  if (v2
    && (id v4 = v2,
        !strncmp((const char *)[v4 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}", 0x32uLL)))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    [v4 getValue:&v10];
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v10 = *MEMORY[0x1E4F1DB20];
    long long v11 = v5;
  }

  double v7 = *((double *)&v10 + 1);
  double v6 = *(double *)&v10;
  double v9 = *((double *)&v11 + 1);
  double v8 = *(double *)&v11;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end
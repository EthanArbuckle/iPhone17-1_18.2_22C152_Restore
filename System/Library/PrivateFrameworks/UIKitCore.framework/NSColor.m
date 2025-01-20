@interface NSColor
+ (BOOL)supportsSecureCoding;
+ (NSColor)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (NSColor)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha;
- (Class)classForCoder;
- (NSColor)initWithCoder:(NSCoder *)coder;
@end

@implementation NSColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSColor)initWithCoder:(NSCoder *)coder
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = coder;
  int v5 = [(NSCoder *)v4 decodeIntForKey:@"NSColorSpace"];
  if ((v5 - 1) > 1)
  {
    if ((v5 - 3) > 1)
    {
      v19 = +[UIColor blackColor];
    }
    else
    {
      *(double *)&size_t v26 = 0.0;
      double v24 = 0.0;
      v15 = [(NSCoder *)v4 decodeBytesForKey:@"NSWhite" returnedLength:&v26];
      v16 = copyBytesWithNullAtEnd((char *)v27, v15, v26);
      v17 = v16;
      double v25 = 0.0;
      if (!v16 || *(double *)&v26 == 0.0 || sscanf_l(v16, 0, "%lf %lf", &v25, &v24) == 1) {
        double v24 = 1.0;
      }
      if (v17 != (char *)v27 && v17) {
        free(v17);
      }
      v18 = [UIColor alloc];
      v19 = [(UIColor *)v18 initWithWhite:v25 alpha:v24];
    }
  }
  else
  {
    *(double *)&uint64_t v23 = 0.0;
    v6 = v4;
    if ([(NSCoder *)v6 allowsKeyedCoding])
    {
      size_t __n = 0;
      v7 = v6;
      v8 = [(NSCoder *)v7 decodeBytesForKey:@"NSRGB" returnedLength:&__n];

      v9 = copyBytesWithNullAtEnd((char *)v27, v8, __n);
      v10 = v9;
      double v24 = 0.0;
      double v25 = 0.0;
      *(double *)&size_t v26 = 0.0;
      if (!v9 || !__n || sscanf_l(v9, 0, "%lf %lf %lf %lf", &v26, &v25, &v24, &v23) == 3) {
        *(double *)&uint64_t v23 = 1.0;
      }
      if (v10 != (char *)v27 && v10) {
        free(v10);
      }
      double v12 = v25;
      double v11 = *(double *)&v26;
      double v14 = *(double *)&v23;
      double v13 = v24;
    }
    else
    {
      v27[0] = 0.0;
      LODWORD(v26) = 0;
      LODWORD(v25) = 0;
      LODWORD(v24) = 0;
      -[NSCoder decodeValuesOfObjCTypes:](v6, "decodeValuesOfObjCTypes:", "ffff", v27, &v26, &v25, &v24);

      double v11 = v27[0];
      double v12 = *(float *)&v26;
      double v13 = *(float *)&v25;
      double v14 = *(float *)&v24;
    }
    v19 = [[UIColor alloc] initWithRed:v11 green:v12 blue:v13 alpha:v14];
  }
  v20 = (NSColor *)v19;

  return v20;
}

+ (NSColor)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  return (NSColor *)+[UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (NSColor)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha
{
  return (NSColor *)+[UIColor colorWithWhite:white alpha:alpha];
}

@end
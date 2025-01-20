@interface NSFont
+ (BOOL)supportsSecureCoding;
+ (NSFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;
- (Class)classForCoder;
- (NSFont)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFont

+ (NSFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NSFont;
  return (NSFont *)objc_msgSendSuper2(&v5, sel_fontWithName_size_, fontName, fontSize);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSFont)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSName"];
  [a3 decodeFloatForKey:@"NSSize"];
  double v6 = v5;
  v7 = +[UIFont fontWithName:v4 size:v5];
  if (!v7) {
    v7 = +[UIFont systemFontOfSize:v6];
  }

  return (NSFont *)v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
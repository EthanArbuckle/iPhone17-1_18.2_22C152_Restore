@interface _PRMonogramFontSpec
+ (id)specForFontWithName:(id)a3 baseSize:(double)a4 tracking:(double)a5;
- (NSString)fontName;
- (double)baseSize;
- (double)tracking;
@end

@implementation _PRMonogramFontSpec

+ (id)specForFontWithName:(id)a3 baseSize:(double)a4 tracking:(double)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(_PRMonogramFontSpec);
  uint64_t v9 = [v7 copy];

  fontName = v8->_fontName;
  v8->_fontName = (NSString *)v9;

  v8->_baseSize = a4;
  v8->_tracking = a5;
  return v8;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)baseSize
{
  return self->_baseSize;
}

- (double)tracking
{
  return self->_tracking;
}

- (void).cxx_destruct
{
}

@end
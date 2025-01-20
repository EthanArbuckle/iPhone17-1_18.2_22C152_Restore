@interface NSAttributedString(NSAttributedStringAdaptiveImageGlyphConveniences)
+ (id)attributedStringWithAdaptiveImageGlyph:()NSAttributedStringAdaptiveImageGlyphConveniences attributes:;
@end

@implementation NSAttributedString(NSAttributedStringAdaptiveImageGlyphConveniences)

+ (id)attributedStringWithAdaptiveImageGlyph:()NSAttributedStringAdaptiveImageGlyphConveniences attributes:
{
  id v5 = a3;
  v6 = (void *)[a4 mutableCopy];
  [v6 setObject:v5 forKeyedSubscript:@"CTAdaptiveImageProvider"];

  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [MEMORY[0x1E4F28B18] _sharedAttachmentString];
  v9 = (void *)[v7 initWithString:v8 attributes:v6];

  return v9;
}

@end
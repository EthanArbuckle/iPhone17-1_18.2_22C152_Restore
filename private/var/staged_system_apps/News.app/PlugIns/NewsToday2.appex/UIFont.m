@interface UIFont
+ (id)nt_preferredFontForCondensedTextStyle:(unint64_t)a3 contentSizeCategory:(id)a4;
- (CGRect)nt_boundingBoxForString:(id)a3;
- (double)nt_scaledValueForValue:(double)a3;
@end

@implementation UIFont

+ (id)nt_preferredFontForCondensedTextStyle:(unint64_t)a3 contentSizeCategory:(id)a4
{
  v5 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:a4];
  if (a3 > 2) {
    id v6 = 0;
  }
  else {
    id v6 = *(id *)*(&off_100124118 + a3);
  }
  v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v6 compatibleWithTraitCollection:v5];
  v8 = [v7 fontDescriptorWithSymbolicTraits:64];

  UIFontDescriptorTraitKey v17 = UIFontWeightTrait;
  v9 = +[NSNumber numberWithDouble:UIFontWeightMedium];
  v18 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  UIFontDescriptorAttributeName v15 = UIFontDescriptorTraitsAttribute;
  v16 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12 = [v8 fontDescriptorByAddingAttributes:v11];

  v13 = +[UIFont fontWithDescriptor:v12 size:0.0];

  return v13;
}

- (double)nt_scaledValueForValue:(double)a3
{
  [(UIFont *)self _scaledValueForValue:a3];
  return result;
}

- (CGRect)nt_boundingBoxForString:(id)a3
{
  id v4 = a3;
  CFIndex v5 = (CFIndex)[v4 length];
  __chkstk_darwin();
  unint64_t v6 = (2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  [v4 getCharacters:&v7 range:0];

  __chkstk_darwin();
  if (CTFontGetGlyphsForCharacters((CTFontRef)self, (const UniChar *)((char *)&v7 - v6), (CGGlyph *)((char *)&v7 - v6), v5))
  {
    return CTFontGetBoundingRectsForGlyphs((CTFontRef)self, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v7 - v6), 0, v5);
  }
  else
  {
    result.origin.x = CGRectZero.origin.x;
    result.origin.y = CGRectZero.origin.y;
    result.size.width = CGRectZero.size.width;
    result.size.height = CGRectZero.size.height;
  }
  return result;
}

@end
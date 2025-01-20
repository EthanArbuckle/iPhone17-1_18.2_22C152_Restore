@interface NSParagraphStyle
+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3;
+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4;
+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4 withHyphenationFactor:(float)a5;
+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 withHyphenationFactor:(float)a4;
@end

@implementation NSParagraphStyle

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3
{
  LODWORD(v3) = 1.0;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, 1.29999995, v3);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 withHyphenationFactor:(float)a4
{
  *(float *)&double v4 = a4;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, 1.29999995, v4);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4
{
  LODWORD(v4) = 1.0;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, a4, v4);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4 withHyphenationFactor:(float)a5
{
  id v7 = a3;
  v8 = +[NSMutableParagraphStyle defaultParagraphStyle];
  id v9 = [v8 mutableCopy];

  LODWORD(v8) = [v7 _maps_containsExcessiveHeightCharacters];
  if (v8) {
    [v9 setLineHeightMultiple:a4];
  }
  [v9 setLineBreakMode:4];
  *(float *)&double v10 = a5;
  [v9 setHyphenationFactor:v10];
  id v11 = [v9 copy];

  return v11;
}

@end
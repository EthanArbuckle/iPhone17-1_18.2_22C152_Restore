@interface _MKUILabel
+ (id)multiLineLabelWithFont:(id)a3;
- (double)_maps_lineSpacing;
- (void)_maps_setLineSpacing:(double)a3;
@end

@implementation _MKUILabel

+ (id)multiLineLabelWithFont:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)_MKUILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setLineBreakMode:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setNumberOfLines:0];
  [v4 setTextAlignment:4];
  [v4 setFont:v3];

  return v4;
}

- (double)_maps_lineSpacing
{
  v2 = [(_MKUILabel *)self attributedText];
  if ([v2 length])
  {
    id v3 = [v2 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:0];
    [v3 lineSpacing];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)_maps_setLineSpacing:(double)a3
{
  id v12 = [(_MKUILabel *)self attributedText];
  if ([v12 length])
  {
    [(_MKUILabel *)self _maps_lineSpacing];
    if (v5 != a3)
    {
      id v6 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v12];
      id v7 = [v6 length];
      v8 = [v6 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:0];
      v9 = v8;
      if (v8)
      {
        id v10 = [v8 mutableCopy];
      }
      else
      {
        v11 = +[NSParagraphStyle defaultParagraphStyle];
        id v10 = [v11 mutableCopy];
      }
      [v10 setLineSpacing:a3];
      [v6 addAttribute:NSParagraphStyleAttributeName value:v10 range:0];
      [(_MKUILabel *)self setAttributedText:v6];
    }
  }
}

@end
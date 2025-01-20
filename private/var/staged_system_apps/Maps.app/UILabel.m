@interface UILabel
+ (double)_maps_maximumHeightWithFont:(id)a3 numberOfLines:(int64_t)a4 displayScale:(double)a5;
+ (id)newStandardTextLabelWithFont:(id)a3;
- (BOOL)isTextTruncated;
- (BOOL)isTextTruncatedIgnoringLeading:(BOOL)a3;
@end

@implementation UILabel

+ (double)_maps_maximumHeightWithFont:(id)a3 numberOfLines:(int64_t)a4 displayScale:(double)a5
{
  id v6 = a3;
  v7 = v6;
  if (a4 < 1)
  {
    double v17 = 1.79769313e308;
  }
  else
  {
    [v6 lineHeight];
    [v7 leading];
    v8 = +[UIDevice currentDevice];
    id v9 = [v8 userInterfaceIdiom];

    if (v9 == (id)5)
    {
      v10 = [v7 fontDescriptor];
      v11 = [v10 fontAttributes];
      v12 = [v11 objectForKeyedSubscript:UIFontDescriptorTextStyleAttribute];

      if (v12)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = [&off_1013AD530 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v21;
LABEL_6:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(&off_1013AD530);
            }
            if ([v12 containsString:*(void *)(*((void *)&v20 + 1) + 8 * v16)]) {
              break;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [&off_1013AD530 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v14) {
                goto LABEL_6;
              }
              break;
            }
          }
        }
      }
    }
    UICeilToScale();
    double v17 = v18;
  }

  return v17;
}

+ (id)newStandardTextLabelWithFont:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setFont:v3];

  v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (BOOL)isTextTruncated
{
  return [(UILabel *)self isTextTruncatedIgnoringLeading:0];
}

- (BOOL)isTextTruncatedIgnoringLeading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UILabel *)self text];
  if (!v5) {
    return 0;
  }
  id v6 = (void *)v5;
  v7 = [(UILabel *)self text];
  id v8 = [v7 length];

  if (!v8) {
    return 0;
  }
  NSAttributedStringKey v27 = NSFontAttributeName;
  id v9 = [(UILabel *)self font];
  v28 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  if ([(UILabel *)self numberOfLines] < 1)
  {
    double v17 = 1.79769313e308;
  }
  else
  {
    double v11 = (double)[(UILabel *)self numberOfLines];
    v12 = [(UILabel *)self font];
    [v12 lineHeight];
    double v14 = v13;
    if (v3)
    {
      double v15 = v13 + 0.0;
    }
    else
    {
      double v18 = [(UILabel *)self font];
      [v18 leading];
      double v15 = v14 + v19;
    }
    double v17 = v15 * v11;
  }
  [(UILabel *)self bounds];
  double Width = CGRectGetWidth(v29);
  long long v21 = [(UILabel *)self text];
  long long v22 = v21;
  if (v3) {
    uint64_t v23 = 33;
  }
  else {
    uint64_t v23 = 35;
  }
  [v21 boundingRectWithSize:v23 options:v10 attributes:0 Width:1.79769313e308];
  double v25 = v24;

  BOOL v16 = v25 > v17;
  return v16;
}

@end
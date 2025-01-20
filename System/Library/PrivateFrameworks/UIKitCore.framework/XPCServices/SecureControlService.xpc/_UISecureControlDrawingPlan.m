@interface _UISecureControlDrawingPlan
- (CGSize)alignmentSize;
- (CGSize)intrinsicContentSize;
- (CGSize)minimumContentSize;
- (_UISecureControlDrawingPlan)initWithSlotStyle:(id)a3 arrangeVertically:(BOOL)a4 secureName:(unsigned int)a5 iconGlyph:(id)a6;
- (__CFString)contentSizeCategory;
- (double)displayScale;
- (id)glyphDrawingInColor:(CGColor *)a3;
- (id)textDrawingInColor:(CGColor *)a3;
- (void)dealloc;
@end

@implementation _UISecureControlDrawingPlan

- (_UISecureControlDrawingPlan)initWithSlotStyle:(id)a3 arrangeVertically:(BOOL)a4 secureName:(unsigned int)a5 iconGlyph:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v55.receiver = self;
  v55.super_class = (Class)_UISecureControlDrawingPlan;
  v12 = [(_UISecureControlDrawingPlan *)&v55 init];
  if (v12)
  {
    uint64_t v13 = kCTUIFontTextStyleShortBody;
    v12->_font = (__CTFont *)[v10 newFontForTextStyle:kCTUIFontTextStyleShortBody attributes:0];
    v12->_contentSizeCategory = (__CFString *)CFRetain([v10 fontContentSizeCategory]);
    v12->_displayScale = (double)[v10 displayScale];
    if (a5)
    {
      v14 = [v10 localization];
      uint64_t v15 = UISLocalizedStringForSecureName();
      localizedText = v12->_localizedText;
      v12->_localizedText = (NSString *)v15;
    }
    else
    {
      v14 = v12->_localizedText;
      v12->_localizedText = 0;
    }

    if ([v11 length])
    {
      uint64_t v17 = [v10 assetGlyphWithName:v11 glyphSize:1 textStyle:v13];
      assetGlyph = v12->_assetGlyph;
      v12->_assetGlyph = (CUINamedVectorGlyph *)v17;
    }
    else
    {
      assetGlyph = v12->_assetGlyph;
      v12->_assetGlyph = 0;
    }

    CGColorRef ConstantColor = CGColorGetConstantColor(kCGColorWhite);
    v20 = [(_UISecureControlDrawingPlan *)v12 glyphDrawingInColor:ConstantColor];
    [v20 drawingSize];
    double v22 = v21;
    double v24 = v23;
    [v20 alignmentRect];
    double v26 = v25;
    double v28 = v27;
    v29 = [(_UISecureControlDrawingPlan *)v12 textDrawingInColor:ConstantColor];
    [v29 drawingSize];
    double v31 = v30;
    double v33 = v32;
    [v29 alignmentRect];
    if (!v20 || v29)
    {
      if (v20 || !v29)
      {
        double v36 = 0.0;
        if (v20)
        {
          double v49 = v33;
          double v50 = v22;
          double v51 = v24;
          double v52 = v26;
          double v24 = 0.0;
          double v26 = 0.0;
          double v37 = 0.0;
          double v38 = 0.0;
          double v39 = 0.0;
          if (v29)
          {
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100001BC4;
            v53[3] = &unk_1000041C8;
            BOOL v54 = a4;
            double v40 = v35;
            double v41 = v34;
            v42 = objc_retainBlock(v53);
            double v36 = ((double (*)(double, double, double, double))v42[2])(v50, v51, v31, v49);
            double v24 = v43;
            double v26 = ((double (*)(void *, double, double, double, double))v42[2])(v42, v52, v28, v41, v40);
            double v37 = v44;
            double v38 = ((double (*)(void *, double, double, double, double))v42[2])(v42, v28, v28, v41, v40);
            double v39 = v45;
          }
        }
        else
        {
          double v24 = 0.0;
          double v26 = 0.0;
          double v37 = 0.0;
          double v38 = 0.0;
          double v39 = 0.0;
        }
      }
      else
      {
        double v36 = v31;
        double v24 = v33;
        double v26 = v34;
        double v37 = v35;
        double v38 = v34;
        double v39 = v35;
      }
    }
    else
    {
      double v36 = v22;
      double v37 = v28;
      double v38 = v28;
      double v39 = v28;
    }
    double v46 = 0.0;
    if ((unint64_t)[v10 preferredContentSizeCategory] >= 7) {
      double v46 = (double)((unint64_t)[v10 preferredContentSizeCategory] - 6) * 4.0;
    }
    double v47 = fmin(1.0 / (double)[v10 displayScale], 1.0);
    v12->_alignmentSize.width = v26;
    v12->_alignmentSize.height = v37;
    v12->_intrinsicContentSize.width = fmax(v26 + 24.0 + v46, v36);
    v12->_intrinsicContentSize.height = fmax(v37 + 14.0, v24);
    v12->_minimumContentSize.width = fmax(v38 + 14.0, v36) - v47;
    v12->_minimumContentSize.height = fmax(v39 + 14.0, v24) - v47;
  }
  return v12;
}

- (void)dealloc
{
  font = self->_font;
  if (font) {
    CFRelease(font);
  }
  contentSizeCategory = self->_contentSizeCategory;
  if (contentSizeCategory) {
    CFRelease(contentSizeCategory);
  }
  v5.receiver = self;
  v5.super_class = (Class)_UISecureControlDrawingPlan;
  [(_UISecureControlDrawingPlan *)&v5 dealloc];
}

- (id)textDrawingInColor:(CGColor *)a3
{
  if (!a3)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UISecureControlDrawingPlan.m", 115, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  if (self->_localizedText)
  {
    id v5 = objc_alloc((Class)UISTextLineDrawing);
    localizedText = self->_localizedText;
    font = self->_font;
    v12[0] = kCTFontAttributeName;
    v12[1] = kCTForegroundColorAttributeName;
    v13[0] = font;
    v13[1] = a3;
    id v8 = objc_msgSend(v5, "initWithString:attributes:lineBreakMode:textAlignment:width:scale:", localizedText, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2), 2, 0, NAN, self->_displayScale);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)glyphDrawingInColor:(CGColor *)a3
{
  if (!a3)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UISecureControlDrawingPlan.m", 131, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  if (self->_assetGlyph) {
    id v5 = [objc_alloc((Class)UISVectorGlyphDrawing) initWithVectorGlyph:self->_assetGlyph tintColor:a3];
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (CGSize)alignmentSize
{
  double width = self->_alignmentSize.width;
  double height = self->_alignmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__CFString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minimumContentSize
{
  double width = self->_minimumContentSize.width;
  double height = self->_minimumContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetGlyph, 0);
  objc_storeStrong((id *)&self->_localizedText, 0);
}

@end
@interface PREditingIncomingCallFontPickerCellView
- (UIView)contentView;
- (id)imageFromGlyph:(unsigned __int16)a3 fromFontRef:(__CTFont *)a4;
- (id)imageRepresentingFont:(id)a3 text:(id)a4;
- (unsigned)glyphForText:(id)a3 usingFontRef:(__CTFont *)a4;
- (void)configureWithFont:(id)a3 text:(id)a4;
- (void)displayImage:(id)a3;
- (void)displayText:(id)a3 usingFont:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PREditingIncomingCallFontPickerCellView

- (void)configureWithFont:(id)a3 text:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditingIncomingCallFontPickerCellView;
  id v7 = a4;
  [(PREditingFontPickerCellView *)&v9 configureWithFont:v6 text:v7];
  if (objc_msgSend(v7, "length", v9.receiver, v9.super_class) == 1)
  {
    v8 = [(PREditingIncomingCallFontPickerCellView *)self imageRepresentingFont:v6 text:v7];

    if (v8) {
      [(PREditingIncomingCallFontPickerCellView *)self displayImage:v8];
    }
    else {
      [(PREditingIncomingCallFontPickerCellView *)self displayText:@"Aa" usingFont:v6];
    }
  }
  else
  {
    [(PREditingIncomingCallFontPickerCellView *)self displayText:v7 usingFont:v6];
    v8 = v7;
  }
}

- (void)displayText:(id)a3 usingFont:(id)a4
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PREditingIncomingCallFontPickerCellView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v10 = [(PREditingIncomingCallFontPickerCellView *)self contentView];
  v11 = v10;
  if (isKindOfClass)
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    [v10 removeFromSuperview];

    id v15 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v15 setMinimumScaleFactor:0.5];
    [v15 setTextAlignment:1];
    [v15 setAdjustsFontSizeToFitWidth:1];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditingIncomingCallFontPickerCellView *)self addSubview:v15];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [v15 topAnchor];
    v28 = [(PREditingIncomingCallFontPickerCellView *)self topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:4.0];
    v31[0] = v27;
    v26 = [v15 bottomAnchor];
    v25 = [(PREditingIncomingCallFontPickerCellView *)self bottomAnchor];
    v23 = [v26 constraintEqualToAnchor:v25 constant:-4.0];
    v31[1] = v23;
    [v15 leadingAnchor];
    v16 = id v30 = v7;
    v17 = [(PREditingIncomingCallFontPickerCellView *)self leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:4.0];
    v31[2] = v18;
    v19 = [v15 trailingAnchor];
    v20 = [(PREditingIncomingCallFontPickerCellView *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:-4.0];
    v31[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v24 activateConstraints:v22];

    id v7 = v30;
    objc_storeStrong((id *)&self->_contentView, v15);
  }
  [v15 setFont:v6];

  [v15 setText:v7];
}

- (void)displayImage:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PREditingIncomingCallFontPickerCellView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [(PREditingIncomingCallFontPickerCellView *)self contentView];
  v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    [v7 removeFromSuperview];

    id v12 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    id v13 = [MEMORY[0x1E4FB1618] labelColor];
    [v12 setTintColor:v13];

    [v12 setContentMode:1];
    LODWORD(v14) = 1144750080;
    [v12 setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1144750080;
    [v12 setContentCompressionResistancePriority:1 forAxis:v15];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditingIncomingCallFontPickerCellView *)self addSubview:v12];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [v12 topAnchor];
    v28 = [(PREditingIncomingCallFontPickerCellView *)self topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v30[0] = v27;
    v26 = [v12 bottomAnchor];
    v25 = [(PREditingIncomingCallFontPickerCellView *)self bottomAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v30[1] = v23;
    v16 = [v12 leadingAnchor];
    v17 = [(PREditingIncomingCallFontPickerCellView *)self leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v30[2] = v18;
    v19 = [v12 trailingAnchor];
    v20 = [(PREditingIncomingCallFontPickerCellView *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v30[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v24 activateConstraints:v22];

    objc_storeStrong((id *)&self->_contentView, v12);
  }
  [v12 setImage:v4];
}

- (id)imageRepresentingFont:(id)a3 text:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = a4;
  id v7 = [(PREditingFontPickerCellView *)self contentFont];
  v8 = [v7 fontName];
  uint64_t v9 = objc_msgSend(v5, "pr_fontWithName:forRole:includingFallbackFonts:", v8, @"PRPosterRoleIncomingCall", 0);
  id v10 = [(PREditingFontPickerCellView *)self contentFont];
  [v10 pointSize];
  uint64_t v11 = objc_msgSend(v9, "fontWithSize:");

  uint64_t v12 = [(PREditingIncomingCallFontPickerCellView *)self glyphForText:v6 usingFontRef:v11];
  if (v12)
  {
    id v13 = [(PREditingIncomingCallFontPickerCellView *)self imageFromGlyph:v12 fromFontRef:v11];
    double v14 = v13;
    if (v13) {
      id v15 = v13;
    }
  }
  else
  {
    double v14 = 0;
  }
  return v14;
}

- (id)imageFromGlyph:(unsigned __int16)a3 fromFontRef:(__CTFont *)a4
{
  PathForGlyph = CTFontCreatePathForGlyph(a4, a3, 0);
  [(PREditingFontPickerCellView *)self cellSize];
  double v7 = v6;
  double v9 = v8;
  CGRect PathBoundingBox = CGPathGetPathBoundingBox(PathForGlyph);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, (v7 - PathBoundingBox.size.width) * 0.5 - PathBoundingBox.origin.x, (v9 - PathBoundingBox.size.height) * 0.5 - PathBoundingBox.origin.y);
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, 1.0, -1.0);
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, 0.0, v9);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransform t1 = v21;
  CGAffineTransform v16 = v20;
  CGAffineTransformConcat(&t2, &t1, &v16);
  CGAffineTransform t1 = v22;
  CGAffineTransformConcat(&v19, &t1, &t2);
  id v10 = (const CGPath *)MEMORY[0x192F90D80](PathForGlyph, &v19);
  [(PREditingFontPickerCellView *)self cellSize];
  UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v12 = [MEMORY[0x1E4FB1618] clearColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

  id v13 = [MEMORY[0x1E4FB1618] labelColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);

  CGContextAddPath(CurrentContext, v10);
  CGContextDrawPath(CurrentContext, kCGPathFillStroke);
  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGPathRelease(PathForGlyph);
  CGPathRelease(v10);
  return v14;
}

- (unsigned)glyphForText:(id)a3 usingFontRef:(__CTFont *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFIndex v6 = [v5 length];
  MEMORY[0x1F4188790](v6);
  unint64_t v7 = (2 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = objc_msgSend(v5, "getCharacters:range:", (char *)v13 - v7, 0, v6);
  MEMORY[0x1F4188790](v8);
  double v9 = (unsigned __int16 *)((char *)v13 - v7);
  CTFontGetGlyphsForCharacters(a4, (const UniChar *)((char *)v13 - v7), (CGGlyph *)((char *)v13 - v7), v6);
  if (v6)
  {
    while (1)
    {
      int v11 = *v9++;
      unsigned __int16 v10 = v11;
      if (v11) {
        break;
      }
      if (!--v6) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    unsigned __int16 v10 = 0;
  }

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PREditingIncomingCallFontPickerCellView;
  [(PREditingIncomingCallFontPickerCellView *)&v6 traitCollectionDidChange:a3];
  id v4 = [(PREditingFontPickerCellView *)self contentFont];
  id v5 = [(PREditingFontPickerCellView *)self contentText];
  [(PREditingIncomingCallFontPickerCellView *)self configureWithFont:v4 text:v5];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end
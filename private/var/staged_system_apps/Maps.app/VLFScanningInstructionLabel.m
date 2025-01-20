@interface VLFScanningInstructionLabel
- (BOOL)isForSizing;
- (BOOL)isRunningOnBigPhone;
- (NSLayoutConstraint)heightConstraint;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)label;
- (VLFLabelFontObserver)fontObservers;
- (double)_minimumLinesOverridePointSizeThreshold;
- (double)contentHeight;
- (id)_defaultFont;
- (id)initForSizing:(BOOL)a3;
- (unint64_t)_maximumNumberOfLinesWithMinimumOverride:(BOOL)a3;
- (unint64_t)currentLayout;
- (void)_updateContentHeight;
- (void)_updateFont;
- (void)_updateFontWithMinimumOverride:(BOOL)a3;
- (void)addFontObserver:(id)a3;
- (void)layoutSubviews;
- (void)removeFontObserver:(id)a3;
- (void)setCurrentLayout:(unint64_t)a3;
- (void)setFontObservers:(id)a3;
- (void)setForSizing:(BOOL)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRunningOnBigPhone:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFont:(id)a3;
@end

@implementation VLFScanningInstructionLabel

- (id)initForSizing:(BOOL)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VLFScanningInstructionLabel;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[VLFScanningInstructionLabel initWithFrame:](&v34, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_currentLayout = 2;
    v7->_forSizing = a3;
    v9 = (VLFLabelFontObserver *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VLFLabelFontObserver queue:&_dispatch_main_q];
    fontObservers = v8->_fontObservers;
    v8->_fontObservers = v9;

    LODWORD(v11) = 1148846080;
    [(VLFScanningInstructionLabel *)v8 setContentCompressionResistancePriority:1 forAxis:v11];
    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v8->_label;
    v8->_label = v12;

    [(UILabel *)v8->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148846080;
    [(UILabel *)v8->_label setContentCompressionResistancePriority:1 forAxis:v14];
    v15 = +[UIColor labelColor];
    [(UILabel *)v8->_label setTextColor:v15];

    [(UILabel *)v8->_label setLineBreakStrategy:0];
    [(UILabel *)v8->_label setLineBreakMode:2];
    [(UILabel *)v8->_label setNumberOfLines:0];
    [(UILabel *)v8->_label _setDrawsDebugBaselines:v8->_forSizing];
    v16 = [(VLFScanningInstructionLabel *)v8 _defaultFont];
    [(UILabel *)v8->_label setFont:v16];

    [(VLFScanningInstructionLabel *)v8 addSubview:v8->_label];
    v33 = [(UILabel *)v8->_label leadingAnchor];
    v32 = [(VLFScanningInstructionLabel *)v8 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v35[0] = v31;
    v30 = [(UILabel *)v8->_label trailingAnchor];
    v29 = [(VLFScanningInstructionLabel *)v8 trailingAnchor];
    v17 = [v30 constraintEqualToAnchor:v29];
    v35[1] = v17;
    v18 = [(UILabel *)v8->_label topAnchor];
    v19 = [(VLFScanningInstructionLabel *)v8 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v35[2] = v20;
    v21 = [(UILabel *)v8->_label bottomAnchor];
    v22 = [(VLFScanningInstructionLabel *)v8 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v35[3] = v23;
    v24 = +[NSArray arrayWithObjects:v35 count:4];
    +[NSLayoutConstraint activateConstraints:v24];

    if (v8->_forSizing)
    {
      v25 = [(UILabel *)v8->_label heightAnchor];
      uint64_t v26 = [v25 constraintEqualToConstant:0.0];
      heightConstraint = v8->_heightConstraint;
      v8->_heightConstraint = (NSLayoutConstraint *)v26;

      [(NSLayoutConstraint *)v8->_heightConstraint setActive:1];
    }
  }
  return v8;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VLFScanningInstructionLabel;
  [(VLFScanningInstructionLabel *)&v6 layoutSubviews];
  [(VLFScanningInstructionLabel *)self bounds];
  double v4 = v3;
  v5 = [(VLFScanningInstructionLabel *)self label];
  [v5 setPreferredMaxLayoutWidth:v4];

  [(VLFScanningInstructionLabel *)self _updateContentHeight];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VLFScanningInstructionLabel;
  [(VLFScanningInstructionLabel *)&v4 traitCollectionDidChange:a3];
  [(VLFScanningInstructionLabel *)self _updateContentHeight];
}

- (double)contentHeight
{
  double v3 = [(VLFScanningInstructionLabel *)self label];
  [(VLFScanningInstructionLabel *)self bounds];
  [v3 textRectForBounds:0, 0.0, 0.0];
  double v5 = v4;

  return v5;
}

- (NSString)text
{
  v2 = [(VLFScanningInstructionLabel *)self label];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  double v5 = [(VLFScanningInstructionLabel *)self label];
  [v5 setText:v4];

  [(VLFScanningInstructionLabel *)self _updateContentHeight];
}

- (void)setCurrentLayout:(unint64_t)a3
{
  if (self->_currentLayout != a3)
  {
    self->_currentLayout = a3;
    [(VLFScanningInstructionLabel *)self _updateContentHeight];
  }
}

- (UIFont)font
{
  v2 = [(VLFScanningInstructionLabel *)self label];
  double v3 = [v2 font];

  return (UIFont *)v3;
}

- (UIColor)textColor
{
  v2 = [(VLFScanningInstructionLabel *)self label];
  double v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(VLFScanningInstructionLabel *)self label];
  [v5 setTextColor:v4];
}

- (void)updateFont:(id)a3
{
  id v4 = a3;
  if ([(VLFScanningInstructionLabel *)self isForSizing])
  {
    objc_super v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[VLFScanningInstructionLabel updateFont:]";
      __int16 v11 = 2080;
      v12 = "VLFScanningInstructionLabel.m";
      __int16 v13 = 1024;
      int v14 = 153;
      __int16 v15 = 2080;
      v16 = "!self.isForSizing";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  if ([(VLFScanningInstructionLabel *)self isForSizing])
  {
    id v5 = sub_100A87B1C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Only non-sizing labels can be font providers", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    id v5 = [(VLFScanningInstructionLabel *)self label];
    [v5 setFont:v4];
  }
}

- (void)addFontObserver:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_super v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[VLFScanningInstructionLabel addFontObserver:]";
      __int16 v11 = 2080;
      v12 = "VLFScanningInstructionLabel.m";
      __int16 v13 = 1024;
      int v14 = 166;
      __int16 v15 = 2080;
      v16 = "fontObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  id v5 = [(VLFScanningInstructionLabel *)self fontObservers];
  [v5 registerObserver:v4];
}

- (void)removeFontObserver:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_super v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[VLFScanningInstructionLabel removeFontObserver:]";
      __int16 v11 = 2080;
      v12 = "VLFScanningInstructionLabel.m";
      __int16 v13 = 1024;
      int v14 = 172;
      __int16 v15 = 2080;
      v16 = "fontObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  id v5 = [(VLFScanningInstructionLabel *)self fontObservers];
  [v5 unregisterObserver:v4];
}

- (double)_minimumLinesOverridePointSizeThreshold
{
  unint64_t v2 = [(VLFScanningInstructionLabel *)self currentLayout];
  double result = 20.0;
  if (v2 == 2) {
    return 25.0;
  }
  return result;
}

- (unint64_t)_maximumNumberOfLinesWithMinimumOverride:(BOOL)a3
{
  BOOL v3 = a3;
  if ((id)[(VLFScanningInstructionLabel *)self currentLayout] == (id)2)
  {
    id v5 = [(VLFScanningInstructionLabel *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = sub_1000E93B0(v6, UIContentSizeCategoryLarge);

    if (v7 == 1)
    {
      v8 = [(VLFScanningInstructionLabel *)self traitCollection];
      int v9 = [v8 preferredContentSizeCategory];
      uint64_t v10 = sub_1000E93B0(v9, UIContentSizeCategoryExtraExtraExtraLarge);

      if (v10 == 1) {
        return 5;
      }
      else {
        return 4;
      }
    }
    else if (v3)
    {
      return 4;
    }
    else
    {
      return 3;
    }
  }
  else
  {
    unsigned int v12 = [(VLFScanningInstructionLabel *)self isRunningOnBigPhone];
    unint64_t v13 = 3;
    if (v3) {
      unint64_t v13 = 4;
    }
    if (v12) {
      return v13;
    }
    else {
      return 4;
    }
  }
}

- (id)_defaultFont
{
  BOOL v3 = [(VLFScanningInstructionLabel *)self traitCollection];
  unint64_t v4 = [(VLFScanningInstructionLabel *)self currentLayout];
  id v5 = &UIContentSizeCategoryAccessibilityMedium;
  if (v4 != 2) {
    id v5 = &UIContentSizeCategoryLarge;
  }
  objc_super v6 = objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", *v5);

  uint64_t v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 compatibleWithTraitCollection:v6];
  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v14 = UIFontWeightTrait;
  v8 = +[NSNumber numberWithDouble:UIFontWeightBold];
  __int16 v15 = v8;
  int v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  __int16 v11 = [v7 fontDescriptorByAddingAttributes:v10];

  unsigned int v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (void)_updateFont
{
}

- (void)_updateFontWithMinimumOverride:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VLFScanningInstructionLabel *)self _defaultFont];
  objc_super v6 = [(VLFScanningInstructionLabel *)self label];
  [v6 setFont:v5];

  uint64_t v7 = [(VLFScanningInstructionLabel *)self label];
  [(VLFScanningInstructionLabel *)self bounds];
  [v7 textRectForBounds:0 limitedToNumberOfLines:0.0];
  double v9 = v8;

  uint64_t v10 = [(VLFScanningInstructionLabel *)self label];
  __int16 v11 = [v10 font];
  [v11 leading];
  double v13 = v9 + v12;
  UIFontDescriptorTraitKey v14 = [(VLFScanningInstructionLabel *)self label];
  __int16 v15 = [v14 font];
  [v15 lineHeight];
  double v17 = v16;
  v18 = [(VLFScanningInstructionLabel *)self label];
  v19 = [v18 font];
  [v19 leading];
  double v21 = v13 / (v17 + v20);

  unint64_t v22 = (unint64_t)v21;
  if ([(VLFScanningInstructionLabel *)self _maximumNumberOfLinesWithMinimumOverride:v3] < (unint64_t)v21)
  {
    CFStringRef v23 = @"NO";
    if (v3) {
      CFStringRef v23 = @"YES";
    }
    v73 = (__CFString *)v23;
    while (1)
    {
      v24 = sub_100A87B1C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v80 = [(VLFScanningInstructionLabel *)self label];
        double v25 = [v80 text];
        v79 = [(VLFScanningInstructionLabel *)self label];
        uint64_t v26 = [v79 font];
        v78 = [(VLFScanningInstructionLabel *)self label];
        v77 = [v78 font];
        [v77 pointSize];
        uint64_t v28 = v27;
        v76 = [(VLFScanningInstructionLabel *)self label];
        v74 = [v76 font];
        [v74 lineHeight];
        uint64_t v30 = v29;
        [(VLFScanningInstructionLabel *)self label];
        v32 = BOOL v31 = v3;
        v33 = [v32 font];
        [v33 leading];
        uint64_t v35 = v34;
        unint64_t v36 = [(VLFScanningInstructionLabel *)self _maximumNumberOfLinesWithMinimumOverride:v31];
        v75 = v73;
        *(_DWORD *)buf = 138414338;
        double v82 = v25;
        __int16 v83 = 2112;
        unint64_t v84 = (unint64_t)v26;
        __int16 v85 = 2048;
        uint64_t v86 = v28;
        __int16 v87 = 2048;
        uint64_t v88 = v30;
        __int16 v89 = 2048;
        uint64_t v90 = v35;
        __int16 v91 = 2048;
        unint64_t v92 = v22;
        __int16 v93 = 2048;
        double v94 = v9;
        __int16 v95 = 2048;
        unint64_t v96 = v36;
        __int16 v97 = 2112;
        v98 = v73;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Text: (%@) with font: (%@), pointSize: (%f), line height: (%f), and leading: (%f) renders as: (%lu) lines in: (%f) height which is higher than the limit: (%lu) with minimumOverride: %@", buf, 0x5Cu);

        BOOL v3 = v31;
      }

      v37 = [(VLFScanningInstructionLabel *)self label];
      v38 = [v37 font];
      [v38 pointSize];
      double v40 = 0.0;
      if (v39 + -1.0 > 0.0)
      {
        v41 = [(VLFScanningInstructionLabel *)self label];
        v42 = [v41 font];
        [v42 pointSize];
        double v40 = v43 + -1.0;
      }
      [(VLFScanningInstructionLabel *)self _minimumLinesOverridePointSizeThreshold];
      if (v40 < v44 && !v3) {
        break;
      }
      v45 = sub_100A87B1C();
      v46 = v45;
      if (fabs(v40) <= 2.22044605e-16)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v68 = [(VLFScanningInstructionLabel *)self label];
          double v69 = [v68 text];
          unint64_t v70 = [(VLFScanningInstructionLabel *)self _maximumNumberOfLinesWithMinimumOverride:v3];
          *(_DWORD *)buf = 138412546;
          double v82 = v69;
          __int16 v83 = 2048;
          unint64_t v84 = v70;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Text (%@) was too large to shrink to fit on (%lu) lines; using default font",
            buf,
            0x16u);
        }
        v71 = [(VLFScanningInstructionLabel *)self _defaultFont];
        v72 = [(VLFScanningInstructionLabel *)self label];
        [v72 setFont:v71];

        return;
      }
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v82 = v40;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Trying again with pointSize: %f", buf, 0xCu);
      }

      v47 = [(VLFScanningInstructionLabel *)self label];
      v48 = [v47 font];
      v49 = [v48 fontDescriptor];
      v50 = +[UIFont fontWithDescriptor:v49 size:v40];
      v51 = [(VLFScanningInstructionLabel *)self label];
      [v51 setFont:v50];

      v52 = [(VLFScanningInstructionLabel *)self label];
      [(VLFScanningInstructionLabel *)self bounds];
      [v52 textRectForBounds:0 limitedToNumberOfLines:0.0];
      double v9 = v53;

      v54 = [(VLFScanningInstructionLabel *)self label];
      v55 = [v54 font];
      [v55 leading];
      double v57 = v9 + v56;
      v58 = [(VLFScanningInstructionLabel *)self label];
      v59 = [v58 font];
      [v59 lineHeight];
      double v61 = v60;
      v62 = [(VLFScanningInstructionLabel *)self label];
      v63 = [v62 font];
      [v63 leading];
      double v65 = v57 / (v61 + v64);

      unint64_t v22 = (unint64_t)v65;
      if ([(VLFScanningInstructionLabel *)self _maximumNumberOfLinesWithMinimumOverride:v3] >= (unint64_t)v65)return; {
    }
      }
    v66 = sub_100A87B1C();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      [(VLFScanningInstructionLabel *)self _minimumLinesOverridePointSizeThreshold];
      *(_DWORD *)buf = 134217984;
      double v82 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Detected pointSize going below the threshold %f. Trying again with number of lines override.", buf, 0xCu);
    }

    [(VLFScanningInstructionLabel *)self _updateFontWithMinimumOverride:1];
  }
}

- (void)_updateContentHeight
{
  if ([(VLFScanningInstructionLabel *)self isForSizing])
  {
    [(VLFScanningInstructionLabel *)self _updateFont];
    [(VLFScanningInstructionLabel *)self contentHeight];
    double v4 = v3;
    id v5 = [(VLFScanningInstructionLabel *)self heightConstraint];
    [v5 setConstant:v4];

    id v8 = [(VLFScanningInstructionLabel *)self fontObservers];
    objc_super v6 = [(VLFScanningInstructionLabel *)self label];
    uint64_t v7 = [v6 font];
    [v8 updateFont:v7];
  }
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (BOOL)isRunningOnBigPhone
{
  return self->_runningOnBigPhone;
}

- (void)setRunningOnBigPhone:(BOOL)a3
{
  self->_runningOnBigPhone = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (BOOL)isForSizing
{
  return self->_forSizing;
}

- (void)setForSizing:(BOOL)a3
{
  self->_forSizing = a3;
}

- (VLFLabelFontObserver)fontObservers
{
  return self->_fontObservers;
}

- (void)setFontObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontObservers, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
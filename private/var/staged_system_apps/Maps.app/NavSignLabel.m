@interface NavSignLabel
- (BOOL)_fitsMaxNumberOfLines:(int64_t)a3 bounds:(CGRect)a4;
- (BOOL)perferredFontAdjustsFontSizeToFitWidth;
- (BOOL)shouldRemoveTextStartingAtFirstNewline;
- (BOOL)shouldUseAlternateFont;
- (NSArray)textAlternatives;
- (NSCache)stringCache;
- (NavSignLabel)initWithCoder:(id)a3;
- (NavSignLabel)initWithFrame:(CGRect)a3;
- (NavSignLabelDelegate)delegate;
- (UIFont)alternateFont;
- (UIFont)preferredFont;
- (UILayoutGuide)textTrailingLayoutGuide;
- (double)alternateFontLineSpacing;
- (double)inlineShieldAlpha;
- (double)inlineShieldBaselineOffset:(unint64_t)a3 fromTop:(BOOL)a4;
- (double)inlineShieldFirstBaselineTopOffset;
- (double)inlineShieldLastBaselineBottomOffset;
- (double)preferredFontMinimumScaleFactor;
- (id)_attributedStringFromServerString:(id)a3;
- (id)_attributedStringKeyForString:(id)a3 font:(id)a4;
- (int64_t)inlineShieldSize;
- (int64_t)maxNumberOfLinesWithLongestAlternative;
- (int64_t)maxNumberOfLinesWithPreferredFont;
- (int64_t)maxNumberOfTotalLines;
- (int64_t)paragraphLineBreakMode;
- (unint64_t)lineCount;
- (void)_maps_commonInit;
- (void)_setNeedsUpdateLabel;
- (void)_updateLabel;
- (void)layoutSubviews;
- (void)setAlternateFont:(id)a3;
- (void)setAlternateFontLineSpacing:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInlineShieldAlpha:(double)a3;
- (void)setInlineShieldSize:(int64_t)a3;
- (void)setMaxNumberOfLinesWithLongestAlternative:(int64_t)a3;
- (void)setMaxNumberOfLinesWithPreferredFont:(int64_t)a3;
- (void)setMaxNumberOfTotalLines:(int64_t)a3;
- (void)setParagraphLineBreakMode:(int64_t)a3;
- (void)setPerferredFontAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setPreferredFont:(id)a3;
- (void)setPreferredFontMinimumScaleFactor:(double)a3;
- (void)setShouldRemoveTextStartingAtFirstNewline:(BOOL)a3;
- (void)setStringCache:(id)a3;
- (void)setTextAlternatives:(id)a3;
- (void)updateLabelIfNeeded;
@end

@implementation NavSignLabel

- (NavSignLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignLabel;
  v3 = [(NavSignLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NavSignLabel *)v3 _maps_commonInit];
  }
  return v4;
}

- (NavSignLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignLabel;
  v3 = -[NavSignLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NavSignLabel *)v3 _maps_commonInit];
  }
  return v4;
}

- (void)_maps_commonInit
{
  self->_inlineShieldAlpha = 1.0;
  self->_inlineShieldSize = 6;
  self->_perferredFontAdjustsFontSizeToFitWidth = 1;
  self->_preferredFontMinimumScaleFactor = 0.75;
  v3 = objc_alloc_init(TextFirstLineCharacterRangeFinder);
  rangeFinder = self->_rangeFinder;
  self->_rangeFinder = v3;

  self->_paragraphLineBreakMode = 4;
}

- (void)setPreferredFont:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_preferredFont;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredFont, a3);
      [(NavSignLabel *)self _setNeedsUpdateLabel];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)setAlternateFont:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_alternateFont;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternateFont, a3);
      [(NavSignLabel *)self _setNeedsUpdateLabel];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)setMaxNumberOfLinesWithPreferredFont:(int64_t)a3
{
  if (self->_maxNumberOfLinesWithPreferredFont != a3)
  {
    self->_maxNumberOfLinesWithPreferredFont = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setMaxNumberOfTotalLines:(int64_t)a3
{
  if (self->_maxNumberOfTotalLines != a3)
  {
    self->_maxNumberOfTotalLines = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setTextAlternatives:(id)a3
{
  id v5 = a3;
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", self->_textAlternatives) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textAlternatives, a3);
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setAlternateFontLineSpacing:(double)a3
{
  if (self->_alternateFontLineSpacing != a3)
  {
    self->_alternateFontLineSpacing = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setMaxNumberOfLinesWithLongestAlternative:(int64_t)a3
{
  if (self->_maxNumberOfLinesWithLongestAlternative != a3)
  {
    self->_maxNumberOfLinesWithLongestAlternative = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setInlineShieldAlpha:(double)a3
{
  if (self->_inlineShieldAlpha != a3)
  {
    self->_inlineShieldAlpha = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setPreferredFontMinimumScaleFactor:(double)a3
{
  if (self->_preferredFontMinimumScaleFactor != a3)
  {
    self->_preferredFontMinimumScaleFactor = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setPerferredFontAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_perferredFontAdjustsFontSizeToFitWidth != a3)
  {
    self->_perferredFontAdjustsFontSizeToFitWidth = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setParagraphLineBreakMode:(int64_t)a3
{
  if (self->_paragraphLineBreakMode != a3)
  {
    self->_paragraphLineBreakMode = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (void)setInlineShieldSize:(int64_t)a3
{
  if (self->_inlineShieldSize != a3)
  {
    self->_inlineShieldSize = a3;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
}

- (unint64_t)lineCount
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v3 = [(NavSignLabel *)self attributedText];
  v4 = [(NavSignLabel *)self attributedText];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009AFD84;
  v18[3] = &unk_101312FC8;
  v18[4] = &v19;
  [v3 enumerateAttribute:NSAttachmentAttributeName inRange:0 length:[v4 length] options:0 usingBlock:v18];

  if (*((unsigned char *)v20 + 24))
  {
    unint64_t v5 = [(NavSignLabel *)self maxNumberOfTotalLines];
    rangeFinder = self->_rangeFinder;
    unint64_t v7 = [(NavSignLabel *)self attributedText];
    unsigned __int8 v8 = [(TextFirstLineCharacterRangeFinder *)rangeFinder lineRangesForText:v7];
    if (v5 >= (unint64_t)[v8 count])
    {
      v14 = self->_rangeFinder;
      v15 = [(NavSignLabel *)self attributedText];
      v16 = [(TextFirstLineCharacterRangeFinder *)v14 lineRangesForText:v15];
      id v9 = [v16 count];
    }
    else
    {
      id v9 = [(NavSignLabel *)self maxNumberOfTotalLines];
    }
  }
  else
  {
    [(NavSignLabel *)self bounds];
    -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
    double v11 = v10;
    unint64_t v7 = [(NavSignLabel *)self font];
    [v7 lineHeight];
    if (!(unint64_t)(v11 / v12))
    {
      id v9 = 0;
      goto LABEL_8;
    }
    unsigned __int8 v8 = [(NavSignLabel *)self font];
    [v8 lineHeight];
    id v9 = (id)(v11 / v13);
  }

LABEL_8:
  _Block_object_dispose(&v19, 8);
  return (unint64_t)v9;
}

- (BOOL)shouldUseAlternateFont
{
  v3 = [(NavSignLabel *)self alternateFont];
  if (v3 && [(NavSignLabel *)self maxNumberOfLinesWithPreferredFont] >= 1)
  {
    unint64_t v4 = [(NavSignLabel *)self lineCount];
    BOOL v5 = v4 > [(NavSignLabel *)self maxNumberOfLinesWithPreferredFont];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)updateLabelIfNeeded
{
  if (self->_needsUpdateLabel) {
    [(NavSignLabel *)self _updateLabel];
  }
}

- (double)inlineShieldBaselineOffset:(unint64_t)a3 fromTop:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(NavSignLabel *)self attributedText];
  [(NavSignLabel *)self bounds];
  -[TextFirstLineCharacterRangeFinder setTextSize:](self->_rangeFinder, "setTextSize:", v8, v9);
  if (a3 == -1)
  {
    id v10 = [(TextFirstLineCharacterRangeFinder *)self->_rangeFinder lastLineCharacterRangeInText:v7];
    goto LABEL_5;
  }
  if (!a3)
  {
    id v10 = [(TextFirstLineCharacterRangeFinder *)self->_rangeFinder firstLineCharacterRangeInText:v7];
LABEL_5:
    uint64_t v12 = (uint64_t)v10;
    uint64_t v13 = v11;
    goto LABEL_10;
  }
  v14 = [(TextFirstLineCharacterRangeFinder *)self->_rangeFinder lineRangesForText:v7];
  if ((unint64_t)[v14 count] <= a3)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v15 = [v14 objectAtIndexedSubscript:a3];
    uint64_t v12 = (uint64_t)[v15 rangeValue];
    uint64_t v13 = v16;
  }
LABEL_10:
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_1001041E4;
  v36 = sub_100104970;
  id v37 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1009B0190;
  v31[3] = &unk_101312FC8;
  v31[4] = &v32;
  [v7 enumerateAttribute:NSAttachmentAttributeName inRange:v12 options:v13 usingBlock:v31];
  v17 = [(id)v33[5] image];

  if (v17)
  {
    if ([(NavSignLabel *)self shouldUseAlternateFont]) {
      [(NavSignLabel *)self alternateFont];
    }
    else {
    uint64_t v19 = [(NavSignLabel *)self preferredFont];
    }
    v20 = [(id)v33[5] image];
    [v20 size];
    double v22 = v21;
    [v19 lineHeight];
    double v24 = v23;

    double v18 = 0.0;
    if (v22 > v24)
    {
      v25 = (void *)v33[5];
      if (v4)
      {
        v26 = [v25 image];
        [(NavSignLabel *)v26 size];
        [(id)v33[5] bounds];
        [v19 ascender];
        v27 = self;
        UIRoundToViewScale();
        double v18 = v28;
      }
      else
      {
        [v25 bounds];
        [v19 descender];
        v26 = self;
        UIRoundToViewScale();
        double v18 = v29;
      }
    }
  }
  else
  {
    double v18 = 0.0;
  }
  if (!v4) {
    double v18 = -v18;
  }
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (double)inlineShieldFirstBaselineTopOffset
{
  [(NavSignLabel *)self inlineShieldBaselineOffset:0 fromTop:1];
  return fmax(v2, 0.0);
}

- (double)inlineShieldLastBaselineBottomOffset
{
  [(NavSignLabel *)self inlineShieldBaselineOffset:-1 fromTop:0];
  return fmin(v2, 0.0);
}

- (UILayoutGuide)textTrailingLayoutGuide
{
  textTrailingLayoutGuide = self->_textTrailingLayoutGuide;
  if (!textTrailingLayoutGuide)
  {
    BOOL v4 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    BOOL v5 = self->_textTrailingLayoutGuide;
    self->_textTrailingLayoutGuide = v4;

    [(NavSignLabel *)self addLayoutGuide:self->_textTrailingLayoutGuide];
    unint64_t v6 = [(UILayoutGuide *)self->_textTrailingLayoutGuide widthAnchor];
    unint64_t v7 = [v6 constraintEqualToConstant:0.0];
    textTrailingLayoutGuideWidthConstraint = self->_textTrailingLayoutGuideWidthConstraint;
    self->_textTrailingLayoutGuideWidthConstraint = v7;

    v20[0] = self->_textTrailingLayoutGuideWidthConstraint;
    uint64_t v19 = [(UILayoutGuide *)self->_textTrailingLayoutGuide leadingAnchor];
    double v18 = [(NavSignLabel *)self leadingAnchor];
    double v9 = [v19 constraintEqualToAnchor:v18];
    v20[1] = v9;
    id v10 = [(UILayoutGuide *)self->_textTrailingLayoutGuide topAnchor];
    uint64_t v11 = [(NavSignLabel *)self topAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    v20[2] = v12;
    uint64_t v13 = [(UILayoutGuide *)self->_textTrailingLayoutGuide bottomAnchor];
    v14 = [(NavSignLabel *)self bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v20[3] = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:v20 count:4];
    +[NSLayoutConstraint activateConstraints:v16];

    textTrailingLayoutGuide = self->_textTrailingLayoutGuide;
  }

  return textTrailingLayoutGuide;
}

- (BOOL)_fitsMaxNumberOfLines:(int64_t)a3 bounds:(CGRect)a4
{
  if (!a3) {
    return 1;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0);
  double v11 = v10;
  -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", a3, x, y, width, height);
  return v11 <= v12;
}

- (void)_setNeedsUpdateLabel
{
  if (!self->_needsUpdateLabel)
  {
    self->_needsUpdateLabel = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009B05E4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateLabel
{
  if (self->_needsUpdateLabel)
  {
    v3 = [(NavSignLabel *)self textAlternatives];
    id v4 = [v3 count];

    if (v4)
    {
      [(NavSignLabel *)self bounds];
      double v6 = v5;
      [(NavSignLabel *)self invalidateIntrinsicContentSize];
      [(NavSignLabel *)self setNumberOfLines:[(NavSignLabel *)self maxNumberOfTotalLines]];
      [(NavSignLabel *)self setAdjustsFontSizeToFitWidth:0];
      unint64_t v7 = [(NavSignLabel *)self textAlternatives];
      id v8 = [v7 count];

      unint64_t v9 = 0;
      if (v8)
      {
        do
        {
          double v10 = [(NavSignLabel *)self textAlternatives];
          double v11 = [v10 objectAtIndexedSubscript:v9];
          double v12 = [(NavSignLabel *)self _attributedStringFromServerString:v11];
          [(NavSignLabel *)self setAttributedText:v12];

          if (-[NavSignLabel _fitsMaxNumberOfLines:bounds:](self, "_fitsMaxNumberOfLines:bounds:", [(NavSignLabel *)self maxNumberOfLinesWithLongestAlternative], 0.0, 0.0, v6, 1.79769313e308))
          {
            break;
          }
          ++v9;
          uint64_t v13 = [(NavSignLabel *)self textAlternatives];
          id v14 = [v13 count];
        }
        while (v9 < (unint64_t)v14);
      }
      v15 = [(NavSignLabel *)self delegate];
      [v15 navSignLabel:self didSelectAlternate:v9];

      uint64_t v16 = [(NavSignLabel *)self alternateFont];
      if (v16
        && (v17 = (void *)v16,
            unsigned __int8 v18 = -[NavSignLabel _fitsMaxNumberOfLines:bounds:](self, "_fitsMaxNumberOfLines:bounds:", [(NavSignLabel *)self maxNumberOfLinesWithPreferredFont], 0.0, 0.0, v6, 1.79769313e308), v17, (v18 & 1) == 0))
      {
        id v20 = objc_alloc_init((Class)NSMutableParagraphStyle);
        [(NavSignLabel *)self alternateFontLineSpacing];
        double v22 = v21;
        double v23 = [(NavSignLabel *)self alternateFont];
        [v23 lineHeight];
        double v25 = v22 - v24;
        v26 = [(NavSignLabel *)self alternateFont];
        [v26 leading];
        double v28 = v25 + v27;

        if (v28 >= 0.0) {
          [v20 setLineSpacing:v28];
        }
        [v20 setLineBreakMode:[self paragraphLineBreakMode]];
        LODWORD(v29) = 1036831949;
        [v20 setHyphenationFactor:v29];
        v30 = [(NavSignLabel *)self attributedText];
        id v31 = [v30 mutableCopy];

        v35[0] = NSFontAttributeName;
        uint64_t v32 = [(NavSignLabel *)self alternateFont];
        v35[1] = NSParagraphStyleAttributeName;
        v36[0] = v32;
        v36[1] = v20;
        v33 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
        uint64_t v34 = [(NavSignLabel *)self attributedText];
        [v31 addAttributes:v33 range:0, [v34 length]];

        [(NavSignLabel *)self setAttributedText:v31];
      }
      else
      {
        uint64_t v19 = [(NavSignLabel *)self preferredFont];

        if (v19)
        {
          [(NavSignLabel *)self preferredFontMinimumScaleFactor];
          -[NavSignLabel setMinimumScaleFactor:](self, "setMinimumScaleFactor:");
          [(NavSignLabel *)self setAdjustsFontSizeToFitWidth:[(NavSignLabel *)self perferredFontAdjustsFontSizeToFitWidth]];
        }
      }
    }
    else
    {
      [(NavSignLabel *)self setAttributedText:0];
    }
    self->_needsUpdateLabel = 0;
  }
}

- (id)_attributedStringKeyForString:(id)a3 font:(id)a4
{
  id v13 = a3;
  id v14 = a4;
  id v6 = a4;
  id v7 = a3;
  [(NavSignLabel *)self inlineShieldAlpha];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15 = v8;
  unint64_t v9 = +[NSNumber numberWithInteger:[(NavSignLabel *)self inlineShieldSize]];
  uint64_t v16 = v9;
  double v10 = +[NSNumber numberWithBool:[(NavSignLabel *)self shouldRemoveTextStartingAtFirstNewline]];
  v17 = v10;
  double v11 = +[NSArray arrayWithObjects:&v13 count:5];

  return v11;
}

- (id)_attributedStringFromServerString:(id)a3
{
  id v4 = a3;
  double v5 = [(NavSignLabel *)self preferredFont];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NavSignLabel *)self font];
  }
  id v8 = v7;

  unint64_t v9 = [(NavSignLabel *)self _attributedStringKeyForString:v4 font:v8];
  double v10 = [(NavSignLabel *)self stringCache];
  id v11 = [v10 objectForKey:v9];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v12 = 0;
    }
    else {
      double v12 = v11;
    }
    id v13 = v12;
  }
  else
  {
    [(NavSignLabel *)self inlineShieldAlpha];
    double v15 = v14;
    int64_t v16 = [(NavSignLabel *)self inlineShieldSize];
    [(NavSignLabel *)self _car_dynamicPointScaleValue];
    double v18 = v17;
    v45[0] = v8;
    v44[0] = NSFontAttributeName;
    v44[1] = MKServerFormattedStringArtworkAlphaAttributeKey;
    id v19 = v8;
    id v20 = v4;
    double v21 = +[NSNumber numberWithDouble:v15];
    v45[1] = v21;
    v44[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    double v22 = +[NSNumber numberWithInteger:v16];
    v45[2] = v22;
    v45[3] = &off_1013A9EF8;
    v44[3] = MKServerFormattedStringArtworkFeatureTypeAttributeKey;
    v44[4] = MKServerFormattedStringArtworkScaleAttributeKey;
    double v23 = +[NSNumber numberWithDouble:v18];
    v45[4] = v23;
    double v24 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];

    double v25 = [v20 multiPartAttributedStringWithAttributes:v24];

    v26 = [v25 attributedString];

    double v27 = [v26 _maps_attributedStringByReplacingWhitespaceToAvoidOrphanWords];

    if ([v27 length]) {
      double v28 = v27;
    }
    else {
      double v28 = 0;
    }
    id v29 = v28;

    if ([(NavSignLabel *)self shouldRemoveTextStartingAtFirstNewline])
    {
      if ([v29 length])
      {
        v30 = [v29 string];
        id v31 = [v30 rangeOfString:@"\n"];
        uint64_t v33 = v32;

        if (v31 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
        {
          if (v33)
          {
            uint64_t v34 = (char *)((unsigned char *)[v29 length] - v31);
            id v35 = [v29 mutableCopy];
            v36 = [v35 mutableString];
            [v36 deleteCharactersInRange:v31, v34];

            id v37 = [v35 copy];
            id v29 = v37;
          }
        }
      }
    }
    if ([v29 length]) {
      v38 = v29;
    }
    else {
      v38 = 0;
    }
    id v39 = v38;
    v40 = [(NavSignLabel *)self stringCache];
    v41 = v40;
    if (v39)
    {
      [v40 setObject:v39 forKey:v9];
    }
    else
    {
      v42 = +[NSNull null];
      [v41 setObject:v42 forKey:v9];
    }
    id v11 = v39;

    id v13 = v11;
  }

  return v13;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NavSignLabel;
  [(NavSignLabel *)&v7 layoutSubviews];
  double width = self->_width;
  [(NavSignLabel *)self bounds];
  if (width != v4)
  {
    [(NavSignLabel *)self bounds];
    self->_double width = v5;
    [(NavSignLabel *)self _setNeedsUpdateLabel];
  }
  [(NavSignLabel *)self updateLabelIfNeeded];
  if ([(NSLayoutConstraint *)self->_textTrailingLayoutGuideWidthConstraint isActive])
  {
    -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", [(NavSignLabel *)self maxNumberOfLinesWithLongestAlternative], 0.0, 0.0, self->_width, 1.79769313e308);
    [(NSLayoutConstraint *)self->_textTrailingLayoutGuideWidthConstraint setConstant:v6];
  }
}

- (UIFont)preferredFont
{
  return self->_preferredFont;
}

- (double)preferredFontMinimumScaleFactor
{
  return self->_preferredFontMinimumScaleFactor;
}

- (BOOL)perferredFontAdjustsFontSizeToFitWidth
{
  return self->_perferredFontAdjustsFontSizeToFitWidth;
}

- (UIFont)alternateFont
{
  return self->_alternateFont;
}

- (double)alternateFontLineSpacing
{
  return self->_alternateFontLineSpacing;
}

- (int64_t)maxNumberOfLinesWithPreferredFont
{
  return self->_maxNumberOfLinesWithPreferredFont;
}

- (int64_t)maxNumberOfLinesWithLongestAlternative
{
  return self->_maxNumberOfLinesWithLongestAlternative;
}

- (int64_t)maxNumberOfTotalLines
{
  return self->_maxNumberOfTotalLines;
}

- (int64_t)paragraphLineBreakMode
{
  return self->_paragraphLineBreakMode;
}

- (double)inlineShieldAlpha
{
  return self->_inlineShieldAlpha;
}

- (int64_t)inlineShieldSize
{
  return self->_inlineShieldSize;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (NSCache)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
}

- (BOOL)shouldRemoveTextStartingAtFirstNewline
{
  return self->_shouldRemoveTextStartingAtFirstNewline;
}

- (void)setShouldRemoveTextStartingAtFirstNewline:(BOOL)a3
{
  self->_shouldRemoveTextStartingAtFirstNewline = a3;
}

- (NavSignLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavSignLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_alternateFont, 0);
  objc_storeStrong((id *)&self->_preferredFont, 0);
  objc_storeStrong((id *)&self->_textTrailingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_textTrailingLayoutGuideWidthConstraint, 0);

  objc_storeStrong((id *)&self->_rangeFinder, 0);
}

@end
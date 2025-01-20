@interface SKUIAttributedStringView
+ (CGSize)sizeWithLayout:(id)a3 treatment:(int64_t)a4;
- (BOOL)_touchInsideLinkText:(CGPoint)a3 linkTextRange:(_NSRange *)a4;
- (BOOL)containsLinks;
- (BOOL)textColorFollowsTintColor;
- (BOOL)usesTallCharacterSet;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredBadges;
- (NSString)description;
- (SKUIAttributedStringLayout)layout;
- (SKUIAttributedStringView)initWithFrame:(CGRect)a3;
- (SKUILinkHandler)linkDelegate;
- (UIColor)textColor;
- (UIColor)treatmentColor;
- (double)baselineOffset;
- (double)firstBaselineOffset;
- (int64_t)badgePlacement;
- (int64_t)firstLineTopInset;
- (int64_t)stringTreatment;
- (void)_reloadTopInset;
- (void)_setTouchInside:(BOOL)a3;
- (void)_setTrackingTouch:(BOOL)a3;
- (void)_setupTapLocatorContainer;
- (void)drawRect:(CGRect)a3;
- (void)setBadgePlacement:(int64_t)a3;
- (void)setContainsLinks:(BOOL)a3;
- (void)setFirstLineTopInset:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setLinkDelegate:(id)a3;
- (void)setRequiredBadges:(id)a3;
- (void)setStringTreatment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextColorFollowsTintColor:(BOOL)a3;
- (void)setTreatmentColor:(id)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)viewWasRecycled;
@end

@implementation SKUIAttributedStringView

- (SKUIAttributedStringView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAttributedStringView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIAttributedStringView;
  v8 = -[SKUIAttributedStringView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8) {
    [(SKUIAttributedStringView *)v8 setContentMode:3];
  }
  return v9;
}

- (void)viewWasRecycled
{
  layout = self->_layout;
  self->_layout = 0;

  layoutManager = self->_layoutManager;
  self->_layoutManager = 0;

  requiredBadges = self->_requiredBadges;
  self->_requiredBadges = 0;

  textColor = self->_textColor;
  self->_textColor = 0;

  textContainer = self->_textContainer;
  self->_textContainer = 0;

  textStorage = self->_textStorage;
  self->_textStorage = 0;

  treatmentColor = self->_treatmentColor;
  self->_treatmentColor = 0;
}

+ (CGSize)sizeWithLayout:(id)a3 treatment:(int64_t)a4
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIAttributedStringView sizeWithLayout:treatment:]();
  }
  [v5 boundingSize];
  double v8 = v6;
  double v9 = v7;
  if (a4 == 1)
  {
    double v8 = v6 + 14.0;
    double v10 = v7 + 6.0;
    id v11 = v5;
    v12 = [v11 attributedString];
    v13 = [v12 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];

    [v11 baselineOffset];
    double v15 = v14;
    [v13 capHeight];
    double v17 = v15 - v16;
    [v13 _bodyLeading];
    double v19 = v17 - v18 * (double)([v11 numberOfLines] - 1);
    [v11 topInset];
    double v21 = v20;

    float v22 = v21 + v19;
    double v23 = ceilf(v22);

    double v9 = v10 - v23;
  }

  double v24 = v8;
  double v25 = v9;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (double)baselineOffset
{
  [(SKUIAttributedStringLayout *)self->_layout baselineOffset];
  return result;
}

- (double)firstBaselineOffset
{
  [(SKUIAttributedStringLayout *)self->_layout firstBaselineOffset];
  return result;
}

- (void)setBadgePlacement:(int64_t)a3
{
  if (self->_badgePlacement != a3)
  {
    self->_badgePlacement = a3;
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)setFirstLineTopInset:(int64_t)a3
{
  if (self->_firstLineTopInset != a3)
  {
    self->_firstLineTopInset = a3;
    [(SKUIAttributedStringView *)self _reloadTopInset];
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)setLayout:(id)a3
{
  id v5 = (SKUIAttributedStringLayout *)a3;
  p_layout = &self->_layout;
  if (self->_layout != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)p_layout, a3);
    textStorage = self->_textStorage;
    if (textStorage)
    {
      if (v9)
      {
        double v8 = [(SKUIAttributedStringLayout *)v9 attributedString];
        [(NSTextStorage *)textStorage setAttributedString:v8];
      }
      else
      {
        -[NSTextStorage deleteCharactersInRange:](textStorage, "deleteCharactersInRange:", 0, [(NSTextStorage *)textStorage length]);
      }
    }
    [(SKUIAttributedStringView *)self _reloadTopInset];
    p_layout = (SKUIAttributedStringLayout **)[(SKUIAttributedStringView *)self setNeedsDisplay];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](p_layout, v5);
}

- (void)setRequiredBadges:(id)a3
{
  if (self->_requiredBadges != a3)
  {
    v4 = (NSArray *)[a3 copy];
    requiredBadges = self->_requiredBadges;
    self->_requiredBadges = v4;

    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)setStringTreatment:(int64_t)a3
{
  if (self->_stringTreatment != a3)
  {
    self->_stringTreatment = a3;
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_textColor, a3);
    p_textColor = (UIColor **)[(SKUIAttributedStringView *)self setNeedsDisplay];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_textColor, v5);
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  if (self->_textColorFollowsTintColor != a3)
  {
    self->_textColorFollowsTintColor = a3;
    if (!self->_textColor) {
      [(SKUIAttributedStringView *)self setNeedsDisplay];
    }
  }
}

- (void)setTreatmentColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_treatmentColor = &self->_treatmentColor;
  if (self->_treatmentColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_treatmentColor, a3);
    p_treatmentColor = (UIColor **)[(SKUIAttributedStringView *)self setNeedsDisplay];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_treatmentColor, v5);
}

- (BOOL)usesTallCharacterSet
{
  return [(SKUIAttributedStringLayout *)self->_layout usesTallCharacterSet];
}

- (NSString)description
{
  v3 = [(SKUIAttributedStringLayout *)self->_layout attributedString];
  v4 = [v3 string];

  unint64_t v5 = [v4 length];
  double v6 = NSString;
  if (v5 > 0x13)
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIAttributedStringView;
    double v7 = [(SKUIAttributedStringView *)&v11 description];
    double v9 = [v4 substringToIndex:20];
    double v8 = [v6 stringWithFormat:@"%@: \"%@...\"", v7, v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIAttributedStringView;
    double v7 = [(SKUIAttributedStringView *)&v12 description];
    double v8 = [v6 stringWithFormat:@"%@: \"%@\"", v7, v4];
  }

  return (NSString *)v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 anyObject];
  [v8 locationInView:self];
  if (-[SKUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange))
  {
    [(SKUIAttributedStringView *)self _setTrackingTouch:1];
    [(SKUIAttributedStringView *)self _setTouchInside:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIAttributedStringView;
    [(SKUIAttributedStringView *)&v9 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (self->_trackingTouch)
  {
    id v5 = [a3 anyObject];
    [v5 locationInView:self];
    -[SKUIAttributedStringView _setTouchInside:](self, "_setTouchInside:", -[SKUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIAttributedStringView;
    [(SKUIAttributedStringView *)&v6 touchesMoved:a3 withEvent:a4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_trackingTouch)
  {
    id v8 = [a3 anyObject];
    [v8 locationInView:self];
    if (-[SKUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);
      int v6 = [WeakRetained conformsToProtocol:&unk_1F1E26800];

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)&self->_linkDelegate);
        objc_msgSend(v7, "linkTapped:range:", self, self->_trackingRange.location, self->_trackingRange.length);
      }
    }
    [(SKUIAttributedStringView *)self _setTrackingTouch:0];
    [(SKUIAttributedStringView *)self _setTouchInside:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIAttributedStringView;
    [(SKUIAttributedStringView *)&v9 touchesEnded:a3 withEvent:a4];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self->_trackingTouch)
  {
    -[SKUIAttributedStringView _setTrackingTouch:](self, "_setTrackingTouch:", 0, a4);
    [(SKUIAttributedStringView *)self _setTouchInside:0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUIAttributedStringView;
    [(SKUIAttributedStringView *)&v5 touchesCancelled:a3 withEvent:a4];
  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v200 = *MEMORY[0x1E4F143B8];
  [(SKUIAttributedStringView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = v7 + self->_calculatedTopInset;
  [(SKUIAttributedStringLayout *)self->_layout topInset];
  double v176 = v14 + v15;
  [(SKUIAttributedStringLayout *)self->_layout edgeInsetsForShadow];
  if (v19 != *(double *)(MEMORY[0x1E4FB2848] + 8)
    || v16 != *MEMORY[0x1E4FB2848]
    || v18 != *(double *)(MEMORY[0x1E4FB2848] + 24)
    || v17 != *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    [(SKUIAttributedStringLayout *)self->_layout edgeInsetsForShadow];
    double v176 = v176 + v23;
    [(SKUIAttributedStringLayout *)self->_layout edgeInsetsForShadow];
    double v13 = v13 + v24;
  }
  [(SKUIAttributedStringLayout *)self->_layout boundingSize];
  BOOL v27 = self->_badgePlacement == 1;
  if (v11 < v26 || self->_badgePlacement == 1) {
    double v26 = v11;
  }
  double v175 = v26;
  if (v9 < v25) {
    BOOL v27 = 1;
  }
  if (v27) {
    double v29 = v9;
  }
  else {
    double v29 = v25;
  }
  if (self->_stringTreatment == 1)
  {
    treatmentColor = self->_treatmentColor;
    if (treatmentColor)
    {
      [(UIColor *)treatmentColor set];
      v31 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, 6.0);
      [v31 fill];

      v32 = self->_layout;
      v33 = [(SKUIAttributedStringLayout *)v32 attributedString];
      v34 = [v33 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];

      [(SKUIAttributedStringLayout *)v32 baselineOffset];
      double v35 = v29;
      double v37 = v36;
      [v34 capHeight];
      double v39 = v37 - v38;
      [v34 _bodyLeading];
      double v41 = v39 - v40 * (double)([(SKUIAttributedStringLayout *)v32 numberOfLines] - 1);
      [(SKUIAttributedStringLayout *)v32 topInset];
      double v43 = v42;

      float v44 = v43 + v41;
      double v45 = ceilf(v44);

      [(SKUIAttributedStringLayout *)self->_layout topInset];
      double v47 = v46 + (v11 - (v175 - v45)) * 0.5 - v45 * 0.5;
      double v29 = v35;
      *(float *)&double v47 = v47;
      double v176 = floorf(*(float *)&v47);
      double v13 = 7.0;
    }
  }
  uint64_t v48 = [(SKUIAttributedStringLayout *)self->_layout attributedString];
  if (v48)
  {
    v49 = (void *)v48;
    uint64_t v50 = [(NSArray *)self->_requiredBadges count];
    uint64_t v172 = v50;
    double v174 = v9;
    if (v50 < 1)
    {
      double v52 = *MEMORY[0x1E4F1DB30];
      double v57 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      double v51 = v5;
      double v52 = (float)((float)(v50 - 1) * 4.0);
      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      v53 = self->_requiredBadges;
      uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v192 objects:v199 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v193;
        double v57 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v193 != v56) {
              objc_enumerationMutation(v53);
            }
            [*(id *)(*((void *)&v192 + 1) + 8 * i) badgeSize];
            if (v57 < v60) {
              double v57 = v60;
            }
            double v52 = v52 + v59;
          }
          uint64_t v55 = [(NSArray *)v53 countByEnumeratingWithState:&v192 objects:v199 count:16];
        }
        while (v55);
      }
      else
      {
        double v57 = 0.0;
      }

      if (!self->_badgePlacement)
      {
        [(SKUIAttributedStringLayout *)self->_layout firstBaselineOffset];
        double v62 = v9;
        double v64 = v63;
        if (v29 >= v62 - v52 + -4.0 - v13) {
          double v29 = v62 - v52 + -4.0 - v13;
        }
        if (ShouldReverseLayoutDirection)
        {
          double v65 = v51;
          double v66 = v7;
          double v67 = v11;
          double MaxX = CGRectGetMaxX(*(CGRect *)(&v62 - 2));
          v202.origin.double x = v13;
          v202.origin.double y = v176;
          v202.size.double width = v29;
          v202.size.double height = v175;
          double v177 = MaxX - CGRectGetWidth(v202);
          v203.origin.double x = v13;
          v203.origin.double y = v176;
          v203.size.double width = v29;
          double v61 = v175;
          v203.size.double height = v175;
          double v13 = v177 - CGRectGetMinX(v203);
        }
        else
        {
          double v61 = v175;
        }
        if (v57 > v64)
        {
          float v69 = v57 - v64 + 3.0;
          double v176 = v176 + ceilf(v69);
        }
        double v9 = v174;
        goto LABEL_49;
      }
    }
    double v61 = v175;
LABEL_49:
    if (self->_textColorFollowsTintColor)
    {
      v70 = [(SKUIAttributedStringView *)self tintColor];
    }
    else
    {
      v70 = self->_textColor;
    }
    v71 = v70;
    if (v70)
    {
      v72 = (void *)[v49 mutableCopy];
      objc_msgSend(v72, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v71, 0, objc_msgSend(v72, "length"));

      v49 = v72;
    }
    if (self->_containsLinks)
    {
      v73 = (void *)[v49 mutableCopy];
      uint64_t v74 = [v49 length];
      v190[0] = MEMORY[0x1E4F143A8];
      v190[1] = 3221225472;
      v190[2] = __37__SKUIAttributedStringView_drawRect___block_invoke;
      v190[3] = &unk_1E6429D38;
      v190[4] = self;
      id v75 = v73;
      id v191 = v75;
      objc_msgSend(v49, "enumerateAttributesInRange:options:usingBlock:", 0, v74, 0, v190);
      id v76 = v75;

      self->_textBounds.origin.double x = v13;
      self->_textBounds.origin.double y = v176;
      self->_textBounds.size.double width = v29 + 10.0;
      self->_textBounds.size.double height = v61;
      textContainer = self->_textContainer;
      if (textContainer) {
        -[NSTextContainer setContainerSize:](textContainer, "setContainerSize:");
      }
    }
    else
    {
      id v76 = v49;
    }
    v78 = [(SKUIAttributedStringLayout *)self->_layout shadow];
    if (v78)
    {
      v79 = (void *)[v76 mutableCopy];
      objc_msgSend(v79, "removeAttribute:range:", *MEMORY[0x1E4FB0758], 0, objc_msgSend(v79, "length"));

      CurrentContext = UIGraphicsGetCurrentContext();
      [v78 shadowOffset];
      CGFloat v82 = v81;
      double v83 = v13;
      double v84 = v29;
      CGFloat v86 = v85;
      [v78 shadowBlurRadius];
      double v87 = v61;
      double v89 = v88;
      id v90 = [v78 shadowColor];
      v91 = (CGColor *)[v90 CGColor];
      v201.double width = v82;
      v201.double height = v86;
      double v29 = v84;
      double v13 = v83;
      double v9 = v174;
      CGFloat v92 = v89;
      double v61 = v87;
      CGContextSetShadowWithColor(CurrentContext, v201, v92, v91);

      id v76 = v79;
    }
    if (self->_badgePlacement == 1)
    {
      v93 = (void *)[v76 mutableCopy];
      uint64_t v188 = 0;
      uint64_t v189 = [v76 length];
      uint64_t v94 = [v93 length] - 1;
      v95 = [v93 attribute:*MEMORY[0x1E4FB06F8] atIndex:v94 effectiveRange:&v188];
      v168 = v95;
      if (v95) {
        [v95 descender];
      }
      else {
        double v96 = 0.0;
      }
      double v178 = v96;
      uint64_t v99 = *MEMORY[0x1E4FB0738];
      v100 = [v93 attribute:*MEMORY[0x1E4FB0738] atIndex:0 effectiveRange:&v188];
      id v170 = v76;
      v171 = v71;
      v169 = v78;
      v167 = v100;
      CGFloat v165 = v13;
      if (v100 && (v101 = v100, [v100 lineBreakMode]))
      {
        uint64_t v102 = [v101 lineBreakMode];
        v103 = (void *)[v101 mutableCopy];
        [v103 setLineBreakMode:0];
        objc_msgSend(v93, "addAttribute:value:range:", v99, v103, v188, v189);

        int v104 = 1;
      }
      else
      {
        int v104 = 0;
        uint64_t v102 = 4;
      }
      v105 = (void *)[objc_alloc(MEMORY[0x1E4FB08B8]) initWithAttributedString:v93];
      id v106 = objc_alloc_init(MEMORY[0x1E4FB0840]);
      v166 = v105;
      [v105 addLayoutManager:v106];
      CGFloat rect = v29;
      double v107 = v61;
      v108 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0880]), "initWithSize:", v29, v61);
      [v108 setLineFragmentPadding:0.0];
      if (v104) {
        [v108 setLineBreakMode:v102];
      }
      [v106 addTextContainer:v108];
      uint64_t v109 = [v106 glyphRangeForTextContainer:v108];
      uint64_t v111 = v110;
      v187[0] = v109;
      v187[1] = v110;
      [v106 lineFragmentUsedRectForGlyphAtIndex:v94 effectiveRange:v187];
      CGFloat v113 = v112;
      CGFloat v115 = v114;
      CGFloat v117 = v116;
      CGFloat v119 = v118;
      [v106 locationForGlyphAtIndex:v94];
      double v121 = v120;
      v204.origin.double x = v113;
      CGFloat v163 = v117;
      CGFloat v164 = v115;
      v204.origin.double y = v115;
      v204.size.double width = v117;
      v204.size.double height = v119;
      double MaxY = CGRectGetMaxY(v204);
      v205.origin.double x = v165;
      v205.origin.double y = v176;
      v205.size.double width = rect;
      double v61 = v107;
      double v13 = v165;
      v205.size.double height = v61;
      if (v52 > CGRectGetMaxX(v205) - v121)
      {
        v206.origin.double x = v165;
        v206.size.double height = v175;
        v206.origin.double y = v176;
        v206.size.double width = rect;
        CGFloat v162 = CGRectGetMaxX(v206) - (v52 + 4.0);
        v207.origin.double x = v113;
        v207.size.double width = v163;
        v207.origin.double y = v164;
        v207.size.double height = v119;
        double v122 = v178 + CGRectGetMaxY(v207) - v57;
        v208.origin.double x = v165;
        v208.origin.double y = v176;
        double v61 = v175;
        v208.size.double width = rect;
        v208.size.double height = v175;
        v123 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v162, v122, CGRectGetMaxX(v208) - v162, v57);
        v198 = v123;
        v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v198 count:1];
        [v108 setExclusionPaths:v124];

        double v121 = v162 + -4.0;
      }
      double v98 = v121;
      objc_msgSend(v106, "drawGlyphsForGlyphRange:atPoint:", v109, v111, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

      double v29 = rect;
      double v9 = v174;
      id v76 = v170;
      v71 = v171;
      v78 = v169;
    }
    else
    {
      double v98 = *MEMORY[0x1E4F1DAD8];
      double MaxY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v93 = [(SKUIAttributedStringLayout *)self->_layout stringDrawingContext];
      objc_msgSend(v76, "drawWithRect:options:context:", 33, v93, v13, v176, v29, v61);
      double v178 = 0.0;
    }

    if (v172 >= 1)
    {
      if (self->_badgePlacement == 1)
      {
        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        v125 = self->_requiredBadges;
        uint64_t v126 = [(NSArray *)v125 countByEnumeratingWithState:&v183 objects:v197 count:16];
        if (v126)
        {
          uint64_t v127 = v126;
          id v128 = v76;
          double v129 = v98 + 4.0;
          uint64_t v130 = *(void *)v184;
          do
          {
            for (uint64_t j = 0; j != v127; ++j)
            {
              if (*(void *)v184 != v130) {
                objc_enumerationMutation(v125);
              }
              v132 = *(void **)(*((void *)&v183 + 1) + 8 * j);
              [v132 badgeSize];
              double v134 = v133;
              double v136 = v135;
              v137 = [v132 image];
              if (v137)
              {
                float v138 = v129;
                double v139 = roundf(v138);
                v140 = [MEMORY[0x1E4FB1BA8] mainScreen];
                [v140 scale];
                *(float *)&double v141 = v178 + MaxY - v136 + 1.0 / v141;
                double v142 = roundf(*(float *)&v141);

                objc_msgSend(v137, "drawInRect:", v139, v142, v134, v136);
              }
              double v129 = v129 + v134 + 4.0;
            }
            uint64_t v127 = [(NSArray *)v125 countByEnumeratingWithState:&v183 objects:v197 count:16];
          }
          while (v127);
          id v76 = v128;
        }
      }
      else
      {
        [(SKUIAttributedStringLayout *)self->_layout firstBaselineOffset];
        double v144 = v143;
        if (ShouldReverseLayoutDirection)
        {
          v209.origin.double x = v13;
          v209.origin.double y = v176;
          v209.size.double width = v29;
          v209.size.double height = v61;
          double v145 = fmax(CGRectGetMinX(v209) + -4.0 - v52, 0.0);
        }
        else
        {
          double v145 = v9 - v52;
          v210.origin.double x = v13;
          v210.origin.double y = v176;
          v210.size.double width = v29;
          v210.size.double height = v61;
          double v146 = CGRectGetMaxX(v210) + 4.0;
          if (v9 - v52 >= v146) {
            double v145 = v146;
          }
        }
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        v125 = self->_requiredBadges;
        uint64_t v147 = [(NSArray *)v125 countByEnumeratingWithState:&v179 objects:v196 count:16];
        if (v147)
        {
          uint64_t v148 = v147;
          v149 = v78;
          id v150 = v76;
          uint64_t v151 = *(void *)v180;
          do
          {
            for (uint64_t k = 0; k != v148; ++k)
            {
              if (*(void *)v180 != v151) {
                objc_enumerationMutation(v125);
              }
              v153 = *(void **)(*((void *)&v179 + 1) + 8 * k);
              [v153 badgeSize];
              double v155 = v154;
              double v157 = v156;
              v158 = [v153 image];
              v159 = v158;
              if (v158)
              {
                float v160 = v176 + v144 - v157;
                objc_msgSend(v158, "drawInRect:", v145, roundf(v160), v155, v157);
              }
              double v161 = v155 + 4.0;
              if (ShouldReverseLayoutDirection) {
                double v161 = -(v52 + -4.0);
              }
              double v145 = v145 + v161;
            }
            uint64_t v148 = [(NSArray *)v125 countByEnumeratingWithState:&v179 objects:v196 count:16];
          }
          while (v148);
          id v76 = v150;
          v78 = v149;
        }
      }
    }
  }
}

void __37__SKUIAttributedStringView_drawRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  double v7 = [v14 objectForKey:@"SKUILinkAttributeName"];

  if (v7)
  {
    if ((uint64_t v8 = *(void *)(a1 + 32), !*(unsigned char *)(v8 + 456))
      || !*(unsigned char *)(v8 + 480)
      || ((v9 = (uint64_t *)(v8 + 464), uint64_t v11 = *v9, v10 = v9[1], a3 == v11) ? (v12 = a4 == v10) : (v12 = 0), !v12))
    {
      double v13 = [v14 objectForKey:@"SKUILinkColorAttributeName"];
      if (!v13)
      {
        double v13 = [*(id *)(a1 + 32) tintColor];
      }
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v13, a3, a4);
    }
  }
}

- (void)_setupTapLocatorContainer
{
  if (!self->_textContainer)
  {
    v3 = (NSTextContainer *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB0880]), "initWithSize:", self->_textBounds.size.width, self->_textBounds.size.height);
    textContainer = self->_textContainer;
    self->_textContainer = v3;

    double v5 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E4FB0840]);
    layoutManager = self->_layoutManager;
    self->_layoutManager = v5;

    [(NSLayoutManager *)self->_layoutManager addTextContainer:self->_textContainer];
    double v7 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4FB08B8]);
    textStorage = self->_textStorage;
    self->_textStorage = v7;

    [(NSTextStorage *)self->_textStorage addLayoutManager:self->_layoutManager];
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v10 = [(SKUIAttributedStringLayout *)self->_layout attributedString];
    id v13 = (id)[v9 initWithAttributedString:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    uint64_t v12 = [v13 length];
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v11, 0, v12);
    [(NSTextStorage *)self->_textStorage setAttributedString:v13];
  }
}

- (BOOL)_touchInsideLinkText:(CGPoint)a3 linkTextRange:(_NSRange *)a4
{
  if (!self->_containsLinks) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  [(SKUIAttributedStringView *)self bounds];
  v15.double x = x;
  v15.double y = y;
  if (!CGRectContainsPoint(v16, v15)) {
    return 0;
  }
  uint64_t v8 = [(SKUIAttributedStringLayout *)self->_layout attributedString];
  uint64_t v9 = [v8 length];
  if (v9 < 1)
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v10 = v9;
    [(SKUIAttributedStringView *)self _setupTapLocatorContainer];
    -[NSLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self->_layoutManager, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, &__block_literal_global_54);
    double v11 = self->_textBounds.origin.y;
    if (v11 == 0.0) {
      double v11 = -0.0;
    }
    uint64_t v12 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", @"SKUILinkAttributeName", -[NSLayoutManager characterIndexForGlyphAtIndex:](self->_layoutManager, "characterIndexForGlyphAtIndex:", -[NSLayoutManager glyphIndexForPoint:inTextContainer:](self->_layoutManager, "glyphIndexForPoint:inTextContainer:", self->_textContainer, x, y + v11)), a4, 0, v10);

    BOOL v13 = v12 != 0;
  }

  return v13;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  layout = self->_layout;
  if (layout)
  {
    [(SKUIAttributedStringLayout *)layout boundingSize];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5 + self->_calculatedTopInset;
  if (self->_stringTreatment == 1)
  {
    double v7 = v7 + 14.0;
    double v9 = v8 + 6.0;
    uint64_t v10 = self->_layout;
    double v11 = [(SKUIAttributedStringLayout *)v10 attributedString];
    uint64_t v12 = [v11 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];

    [(SKUIAttributedStringLayout *)v10 baselineOffset];
    double v14 = v13;
    [v12 capHeight];
    double v16 = v14 - v15;
    [v12 _bodyLeading];
    double v18 = v16 - v17 * (double)([(SKUIAttributedStringLayout *)v10 numberOfLines] - 1);
    [(SKUIAttributedStringLayout *)v10 topInset];
    double v20 = v19;

    float v21 = v20 + v18;
    double v22 = ceilf(v21);

    double v8 = v9 - v22;
  }
  uint64_t v23 = [(NSArray *)self->_requiredBadges count];
  if (v23 >= 1)
  {
    uint64_t v24 = v23;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v25 = self->_requiredBadges;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      double v29 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "badgeSize", (void)v37);
          double v7 = v7 + v32;
          if (v29 < v31) {
            double v29 = v31;
          }
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v27);
    }
    else
    {
      double v29 = 0.0;
    }

    double v7 = v7 + (float)((float)v24 * 4.0);
    if (self->_badgePlacement != 1)
    {
      [(SKUIAttributedStringLayout *)self->_layout firstBaselineOffset];
      if (v29 > v33)
      {
        float v34 = v29 - v33 + 3.0;
        double v8 = v8 + ceilf(v34);
      }
    }
  }
  double v35 = v7;
  double v36 = v8;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIAttributedStringView;
  [(SKUIAttributedStringView *)&v3 tintColorDidChange];
  if (self->_textColorFollowsTintColor) {
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)_reloadTopInset
{
  self->_calculatedTopInset = 0.0;
  layout = self->_layout;
  if (layout)
  {
    if (self->_firstLineTopInset)
    {
      double v4 = layout;
      double v5 = [(SKUIAttributedStringLayout *)v4 attributedString];
      double v6 = [v5 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];

      [(SKUIAttributedStringLayout *)v4 baselineOffset];
      double v8 = v7;
      [v6 capHeight];
      double v10 = v8 - v9;
      [v6 _bodyLeading];
      double v12 = v10 - v11 * (double)([(SKUIAttributedStringLayout *)v4 numberOfLines] - 1);
      [(SKUIAttributedStringLayout *)v4 topInset];
      double v14 = v13;

      float v15 = v14 + v12;
      double v16 = ceilf(v15);

      self->_calculatedTopInset = (double)self->_firstLineTopInset - v16;
    }
  }
}

- (void)_setTrackingTouch:(BOOL)a3
{
  if (self->_trackingTouch != a3)
  {
    self->_trackingTouch = a3;
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (void)_setTouchInside:(BOOL)a3
{
  if (self->_touchInside != a3)
  {
    self->_touchInside = a3;
    [(SKUIAttributedStringView *)self setNeedsDisplay];
  }
}

- (BOOL)containsLinks
{
  return self->_containsLinks;
}

- (void)setContainsLinks:(BOOL)a3
{
  self->_containsLinks = a3;
}

- (SKUIAttributedStringLayout)layout
{
  return self->_layout;
}

- (SKUILinkHandler)linkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);

  return (SKUILinkHandler *)WeakRetained;
}

- (void)setLinkDelegate:(id)a3
{
}

- (NSArray)requiredBadges
{
  return self->_requiredBadges;
}

- (int64_t)stringTreatment
{
  return self->_stringTreatment;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)treatmentColor
{
  return self->_treatmentColor;
}

- (int64_t)firstLineTopInset
{
  return self->_firstLineTopInset;
}

- (int64_t)badgePlacement
{
  return self->_badgePlacement;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkDelegate);
  objc_storeStrong((id *)&self->_treatmentColor, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_requiredBadges, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAttributedStringView initWithFrame:]";
}

+ (void)sizeWithLayout:treatment:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIAttributedStringView sizeWithLayout:treatment:]";
}

@end
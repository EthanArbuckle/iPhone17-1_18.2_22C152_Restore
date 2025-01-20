@interface THNoteCardContentLayer
- (BOOL)darkMode;
- (BOOL)flipAffordanceHovered;
- (BOOL)flipAffordancePressed;
- (BOOL)hasBody;
- (BOOL)pageNumberHovered;
- (BOOL)pageNumberPressed;
- (CGRect)flipGlyphFrame;
- (CGRect)pageNumberLabelFrame;
- (CGSize)p_shadowOffsetForCurrentScreenScale;
- (NSArray)interactiveLayers;
- (THNoteCardLayoutContext)layoutContext;
- (double)p_borderWidthForCurrentScreenScale;
- (double)p_shadowRadiusForCurrentScreenScale;
- (id).cxx_construct;
- (id)initBackContentLayerWithDarkMode:(BOOL)a3;
- (id)initFrontContentLayerWithDarkMode:(BOOL)a3;
- (id)p_borderColorForCurrentScreenScale;
- (id)p_commonInit:(BOOL)a3 darkMode:(BOOL)a4;
- (void)clearContents;
- (void)dealloc;
- (void)layoutSublayers;
- (void)p_setupBackground;
- (void)p_setupBodyScrollLayer;
- (void)p_setupBorder;
- (void)p_setupCardNumberLabel;
- (void)p_setupColorBar;
- (void)p_setupFlipLabel;
- (void)p_setupPageNumberLabel;
- (void)p_setupTitleLabel;
- (void)p_updateFlipAffordanceDisplay;
- (void)p_updatePageNumberDisplay;
- (void)reset;
- (void)setBodyLayer:(id)a3;
- (void)setCardNumberString:(id)a3;
- (void)setColorBarColor:(CGColor *)a3;
- (void)setContentsScale:(double)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setDisplayAttributes:(_THNoteCardDisplayAttributes)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setFlipAffordanceHovered:(BOOL)a3;
- (void)setFlipAffordancePressed:(BOOL)a3;
- (void)setLayoutContext:(id)a3;
- (void)setPageNumber:(id)a3;
- (void)setPageNumberHovered:(BOOL)a3;
- (void)setPageNumberPressed:(BOOL)a3;
- (void)setShowFlipGlyph:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation THNoteCardContentLayer

- (id)p_commonInit:(BOOL)a3 darkMode:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THNoteCardContentLayer;
  v6 = [(THNoteCardContentLayer *)&v8 init];
  if (v6)
  {
    TSDRectWithSize();
    -[THNoteCardContentLayer setFrame:](v6, "setFrame:");
    v6->_isBackLayer = a3;
    v6->_darkMode = a4;
    [(THNoteCardContentLayer *)v6 p_setupBackground];
    [(THNoteCardContentLayer *)v6 p_setupBorder];
    [(THNoteCardContentLayer *)v6 p_setupBodyScrollLayer];
    [(THNoteCardContentLayer *)v6 p_setupTitleLabel];
    [(THNoteCardContentLayer *)v6 p_setupPageNumberLabel];
    [(THNoteCardContentLayer *)v6 p_setupCardNumberLabel];
    [(THNoteCardContentLayer *)v6 p_setupFlipLabel];
    [(THNoteCardContentLayer *)v6 p_setupColorBar];
  }
  return v6;
}

- (id)initFrontContentLayerWithDarkMode:(BOOL)a3
{
  return [(THNoteCardContentLayer *)self p_commonInit:0 darkMode:a3];
}

- (id)initBackContentLayerWithDarkMode:(BOOL)a3
{
  return [(THNoteCardContentLayer *)self p_commonInit:1 darkMode:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardContentLayer;
  [(THNoteCardContentLayer *)&v3 dealloc];
}

- (void)reset
{
}

- (void)clearContents
{
  [(THNoteCardContentLayer *)self setBodyLayer:0];
  [(THMultiLineLabel *)self->_titleLabel setText:&stru_46D7E8];
  [(THMultiLineLabel *)self->_pageNumberLabel setText:&stru_46D7E8];
  [(THMultiLineLabel *)self->_flipLabel setHidden:1];
  [(THMultiLineLabel *)self->_cardNumberLabel setText:&stru_46D7E8];
  colorBarLayer = self->_colorBarLayer;

  [(CALayer *)colorBarLayer setBackgroundColor:0];
}

- (void)setBodyLayer:(id)a3
{
  bodyLayer = self->_bodyLayer;
  if (bodyLayer != a3)
  {

    v6 = (THNoteCardBodyLayer *)a3;
    self->_bodyLayer = v6;
    [(THNoteCardBodyLayer *)v6 setLayoutContext:self->_layoutContext];
    [(THInteractiveScrollLayer *)self->_bodyScrollLayer setContentLayer:self->_bodyLayer];
    [(THNoteCardContentLayer *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  [(THMultiLineLabel *)self->_titleLabel setText:a3];

  [(THNoteCardContentLayer *)self setNeedsLayout];
}

- (void)setCardNumberString:(id)a3
{
  [(THMultiLineLabel *)self->_cardNumberLabel setText:a3];

  [(THNoteCardContentLayer *)self setNeedsLayout];
}

- (void)setPageNumber:(id)a3
{
  -[THMultiLineLabel setText:](self->_pageNumberLabel, "setText:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"page %@" value:&stru_46D7E8 table:0], a3));

  [(THNoteCardContentLayer *)self setNeedsLayout];
}

- (CGRect)pageNumberLabelFrame
{
  [(THNoteCardContentLayer *)self layoutIfNeeded];
  pageNumberLabel = self->_pageNumberLabel;

  [(THMultiLineLabel *)pageNumberLabel frame];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setPageNumberHovered:(BOOL)a3
{
  self->_pageNumberHovered = a3;
  [(THNoteCardContentLayer *)self p_updatePageNumberDisplay];
}

- (void)setPageNumberPressed:(BOOL)a3
{
  self->_pageNumberPressed = a3;
  [(THNoteCardContentLayer *)self p_updatePageNumberDisplay];
}

- (void)setFlipAffordanceHovered:(BOOL)a3
{
  self->_flipAffordanceHovered = a3;
  [(THNoteCardContentLayer *)self p_updateFlipAffordanceDisplay];
}

- (void)setFlipAffordancePressed:(BOOL)a3
{
  self->_flipAffordancePressed = a3;
  [(THNoteCardContentLayer *)self p_updateFlipAffordanceDisplay];
}

- (void)setColorBarColor:(CGColor *)a3
{
}

- (void)setShowFlipGlyph:(BOOL)a3
{
}

- (BOOL)hasBody
{
  return self->_bodyLayer != 0;
}

- (CGRect)flipGlyphFrame
{
  [(THNoteCardContentLayer *)self layoutIfNeeded];
  flipLabel = self->_flipLabel;

  [(THMultiLineLabel *)flipLabel frame];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setLayoutContext:(id)a3
{
  layoutContext = self->_layoutContext;
  if (layoutContext != a3)
  {

    self->_layoutContext = (THNoteCardLayoutContext *)a3;
    [(THNoteCardBodyLayer *)self->_bodyLayer setLayoutContext:a3];
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardShadowOpacity];
    *(float *)&double v6 = v6;
    [(CALayer *)self->_backgroundLayer setShadowOpacity:v6];
    [(THNoteCardContentLayer *)self p_shadowOffsetForCurrentScreenScale];
    -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
    [(THNoteCardContentLayer *)self p_shadowRadiusForCurrentScreenScale];
    -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
    [a3 textScale];
    -[THMultiLineLabel setScale:](self->_titleLabel, "setScale:");
    [a3 textScale];
    -[THMultiLineLabel setScale:](self->_pageNumberLabel, "setScale:");
    [a3 textScale];
    -[THMultiLineLabel setScale:](self->_cardNumberLabel, "setScale:");
    [a3 textScale];
    -[THMultiLineLabel setScale:](self->_flipLabel, "setScale:");
    [(THNoteCardContentLayer *)self setNeedsLayout];
  }
}

- (NSArray)interactiveLayers
{
  [(THNoteCardContentLayer *)self layoutIfNeeded];
  objc_super v3 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", self->_bodyScrollLayer, 0);
  double v4 = [(THNoteCardBodyLayer *)self->_bodyLayer interactiveLayers];
  if (v4) {
    [(NSMutableArray *)v3 addObjectsFromArray:v4];
  }
  return &v3->super;
}

- (void)setDisplayAttributes:(_THNoteCardDisplayAttributes)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  unint64_t v7 = *(void *)&a3.drawBorder;
  if (!self->_backgroundLayer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer setDisplayAttributes:animated:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm") lineNumber:245 description:@"invalid nil value for '%s'", "_backgroundLayer"];
  }
  if (!self->_borderLayer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer setDisplayAttributes:animated:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm") lineNumber:246 description:@"invalid nil value for '%s'", "_borderLayer"];
  }
  v9 = THNoteCardBackgroundColor([(THNoteCardContentLayer *)self darkMode]);
  if ((v7 & 0x1000000) != 0) {
    v9 = THNoteDarkenBackgroundColor([(THNoteCardContentLayer *)self darkMode]);
  }
  v10 = v9;
  [(THNoteCardContentLayer *)self setShowFlipGlyph:(v7 >> 16) & 1];
  if ((v7 & 0x100000000) != 0) {
    v10 = THNoteDarkerBackgroundColor([(THNoteCardContentLayer *)self darkMode]);
  }
  if (v7) {
    id v11 = [(THNoteCardContentLayer *)self p_borderColorForCurrentScreenScale];
  }
  else {
    id v11 = +[TSUColor clearColor];
  }
  v12 = v11;
  if ((v7 & 0x100) != 0) {
    id v13 = +[TSUColor blackColor];
  }
  else {
    id v13 = +[TSUColor clearColor];
  }
  v14 = v13;
  if (v6)
  {
    v15 = +[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    [(CABasicAnimation *)v15 setFromValue:[(CALayer *)self->_backgroundLayer backgroundColor]];
    [(CABasicAnimation *)v15 setToValue:[(TSUColor *)v10 CGColor]];
    v16 = +[CABasicAnimation animationWithKeyPath:@"shadowColor"];
    [(CABasicAnimation *)v16 setFromValue:[(CALayer *)self->_backgroundLayer shadowColor]];
    -[CABasicAnimation setToValue:](v16, "setToValue:", [v14 CGColor]);
    id v17 = +[CAAnimationGroup animation];
    [v17 setAnimations:[NSArray arrayWithObjects:v15, v16, 0]];
    [v17 setDuration:a5];
    [(CALayer *)self->_backgroundLayer addAnimation:v17 forKey:@"displayAttributes"];
    v18 = +[CABasicAnimation animationWithKeyPath:@"borderColor"];
    [(CABasicAnimation *)v18 setFromValue:[(CALayer *)self->_borderLayer borderColor]];
    -[CABasicAnimation setToValue:](v18, "setToValue:", [v12 CGColor]);
    [(CABasicAnimation *)v18 setDuration:a5];
    [(CALayer *)self->_borderLayer addAnimation:v18 forKey:@"displayAttributes"];
  }
  [(CALayer *)self->_backgroundLayer setBackgroundColor:[(TSUColor *)v10 CGColor]];
  -[CALayer setShadowColor:](self->_backgroundLayer, "setShadowColor:", [v14 CGColor]);
  -[CALayer setBorderColor:](self->_borderLayer, "setBorderColor:", [v12 CGColor]);
  *(_WORD *)&self->_displayAttributes.drawBorder = v7;
  self->_displayAttributes.drawFlipGlyph = BYTE2(v7);
  self->_displayAttributes.darkenBackground = BYTE3(v7);
  self->_displayAttributes.useDarkerBackground = BYTE4(v7);
}

- (void)setDarkMode:(BOOL)a3
{
  if (self->_darkMode != a3)
  {
    self->_darkMode = a3;
    [(THNoteCardContentLayer *)self setDisplayAttributes:*(unsigned int *)&self->_displayAttributes.drawBorder | ((unint64_t)self->_displayAttributes.useDarkerBackground << 32) animated:0 duration:0.0];
    [(THMultiLineLabel *)self->_titleLabel setTextColor:THNoteCardHeaderColor([(THNoteCardContentLayer *)self darkMode])];
    [(THMultiLineLabel *)self->_pageNumberLabel setTextColor:THNoteCardHeaderColor([(THNoteCardContentLayer *)self darkMode])];
    [(THMultiLineLabel *)self->_cardNumberLabel setTextColor:THNoteCardFooterColor([(THNoteCardContentLayer *)self darkMode])];
    [(THNoteCardContentLayer *)self p_updateFlipAffordanceDisplay];
  }
}

- (void)layoutSublayers
{
  v97.receiver = self;
  v97.super_class = (Class)THNoteCardContentLayer;
  [(THNoteCardContentLayer *)&v97 layoutSublayers];
  UIUserInterfaceLayoutDirection v3 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
  [(THNoteCardContentLayer *)self bounds];
  double v5 = v4;
  double v7 = v6;
  -[CALayer setFrame:](self->_borderLayer, "setFrame:");
  [(CALayer *)self->_borderLayer frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CALayer *)self->_borderLayer borderWidth];
  CGFloat v17 = v16;
  [(CALayer *)self->_borderLayer borderWidth];
  CGFloat v19 = v18;
  v98.origin.x = v9;
  v98.origin.y = v11;
  v98.size.width = v13;
  v98.size.height = v15;
  CGRect v99 = CGRectInset(v98, v17, v19);
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
  [(CALayer *)self->_backgroundLayer bounds];
  [(CALayer *)self->_backgroundLayer setShadowPath:[+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:") CGPath]];
  unsigned int v20 = [(THNoteCardBodyLayer *)self->_bodyLayer shouldForceCentered];
  layoutContext = self->_layoutContext;
  if (v20)
  {
    [(THNoteCardLayoutContext *)layoutContext noteCardBodyWidth];
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardBodyHeight];
  }
  else
  {
    [(THNoteCardLayoutContext *)layoutContext noteCardBodyLeftMargin];
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardBodyTopMargin];
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardBodyWidth];
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardBodyHeight];
  TSDRoundedRect();
  -[THInteractiveScrollLayer setFrame:](self->_bodyScrollLayer, "setFrame:");
  [(THInteractiveScrollLayer *)self->_bodyScrollLayer bounds];
  -[THNoteCardBodyLayer setFrame:](self->_bodyLayer, "setFrame:");
  [(THNoteCardBodyLayer *)self->_bodyLayer sizeToFit];
  [(THMultiLineLabel *)self->_pageNumberLabel resizeToFitTightly];
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardRightMargin];
    double v23 = v22;
  }
  else
  {
    [(THMultiLineLabel *)self->_pageNumberLabel bounds];
    double v25 = v5 - v24;
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardRightMargin];
    double v23 = v25 - v26;
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardHeaderBaselineOffset];
  double v28 = v27;
  [(THMultiLineLabel *)self->_pageNumberLabel firstLineAscent];
  -[THMultiLineLabel setPosition:](self->_pageNumberLabel, "setPosition:", v23, v28 - v29);
  [(THMultiLineLabel *)self->_pageNumberLabel frame];
  CGRect v101 = CGRectIntegral(v100);
  -[THMultiLineLabel setFrame:](self->_pageNumberLabel, "setFrame:", v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
  [(THMultiLineLabel *)self->_titleLabel resizeToFitTightly];
  [(THMultiLineLabel *)self->_titleLabel frame];
  double v31 = v30;
  CGFloat v33 = v32;
  [(THMultiLineLabel *)self->_pageNumberLabel bounds];
  double v35 = v5 - v34;
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
  double v37 = v35 - v36;
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardRightMargin];
  double v39 = v37 - v38;
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardSectionTitlePaddingToPageNumber];
  double v41 = v39 - v40;
  if (v31 >= v41) {
    double v31 = v41;
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v43 = v5 - v31 - v42;
  }
  else {
    double v43 = v42;
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardHeaderBaselineOffset];
  double v45 = v44;
  [(THMultiLineLabel *)self->_titleLabel firstLineAscent];
  v102.origin.y = v45 - v46;
  v102.origin.x = v43;
  v102.size.width = v31;
  v102.size.height = v33;
  CGRect v103 = CGRectIntegral(v102);
  -[THMultiLineLabel setFrame:](self->_titleLabel, "setFrame:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
  [(THMultiLineLabel *)self->_cardNumberLabel resizeToFitTightly];
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    [(THMultiLineLabel *)self->_cardNumberLabel bounds];
    double v48 = v5 - v47;
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
    double v50 = v48 - v49;
  }
  else
  {
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
    double v50 = v51;
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardFooterBaselineOffset];
  double v53 = v7 - v52;
  [(THMultiLineLabel *)self->_cardNumberLabel firstLineAscent];
  -[THMultiLineLabel setPosition:](self->_cardNumberLabel, "setPosition:", v50, v53 - v54);
  [(THMultiLineLabel *)self->_cardNumberLabel frame];
  CGRect v105 = CGRectIntegral(v104);
  -[THMultiLineLabel setFrame:](self->_cardNumberLabel, "setFrame:", v105.origin.x, v105.origin.y, v105.size.width, v105.size.height);
  [(THMultiLineLabel *)self->_flipLabel resizeToFitTightly];
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
    double v56 = v55;
  }
  else
  {
    [(THMultiLineLabel *)self->_flipLabel bounds];
    double v58 = v5 - v57;
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
    double v56 = v58 - v59;
  }
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardFooterBaselineOffset];
  double v61 = v7 - v60;
  [(THMultiLineLabel *)self->_flipLabel firstLineAscent];
  -[THMultiLineLabel setPosition:](self->_flipLabel, "setPosition:", v56, v61 - v62);
  [(THMultiLineLabel *)self->_flipLabel frame];
  CGRect v107 = CGRectIntegral(v106);
  -[THMultiLineLabel setFrame:](self->_flipLabel, "setFrame:", v107.origin.x, v107.origin.y, v107.size.width, v107.size.height);
  [(THNoteCardBodyLayer *)self->_bodyLayer contentFrame];
  -[THNoteCardContentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", self->_bodyLayer);
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  [(THInteractiveScrollLayer *)self->_bodyScrollLayer frame];
  CGFloat v95 = v72;
  CGFloat v96 = v71;
  CGFloat v94 = v73;
  double v75 = v74;
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardColorBarPaddingFromScrollBottom];
  double v77 = v76;
  v78 = self->_layoutContext;
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    [(THNoteCardLayoutContext *)v78 noteCardColorBarWidth];
    double v80 = v5 - v79;
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardLeftMargin];
    double v82 = v80 - v81;
  }
  else
  {
    [(THNoteCardLayoutContext *)v78 noteCardLeftMargin];
  }
  double v93 = v82;
  [(THNoteCardLayoutContext *)self->_layoutContext noteCardColorBarWidth];
  double v92 = v83;
  v108.origin.x = v64;
  v108.origin.y = v66;
  v108.size.width = v68;
  v108.size.height = v70;
  CGFloat recta = v70;
  CGFloat v84 = v68;
  CGFloat v85 = v66;
  CGFloat v86 = v64;
  double MinY = CGRectGetMinY(v108);
  v109.origin.x = v96;
  v109.origin.y = v95;
  v109.size.width = v94;
  v109.size.height = v75 - v77;
  CGFloat v88 = fmax(MinY, CGRectGetMinY(v109));
  v110.origin.x = v86;
  v110.origin.y = v85;
  v110.size.width = v84;
  v110.size.height = recta;
  double MaxY = CGRectGetMaxY(v110);
  v111.origin.x = v96;
  v111.origin.y = v95;
  v111.size.width = v94;
  v111.size.height = v75 - v77;
  double v90 = fmin(MaxY, CGRectGetMaxY(v111));
  v112.size.height = 0.0;
  v112.origin.x = v93;
  v112.origin.y = v88;
  v112.size.width = v92;
  -[CALayer setFrame:](self->_colorBarLayer, "setFrame:", v93, v88, v92, v90 - CGRectGetMinY(v112));
}

- (void)setContentsScale:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNoteCardContentLayer;
  [(THNoteCardContentLayer *)&v4 setContentsScale:a3];
  [(THNoteCardContentLayer *)self p_borderWidthForCurrentScreenScale];
  -[CALayer setBorderWidth:](self->_borderLayer, "setBorderWidth:");
  if (self->_displayAttributes.drawBorder) {
    -[self->_borderLayer setBorderColor:[self p_borderColorForCurrentScreenScale]];
  }
  [(THNoteCardContentLayer *)self p_shadowOffsetForCurrentScreenScale];
  -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
  [(THNoteCardContentLayer *)self p_shadowRadiusForCurrentScreenScale];
  -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
  [(THNoteCardContentLayer *)self setNeedsLayout];
}

- (void)p_setupBackground
{
  if (!self->_backgroundLayer
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer p_setupBackground]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 456, @"expected nil value for '%s'", "_backgroundLayer"), !self->_backgroundLayer))
  {
    self->_backgroundLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(CALayer *)self->_backgroundLayer setBackgroundColor:[(TSUColor *)THNoteCardBackgroundColor([(THNoteCardContentLayer *)self darkMode]) CGColor]];
    -[self->_backgroundLayer setShadowColor:[+[TSUColor blackColor](TSUColor, "blackColor") CGColor]];
    [(THNoteCardLayoutContext *)self->_layoutContext noteCardShadowOpacity];
    *(float *)&double v3 = v3;
    [(CALayer *)self->_backgroundLayer setShadowOpacity:v3];
    [(THNoteCardContentLayer *)self p_shadowOffsetForCurrentScreenScale];
    -[CALayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:");
    [(THNoteCardContentLayer *)self p_shadowRadiusForCurrentScreenScale];
    -[CALayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:");
    [(THNoteCardContentLayer *)self addSublayer:self->_backgroundLayer];
    [(THNoteCardContentLayer *)self setNeedsLayout];
  }
}

- (void)p_setupBorder
{
  if (!self->_borderLayer
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardContentLayer p_setupBorder]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardContentLayer.mm"), 475, @"expected nil value for '%s'", "_borderLayer"), !self->_borderLayer))
  {
    self->_borderLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(THNoteCardContentLayer *)self p_borderWidthForCurrentScreenScale];
    -[CALayer setBorderWidth:](self->_borderLayer, "setBorderWidth:");
    [self->_borderLayer setBorderColor:[self p_borderColorForCurrentScreenScale]];
    [(THNoteCardContentLayer *)self addSublayer:self->_borderLayer];
    [(THNoteCardContentLayer *)self setNeedsLayout];
  }
}

- (void)p_setupBodyScrollLayer
{
  double v3 = objc_alloc_init(THInteractiveScrollLayer);
  self->_bodyScrollLayer = v3;
  [(THNoteCardContentLayer *)self addSublayer:v3];

  [(THNoteCardContentLayer *)self setNeedsLayout];
}

- (void)p_setupTitleLabel
{
  double v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_titleLabel = v3;
  [(THMultiLineLabel *)v3 setAlignment:4];
  [(THMultiLineLabel *)self->_titleLabel setDelegate:self];
  -[THMultiLineLabel setAnchorPoint:](self->_titleLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(THMultiLineLabel *)self->_titleLabel setFont:+[TSUFont systemFontOfSize:21.0]];
  [(THMultiLineLabel *)self->_titleLabel setTextColor:THNoteCardHeaderColor([(THNoteCardContentLayer *)self darkMode])];
  [(THNoteCardLayoutContext *)self->_layoutContext textScale];
  -[THMultiLineLabel setScale:](self->_titleLabel, "setScale:");
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_titleLabel, "setContentsScale:");
  titleLabel = self->_titleLabel;

  [(THNoteCardContentLayer *)self addSublayer:titleLabel];
}

- (void)p_setupPageNumberLabel
{
  double v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_pageNumberLabel = v3;
  [(THMultiLineLabel *)v3 setAlignment:4];
  [(THMultiLineLabel *)self->_pageNumberLabel setDelegate:self];
  -[THMultiLineLabel setAnchorPoint:](self->_pageNumberLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(THMultiLineLabel *)self->_pageNumberLabel setFont:+[TSUFont systemFontOfSize:21.0]];
  [(THMultiLineLabel *)self->_pageNumberLabel setTextColor:THNoteCardHeaderColor([(THNoteCardContentLayer *)self darkMode])];
  [(THNoteCardLayoutContext *)self->_layoutContext textScale];
  -[THMultiLineLabel setScale:](self->_pageNumberLabel, "setScale:");
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_pageNumberLabel, "setContentsScale:");
  [(THNoteCardContentLayer *)self addSublayer:self->_pageNumberLabel];

  [(THNoteCardContentLayer *)self p_updatePageNumberDisplay];
}

- (void)p_setupCardNumberLabel
{
  double v3 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->_cardNumberLabel = v3;
  [(THMultiLineLabel *)v3 setAlignment:4];
  [(THMultiLineLabel *)self->_cardNumberLabel setDelegate:self];
  -[THMultiLineLabel setAnchorPoint:](self->_cardNumberLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(THMultiLineLabel *)self->_cardNumberLabel setFont:+[TSUFont systemFontOfSize:25.0]];
  [(THMultiLineLabel *)self->_cardNumberLabel setTextColor:THNoteCardFooterColor([(THNoteCardContentLayer *)self darkMode])];
  [(THNoteCardLayoutContext *)self->_layoutContext textScale];
  -[THMultiLineLabel setScale:](self->_cardNumberLabel, "setScale:");
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_cardNumberLabel, "setContentsScale:");
  cardNumberLabel = self->_cardNumberLabel;

  [(THNoteCardContentLayer *)self addSublayer:cardNumberLabel];
}

- (void)p_setupFlipLabel
{
  double v3 = objc_alloc_init(THMultiLineLabel);
  self->_flipLabel = v3;
  [(THMultiLineLabel *)v3 setAlignment:4];
  [(THMultiLineLabel *)self->_flipLabel setDelegate:self];
  -[THMultiLineLabel setAnchorPoint:](self->_flipLabel, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(THMultiLineLabel *)self->_flipLabel setFont:+[TSUFont systemFontOfSize:25.0]];
  [(THMultiLineLabel *)self->_flipLabel setTextColor:THNoteCardFooterFlipCardColor([(THNoteCardContentLayer *)self darkMode])];
  [(THNoteCardLayoutContext *)self->_layoutContext textScale];
  -[THMultiLineLabel setScale:](self->_flipLabel, "setScale:");
  -[THMultiLineLabel setText:](self->_flipLabel, "setText:", [(id)THBundle() localizedStringForKey:@"Flip Card" value:&stru_46D7E8 table:0]);
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_flipLabel, "setContentsScale:");
  [(THNoteCardContentLayer *)self addSublayer:self->_flipLabel];

  [(THNoteCardContentLayer *)self p_updateFlipAffordanceDisplay];
}

- (void)p_setupColorBar
{
  double v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
  self->_colorBarLayer = v3;
  [(CALayer *)v3 setDelegate:self];
  colorBarLayer = self->_colorBarLayer;

  [(THNoteCardContentLayer *)self addSublayer:colorBarLayer];
}

- (void)p_updatePageNumberDisplay
{
  if ([(THNoteCardContentLayer *)self pageNumberHovered])
  {
    unsigned int v3 = [(THNoteCardContentLayer *)self pageNumberPressed];
    int v4 = [(THNoteCardContentLayer *)self darkMode];
    if (v3) {
      double v5 = THNoteCardPressedTextColor(v4);
    }
    else {
      double v5 = THNoteCardHoveredTextColor(v4);
    }
  }
  else
  {
    double v5 = THNoteCardHeaderColor([(THNoteCardContentLayer *)self darkMode]);
  }
  double v6 = v5;
  pageNumberLabel = self->_pageNumberLabel;

  [(THMultiLineLabel *)pageNumberLabel setTextColor:v6];
}

- (void)p_updateFlipAffordanceDisplay
{
  unsigned int v3 = [(THNoteCardContentLayer *)self flipAffordancePressed];
  int v4 = [(THNoteCardContentLayer *)self darkMode];
  if (v3) {
    double v5 = THNoteCardPressedTextColor(v4);
  }
  else {
    double v5 = THNoteCardFooterFlipCardColor(v4);
  }
  double v6 = v5;
  flipLabel = self->_flipLabel;

  [(THMultiLineLabel *)flipLabel setTextColor:v6];
}

- (id)p_borderColorForCurrentScreenScale
{
  [(THNoteCardContentLayer *)self contentsScale];
  BOOL v4 = v3 > 1.0;
  int v5 = [(THNoteCardContentLayer *)self darkMode];

  return THNoteCardBorderColor(v5, v4);
}

- (double)p_borderWidthForCurrentScreenScale
{
  [(THNoteCardContentLayer *)self contentsScale];
  return 1.0 / v2;
}

- (CGSize)p_shadowOffsetForCurrentScreenScale
{
  layoutContext = self->_layoutContext;
  [(THNoteCardContentLayer *)self contentsScale];

  -[THNoteCardLayoutContext noteCardShadowOffsetForScreenScale:](layoutContext, "noteCardShadowOffsetForScreenScale:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)p_shadowRadiusForCurrentScreenScale
{
  layoutContext = self->_layoutContext;
  [(THNoteCardContentLayer *)self contentsScale];

  -[THNoteCardLayoutContext noteCardShadowRadiusForScreenScale:](layoutContext, "noteCardShadowRadiusForScreenScale:");
  return result;
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (BOOL)pageNumberHovered
{
  return self->_pageNumberHovered;
}

- (BOOL)pageNumberPressed
{
  return self->_pageNumberPressed;
}

- (BOOL)flipAffordanceHovered
{
  return self->_flipAffordanceHovered;
}

- (BOOL)flipAffordancePressed
{
  return self->_flipAffordancePressed;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 24) = 257;
  *((unsigned char *)self + 100) = 0;
  return self;
}

@end
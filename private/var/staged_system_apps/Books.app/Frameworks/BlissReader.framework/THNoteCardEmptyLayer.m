@interface THNoteCardEmptyLayer
- (BOOL)shouldForceCentered;
- (CGSize)sizeThatFits:(CGSize)a3;
- (THNoteCardEmptyLayer)initWithStudyOptions:(id)a3 unfilteredContentAvailable:(BOOL)a4 darkMode:(BOOL)a5;
- (id)interactiveLayers;
- (void)dealloc;
- (void)layoutSublayers;
- (void)p_setupHeadingLabel:(id)a3 bodyLabel:(id)a4;
- (void)p_setupWhenUnfilteredContentIsAvailable;
- (void)p_setupWhenUnfilteredContentIsNotAvailable;
- (void)setLayoutContext:(id)a3;
- (void)viewAllCards:(id)a3;
@end

@implementation THNoteCardEmptyLayer

- (THNoteCardEmptyLayer)initWithStudyOptions:(id)a3 unfilteredContentAvailable:(BOOL)a4 darkMode:(BOOL)a5
{
  BOOL v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)THNoteCardEmptyLayer;
  v8 = [(THNoteCardEmptyLayer *)&v10 init];
  if (v8)
  {
    v8->_studyOptions = (THStudyOptions *)a3;
    v8->_isUnfilteredContentAvailable = v6;
    v8->_darkMode = a5;
    if (v6) {
      [(THNoteCardEmptyLayer *)v8 p_setupWhenUnfilteredContentIsAvailable];
    }
    else {
      [(THNoteCardEmptyLayer *)v8 p_setupWhenUnfilteredContentIsNotAvailable];
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardEmptyLayer;
  [(THNoteCardBodyLayer *)&v3 dealloc];
}

- (void)setLayoutContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNoteCardEmptyLayer;
  [(THNoteCardBodyLayer *)&v5 setLayoutContext:"setLayoutContext:"];
  [a3 scale];
  -[THMultiLineLabel setScale:](self->_headingLabel, "setScale:");
  [a3 scale];
  -[THMultiLineLabel setScale:](self->_bodyLabel, "setScale:");
  [a3 scale];
  -[THInteractiveButtonLayer setScale:](self->_viewAllCardsButton, "setScale:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] noteCardBodyHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (id)interactiveLayers
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_viewAllCardsButton, 0);
}

- (BOOL)shouldForceCentered
{
  return 1;
}

- (void)layoutSublayers
{
  v33.receiver = self;
  v33.super_class = (Class)THNoteCardEmptyLayer;
  [(THNoteCardEmptyLayer *)&v33 layoutSublayers];
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] scale];
  double v4 = v3 + v3;
  double v28 = v3;
  double v29 = v3 + v3;
  [(THNoteCardEmptyLayer *)self frame];
  -[THMultiLineLabel setFrame:](self->_headingLabel, "setFrame:");
  [(THNoteCardEmptyLayer *)self frame];
  -[THMultiLineLabel setFrame:](self->_bodyLabel, "setFrame:");
  [(THMultiLineLabel *)self->_headingLabel resizeToFitCurrentWidth];
  [(THMultiLineLabel *)self->_bodyLabel resizeToFitCurrentWidth];
  [(THMultiLineLabel *)self->_headingLabel bounds];
  double v6 = v5;
  double v8 = v7;
  [(THMultiLineLabel *)self->_bodyLabel bounds];
  CGFloat v31 = v10;
  double v32 = v9;
  double v11 = v10;
  [(THNoteCardEmptyLayer *)self frame];
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  double v16 = v4 + v8 + v11;
  CGFloat v17 = (CGRectGetWidth(v34) - v6) * 0.5;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v18 = (CGRectGetHeight(v35) - v16) * 0.5;
  v36.origin.CGFloat x = v17;
  v36.origin.CGFloat y = v18;
  v36.size.CGFloat width = v6;
  v36.size.CGFloat height = v8;
  CGRect v37 = CGRectIntegral(v36);
  -[THMultiLineLabel setFrame:](self->_headingLabel, "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  CGFloat v27 = height;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat v19 = (CGRectGetWidth(v38) - v32) * 0.5;
  v39.origin.CGFloat x = v17;
  v39.origin.CGFloat y = v18;
  v39.size.CGFloat width = v6;
  v39.size.CGFloat height = v8;
  CGFloat MaxY = CGRectGetMaxY(v39);
  v40.size.CGFloat height = v31;
  double v21 = v29 + MaxY;
  CGFloat v30 = v19;
  v40.origin.CGFloat x = v19;
  v40.origin.CGFloat y = v21;
  v40.size.CGFloat width = v32;
  CGRect v41 = CGRectIntegral(v40);
  -[THMultiLineLabel setFrame:](self->_bodyLabel, "setFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  if (self->_viewAllCardsButton)
  {
    TSDMultiplySizeScalar();
    double v23 = v22;
    CGFloat v25 = v24;
    v42.size.CGFloat height = v27;
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    CGFloat v26 = (CGRectGetWidth(v42) - v23) * 0.5;
    v43.origin.CGFloat x = v30;
    v43.size.CGFloat height = v31;
    v43.origin.CGFloat y = v21;
    v43.size.CGFloat width = v32;
    v44.origin.CGFloat y = v28 * 93.0 + CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v26;
    v44.size.CGFloat width = v23;
    v44.size.CGFloat height = v25;
    CGRect v45 = CGRectIntegral(v44);
    -[THInteractiveButtonLayer setFrame:](self->_viewAllCardsButton, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  }
}

- (void)viewAllCards:(id)a3
{
}

- (void)p_setupWhenUnfilteredContentIsAvailable
{
  id v3 = [(id)THBundle() localizedStringForKey:@"To view your study cards\\U002C tap View All Cards\\U002C\nor tap the gear icon for more options." value:&stru_46D7E8 table:0];
  -[THNoteCardEmptyLayer p_setupHeadingLabel:bodyLabel:](self, "p_setupHeadingLabel:bodyLabel:", [(id)THBundle() localizedStringForKey:@"You\\U2019ve hidden all study cards." value:&stru_46D7E8 table:0], v3);
  self->_viewAllCardsButton = objc_alloc_init(THInteractiveButtonLayer);
  id v4 = [(id)THBundle() localizedStringForKey:@"View All Cards" value:&stru_46D7E8 table:0];
  id v5 = +[TSUFont systemFontOfSize:14.0];
  objc_msgSend(v4, "sizeWithAttributes:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v5, "platformFont"), NSFontAttributeName, 0));
  self->_buttonSize.CGFloat width = ceil(v6) + 34.0;
  self->_buttonSize.CGFloat height = 35.0;
  -[self->_viewAllCardsButton setNormalBackgroundImage:[TSUImage imageNamed:@"NoNotes-Button-N" inBundle:TSUImage stretchedImageOfSize:self->_buttonSize.width leftCapWidth:self->_buttonSize.height rightCapWidth:10.0 topCapHeight:10.0 bottomCapHeight:10.0]];
  -[self->_viewAllCardsButton setPressedBackgroundImage:[TSUImage imageNamed:@"NoNotes-Button-P" inBundle:TSUImage] stretchedImageOfSize:self->_buttonSize.width, self->_buttonSize.height, 10.0, 10.0, 10.0, 10.0]];
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTitle:v4];
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTitleFont:v5];
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTitleColor:+[TSUColor colorWithRed:0.57254902 green:0.57254902 blue:0.57254902 alpha:1.0]];
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTitleShadowColor:+[TSUColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5]];
  -[THInteractiveButtonLayer setTitleShadowOffset:](self->_viewAllCardsButton, "setTitleShadowOffset:", 0.0, -1.0);
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTitleShadowBlurRadius:1.0];
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] scale];
  -[THInteractiveButtonLayer setScale:](self->_viewAllCardsButton, "setScale:");
  [(THInteractiveButtonLayer *)self->_viewAllCardsButton setTarget:self action:"viewAllCards:"];
  viewAllCardsButton = self->_viewAllCardsButton;

  [(THNoteCardEmptyLayer *)self addSublayer:viewAllCardsButton];
}

- (void)p_setupWhenUnfilteredContentIsNotAvailable
{
  id v3 = [(id)THBundle() localizedStringForKey:@"This chapter doesn\\U2019t have study cards." value:&stru_46D7E8 table:0];
  id v4 = [(id)THBundle() localizedStringForKey:@"Study cards are only available for chapters with\nhighlights\\U002C notes\\U002C or glossary terms." value:&stru_46D7E8 table:0];

  [(THNoteCardEmptyLayer *)self p_setupHeadingLabel:v3 bodyLabel:v4];
}

- (void)p_setupHeadingLabel:(id)a3 bodyLabel:(id)a4
{
  double v7 = [THMultiLineLabel alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v11 = -[THMultiLineLabel initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  self->_headingLabel = v11;
  [(THMultiLineLabel *)v11 setDelegate:self];
  [(THMultiLineLabel *)self->_headingLabel setText:a3];
  [(THMultiLineLabel *)self->_headingLabel setFont:+[TSUFont systemFontOfSize:50.0]];
  [(THMultiLineLabel *)self->_headingLabel setTextColor:THNoteCardEmptyHeadingTextColor(self->_darkMode)];
  [self->_headingLabel setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
  [(THMultiLineLabel *)self->_headingLabel setAlignment:1];
  [(TSUFont *)[(THMultiLineLabel *)self->_headingLabel font] lineHeight];
  [(THMultiLineLabel *)self->_headingLabel setLineHeight:fmax(v12, 50.0)];
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] scale];
  -[THMultiLineLabel setScale:](self->_headingLabel, "setScale:");
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_headingLabel, "setContentsScale:");
  [(THNoteCardEmptyLayer *)self addSublayer:self->_headingLabel];
  v13 = -[THMultiLineLabel initWithFrame:]([THMultiLineLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  self->_bodyLabel = v13;
  [(THMultiLineLabel *)v13 setDelegate:self];
  [(THMultiLineLabel *)self->_bodyLabel setText:a4];
  [(THMultiLineLabel *)self->_bodyLabel setFont:+[TSUFont systemFontOfSize:25.0]];
  [(THMultiLineLabel *)self->_bodyLabel setTextColor:THNoteCardEmptyBodyTextColor(self->_darkMode)];
  -[self->_bodyLabel setBackgroundColor:[TSUColor clearColor] CGColor]];
  [(THMultiLineLabel *)self->_bodyLabel setAlignment:1];
  [(TSUFont *)[(THMultiLineLabel *)self->_bodyLabel font] lineHeight];
  [(THMultiLineLabel *)self->_bodyLabel setLineHeight:fmax(v14, 33.0)];
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] scale];
  -[THMultiLineLabel setScale:](self->_bodyLabel, "setScale:");
  TSUScreenScale();
  -[THMultiLineLabel setContentsScale:](self->_bodyLabel, "setContentsScale:");
  bodyLabel = self->_bodyLabel;

  [(THNoteCardEmptyLayer *)self addSublayer:bodyLabel];
}

@end
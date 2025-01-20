@interface SiriUIMessageContentTemplateView
- (CGSize)_textBalloonViewBoundingSize;
- (SiriUIMessageContentTemplateView)initWithDataSource:(id)a3;
- (double)desiredHeight;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation SiriUIMessageContentTemplateView

- (SiriUIMessageContentTemplateView)initWithDataSource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriUIMessageContentTemplateView;
  v5 = [(SiriUIBaseTemplateView *)&v12 initWithDataSource:v4];
  if (v5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v6 = (void *)getCKTextBalloonViewClass_softClass;
    uint64_t v17 = getCKTextBalloonViewClass_softClass;
    if (!getCKTextBalloonViewClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getCKTextBalloonViewClass_block_invoke;
      v13[3] = &unk_26469F170;
      v13[4] = &v14;
      __getCKTextBalloonViewClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v8 = [v7 alloc];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id textBalloonView = v5->_textBalloonView;
    v5->_id textBalloonView = (id)v9;

    [v5->_textBalloonView setCanUseOpaqueMask:0];
    [v5->_textBalloonView prepareForDisplayIfNeeded];
    [(SiriUIMessageContentTemplateView *)v5 addSubview:v5->_textBalloonView];
    [(SiriUIMessageContentTemplateView *)v5 reloadData];
  }

  return v5;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SiriUIMessageContentTemplateView;
  [(SiriUIMessageContentTemplateView *)&v14 layoutSubviews];
  [(SiriUIMessageContentTemplateView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v11 templatedContentMargins];

  uint64_t v12 = [(SiriUIMessageContentTemplateView *)self semanticContentAttribute];
  id textBalloonView = self->_textBalloonView;
  [(SiriUIMessageContentTemplateView *)self _textBalloonViewBoundingSize];
  objc_msgSend(textBalloonView, "sizeThatFits:");
  if (v12 != 4)
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    CGRectGetWidth(v15);
  }
  UIRectCenteredYInRect();
  objc_msgSend(self->_textBalloonView, "setFrame:");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIMessageContentTemplateView;
  [(SiriUIMessageContentTemplateView *)&v4 setSemanticContentAttribute:a3];
  objc_msgSend(self->_textBalloonView, "setOrientation:", -[SiriUIMessageContentTemplateView semanticContentAttribute](self, "semanticContentAttribute") != 4);
  [self->_textBalloonView prepareForDisplayIfNeeded];
}

- (double)desiredHeight
{
  id textBalloonView = self->_textBalloonView;
  [(SiriUIMessageContentTemplateView *)self _textBalloonViewBoundingSize];
  objc_msgSend(textBalloonView, "sizeThatFits:");
  return v3 + 88.0;
}

- (void)reloadData
{
  v17[2] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SiriUIMessageContentTemplateView;
  [(SiriUIBaseTemplateView *)&v15 reloadData];
  double v3 = [(SiriUIBaseTemplateView *)self dataSource];
  int v4 = [v3 sentStatus];
  id textBalloonView = self->_textBalloonView;
  id v5 = objc_alloc(MEMORY[0x263F086A0]);
  CGFloat v6 = [v3 content];
  v16[0] = *MEMORY[0x263F1C238];
  double v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v17[0] = v7;
  v16[1] = *MEMORY[0x263F1C240];
  if (v4)
  {
    CGFloat v8 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v9 = 0;
  }
  else
  {
    CGFloat v8 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v9 = 4;
  }
  if (v6) {
    CGFloat v10 = v6;
  }
  else {
    CGFloat v10 = &stru_26D647E48;
  }
  v17[1] = v8;
  v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2, textBalloonView);
  uint64_t v12 = (void *)[v5 initWithString:v10 attributes:v11];
  [v14 setAttributedText:v12];

  [self->_textBalloonView setColor:v9];
  [self->_textBalloonView prepareForDisplayIfNeeded];
  [(SiriUIMessageContentTemplateView *)self setNeedsLayout];
}

- (CGSize)_textBalloonViewBoundingSize
{
  [(SiriUIMessageContentTemplateView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v7 templatedContentMargins];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v4 - (v11 + v15);
  double v17 = v6 - (v9 + v13);
  result.height = v17;
  result.width = v16;
  return result;
}

- (void).cxx_destruct
{
}

@end
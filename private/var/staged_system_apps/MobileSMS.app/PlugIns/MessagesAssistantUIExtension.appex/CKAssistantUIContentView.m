@interface CKAssistantUIContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAssistantUIAvatarView)avatarView;
- (CKAssistantUIContentView)initWithFrame:(CGRect)a3;
- (CKTextBalloonView)balloonView;
- (UIView)chatBackgroundView;
- (UIView)chatView;
- (UIView)keylineView;
- (double)_balloonMaxWidthForBoundsWidth:(double)a3;
- (id)_balloonViewWithText:(id)a3 color:(char)a4;
- (void)layoutSubviews;
- (void)setAvatarView:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setChatBackgroundView:(id)a3;
- (void)setChatContent:(id)a3;
- (void)setChatView:(id)a3;
- (void)setContactsForAvatarView:(id)a3;
- (void)setKeylineView:(id)a3;
- (void)setMessageContent:(id)a3 sent:(BOOL)a4;
- (void)setToFieldText:(id)a3;
@end

@implementation CKAssistantUIContentView

- (CKAssistantUIContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKAssistantUIContentView;
  v7 = -[CKAssistantUIContentView initWithFrame:](&v19, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
    chatBackgroundView = v7->_chatBackgroundView;
    v7->_chatBackgroundView = v8;

    v10 = v7->_chatBackgroundView;
    v11 = +[UIColor whiteColor];
    [(UIView *)v10 setBackgroundColor:v11];

    [(CKAssistantUIContentView *)v7 addSubview:v7->_chatBackgroundView];
    v12 = -[CKAssistantUIAvatarView initWithFrame:]([CKAssistantUIAvatarView alloc], "initWithFrame:", x, y, width, height);
    avatarView = v7->_avatarView;
    v7->_avatarView = v12;

    [(CKAssistantUIContentView *)v7 addSubview:v7->_avatarView];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:x, y, width, height];
    keylineView = v7->_keylineView;
    v7->_keylineView = v14;

    v16 = v7->_keylineView;
    v17 = +[UIColor blackColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(UIView *)v7->_keylineView setAlpha:0.18];
    [(CKAssistantUIContentView *)v7 addSubview:v7->_keylineView];
  }
  return v7;
}

- (void)setToFieldText:(id)a3
{
}

- (void)setContactsForAvatarView:(id)a3
{
}

- (void)setMessageContent:(id)a3 sent:(BOOL)a4
{
  id v9 = a3;
  [(CKTextBalloonView *)self->_balloonView removeFromSuperview];
  balloonView = self->_balloonView;
  self->_balloonView = 0;

  if (!a4)
  {
    v7 = [(CKAssistantUIContentView *)self _balloonViewWithText:v9 color:0xFFFFFFFFLL];
    v8 = self->_balloonView;
    self->_balloonView = v7;

    [(CKAssistantUIContentView *)self addSubview:self->_balloonView];
  }
  [(CKAssistantUIContentView *)self setNeedsLayout];
}

- (void)setChatContent:(id)a3
{
  id v6 = a3;
  chatView = self->_chatView;
  if (chatView)
  {
    [(UIView *)chatView removeFromSuperview];
    v5 = self->_chatView;
    self->_chatView = 0;
  }
  [(CKAssistantUIContentView *)self setChatView:v6];
  [(CKAssistantUIContentView *)self insertSubview:v6 aboveSubview:self->_chatBackgroundView];
  [(CKAssistantUIContentView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKAssistantUIContentView;
  [(CKAssistantUIContentView *)&v22 layoutSubviews];
  [(CKAssistantUIContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[CKAssistantUIAvatarView sizeThatFits:](self->_avatarView, "sizeThatFits:", v7, 1.79769313e308);
  -[CKAssistantUIAvatarView setFrame:](self->_avatarView, "setFrame:", 0.0, 0.0, v8, v9);
  keylineView = self->_keylineView;
  [(CKAssistantUIAvatarView *)self->_avatarView frame];
  double MaxY = CGRectGetMaxY(v23);
  v12 = +[UIScreen mainScreen];
  [v12 scale];
  -[UIView setFrame:](keylineView, "setFrame:", 0.0, MaxY, v8, 1.0 / v13);

  balloonView = self->_balloonView;
  if (balloonView)
  {
    [(CKTextBalloonView *)balloonView prepareForDisplayIfNeeded];
    [(CKAssistantUIContentView *)self _balloonMaxWidthForBoundsWidth:v8];
    -[CKTextBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:");
    double v16 = v15;
    double v18 = v17;
    double v19 = fmax(v8 - v15 + -22.0, 0.0);
    [(UIView *)self->_keylineView frame];
    -[CKTextBalloonView setFrame:](self->_balloonView, "setFrame:", v19, CGRectGetMaxY(v24) + 28.0 + 200.0, v16, v18);
  }
  [(UIView *)self->_keylineView frame];
  double v20 = CGRectGetMaxY(v25) + 200.0;
  -[UIView setFrame:](self->_chatBackgroundView, "setFrame:", v4, v6, v8, v20);
  chatView = self->_chatView;
  if (chatView)
  {
    -[UIView setFrame:](chatView, "setFrame:", v4, v6, v8, v20);
    [(UIView *)self->_chatView setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[CKAssistantUIAvatarView sizeThatFits:](self->_avatarView, "sizeThatFits:");
  double v6 = v5;
  double v8 = v7;
  [(CKAssistantUIContentView *)self _balloonMaxWidthForBoundsWidth:width];
  -[CKTextBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:");
  double v11 = v10 + 56.0;
  if (!self->_balloonView) {
    double v11 = 0.0;
  }
  double v12 = v8 + 200.0 + v11;
  double v13 = v9 + 22.0;
  if (v6 >= v13) {
    double v13 = v6;
  }
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (id)_balloonViewWithText:(id)a3 color:(char)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  double v6 = +[CKUIBehavior sharedBehaviors];
  objc_opt_class();
  double v7 = CKBalloonViewForClass();
  [v7 setHasTail:1];
  [v7 setOrientation:1];
  [v7 setColor:v4];
  [v7 setCanUseOpaqueMask:0];
  id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];

  id v9 = [v8 length];
  double v10 = [v6 balloonTextFont];
  [v8 addAttribute:NSFontAttributeName value:v10 range:0, v9];
  double v11 = [v6 theme];
  double v12 = [v11 balloonTextColorForColorType:[v7 color]];
  [v8 addAttribute:NSForegroundColorAttributeName value:v12 range:0];

  [v7 setAttributedText:v8];
  [v7 prepareForDisplay];

  return v7;
}

- (double)_balloonMaxWidthForBoundsWidth:(double)a3
{
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  [v4 balloonMaxWidthForTranscriptWidth:0 marginInsets:0 shouldShowPluginButtons:0 shouldShowCharacterCount:0 shouldCoverSendButton:a3 isStewieMode:0.0 22.0 0.0 22.0];
  double v6 = v5;

  double result = a3 + -44.0;
  if (v6 < a3 + -44.0) {
    return v6;
  }
  return result;
}

- (CKAssistantUIAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (UIView)keylineView
{
  return self->_keylineView;
}

- (void)setKeylineView:(id)a3
{
}

- (UIView)chatView
{
  return self->_chatView;
}

- (void)setChatView:(id)a3
{
}

- (UIView)chatBackgroundView
{
  return self->_chatBackgroundView;
}

- (void)setChatBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatBackgroundView, 0);
  objc_storeStrong((id *)&self->_chatView, 0);
  objc_storeStrong((id *)&self->_keylineView, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
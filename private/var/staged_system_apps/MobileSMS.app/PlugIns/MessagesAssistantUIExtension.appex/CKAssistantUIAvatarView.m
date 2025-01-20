@interface CKAssistantUIAvatarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAssistantUIAvatarView)initWithFrame:(CGRect)a3;
- (CNAvatarView)avatar;
- (UILabel)toLabel;
- (UIView)blurView;
- (void)layoutSubviews;
- (void)setAvatar:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setContactsForAvatarView:(id)a3;
- (void)setToFieldText:(id)a3;
- (void)setToLabel:(id)a3;
@end

@implementation CKAssistantUIAvatarView

- (CKAssistantUIAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKAssistantUIAvatarView;
  v7 = -[CKAssistantUIAvatarView initWithFrame:](&v22, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
    blurView = v7->_blurView;
    v7->_blurView = v8;

    v10 = +[UIBlurEffect effectWithStyle:0];
    id v11 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v10];
    [v11 setAutoresizingMask:18];
    [(UIView *)v7->_blurView addSubview:v11];
    [(CKAssistantUIAvatarView *)v7 addSubview:v7->_blurView];
    v12 = [objc_alloc((Class)CNAvatarView) initWithFrame:x, y, width, height];
    avatar = v7->_avatar;
    v7->_avatar = v12;

    [(CNAvatarView *)v7->_avatar setAsynchronousRendering:1];
    [(CNAvatarView *)v7->_avatar setUserInteractionEnabled:0];
    [(CNAvatarView *)v7->_avatar setShowsContactOnTap:0];
    [(CKAssistantUIAvatarView *)v7 addSubview:v7->_avatar];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:x, y, width, height];
    toLabel = v7->_toLabel;
    v7->_toLabel = v14;

    v16 = v7->_toLabel;
    v17 = +[UIColor blackColor];
    [(UILabel *)v16 setTextColor:v17];

    v18 = v7->_toLabel;
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 avatarNameFont];
    [(UILabel *)v18 setFont:v20];

    [(UILabel *)v7->_toLabel setTextAlignment:1];
    [(UILabel *)v7->_toLabel setNumberOfLines:1];
    [(CKAssistantUIAvatarView *)v7 addSubview:v7->_toLabel];
  }
  return v7;
}

- (void)setToFieldText:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_toLabel text];
  unsigned __int8 v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_toLabel setText:v6];
    [(CKAssistantUIAvatarView *)self setNeedsLayout];
  }
}

- (void)setContactsForAvatarView:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && [v4 count])
  {
    [(CNAvatarView *)self->_avatar setContacts:v7];
  }
  else
  {
    avatar = self->_avatar;
    id v6 = objc_alloc_init((Class)CNContact);
    [(CNAvatarView *)avatar setContact:v6];
  }
}

- (void)layoutSubviews
{
  [(CKAssistantUIAvatarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = +[CKUIBehavior sharedBehaviors];
  [v11 conversationListContactImageDiameter];
  double v13 = v12;

  -[CNAvatarView setFrame:](self->_avatar, "setFrame:", v8 * 0.5 - v13 * 0.5, 10.0, v13, v13);
  -[UILabel sizeThatFits:](self->_toLabel, "sizeThatFits:", v8 + -40.0, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  toLabel = self->_toLabel;
  double v19 = v8 * 0.5 - v14 * 0.5;
  [(CNAvatarView *)self->_avatar frame];
  -[UILabel setFrame:](toLabel, "setFrame:", v19, CGRectGetMaxY(v22) + 5.0, v15, v17);
  blurView = self->_blurView;

  -[UIView setFrame:](blurView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = +[CKUIBehavior sharedBehaviors];
  [v5 conversationListContactImageDiameter];
  float v7 = v6;

  -[UILabel sizeThatFits:](self->_toLabel, "sizeThatFits:", width + -40.0, 1.79769313e308);
  double v9 = v7 + 5.0 + v8 + 20.0;
  double v10 = width;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (UILabel)toLabel
{
  return self->_toLabel;
}

- (void)setToLabel:(id)a3
{
}

- (CNAvatarView)avatar
{
  return self->_avatar;
}

- (void)setAvatar:(id)a3
{
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_avatar, 0);

  objc_storeStrong((id *)&self->_toLabel, 0);
}

@end
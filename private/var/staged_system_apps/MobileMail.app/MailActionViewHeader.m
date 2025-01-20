@interface MailActionViewHeader
+ (double)defaultHeightWithDisplayMetrics:(id)a3;
- (BOOL)shouldApplySystemLighterMaterial;
- (MailActionViewHeader)initWithFrame:(CGRect)a3;
- (NSArray)senderList;
- (NSString)subject;
- (NSString)title;
- (double)_baselineToBaselineSpacingInConversation;
- (double)_leadingMargin;
- (double)_messageBottomPaddingInConversation;
- (double)_messageTopPaddingInConversation;
- (double)_topToSenderBaselineInConversation;
- (void)_createPrimaryViews;
- (void)_updateFonts;
- (void)_updateLabelColor;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateTitle:(id)a3 subject:(id)a4;
@end

@implementation MailActionViewHeader

- (MailActionViewHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailActionViewHeader;
  v3 = -[MFCollapsedMessageCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFMessageConversationViewCell *)v3 setShouldAddShadow:0];
    [(MFCollapsedMessageCell *)v4 setIsActionCardHeader:1];
  }
  return v4;
}

- (void)_createPrimaryViews
{
  v7.receiver = self;
  v7.super_class = (Class)MailActionViewHeader;
  [(MFCollapsedMessageCell *)&v7 _createPrimaryViews];
  [(MailActionViewHeader *)self _updateLabelColor];
  v3 = +[UIColor clearColor];
  v4 = [(MailActionViewHeader *)self contentView];
  [v4 setBackgroundColor:v3];

  v5 = [(MFCollapsedMessageCell *)self avatarView];
  [v5 setAlpha:1.0];

  [(MailActionViewHeader *)self setUserInteractionEnabled:0];
  objc_super v6 = [(MailActionViewHeader *)self contentView];
  [v6 setClipsToBounds:0];
}

- (void)_updateLabelColor
{
  id v5 = +[UIColor labelColor];
  v3 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v3 setTextColor:v5];

  id v6 = +[UIColor secondaryLabelColor];
  v4 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v4 setTextColor:v6];
}

- (void)_updateFonts
{
  id v5 = +[UIFont mf_messageHeaderSenderLabelFontForMailActionHeader];
  v3 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v3 setFont:v5];

  id v6 = +[UIFont mf_messageHeaderSummaryLabelFontForMailActionHeader];
  v4 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v4 setFont:v6];
}

- (double)_topToSenderBaselineInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 topToSenderBaselineInConversationForMailActionHeader];
  double v4 = v3;

  return v4;
}

- (double)_baselineToBaselineSpacingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 baselineToBaselineSpacingInConversationForMailActionHeader];
  double v4 = v3;

  return v4;
}

- (double)_messageBottomPaddingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 messageBottomPaddingInConversationForMailActionHeader];
  double v4 = v3;

  return v4;
}

- (double)_messageTopPaddingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 messageTopPaddingInConversationForMailActionHeader];
  double v4 = v3;

  return v4;
}

+ (double)defaultHeightWithDisplayMetrics:(id)a3
{
  id v3 = a3;
  [v3 messageTopPaddingInConversationForMailActionHeader];
  double v5 = v4;
  [v3 topToSenderBaselineInConversationForMailActionHeader];
  double v7 = v6;
  [v3 baselineToBaselineSpacingInConversationForMailActionHeader];
  double v9 = v8;
  [v3 messageBottomPaddingInConversationForMailActionHeader];
  double v11 = v10;
  v12 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);
  double v14 = v5 + v7 + v9 + v11;

  if (IsAccessibilityCategory)
  {
    [v3 baselineToBaselineSpacingInConversationForMailActionHeader];
    double v14 = v14 + v15;
  }

  return v14;
}

- (BOOL)shouldApplySystemLighterMaterial
{
  return 0;
}

- (void)updateTitle:(id)a3 subject:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  double v7 = [(MailActionViewHeader *)self title];
  if (([v7 isEqualToString:v19] & 1) == 0)
  {

    goto LABEL_5;
  }
  double v8 = [(MailActionViewHeader *)self subject];
  unsigned __int8 v9 = [v8 isEqualToString:v6];

  if ((v9 & 1) == 0)
  {
LABEL_5:
    double v10 = [(MFCollapsedMessageCell *)self avatarSuperview];
    double v11 = +[UIImage imageNamed:@"MFActionViewHeaderIcon"];
    [v10 setImage:v11];

    v12 = +[UIColor secondaryLabelColor];
    [v10 setTintColor:v12];

    [v10 setContentMode:1];
    v13 = [v10 layer];
    id v14 = +[UIColor colorWithWhite:0.0 alpha:0.25];
    [v13 setShadowColor:[v14 CGColor]];

    [v13 setShadowOffset:CGSizeZero.width, CGSizeZero.height];
    LODWORD(v15) = 1.0;
    [v13 setShadowOpacity:v15];
    [v13 setShadowRadius:3.0];
    v16 = [(MFCollapsedMessageCell *)self avatarView];
    [v16 removeFromSuperview];

    [(MailActionViewHeader *)self setTitle:v19];
    [(MailActionViewHeader *)self setSubject:v6];
    v17 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
    [v17 setText:v19];

    v18 = [(MFCollapsedMessageCell *)self summaryLabel];
    [v18 setText:v6];

    [(MailActionViewHeader *)self setNeedsLayout];
  }
}

- (double)_leadingMargin
{
  return 0.0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
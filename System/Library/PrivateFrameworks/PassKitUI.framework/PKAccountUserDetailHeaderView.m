@interface PKAccountUserDetailHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)contactForActions;
- (CNContact)contactForDisplay;
- (PKAccountUserDetailHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContactForActions:(id)a3;
- (void)setContactForDisplay:(id)a3;
@end

@implementation PKAccountUserDetailHeaderView

- (PKAccountUserDetailHeaderView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountUserDetailHeaderView;
  v3 = -[PKAccountUserDetailHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[PKAvatarHeaderView alloc] initWithContact:0 counterpartHandle:0];
    avatarHeaderView = v3->_avatarHeaderView;
    v3->_avatarHeaderView = v4;

    [(PKAccountUserDetailHeaderView *)v3 addSubview:v3->_avatarHeaderView];
    v6 = (CNContactInlineActionsViewController *)objc_alloc_init(getCNContactInlineActionsViewControllerClass());
    actionsViewController = v3->_actionsViewController;
    v3->_actionsViewController = v6;

    [(CNContactInlineActionsViewController *)v3->_actionsViewController setDisplaysTitles:1];
    [(CNContactInlineActionsViewController *)v3->_actionsViewController setDisplaysUnavailableActionTypes:1];
    [(CNContactInlineActionsViewController *)v3->_actionsViewController setViewStyle:7];
    v8 = [(CNContactInlineActionsViewController *)v3->_actionsViewController view];
    [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
    [(PKAccountUserDetailHeaderView *)v3 addSubview:v8];
    [(PKAccountUserDetailHeaderView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = PKUserInterfaceIdiomSupportsLargeLayouts();
  double v7 = 20.0;
  if (v6) {
    double v7 = 28.0;
  }
  double v8 = width + v7 * -2.0;
  -[PKAvatarHeaderView sizeThatFits:](self->_avatarHeaderView, "sizeThatFits:", v8, height);
  double v10 = v9;
  v11 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  objc_msgSend(v11, "sizeThatFits:", v8, height);
  double v13 = v12;

  double v14 = v10 + v13 + 15.0;
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKAccountUserDetailHeaderView;
  [(PKAccountUserDetailHeaderView *)&v17 layoutSubviews];
  [(PKAccountUserDetailHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  remainder.origin.x = v3;
  remainder.origin.y = v5;
  remainder.size.double width = v7;
  remainder.size.double height = v9;
  memset(&v15, 0, sizeof(v15));
  if (PKUserInterfaceIdiomSupportsLargeLayouts()) {
    double v11 = 28.0;
  }
  else {
    double v11 = 20.0;
  }
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  CGRectDivide(v18, &v15, &remainder, v11, CGRectMinXEdge);
  CGRectDivide(remainder, &v15, &remainder, v11, CGRectMaxXEdge);
  -[PKAvatarHeaderView sizeThatFits:](self->_avatarHeaderView, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v15, &remainder, v12, CGRectMinYEdge);
  -[PKAvatarHeaderView setFrame:](self->_avatarHeaderView, "setFrame:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
  CGRectDivide(remainder, &v15, &remainder, 15.0, CGRectMinYEdge);
  double v13 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  objc_msgSend(v13, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v15, &remainder, v14, CGRectMinYEdge);
  objc_msgSend(v13, "setFrame:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
}

- (void)setContactForDisplay:(id)a3
{
  p_contactForDisplay = &self->_contactForDisplay;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactForDisplay, a3);
    [(PKAvatarHeaderView *)self->_avatarHeaderView setContact:*p_contactForDisplay];
    [(PKAccountUserDetailHeaderView *)self setNeedsLayout];
  }
}

- (void)setContactForActions:(id)a3
{
  p_contactForActions = &self->_contactForActions;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactForActions, a3);
    [(CNContactInlineActionsViewController *)self->_actionsViewController setContact:*p_contactForActions];
    [(PKAccountUserDetailHeaderView *)self setNeedsLayout];
  }
}

- (CNContact)contactForDisplay
{
  return self->_contactForDisplay;
}

- (CNContact)contactForActions
{
  return self->_contactForActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactForActions, 0);
  objc_storeStrong((id *)&self->_contactForDisplay, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);

  objc_storeStrong((id *)&self->_avatarHeaderView, 0);
}

@end
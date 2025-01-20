@interface SUUIReviewsFacebookView
- (BOOL)isUserLiked;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)friendNames;
- (SUUIColorScheme)colorScheme;
- (SUUIReviewsFacebookView)initWithClientContext:(id)a3;
- (UIControl)likeToggleButton;
- (UIEdgeInsets)contentInsets;
- (id)_composedStringForNames:(id)a3 userLiked:(BOOL)a4;
- (void)_reloadFriendNamesLabel;
- (void)_reloadLikeButtonState;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setFriendNames:(id)a3;
- (void)setUserLiked:(BOOL)a3;
@end

@implementation SUUIReviewsFacebookView

- (SUUIReviewsFacebookView)initWithClientContext:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SUUIReviewsFacebookView;
  v6 = [(SUUIReviewsFacebookView *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v8;

    v10 = v7->_titleLabel;
    v11 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(UILabel *)v10 setFont:v11];

    v12 = v7->_titleLabel;
    if (v5) {
      [v5 localizedStringForKey:@"REVIEWS_FACEBOOK_TITLE" inTable:@"ProductPage"];
    }
    else {
    v13 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(UILabel *)v12 setText:v13];

    v14 = v7->_titleLabel;
    v15 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v15)
    {
      [(UILabel *)v14 setTextColor:v15];
    }
    else
    {
      v16 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)v14 setTextColor:v16];
    }
    [(SUUIReviewsFacebookView *)v7 addSubview:v7->_titleLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    friendsLabel = v7->_friendsLabel;
    v7->_friendsLabel = v17;

    [(UILabel *)v7->_friendsLabel setNumberOfLines:5];
    v19 = v7->_friendsLabel;
    v20 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v19 setBackgroundColor:v20];

    [(SUUIReviewsFacebookView *)v7 addSubview:v7->_friendsLabel];
    [(SUUIReviewsFacebookView *)v7 _reloadFriendNamesLabel];
    v21 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
    likeButton = v7->_likeButton;
    v7->_likeButton = v21;

    v23 = v7->_likeButton;
    v24 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v24)
    {
      [(UIButton *)v23 setTitleColor:v24 forState:0];
    }
    else
    {
      v25 = [(SUUIReviewsFacebookView *)v7 tintColor];
      [(UIButton *)v23 setTitleColor:v25 forState:0];
    }
    [(UIButton *)v7->_likeButton setShowsTouchWhenHighlighted:1];
    v26 = [(UIButton *)v7->_likeButton titleLabel];
    v27 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v26 setFont:v27];

    [(SUUIReviewsFacebookView *)v7 addSubview:v7->_likeButton];
    [(SUUIReviewsFacebookView *)v7 _reloadLikeButtonState];
    id v28 = objc_alloc(MEMORY[0x263F82828]);
    v29 = (void *)MEMORY[0x263F827E8];
    v30 = SUUIBundle();
    v31 = [v29 imageNamed:@"ProductViewReviewsFacebookIcon" inBundle:v30];
    uint64_t v32 = [v28 initWithImage:v31];
    logoImageView = v7->_logoImageView;
    v7->_logoImageView = (UIImageView *)v32;

    [(SUUIReviewsFacebookView *)v7 addSubview:v7->_logoImageView];
    v34 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v34;

    v36 = v7->_separatorView;
    v37 = [(SUUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v37)
    {
      [(UIView *)v36 setBackgroundColor:v37];
    }
    else
    {
      v38 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.200000003];
      [(UIView *)v36 setBackgroundColor:v38];
    }
    [(SUUIReviewsFacebookView *)v7 addSubview:v7->_separatorView];
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)titleLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v9];
    }
    separatorView = self->_separatorView;
    v11 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v11)
    {
      [(UIView *)separatorView setBackgroundColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.200000003];
      [(UIView *)separatorView setBackgroundColor:v12];
    }
    likeButton = self->_likeButton;
    v14 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v14)
    {
      [(UIButton *)likeButton setTitleColor:v14 forState:0];
    }
    else
    {
      v15 = [(SUUIReviewsFacebookView *)self tintColor];
      [(UIButton *)likeButton setTitleColor:v15 forState:0];
    }
    [(SUUIReviewsFacebookView *)self _reloadFriendNamesLabel];
    id v5 = v16;
  }
}

- (void)setFriendNames:(id)a3
{
  if (self->_friendNames != a3)
  {
    v4 = (NSArray *)[a3 copy];
    friendNames = self->_friendNames;
    self->_friendNames = v4;

    [(SUUIReviewsFacebookView *)self _reloadFriendNamesLabel];
  }
}

- (void)setUserLiked:(BOOL)a3
{
  if (self->_userLiked != a3)
  {
    self->_userLiked = a3;
    [(SUUIReviewsFacebookView *)self _reloadLikeButtonState];
    [(SUUIReviewsFacebookView *)self _reloadFriendNamesLabel];
    [(SUUIReviewsFacebookView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIReviewsFacebookView *)self bounds];
  CGFloat v44 = v3;
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  [(UIImageView *)self->_logoImageView frame];
  double v42 = v10;
  titleLabel = self->_titleLabel;
  double v12 = 15.0;
  double v13 = 15.0;
  if (titleLabel)
  {
    [(UILabel *)titleLabel sizeToFit];
    [(UILabel *)self->_titleLabel frame];
    CGFloat v15 = v14;
    [(UILabel *)self->_titleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 11.0, v7 + -30.0, v14, v44, v5, v7, v9)];
    v46.origin.x = 15.0;
    v46.origin.y = 11.0;
    v46.size.width = v7 + -30.0;
    v46.size.height = v15;
    double v13 = CGRectGetMaxY(v46) + -4.0 + 10.0;
  }
  logoImageView = self->_logoImageView;
  if (logoImageView)
  {
    [(UIImageView *)logoImageView frame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(UIImageView *)self->_logoImageView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v13, v17, v19, v44, v5, v7, v9)];
    v47.origin.x = 15.0;
    v47.origin.y = v13;
    v47.size.width = v18;
    v47.size.height = v20;
    double v12 = CGRectGetMaxX(v47) + 10.0;
  }
  double v21 = v7 + -15.0;
  likeButton = self->_likeButton;
  double v23 = v7 + -15.0;
  if (likeButton)
  {
    v24 = [(UIButton *)likeButton imageForState:0];
    [(UIButton *)self->_likeButton sizeToFit];
    [(UIButton *)self->_likeButton frame];
    CGFloat v43 = v9;
    CGFloat v25 = v5;
    double v27 = v26;
    id v28 = [(UIButton *)self->_likeButton titleLabel];
    objc_msgSend(v28, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v30 = v29;
    [v24 size];
    CGFloat v32 = v30 + v31 + 6.0;

    float v33 = (v42 - v27) * 0.5;
    CGFloat v34 = v13 + roundf(v33);
    [(UIButton *)self->_likeButton setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21 - v32, v34, v32, v27, v44, v25, v7, v43)];
    v48.origin.x = v21 - v32;
    v48.origin.y = v34;
    v48.size.width = v32;
    v48.size.height = v27;
    CGFloat v5 = v25;
    CGFloat v9 = v43;
    double v23 = CGRectGetMinX(v48) + -7.0;
  }
  if (self->_friendsLabel)
  {
    -[SUUIReviewsFacebookView bringSubviewToFront:](self, "bringSubviewToFront:");
    [(UILabel *)self->_friendsLabel frame];
    -[UILabel sizeThatFits:](self->_friendsLabel, "sizeThatFits:", v23 - v12, 1.79769313e308);
    [(UILabel *)self->_friendsLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12, v13 + -5.0, v35, v9 - v13 + -15.0 + 5.0 + 3.0, v44, v5, v7, v9)];
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(UIView *)separatorView frame];
    v37 = [MEMORY[0x263F82B60] mainScreen];
    [v37 scale];
    CGFloat v39 = 1.0 / v38;

    objc_super v40 = self->_separatorView;
    double v41 = SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v9 - v39, v21, v39, v44, v5, v7, v9);
    [(UIView *)v40 setFrame:v41];
  }
}

- (void)setBackgroundColor:(id)a3
{
  likeButton = self->_likeButton;
  id v5 = a3;
  [(UIButton *)likeButton setBackgroundColor:v5];
  [(UIImageView *)self->_logoImageView setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIReviewsFacebookView;
  [(SUUIReviewsFacebookView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", a3.width, a3.height);
    double v8 = v7 + -4.0 + -4.0 + 10.0 + 30.0;
  }
  else
  {
    double v8 = 30.0;
  }
  double v10 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  logoImageView = self->_logoImageView;
  double v12 = v9;
  double v13 = *MEMORY[0x263F001B0];
  if (logoImageView)
  {
    [(UIImageView *)logoImageView frame];
    double v13 = v14;
    double v12 = v15 + 2.0;
  }
  likeButton = self->_likeButton;
  if (likeButton)
  {
    CGFloat v17 = [(UIButton *)likeButton titleLabel];
    objc_msgSend(v17, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v19 = v18;
    double v9 = v20;

    double v21 = [(UIButton *)self->_likeButton imageForState:0];
    [v21 size];
    double v10 = v19 + v22 + 6.0;
  }
  friendsLabel = self->_friendsLabel;
  if (friendsLabel)
  {
    -[UILabel sizeThatFits:](friendsLabel, "sizeThatFits:", width + -30.0 - v13 + -10.0 + -7.0 - v10, height);
    double v25 = v24 + -5.0 + -3.0;
  }
  else
  {
    double v25 = 0.0;
  }
  if (v12 >= v25) {
    double v25 = v12;
  }
  if (v25 < v9) {
    double v25 = v9;
  }
  double v26 = v8 + v25;
  double v27 = width;
  result.double height = v26;
  result.double width = v27;
  return result;
}

- (id)_composedStringForNames:(id)a3 userLiked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  uint64_t v8 = v7;
  if (!v4)
  {
    switch(v7)
    {
      case 0:
        clientContext = self->_clientContext;
        if (clientContext)
        {
          double v10 = @"REVIEWS_FACEBOOK_FIRST_LIKE";
          goto LABEL_10;
        }
        double v23 = @"REVIEWS_FACEBOOK_FIRST_LIKE";
        break;
      case 1:
        double v20 = self->_clientContext;
        if (v20) {
          [(SUUIClientContext *)v20 localizedStringForKey:@"REVIEWS_FACEBOOK_ONE_FRIEND_LIKES" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_ONE_FRIEND_LIKES" inBundles:0 inTable:@"ProductPage"];
        }
        double v26 = NSString;
        uint64_t v27 = [v6 objectAtIndex:0];
        goto LABEL_39;
      case 2:
        double v21 = self->_clientContext;
        if (v21) {
          [(SUUIClientContext *)v21 localizedStringForKey:@"REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        double v24 = NSString;
        uint64_t v25 = [v6 objectAtIndex:0];
        goto LABEL_42;
      case 3:
        double v22 = self->_clientContext;
        if (v22) {
          [(SUUIClientContext *)v22 localizedStringForKey:@"REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        CGFloat v34 = NSString;
        v16 = [v6 objectAtIndex:0];
        id v28 = [v6 objectAtIndex:1];
        double v30 = [v6 objectAtIndex:2];
        [v34 stringWithValidatedFormat:v14, @"%@%@%@", 0, v16, v28, v30 validFormatSpecifiers error];
        goto LABEL_45;
      default:
        id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
        [v14 setNumberStyle:1];
        double v18 = [NSNumber numberWithInteger:v8 - 2];
        v16 = [v14 stringFromNumber:v18];

        double v19 = self->_clientContext;
        if (v19) {
          [(SUUIClientContext *)v19 localizedStringForKey:@"REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        id v28 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        CGFloat v32 = NSString;
        double v30 = [v6 objectAtIndex:0];
        float v33 = [v6 objectAtIndex:1];
        double v31 = [v32 stringWithValidatedFormat:v28, @"%@%@%@", 0, v30, v33, v16 validFormatSpecifiers error];

        goto LABEL_46;
    }
    goto LABEL_33;
  }
  switch(v7)
  {
    case 2:
      double v12 = self->_clientContext;
      if (v12) {
        [(SUUIClientContext *)v12 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE" inTable:@"ProductPage"];
      }
      else {
      id v14 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
      }
      double v24 = NSString;
      uint64_t v25 = [v6 firstObject];
LABEL_42:
      v16 = (void *)v25;
      id v28 = [v6 objectAtIndex:1];
      double v31 = [v24 stringWithValidatedFormat:v14, @"%@%@", 0, v16, v28 validFormatSpecifiers error];
      break;
    case 1:
      double v13 = self->_clientContext;
      if (v13) {
        [(SUUIClientContext *)v13 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE" inTable:@"ProductPage"];
      }
      else {
      id v14 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE" inBundles:0 inTable:@"ProductPage"];
      }
      double v26 = NSString;
      uint64_t v27 = [v6 firstObject];
LABEL_39:
      v16 = (void *)v27;
      double v31 = [v26 stringWithValidatedFormat:v14, @"%@", 0, v27 validFormatSpecifiers error];
      goto LABEL_48;
    case 0:
      clientContext = self->_clientContext;
      if (clientContext)
      {
        double v10 = @"REVIEWS_FACEBOOK_YOU_LIKE";
LABEL_10:
        uint64_t v11 = [(SUUIClientContext *)clientContext localizedStringForKey:v10 inTable:@"ProductPage"];
        goto LABEL_34;
      }
      double v23 = @"REVIEWS_FACEBOOK_YOU_LIKE";
LABEL_33:
      uint64_t v11 = +[SUUIClientContext localizedStringForKey:v23 inBundles:0 inTable:@"ProductPage"];
LABEL_34:
      double v31 = (void *)v11;
      goto LABEL_49;
    default:
      id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v14 setNumberStyle:1];
      double v15 = [NSNumber numberWithInteger:v8 - 1];
      v16 = [v14 stringFromNumber:v15];

      CGFloat v17 = self->_clientContext;
      if (v17) {
        [(SUUIClientContext *)v17 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE" inTable:@"ProductPage"];
      }
      else {
      id v28 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
      }
      double v29 = NSString;
      double v30 = [v6 firstObject];
      [v29 stringWithValidatedFormat:v28, @"%@%@", 0, v30, v16, v36 validFormatSpecifiers error];
      double v31 = LABEL_45:;
LABEL_46:

      break;
  }

LABEL_48:
LABEL_49:

  return v31;
}

- (void)_reloadFriendNamesLabel
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F81650]);
  [v3 setMaximumLineHeight:16.0];
  [v3 setMinimumLineHeight:16.0];
  [v3 setLineBreakMode:4];
  v13[0] = *MEMORY[0x263F814F0];
  BOOL v4 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  uint64_t v5 = *MEMORY[0x263F81540];
  v14[0] = v4;
  v14[1] = v3;
  uint64_t v6 = *MEMORY[0x263F81500];
  v13[1] = v5;
  v13[2] = v6;
  uint64_t v7 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.800000012];
  }
  v14[2] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v7) {

  }
  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v11 = [(SUUIReviewsFacebookView *)self _composedStringForNames:self->_friendNames userLiked:self->_userLiked];
  double v12 = (void *)[v10 initWithString:v11 attributes:v9];

  [(UILabel *)self->_friendsLabel setAttributedText:v12];
  [(SUUIReviewsFacebookView *)self setNeedsLayout];
}

- (void)_reloadLikeButtonState
{
  likeButton = self->_likeButton;
  if (self->_userLiked)
  {
    [(UIButton *)self->_likeButton setImage:0 forState:0];
    BOOL v4 = self->_likeButton;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_FACEBOOK_UNLIKE_BUTTON" inTable:@"ProductPage"];
    }
    else {
    uint64_t v11 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_UNLIKE_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(UIButton *)v4 setTitle:v11 forState:0];

    double v12 = self->_likeButton;
    double v13 = *MEMORY[0x263F834E8];
    double v14 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v15 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v16 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F827E8];
    uint64_t v7 = SUUIBundle();
    uint64_t v8 = [v6 imageNamed:@"ProductViewReviewsFacebookLikeIcon" inBundle:v7];
    [(UIButton *)likeButton setImage:v8 forState:0];

    double v9 = self->_likeButton;
    id v10 = self->_clientContext;
    if (v10) {
      [(SUUIClientContext *)v10 localizedStringForKey:@"REVIEWS_FACEBOOK_LIKE_BUTTON" inTable:@"ProductPage"];
    }
    else {
    CGFloat v17 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_LIKE_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(UIButton *)v9 setTitle:v17 forState:0];

    int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    double v15 = 0.0;
    if (ShouldReverseLayoutDirection) {
      double v14 = 0.0;
    }
    else {
      double v14 = 6.0;
    }
    if (ShouldReverseLayoutDirection) {
      double v16 = 6.0;
    }
    else {
      double v16 = 0.0;
    }
    double v12 = self->_likeButton;
    double v13 = 0.0;
  }
  -[UIButton setTitleEdgeInsets:](v12, "setTitleEdgeInsets:", v13, v14, v15, v16);
  [(SUUIReviewsFacebookView *)self setNeedsLayout];
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSArray)friendNames
{
  return self->_friendNames;
}

- (UIControl)likeToggleButton
{
  return &self->_likeButton->super;
}

- (BOOL)isUserLiked
{
  return self->_userLiked;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_likeButton, 0);
  objc_storeStrong((id *)&self->_friendsLabel, 0);
  objc_storeStrong((id *)&self->_friendNames, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
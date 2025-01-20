@interface SKUIReviewsFacebookView
- (BOOL)isUserLiked;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)friendNames;
- (SKUIColorScheme)colorScheme;
- (SKUIReviewsFacebookView)initWithClientContext:(id)a3;
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

@implementation SKUIReviewsFacebookView

- (SKUIReviewsFacebookView)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewsFacebookView initWithClientContext:]();
  }
  v40.receiver = self;
  v40.super_class = (Class)SKUIReviewsFacebookView;
  v6 = [(SKUIReviewsFacebookView *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v8;

    v10 = v7->_titleLabel;
    v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(UILabel *)v10 setFont:v11];

    v12 = v7->_titleLabel;
    if (v5) {
      [v5 localizedStringForKey:@"REVIEWS_FACEBOOK_TITLE" inTable:@"ProductPage"];
    }
    else {
    v13 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(UILabel *)v12 setText:v13];

    v14 = v7->_titleLabel;
    v15 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v15)
    {
      [(UILabel *)v14 setTextColor:v15];
    }
    else
    {
      v16 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)v14 setTextColor:v16];
    }
    [(SKUIReviewsFacebookView *)v7 addSubview:v7->_titleLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    friendsLabel = v7->_friendsLabel;
    v7->_friendsLabel = v17;

    [(UILabel *)v7->_friendsLabel setNumberOfLines:5];
    v19 = v7->_friendsLabel;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v19 setBackgroundColor:v20];

    [(SKUIReviewsFacebookView *)v7 addSubview:v7->_friendsLabel];
    [(SKUIReviewsFacebookView *)v7 _reloadFriendNamesLabel];
    v21 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    likeButton = v7->_likeButton;
    v7->_likeButton = v21;

    v23 = v7->_likeButton;
    v24 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v24)
    {
      [(UIButton *)v23 setTitleColor:v24 forState:0];
    }
    else
    {
      v25 = [(SKUIReviewsFacebookView *)v7 tintColor];
      [(UIButton *)v23 setTitleColor:v25 forState:0];
    }
    [(UIButton *)v7->_likeButton setShowsTouchWhenHighlighted:1];
    v26 = [(UIButton *)v7->_likeButton titleLabel];
    v27 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [v26 setFont:v27];

    [(SKUIReviewsFacebookView *)v7 addSubview:v7->_likeButton];
    [(SKUIReviewsFacebookView *)v7 _reloadLikeButtonState];
    id v28 = objc_alloc(MEMORY[0x1E4FB1838]);
    v29 = (void *)MEMORY[0x1E4FB1818];
    v30 = SKUIBundle();
    v31 = [v29 imageNamed:@"ProductViewReviewsFacebookIcon" inBundle:v30];
    uint64_t v32 = [v28 initWithImage:v31];
    logoImageView = v7->_logoImageView;
    v7->_logoImageView = (UIImageView *)v32;

    [(SKUIReviewsFacebookView *)v7 addSubview:v7->_logoImageView];
    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v34;

    v36 = v7->_separatorView;
    v37 = [(SKUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v37)
    {
      [(UIView *)v36 setBackgroundColor:v37];
    }
    else
    {
      v38 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
      [(UIView *)v36 setBackgroundColor:v38];
    }
    [(SKUIReviewsFacebookView *)v7 addSubview:v7->_separatorView];
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    v8 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)titleLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)titleLabel setTextColor:v9];
    }
    separatorView = self->_separatorView;
    v11 = [(SKUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v11)
    {
      [(UIView *)separatorView setBackgroundColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
      [(UIView *)separatorView setBackgroundColor:v12];
    }
    likeButton = self->_likeButton;
    v14 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v14)
    {
      [(UIButton *)likeButton setTitleColor:v14 forState:0];
    }
    else
    {
      v15 = [(SKUIReviewsFacebookView *)self tintColor];
      [(UIButton *)likeButton setTitleColor:v15 forState:0];
    }
    [(SKUIReviewsFacebookView *)self _reloadFriendNamesLabel];
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

    [(SKUIReviewsFacebookView *)self _reloadFriendNamesLabel];
  }
}

- (void)setUserLiked:(BOOL)a3
{
  if (self->_userLiked != a3)
  {
    self->_userLiked = a3;
    [(SKUIReviewsFacebookView *)self _reloadLikeButtonState];
    [(SKUIReviewsFacebookView *)self _reloadFriendNamesLabel];
    [(SKUIReviewsFacebookView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SKUIReviewsFacebookView *)self bounds];
  CGFloat v47 = v3;
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  [(UIImageView *)self->_logoImageView frame];
  double v45 = v10;
  titleLabel = self->_titleLabel;
  double v12 = 15.0;
  double v13 = 15.0;
  if (titleLabel)
  {
    [(UILabel *)titleLabel sizeToFit];
    [(UILabel *)self->_titleLabel frame];
    CGFloat v15 = v14;
    v16 = self->_titleLabel;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 11.0, v7 + -30.0, v14, v47, v5, v7, v9);
    -[UILabel setFrame:](v16, "setFrame:");
    v49.origin.x = 15.0;
    v49.origin.y = 11.0;
    v49.size.width = v7 + -30.0;
    v49.size.height = v15;
    double v13 = CGRectGetMaxY(v49) + -4.0 + 10.0;
  }
  logoImageView = self->_logoImageView;
  if (logoImageView)
  {
    [(UIImageView *)logoImageView frame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v22 = self->_logoImageView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v13, v18, v20, v47, v5, v7, v9);
    -[UIImageView setFrame:](v22, "setFrame:");
    v50.origin.x = 15.0;
    v50.origin.y = v13;
    v50.size.width = v19;
    v50.size.height = v21;
    double v12 = CGRectGetMaxX(v50) + 10.0;
  }
  double v23 = v7 + -15.0;
  likeButton = self->_likeButton;
  double v25 = v7 + -15.0;
  if (likeButton)
  {
    v26 = [(UIButton *)likeButton imageForState:0];
    [(UIButton *)self->_likeButton sizeToFit];
    [(UIButton *)self->_likeButton frame];
    CGFloat v46 = v9;
    CGFloat v27 = v5;
    double v29 = v28;
    v30 = [(UIButton *)self->_likeButton titleLabel];
    objc_msgSend(v30, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v32 = v31;
    [v26 size];
    CGFloat v34 = v32 + v33 + 6.0;

    float v35 = (v45 - v29) * 0.5;
    CGFloat v36 = v13 + roundf(v35);
    v37 = self->_likeButton;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v23 - v34, v36, v34, v29, v47, v27, v7, v46);
    -[UIButton setFrame:](v37, "setFrame:");
    v51.origin.x = v23 - v34;
    v51.origin.y = v36;
    v51.size.width = v34;
    v51.size.height = v29;
    CGFloat v5 = v27;
    CGFloat v9 = v46;
    double v25 = CGRectGetMinX(v51) + -7.0;
  }
  if (self->_friendsLabel)
  {
    -[SKUIReviewsFacebookView bringSubviewToFront:](self, "bringSubviewToFront:");
    [(UILabel *)self->_friendsLabel frame];
    -[UILabel sizeThatFits:](self->_friendsLabel, "sizeThatFits:", v25 - v12, 1.79769313e308);
    friendsLabel = self->_friendsLabel;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12, v13 + -5.0, v39, v9 - v13 + -15.0 + 5.0 + 3.0, v47, v5, v7, v9);
    -[UILabel setFrame:](friendsLabel, "setFrame:");
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(UIView *)separatorView frame];
    v41 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v41 scale];
    CGFloat v43 = 1.0 / v42;

    v44 = self->_separatorView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v9 - v43, v23, v43, v47, v5, v7, v9);
    -[UIView setFrame:](v44, "setFrame:");
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
  v6.super_class = (Class)SKUIReviewsFacebookView;
  [(SKUIReviewsFacebookView *)&v6 setBackgroundColor:v5];
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
  double v10 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  logoImageView = self->_logoImageView;
  double v12 = v9;
  double v13 = *MEMORY[0x1E4F1DB30];
  if (logoImageView)
  {
    [(UIImageView *)logoImageView frame];
    double v13 = v14;
    double v12 = v15 + 2.0;
  }
  likeButton = self->_likeButton;
  if (likeButton)
  {
    v17 = [(UIButton *)likeButton titleLabel];
    objc_msgSend(v17, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v19 = v18;
    double v9 = v20;

    CGFloat v21 = [(UIButton *)self->_likeButton imageForState:0];
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
          [(SKUIClientContext *)v20 localizedStringForKey:@"REVIEWS_FACEBOOK_ONE_FRIEND_LIKES" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_ONE_FRIEND_LIKES" inBundles:0 inTable:@"ProductPage"];
        }
        double v26 = NSString;
        uint64_t v27 = [v6 objectAtIndex:0];
        goto LABEL_39;
      case 2:
        CGFloat v21 = self->_clientContext;
        if (v21) {
          [(SKUIClientContext *)v21 localizedStringForKey:@"REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        double v24 = NSString;
        uint64_t v25 = [v6 objectAtIndex:0];
        goto LABEL_42;
      case 3:
        double v22 = self->_clientContext;
        if (v22) {
          [(SKUIClientContext *)v22 localizedStringForKey:@"REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        id v14 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        CGFloat v34 = NSString;
        v16 = [v6 objectAtIndex:0];
        double v28 = [v6 objectAtIndex:1];
        v30 = [v6 objectAtIndex:2];
        [v34 stringWithValidatedFormat:v14, @"%@%@%@", 0, v16, v28, v30 validFormatSpecifiers error];
        goto LABEL_45;
      default:
        id v14 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        [v14 setNumberStyle:1];
        double v18 = [NSNumber numberWithInteger:v8 - 2];
        v16 = [v14 stringFromNumber:v18];

        double v19 = self->_clientContext;
        if (v19) {
          [(SKUIClientContext *)v19 localizedStringForKey:@"REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE" inTable:@"ProductPage"];
        }
        else {
        double v28 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
        }
        double v32 = NSString;
        v30 = [v6 objectAtIndex:0];
        double v33 = [v6 objectAtIndex:1];
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
        [(SKUIClientContext *)v12 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE" inTable:@"ProductPage"];
      }
      else {
      id v14 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
      }
      double v24 = NSString;
      uint64_t v25 = [v6 firstObject];
LABEL_42:
      v16 = (void *)v25;
      double v28 = [v6 objectAtIndex:1];
      double v31 = [v24 stringWithValidatedFormat:v14, @"%@%@", 0, v16, v28 validFormatSpecifiers error];
      break;
    case 1:
      double v13 = self->_clientContext;
      if (v13) {
        [(SKUIClientContext *)v13 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE" inTable:@"ProductPage"];
      }
      else {
      id v14 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE" inBundles:0 inTable:@"ProductPage"];
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
        uint64_t v11 = [(SKUIClientContext *)clientContext localizedStringForKey:v10 inTable:@"ProductPage"];
        goto LABEL_34;
      }
      double v23 = @"REVIEWS_FACEBOOK_YOU_LIKE";
LABEL_33:
      uint64_t v11 = +[SKUIClientContext localizedStringForKey:v23 inBundles:0 inTable:@"ProductPage"];
LABEL_34:
      double v31 = (void *)v11;
      goto LABEL_49;
    default:
      id v14 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v14 setNumberStyle:1];
      double v15 = [NSNumber numberWithInteger:v8 - 1];
      v16 = [v14 stringFromNumber:v15];

      v17 = self->_clientContext;
      if (v17) {
        [(SKUIClientContext *)v17 localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE" inTable:@"ProductPage"];
      }
      else {
      double v28 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE" inBundles:0 inTable:@"ProductPage"];
      }
      double v29 = NSString;
      v30 = [v6 firstObject];
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
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v3 setMaximumLineHeight:16.0];
  [v3 setMinimumLineHeight:16.0];
  [v3 setLineBreakMode:4];
  v13[0] = *MEMORY[0x1E4FB06F8];
  BOOL v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v14[0] = v4;
  v14[1] = v3;
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v13[1] = v5;
  v13[2] = v6;
  uint64_t v7 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.800000012];
  }
  v14[2] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v7) {

  }
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = [(SKUIReviewsFacebookView *)self _composedStringForNames:self->_friendNames userLiked:self->_userLiked];
  double v12 = (void *)[v10 initWithString:v11 attributes:v9];

  [(UILabel *)self->_friendsLabel setAttributedText:v12];
  [(SKUIReviewsFacebookView *)self setNeedsLayout];
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
      [(SKUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_FACEBOOK_UNLIKE_BUTTON" inTable:@"ProductPage"];
    }
    else {
    uint64_t v11 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_UNLIKE_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(UIButton *)v4 setTitle:v11 forState:0];

    double v12 = self->_likeButton;
    double v13 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = SKUIBundle();
    uint64_t v8 = [v6 imageNamed:@"ProductViewReviewsFacebookLikeIcon" inBundle:v7];
    [(UIButton *)likeButton setImage:v8 forState:0];

    double v9 = self->_likeButton;
    id v10 = self->_clientContext;
    if (v10) {
      [(SKUIClientContext *)v10 localizedStringForKey:@"REVIEWS_FACEBOOK_LIKE_BUTTON" inTable:@"ProductPage"];
    }
    else {
    v17 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_FACEBOOK_LIKE_BUTTON" inBundles:0 inTable:@"ProductPage"];
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

  [(SKUIReviewsFacebookView *)self setNeedsLayout];
}

- (SKUIColorScheme)colorScheme
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

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewsFacebookView initWithClientContext:]";
}

@end
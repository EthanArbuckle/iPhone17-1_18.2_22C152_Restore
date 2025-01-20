@interface CHFriendInboxIncomingTableViewCell
+ (double)preferredHeight;
- (ASFriend)friend;
- (BOOL)_isVerticalCell;
- (CHFriendInboxIncomingTableViewCell)initWithFrame:(CGRect)a3;
- (CHFriendInboxIncomingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CHFriendInboxIncomingTableViewCellDelegate)delegate;
- (id)_commonConstraints;
- (id)_horizontalConstraints;
- (id)_verticalConstraints;
- (int64_t)type;
- (void)_acceptPressed;
- (void)_addLayoutConstraints;
- (void)_declinePressed;
- (void)_setTintColor:(id)a3 forButton:(id)a4;
- (void)_setupCell;
- (void)setAcceptTintColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFriend:(id)a3;
- (void)setIgnoreTintColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CHFriendInboxIncomingTableViewCell

- (void)_setupCell
{
  v3 = +[UIColor systemBackgroundColor];
  [(CHFriendInboxIncomingTableViewCell *)self setBackgroundColor:v3];

  [(CHFriendInboxIncomingTableViewCell *)self setAccessoryType:0];
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  insetContentView = self->_insetContentView;
  self->_insetContentView = v4;

  [(UIView *)self->_insetContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(CHFriendInboxIncomingTableViewCell *)self contentView];
  [v6 addSubview:self->_insetContentView];

  v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v7;

  [(UIImageView *)self->_avatarImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_insetContentView addSubview:self->_avatarImageView];
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  friendName = self->_friendName;
  self->_friendName = v9;

  [(UILabel *)self->_friendName setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_insetContentView addSubview:self->_friendName];
  v11 = (UIButton *)objc_alloc_init((Class)UIButton);
  declineButton = self->_declineButton;
  self->_declineButton = v11;

  [(UIButton *)self->_declineButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_declineButton;
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"SHARING_INVITE_DECLINE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(UIButton *)v13 setTitle:v15 forState:0];

  v16 = self->_declineButton;
  v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UIButton *)v16 _setFont:v17];

  [(UIButton *)self->_declineButton addTarget:self action:"_highlighted" forControlEvents:4095];
  [(UIButton *)self->_declineButton addTarget:self action:"_declinePressed" forControlEvents:64];
  [(UIView *)self->_insetContentView addSubview:self->_declineButton];
  v18 = (UIButton *)objc_alloc_init((Class)UIButton);
  acceptButton = self->_acceptButton;
  self->_acceptButton = v18;

  [(UIButton *)self->_acceptButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = self->_acceptButton;
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"SHARING_INVITE_ACCEPT" value:&stru_1008D8AB8 table:@"Localizable"];
  [(UIButton *)v20 setTitle:v22 forState:0];

  v23 = self->_acceptButton;
  v24 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UIButton *)v23 _setFont:v24];

  [(UIButton *)self->_acceptButton addTarget:self action:"_acceptPressed" forControlEvents:64];
  [(UIButton *)self->_acceptButton addTarget:self action:"_highlighted" forControlEvents:4095];
  v25 = self->_insetContentView;
  v26 = self->_acceptButton;

  [(UIView *)v25 addSubview:v26];
}

- (CHFriendInboxIncomingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHFriendInboxIncomingTableViewCell;
  v4 = [(CHFriendInboxIncomingTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CHFriendInboxIncomingTableViewCell *)v4 _setupCell];
  }
  return v5;
}

- (CHFriendInboxIncomingTableViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHFriendInboxIncomingTableViewCell;
  v3 = -[CHFriendInboxIncomingTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHFriendInboxIncomingTableViewCell *)v3 _setupCell];
  }
  return v4;
}

- (void)_declinePressed
{
  id v3 = [(CHFriendInboxIncomingTableViewCell *)self delegate];
  [v3 incomingTableViewCellDidTapIgnore:self];
}

- (void)_acceptPressed
{
  id v3 = [(CHFriendInboxIncomingTableViewCell *)self delegate];
  [v3 incomingTableViewCellDidTapAccept:self];
}

+ (double)preferredHeight
{
  return UITableViewAutomaticDimension;
}

- (void)setFriend:(id)a3
{
  p_friend = &self->_friend;
  objc_storeStrong((id *)&self->_friend, a3);
  id v6 = a3;
  objc_super v7 = [(ASFriend *)*p_friend fullName];
  [(UILabel *)self->_friendName setText:v7];

  v8 = +[CHActivitySharingAvatarProvider fetchAvatarImageForFriend:v6 diameter:30.0];
  [(UIImageView *)self->_avatarImageView setImage:v8];

  [(CHFriendInboxIncomingTableViewCell *)self _addLayoutConstraints];

  [(CHFriendInboxIncomingTableViewCell *)self setNeedsLayout];
}

- (BOOL)_isVerticalCell
{
  sub_1001784A0();
  double v4 = v3;
  double v6 = v5;
  -[UILabel systemLayoutSizeFittingSize:](self->_friendName, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v8 = v7;
  -[UIButton systemLayoutSizeFittingSize:](self->_declineButton, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v10 = v9;
  -[UIButton systemLayoutSizeFittingSize:](self->_acceptButton, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v12 = v11;
  -[UIImageView systemLayoutSizeFittingSize:](self->_avatarImageView, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v14 = v6 + v12 + v10 + v4 + 16.0 + v13 + 3.0 + 20.0 + 20.0 + 16.0;
  v15 = +[UIScreen mainScreen];
  [v15 bounds];
  double v17 = v16 - v14;

  return v8 > v17;
}

- (void)_addLayoutConstraints
{
  if (self->_activeConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if ([(CHFriendInboxIncomingTableViewCell *)self _isVerticalCell]) {
    [(CHFriendInboxIncomingTableViewCell *)self _verticalConstraints];
  }
  else {
  id v6 = [(CHFriendInboxIncomingTableViewCell *)self _horizontalConstraints];
  }
  double v3 = [(CHFriendInboxIncomingTableViewCell *)self _commonConstraints];
  double v4 = [v3 arrayByAddingObjectsFromArray:v6];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v4;

  +[NSLayoutConstraint activateConstraints:self->_activeConstraints];
}

- (id)_commonConstraints
{
  double v3 = sub_1001784A0();
  double v5 = v4;
  double v7 = v6;
  v37 = [(UIView *)self->_insetContentView topAnchor];
  v38 = [(CHFriendInboxIncomingTableViewCell *)self contentView];
  v36 = [v38 topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:v3];
  v39[0] = v35;
  v33 = [(UIView *)self->_insetContentView leadingAnchor];
  v34 = [(CHFriendInboxIncomingTableViewCell *)self contentView];
  v32 = [v34 leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:v5];
  v39[1] = v31;
  v29 = [(UIView *)self->_insetContentView bottomAnchor];
  v30 = [(CHFriendInboxIncomingTableViewCell *)self contentView];
  v28 = [v30 bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:v7];
  v39[2] = v27;
  v25 = [(UIView *)self->_insetContentView trailingAnchor];
  v26 = [(CHFriendInboxIncomingTableViewCell *)self contentView];
  v24 = [v26 trailingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:v7];
  v39[3] = v23;
  v22 = [(UIImageView *)self->_avatarImageView widthAnchor];
  v21 = [v22 constraintEqualToConstant:30.0];
  v39[4] = v21;
  v20 = [(UIImageView *)self->_avatarImageView heightAnchor];
  double v8 = [v20 constraintEqualToConstant:30.0];
  v39[5] = v8;
  double v9 = [(UIImageView *)self->_avatarImageView leadingAnchor];
  double v10 = [(UIView *)self->_insetContentView leadingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10 constant:3.0];
  v39[6] = v11;
  double v12 = [(UILabel *)self->_friendName leadingAnchor];
  double v13 = [(UIImageView *)self->_avatarImageView trailingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13 constant:20.0];
  v39[7] = v14;
  v15 = [(UILabel *)self->_friendName topAnchor];
  double v16 = [(UIView *)self->_insetContentView topAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16 constant:5.0];
  v39[8] = v17;
  id v19 = +[NSArray arrayWithObjects:v39 count:9];

  return v19;
}

- (id)_verticalConstraints
{
  v31 = [(UIImageView *)self->_avatarImageView topAnchor];
  v30 = [(UIView *)self->_insetContentView topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:20.0];
  v32[0] = v29;
  v28 = [(UIImageView *)self->_avatarImageView bottomAnchor];
  v27 = [(UIView *)self->_insetContentView bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 constant:-20.0];
  v32[1] = v26;
  v25 = [(UIButton *)self->_declineButton topAnchor];
  v24 = [(UILabel *)self->_friendName bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v32[2] = v23;
  v22 = [(UIButton *)self->_declineButton leadingAnchor];
  v21 = [(UILabel *)self->_friendName leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v32[3] = v20;
  id v19 = [(UIButton *)self->_acceptButton topAnchor];
  v18 = [(UIButton *)self->_declineButton topAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v32[4] = v17;
  double v16 = [(UIButton *)self->_acceptButton leadingAnchor];
  v15 = [(UIButton *)self->_declineButton trailingAnchor];
  double v3 = [v16 constraintEqualToAnchor:v15 constant:-5.0];
  v32[5] = v3;
  double v4 = [(UIButton *)self->_acceptButton trailingAnchor];
  double v5 = [(UIView *)self->_insetContentView trailingAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5 constant:-5.0];
  v32[6] = v6;
  double v7 = [(UIButton *)self->_acceptButton bottomAnchor];
  double v8 = [(UIButton *)self->_declineButton bottomAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v32[7] = v9;
  double v10 = [(UIButton *)self->_acceptButton widthAnchor];
  double v11 = [(UIButton *)self->_declineButton widthAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v32[8] = v12;
  id v14 = +[NSArray arrayWithObjects:v32 count:9];

  return v14;
}

- (id)_horizontalConstraints
{
  v25 = [(UIImageView *)self->_avatarImageView topAnchor];
  v24 = [(UIView *)self->_insetContentView topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:5.0];
  v26[0] = v23;
  v22 = [(UIImageView *)self->_avatarImageView leadingAnchor];
  v21 = [(UIView *)self->_insetContentView leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:5.0];
  v26[1] = v20;
  id v19 = [(UIImageView *)self->_avatarImageView bottomAnchor];
  v18 = [(UIImageView *)self->_avatarImageView bottomAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v26[2] = v17;
  double v16 = [(UIButton *)self->_declineButton centerYAnchor];
  v15 = [(UILabel *)self->_friendName centerYAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v26[3] = v14;
  double v3 = [(UIButton *)self->_acceptButton leadingAnchor];
  double v4 = [(UIButton *)self->_declineButton trailingAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4 constant:24.0];
  v26[4] = v5;
  double v6 = [(UIButton *)self->_acceptButton trailingAnchor];
  double v7 = [(UIView *)self->_insetContentView trailingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7 constant:-5.0];
  v26[5] = v8;
  double v9 = [(UIButton *)self->_acceptButton centerYAnchor];
  double v10 = [(UILabel *)self->_friendName centerYAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  v26[6] = v11;
  double v12 = +[NSArray arrayWithObjects:v26 count:7];

  return v12;
}

- (void)setAcceptTintColor:(id)a3
{
}

- (void)setIgnoreTintColor:(id)a3
{
}

- (void)_setTintColor:(id)a3 forButton:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 setTitleColor:v6 forState:0];
  id v7 = [v6 colorWithAlphaComponent:0.3];

  [v5 setTitleColor:v7 forState:1];
}

- (CHFriendInboxIncomingTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHFriendInboxIncomingTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASFriend)friend
{
  return self->_friend;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_friendName, 0);

  objc_storeStrong((id *)&self->_insetContentView, 0);
}

@end
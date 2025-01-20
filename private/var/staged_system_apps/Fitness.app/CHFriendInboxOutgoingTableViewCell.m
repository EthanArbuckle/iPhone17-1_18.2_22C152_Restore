@interface CHFriendInboxOutgoingTableViewCell
+ (double)preferredHeight;
- (ASFriend)friend;
- (CHFriendInboxOutgoingTableViewCell)initWithFrame:(CGRect)a3;
- (CHFriendInboxOutgoingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)defaultContentConfiguration;
- (void)_setupCell;
- (void)prepareForReuse;
- (void)setDetailText:(id)a3;
- (void)setFriend:(id)a3;
@end

@implementation CHFriendInboxOutgoingTableViewCell

- (void)_setupCell
{
  v3 = +[UIColor secondarySystemBackgroundColor];
  [(CHFriendInboxOutgoingTableViewCell *)self setBackgroundColor:v3];

  v4 = [(CHFriendInboxOutgoingTableViewCell *)self defaultContentConfiguration];
  currentContentConfiguration = self->_currentContentConfiguration;
  self->_currentContentConfiguration = v4;

  v6 = self->_currentContentConfiguration;

  [(CHFriendInboxOutgoingTableViewCell *)self setContentConfiguration:v6];
}

- (CHFriendInboxOutgoingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v4 = [(CHFriendInboxOutgoingTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CHFriendInboxOutgoingTableViewCell *)v4 _setupCell];
  }
  return v5;
}

- (CHFriendInboxOutgoingTableViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v3 = -[CHFriendInboxOutgoingTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHFriendInboxOutgoingTableViewCell *)v3 _setupCell];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  [(CHFriendInboxOutgoingTableViewCell *)&v3 prepareForReuse];
  [(CHFriendInboxOutgoingTableViewCell *)self _setupCell];
}

- (id)defaultContentConfiguration
{
  v9.receiver = self;
  v9.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v2 = [(CHFriendInboxOutgoingTableViewCell *)&v9 defaultContentConfiguration];
  objc_super v3 = [v2 textProperties];
  [v3 setLineBreakMode:4];

  [v2 setPrefersSideBySideTextAndSecondaryText:1];
  v4 = +[UIColor secondaryLabelColor];
  v5 = [v2 secondaryTextProperties];
  [v5 setColor:v4];

  objc_super v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  objc_super v7 = [v2 secondaryTextProperties];
  [v7 setFont:v6];

  return v2;
}

+ (double)preferredHeight
{
  return 50.0;
}

- (void)setFriend:(id)a3
{
  objc_storeStrong((id *)&self->_friend, a3);
  id v7 = a3;
  v5 = [v7 fullName];
  [(UIListContentConfiguration *)self->_currentContentConfiguration setText:v5];

  objc_super v6 = +[CHActivitySharingAvatarProvider fetchAvatarImageForFriend:v7 diameter:30.0];
  [(UIListContentConfiguration *)self->_currentContentConfiguration setImage:v6];

  [(CHFriendInboxOutgoingTableViewCell *)self setContentConfiguration:self->_currentContentConfiguration];
}

- (void)setDetailText:(id)a3
{
  [(UIListContentConfiguration *)self->_currentContentConfiguration setSecondaryText:a3];
  currentContentConfiguration = self->_currentContentConfiguration;

  [(CHFriendInboxOutgoingTableViewCell *)self setContentConfiguration:currentContentConfiguration];
}

- (ASFriend)friend
{
  return self->_friend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);

  objc_storeStrong((id *)&self->_currentContentConfiguration, 0);
}

@end
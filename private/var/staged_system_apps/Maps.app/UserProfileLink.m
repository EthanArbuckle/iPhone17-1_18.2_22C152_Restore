@interface UserProfileLink
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (UserProfileLink)initWithTitle:(id)a3 icon:(id)a4;
- (id)description;
- (int64_t)userProfileLinkType;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setUserProfileLinkType:(int64_t)a3;
@end

@implementation UserProfileLink

- (UserProfileLink)initWithTitle:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UserProfileLink;
  v8 = [(UserProfileLink *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    objc_storeStrong((id *)&v8->_icon, a4);
  }

  return v8;
}

- (id)description
{
  int64_t v3 = [(UserProfileLink *)self userProfileLinkType];
  v4 = [(UserProfileLink *)self title];
  v5 = [(UserProfileLink *)self subtitle];
  id v6 = +[NSString stringWithFormat:@"UserProfileLink <%p> type:%ld title:%@ subtitle:%@", self, v3, v4, v5];

  return v6;
}

- (int64_t)userProfileLinkType
{
  return self->_userProfileLinkType;
}

- (void)setUserProfileLinkType:(int64_t)a3
{
  self->_userProfileLinkType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
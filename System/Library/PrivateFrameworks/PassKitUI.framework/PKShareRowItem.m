@interface PKShareRowItem
- (BOOL)hasFetchedContact;
- (BOOL)isAddShareItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToareRowItem:(id)a3;
- (BOOL)isStopSharingItem;
- (BOOL)shouldCenterText;
- (BOOL)showContactAvatar;
- (CNContact)contact;
- (NSCopying)identifier;
- (NSString)subtitle;
- (NSString)title;
- (PKPassShare)share;
- (UIColor)titleTextColor;
- (UIImage)icon;
- (unint64_t)hash;
- (void)setContact:(id)a3;
- (void)setHasFetchedContact:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIsAddShareItem:(BOOL)a3;
- (void)setIsStopSharingItem:(BOOL)a3;
- (void)setShare:(id)a3;
- (void)setShouldCenterText:(BOOL)a3;
- (void)setShowContactAvatar:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation PKShareRowItem

- (NSCopying)identifier
{
  title = [(PKPassShare *)self->_share identifier];
  v4 = title;
  if (!title) {
    title = self->_title;
  }
  v5 = title;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKShareRowItem *)self identifier];
  [v3 addObject:v4];

  if (self->_title) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_subtitle) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_icon) {
    objc_msgSend(v3, "addObject:");
  }
  unint64_t v5 = PKCombinedHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKShareRowItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKShareRowItem *)self isEqualToareRowItem:v5];

  return v6;
}

- (BOOL)isEqualToareRowItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(PKShareRowItem *)self identifier];
    BOOL v6 = [v4 identifier];
    if (PKEqualObjects() && PKEqualObjects() && PKEqualObjects()) {
      char v7 = PKEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAddShareItem
{
  return self->_isAddShareItem;
}

- (void)setIsAddShareItem:(BOOL)a3
{
  self->_isAddShareItem = a3;
}

- (BOOL)isStopSharingItem
{
  return self->_isStopSharingItem;
}

- (void)setIsStopSharingItem:(BOOL)a3
{
  self->_isStopSharingItem = a3;
}

- (PKPassShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (BOOL)showContactAvatar
{
  return self->_showContactAvatar;
}

- (void)setShowContactAvatar:(BOOL)a3
{
  self->_showContactAvatar = a3;
}

- (BOOL)hasFetchedContact
{
  return self->_hasFetchedContact;
}

- (void)setHasFetchedContact:(BOOL)a3
{
  self->_hasFetchedContact = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
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

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (BOOL)shouldCenterText
{
  return self->_shouldCenterText;
}

- (void)setShouldCenterText:(BOOL)a3
{
  self->_shouldCenterText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end
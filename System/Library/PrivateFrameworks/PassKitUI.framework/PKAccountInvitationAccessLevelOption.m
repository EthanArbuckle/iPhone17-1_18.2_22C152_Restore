@interface PKAccountInvitationAccessLevelOption
- (NSString)secondarySubtitle;
- (NSString)subtitle;
- (NSString)title;
- (PKAccountInvitationAccessLevelOption)initWithAccessLevel:(unint64_t)a3;
- (UIImage)image;
- (unint64_t)accessLevel;
- (void)setImage:(id)a3;
- (void)setSecondarySubtitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKAccountInvitationAccessLevelOption

- (PKAccountInvitationAccessLevelOption)initWithAccessLevel:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountInvitationAccessLevelOption;
  result = [(PKAccountInvitationAccessLevelOption *)&v5 init];
  if (result) {
    result->_accessLevel = a3;
  }
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
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

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void)setSecondarySubtitle:(id)a3
{
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end
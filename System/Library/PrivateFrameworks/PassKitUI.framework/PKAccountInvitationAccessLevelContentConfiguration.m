@interface PKAccountInvitationAccessLevelContentConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountInvitationAccessLevelContentConfiguration:(id)a3;
- (NSString)secondarySubtitle;
- (NSString)subtitle;
- (NSString)title;
- (PKAccountInvitationAccessLevelContentConfiguration)initWithAccessLevelOption:(id)a3;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (unint64_t)hash;
@end

@implementation PKAccountInvitationAccessLevelContentConfiguration

- (PKAccountInvitationAccessLevelContentConfiguration)initWithAccessLevelOption:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountInvitationAccessLevelContentConfiguration;
  v5 = [(PKAccountInvitationAccessLevelContentConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 image];
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    uint64_t v8 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 subtitle];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = [v4 secondarySubtitle];
    secondarySubtitle = v5->_secondarySubtitle;
    v5->_secondarySubtitle = (NSString *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountInvitationAccessLevelContentConfiguration *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountInvitationAccessLevelContentConfiguration *)self isEqualToAccountInvitationAccessLevelContentConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToAccountInvitationAccessLevelContentConfiguration:(id)a3
{
  id v4 = a3;
  if (v4 && PKEqualObjects())
  {
    v5 = (void *)v4[2];
    BOOL v6 = self->_title;
    v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7) {
        goto LABEL_21;
      }
      BOOL v9 = [(NSString *)v6 isEqualToString:v7];

      if (!v9) {
        goto LABEL_22;
      }
    }
    uint64_t v10 = (void *)v4[3];
    BOOL v6 = self->_subtitle;
    v11 = v10;
    if (v6 == v11)
    {

LABEL_16:
      secondarySubtitle = self->_secondarySubtitle;
      v13 = (void *)v4[4];
      BOOL v6 = secondarySubtitle;
      v14 = v13;
      if (v6 == v14)
      {
        LOBYTE(v9) = 1;
        uint64_t v8 = v6;
      }
      else
      {
        uint64_t v8 = v14;
        LOBYTE(v9) = 0;
        if (v6 && v14) {
          LOBYTE(v9) = [(NSString *)v6 isEqualToString:v14];
        }
      }
      goto LABEL_21;
    }
    uint64_t v8 = v11;
    LOBYTE(v9) = 0;
    if (v6 && v11)
    {
      BOOL v9 = [(NSString *)v6 isEqualToString:v11];

      if (!v9) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  LOBYTE(v9) = 0;
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_image];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_subtitle];
  [v3 safelyAddObject:self->_secondarySubtitle];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 8), self->_image);
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_secondarySubtitle copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (id)makeContentView
{
  v2 = [[PKAccountInvitationAccessLevelContentView alloc] initWithConfiguration:self];

  return v2;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end
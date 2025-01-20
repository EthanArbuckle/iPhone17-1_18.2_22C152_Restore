@interface _UISupplementalItem
+ (BOOL)supportsSecureCoding;
+ (id)_uiSupplementalItemWithTISupplementalItem:(id)a3 icon:(id)a4;
- (NSDictionary)userInfo;
- (UIImage)icon;
- (_UISupplementalItem)initWithCoder:(id)a3;
- (id)_init;
- (unint64_t)_identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _UISupplementalItem

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_UISupplementalItem;
  v2 = [(_UISupplementalItem *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)_uiSupplementalItemWithTISupplementalItem:(id)a3 icon:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [[_UISupplementalPersonItem alloc] initWithTISupplementalPersonItem:v5 icon:v6];
LABEL_5:
    v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [[_UISupplementalPhraseItem alloc] initWithTISupplementalPhraseItem:v5 icon:v6];
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (unint64_t)_identifier
{
  return 0;
}

- (_UISupplementalItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UISupplementalItem *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (UIImage *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_internal, 0);
}

@end
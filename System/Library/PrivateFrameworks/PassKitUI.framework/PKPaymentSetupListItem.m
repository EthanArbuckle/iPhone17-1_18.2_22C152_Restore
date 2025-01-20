@interface PKPaymentSetupListItem
- (BOOL)displayChevron;
- (BOOL)displayInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadingIndicatorVisible;
- (BOOL)reserverSpaceForSelectedAccessory;
- (BOOL)selected;
- (BOOL)useMultiSelectAccessory;
- (NSString)badgeText;
- (NSString)identifier;
- (NSString)labelText;
- (NSString)subtitle;
- (NSString)title;
- (PKPaymentSetupListItem)init;
- (PKPaymentSetupListItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (UIImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBadgeText:(id)a3;
- (void)setDisplayChevron:(BOOL)a3;
- (void)setDisplayInfo:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setLoadingIndicatorVisible:(BOOL)a3;
- (void)setReserverSpaceForSelectedAccessory:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseMultiSelectAccessory:(BOOL)a3;
@end

@implementation PKPaymentSetupListItem

- (PKPaymentSetupListItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupListItem;
  v2 = [(PKPaymentSetupListItem *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (PKPaymentSetupListItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PKPaymentSetupListItem *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_icon, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  id v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  id v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_badgeText copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_labelText copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(UIImage *)self->_icon copy];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  *(unsigned char *)(v5 + 11) = self->_selected;
  *(unsigned char *)(v5 + 10) = self->_loadingIndicatorVisible;
  *(unsigned char *)(v5 + 9) = self->_displayChevron;
  *(unsigned char *)(v5 + 8) = self->_displayInfo;
  *(unsigned char *)(v5 + 13) = self->_reserverSpaceForSelectedAccessory;
  *(unsigned char *)(v5 + 12) = self->_useMultiSelectAccessory;
  return (id)v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_subtitle];
  [v3 safelyAddObject:self->_icon];
  [v3 safelyAddObject:self->_badgeText];
  [v3 safelyAddObject:self->_labelText];
  [v3 safelyAddObject:self->_identifier];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_selected == v4[11]
    && self->_loadingIndicatorVisible == v4[10]
    && self->_displayChevron == v4[9]
    && self->_displayInfo == v4[8]
    && self->_reserverSpaceForSelectedAccessory == v4[13]
    && self->_useMultiSelectAccessory == v4[12];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (BOOL)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(BOOL)a3
{
  self->_displayInfo = a3;
}

- (BOOL)displayChevron
{
  return self->_displayChevron;
}

- (void)setDisplayChevron:(BOOL)a3
{
  self->_displayChevron = a3;
}

- (BOOL)loadingIndicatorVisible
{
  return self->_loadingIndicatorVisible;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
  self->_loadingIndicatorVisible = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)useMultiSelectAccessory
{
  return self->_useMultiSelectAccessory;
}

- (void)setUseMultiSelectAccessory:(BOOL)a3
{
  self->_useMultiSelectAccessory = a3;
}

- (BOOL)reserverSpaceForSelectedAccessory
{
  return self->_reserverSpaceForSelectedAccessory;
}

- (void)setReserverSpaceForSelectedAccessory:(BOOL)a3
{
  self->_reserverSpaceForSelectedAccessory = a3;
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void)setBadgeText:(id)a3
{
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
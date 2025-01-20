@interface NTKHomeListItem
- (BOOL)isEqual:(id)a3;
- (NSString)homeLocalizedName;
- (NSString)ntk_contactIdentifier;
- (NSString)ntk_identifier;
- (NSString)ntk_sectionIdentifier;
- (NSUUID)homeID;
- (NTKHomeListItem)initWithSectionIdentifier:(id)a3;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (unint64_t)ntk_itemType;
- (void)setHomeID:(id)a3;
- (void)setHomeLocalizedName:(id)a3;
@end

@implementation NTKHomeListItem

- (NTKHomeListItem)initWithSectionIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKHomeListItem;
  v5 = [(NTKHomeListItem *)&v12 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    ntk_identifier = v5->_ntk_identifier;
    v5->_ntk_identifier = (NSString *)v7;

    uint64_t v9 = [v4 copy];
    ntk_sectionIdentifier = v5->_ntk_sectionIdentifier;
    v5->_ntk_sectionIdentifier = (NSString *)v9;
  }
  return v5;
}

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  return NTKClockFaceLocalizedString(@"COMPLICATION_PICKER_NANOHOME_HOMES_SECTION_NAME", @"Homes");
}

- (unint64_t)ntk_itemType
{
  return 5;
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NTKHomeListItem *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(NTKHomeListItem *)v5 homeID];
    uint64_t v7 = [(NTKHomeListItem *)self homeID];
    BOOL v8 = v6 == v7;
  }
  else
  {
LABEL_5:
    BOOL v8 = 0;
  }
LABEL_7:

  return v8;
}

- (NSString)ntk_identifier
{
  return self->_ntk_identifier;
}

- (NSString)ntk_sectionIdentifier
{
  return self->_ntk_sectionIdentifier;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (NSString)homeLocalizedName
{
  return self->_homeLocalizedName;
}

- (void)setHomeLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocalizedName, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_ntk_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end
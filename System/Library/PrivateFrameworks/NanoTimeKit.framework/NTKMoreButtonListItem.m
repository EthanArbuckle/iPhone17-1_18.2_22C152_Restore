@interface NTKMoreButtonListItem
- (NSString)ntk_contactIdentifier;
- (NSString)ntk_identifier;
- (NSString)ntk_sectionIdentifier;
- (NTKMoreButtonListItem)initWithSectionIdentifier:(id)a3;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (unint64_t)ntk_itemType;
@end

@implementation NTKMoreButtonListItem

- (NTKMoreButtonListItem)initWithSectionIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKMoreButtonListItem;
  v5 = [(NTKMoreButtonListItem *)&v12 init];
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
  return NTKClockFaceLocalizedString(@"COMPLICATION_PICKER_MORE_LABEL", @"More");
}

- (unint64_t)ntk_itemType
{
  return 3;
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (NSString)ntk_identifier
{
  return self->_ntk_identifier;
}

- (NSString)ntk_sectionIdentifier
{
  return self->_ntk_sectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ntk_sectionIdentifier, 0);

  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end
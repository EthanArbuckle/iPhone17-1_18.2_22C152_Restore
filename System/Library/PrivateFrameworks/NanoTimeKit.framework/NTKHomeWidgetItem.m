@interface NTKHomeWidgetItem
- (BOOL)isEqual:(id)a3;
- (NSString)localizedName;
- (NSString)ntk_contactIdentifier;
- (NSString)ntk_identifier;
- (NSString)ntk_sectionIdentifier;
- (NTKHomeWidgetItem)initWithSectionIdentifier:(id)a3;
- (NTKWidgetComplication)widgetComplication;
- (unint64_t)ntk_itemType;
- (void)setLocalizedName:(id)a3;
- (void)setWidgetComplication:(id)a3;
@end

@implementation NTKHomeWidgetItem

- (NTKHomeWidgetItem)initWithSectionIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKHomeWidgetItem;
  v5 = [(NTKHomeWidgetItem *)&v12 init];
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

- (unint64_t)ntk_itemType
{
  return 6;
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NTKHomeWidgetItem *)a3;
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
    v6 = [(NTKHomeWidgetItem *)v5 widgetComplication];
    uint64_t v7 = [(NTKHomeWidgetItem *)self widgetComplication];
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

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NTKWidgetComplication)widgetComplication
{
  return self->_widgetComplication;
}

- (void)setWidgetComplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetComplication, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_ntk_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end
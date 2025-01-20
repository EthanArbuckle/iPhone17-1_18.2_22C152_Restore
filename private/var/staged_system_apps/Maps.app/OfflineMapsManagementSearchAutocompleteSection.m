@interface OfflineMapsManagementSearchAutocompleteSection
- (BOOL)isEqual:(id)a3;
- (NSString)headerText;
- (OfflineMapsManagementSearchAutocompleteSection)initWithSectionType:(unint64_t)a3;
- (unint64_t)sectionType;
- (void)setSectionType:(unint64_t)a3;
@end

@implementation OfflineMapsManagementSearchAutocompleteSection

- (OfflineMapsManagementSearchAutocompleteSection)initWithSectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteSection;
  result = [(OfflineMapsManagementSearchAutocompleteSection *)&v5 init];
  if (result) {
    result->_sectionType = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OfflineMapsManagementSearchAutocompleteSection *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(OfflineMapsManagementSearchAutocompleteSection *)v5 sectionType];
    BOOL v7 = v6 == (id)[(OfflineMapsManagementSearchAutocompleteSection *)self sectionType];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)headerText
{
  if ((id)[(OfflineMapsManagementSearchAutocompleteSection *)self sectionType] == (id)1)
  {
    v2 = +[NSBundle mainBundle];
    v3 = [v2 localizedStringForKey:@"Recent Searches [section title]" value:@"localized string not found" table:@"Offline"];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

@end
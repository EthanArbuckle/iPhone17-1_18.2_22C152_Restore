@interface OfflineMapsManagementSection
- (BOOL)isEqual:(id)a3;
- (NSString)footerText;
- (NSString)headerText;
- (OfflineMapsManagementSection)initWithSectionType:(unint64_t)a3;
- (unint64_t)sectionType;
- (void)setSectionType:(unint64_t)a3;
@end

@implementation OfflineMapsManagementSection

- (OfflineMapsManagementSection)initWithSectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSection;
  result = [(OfflineMapsManagementSection *)&v5 init];
  if (result) {
    result->_sectionType = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OfflineMapsManagementSection *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(OfflineMapsManagementSection *)v5 sectionType];
    BOOL v7 = v6 == (id)[(OfflineMapsManagementSection *)self sectionType];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)headerText
{
  unint64_t v2 = [(OfflineMapsManagementSection *)self sectionType];
  if (v2 == 5)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Settings [section title]";
    goto LABEL_5;
  }
  if (v2 == 4)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Suggested Maps [section title]";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:@"Offline"];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)footerText
{
  return 0;
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
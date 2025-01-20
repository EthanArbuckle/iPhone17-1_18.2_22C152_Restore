@interface WFDataConfigurationButtonsSection
- (BOOL)isEqual:(id)a3;
- (NSArray)buttons;
- (NSString)sectionFooter;
- (NSString)sectionIdentifier;
- (NSString)sectionTitle;
- (WFDataConfigurationButtonsSection)initWithButtons:(id)a3;
- (unint64_t)hash;
- (void)setSectionFooter:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation WFDataConfigurationButtonsSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionFooter:(id)a3
{
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (unint64_t)hash
{
  v2 = [(WFDataConfigurationButtonsSection *)self buttons];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFDataConfigurationButtonsSection *)self buttons];
    v6 = [v4 buttons];
    unsigned __int8 v7 = [v5 isEqualToArray:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (WFDataConfigurationButtonsSection)initWithButtons:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFDataConfigurationButtonsSection;
  v6 = [(WFDataConfigurationButtonsSection *)&v13 init];
  unsigned __int8 v7 = v6;
  if (v6)
  {
    sectionIdentifier = v6->_sectionIdentifier;
    v6->_sectionIdentifier = (NSString *)@"Section:FooterButtons";

    sectionTitle = v7->_sectionTitle;
    v7->_sectionTitle = 0;

    sectionFooter = v7->_sectionFooter;
    v7->_sectionFooter = 0;

    objc_storeStrong((id *)&v7->_buttons, a3);
    v11 = v7;
  }

  return v7;
}

@end
@interface WFDataConfigurationParametersSection
- (BOOL)isEqual:(id)a3;
- (NSArray)parameters;
- (NSString)sectionFooter;
- (NSString)sectionIdentifier;
- (NSString)sectionTitle;
- (WFDataConfigurationParametersSection)initWithParameters:(id)a3 sectionIndex:(int64_t)a4;
- (unint64_t)hash;
- (void)setParameters:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation WFDataConfigurationParametersSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setParameters:(id)a3
{
}

- (NSArray)parameters
{
  return self->_parameters;
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
  v2 = [(WFDataConfigurationParametersSection *)self sectionIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFDataConfigurationParametersSection *)self sectionIdentifier];
    v6 = [v4 sectionIdentifier];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (WFDataConfigurationParametersSection)initWithParameters:(id)a3 sectionIndex:(int64_t)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFDataConfigurationParametersSection;
  unsigned __int8 v7 = [(WFDataConfigurationParametersSection *)&v24 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    parameters = v7->_parameters;
    v7->_parameters = v8;

    uint64_t v10 = +[NSString stringWithFormat:@"Section:%ld", a4];
    sectionIdentifier = v7->_sectionIdentifier;
    v7->_sectionIdentifier = (NSString *)v10;

    if ([v6 count] == (id)1)
    {
      v12 = [v6 firstObject];
      if (![v12 allowsMultipleValues])
      {
LABEL_6:

        goto LABEL_7;
      }
      v13 = [v6 firstObject];
      unsigned int v14 = [v13 displaysMultipleValueEditor];

      if (v14)
      {
        v12 = [v6 firstObject];
        v15 = [v12 localizedLabel];
        v16 = (NSString *)[v15 copy];
        sectionTitle = v7->_sectionTitle;
        v7->_sectionTitle = v16;

        goto LABEL_6;
      }
    }
LABEL_7:
    v18 = [v6 lastObject];
    v19 = [v18 localizedDescription];
    v20 = (NSString *)[v19 copy];
    sectionFooter = v7->_sectionFooter;
    v7->_sectionFooter = v20;

    v22 = v7;
  }

  return v7;
}

@end
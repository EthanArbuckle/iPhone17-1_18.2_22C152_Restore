@interface MFSearchSuggestionsTableViewModelReuseConfiguration
- (MFSearchSuggestionsTableViewModelReuseConfiguration)init;
- (MFSearchSuggestionsTableViewModelReuseConfiguration)initWithReuseIdentifier:(id)a3;
- (NSString)reuseIdentifier;
- (id)cellPopulator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rowHeightCalculator;
- (id)rowSelector;
- (void)setCellPopulator:(id)a3;
- (void)setRowHeightCalculator:(id)a3;
- (void)setRowSelector:(id)a3;
- (void)validate;
@end

@implementation MFSearchSuggestionsTableViewModelReuseConfiguration

- (MFSearchSuggestionsTableViewModelReuseConfiguration)init
{
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)initWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFSearchSuggestionsTableViewModelReuseConfiguration;
  v5 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    reuseIdentifier = v5->_reuseIdentifier;
    v5->_reuseIdentifier = v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self reuseIdentifier];
  id v6 = [v4 initWithReuseIdentifier:v5];

  v7 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self cellPopulator];
  [v6 setCellPopulator:v7];

  v8 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self rowHeightCalculator];
  [v6 setRowHeightCalculator:v8];

  objc_super v9 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self rowSelector];
  [v6 setRowSelector:v9];

  return v6;
}

- (void)validate
{
  v3 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self reuseIdentifier];
  if (!v3) {
    sub_10045D308();
  }

  id v4 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self cellPopulator];
  if (!v4) {
    sub_10045D334();
  }

  v5 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self rowHeightCalculator];
  if (!v5) {
    sub_10045D360();
  }

  id v6 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self rowSelector];
  if (!v6) {
    sub_10045D38C();
  }
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (id)cellPopulator
{
  return self->_cellPopulator;
}

- (void)setCellPopulator:(id)a3
{
}

- (id)rowHeightCalculator
{
  return self->_rowHeightCalculator;
}

- (void)setRowHeightCalculator:(id)a3
{
}

- (id)rowSelector
{
  return self->_rowSelector;
}

- (void)setRowSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowSelector, 0);
  objc_storeStrong(&self->_rowHeightCalculator, 0);
  objc_storeStrong(&self->_cellPopulator, 0);

  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

@end
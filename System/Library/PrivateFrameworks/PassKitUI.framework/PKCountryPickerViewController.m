@interface PKCountryPickerViewController
- (NSArray)countries;
- (NSArray)sections;
- (PKCountryPickerViewController)initWithStyle:(int64_t)a3;
- (PKCountryPickerViewControllerDelegate)delegate;
- (UILocalizedIndexedCollation)collation;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_configureSections;
- (void)_loadCountryCodes;
- (void)setCollation:(id)a3;
- (void)setCountries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKCountryPickerViewController

- (PKCountryPickerViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCountryPickerViewController;
  result = [(PKCountryPickerViewController *)&v5 initWithStyle:0];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKCountryPickerViewController;
  [(PKCountryPickerViewController *)&v5 viewDidLoad];
  v3 = [(PKCountryPickerViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];

  v4 = [(PKCountryPickerViewController *)self tableView];
  [v4 setEstimatedRowHeight:44.0];

  [(PKCountryPickerViewController *)self _loadCountryCodes];
}

- (void)_loadCountryCodes
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (v3)
  {
    v19 = self;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
          v10 = objc_alloc_init(PKCountryInfo);
          v11 = PKLocalizedStringForCountryCode();
          [(PKCountryInfo *)v10 setCountryCode:v9];
          [(PKCountryInfo *)v10 setLocalizedCountryName:v11];
          v12 = [MEMORY[0x1E4F5A4A0] addressFormats];
          v13 = [v9 lowercaseString];
          v14 = [v12 objectForKey:v13];

          v15 = [v14 objectForKeyedSubscript:@"EDIT_FORMAT"];

          if (v15) {
            [v21 addObject:v10];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v16 = [v21 copy];
    self = v19;
    countries = v19->_countries;
    v19->_countries = (NSArray *)v16;

    v3 = v18;
  }
  [(PKCountryPickerViewController *)self _configureSections];
}

- (void)_configureSections
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1960] currentCollation];
  collation = self->_collation;
  self->_collation = v3;

  uint64_t v5 = [(PKCountryPickerViewController *)self collation];
  uint64_t v6 = [v5 sectionTitles];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v7)
  {
    uint64_t v9 = v7;
    do
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v8 addObject:v10];

      --v9;
    }
    while (v9);
  }
  uint64_t v24 = v7;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = [(PKCountryPickerViewController *)self countries];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v17 = [(PKCountryPickerViewController *)self collation];
        uint64_t v18 = [v17 sectionForObject:v16 collationStringSelector:sel_localizedCountryName];

        v19 = [v8 objectAtIndexedSubscript:v18];
        [v19 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  if (v7)
  {
    uint64_t v20 = 0;
    do
    {
      v21 = [v8 objectAtIndexedSubscript:v20];
      long long v22 = [(PKCountryPickerViewController *)self collation];
      long long v23 = [v22 sortedArrayFromArray:v21 collationStringSelector:sel_localizedCountryName];

      if (v23) {
        [v8 setObject:v23 atIndexedSubscript:v20];
      }

      ++v20;
    }
    while (v24 != v20);
  }
  [(PKCountryPickerViewController *)self setSections:v8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(UILocalizedIndexedCollation *)self->_collation sectionTitles];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (-[PKCountryPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [(UILocalizedIndexedCollation *)self->_collation sectionTitles];
    uint64_t v7 = [v6 objectAtIndex:a4];
  }

  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  v3 = [(PKCountryPickerViewController *)self collation];
  int64_t v4 = [v3 sectionIndexTitles];

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v6 = [(PKCountryPickerViewController *)self collation];
  int64_t v7 = [v6 sectionForSectionIndexTitleAtIndex:a5];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7)
  {
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"Cell"];
    [v7 setSelectionStyle:3];
    uint64_t v8 = [v7 textLabel];
    [v8 setAdjustsFontSizeToFitWidth:1];
  }
  uint64_t v9 = -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
  uint64_t v10 = [v6 row];

  v11 = [v9 objectAtIndex:v10];
  uint64_t v12 = [v7 textLabel];
  uint64_t v13 = [v11 localizedCountryName];
  [v12 setText:v13];

  if (self->_style == 2)
  {
    uint64_t v14 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v14, v7);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v7 = a4;
  id v8 = a3;
  -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v7 section]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 row];

  uint64_t v10 = [v14 objectAtIndexedSubscript:v9];
  v11 = [(PKCountryPickerViewController *)self delegate];
  uint64_t v12 = [v10 countryCode];
  [v11 countryPicker:self didPickCountryCode:v12];

  uint64_t v13 = [v8 indexPathForSelectedRow];
  [v8 deselectRowAtIndexPath:v13 animated:1];
}

- (PKCountryPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCountryPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setCollation:(id)a3
{
}

- (NSArray)countries
{
  return self->_countries;
}

- (void)setCountries:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_countries, 0);
  objc_storeStrong((id *)&self->_collation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
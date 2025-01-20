@interface CollectionsFilterViewModel
- (BOOL)isSelected;
- (CollectionsFilterViewModel)initWithAddressFilter:(id)a3 isDarkMode:(BOOL)a4;
- (CollectionsFilterViewModel)initWithAllCollectionsAddressFilter:(id)a3 isDarkMode:(BOOL)a4;
- (CollectionsFilterViewModel)initWithAllCollectionsKeywordFilter:(id)a3 isDarkMode:(BOOL)a4;
- (CollectionsFilterViewModel)initWithFilter:(id)a3 isDarkMode:(BOOL)a4;
- (CollectionsFilterViewModel)initWithGuidesHomeConceptFilter:(id)a3 isDarkMode:(BOOL)a4;
- (CollectionsFilterViewModel)initWithKeywordFilter:(id)a3 isDarkMode:(BOOL)a4;
- (GEOAllCollectionsViewResultFilterTypeAddress)allCollectionsAddressFilter;
- (GEOAllCollectionsViewResultFilterTypeKeyword)allCollectionsKeywordFilter;
- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter;
- (GEOPublisherViewResultFilterAddress)addressFilter;
- (GEOPublisherViewResultFilterKeyword)keywordFilter;
- (NSString)filterTitle;
- (UIColor)backgroundColor;
- (UIColor)selectedBackgroundColor;
- (UIColor)textColor;
- (UIFont)filterFont;
- (void)modelSelected:(BOOL)a3 isDarkMode:(BOOL)a4;
- (void)setAddressFilter:(id)a3;
- (void)setAllCollectionsAddressFilter:(id)a3;
- (void)setAllCollectionsKeywordFilter:(id)a3;
- (void)setConceptFilter:(id)a3;
- (void)setFilterFont:(id)a3;
- (void)setKeywordFilter:(id)a3;
- (void)switchToSelectedIsDarkMode:(BOOL)a3;
- (void)switchToUnSelectedIsDarkMode:(BOOL)a3;
@end

@implementation CollectionsFilterViewModel

- (CollectionsFilterViewModel)initWithFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CollectionsFilterViewModel;
  v8 = [(CollectionsFilterViewModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterTitle, a3);
    [(CollectionsFilterViewModel *)v9 switchToUnSelectedIsDarkMode:v4];
  }

  return v9;
}

- (CollectionsFilterViewModel)initWithKeywordFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 searchSuggestion];
  v8 = [v7 displayString];
  v9 = [(CollectionsFilterViewModel *)self initWithFilter:v8 isDarkMode:v4];

  keywordFilter = v9->_keywordFilter;
  v9->_keywordFilter = (GEOPublisherViewResultFilterKeyword *)v6;

  return v9;
}

- (CollectionsFilterViewModel)initWithAddressFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 displayString];
  v8 = [(CollectionsFilterViewModel *)self initWithFilter:v7 isDarkMode:v4];

  addressFilter = v8->_addressFilter;
  v8->_addressFilter = (GEOPublisherViewResultFilterAddress *)v6;

  return v8;
}

- (CollectionsFilterViewModel)initWithAllCollectionsKeywordFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 searchSuggestion];
  v8 = [v7 displayString];
  v9 = [(CollectionsFilterViewModel *)self initWithFilter:v8 isDarkMode:v4];

  allCollectionsKeywordFilter = v9->_allCollectionsKeywordFilter;
  v9->_allCollectionsKeywordFilter = (GEOAllCollectionsViewResultFilterTypeKeyword *)v6;

  return v9;
}

- (CollectionsFilterViewModel)initWithAllCollectionsAddressFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 displayString];
  v8 = [(CollectionsFilterViewModel *)self initWithFilter:v7 isDarkMode:v4];

  allCollectionsAddressFilter = v8->_allCollectionsAddressFilter;
  v8->_allCollectionsAddressFilter = (GEOAllCollectionsViewResultFilterTypeAddress *)v6;

  return v8;
}

- (CollectionsFilterViewModel)initWithGuidesHomeConceptFilter:(id)a3 isDarkMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 searchSuggestion];
  v8 = [v7 displayString];
  v9 = [(CollectionsFilterViewModel *)self initWithFilter:v8 isDarkMode:v4];

  conceptFilter = v9->_conceptFilter;
  v9->_conceptFilter = (GEOGuidesHomeResultFilterTypeConcept *)v6;

  return v9;
}

- (void)modelSelected:(BOOL)a3 isDarkMode:(BOOL)a4
{
  self->_selected = a3;
  if (a3) {
    [(CollectionsFilterViewModel *)self switchToSelectedIsDarkMode:a4];
  }
  else {
    [(CollectionsFilterViewModel *)self switchToUnSelectedIsDarkMode:a4];
  }
}

- (void)switchToSelectedIsDarkMode:(BOOL)a3
{
  if (MapsFeature_IsEnabled_Maps269())
  {
    v5 = +[UIColor whiteColor];
    textColor = self->_textColor;
    self->_textColor = v5;

    id v7 = +[UIColor systemBlueColor];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v7;

    v9 = +[UIColor quaternarySystemFillColor];
    selectedBackgroundColor = self->_selectedBackgroundColor;
    self->_selectedBackgroundColor = v9;

    objc_super v11 = &UIFontTextStyleSubheadline;
  }
  else
  {
    v12 = +[UIColor labelColor];
    v13 = self->_textColor;
    self->_textColor = v12;

    v14 = +[UIColor systemWhiteColor];
    v15 = v14;
    if (a3)
    {
      v16 = [(UIColor *)v14 colorWithAlphaComponent:0.25];
      v17 = self->_backgroundColor;
      self->_backgroundColor = v16;
    }
    else
    {
      v18 = self->_backgroundColor;
      self->_backgroundColor = v14;
      v15 = v18;
    }

    objc_super v11 = &UIFontTextStyleBody;
  }
  v19 = +[UIFont preferredFontForTextStyle:*v11];
  filterFont = self->_filterFont;
  self->_filterFont = v19;
}

- (void)switchToUnSelectedIsDarkMode:(BOOL)a3
{
  if (MapsFeature_IsEnabled_Maps269())
  {
    if (a3) {
      +[UIColor whiteColor];
    }
    else {
    v5 = +[UIColor blackColor];
    }
    textColor = self->_textColor;
    self->_textColor = v5;

    v13 = +[UIColor clearColor];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v13;

    v15 = +[UIColor clearColor];
    selectedBackgroundColor = self->_selectedBackgroundColor;
    self->_selectedBackgroundColor = v15;

    objc_super v11 = &UIFontTextStyleSubheadline;
  }
  else
  {
    id v6 = +[UIColor labelColor];
    id v7 = [v6 colorWithAlphaComponent:0.7];
    v8 = self->_textColor;
    self->_textColor = v7;

    v9 = +[UIColor tertiarySystemFillColor];
    v10 = self->_backgroundColor;
    self->_backgroundColor = v9;

    objc_super v11 = &UIFontTextStyleBody;
  }
  v17 = +[UIFont preferredFontForTextStyle:*v11];
  filterFont = self->_filterFont;
  self->_filterFont = v17;
}

- (GEOPublisherViewResultFilterKeyword)keywordFilter
{
  return self->_keywordFilter;
}

- (void)setKeywordFilter:(id)a3
{
}

- (GEOPublisherViewResultFilterAddress)addressFilter
{
  return self->_addressFilter;
}

- (void)setAddressFilter:(id)a3
{
}

- (GEOAllCollectionsViewResultFilterTypeKeyword)allCollectionsKeywordFilter
{
  return self->_allCollectionsKeywordFilter;
}

- (void)setAllCollectionsKeywordFilter:(id)a3
{
}

- (GEOAllCollectionsViewResultFilterTypeAddress)allCollectionsAddressFilter
{
  return self->_allCollectionsAddressFilter;
}

- (void)setAllCollectionsAddressFilter:(id)a3
{
}

- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter
{
  return self->_conceptFilter;
}

- (void)setConceptFilter:(id)a3
{
}

- (NSString)filterTitle
{
  return self->_filterTitle;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (UIFont)filterFont
{
  return self->_filterFont;
}

- (void)setFilterFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterFont, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_filterTitle, 0);
  objc_storeStrong((id *)&self->_conceptFilter, 0);
  objc_storeStrong((id *)&self->_allCollectionsAddressFilter, 0);
  objc_storeStrong((id *)&self->_allCollectionsKeywordFilter, 0);
  objc_storeStrong((id *)&self->_addressFilter, 0);

  objc_storeStrong((id *)&self->_keywordFilter, 0);
}

@end
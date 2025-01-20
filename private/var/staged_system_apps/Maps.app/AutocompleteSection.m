@interface AutocompleteSection
+ (id)sectionWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5;
- (AutocompleteSection)initWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5;
- (BOOL)isQuerySuggestionsSection;
- (NSString)title;
- (void)setIsQuerySuggestionsSection:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation AutocompleteSection

- (AutocompleteSection)initWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AutocompleteSection;
  v9 = [(PersonalizedCompoundItemGroup *)&v13 initWithItems:a4];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    title = v9->_title;
    v9->_title = v10;

    v9->_isQuerySuggestionsSection = a5;
  }

  return v9;
}

+ (id)sectionWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithTitle:v9 items:v8 isQuerySuggestionsSection:v5];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isQuerySuggestionsSection
{
  return self->_isQuerySuggestionsSection;
}

- (void)setIsQuerySuggestionsSection:(BOOL)a3
{
  self->_isQuerySuggestionsSection = a3;
}

- (void).cxx_destruct
{
}

@end
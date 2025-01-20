@interface RelatedSearchSuggestionComponent
- (BOOL)isRelatedSearchSuggestion;
- (GEORelatedSearchSuggestion)suggestion;
- (NSString)displayText;
- (RelatedSearchSuggestionComponent)initWithDisplayText:(id)a3 substitute:(id)a4;
- (RelatedSearchSuggestionSubstitute)substitute;
- (void)setSubstitute:(id)a3;
@end

@implementation RelatedSearchSuggestionComponent

- (RelatedSearchSuggestionComponent)initWithDisplayText:(id)a3 substitute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RelatedSearchSuggestionComponent;
  v8 = [(RelatedSearchSuggestionComponent *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    displayText = v8->_displayText;
    v8->_displayText = v9;

    objc_storeStrong((id *)&v8->_substitute, a4);
  }

  return v8;
}

- (BOOL)isRelatedSearchSuggestion
{
  return [(RelatedSearchSuggestionSubstitute *)self->_substitute isRelatedSearchSuggestion];
}

- (GEORelatedSearchSuggestion)suggestion
{
  v2 = [(RelatedSearchSuggestionSubstitute *)self->_substitute pdSubstitute];
  v3 = [v2 relatedSearchSuggestion];

  return (GEORelatedSearchSuggestion *)v3;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (RelatedSearchSuggestionSubstitute)substitute
{
  return self->_substitute;
}

- (void)setSubstitute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitute, 0);

  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
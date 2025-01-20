@interface RelatedSearchSuggestionSubstitute
- (BOOL)isRelatedSearchSuggestion;
- (GEODisplayHeaderSubstitute)pdSubstitute;
- (NSString)substituteText;
- (RelatedSearchSuggestionSubstitute)initWithLocation:(unint64_t)a3 substitute:(id)a4;
- (_NSRange)range;
- (void)setPdSubstitute:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation RelatedSearchSuggestionSubstitute

- (RelatedSearchSuggestionSubstitute)initWithLocation:(unint64_t)a3 substitute:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RelatedSearchSuggestionSubstitute;
  v8 = [(RelatedSearchSuggestionSubstitute *)&v19 init];
  v9 = v8;
  if (v8)
  {
    substituteText = v8->_substituteText;
    v8->_substituteText = (NSString *)&stru_101324E70;

    v9->_isRelatedSearchSuggestion = 0;
    unsigned int v11 = [v7 substituteType];
    if (v11 == 2)
    {
      v14 = [v7 relatedSearchSuggestion];
      uint64_t v15 = [v14 displayString];
      v16 = v9->_substituteText;
      v9->_substituteText = (NSString *)v15;

      v9->_isRelatedSearchSuggestion = 1;
    }
    else if (v11 == 1)
    {
      uint64_t v12 = [v7 interpretedQuery];
      v13 = v9->_substituteText;
      v9->_substituteText = (NSString *)v12;
    }
    NSUInteger v17 = [(NSString *)v9->_substituteText length];
    v9->_range.location = a3;
    v9->_range.length = v17;
    objc_storeStrong((id *)&v9->_pdSubstitute, a4);
  }

  return v9;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)substituteText
{
  return self->_substituteText;
}

- (BOOL)isRelatedSearchSuggestion
{
  return self->_isRelatedSearchSuggestion;
}

- (GEODisplayHeaderSubstitute)pdSubstitute
{
  return self->_pdSubstitute;
}

- (void)setPdSubstitute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSubstitute, 0);

  objc_storeStrong((id *)&self->_substituteText, 0);
}

@end
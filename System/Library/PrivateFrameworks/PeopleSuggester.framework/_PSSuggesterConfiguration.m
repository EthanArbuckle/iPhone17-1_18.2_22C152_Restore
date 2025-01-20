@interface _PSSuggesterConfiguration
+ (_PSSuggesterConfiguration)defaultConfiguration;
- (BOOL)excludeBackfillSuggestions;
- (_PSEnsembleModel)suggestionModel;
- (id)description;
- (int64_t)maximumNumberOfSuggestions;
- (void)setExcludeBackfillSuggestions:(BOOL)a3;
- (void)setMaximumNumberOfSuggestions:(int64_t)a3;
- (void)setSuggestionModel:(id)a3;
@end

@implementation _PSSuggesterConfiguration

+ (_PSSuggesterConfiguration)defaultConfiguration
{
  v2 = objc_alloc_init(_PSSuggesterConfiguration);
  [(_PSSuggesterConfiguration *)v2 setMaximumNumberOfSuggestions:8];
  [(_PSSuggesterConfiguration *)v2 setExcludeBackfillSuggestions:0];
  v3 = objc_alloc_init(_PSEnsembleModel);
  [(_PSSuggesterConfiguration *)v2 setSuggestionModel:v3];

  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[_PSSuggesterConfiguration maximumNumberOfSuggestions](self, "maximumNumberOfSuggestions"));
  v6 = [(_PSSuggesterConfiguration *)self suggestionModel];
  v7 = [v3 stringWithFormat:@"<%@ %p> maximumNumberOfSuggestions: %@ suggestionModel: %@", v4, self, v5, v6];

  return v7;
}

- (int64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setMaximumNumberOfSuggestions:(int64_t)a3
{
  self->_maximumNumberOfSuggestions = a3;
}

- (_PSEnsembleModel)suggestionModel
{
  return self->_suggestionModel;
}

- (void)setSuggestionModel:(id)a3
{
}

- (BOOL)excludeBackfillSuggestions
{
  return self->_excludeBackfillSuggestions;
}

- (void)setExcludeBackfillSuggestions:(BOOL)a3
{
  self->_excludeBackfillSuggestions = a3;
}

- (void).cxx_destruct
{
}

@end
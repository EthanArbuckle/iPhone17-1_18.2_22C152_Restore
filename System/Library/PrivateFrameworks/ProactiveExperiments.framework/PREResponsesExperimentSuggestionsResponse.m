@interface PREResponsesExperimentSuggestionsResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)suggestions;
- (PREResponsesExperimentSuggestionsResponse)initWithCoder:(id)a3;
- (PREResponsesExperimentSuggestionsResponse)initWithSuggestions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PREResponsesExperimentSuggestionsResponse

- (void).cxx_destruct
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (unint64_t)hash
{
  v2 = [(PREResponsesExperimentSuggestionsResponse *)self suggestions];
  unint64_t v3 = [v2 hash] + 31;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREResponsesExperimentSuggestionsResponse *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      unint64_t v8 = [(PREResponsesExperimentSuggestionsResponse *)self hash];
      uint64_t v9 = [(PREResponsesExperimentSuggestionsResponse *)v7 hash];

      BOOL v6 = v8 == v9;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v3 = self;
  suggestions = v3->_suggestions;

  return [(PREResponsesExperimentSuggestionsResponse *)v3 initWithSuggestions:suggestions];
}

- (void)encodeWithCoder:(id)a3
{
}

- (PREResponsesExperimentSuggestionsResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PREResponsesExperimentSuggestionsResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"suggestions"];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;
  }
  return v5;
}

- (PREResponsesExperimentSuggestionsResponse)initWithSuggestions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREResponsesExperimentSuggestionsResponse;
  uint64_t v5 = [(PREResponsesExperimentSuggestionsResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
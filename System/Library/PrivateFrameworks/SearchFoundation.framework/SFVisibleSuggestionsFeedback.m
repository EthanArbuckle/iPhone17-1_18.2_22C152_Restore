@interface SFVisibleSuggestionsFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)suggestions;
- (SFVisibleSuggestionsFeedback)initWithCoder:(id)a3;
- (SFVisibleSuggestionsFeedback)initWithSuggestions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation SFVisibleSuggestionsFeedback

- (void).cxx_destruct
{
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFVisibleSuggestionsFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestions, @"_suggestions", v5.receiver, v5.super_class);
}

- (SFVisibleSuggestionsFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFVisibleSuggestionsFeedback;
  objc_super v5 = [(SFFeedback *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_suggestions"];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;
  }
  return v5;
}

- (SFVisibleSuggestionsFeedback)initWithSuggestions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFVisibleSuggestionsFeedback;
  objc_super v5 = [(SFFeedback *)&v9 init];
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
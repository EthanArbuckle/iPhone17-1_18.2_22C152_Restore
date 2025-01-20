@interface SFSuggestionEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (SFSearchSuggestion)suggestion;
- (SFSuggestionEngagementFeedback)initWithCoder:(id)a3;
- (SFSuggestionEngagementFeedback)initWithSuggestion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation SFSuggestionEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setSuggestion:(id)a3
{
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFSuggestionEngagementFeedback;
  id v4 = [(SFFeedback *)&v8 copyWithZone:a3];
  v5 = [(SFSuggestionEngagementFeedback *)self suggestion];
  v6 = (void *)[v5 copy];
  [v4 setSuggestion:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSuggestionEngagementFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestion, @"_suggestion", v5.receiver, v5.super_class);
}

- (SFSuggestionEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSuggestionEngagementFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_suggestion"];
    suggestion = v5->_suggestion;
    v5->_suggestion = (SFSearchSuggestion *)v6;
  }
  return v5;
}

- (SFSuggestionEngagementFeedback)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSuggestionEngagementFeedback;
  uint64_t v6 = [(SFFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestion, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface _PSCNAutocompleteFeedbackTappedSuggestion
+ (BOOL)supportsSecureCoding;
- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithCoder:(id)a3;
- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithSuggestion:(id)a3;
- (_PSSuggestion)suggestion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSCNAutocompleteFeedbackTappedSuggestion

- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackTappedSuggestion;
  v6 = [(_PSCNAutocompleteFeedbackTappedSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestion, a3);
  }

  return v7;
}

- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PSCNAutocompleteFeedbackTappedSuggestion;
  id v5 = [(_PSCNAutocompleteFeedbackTappedSuggestion *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestion"];
    suggestion = v5->_suggestion;
    v5->_suggestion = (_PSSuggestion *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
}

@end
@interface _PSCNAutocompleteFeedbackVendedSuggestions
+ (BOOL)supportsSecureCoding;
- (NSArray)suggestions;
- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithCoder:(id)a3;
- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithSuggestions:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSCNAutocompleteFeedbackVendedSuggestions

- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithSuggestions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackVendedSuggestions;
  v6 = [(_PSCNAutocompleteFeedbackVendedSuggestions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestions, a3);
  }

  return v7;
}

- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSCNAutocompleteFeedbackVendedSuggestions;
  id v5 = [(_PSCNAutocompleteFeedbackVendedSuggestions *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"suggestions"];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;

    v11 = v5;
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

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
}

@end
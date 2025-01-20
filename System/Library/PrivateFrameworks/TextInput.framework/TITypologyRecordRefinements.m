@interface TITypologyRecordRefinements
+ (BOOL)supportsSecureCoding;
- (TIAutocorrectionList)refinements;
- (TIKeyboardCandidate)candidate;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordRefinements)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setRefinements:(id)a3;
@end

@implementation TITypologyRecordRefinements

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinements, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setRefinements:(id)a3
{
}

- (TIAutocorrectionList)refinements
{
  return self->_refinements;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setCandidate:(id)a3
{
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordRefinements *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(TITypologyRecordRefinements *)self refinements];
  id v5 = [v4 candidates];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) candidate];
        [v3 appendFormat:@" \"%@\"", v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v11 = NSString;
  v12 = [(TITypologyRecordRefinements *)self candidate];
  v13 = [v12 candidate];
  v14 = [v11 stringWithFormat:@"REFINEMENTS for \"%@\": %@", v13, v3];

  return v14;
}

- (void)removeContextFromKeyboardState
{
  id v3 = [(TITypologyRecordRefinements *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordRefinements *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordRefinements;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, @"candidate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_refinements forKey:@"refinements"];
}

- (TITypologyRecordRefinements)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordRefinements;
  objc_super v5 = [(TITypologyRecord *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    candidate = v5->_candidate;
    v5->_candidate = (TIKeyboardCandidate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refinements"];
    refinements = v5->_refinements;
    v5->_refinements = (TIAutocorrectionList *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end
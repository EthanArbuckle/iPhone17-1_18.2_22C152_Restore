@interface TITypologyRecordAutocorrections
+ (BOOL)supportsSecureCoding;
- (BOOL)listUIDisplayed;
- (TIAutocorrectionList)autocorrections;
- (TICandidateRequestToken)requestToken;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordAutocorrections)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setAutocorrections:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setListUIDisplayed:(BOOL)a3;
- (void)setRequestToken:(id)a3;
@end

@implementation TITypologyRecordAutocorrections

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocorrections, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (void)setListUIDisplayed:(BOOL)a3
{
  self->_listUIDisplayed = a3;
}

- (BOOL)listUIDisplayed
{
  return self->_listUIDisplayed;
}

- (void)setAutocorrections:(id)a3
{
}

- (TIAutocorrectionList)autocorrections
{
  return self->_autocorrections;
}

- (void)setRequestToken:(id)a3
{
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordAutocorrections *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(TITypologyRecordAutocorrections *)self autocorrections];
  id v5 = [v4 inlineCompletions];
  uint64_t v6 = [v5 count];

  v46 = self;
  if (v6)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v7 = [(TITypologyRecordAutocorrections *)self autocorrections];
    v8 = [v7 inlineCompletions];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v14 = [v13 input];
          v15 = [v13 candidate];
          -[__CFString appendFormat:](v3, "appendFormat:", @"-[\"%@\"->\"%@\"]- ", v14, v15);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v10);
    }

    self = v46;
  }
  v16 = [(TITypologyRecordAutocorrections *)self autocorrections];
  v17 = [v16 corrections];
  v18 = [v17 autocorrection];

  if (v18)
  {
    v19 = [(TITypologyRecordAutocorrections *)self autocorrections];
    v20 = [v19 corrections];
    v21 = [v20 autocorrection];
    v22 = [v21 input];
    v23 = [(TITypologyRecordAutocorrections *)self autocorrections];
    v24 = [v23 corrections];
    v25 = [v24 autocorrection];
    v26 = [v25 candidate];
    [(__CFString *)v3 appendFormat:@"[\"%@\"->\"%@\"]", v22, v26];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v27 = [(TITypologyRecordAutocorrections *)self autocorrections];
  v28 = [v27 predictions];

  obuint64_t j = v28;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        if ([(__CFString *)v3 length]) {
          v34 = @", ";
        }
        else {
          v34 = &stru_1EDBDCE38;
        }
        v35 = [v33 input];
        v36 = [v33 candidate];
        [(__CFString *)v3 appendFormat:@"%@\"%@\"->\"%@\"", v34, v35, v36];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v30);
  }

  v37 = NSString;
  v38 = [(TITypologyRecordAutocorrections *)v46 requestToken];
  v39 = [v38 shortIdentifier];
  v40 = [(TITypologyRecordAutocorrections *)v46 keyboardState];
  v41 = [v40 documentState];
  uint64_t v42 = [(__CFString *)v3 length];
  v43 = @"(none)";
  if (v42) {
    v43 = v3;
  }
  v44 = [v37 stringWithFormat:@"AUTOCORRECTIONS (req=%@ doc=%@) %@", v39, v41, v43];;

  return v44;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordAutocorrections *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordAutocorrections *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordAutocorrections;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, @"keyboardState", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_requestToken forKey:@"requestToken"];
  [v4 encodeObject:self->_autocorrections forKey:@"autocorrections"];
}

- (TITypologyRecordAutocorrections)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordAutocorrections;
  objc_super v5 = [(TITypologyRecord *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestToken"];
    requestToken = v5->_requestToken;
    v5->_requestToken = (TICandidateRequestToken *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocorrections"];
    autocorrections = v5->_autocorrections;
    v5->_autocorrections = (TIAutocorrectionList *)v10;
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
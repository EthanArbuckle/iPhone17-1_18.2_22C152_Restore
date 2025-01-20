@interface TITypologyRecordCandidateResultSet
+ (BOOL)supportsSecureCoding;
- (TICandidateRequestToken)requestToken;
- (TIKeyboardCandidateResultSet)resultSet;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordCandidateResultSet)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setResultSet:(id)a3;
@end

@implementation TITypologyRecordCandidateResultSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_resultSet, 0);

  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (void)setRequestToken:(id)a3
{
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setResultSet:(id)a3
{
}

- (TIKeyboardCandidateResultSet)resultSet
{
  return self->_resultSet;
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
  id v5 = [(TITypologyRecordCandidateResultSet *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(TITypologyRecordCandidateResultSet *)self resultSet];
  id v5 = [v4 uncommittedText];
  v6 = [v3 stringWithFormat:@"CANDIDATES for %@:", v5];

  v7 = [(TITypologyRecordCandidateResultSet *)self resultSet];
  v8 = [v7 candidates];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__TITypologyRecordCandidateResultSet_shortDescription__block_invoke;
  v12[3] = &unk_1E5558C90;
  id v9 = v6;
  id v13 = v9;
  v14 = self;
  [v8 enumerateObjectsUsingBlock:v12];

  id v10 = v9;
  return v10;
}

void __54__TITypologyRecordCandidateResultSet_shortDescription__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  if (a3 > 7)
  {
    v11 = *(void **)(a1 + 32);
    v12 = [*(id *)(a1 + 40) resultSet];
    id v13 = [v12 candidates];
    objc_msgSend(v11, "appendFormat:", @" (%lu total)", objc_msgSend(v13, "count"));

    *a4 = 1;
  }
  else
  {
    v7 = @", %@";
    if (!a3) {
      v7 = @" %@";
    }
    v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v14 candidate];
    objc_msgSend(v8, "appendFormat:", v9, v10);
  }
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordCandidateResultSet *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordCandidateResultSet *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TITypologyRecordCandidateResultSet;
  id v5 = [(TITypologyRecord *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192F9B3D0](v5);
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_resultSet forKey:@"resultSet"];
}

- (TITypologyRecordCandidateResultSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordCandidateResultSet;
  id v5 = [(TITypologyRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resultSet"];
    resultSet = v5->_resultSet;
    v5->_resultSet = (TIKeyboardCandidateResultSet *)v8;
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
@interface TITypologyRecordSync
+ (BOOL)supportsSecureCoding;
- (TIKeyboardConfiguration)keyboardConfig;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordSync)initWithCoder:(id)a3;
- (id)shortDescription;
- (id)textSummary;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setKeyboardConfig:(id)a3;
- (void)setKeyboardState:(id)a3;
@end

@implementation TITypologyRecordSync

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);

  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (void)setKeyboardConfig:(id)a3
{
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
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
  id v5 = [(TITypologyRecordSync *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(TITypologyRecordSync *)self keyboardState];
  id v4 = [v3 documentState];
  id v5 = [v2 stringWithFormat:@"SYNC TO %@", v4];

  return v5;
}

- (id)textSummary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n<context"];
  id v4 = [(TITypologyRecordSync *)self keyboardState];
  id v5 = [v4 documentState];
  v6 = [v5 contextBeforeInput];

  if (v6)
  {
    v7 = [(TITypologyRecordSync *)self keyboardState];
    v8 = [v7 documentState];
    v9 = [v8 contextBeforeInput];
    v10 = __35__TITypologyRecordSync_textSummary__block_invoke(v9);
    [v3 appendFormat:@" before=\"%@\"", v10];
  }
  v11 = [(TITypologyRecordSync *)self keyboardState];
  v12 = [v11 documentState];
  v13 = [v12 selectedText];

  if (v13)
  {
    v14 = [(TITypologyRecordSync *)self keyboardState];
    v15 = [v14 documentState];
    v16 = [v15 selectedText];
    v17 = __35__TITypologyRecordSync_textSummary__block_invoke(v16);
    [v3 appendFormat:@" selected=\"%@\"", v17];
  }
  v18 = [(TITypologyRecordSync *)self keyboardState];
  v19 = [v18 documentState];
  v20 = [v19 contextAfterInput];

  if (v20)
  {
    v21 = [(TITypologyRecordSync *)self keyboardState];
    v22 = [v21 documentState];
    v23 = [v22 contextAfterInput];
    v24 = __35__TITypologyRecordSync_textSummary__block_invoke(v23);
    [v3 appendFormat:@" after=\"%@\"", v24];
  }
  [v3 appendString:@"> "];

  return v3;
}

id __35__TITypologyRecordSync_textSummary__block_invoke(void *a1)
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

  v3 = [v2 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

  return v3;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordSync *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordSync *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSync;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, @"keyboardState", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyboardConfig forKey:@"keyboardConfig"];
}

- (TITypologyRecordSync)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordSync;
  objc_super v5 = [(TITypologyRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardConfig"];
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v8;
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
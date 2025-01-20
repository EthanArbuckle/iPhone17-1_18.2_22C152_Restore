@interface TITypologyRecordGroupMarker
+ (BOOL)supportsSecureCoding;
- (NSString)textChange;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordGroupMarker)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setTextChange:(id)a3;
@end

@implementation TITypologyRecordGroupMarker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textChange, 0);

  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (void)setTextChange:(id)a3
{
}

- (NSString)textChange
{
  return self->_textChange;
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
  id v5 = [(TITypologyRecordGroupMarker *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = [(TITypologyRecordGroupMarker *)self textChange];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_1EDBDCE38;
  }
  v7 = [(TITypologyRecordGroupMarker *)self keyboardState];
  v8 = [v7 documentState];
  v9 = [v8 description];
  v10 = [v3 stringWithFormat:@"RECORD GROUP (%@): \"%@\"", v6, v9];

  return v10;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordGroupMarker *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordGroupMarker *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordGroupMarker;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, @"keyboardState", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_textChange forKey:@"textChange"];
}

- (TITypologyRecordGroupMarker)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordGroupMarker;
  objc_super v5 = [(TITypologyRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textChange"];
    textChange = v5->_textChange;
    v5->_textChange = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
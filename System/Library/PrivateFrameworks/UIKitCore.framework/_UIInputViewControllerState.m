@interface _UIInputViewControllerState
+ (BOOL)supportsSecureCoding;
+ (id)stateForKeyboardState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsInputModeSwitchKey;
- (NSUUID)documentIdentifier;
- (TIDocumentState)documentState;
- (TITextInputTraits)textInputTraits;
- (UITextInputMode)documentInputMode;
- (_UIInputViewControllerState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)createDocumentStateIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setDocumentInputMode:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setNeedsInputModeSwitchKey:(BOOL)a3;
- (void)setTextInputTraits:(id)a3;
@end

@implementation _UIInputViewControllerState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stateForKeyboardState:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIInputViewControllerState);
  v5 = [v3 documentState];
  [(_UIInputViewControllerState *)v4 setDocumentState:v5];

  v6 = [v3 textInputTraits];
  [(_UIInputViewControllerState *)v4 setTextInputTraits:v6];

  v7 = +[UIKeyboardInputModeController sharedInputModeController];
  v8 = [v7 documentInputMode];
  [(_UIInputViewControllerState *)v4 setDocumentInputMode:v8];

  v9 = [v3 documentIdentifier];

  [(_UIInputViewControllerState *)v4 setDocumentIdentifier:v9];
  [(_UIInputViewControllerState *)v4 setNeedsInputModeSwitchKey:UIInputViewControllerRequiresInputModeSwitchKey()];
  return v4;
}

- (void)createDocumentStateIfNecessary
{
  id v3 = [(_UIInputViewControllerState *)self documentState];

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE2A8]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_1ED0E84C0, 0, &stru_1ED0E84C0, &stru_1ED0E84C0, 0x7FFFFFFFFFFFFFFFLL, 0);
    [(_UIInputViewControllerState *)self setDocumentState:v4];

    BOOL v5 = UIInputViewControllerRequiresInputModeSwitchKey();
    [(_UIInputViewControllerState *)self setNeedsInputModeSwitchKey:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_UIInputViewControllerState);
  if (v4)
  {
    uint64_t v5 = [(TIDocumentState *)self->_documentState copy];
    documentState = v4->_documentState;
    v4->_documentState = (TIDocumentState *)v5;

    uint64_t v7 = [(TITextInputTraits *)self->_textInputTraits copy];
    textInputTraits = v4->_textInputTraits;
    v4->_textInputTraits = (TITextInputTraits *)v7;

    uint64_t v9 = [(UITextInputMode *)self->_documentInputMode copy];
    documentInputMode = v4->_documentInputMode;
    v4->_documentInputMode = (UITextInputMode *)v9;

    uint64_t v11 = [(NSUUID *)self->_documentIdentifier copy];
    documentIdentifier = v4->_documentIdentifier;
    v4->_documentIdentifier = (NSUUID *)v11;

    v4->_needsInputModeSwitchKey = self->_needsInputModeSwitchKey;
  }
  return v4;
}

- (_UIInputViewControllerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIInputViewControllerState;
  uint64_t v5 = [(_UIInputViewControllerState *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textInputTraits"];
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentInputMode"];
    documentInputMode = v5->_documentInputMode;
    v5->_documentInputMode = (UITextInputMode *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentIdentifier"];
    documentIdentifier = v5->_documentIdentifier;
    v5->_documentIdentifier = (NSUUID *)v12;

    v5->_needsInputModeSwitchKey = [v4 decodeBoolForKey:@"needsInputModeSwitchKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  documentState = self->_documentState;
  id v9 = v4;
  if (documentState)
  {
    [v4 encodeObject:documentState forKey:@"documentState"];
    id v4 = v9;
  }
  textInputTraits = self->_textInputTraits;
  if (textInputTraits)
  {
    [v9 encodeObject:textInputTraits forKey:@"textInputTraits"];
    id v4 = v9;
  }
  documentInputMode = self->_documentInputMode;
  if (documentInputMode)
  {
    [v9 encodeObject:documentInputMode forKey:@"documentInputMode"];
    id v4 = v9;
  }
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier)
  {
    [v9 encodeObject:documentIdentifier forKey:@"documentIdentifier"];
    id v4 = v9;
  }
  if (self->_needsInputModeSwitchKey)
  {
    [v9 encodeBool:1 forKey:@"needsInputModeSwitchKey"];
    id v4 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(_UIInputViewControllerState *)self documentState];
    uint64_t v7 = [v5 documentState];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_8;
    }
    id v9 = [(_UIInputViewControllerState *)self textInputTraits];
    uint64_t v10 = [v5 textInputTraits];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
    uint64_t v12 = [(_UIInputViewControllerState *)self documentInputMode];
    v13 = [v5 documentInputMode];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_8;
    }
    objc_super v15 = [(_UIInputViewControllerState *)self documentIdentifier];
    v16 = [v5 documentIdentifier];
    int v17 = [v15 isEqual:v16];

    if (v17)
    {
      BOOL v18 = [(_UIInputViewControllerState *)self needsInputModeSwitchKey];
      int v19 = v18 ^ [v5 needsInputModeSwitchKey] ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(_UIInputViewControllerState *)self documentState];
  [v3 appendFormat:@"; documentState = %@", v4];

  id v5 = [(_UIInputViewControllerState *)self textInputTraits];
  [v3 appendFormat:@"; textInputTraits = %@", v5];

  uint64_t v6 = [(_UIInputViewControllerState *)self documentInputMode];
  [v3 appendFormat:@"; documentInputMode = %@", v6];

  uint64_t v7 = [(_UIInputViewControllerState *)self documentIdentifier];
  [v3 appendFormat:@"; documentIdentifier = %@", v7];

  BOOL v8 = [(_UIInputViewControllerState *)self needsInputModeSwitchKey];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  [v3 appendFormat:@"; needsInputModeSwitchKey = %@", v9];
  [v3 appendString:@">"];
  return v3;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (void)setDocumentInputMode:(id)a3
{
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (BOOL)needsInputModeSwitchKey
{
  return self->_needsInputModeSwitchKey;
}

- (void)setNeedsInputModeSwitchKey:(BOOL)a3
{
  self->_needsInputModeSwitchKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
}

@end
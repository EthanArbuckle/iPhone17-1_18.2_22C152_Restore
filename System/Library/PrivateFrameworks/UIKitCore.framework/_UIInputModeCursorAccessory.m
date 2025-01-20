@interface _UIInputModeCursorAccessory
- (NSString)dictationLanguage;
- (NSString)inputModeIdentifier;
- (_UIInputModeCursorAccessory)initWithCoder:(id)a3;
- (id)descriptionBuilder;
- (id)identifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDictationLanguage:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
@end

@implementation _UIInputModeCursorAccessory

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIInputModeCursorAccessory;
  [(_UICursorAccessory *)&v6 encodeWithCoder:v4];
  inputModeIdentifier = self->_inputModeIdentifier;
  if (inputModeIdentifier) {
    [v4 encodeObject:inputModeIdentifier forKey:@"inputModeIdentifier"];
  }
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)_UIInputModeCursorAccessory;
  unint64_t v3 = [(_UICursorAccessory *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_inputModeIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_dictationLanguage hash];
}

- (_UIInputModeCursorAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIInputModeCursorAccessory;
  v5 = [(_UICursorAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputModeIdentifier"];
    inputModeIdentifier = v5->_inputModeIdentifier;
    v5->_inputModeIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)descriptionBuilder
{
  v5.receiver = self;
  v5.super_class = (Class)_UIInputModeCursorAccessory;
  unint64_t v3 = [(_UICursorAccessory *)&v5 descriptionBuilder];
  [v3 appendString:self->_inputModeIdentifier withName:@"inputModeIdentifier"];
  [v3 appendString:self->_dictationLanguage withName:@"dictationLanguage"];
  return v3;
}

- (id)identifier
{
  v10.receiver = self;
  v10.super_class = (Class)_UIInputModeCursorAccessory;
  unint64_t v3 = [(_UICursorAccessory *)&v10 identifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(_UIInputModeCursorAccessory *)self dictationLanguage];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(_UIInputModeCursorAccessory *)self inputModeIdentifier];
    }
    id v5 = v8;
  }
  return v5;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (NSString)dictationLanguage
{
  return self->_dictationLanguage;
}

- (void)setDictationLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationLanguage, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
}

@end
@interface TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount
+ (BOOL)supportsSecureCoding;
- (NSNumber)syllableCount;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount

- (void).cxx_destruct
{
}

- (NSNumber)syllableCount
{
  return self->_syllableCount;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<Syllable Count: %@>", self->_syllableCount];
}

- (void)sendTo:(id)a3
{
  syllableCount = self->_syllableCount;
  id v5 = a3;
  uint64_t v6 = [(NSNumber *)syllableCount unsignedIntegerValue];
  id v7 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  [v5 addDrawInputWithSyllableCount:v6 keyboardState:v7];
}

- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  id v5 = [(TIKeyboardInteractionProtocolBase *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syllableCount"];
    syllableCount = v5->_syllableCount;
    v5->_syllableCount = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_syllableCount, @"syllableCount", v5.receiver, v5.super_class);
}

- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  objc_super v5 = [(TIKeyboardInteractionProtocolBase *)&v9 initWithKeyboardState:a4];
  if (v5)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    syllableCount = v5->_syllableCount;
    v5->_syllableCount = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
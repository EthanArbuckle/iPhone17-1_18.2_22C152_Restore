@interface TypistKeyboardAmharic
- (BOOL)isConsonant:(unsigned __int16)a3;
- (BOOL)isJoinedConsonantAndVowelCharacter:(unsigned __int16)a3;
- (BOOL)isPopoverCombo:(id)a3 withIndex:(int64_t)a4;
- (BOOL)isTapKey:(id)a3;
- (NSCharacterSet)keycapAndPopoverConstants;
- (NSCharacterSet)keycapAndPopoverVowels;
- (TypistKeyboardAmharic)initWithCoder:(id)a3;
- (id)decomposeAmharicChar:(unsigned __int16)a3;
- (id)decomposeAmharicStrings:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setKeycapAndPopoverConstants:(id)a3;
- (void)setKeycapAndPopoverVowels:(id)a3;
@end

@implementation TypistKeyboardAmharic

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardAmharic;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"am"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 characterSetWithCharactersInString:@"እኡኢኦ"];
  [(TypistKeyboardAmharic *)self setKeycapAndPopoverVowels:v9];

  v10 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ሇዏዯፇ"];
  [(TypistKeyboardAmharic *)self setKeycapAndPopoverConstants:v10];

  v13.receiver = self;
  v13.super_class = (Class)TypistKeyboardAmharic;
  v11 = [(TypistKeyboard *)&v13 setupKeyboardInfo:v8 options:v7];

  return v11;
}

- (BOOL)isJoinedConsonantAndVowelCharacter:(unsigned __int16)a3
{
  BOOL v3 = (a3 - 4608) < 0xA0 || (a3 - 4776) < 0xB3;
  return (a3 & 7) != 0 && v3;
}

- (BOOL)isConsonant:(unsigned __int16)a3
{
  return (a3 & 7) == 0 && (a3 - 4608) < 0x15B && a3 != 4768;
}

- (BOOL)isTapKey:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v5 = [(TypistKeyboard *)self keyPlanes];
  v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = [(TypistKeyboard *)self keyPlanes];
        objc_super v13 = [v12 objectForKeyedSubscript:v11];
        v14 = [v13 objectForKeyedSubscript:v4];

        if (v14)
        {
          v16 = [(TypistKeyboard *)self keyPlanes];
          v17 = [v16 objectForKeyedSubscript:v11];
          v18 = [v17 objectForKeyedSubscript:v4];
          v19 = [v18 objectForKeyedSubscript:@"action"];
          char v15 = [v19 isEqualToString:@"tap"];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)isPopoverCombo:(id)a3 withIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v7 = [(TypistKeyboardAmharic *)self keycapAndPopoverVowels];
    if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", a4))) {
      BOOL v8 = -[TypistKeyboardAmharic isConsonant:](self, "isConsonant:", [v6 characterAtIndex:a4 - 1]);
    }
    else {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)decomposeAmharicStrings:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NSString string];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v4 characterAtIndex:v6];
      if ([(TypistKeyboardAmharic *)self isPopoverCombo:v4 withIndex:v6])
      {
        [v5 stringByAppendingFormat:@"%@%C", @"‍", v7];
      }
      else
      {
        if ([(TypistKeyboardAmharic *)self isJoinedConsonantAndVowelCharacter:v7])
        {
          BOOL v8 = [(TypistKeyboardAmharic *)self keycapAndPopoverConstants];
          char v9 = [v8 characterIsMember:v7];

          if ((v9 & 1) == 0)
          {
            uint64_t v11 = [(TypistKeyboardAmharic *)self decomposeAmharicChar:v7];
            v10 = [v5 stringByAppendingString:v11];

            objc_super v5 = (void *)v11;
            goto LABEL_9;
          }
        }
        objc_msgSend(v5, "stringByAppendingFormat:", @"%C", v7, v13);
      v10 = };
LABEL_9:

      ++v6;
      objc_super v5 = v10;
      if ([v4 length] <= v6) {
        goto LABEL_13;
      }
    }
  }
  v10 = v5;
LABEL_13:

  return v10;
}

- (id)decomposeAmharicChar:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  __int16 v11 = a3 & 0xFFF8;
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", a3 & 0xFFF8);
  LOBYTE(self) = [(TypistKeyboardAmharic *)self isTapKey:v5];

  if (self)
  {
    unsigned int v6 = v3 & 7;
    if (v6 > 2)
    {
      __int16 v12 = [@"⇧" characterAtIndex:0];
      __int16 v13 = v6 | 0x12A0;
      uint64_t v7 = NSString;
      uint64_t v8 = 3;
    }
    else
    {
      __int16 v12 = v6 | 0x12A0;
      uint64_t v7 = NSString;
      uint64_t v8 = 2;
    }
    char v9 = [v7 stringWithCharacters:&v11 length:v8];
  }
  else
  {
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v3);
  }
  return v9;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4 = [(TypistKeyboardAmharic *)self decomposeAmharicStrings:a3];
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardAmharic;
  objc_super v5 = [(TypistKeyboard *)&v7 generateKeystrokeStream:v4];

  return v5;
}

- (TypistKeyboardAmharic)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardAmharic;
  objc_super v5 = [(TypistKeyboard *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keycapAndPopoverVowels"];
    keycapAndPopoverVowels = v5->_keycapAndPopoverVowels;
    v5->_keycapAndPopoverVowels = (NSCharacterSet *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keycapAndPopoverConstants"];
    keycapAndPopoverConstants = v5->_keycapAndPopoverConstants;
    v5->_keycapAndPopoverConstants = (NSCharacterSet *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardAmharic;
  [(TypistKeyboard *)&v7 encodeWithCoder:v4];
  keycapAndPopoverVowels = self->_keycapAndPopoverVowels;
  if (keycapAndPopoverVowels) {
    [v4 encodeObject:keycapAndPopoverVowels forKey:@"keycapAndPopoverVowels"];
  }
  keycapAndPopoverConstants = self->_keycapAndPopoverConstants;
  if (keycapAndPopoverConstants) {
    [v4 encodeObject:keycapAndPopoverConstants forKey:@"keycapAndPopoverConstants"];
  }
}

- (NSCharacterSet)keycapAndPopoverVowels
{
  return self->_keycapAndPopoverVowels;
}

- (void)setKeycapAndPopoverVowels:(id)a3
{
}

- (NSCharacterSet)keycapAndPopoverConstants
{
  return self->_keycapAndPopoverConstants;
}

- (void)setKeycapAndPopoverConstants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keycapAndPopoverConstants, 0);
  objc_storeStrong((id *)&self->_keycapAndPopoverVowels, 0);
}

@end
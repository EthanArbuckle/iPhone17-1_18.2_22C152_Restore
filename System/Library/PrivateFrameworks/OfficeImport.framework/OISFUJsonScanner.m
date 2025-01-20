@interface OISFUJsonScanner
- (BOOL)parseConstantString:(const char *)a3;
- (OISFUJsonScanner)initWithString:(id)a3;
- (id)parseArrayWithMaxDepth:(int)a3;
- (id)parseDictionaryWithMaxDepth:(int)a3;
- (id)parseFalse;
- (id)parseHexCharacter;
- (id)parseNull;
- (id)parseNumber;
- (id)parseObjectWithMaxDepth:(int)a3;
- (id)parseString;
- (id)parseTrue;
- (unsigned)nextCharacter;
- (void)appendCharactersInRange:(_NSRange)a3 toString:(id)a4;
- (void)dealloc;
- (void)skipWhitespace;
@end

@implementation OISFUJsonScanner

- (OISFUJsonScanner)initWithString:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OISFUJsonScanner;
  v4 = [(OISFUJsonScanner *)&v8 init];
  if (v4)
  {
    v4->mString = (NSString *)a3;
    uint64_t v5 = [a3 length];
    v4->mLength = v5;
    v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    v4->mCharacters = v6;
    [a3 getCharacters:v6];
    v4->mWhitespaceCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v4->mDecimalDigitCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] decimalDigitCharacterSet];
  }
  return v4;
}

- (void)dealloc
{
  free(self->mCharacters);
  v3.receiver = self;
  v3.super_class = (Class)OISFUJsonScanner;
  [(OISFUJsonScanner *)&v3 dealloc];
}

- (unsigned)nextCharacter
{
  unint64_t mOffset = self->mOffset;
  if (mOffset >= self->mLength) {
    return 0;
  }
  mCharacters = self->mCharacters;
  self->unint64_t mOffset = mOffset + 1;
  return mCharacters[mOffset];
}

- (void)skipWhitespace
{
  unint64_t mOffset = self->mOffset;
  if (mOffset < self->mLength)
  {
    do
    {
      if (![(NSCharacterSet *)self->mWhitespaceCharacterSet characterIsMember:self->mCharacters[mOffset]])break; {
      unint64_t mLength = self->mLength;
      }
      unint64_t mOffset = self->mOffset + 1;
      self->unint64_t mOffset = mOffset;
    }
    while (mOffset < mLength);
  }
}

- (id)parseHexCharacter
{
  __int16 v3 = 0;
  uint64_t v4 = 4;
  while (1)
  {
    int v5 = [(OISFUJsonScanner *)self nextCharacter];
    __int16 v6 = v5 - 48;
    if ((v5 - 48) >= 0xA) {
      break;
    }
LABEL_7:
    __int16 v3 = (16 * v3) | v6;
    if (!--v4)
    {
      __int16 v8 = v3;
      return (id)[NSString stringWithCharacters:&v8 length:1];
    }
  }
  if ((v5 - 97) <= 5)
  {
    __int16 v6 = v5 - 87;
    goto LABEL_7;
  }
  if ((v5 - 65) <= 5)
  {
    __int16 v6 = v5 - 55;
    goto LABEL_7;
  }
  return 0;
}

- (void)appendCharactersInRange:(_NSRange)a3 toString:(id)a4
{
  if (a3.length)
  {
    id v5 = (id)[[NSString alloc] initWithCharactersNoCopy:&self->mCharacters[a3.location] length:a3.length freeWhenDone:0];
    [a4 appendString:v5];
  }
}

- (id)parseString
{
  if ([(OISFUJsonScanner *)self nextCharacter] != 34) {
    return 0;
  }
  unint64_t mOffset = self->mOffset;
  uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  while (2)
  {
    uint64_t v5 = 0;
    while (1)
    {
      unsigned int v6 = [(OISFUJsonScanner *)self nextCharacter];
      if (v6 == 34)
      {
        -[OISFUJsonScanner appendCharactersInRange:toString:](self, "appendCharactersInRange:toString:", mOffset, v5, v4);
        return v4;
      }
      unsigned int v7 = v6;
      if (v6 == 92) {
        break;
      }
      id result = 0;
      if (v7 >= 0x20)
      {
        ++v5;
        if (v7 - 127 >= 0x21) {
          continue;
        }
      }
      return result;
    }
    -[OISFUJsonScanner appendCharactersInRange:toString:](self, "appendCharactersInRange:toString:", mOffset, v5, v4);
    int v9 = [(OISFUJsonScanner *)self nextCharacter];
    id result = 0;
    if (v9 > 97)
    {
      switch(v9)
      {
        case 'n':
          v10 = @"\n";
          goto LABEL_26;
        case 'o':
        case 'p':
        case 'q':
        case 's':
          return result;
        case 'r':
          v10 = @"\r";
          goto LABEL_26;
        case 't':
          v10 = @"\t";
          goto LABEL_26;
        case 'u':
          id result = [(OISFUJsonScanner *)self parseHexCharacter];
          v10 = (__CFString *)result;
          if (result) {
            goto LABEL_26;
          }
          return result;
        default:
          if (v9 == 98)
          {
            v10 = @"\b";
          }
          else
          {
            if (v9 != 102) {
              return result;
            }
            v10 = @"\f";
          }
          break;
      }
      goto LABEL_26;
    }
    switch(v9)
    {
      case '""':
        v10 = @"\"";
LABEL_26:
        [v4 appendString:v10];
        unint64_t mOffset = self->mOffset;
        continue;
      case '/':
        v10 = @"/";
        goto LABEL_26;
      case '\\':
        v10 = @"\\"";
        goto LABEL_26;
    }
  }
  return result;
}

- (id)parseDictionaryWithMaxDepth:(int)a3
{
  int v5 = [(OISFUJsonScanner *)self nextCharacter];
  id result = 0;
  BOOL v7 = __OFSUB__(a3, 1);
  uint64_t v8 = (a3 - 1);
  if ((int)v8 < 0 == v7 && v5 == 123)
  {
    [(OISFUJsonScanner *)self skipWhitespace];
    unint64_t mOffset = self->mOffset;
    if (mOffset < self->mLength && self->mCharacters[mOffset] == 125)
    {
      self->unint64_t mOffset = mOffset + 1;
      v10 = NSDictionary;
      return (id)[v10 dictionary];
    }
    else
    {
      v11 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      id result = [(OISFUJsonScanner *)self parseString];
      if (result)
      {
        id v12 = result;
        while (1)
        {
          [(OISFUJsonScanner *)self skipWhitespace];
          if ([(OISFUJsonScanner *)self nextCharacter] != 58) {
            return 0;
          }
          [(OISFUJsonScanner *)self skipWhitespace];
          id result = [(OISFUJsonScanner *)self parseObjectWithMaxDepth:v8];
          if (!result) {
            return result;
          }
          [v11 setObject:result forKey:v12];
          [(OISFUJsonScanner *)self skipWhitespace];
          int v13 = [(OISFUJsonScanner *)self nextCharacter];
          if (v13 != 44) {
            break;
          }
          [(OISFUJsonScanner *)self skipWhitespace];
          id result = [(OISFUJsonScanner *)self parseString];
          id v12 = result;
          if (!result) {
            return result;
          }
        }
        if (v13 == 125) {
          return v11;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (id)parseArrayWithMaxDepth:(int)a3
{
  int v5 = [(OISFUJsonScanner *)self nextCharacter];
  id result = 0;
  BOOL v7 = __OFSUB__(a3, 1);
  uint64_t v8 = (a3 - 1);
  if ((int)v8 < 0 == v7 && v5 == 91)
  {
    [(OISFUJsonScanner *)self skipWhitespace];
    unint64_t mOffset = self->mOffset;
    if (mOffset < self->mLength && self->mCharacters[mOffset] == 93)
    {
      self->unint64_t mOffset = mOffset + 1;
      v10 = (void *)MEMORY[0x263EFF8C0];
      return (id)[v10 array];
    }
    else
    {
      v11 = (void *)[MEMORY[0x263EFF980] array];
      id result = [(OISFUJsonScanner *)self parseObjectWithMaxDepth:v8];
      if (result)
      {
        id v12 = result;
        while (1)
        {
          [v11 addObject:v12];
          [(OISFUJsonScanner *)self skipWhitespace];
          int v13 = [(OISFUJsonScanner *)self nextCharacter];
          if (v13 != 44) {
            break;
          }
          [(OISFUJsonScanner *)self skipWhitespace];
          id result = [(OISFUJsonScanner *)self parseObjectWithMaxDepth:v8];
          id v12 = result;
          if (!result) {
            return result;
          }
        }
        if (v13 == 93) {
          return v11;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)parseConstantString:(const char *)a3
{
  if (!*a3) {
    return 1;
  }
  uint64_t v4 = a3 + 1;
  do
  {
    BOOL result = [(OISFUJsonScanner *)self nextCharacter] == *(v4 - 1);
    if (!result) {
      break;
    }
  }
  while (*(unsigned __int8 *)v4++);
  return result;
}

- (id)parseNull
{
  if (![(OISFUJsonScanner *)self parseConstantString:"null"]) {
    return 0;
  }
  v2 = (void *)MEMORY[0x263EFF9D0];
  return (id)[v2 null];
}

- (id)parseTrue
{
  if (![(OISFUJsonScanner *)self parseConstantString:"true"]) {
    return 0;
  }
  v2 = NSNumber;
  return (id)[v2 numberWithBool:1];
}

- (id)parseFalse
{
  if (![(OISFUJsonScanner *)self parseConstantString:"false"]) {
    return 0;
  }
  v2 = NSNumber;
  return (id)[v2 numberWithBool:0];
}

- (id)parseNumber
{
  unint64_t mOffset = self->mOffset;
  uint64_t v4 = [(OISFUJsonScanner *)self nextCharacter];
  if (v4 == 45) {
    uint64_t v4 = [(OISFUJsonScanner *)self nextCharacter];
  }
  if ([(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:v4])
  {
    do
    {
      uint64_t v5 = [(OISFUJsonScanner *)self nextCharacter];
      if (!v5) {
        goto LABEL_17;
      }
      int v6 = v5;
    }
    while ([(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:v5]);
    if (v6 == 46)
    {
      if (![(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:[(OISFUJsonScanner *)self nextCharacter]])return 0; {
      do
      }
      {
        uint64_t v7 = [(OISFUJsonScanner *)self nextCharacter];
        if (!v7) {
          goto LABEL_17;
        }
        int v6 = v7;
      }
      while ([(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:v7]);
    }
    if ((v6 & 0xFFFFFFDF) != 0x45)
    {
LABEL_17:
      --self->mOffset;
      v11 = (void *)[[NSString alloc] initWithCharactersNoCopy:&self->mCharacters[mOffset] length:self->mOffset - mOffset freeWhenDone:0];
      id v12 = objc_msgSend(MEMORY[0x263F087B0], "decimalNumberWithString:locale:", v11, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @".", *MEMORY[0x263EFF4E8]));

      return v12;
    }
    uint64_t v8 = [(OISFUJsonScanner *)self nextCharacter];
    if (v8 == 45 || (uint64_t v9 = v8, v8 == 43)) {
      uint64_t v9 = [(OISFUJsonScanner *)self nextCharacter];
    }
    if ([(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:v9])
    {
      do
        uint64_t v10 = [(OISFUJsonScanner *)self nextCharacter];
      while (v10
           && [(NSCharacterSet *)self->mDecimalDigitCharacterSet characterIsMember:v10]);
      goto LABEL_17;
    }
  }
  return 0;
}

- (id)parseObjectWithMaxDepth:(int)a3
{
  [(OISFUJsonScanner *)self skipWhitespace];
  uint64_t v5 = (a3 - 1);
  if (a3 < 1) {
    return 0;
  }
  unsigned int v6 = self->mCharacters[self->mOffset];
  if (v6 > 0x6D)
  {
    switch(v6)
    {
      case 'n':
        return [(OISFUJsonScanner *)self parseNull];
      case 't':
        return [(OISFUJsonScanner *)self parseTrue];
      case '{':
        return [(OISFUJsonScanner *)self parseDictionaryWithMaxDepth:v5];
      default:
LABEL_28:
        return [(OISFUJsonScanner *)self parseNumber];
    }
  }
  else
  {
    switch(v6)
    {
      case '""':
        return [(OISFUJsonScanner *)self parseString];
      case '[':
        return [(OISFUJsonScanner *)self parseArrayWithMaxDepth:v5];
      case 'f':
        return [(OISFUJsonScanner *)self parseFalse];
      default:
        goto LABEL_28;
    }
  }
}

@end
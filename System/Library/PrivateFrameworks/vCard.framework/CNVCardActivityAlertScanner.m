@interface CNVCardActivityAlertScanner
+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3;
+ (id)scanAlertValueFromString:(id)a3;
+ (id)scannerWithString:(id)a3;
- (BOOL)atEnd;
- (BOOL)scanPastCharacter:(unsigned __int16)a3;
- (BOOL)scanPastItemDelimiter;
- (BOOL)scanPastKeyValueSeparator;
- (CNVCardActivityAlertScanner)initWithString:(id)a3;
- (id)scanAlertValue;
- (id)scanKeyValuePair;
- (id)scanQuotedStringValue;
- (id)scanStringValue;
- (id)scanUnquotedStringValue;
- (unint64_t)position;
- (unsigned)nextCharacter;
- (unsigned)nextUnescapedCharacter;
- (unsigned)scanCharacter;
- (unsigned)scanCharacterWithEscaping:(BOOL)a3;
- (void)scanPastWhitespace;
@end

@implementation CNVCardActivityAlertScanner

+ (id)scanAlertValueFromString:(id)a3
{
  v3 = [a1 scannerWithString:a3];
  v4 = [v3 scanAlertValue];

  return v4;
}

+ (id)scannerWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (CNVCardActivityAlertScanner)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardActivityAlertScanner;
  v5 = [(CNVCardActivityAlertScanner *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_position = 0;
    v8 = v5;
  }

  return v5;
}

- (id)scanAlertValue
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  do
  {
    id v4 = [(CNVCardActivityAlertScanner *)self scanKeyValuePair];
    [v3 addEntriesFromDictionary:v4];
  }
  while ([(CNVCardActivityAlertScanner *)self scanPastItemDelimiter]);
  return v3;
}

- (id)scanKeyValuePair
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNVCardActivityAlertScanner *)self scanStringValue];
  [(CNVCardActivityAlertScanner *)self scanPastKeyValueSeparator];
  id v4 = [(CNVCardActivityAlertScanner *)self scanStringValue];
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v3) & 1) != 0
    || ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v4) & 1) != 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v8 = v3;
    v9[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }

  return v6;
}

- (id)scanStringValue
{
  if ([(CNVCardActivityAlertScanner *)self atEnd])
  {
    v3 = 0;
  }
  else
  {
    if ([(CNVCardActivityAlertScanner *)self nextUnescapedCharacter] == 34) {
      [(CNVCardActivityAlertScanner *)self scanQuotedStringValue];
    }
    else {
    v3 = [(CNVCardActivityAlertScanner *)self scanUnquotedStringValue];
    }
  }
  return v3;
}

- (id)scanUnquotedStringValue
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if (![(CNVCardActivityAlertScanner *)self atEnd])
  {
    do
    {
      if (!objc_msgSend((id)objc_opt_class(), "characterIsStringValueCharacter:", -[CNVCardActivityAlertScanner nextCharacter](self, "nextCharacter")))break; {
      objc_msgSend(v3, "appendFormat:", @"%C", -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
      }
    }
    while (![(CNVCardActivityAlertScanner *)self atEnd]);
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)scanQuotedStringValue
{
  [(CNVCardActivityAlertScanner *)self scanCharacter];
  v3 = [MEMORY[0x1E4F28E78] string];
  if (![(CNVCardActivityAlertScanner *)self atEnd])
  {
    do
    {
      if ([(CNVCardActivityAlertScanner *)self nextUnescapedCharacter] == 34) {
        break;
      }
      objc_msgSend(v3, "appendFormat:", @"%C", -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (![(CNVCardActivityAlertScanner *)self atEnd]);
  }
  [(CNVCardActivityAlertScanner *)self scanCharacter];
  return v3;
}

+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  char v5 = [v4 characterIsMember:v3];

  if (v5) {
    return 0;
  }
  return v3 != 61 && v3 != 44;
}

- (BOOL)scanPastKeyValueSeparator
{
  return [(CNVCardActivityAlertScanner *)self scanPastCharacter:61];
}

- (BOOL)scanPastItemDelimiter
{
  return [(CNVCardActivityAlertScanner *)self scanPastCharacter:44];
}

- (unsigned)scanCharacter
{
  return [(CNVCardActivityAlertScanner *)self scanCharacterWithEscaping:1];
}

- (unsigned)scanCharacterWithEscaping:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNVCardActivityAlertScanner *)self atEnd])
  {
    LOWORD(v5) = 0;
  }
  else
  {
    string = self->_string;
    ++self->_position;
    int v5 = -[NSString characterAtIndex:](string, "characterAtIndex:");
    if (v5 == 92 && v3)
    {
      LOWORD(v5) = [(CNVCardActivityAlertScanner *)self scanCharacterWithEscaping:0];
    }
  }
  return v5;
}

- (BOOL)scanPastCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  [(CNVCardActivityAlertScanner *)self scanPastWhitespace];
  unint64_t position = self->_position;
  int v6 = [(CNVCardActivityAlertScanner *)self scanCharacter];
  if (v6 == v3) {
    [(CNVCardActivityAlertScanner *)self scanPastWhitespace];
  }
  else {
    self->_unint64_t position = position;
  }
  return v6 == v3;
}

- (void)scanPastWhitespace
{
  int v3 = [(CNVCardActivityAlertScanner *)self nextCharacter];
  if (v3)
  {
    unsigned __int16 v4 = v3;
    do
    {
      int v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      int v6 = [v5 characterIsMember:v4];

      if (!v6) {
        break;
      }
      [(CNVCardActivityAlertScanner *)self scanCharacter];
      int v7 = [(CNVCardActivityAlertScanner *)self nextCharacter];
      unsigned __int16 v4 = v7;
    }
    while (v7);
  }
}

- (unsigned)nextCharacter
{
  unint64_t position = self->_position;
  unsigned __int16 result = [(CNVCardActivityAlertScanner *)self scanCharacter];
  self->_unint64_t position = position;
  return result;
}

- (unsigned)nextUnescapedCharacter
{
  unint64_t position = self->_position;
  unsigned __int16 result = [(CNVCardActivityAlertScanner *)self scanCharacterWithEscaping:0];
  self->_unint64_t position = position;
  return result;
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)atEnd
{
  unint64_t position = self->_position;
  return position >= [(NSString *)self->_string length];
}

- (void).cxx_destruct
{
}

@end
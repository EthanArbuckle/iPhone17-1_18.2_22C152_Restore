@interface CNVCardDateScanner
+ (id)scannerWithString:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)scanLeapMarker;
- (CNVCardDateScanner)initWithString:(id)a3;
- (int64_t)scanCalendarUnit:(unint64_t)a3;
- (int64_t)scanComponentValueOfLength:(unint64_t)a3;
- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3;
- (unint64_t)position;
- (unsigned)nextCharacter;
@end

@implementation CNVCardDateScanner

+ (id)scannerWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (CNVCardDateScanner)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateScanner;
  v5 = [(CNVCardDateScanner *)&v10 init];
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

- (int64_t)scanComponentValueOfLength:(unint64_t)a3
{
  if ([(CNVCardDateScanner *)self isAtEnd]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v5 = [(CNVCardDateScanner *)self nextCharacter];
  unint64_t position = self->_position;
  if (v5 == 45)
  {
    self->_unint64_t position = position + 1;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = a3 + 1;
  do
    --v8;
  while (position + v8 > [(NSString *)self->_string length]);
  v9 = -[NSString substringWithRange:](self->_string, "substringWithRange:", position, v8);
  self->_position += v8;
  int64_t v10 = [v9 integerValue];

  return v10;
}

- (int64_t)scanCalendarUnit:(unint64_t)a3
{
  unint64_t v4 = [(CNVCardDateScanner *)self lengthOfCalendarUnit:a3];
  return [(CNVCardDateScanner *)self scanComponentValueOfLength:v4];
}

- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3
{
  *((void *)&v4 + 1) = a3;
  *(void *)&long long v4 = a3 - 2;
  unint64_t v3 = v4 >> 1;
  if (v3 > 7) {
    return 0;
  }
  else {
    return qword_1DC1B83F8[v3];
  }
}

- (BOOL)scanLeapMarker
{
  if ([(CNVCardDateScanner *)self isAtEnd]
    || [(CNVCardDateScanner *)self nextCharacter] != 76)
  {
    return 0;
  }
  ++self->_position;
  return 1;
}

- (BOOL)isAtEnd
{
  unint64_t position = self->_position;
  return position >= [(NSString *)self->_string length];
}

- (unsigned)nextCharacter
{
  return [(NSString *)self->_string characterAtIndex:self->_position];
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
}

@end
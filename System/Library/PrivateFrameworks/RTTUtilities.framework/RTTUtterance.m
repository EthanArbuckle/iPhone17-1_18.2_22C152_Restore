@interface RTTUtterance
+ (BOOL)contactPathIsMe:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4;
+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4 isTranscription:(BOOL)a5;
- (BOOL)hasTimedOut;
- (BOOL)ignoreTimeoutTemporarily;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)isTranscription;
- (NSDate)lastChangeDate;
- (NSString)contactPath;
- (NSString)text;
- (RTTUtterance)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetTimeout;
- (void)setContactPath:(id)a3;
- (void)setIgnoreTimeoutTemporarily:(BOOL)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setIsTranscription:(BOOL)a3;
- (void)setLastChangeDate:(id)a3;
- (void)setText:(id)a3;
- (void)updateText:(id)a3;
@end

@implementation RTTUtterance

+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4
{
  return +[RTTUtterance utteranceWithContactPath:a3 andText:a4 isTranscription:0];
}

+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4 isTranscription:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(RTTUtterance);
  [(RTTUtterance *)v9 setContactPath:v8];
  [(RTTUtterance *)v9 updateText:v7];

  BOOL v10 = +[RTTUtterance contactPathIsMe:v8];
  [(RTTUtterance *)v9 setIsMe:v10];
  [(RTTUtterance *)v9 setIsTranscription:v5];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  BOOL v5 = [(RTTUtterance *)self contactPath];
  v6 = (void *)[v5 copy];
  [v4 setContactPath:v6];

  id v7 = [(RTTUtterance *)self text];
  id v8 = (void *)[v7 copy];
  [v4 setText:v8];

  objc_msgSend(v4, "setIsMe:", -[RTTUtterance isMe](self, "isMe"));
  v9 = [(RTTUtterance *)self lastChangeDate];
  BOOL v10 = (void *)[v9 copy];
  [v4 setLastChangeDate:v10];

  objc_msgSend(v4, "setIgnoreTimeoutTemporarily:", -[RTTUtterance ignoreTimeoutTemporarily](self, "ignoreTimeoutTemporarily"));
  objc_msgSend(v4, "setIsTranscription:", -[RTTUtterance isTranscription](self, "isTranscription"));
  return v4;
}

+ (BOOL)contactPathIsMe:(id)a3
{
  id v3 = a3;
  v4 = ttyLocString(@"TTYPersonMe");
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
    char v5 = [v6 contactPathIsMe:v3];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTTUtterance)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTTUtterance;
  char v5 = [(RTTUtterance *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTTUtteranceContactKey"];
    [(RTTUtterance *)v5 setContactPath:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTTUtteranceTextKey"];
    [(RTTUtterance *)v5 setText:v7];

    id v8 = [(RTTUtterance *)v5 contactPath];
    [(RTTUtterance *)v5 setIsMe:+[RTTUtterance contactPathIsMe:v8]];

    -[RTTUtterance setIsTranscription:](v5, "setIsTranscription:", [v4 decodeBoolForKey:@"RTTUtteranceIsTranscriptionKey"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(RTTUtterance *)self contactPath];
  [v6 encodeObject:v4 forKey:@"RTTUtteranceContactKey"];

  char v5 = [(RTTUtterance *)self text];
  [v6 encodeObject:v5 forKey:@"RTTUtteranceTextKey"];

  objc_msgSend(v6, "encodeBool:forKey:", -[RTTUtterance isTranscription](self, "isTranscription"), @"RTTUtteranceIsTranscriptionKey");
}

- (void)dealloc
{
  [(RTTUtterance *)self setContactPath:0];
  [(RTTUtterance *)self updateText:0];
  v3.receiver = self;
  v3.super_class = (Class)RTTUtterance;
  [(RTTUtterance *)&v3 dealloc];
}

- (void)updateText:(id)a3
{
  [(RTTUtterance *)self setText:a3];
  id v4 = [MEMORY[0x263EFF910] date];
  [(RTTUtterance *)self setLastChangeDate:v4];
}

- (BOOL)hasTimedOut
{
  if ([(RTTUtterance *)self ignoreTimeoutTemporarily]) {
    return 0;
  }
  id v4 = [(RTTUtterance *)self lastChangeDate];
  if (v4)
  {
    char v5 = [MEMORY[0x263EFF910] date];
    id v6 = [(RTTUtterance *)self lastChangeDate];
    [v5 timeIntervalSinceDate:v6];
    BOOL v3 = v7 > 3.0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)resetTimeout
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(RTTUtterance *)self setLastChangeDate:v3];
}

- (BOOL)isComplete
{
  v16[5] = *MEMORY[0x263EF8340];
  id v3 = [(RTTUtterance *)self text];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  char v5 = ttyLocString(@"TTYMessageCompleteString");
  v16[0] = v5;
  id v6 = ttyLocString(@"TTYMessageGoodbyeString");
  v16[1] = v6;
  double v7 = ttyLocString(@"TTYMessageHangupString");
  v16[2] = v7;
  id v8 = ttyLocString(@"TTYMessagePoliteHangupString");
  v16[3] = v8;
  v9 = ttyLocString(@"TTYMessageHoldString");
  v16[4] = v9;
  objc_super v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:5];

  v11 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v12 = [(RTTUtterance *)self text];
  LODWORD(v7) = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v4 - 1));

  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __26__RTTUtterance_isComplete__block_invoke;
    v15[3] = &unk_264540D48;
    v15[4] = self;
    v15[5] = v4;
    BOOL v13 = [v10 indexOfObjectPassingTest:v15] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __26__RTTUtterance_isComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 40);
  if (v4 >= [v3 length])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = v6 - [v3 length];
  }
  else
  {
    uint64_t v5 = 0;
  }
  double v7 = [*(id *)(a1 + 32) text];
  id v8 = [v7 substringFromIndex:v5];

  v9 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  objc_super v10 = [v8 stringByTrimmingCharactersInSet:v9];
  v11 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v12 = [v3 stringByTrimmingCharactersInSet:v11];
  uint64_t v13 = [v10 isEqualToString:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [(RTTUtterance *)self contactPath];
    id v8 = [v6 contactPath];
    if (v7 == v8
      || ([(RTTUtterance *)self contactPath],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v6 contactPath],
          unint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      objc_super v10 = [(RTTUtterance *)self text];
      v11 = [v6 text];
      char v9 = [v10 isEqualToString:v11];

      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      char v9 = 0;
    }

    goto LABEL_8;
  }
  char v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)RTTUtterance;
  unint64_t v4 = [(RTTUtterance *)&v10 description];
  uint64_t v5 = [(RTTUtterance *)self contactPath];
  BOOL v6 = [(RTTUtterance *)self hasTimedOut];
  double v7 = [(RTTUtterance *)self text];
  id v8 = [v3 stringWithFormat:@"%@ %@ [%d]: %{sensitive}@", v4, v5, v6, v7];

  return v8;
}

- (NSString)contactPath
{
  return self->_contactPath;
}

- (void)setContactPath:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isTranscription
{
  return self->_isTranscription;
}

- (void)setIsTranscription:(BOOL)a3
{
  self->_isTranscription = a3;
}

- (BOOL)ignoreTimeoutTemporarily
{
  return self->_ignoreTimeoutTemporarily;
}

- (void)setIgnoreTimeoutTemporarily:(BOOL)a3
{
  self->_ignoreTimeoutTemporarily = a3;
}

- (NSDate)lastChangeDate
{
  return self->_lastChangeDate;
}

- (void)setLastChangeDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeDate, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_contactPath, 0);
}

@end
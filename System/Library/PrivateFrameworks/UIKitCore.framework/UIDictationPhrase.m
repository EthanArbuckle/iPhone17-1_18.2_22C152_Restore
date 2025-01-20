@interface UIDictationPhrase
+ (BOOL)supportsSecureCoding;
+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4;
+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)alternativeInterpretations;
- (NSString)text;
- (UIDictationPhrase)initWithCoder:(id)a3;
- (UIDictationPhrase)initWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5;
- (id)description;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation UIDictationPhrase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationPhrase)initWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationPhrase;
  v11 = [(UIDictationPhrase *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    objc_storeStrong((id *)&v12->_alternativeInterpretations, a4);
    v12->_style = a5;
    v13 = v12;
  }

  return v12;
}

- (UIDictationPhrase)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v14.receiver = self;
  v14.super_class = (Class)UIDictationPhrase;
  v5 = [(UIDictationPhrase *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"AlternativeInterpretations"];
    alternativeInterpretations = v5->_alternativeInterpretations;
    v5->_alternativeInterpretations = (NSArray *)v11;

    v5->_style = (int)[v4 decodeInt32ForKey:@"AlternativeStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  text = self->_text;
  if (text) {
    [v8 encodeObject:text forKey:@"Text"];
  }
  alternativeInterpretations = self->_alternativeInterpretations;
  uint64_t v6 = v8;
  if (alternativeInterpretations)
  {
    [v8 encodeObject:alternativeInterpretations forKey:@"AlternativeInterpretations"];
    uint64_t v6 = v8;
  }
  int64_t style = self->_style;
  if (style)
  {
    [v8 encodeInt32:style forKey:@"AlternativeStyle"];
    uint64_t v6 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIDictationPhrase *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(UIDictationPhrase *)self text];
      uint64_t v7 = [(UIDictationPhrase *)v5 text];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(UIDictationPhrase *)self text];
        id v10 = [(UIDictationPhrase *)v5 text];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      v13 = [(UIDictationPhrase *)self alternativeInterpretations];
      uint64_t v14 = [(UIDictationPhrase *)v5 alternativeInterpretations];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        objc_super v15 = (void *)v14;
        v16 = [(UIDictationPhrase *)self alternativeInterpretations];
        v17 = [(UIDictationPhrase *)v5 alternativeInterpretations];
        int v18 = [v16 isEqual:v17];

        if (!v18)
        {
LABEL_11:
          BOOL v12 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      int64_t v19 = [(UIDictationPhrase *)self style];
      BOOL v12 = v19 == [(UIDictationPhrase *)v5 style];
      goto LABEL_14;
    }
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[UIDictationPhrase alloc] initWithText:v6 alternativeInterpretations:v5 style:1];

  return v7;
}

+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[UIDictationPhrase alloc] initWithText:v8 alternativeInterpretations:v7 style:a5];

  return v9;
}

- (id)description
{
  NSUInteger v3 = [(NSArray *)self->_alternativeInterpretations count];
  if (v3)
  {
    NSUInteger v4 = v3;
    uint64_t v5 = 0;
    id v6 = &stru_1ED0E84C0;
    do
    {
      id v7 = [(NSArray *)self->_alternativeInterpretations objectAtIndex:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v5)
        {
          uint64_t v8 = [NSString stringWithFormat:@", %@", v7];
          uint64_t v9 = [(__CFString *)v6 stringByAppendingString:v8];

          id v6 = (__CFString *)v8;
        }
        else
        {
          uint64_t v9 = [(__CFString *)v6 stringByAppendingString:v7];
        }

        id v6 = (__CFString *)v9;
      }

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    id v6 = &stru_1ED0E84C0;
  }
  id v10 = [NSString stringWithFormat:@"UIDictationPhrase ... text: (%@), alternativeInterpretations: (%@)", self->_text, v6];

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)alternativeInterpretations
{
  return self->_alternativeInterpretations;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeInterpretations, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
@interface UIDictationMultilingualString
- (BOOL)isEqual:(id)a3;
- (NSArray)phrases;
- (NSString)dominantLanguage;
- (NSString)interactionIdentifier;
- (NSString)text;
- (UIDictationMultilingualString)initWithCoder:(id)a3;
- (UIDictationMultilingualString)initWithDictionary:(id)a3;
- (UIDictationMultilingualString)initWithText:(id)a3 forLanguage:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionIdentifier;
- (id)description;
- (id)dictionaryValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrectionIdentifier:(id)a3;
- (void)setDominantLanguage:(id)a3;
- (void)setInteractionIdentifier:(id)a3;
- (void)setPhrases:(id)a3;
- (void)setText:(id)a3;
@end

@implementation UIDictationMultilingualString

- (UIDictationMultilingualString)initWithText:(id)a3 forLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationMultilingualString;
  v8 = [(UIDictationMultilingualString *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    dominantLanguage = v8->_dominantLanguage;
    v8->_dominantLanguage = (NSString *)v11;
  }
  return v8;
}

- (UIDictationMultilingualString)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"text"];
  id v6 = [v4 objectForKeyedSubscript:@"language"];

  if (v5)
  {
    self = [(UIDictationMultilingualString *)self initWithText:v5 forLanguage:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (UIDictationMultilingualString)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDictationMultilingualString;
  v5 = [(UIDictationMultilingualString *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    dominantLanguage = v5->_dominantLanguage;
    v5->_dominantLanguage = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_dominantLanguage forKey:@"language"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UIDictationMultilingualString);
  id v5 = (void *)[(NSString *)self->_text copy];
  [(UIDictationMultilingualString *)v4 setText:v5];

  uint64_t v6 = (void *)[(NSString *)self->_dominantLanguage copy];
  [(UIDictationMultilingualString *)v4 setDominantLanguage:v6];

  [(UIDictationMultilingualString *)v4 setCorrectionIdentifier:self->_correctionIdentifier];
  [(UIDictationMultilingualString *)v4 setInteractionIdentifier:self->_interactionIdentifier];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDictationMultilingualString *)self text];
  uint64_t v6 = [v4 text];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(UIDictationMultilingualString *)self dominantLanguage];
    uint64_t v8 = [v4 dominantLanguage];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(UIDictationMultilingualString *)self text];
  uint64_t v4 = [v3 hash];
  id v5 = [(UIDictationMultilingualString *)self dominantLanguage];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v2 = [(UIDictationMultilingualString *)self dictionaryValue];
  v3 = [v2 description];

  return v3;
}

- (id)dictionaryValue
{
  v10[2] = *MEMORY[0x1E4F143B8];
  dominantLanguage = &stru_1ED0E84C0;
  if (self->_text) {
    text = (__CFString *)self->_text;
  }
  else {
    text = &stru_1ED0E84C0;
  }
  if (self->_dominantLanguage) {
    dominantLanguage = (__CFString *)self->_dominantLanguage;
  }
  v9[0] = @"text";
  v9[1] = @"language";
  v10[0] = text;
  v10[1] = dominantLanguage;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = dominantLanguage;
  unint64_t v6 = text;
  id v7 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)dominantLanguage
{
  return self->_dominantLanguage;
}

- (void)setDominantLanguage:(id)a3
{
}

- (id)correctionIdentifier
{
  return self->_correctionIdentifier;
}

- (void)setCorrectionIdentifier:(id)a3
{
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong(&self->_correctionIdentifier, 0);
  objc_storeStrong((id *)&self->_dominantLanguage, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
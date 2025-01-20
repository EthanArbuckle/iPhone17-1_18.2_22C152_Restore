@interface TIDPWordRecord
+ (id)word:(id)a3;
+ (id)word:(id)a3 atPosition:(id)a4;
+ (id)word:(id)a3 atPosition:(id)a4 coder:(id)a5;
- (HCHuffmanCoder)coder;
- (NSNumber)codedWord;
- (NSNumber)wordPosition;
- (NSString)cleanedWord;
- (NSString)codedWordAsString;
- (NSString)word;
- (NSUUID)coderVersion;
- (id)toDPWordRecord;
- (void)setCoder:(id)a3;
- (void)setWord:(id)a3;
- (void)setWordPosition:(id)a3;
@end

@implementation TIDPWordRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coder, 0);
  objc_storeStrong((id *)&self->_word, 0);

  objc_storeStrong((id *)&self->_wordPosition, 0);
}

- (void)setCoder:(id)a3
{
}

- (HCHuffmanCoder)coder
{
  return self->_coder;
}

- (void)setWord:(id)a3
{
}

- (NSString)word
{
  return self->_word;
}

- (void)setWordPosition:(id)a3
{
}

- (NSNumber)wordPosition
{
  return self->_wordPosition;
}

- (id)toDPWordRecord
{
  v3 = [(TIDPWordRecord *)self coder];
  if (v3) {
    [(TIDPWordRecord *)self codedWordAsString];
  }
  else {
  v4 = [(TIDPWordRecord *)self cleanedWord];
  }

  v5 = [MEMORY[0x1E4F5F490] word:v4 atPosition:self->_wordPosition];

  return v5;
}

- (NSUUID)coderVersion
{
  v2 = [(TIDPWordRecord *)self coder];
  v3 = [v2 versionUUID];

  return (NSUUID *)v3;
}

- (NSString)codedWordAsString
{
  v3 = [(TIDPWordRecord *)self coder];

  if (v3)
  {
    v4 = [(TIDPWordRecord *)self coder];
    v5 = [(TIDPWordRecord *)self cleanedWord];
    v6 = [v4 stringCodeForKey:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSNumber)codedWord
{
  v3 = [(TIDPWordRecord *)self coder];

  if (v3)
  {
    v4 = [(TIDPWordRecord *)self coder];
    v5 = [(TIDPWordRecord *)self cleanedWord];
    v6 = [v4 codeForKey:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSString)cleanedWord
{
  v2 = [(TIDPWordRecord *)self word];
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return (NSString *)v4;
}

+ (id)word:(id)a3 atPosition:(id)a4 coder:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(TIDPWordRecord);
  v11 = (void *)[v9 copy];

  [(TIDPWordRecord *)v10 setWord:v11];
  v12 = (void *)[v8 copy];

  [(TIDPWordRecord *)v10 setWordPosition:v12];
  [(TIDPWordRecord *)v10 setCoder:v7];

  return v10;
}

+ (id)word:(id)a3 atPosition:(id)a4
{
  return (id)[a1 word:a3 atPosition:a4 coder:0];
}

+ (id)word:(id)a3
{
  return (id)[a1 word:a3 atPosition:0 coder:0];
}

@end
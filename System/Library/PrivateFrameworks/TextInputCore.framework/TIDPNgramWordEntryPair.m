@interface TIDPNgramWordEntryPair
- (BOOL)isStandaloneString;
- (NSString)wordString;
- (TIDPNgramWordEntryPair)initWithWordString:(id)a3;
- (TIDPNgramWordEntryPair)initWithWordString:(id)a3 wordEntryAligned:(id)a4;
- (TIWordEntryAligned)wordEntryAligned;
- (void)setWordEntryAligned:(id)a3;
- (void)setWordString:(id)a3;
@end

@implementation TIDPNgramWordEntryPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordEntryAligned, 0);

  objc_storeStrong((id *)&self->_wordString, 0);
}

- (void)setWordEntryAligned:(id)a3
{
}

- (TIWordEntryAligned)wordEntryAligned
{
  return self->_wordEntryAligned;
}

- (void)setWordString:(id)a3
{
}

- (NSString)wordString
{
  return self->_wordString;
}

- (BOOL)isStandaloneString
{
  v3 = [(TIDPNgramWordEntryPair *)self wordEntryAligned];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(TIDPNgramWordEntryPair *)self wordString];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (TIDPNgramWordEntryPair)initWithWordString:(id)a3
{
  return [(TIDPNgramWordEntryPair *)self initWithWordString:a3 wordEntryAligned:0];
}

- (TIDPNgramWordEntryPair)initWithWordString:(id)a3 wordEntryAligned:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIDPNgramWordEntryPair;
  v8 = [(TIDPNgramWordEntryPair *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TIDPNgramWordEntryPair *)v8 setWordString:v6];
    [(TIDPNgramWordEntryPair *)v9 setWordEntryAligned:v7];
  }

  return v9;
}

@end
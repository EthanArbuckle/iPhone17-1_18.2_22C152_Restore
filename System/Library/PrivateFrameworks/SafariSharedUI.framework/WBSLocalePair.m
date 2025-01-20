@interface WBSLocalePair
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (NSString)compactDescriptionForLogging;
- (NSString)sourceLocaleIdentifier;
- (NSString)targetLocaleIdentifier;
- (WBSLocalePair)initWithLTLocalePair:(id)a3;
- (WBSLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (WBSLocalePair)initWithSourceLocaleIdentifier:(id)a3 targetLocaleIdentifier:(id)a4;
- (_LTLocalePair)lt_localePair;
- (id)description;
@end

@implementation WBSLocalePair

- (WBSLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSLocalePair;
  v9 = [(WBSLocalePair *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSLocalePair)initWithSourceLocaleIdentifier:(id)a3 targetLocaleIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a4;
  id v8 = [v6 localeWithLocaleIdentifier:a3];
  v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];

  v10 = [(WBSLocalePair *)self initWithSourceLocale:v8 targetLocale:v9];
  return v10;
}

- (WBSLocalePair)initWithLTLocalePair:(id)a3
{
  id v4 = a3;
  v5 = [v4 sourceLocale];
  v6 = [v4 targetLocale];

  id v7 = [(WBSLocalePair *)self initWithSourceLocale:v5 targetLocale:v6];
  return v7;
}

- (NSString)sourceLocaleIdentifier
{
  return [(NSLocale *)self->_sourceLocale localeIdentifier];
}

- (NSString)targetLocaleIdentifier
{
  return [(NSLocale *)self->_targetLocale localeIdentifier];
}

- (_LTLocalePair)lt_localePair
{
  v2 = (void *)[objc_alloc((Class)get_LTLocalePairClass()) initWithSourceLocale:self->_sourceLocale targetLocale:self->_targetLocale];
  return (_LTLocalePair *)v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WBSLocalePair *)self sourceLocaleIdentifier];
  v6 = [(WBSLocalePair *)self targetLocaleIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p sourceLocale = %@; targetLocale = %@>", v4, self, v5, v6];;

  return v7;
}

- (NSString)compactDescriptionForLogging
{
  v3 = NSString;
  uint64_t v4 = [(WBSLocalePair *)self sourceLocaleIdentifier];
  v5 = [(WBSLocalePair *)self targetLocaleIdentifier];
  v6 = [v3 stringWithFormat:@"%@ > %@", v4, v5];

  return (NSString *)v6;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
}

@end
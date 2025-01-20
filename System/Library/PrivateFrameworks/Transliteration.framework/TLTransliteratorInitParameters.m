@interface TLTransliteratorInitParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)useLanguageModel;
- (BOOL)useSeq2SeqModel;
- (NSLocale)locale;
- (NSURL)modelURL;
- (TLTransliteratorInitParameters)initWithLocale:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setModelURL:(id)a3;
- (void)setUseLanguageModel:(BOOL)a3;
- (void)setUseSeq2SeqModel:(BOOL)a3;
@end

@implementation TLTransliteratorInitParameters

- (TLTransliteratorInitParameters)initWithLocale:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTransliteratorInitParameters;
  v5 = [(TLTransliteratorInitParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    *(_WORD *)&v5->_useLanguageModel = 257;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TLTransliteratorInitParameters allocWithZone:a3];
  v5 = [(TLTransliteratorInitParameters *)self locale];
  uint64_t v6 = [(TLTransliteratorInitParameters *)v4 initWithLocale:v5];

  v7 = [(TLTransliteratorInitParameters *)self modelURL];
  [(TLTransliteratorInitParameters *)v6 setModelURL:v7];

  [(TLTransliteratorInitParameters *)v6 setUseLanguageModel:[(TLTransliteratorInitParameters *)self useLanguageModel]];
  [(TLTransliteratorInitParameters *)v6 setUseSeq2SeqModel:[(TLTransliteratorInitParameters *)self useSeq2SeqModel]];
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TLMutableTransliteratorInitParameters alloc];
  v5 = [(TLTransliteratorInitParameters *)self locale];
  uint64_t v6 = [(TLTransliteratorInitParameters *)v4 initWithLocale:v5];

  v7 = [(TLTransliteratorInitParameters *)self modelURL];
  [(TLTransliteratorInitParameters *)v6 setModelURL:v7];

  [(TLTransliteratorInitParameters *)v6 setUseLanguageModel:[(TLTransliteratorInitParameters *)self useLanguageModel]];
  [(TLTransliteratorInitParameters *)v6 setUseSeq2SeqModel:[(TLTransliteratorInitParameters *)self useSeq2SeqModel]];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  if (!v8)
  {
    int v11 = 0;
    int v10 = 0;
    goto LABEL_10;
  }
  v3 = [(TLTransliteratorInitParameters *)self locale];
  id v4 = [v8 locale];
  if (![v3 isEqual:v4])
  {
    int v11 = 0;
    int v10 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = [(TLTransliteratorInitParameters *)self modelURL];
  if (v9)
  {
    v21 = (void *)v9;
    int v10 = 0;
    int v11 = 1;
LABEL_10:
    [(TLTransliteratorInitParameters *)self modelURL];
    goto LABEL_11;
  }
  uint64_t v18 = [v8 modelURL];
  int v11 = 1;
  if (!v18)
  {
    LOBYTE(v15) = 1;
    goto LABEL_21;
  }
  v21 = 0;
  int v10 = 1;
  [(TLTransliteratorInitParameters *)self modelURL];
  v12 = LABEL_11:;
  v13 = [v8 modelURL];
  if ([v12 isEqual:v13]
    && (int v14 = [(TLTransliteratorInitParameters *)self useLanguageModel],
        v14 == [v8 useLanguageModel]))
  {
    BOOL v16 = [(TLTransliteratorInitParameters *)self useSeq2SeqModel];
    int v15 = v16 ^ [v8 useSeq2SeqModel] ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  if (!v10)
  {
    if (!v11) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  if (v11) {
LABEL_19:
  }

LABEL_20:
  if (v8)
  {
LABEL_21:
  }
  return v15;
}

- (unint64_t)hash
{
  v3 = [(TLTransliteratorInitParameters *)self locale];
  uint64_t v4 = [v3 hash];

  v5 = [(TLTransliteratorInitParameters *)self modelURL];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = v6 ^ [(TLTransliteratorInitParameters *)self useLanguageModel];
  return v7 ^ [(TLTransliteratorInitParameters *)self useSeq2SeqModel];
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)useLanguageModel
{
  return self->_useLanguageModel;
}

- (void)setUseLanguageModel:(BOOL)a3
{
  self->_useLanguageModel = a3;
}

- (BOOL)useSeq2SeqModel
{
  return self->_useSeq2SeqModel;
}

- (void)setUseSeq2SeqModel:(BOOL)a3
{
  self->_useSeq2SeqModel = a3;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
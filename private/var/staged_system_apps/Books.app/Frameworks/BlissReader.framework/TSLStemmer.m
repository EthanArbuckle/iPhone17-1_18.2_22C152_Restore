@interface TSLStemmer
- (TSLStemmer)initWithLocale:(__CFLocale *)a3;
- (id)newStemmedWord:(id)a3;
- (id)stemWord:(id)a3;
- (void)dealloc;
@end

@implementation TSLStemmer

- (TSLStemmer)initWithLocale:(__CFLocale *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSLStemmer;
  v3 = [(TSLStemmer *)&v5 init];
  if (v3) {
    v3->mStemmer = (sb_stemmer *)sb_stemmer_new("english", 0);
  }
  return v3;
}

- (void)dealloc
{
  mStemmer = self->mStemmer;
  if (mStemmer)
  {
    sb_stemmer_delete(mStemmer);
    self->mStemmer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSLStemmer;
  [(TSLStemmer *)&v4 dealloc];
}

- (id)stemWord:(id)a3
{
  id v3 = [(TSLStemmer *)self newStemmedWord:a3];

  return v3;
}

- (id)newStemmedWord:(id)a3
{
  objc_super v5 = (const char *)[a3 UTF8String];
  if (!v5) {
    return 0;
  }
  v6 = (char *)v5;
  int v7 = strlen(v5);
  uint64_t v8 = sb_stemmer_stem((uint64_t)self->mStemmer, v6, v7);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = sb_stemmer_length((uint64_t)self->mStemmer);
    if (v10)
    {
      int v11 = v10;
      id v12 = objc_alloc((Class)NSString);
      return [v12 initWithBytes:v9 length:v11 encoding:4];
    }
    return 0;
  }

  return [a3 copy];
}

@end
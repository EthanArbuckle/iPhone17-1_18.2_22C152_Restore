@interface NBURLCanonicalizer
- (NBObjCURLCanonicalizer)canonicalizer;
- (NBURLCanonicalizer)init;
- (id)canonicalizedURLForURL:(id)a3;
@end

@implementation NBURLCanonicalizer

- (NBURLCanonicalizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)NBURLCanonicalizer;
  v2 = [(NBURLCanonicalizer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(NBObjCURLCanonicalizer);
    canonicalizer = v2->_canonicalizer;
    v2->_canonicalizer = v3;
  }
  return v2;
}

- (id)canonicalizedURLForURL:(id)a3
{
  id v4 = a3;
  v5 = [(NBURLCanonicalizer *)self canonicalizer];
  objc_super v6 = [v5 canonicalizedURLForURL:v4];

  return v6;
}

- (NBObjCURLCanonicalizer)canonicalizer
{
  return self->_canonicalizer;
}

- (void).cxx_destruct
{
}

@end
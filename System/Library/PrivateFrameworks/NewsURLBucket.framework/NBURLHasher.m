@interface NBURLHasher
- (NBObjCURLHasher)hasher;
- (NBURLHasher)init;
- (id)hashForURL:(id)a3 maxLength:(unint64_t)a4;
@end

@implementation NBURLHasher

- (NBURLHasher)init
{
  v6.receiver = self;
  v6.super_class = (Class)NBURLHasher;
  v2 = [(NBURLHasher *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(NBObjCURLHasher);
    hasher = v2->_hasher;
    v2->_hasher = v3;
  }
  return v2;
}

- (id)hashForURL:(id)a3 maxLength:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NBURLHasher *)self hasher];
  v8 = [v7 hashForURL:v6 maxLength:a4];

  return v8;
}

- (NBObjCURLHasher)hasher
{
  return self->_hasher;
}

- (void).cxx_destruct
{
}

@end
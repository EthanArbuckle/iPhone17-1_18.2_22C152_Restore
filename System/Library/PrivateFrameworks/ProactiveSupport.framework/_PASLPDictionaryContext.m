@interface _PASLPDictionaryContext
- (BOOL)isEqual:(id)a3;
- (NSCache)enumerationCache;
- (_PASLPDictionaryContext)initWithStorage:(const unsigned int *)a3 count:(unint64_t)a4;
- (unint64_t)hash;
- (void)setEnumerationCache:(id)a3;
@end

@implementation _PASLPDictionaryContext

- (void).cxx_destruct
{
}

- (NSCache)enumerationCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enumerationCache);

  return (NSCache *)WeakRetained;
}

- (_PASLPDictionaryContext)initWithStorage:(const unsigned int *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_PASLPReaderCommon.m", 21, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_PASLPDictionaryContext;
  result = [(_PASLPDictionaryContext *)&v10 init];
  if (result)
  {
    result->_storage = a3;
    result->_count = a4;
  }
  return result;
}

- (void)setEnumerationCache:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_PASLPDictionaryContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self) {
      LOBYTE(self) = self->_storage == v6->_storage && self->_count == v6->_count;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (unint64_t)hash
{
  return self->_count;
}

@end
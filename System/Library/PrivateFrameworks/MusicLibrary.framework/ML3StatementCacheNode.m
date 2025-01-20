@interface ML3StatementCacheNode
- (ML3StatementCacheNode)initWithDictionaryKey:(id)a3;
- (ML3StatementCacheNode)next;
- (NSCopying)dictionaryKey;
- (id)description;
- (void)setDictionaryKey:(id)a3;
- (void)setNext:(id)a3;
@end

@implementation ML3StatementCacheNode

- (ML3StatementCacheNode)next
{
  return self->_next;
}

- (NSCopying)dictionaryKey
{
  return self->_dictionaryKey;
}

- (void)setNext:(id)a3
{
}

- (ML3StatementCacheNode)initWithDictionaryKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StatementCacheNode;
  v5 = [(ML3StatementCacheNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryKey = v5->_dictionaryKey;
    v5->_dictionaryKey = (NSCopying *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);

  objc_storeStrong((id *)&self->_dictionaryKey, 0);
}

- (void)setDictionaryKey:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p '%@'>", objc_opt_class(), self, self->_dictionaryKey];
}

@end
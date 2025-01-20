@interface TrieNode
- (BOOL)isEndOfPath;
- (NSMutableDictionary)children;
- (TrieNode)init;
- (void)setChildren:(id)a3;
- (void)setIsEndOfPath:(BOOL)a3;
@end

@implementation TrieNode

- (TrieNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)TrieNode;
  v2 = [(TrieNode *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    children = v2->_children;
    v2->_children = (NSMutableDictionary *)v3;

    v2->_isEndOfPath = 0;
  }
  return v2;
}

- (NSMutableDictionary)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isEndOfPath
{
  return self->_isEndOfPath;
}

- (void)setIsEndOfPath:(BOOL)a3
{
  self->_isEndOfPath = a3;
}

- (void).cxx_destruct
{
}

@end
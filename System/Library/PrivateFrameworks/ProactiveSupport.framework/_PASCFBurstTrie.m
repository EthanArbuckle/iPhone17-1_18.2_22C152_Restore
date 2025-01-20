@interface _PASCFBurstTrie
- (_PASCFBurstTrie)initWithPath:(id)a3;
- (unsigned)payloadForString:(id)a3;
- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4;
- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)runBlockWithTrie:(id)a3;
@end

@implementation _PASCFBurstTrie

- (void)runBlockWithTrie:(id)a3
{
}

- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (CFBurstTrieContainsUTF8String()) {
    return 0;
  }
  return 0;
}

- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4
{
  v5 = objc_msgSend(a3, "substringWithRange:", a4.location, a4.length);
  LODWORD(self) = [(_PASCFBurstTrie *)self payloadForString:v5];

  return self;
}

- (unsigned)payloadForString:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  unint64_t v4 = [(__CFString *)v3 length];
  if (CFStringGetCStringPtr(v3, 0x600u)) {
    goto LABEL_2;
  }
  if (v4 <= 0xFF
    && [(__CFString *)v3 getCString:__s maxLength:385 encoding:4])
  {
    strlen(__s);
LABEL_2:
    CFBurstTrieContainsUTF8String();
    goto LABEL_3;
  }
  if (v3) {
    CFBurstTrieContains();
  }
LABEL_3:

  return 0;
}

- (void)dealloc
{
  if (self->_trie) {
    CFBurstTrieRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)_PASCFBurstTrie;
  [(_PASCFBurstTrie *)&v3 dealloc];
}

- (_PASCFBurstTrie)initWithPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_PASCFBurstTrie.m", 30, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_PASCFBurstTrie;
  v6 = [(_PASCFBurstTrie *)&v11 init];
  if (v6 && (uint64_t v7 = CFBurstTrieCreateFromFile(), (v6->_trie = (_CFBurstTrie *)v7) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not open trie: %@", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

@end
@interface HCBurstTrie
+ (id)burstTrieFromFile:(id)a3;
- (BOOL)writeToFile:(id)a3;
- (HCBurstTrie)init;
- (_CFBurstTrie)burstTrie;
- (id)payloadForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)keysAdded;
- (void)_createUnderlyingBurstTrie;
- (void)dealloc;
- (void)setBurstTrie:(_CFBurstTrie *)a3;
@end

@implementation HCBurstTrie

- (void)setBurstTrie:(_CFBurstTrie *)a3
{
  self->_burstTrie = a3;
}

- (_CFBurstTrie)burstTrie
{
  return self->_burstTrie;
}

- (unint64_t)keysAdded
{
  return self->_keysAdded;
}

- (void)_createUnderlyingBurstTrie
{
  self->_burstTrie = (_CFBurstTrie *)CFBurstTrieCreate();
}

- (BOOL)writeToFile:(id)a3
{
  id v3 = [a3 path];
  v4 = fopen((const char *)[v3 UTF8String], "wb+");

  fileno(v4);
  BOOL v5 = CFBurstTrieSerializeWithFileDescriptor() != 0;
  fclose(v4);
  return v5;
}

- (unint64_t)count
{
  unint64_t result = (unint64_t)self->_burstTrie;
  if (result) {
    return MEMORY[0x1F40D7650](result, a2);
  }
  return result;
}

- (id)payloadForKey:(id)a3
{
  if (self->_burstTrie
    && (id v3 = a3, [v3 length], v4 = CFBurstTrieContains(), v3, v4))
  {
    BOOL v5 = [NSNumber numberWithInt:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_burstTrie) {
    CFBurstTrieRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)HCBurstTrie;
  [(HCBurstTrie *)&v3 dealloc];
}

- (HCBurstTrie)init
{
  v5.receiver = self;
  v5.super_class = (Class)HCBurstTrie;
  v2 = [(HCBurstTrie *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(HCBurstTrie *)v2 _createUnderlyingBurstTrie];
    v3->_keysAdded = 0;
  }
  return v3;
}

+ (id)burstTrieFromFile:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F1C9B8];
  int v4 = [a3 path];
  id v12 = 0;
  objc_super v5 = [v3 dataWithContentsOfFile:v4 options:8 error:&v12];
  id v6 = v12;

  id v7 = v5;
  [v7 bytes];
  uint64_t v8 = CFBurstTrieCreateFromMapBytes();
  if (v8)
  {
    v9 = (_CFBurstTrie *)v8;
    v10 = objc_alloc_init(HCBurstTrie);
    if (v10->_burstTrie) {
      CFBurstTrieRelease();
    }
    v10->_burstTrie = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
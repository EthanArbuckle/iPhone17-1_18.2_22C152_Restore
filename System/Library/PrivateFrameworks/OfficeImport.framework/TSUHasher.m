@interface TSUHasher
- (TSUHasher)init;
- (unint64_t)currentHash;
- (void)addBool:(BOOL)a3;
- (void)addInt:(int)a3;
- (void)addObject:(id)a3;
- (void)addUnsignedInt:(unsigned int)a3;
- (void)p_appendUnsignedInteger:(unint64_t)a3;
- (void)setCurrentHash:(unint64_t)a3;
@end

@implementation TSUHasher

- (TSUHasher)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSUHasher;
  result = [(TSUHasher *)&v3 init];
  if (result) {
    result->_currentHash = 0xCBF29CE484222325;
  }
  return result;
}

- (void)p_appendUnsignedInteger:(unint64_t)a3
{
  unint64_t v3 = a3;
  [(TSUHasher *)self setCurrentHash:TSUHashWithSeed((char *)&v3, 8, [(TSUHasher *)self currentHash])];
}

- (void)addInt:(int)a3
{
}

- (void)addUnsignedInt:(unsigned int)a3
{
}

- (void)addBool:(BOOL)a3
{
}

- (void)addObject:(id)a3
{
  uint64_t v4 = [a3 hash];
  [(TSUHasher *)self p_appendUnsignedInteger:v4];
}

- (unint64_t)currentHash
{
  return self->_currentHash;
}

- (void)setCurrentHash:(unint64_t)a3
{
  self->_currentHash = a3;
}

@end
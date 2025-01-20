@interface TSWPObfuscatedFontDataProvider
- (TSWPObfuscatedFontDataProvider)initWithPath:(id)a3 groupUID:(id)a4;
- (int64_t)p_currentOffset;
- (int64_t)skipForwardBy:(int64_t)a3;
- (unint64_t)readBytes:(char *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)rewind;
@end

@implementation TSWPObfuscatedFontDataProvider

- (TSWPObfuscatedFontDataProvider)initWithPath:(id)a3 groupUID:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPObfuscatedFontDataProvider;
  v6 = [(TSWPObfuscatedFontDataProvider *)&v11 init];
  if (v6)
  {
    v7 = (NSInputStream *)[objc_alloc(MEMORY[0x263EFF950]) initWithFileAtPath:a3];
    v6->_stream = v7;
    [(NSInputStream *)v7 open];
    v8 = (const char *)[a4 UTF8String];
    CC_LONG v9 = strlen(v8);
    CC_SHA1(v8, v9, v6->_xorMask);
  }
  return v6;
}

- (void)dealloc
{
  [(NSInputStream *)self->_stream close];

  v3.receiver = self;
  v3.super_class = (Class)TSWPObfuscatedFontDataProvider;
  [(TSWPObfuscatedFontDataProvider *)&v3 dealloc];
}

- (int64_t)p_currentOffset
{
  v2 = (void *)[(NSInputStream *)self->_stream propertyForKey:*MEMORY[0x263EFF598]];

  return [v2 longLongValue];
}

- (unint64_t)readBytes:(char *)a3 count:(unint64_t)a4
{
  int64_t v7 = [(TSWPObfuscatedFontDataProvider *)self p_currentOffset];
  unint64_t result = [(NSInputStream *)self->_stream read:a3 maxLength:a4];
  uint64_t v9 = result + v7;
  if (result + v7 >= 0x410) {
    uint64_t v9 = 1040;
  }
  if (v7 < v9)
  {
    do
    {
      *a3++ ^= self->_xorMask[v7 % 20];
      ++v7;
    }
    while (v9 != v7);
  }
  return result;
}

- (int64_t)skipForwardBy:(int64_t)a3
{
  int64_t v5 = [(TSWPObfuscatedFontDataProvider *)self p_currentOffset];
  stream = self->_stream;
  uint64_t v7 = [NSNumber numberWithLongLong:v5 + a3];
  [(NSInputStream *)stream setProperty:v7 forKey:*MEMORY[0x263EFF598]];
  return [(TSWPObfuscatedFontDataProvider *)self p_currentOffset] - v5;
}

- (void)rewind
{
  stream = self->_stream;
  uint64_t v3 = [NSNumber numberWithLongLong:0];
  uint64_t v4 = *MEMORY[0x263EFF598];

  [(NSInputStream *)stream setProperty:v3 forKey:v4];
}

@end
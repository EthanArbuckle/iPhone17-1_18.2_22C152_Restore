@interface KTVaudenaySASConfiguration
+ (id)sha256Transparency;
- (KTVaudenaySASConfiguration)initWithName:(id)a3 digestPrefix:(id)a4 shortCodeLength:(int)a5 digest:(const ccdigest_info *)a6;
- (NSData)digestPrefix;
- (NSString)name;
- (const)di;
- (int)shortCodeLength;
- (unint64_t)shortCodeMod10;
- (void)setDi:(const ccdigest_info *)a3;
- (void)setDigestPrefix:(id)a3;
- (void)setName:(id)a3;
- (void)setShortCodeLength:(int)a3;
- (void)setShortCodeMod10:(unint64_t)a3;
@end

@implementation KTVaudenaySASConfiguration

- (KTVaudenaySASConfiguration)initWithName:(id)a3 digestPrefix:(id)a4 shortCodeLength:(int)a5 digest:(const ccdigest_info *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  if ((v7 & 0x80000000) != 0
    || (v15.receiver = self,
        v15.super_class = (Class)KTVaudenaySASConfiguration,
        v12 = [(KTVaudenaySASConfiguration *)&v15 init],
        (self = v12) == 0))
  {
    v13 = 0;
  }
  else
  {
    [(KTVaudenaySASConfiguration *)v12 setName:v10];
    [(KTVaudenaySASConfiguration *)self setDi:a6];
    [(KTVaudenaySASConfiguration *)self setDigestPrefix:v11];
    [(KTVaudenaySASConfiguration *)self setShortCodeLength:v7];
    [(KTVaudenaySASConfiguration *)self setShortCodeMod10:1];
    for (; v7; LODWORD(v7) = v7 - 1)
      [(KTVaudenaySASConfiguration *)self setShortCodeMod10:10 * [(KTVaudenaySASConfiguration *)self shortCodeMod10]];
    self = self;
    v13 = self;
  }

  return v13;
}

+ (id)sha256Transparency
{
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:"sha256Transparency" length:18];
  if (v2) {
    v3 = [[KTVaudenaySASConfiguration alloc] initWithName:@"sha256Transparency" digestPrefix:v2 shortCodeLength:8 digest:ccsha256_di()];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (const)di
{
  return self->_di;
}

- (void)setDi:(const ccdigest_info *)a3
{
  self->_di = a3;
}

- (NSData)digestPrefix
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDigestPrefix:(id)a3
{
}

- (int)shortCodeLength
{
  return self->_shortCodeLength;
}

- (void)setShortCodeLength:(int)a3
{
  self->_shortCodeLength = a3;
}

- (unint64_t)shortCodeMod10
{
  return self->_shortCodeMod10;
}

- (void)setShortCodeMod10:(unint64_t)a3
{
  self->_shortCodeMod10 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestPrefix, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
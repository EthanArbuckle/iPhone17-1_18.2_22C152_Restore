@interface VisionCoreResourceVersion
+ (BOOL)supportsSecureCoding;
+ (id)invalidVersion;
+ (id)newerFirstComparator;
+ (id)olderFirstComparator;
+ (id)versionForStringRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResourceVersion:(id)a3;
- (BOOL)isValid;
- (NSString)stringRepresentation;
- (VisionCoreResourceVersion)initWithCoder:(id)a3;
- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3;
- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4;
- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4 micro:(unsigned int)a5;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unsigned)major;
- (unsigned)micro;
- (unsigned)minor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreResourceVersion

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4 micro:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreResourceVersion;
  result = [(VisionCoreResourceVersion *)&v9 init];
  if (result)
  {
    result->_major = a3;
    result->_minor = a4;
    result->_micro = a5;
  }
  return result;
}

- (unsigned)micro
{
  return self->_micro;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)major
{
  return self->_major;
}

- (VisionCoreResourceVersion)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  [a3 decodeArrayOfObjCType:"I" count:3 at:&v5];
  return [(VisionCoreResourceVersion *)self initWithMajor:v5 minor:HIDWORD(v5) micro:v6];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5[0] = [(VisionCoreResourceVersion *)self major];
  v5[1] = [(VisionCoreResourceVersion *)self minor];
  v5[2] = [(VisionCoreResourceVersion *)self micro];
  [v4 encodeArrayOfObjCType:"I" count:3 at:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(VisionCoreResourceVersion *)self isEqualToResourceVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VisionCoreResourceVersion *)self major];
  unint64_t v4 = ((unint64_t)[(VisionCoreResourceVersion *)self minor] << 16) | (v3 << 32);
  return v4 | [(VisionCoreResourceVersion *)self micro];
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = (VisionCoreResourceVersion *)a3;
  if (self == v4)
  {
    int64_t v9 = 0;
    goto LABEL_10;
  }
  unsigned int v5 = [(VisionCoreResourceVersion *)self major];
  unsigned int v6 = [(VisionCoreResourceVersion *)v4 major];
  if (v5 < v6) {
    goto LABEL_5;
  }
  if (v5 > v6) {
    goto LABEL_9;
  }
  unsigned int v7 = [(VisionCoreResourceVersion *)self minor];
  unsigned int v8 = [(VisionCoreResourceVersion *)v4 minor];
  if (v7 < v8)
  {
LABEL_5:
    int64_t v9 = -1;
    goto LABEL_10;
  }
  if (v7 > v8)
  {
LABEL_9:
    int64_t v9 = 1;
    goto LABEL_10;
  }
  unsigned int v11 = [(VisionCoreResourceVersion *)self micro];
  unsigned int v12 = [(VisionCoreResourceVersion *)v4 micro];
  if (v11 < v12) {
    int64_t v9 = -1;
  }
  else {
    int64_t v9 = v11 > v12;
  }
LABEL_10:

  return v9;
}

- (BOOL)isEqualToResourceVersion:(id)a3
{
  unint64_t v4 = (VisionCoreResourceVersion *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    unsigned int v5 = [(VisionCoreResourceVersion *)self major];
    if (v5 == [(VisionCoreResourceVersion *)v4 major]
      && (unsigned int v6 = [(VisionCoreResourceVersion *)self minor], v6 == [(VisionCoreResourceVersion *)v4 minor]))
    {
      unsigned int v7 = [(VisionCoreResourceVersion *)self micro];
      BOOL v8 = v7 == [(VisionCoreResourceVersion *)v4 micro];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)stringRepresentation
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u.%u.%u", -[VisionCoreResourceVersion major](self, "major"), -[VisionCoreResourceVersion minor](self, "minor"), -[VisionCoreResourceVersion micro](self, "micro"));
  return (NSString *)v2;
}

- (BOOL)isValid
{
  uint64_t v3 = +[VisionCoreResourceVersion invalidVersion];
  LOBYTE(self) = [(VisionCoreResourceVersion *)self isEqual:v3];

  return (char)self;
}

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4
{
  return [(VisionCoreResourceVersion *)self initWithMajor:*(void *)&a3 minor:*(void *)&a4 micro:0];
}

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3
{
  return [(VisionCoreResourceVersion *)self initWithMajor:*(void *)&a3 minor:0 micro:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)olderFirstComparator
{
  return &__block_literal_global_11;
}

uint64_t __49__VisionCoreResourceVersion_olderFirstComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)newerFirstComparator
{
  return &__block_literal_global_9;
}

uint64_t __49__VisionCoreResourceVersion_newerFirstComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

+ (id)versionForStringRepresentation:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x263F08B08];
  id v5 = a3;
  unsigned int v6 = (void *)[[v4 alloc] initWithString:v5];

  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v11 = 0;
  unsigned int v7 = 0;
  if ([v6 scanInteger:&v13]) {
    BOOL v8 = HIDWORD(v13) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (([v6 isAtEnd] & 1) == 0)
    {
      unsigned int v7 = 0;
      if (![v6 scanString:@"." intoString:0]) {
        goto LABEL_17;
      }
      unsigned int v7 = 0;
      if (![v6 scanInteger:&v12] || HIDWORD(v12)) {
        goto LABEL_17;
      }
      if (([v6 isAtEnd] & 1) == 0)
      {
        unsigned int v7 = 0;
        if (![v6 scanString:@"." intoString:0]) {
          goto LABEL_17;
        }
        unsigned int v7 = 0;
        if (![v6 scanInteger:&v11] || HIDWORD(v11)) {
          goto LABEL_17;
        }
        if (![v6 isAtEnd])
        {
          unsigned int v7 = 0;
          goto LABEL_17;
        }
      }
    }
    id v9 = objc_alloc((Class)a1);
    unsigned int v7 = (void *)[v9 initWithMajor:v13 minor:v12 micro:v11];
  }
LABEL_17:

  return v7;
}

+ (id)invalidVersion
{
  if (invalidVersion_onceToken != -1) {
    dispatch_once(&invalidVersion_onceToken, &__block_literal_global_97);
  }
  v2 = (void *)invalidVersion_invalidVersion;
  return v2;
}

uint64_t __43__VisionCoreResourceVersion_invalidVersion__block_invoke()
{
  invalidVersion_invalidVersion = [[VisionCoreResourceVersion alloc] initWithMajor:0 minor:0 micro:0];
  return MEMORY[0x270F9A758]();
}

@end
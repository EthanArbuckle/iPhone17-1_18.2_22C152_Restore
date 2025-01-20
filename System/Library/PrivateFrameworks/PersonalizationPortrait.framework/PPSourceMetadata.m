@interface PPSourceMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSourceMetadata:(id)a3;
- (NSSet)featureNames;
- (PPSourceMetadata)initWithCoder:(id)a3;
- (PPSourceMetadata)initWithDwellTimeSeconds:(unsigned int)a3 lengthSeconds:(unsigned int)a4 lengthCharacters:(unsigned int)a5 donationCount:(unsigned __int16)a6 contactHandleCount:(unsigned __int16)a7 flags:(unsigned __int8)a8;
- (PPSourceMetadata)initWithFlags:(unsigned __int8)a3;
- (id)description;
- (id)featureValueForName:(id)a3;
- (unint64_t)hash;
- (unsigned)contactHandleCount;
- (unsigned)donationCount;
- (unsigned)dwellTimeSeconds;
- (unsigned)flags;
- (unsigned)lengthCharacters;
- (unsigned)lengthSeconds;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSourceMetadata

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)contactHandleCount
{
  return self->_contactHandleCount;
}

- (unsigned)donationCount
{
  return self->_donationCount;
}

- (unsigned)lengthCharacters
{
  return self->_lengthCharacters;
}

- (unsigned)lengthSeconds
{
  return self->_lengthSeconds;
}

- (unsigned)dwellTimeSeconds
{
  return self->_dwellTimeSeconds;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dwellTimeSeconds"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_dwellTimeSeconds;
LABEL_13:
    uint64_t v7 = [v5 featureValueWithInt64:dwellTimeSeconds];
LABEL_14:
    v8 = (void *)v7;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"lengthSeconds"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_lengthSeconds;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"lengthCharacters"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_lengthCharacters;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"donationCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_donationCount;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"contactHandleCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_contactHandleCount;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"flags"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t dwellTimeSeconds = self->_flags;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"userCreated"])
  {
    double v10 = 1.0;
    if ((self->_flags & 1) == 0) {
      double v10 = 0.0;
    }
    uint64_t v7 = [MEMORY[0x1E4F1E950] featureValueWithDouble:v10];
    goto LABEL_14;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4 != -1) {
    dispatch_once(&featureNames__pasOnceToken4, &__block_literal_global);
  }
  v2 = (void *)featureNames__pasExprOnceResult;
  return (NSSet *)v2;
}

void __32__PPSourceMetadata_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"dwellTimeSeconds", @"lengthSeconds", @"lengthCharacters", @"donationCount", @"contactHandleCount", @"flags", @"userCreated", 0);
  v3 = (void *)featureNames__pasExprOnceResult;
  featureNames__pasExprOnceResult = v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPSourceMetadata *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPSourceMetadata *)self isEqualToSourceMetadata:v4];
  }

  return v5;
}

- (BOOL)isEqualToSourceMetadata:(id)a3
{
  id v4 = (PPSourceMetadata *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else if (v4 {
         && (unsigned int dwellTimeSeconds = self->_dwellTimeSeconds,
  }
             dwellTimeSeconds == [(PPSourceMetadata *)v4 dwellTimeSeconds])
         && (unsigned int lengthSeconds = self->_lengthSeconds,
             lengthSeconds == [(PPSourceMetadata *)v5 lengthSeconds])
         && (unsigned int lengthCharacters = self->_lengthCharacters,
             lengthCharacters == [(PPSourceMetadata *)v5 lengthCharacters])
         && (int donationCount = self->_donationCount,
             donationCount == [(PPSourceMetadata *)v5 donationCount])
         && (int contactHandleCount = self->_contactHandleCount,
             contactHandleCount == [(PPSourceMetadata *)v5 contactHandleCount]))
  {
    int flags = self->_flags;
    BOOL v12 = flags == [(PPSourceMetadata *)v5 flags];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_lengthCharacters - (unint64_t)self->_donationCount + 32 * self->_donationCount;
  uint64_t v3 = self->_lengthSeconds - v2 + 32 * v2;
  uint64_t v4 = self->_dwellTimeSeconds - v3 + 32 * v3;
  return self->_flags - v4 + 32 * v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t dwellTimeSeconds = self->_dwellTimeSeconds;
  id v5 = a3;
  [v5 encodeInt32:dwellTimeSeconds forKey:@"dts"];
  [v5 encodeInt32:self->_lengthSeconds forKey:@"lns"];
  [v5 encodeInt32:self->_lengthCharacters forKey:@"lnc"];
  [v5 encodeInt32:self->_donationCount forKey:@"dct"];
  [v5 encodeInt32:self->_contactHandleCount forKey:@"chc"];
  [v5 encodeInt32:self->_flags forKey:@"flg"];
}

- (PPSourceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"dts"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"lns"];
  uint64_t v7 = [v4 decodeInt32ForKey:@"lnc"];
  unsigned int v8 = [v4 decodeInt32ForKey:@"dct"];
  if (HIWORD(v8)
    || (v9 = v8, unsigned int v10 = [v4 decodeInt32ForKey:@"chc"], HIWORD(v10))
    || (v11 = v10, unsigned int v12 = [v4 decodeInt32ForKey:@"flg"], v12 > 0xFF))
  {
    v13 = 0;
  }
  else
  {
    self = [(PPSourceMetadata *)self initWithDwellTimeSeconds:v5 lengthSeconds:v6 lengthCharacters:v7 donationCount:v9 contactHandleCount:v11 flags:v12];
    v13 = self;
  }

  return v13;
}

- (id)description
{
  unint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<PPSourceMetadata d:%u ls:%u lc:%u dc:%u chc:%u f:%u>", self->_dwellTimeSeconds, self->_lengthSeconds, self->_lengthCharacters, self->_donationCount, self->_contactHandleCount, self->_flags);
  return v2;
}

- (PPSourceMetadata)initWithDwellTimeSeconds:(unsigned int)a3 lengthSeconds:(unsigned int)a4 lengthCharacters:(unsigned int)a5 donationCount:(unsigned __int16)a6 contactHandleCount:(unsigned __int16)a7 flags:(unsigned __int8)a8
{
  v15.receiver = self;
  v15.super_class = (Class)PPSourceMetadata;
  result = [(PPSourceMetadata *)&v15 init];
  if (result)
  {
    result->_uint64_t dwellTimeSeconds = a3;
    result->_unsigned int lengthSeconds = a4;
    result->_unsigned int lengthCharacters = a5;
    result->_int donationCount = a6;
    result->_int contactHandleCount = a7;
    result->_int flags = a8;
  }
  return result;
}

- (PPSourceMetadata)initWithFlags:(unsigned __int8)a3
{
  return [(PPSourceMetadata *)self initWithDwellTimeSeconds:0 lengthSeconds:0 lengthCharacters:0 donationCount:0 contactHandleCount:0 flags:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
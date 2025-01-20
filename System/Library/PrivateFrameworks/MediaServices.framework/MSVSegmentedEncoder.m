@interface MSVSegmentedEncoder
- (BOOL)hasFinished;
- (MSVSegmentedCoding)rootObject;
- (MSVSegmentedCodingPackage)package;
- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3;
- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSMutableDictionary)subcoders;
- (id)_coderForKey:(id)a3;
- (id)msv_userInfo;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
- (void)finishEncoding;
- (void)msv_setUserInfo:(id)a3;
- (void)setHasFinished:(BOOL)a3;
- (void)setPackage:(id)a3;
- (void)setRootObject:(id)a3;
- (void)setSubcoders:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MSVSegmentedEncoder

uint64_t __37__MSVSegmentedEncoder_finishEncoding__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 finishEncodingPartialTopLevelObject];
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (void)finishEncoding
{
  if (![(MSVSegmentedEncoder *)self hasFinished])
  {
    [(NSMutableDictionary *)self->_subcoders enumerateKeysAndObjectsUsingBlock:&__block_literal_global_575];
    [(MSVSegmentedEncoder *)self setHasFinished:1];
  }
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)encodeRootObject:(id)a3
{
  id v5 = a3;
  if (![v5 conformsToProtocol:&unk_1EF6629A8]
    || ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSegmentedEncoder.m" lineNumber:64 description:@"Root objects must support segmented and secure coding."];
  }
  [(MSVSegmentedCodingPackage *)self->_package setArchivedClass:objc_opt_class()];
  rootObject = self->_rootObject;
  self->_rootObject = (MSVSegmentedCoding *)v5;
  id v7 = v5;

  [v7 encodeWithCoder:self];
  [(MSVSegmentedEncoder *)self finishEncoding];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v7 encodeDouble:v6 forKey:a3];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v7 encodeInt64:a3 forKey:v6];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v8 encodeObject:v7 forKey:v6];
}

- (id)_coderForKey:(id)a3
{
  v4 = [(MSVSegmentedCoding *)self->_rootObject segmentForCodingKey:a3];
  id v5 = [(NSMutableDictionary *)self->_subcoders objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [(MSVSegmentedCodingPackage *)self->_package encoderForSegment:v4 version:[(MSVSegmentedCoding *)self->_rootObject versionForSegment:v4]];
    if (v5)
    {
      [(NSMutableDictionary *)self->_subcoders setObject:v5 forKeyedSubscript:v4];
      objc_msgSend(v5, "msv_setUserInfo:", self->_userInfo);
      [v5 beginEncodingPartialTopLevelObject:self->_rootObject];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subcoders, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSVSegmentedEncoder;
  v9 = [(MSVSegmentedEncoder *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v9->_userInfo, v12);

    objc_storeStrong((id *)&v9->_package, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    subcoders = v9->_subcoders;
    v9->_subcoders = (NSMutableDictionary *)v13;
  }
  return v9;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setSubcoders:(id)a3
{
}

- (NSMutableDictionary)subcoders
{
  return self->_subcoders;
}

- (void)setRootObject:(id)a3
{
}

- (MSVSegmentedCoding)rootObject
{
  return self->_rootObject;
}

- (void)setPackage:(id)a3
{
}

- (MSVSegmentedCodingPackage)package
{
  return self->_package;
}

- (void)msv_setUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = (NSDictionary *)[v4 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  subcoders = self->_subcoders;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MSVSegmentedEncoder_msv_setUserInfo___block_invoke;
  v9[3] = &unk_1E5AD9758;
  id v10 = v4;
  id v8 = v4;
  [(NSMutableDictionary *)subcoders enumerateKeysAndObjectsUsingBlock:v9];
}

uint64_t __39__MSVSegmentedEncoder_msv_setUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "msv_setUserInfo:", *(void *)(a1 + 32));
}

- (id)msv_userInfo
{
  if (self->_userInfo) {
    return self->_userInfo;
  }
  else {
    return MEMORY[0x1E4F1CC08];
  }
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v8 = a5;
  id v9 = [(MSVSegmentedEncoder *)self _coderForKey:v8];
  [v9 encodeBytes:a3 length:a4 forKey:v8];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  *(float *)&double v7 = a3;
  [v8 encodeFloat:v6 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v7 encodeInt32:v4 forKey:v6];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v7 encodeInt:v4 forKey:v6];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MSVSegmentedEncoder *)self _coderForKey:v6];
  [v7 encodeBool:v4 forKey:v6];
}

- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3
{
  return [(MSVSegmentedEncoder *)self initWithCodingPackage:a3 userInfo:0];
}

@end
@interface UCAppClipCodeURLEncodingResult
+ (id)resultWithRawEncodedBits:(id)a3 appClipCodeBytes:(id)a4;
- (BOOL)hasPathOrQueryEncoding;
- (NSData)appClipCodeBytes;
- (NSString)rawEncodedBits;
- (NSURL)url;
- (UCAppClipCodeURLEncodingResult)initWithRawEncodedBits:(id)a3 appClipCodeBytes:(id)a4;
- (int64_t)hostEncodedBitCount;
- (int64_t)hostEncodingFormat;
- (int64_t)nonTemplatePathAndQueryEncodeType;
- (int64_t)subdomainType;
- (int64_t)templateType;
- (void)setHasPathOrQueryEncoding:(BOOL)a3;
- (void)setHostEncodedBitCount:(int64_t)a3;
- (void)setHostEncodingFormat:(int64_t)a3;
- (void)setNonTemplatePathAndQueryEncodeType:(int64_t)a3;
- (void)setSubdomainType:(int64_t)a3;
- (void)setTemplateType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation UCAppClipCodeURLEncodingResult

+ (id)resultWithRawEncodedBits:(id)a3 appClipCodeBytes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithRawEncodedBits:v7 appClipCodeBytes:v6];

  return v8;
}

- (UCAppClipCodeURLEncodingResult)initWithRawEncodedBits:(id)a3 appClipCodeBytes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UCAppClipCodeURLEncodingResult;
  v8 = [(UCAppClipCodeURLEncodingResult *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    rawEncodedBits = v8->_rawEncodedBits;
    v8->_rawEncodedBits = (NSString *)v9;

    objc_storeStrong((id *)&v8->_appClipCodeBytes, a4);
    v11 = v8;
  }

  return v8;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)rawEncodedBits
{
  return self->_rawEncodedBits;
}

- (NSData)appClipCodeBytes
{
  return self->_appClipCodeBytes;
}

- (int64_t)hostEncodedBitCount
{
  return self->_hostEncodedBitCount;
}

- (void)setHostEncodedBitCount:(int64_t)a3
{
  self->_hostEncodedBitCount = a3;
}

- (int64_t)hostEncodingFormat
{
  return self->_hostEncodingFormat;
}

- (void)setHostEncodingFormat:(int64_t)a3
{
  self->_hostEncodingFormat = a3;
}

- (BOOL)hasPathOrQueryEncoding
{
  return self->_hasPathOrQueryEncoding;
}

- (void)setHasPathOrQueryEncoding:(BOOL)a3
{
  self->_hasPathOrQueryEncoding = a3;
}

- (int64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(int64_t)a3
{
  self->_templateType = a3;
}

- (int64_t)subdomainType
{
  return self->_subdomainType;
}

- (void)setSubdomainType:(int64_t)a3
{
  self->_subdomainType = a3;
}

- (int64_t)nonTemplatePathAndQueryEncodeType
{
  return self->_nonTemplatePathAndQueryEncodeType;
}

- (void)setNonTemplatePathAndQueryEncodeType:(int64_t)a3
{
  self->_nonTemplatePathAndQueryEncodeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipCodeBytes, 0);
  objc_storeStrong((id *)&self->_rawEncodedBits, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
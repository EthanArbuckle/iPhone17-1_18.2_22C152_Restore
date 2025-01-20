@interface UASharedPasteboardInfoWrapper
+ (BOOL)supportsSecureCoding;
- (NSData)extraData;
- (NSError)error;
- (UASharedPasteboardInfo)pbinfo;
- (UASharedPasteboardInfoWrapper)initWithCoder:(id)a3;
- (id)description;
- (int64_t)extraDataType;
- (int64_t)protocolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setExtraData:(id)a3;
- (void)setExtraDataType:(int64_t)a3;
- (void)setPbinfo:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
@end

@implementation UASharedPasteboardInfoWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardInfoWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardInfoWrapper *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardInfoWrapperPBInfoKey"];
    [(UASharedPasteboardInfoWrapper *)v5 setPbinfo:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardInfoWrapperExtraDataKey"];
    [(UASharedPasteboardInfoWrapper *)v5 setExtraData:v7];

    -[UASharedPasteboardInfoWrapper setExtraDataType:](v5, "setExtraDataType:", [v4 decodeIntegerForKey:@"UASharedPasteboardInfoWrapperExtraTypeKey"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardInfoWrapperErrorKey"];
    [(UASharedPasteboardInfoWrapper *)v5 setError:v8];

    -[UASharedPasteboardInfoWrapper setProtocolVersion:](v5, "setProtocolVersion:", [v4 decodeIntegerForKey:@"UASharedPasteboardInfoWrapperProtocolVersionKey"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(UASharedPasteboardInfoWrapper *)self pbinfo];
  [v7 encodeObject:v4 forKey:@"UASharedPasteboardInfoWrapperPBInfoKey"];

  v5 = [(UASharedPasteboardInfoWrapper *)self extraData];
  [v7 encodeObject:v5 forKey:@"UASharedPasteboardInfoWrapperExtraDataKey"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[UASharedPasteboardInfoWrapper extraDataType](self, "extraDataType"), @"UASharedPasteboardInfoWrapperExtraTypeKey");
  v6 = [(UASharedPasteboardInfoWrapper *)self error];
  [v7 encodeObject:v6 forKey:@"UASharedPasteboardInfoWrapperErrorKey"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[UASharedPasteboardInfoWrapper protocolVersion](self, "protocolVersion"), @"UASharedPasteboardInfoWrapperProtocolVersionKey");
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v9.receiver = self;
  v9.super_class = (Class)UASharedPasteboardInfoWrapper;
  id v4 = [(UASharedPasteboardInfoWrapper *)&v9 description];
  int64_t v5 = [(UASharedPasteboardInfoWrapper *)self extraDataType];
  v6 = [(UASharedPasteboardInfoWrapper *)self error];
  id v7 = [(UASharedPasteboardInfoWrapper *)self pbinfo];
  [v3 appendFormat:@"%@: Extra Data Type: %ld, Error: %@, PBInfo: %@", v4, v5, v6, v7];

  return v3;
}

- (UASharedPasteboardInfo)pbinfo
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPbinfo:(id)a3
{
}

- (NSData)extraData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtraData:(id)a3
{
}

- (int64_t)extraDataType
{
  return self->_extraDataType;
}

- (void)setExtraDataType:(int64_t)a3
{
  self->_extraDataType = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extraData, 0);

  objc_storeStrong((id *)&self->_pbinfo, 0);
}

@end
@interface NFReaderSessionConfig
+ (BOOL)supportsSecureCoding;
+ (id)sessionConfigWithUIMode:(unint64_t)a3 sessionType:(unint64_t)a4 initialScanText:(id)a5 vasPass:(id)a6;
+ (id)sessionTypeString:(unint64_t)a3;
- (NFReaderSessionConfig)initWithCoder:(id)a3;
- (NSArray)vasPasses;
- (NSString)initialScanText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sessionType;
- (unint64_t)uiMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFReaderSessionConfig

+ (id)sessionConfigWithUIMode:(unint64_t)a3 sessionType:(unint64_t)a4 initialScanText:(id)a5 vasPass:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = objc_opt_new();
  v12 = (void *)v11;
  if (v11)
  {
    *(void *)(v11 + 8) = a3;
    *(void *)(v11 + 16) = a4;
    uint64_t v13 = [v9 copy];
    v14 = (void *)v12[3];
    v12[3] = v13;

    uint64_t v15 = [v10 copy];
    v16 = (void *)v12[4];
    v12[4] = v15;
  }

  return v12;
}

+ (id)sessionTypeString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"NDEFReader";
  }
  else {
    return (id)*((void *)&off_1E65ABC88 + a3 - 1);
  }
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t uiMode = self->_uiMode;
  id v5 = a3;
  [v5 encodeInteger:uiMode forKey:@"uiMode"];
  [v5 encodeInteger:self->_sessionType forKey:@"sessionType"];
  [v5 encodeObject:self->_initialScanText forKey:@"initialScanText"];
  [v5 encodeObject:self->_vasPasses forKey:@"vasPasses"];
}

- (NFReaderSessionConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFReaderSessionConfig;
  id v5 = [(NFReaderSessionConfig *)&v11 init];
  if (v5)
  {
    v5->_unint64_t uiMode = [v4 decodeIntegerForKey:@"uiMode"];
    v5->_sessionType = [v4 decodeIntegerForKey:@"sessionType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialScanText"];
    initialScanText = v5->_initialScanText;
    v5->_initialScanText = (NSString *)v6;

    uint64_t v8 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"vasPasses"];
    vasPasses = v5->_vasPasses;
    v5->_vasPasses = (NSArray *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    *(void *)(v5 + 8) = self->_uiMode;
    *(void *)(v5 + 16) = self->_sessionType;
    uint64_t v7 = [(NSString *)self->_initialScanText copyWithZone:a3];
    uint64_t v8 = (void *)v6[3];
    v6[3] = v7;

    uint64_t v9 = [(NSArray *)self->_vasPasses copyWithZone:a3];
    id v10 = (void *)v6[4];
    v6[4] = v9;
  }
  return v6;
}

- (unint64_t)uiMode
{
  return self->_uiMode;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSString)initialScanText
{
  return self->_initialScanText;
}

- (NSArray)vasPasses
{
  return self->_vasPasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasPasses, 0);

  objc_storeStrong((id *)&self->_initialScanText, 0);
}

@end
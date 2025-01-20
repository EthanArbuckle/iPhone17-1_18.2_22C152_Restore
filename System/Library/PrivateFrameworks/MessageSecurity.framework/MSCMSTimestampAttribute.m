@interface MSCMSTimestampAttribute
- (BOOL)certChainRequested;
- (BOOL)verifyTimestamps:(id)a3 error:(id *)a4;
- (MSCMSSignerInfo)singerInfo;
- (MSCMSTimestampAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSTimestampAttribute)initWithServerURL:(id)a3;
- (MSCMSTimestampAttribute)initWithServerURL:(id)a3 chainRequested:(BOOL)a4;
- (MSCMSTimestampAttribute)initWithTimestampToken:(id)a3;
- (MSCMSTimestampAttributeInternal)timestampAttribute;
- (MSOID)attributeType;
- (MSOID)digestAlgorithm;
- (NSArray)certificates;
- (NSDate)timestampTime;
- (NSURL)serverURL;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setCertChainRequested:(BOOL)a3;
- (void)setServerURL:(id)a3;
- (void)setTimestampAttribute:(id)a3;
@end

@implementation MSCMSTimestampAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.14" error:0];
}

- (MSCMSTimestampAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MSCMSTimestampAttribute;
  id v5 = a3;
  v6 = [(MSCMSTimestampAttribute *)&v11 init];
  v7 = [MSCMSTimestampAttributeInternal alloc];
  v8 = -[MSCMSTimestampAttributeInternal initWithAttribute:error:](v7, "initWithAttribute:error:", v5, a4, v11.receiver, v11.super_class);

  [(MSCMSTimestampAttribute *)v6 setTimestampAttribute:v8];
  v9 = [(MSCMSTimestampAttribute *)v6 timestampAttribute];

  if (v9) {
    v9 = v6;
  }

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3 chainRequested:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSTimestampAttribute;
  v8 = [(MSCMSTimestampAttribute *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverURL, a3);
    v9->_certChainRequested = a4;
  }

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3
{
  return [(MSCMSTimestampAttribute *)self initWithServerURL:a3 chainRequested:0];
}

- (MSCMSTimestampAttribute)initWithTimestampToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)MSCMSTimestampAttribute;
  id v3 = a3;
  v4 = [(MSCMSTimestampAttribute *)&v12 init];
  id v11 = 0;
  id v5 = [[MSCMSTimestampAttributeInternal alloc] initWithTimestampToken:v3 error:&v11];

  id v6 = v11;
  [(MSCMSTimestampAttribute *)v4 setTimestampAttribute:v5];

  id v7 = [(MSCMSTimestampAttribute *)v4 timestampAttribute];

  if (v7)
  {
    v8 = v4;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_357);
    }
    v9 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MSCMSTimestampAttribute initWithTimestampToken:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_20D8A1000, v9, OS_LOG_TYPE_ERROR, "%s failed with %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

uint64_t __50__MSCMSTimestampAttribute_initWithTimestampToken___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)verifyTimestamps:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MSCMSTimestampAttribute *)self timestampAttribute];
  LOBYTE(a4) = [v7 verifyTimestamp:v6 error:a4];

  return (char)a4;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v4 = [(MSCMSTimestampAttribute *)self timestampAttribute];
  id v5 = [v4 encodeAttributeWithError:a3];

  return v5;
}

- (NSDate)timestampTime
{
  v2 = [(MSCMSTimestampAttribute *)self timestampAttribute];
  id v3 = [v2 timestampToken];

  return (NSDate *)v3;
}

- (MSCMSTimestampAttributeInternal)timestampAttribute
{
  return (MSCMSTimestampAttributeInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestampAttribute:(id)a3
{
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServerURL:(id)a3
{
}

- (BOOL)certChainRequested
{
  return self->_certChainRequested;
}

- (void)setCertChainRequested:(BOOL)a3
{
  self->_certChainRequested = a3;
}

- (MSCMSSignerInfo)singerInfo
{
  return (MSCMSSignerInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (MSOID)digestAlgorithm
{
  return (MSOID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestAlgorithm, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_singerInfo, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);

  objc_storeStrong((id *)&self->_timestampAttribute, 0);
}

@end
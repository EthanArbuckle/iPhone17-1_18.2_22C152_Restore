@interface TLSExtension
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)extensionData;
- (id)data;
- (unint64_t)parsedLength;
- (unsigned)extensionType;
- (void)setExtensionData:(id)a3;
- (void)setExtensionType:(unsigned __int8)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation TLSExtension

- (id)data
{
  v3 = +[NSMutableData data];
  if ([(TLSMessageClass *)self encodeByte:[(TLSExtension *)self extensionType] buffer:v3])
  {
    v4 = [(TLSExtension *)self extensionData];
    unsigned int v5 = [(TLSMessageClass *)self encodeByteArray:v4 minLength:0 maxLength:0xFFFFLL buffer:v3];

    v6 = 0;
    if (v5)
    {
      v6 = +[NSData dataWithData:v3];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = v4;
  id v7 = [v6 bytes];
  v8 = (char *)[v6 length] + (void)v7;
  v9 = objc_alloc_init(TLSExtension);
  unsigned __int8 v14 = 0;
  v10 = [(TLSMessageClass *)v9 parseByte:v5 end:v8 result:&v14];
  if (v10)
  {
    [(TLSExtension *)v9 setExtensionType:v14];
    id v13 = 0;
    v10 = [(TLSMessageClass *)v9 parseByteArray:v10 end:v8 minLength:0 maxLength:0xFFFFLL result:&v13];
    id v11 = v13;
    if (v10)
    {
      [(TLSExtension *)v9 setExtensionData:v11];
      -[TLSExtension setParsedLength:](v9, "setParsedLength:", v10 - (unsigned char *)[objc_retainAutorelease(v6) bytes]);
      v10 = v9;
    }
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TLSExtension *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(TLSExtension *)self data];
      id v7 = [(TLSExtension *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unsigned)extensionType
{
  return self->_extensionType;
}

- (void)setExtensionType:(unsigned __int8)a3
{
  self->_extensionType = a3;
}

- (NSData)extensionData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtensionData:(id)a3
{
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
}

@end
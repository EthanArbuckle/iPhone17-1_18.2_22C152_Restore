@interface ISOReaderEngagement
+ (BOOL)supportsSecureCoding;
- (CBOR)cborObj;
- (ISOReaderEngagement)initWithCoder:(id)a3;
- (ISOReaderEngagement)initWithData:(id)a3 type:(int64_t)a4;
- (ISOReaderEngagement)initWithType:(int64_t)a3;
- (NSArray)cipherSuites;
- (id)encode;
- (int64_t)type;
- (void)setCborObj:(id)a3;
- (void)setCipherSuites:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ISOReaderEngagement

- (ISOReaderEngagement)initWithData:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ISOReaderEngagement;
  v7 = [(ISOReaderEngagement *)&v20 init];
  p_isa = (id *)&v7->super.isa;
  if (v7)
  {
    v7->_type = a4;
    uint64_t v9 = +[CBOR decodeFromData:v6];
    id v10 = p_isa[3];
    p_isa[3] = (id)v9;

    id v13 = p_isa[3];
    if (!v13 || [v13 type] != (id)5)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]", 43, p_isa, @"Invalid CBOR type", v11, v12, v17);
      v15 = 0;
      goto LABEL_7;
    }
    v14 = [p_isa[3] dictionary];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001C240;
    v18[3] = &unk_100054E48;
    v19 = p_isa;
    [v14 enumerateKeysAndObjectsUsingBlock:v18];
  }
  v15 = p_isa;
LABEL_7:

  return v15;
}

- (ISOReaderEngagement)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISOReaderEngagement;
  result = [(ISOReaderEngagement *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)encode
{
  v3 = [(ISOReaderEngagement *)self cborObj];

  if (v3)
  {
    v4 = [(ISOReaderEngagement *)self cborObj];
  }
  else
  {
    objc_super v5 = +[CBOR cborWithUnsignedInteger:0];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = +[NSString stringWithFormat:@"%ld.%ld", 1, 0];
    v8 = +[CBOR cborWithUTF8String:v7];
    [v6 setObject:v8 forKeyedSubscript:v5];

    uint64_t v12 = v5;
    uint64_t v9 = +[NSArray arrayWithObjects:&v12 count:1];
    id v10 = +[CBOR cborWithDictionary:v6 keyOrderList:v9];
    [(ISOReaderEngagement *)self setCborObj:v10];

    v4 = [(ISOReaderEngagement *)self cborObj];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISOReaderEngagement)initWithCoder:(id)a3
{
  v4 = (ISOReaderEngagement *)objc_opt_new();

  return v4;
}

- (NSArray)cipherSuites
{
  return self->_cipherSuites;
}

- (void)setCipherSuites:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CBOR)cborObj
{
  return self->_cborObj;
}

- (void)setCborObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cborObj, 0);

  objc_storeStrong((id *)&self->_cipherSuites, 0);
}

@end
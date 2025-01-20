@interface HAPTLVParser
+ (id)parserWithData:(id)a3;
- (HAPTLVParser)initWithData:(id)a3;
- (id)parseResponseForArray:(unint64_t)a3;
- (id)parseResponseForData:(unint64_t)a3;
- (id)parseResponseForNumber:(unint64_t)a3;
- (id)parseResponseForString:(unint64_t)a3;
- (id)parseResponseForUInt16:(unint64_t)a3;
- (id)parseResponseForUInt8:(unint64_t)a3;
- (id)parseResponseForUUID:(unint64_t)a3;
@end

@implementation HAPTLVParser

+ (id)parserWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HAPTLVParser alloc] initWithData:v3];

  return v4;
}

- (HAPTLVParser)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVParser;
  v6 = [(HAPTLVParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tlvData, a3);
  }

  return v7;
}

- (id)parseResponseForData:(unint64_t)a3
{
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  int v5 = TLV8Get();
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSError) initWithDomain:NSOSStatusErrorDomain code:v5 userInfo:0];
    v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse data for TLV: %tu %@", buf, 0x20u);
    }
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = +[NSData dataWithBytes:0 length:0];
  }

  return v9;
}

- (id)parseResponseForNumber:(unint64_t)a3
{
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  v4 = +[NSNumber numberWithLongLong:TLV8GetUInt64()];

  return v4;
}

- (id)parseResponseForUInt8:(unint64_t)a3
{
  id v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length] == (id)1)
  {
    v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v3 bytes]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)parseResponseForUInt16:(unint64_t)a3
{
  id v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length] == (id)2)
  {
    v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int16 *)[v3 bytes]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)parseResponseForString:(unint64_t)a3
{
  id v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if (v3) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)parseResponseForUUID:(unint64_t)a3
{
  id v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v3 bytes]];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)parseResponseForArray:(unint64_t)a3
{
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  int v5 = +[NSMutableArray array];
  int v6 = TLV8Get();
  if (v6)
  {
    if (v5) {
      goto LABEL_9;
    }
  }
  else
  {
    do
    {
      v7 = +[NSData dataWithBytes:0 length:0];
      [v5 addObject:v7];

      int v8 = TLV8Get();
    }
    while (!v8);
    int v6 = v8;
    if (v5) {
      goto LABEL_9;
    }
  }
  id v9 = [objc_alloc((Class)NSError) initWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
  v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543874;
    unint64_t v14 = v11;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse array for TLV: %tu %@", buf, 0x20u);
  }
LABEL_9:

  return v5;
}

- (void).cxx_destruct
{
}

@end
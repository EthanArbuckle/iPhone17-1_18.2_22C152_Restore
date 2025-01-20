@interface HAPBTLEControlPacket
+ (id)packetWithSerializedData:(id)a3 error:(id *)a4;
+ (id)shortDescription;
- (BOOL)isContinuationPacket;
- (HAPBTLEControlPacket)init;
- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7;
- (HAPBTLETransactionIdentifier)transactionIdentifier;
- (NSData)payload;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)serialize;
- (id)shortDescription;
- (unsigned)type;
@end

@implementation HAPBTLEControlPacket

- (HAPBTLEControlPacket)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)packetWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 length])
  {
    CFStringRef v7 = @"The control field length is invalid.";
    goto LABEL_7;
  }
  buf[0] = 0;
  [v5 getBytes:buf range:0];
  unsigned int v6 = buf[0];
  if (buf[0])
  {
    CFStringRef v7 = @"Invalid control field version.";
    goto LABEL_7;
  }
  if ((buf[0] & 0x70) != 0)
  {
    CFStringRef v7 = @"Reserved bits must be zero.";
LABEL_7:
    id v8 = +[NSError hapErrorWithcode:9 description:@"Failed to parse control field." reason:v7 suggestion:0 underlyingError:0];
LABEL_8:
    uint64_t v9 = 0;
LABEL_9:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = (buf[0] >> 1) & 7;
  if (v9 > 1)
  {
    v21 = +[NSString stringWithFormat:@"Invalid control type: %u.", (buf[0] >> 1) & 7];
    id v8 = +[NSError hapErrorWithcode:9 description:@"Failed to parse control field." reason:v21 suggestion:0 underlyingError:0];

    goto LABEL_8;
  }
  if ((buf[0] & 0x80) != 0)
  {
    if ((unint64_t)[v5 length] <= 1)
    {
      id v8 = +[NSError hapErrorWithcode:9 description:@"Failed to parse control field." reason:@"The control field length is invalid for a continuation payload." suggestion:0 underlyingError:0];
      goto LABEL_9;
    }
    unsigned __int8 v22 = 0;
    [v5 getBytes:&v22 range:1];
    uint64_t v11 = v22;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 1;
  }
  id v8 = 0;
  uint64_t v10 = v6 >> 7;
LABEL_10:

  id v13 = v8;
  if (v12)
  {
    v14 = [[HAPBTLETransactionIdentifier alloc] initWithUnsignedCharValue:v11];
    v15 = [v5 subdataWithRange:v12, (char *)[v5 length] - v12];
    v16 = [[HAPBTLEControlPacket alloc] initWithControlType:v9 transactionIdentifier:v14 continuationPacket:v10 packetPayload:v15 maximumLength:-1];
  }
  else
  {
    v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = sub_100083FD0(0);
      v19 = +[HAPBTLEControlPacket shortDescription];
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse control field with error: %@", buf, 0x20u);
    }
    v16 = 0;
    if (a4) {
      *a4 = v13;
    }
  }

  return v16;
}

- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7
{
  BOOL v9 = a5;
  id v13 = a4;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HAPBTLEControlPacket;
  v15 = [(HAPBTLEControlPacket *)&v27 init];
  v16 = v15;
  if (!v15)
  {
LABEL_12:
    v23 = v16;
    goto LABEL_13;
  }
  v15->_type = a3;
  objc_storeStrong((id *)&v15->_transactionIdentifier, a4);
  v16->_continuationPacket = v9;
  if (v9) {
    unint64_t v17 = 2;
  }
  else {
    unint64_t v17 = 1;
  }
  BOOL v18 = a7 >= v17;
  id v19 = (id)(a7 - v17);
  if (v18)
  {
    if ([v14 length] < v19) {
      id v19 = [v14 length];
    }
    uint64_t v24 = [v14 subdataWithRange:0, v19];
    payload = v16->_payload;
    v16->_payload = (NSData *)v24;

    goto LABEL_12;
  }
  v20 = sub_100083F74();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = sub_100083FD0(0);
    unsigned __int8 v22 = [(HAPBTLEControlPacket *)v16 shortDescription];
    *(_DWORD *)buf = 138543874;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v22;
    __int16 v32 = 2048;
    unint64_t v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@[%@] The maximum packet length must be greater than the header length: %tu", buf, 0x20u);
  }
  v23 = 0;
LABEL_13:

  return v23;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return [v2 shortDescription];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HAPBTLEControlPacket *)self shortDescription];
  if (v3)
  {
    unsigned int v6 = +[NSString stringWithFormat:@" %p", self];
  }
  else
  {
    unsigned int v6 = &stru_10027B0E8;
  }
  unsigned int v7 = [(HAPBTLEControlPacket *)self type];
  id v8 = @"unknown";
  if (v7 == 1) {
    id v8 = @"response";
  }
  if (!v7) {
    id v8 = @"request";
  }
  BOOL v9 = v8;
  uint64_t v10 = [(HAPBTLEControlPacket *)self transactionIdentifier];
  unsigned int v11 = [v10 unsignedCharValue];
  uint64_t v12 = [(HAPBTLEControlPacket *)self payload];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@%@, Type = %@, Transaction Identifier = 0x%02x, Payload Length = %tu>", v5, v6, v9, v11, [v12 length]);

  if (v3) {

  }
  return v13;
}

- (id)debugDescription
{
  return [(HAPBTLEControlPacket *)self descriptionWithPointer:1];
}

- (id)description
{
  return [(HAPBTLEControlPacket *)self descriptionWithPointer:0];
}

- (id)serialize
{
  unsigned __int8 v3 = [(HAPBTLEControlPacket *)self type];
  id v4 = [(HAPBTLEControlPacket *)self transactionIdentifier];
  unsigned __int8 v5 = [v4 unsignedCharValue];
  unsigned int v6 = [(HAPBTLEControlPacket *)self isContinuationPacket];
  buf[0] = v5;
  unsigned int v7 = +[NSMutableData dataWithCapacity:2];
  id v8 = v7;
  char v9 = 2 * v3;
  if (v6) {
    char v9 = (2 * v3) | 0x80;
  }
  char v16 = v9;
  [v7 appendBytes:&v16 length:1];
  if (v6) {
    [v8 appendBytes:buf length:1];
  }

  if (v8)
  {
    uint64_t v10 = [v8 mutableCopy];
    unsigned int v11 = [(HAPBTLEControlPacket *)self payload];
    [v10 appendData:v11];

    id v12 = [v10 copy];
  }
  else
  {
    uint64_t v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = sub_100083FD0(0);
      id v14 = [(HAPBTLEControlPacket *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      BOOL v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control header with error: %@", buf, 0x20u);
    }
    id v12 = 0;
  }

  return v12;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)payload
{
  return self->_payload;
}

- (BOOL)isContinuationPacket
{
  return self->_continuationPacket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
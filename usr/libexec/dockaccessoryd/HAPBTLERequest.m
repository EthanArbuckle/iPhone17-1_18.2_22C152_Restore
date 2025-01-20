@interface HAPBTLERequest
- (BOOL)isEncrypted;
- (BOOL)isFinished;
- (HAPBTLEControlOutputStream)controlOutputStream;
- (HAPBTLERequest)init;
- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7;
- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6;
- (HAPBTLETransactionIdentifier)identifier;
- (HAPCharacteristic)characteristic;
- (HAPService)service;
- (HMFBlockOperation)operation;
- (HMFTimer)responseTimer;
- (NSData)body;
- (double)timeoutInterval;
- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7;
- (id)_serializeHeader;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)serialize;
- (id)shortDescription;
- (unsigned)type;
- (void)cancelWithError:(id)a3;
- (void)setControlOutputStream:(id)a3;
- (void)setOperation:(id)a3;
- (void)setResponseTimer:(id)a3;
@end

@implementation HAPBTLERequest

- (HAPBTLERequest)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  int v10 = a4;
  id v13 = a3;
  id v14 = a5;
  v15 = v14;
  if (v10)
  {
    if (a7 <= 0.0)
    {
      v16 = sub_100083F74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = sub_100083FD0(0);
        *(_DWORD *)buf = 138543362;
        v31 = v17;
        v18 = "%{public}@[HAPBTLERequest] A timeout > 0 is required";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if ((unint64_t)[v14 length] >= 0x10000)
    {
      v16 = sub_100083F74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = sub_100083FD0(0);
        *(_DWORD *)buf = 138543362;
        v31 = v17;
        v18 = "%{public}@[HAPBTLERequest] The body length must not exceed 64KB";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v29.receiver = self;
    v29.super_class = (Class)HAPBTLERequest;
    v21 = [(HAPBTLERequest *)&v29 init];
    if (v21)
    {
      uint64_t v22 = [v13 service];
      service = v21->_service;
      v21->_service = (HAPService *)v22;

      objc_storeStrong((id *)&v21->_characteristic, a3);
      v21->_type = v10;
      v24 = (NSData *)[v15 copy];
      body = v21->_body;
      v21->_body = v24;

      v21->_encrypted = a6;
      v21->_timeoutInterval = a7;
      if (v10 != 255)
      {
        v26 = +[HAPBTLETransactionIdentifier randomTransactionIdentifier];
LABEL_18:
        identifier = v21->_identifier;
        v21->_identifier = v26;

        goto LABEL_19;
      }
      if ((unint64_t)[v15 length] >= 2)
      {
        buf[0] = 0;
        [v15 getBytes:buf range:1];
        v27 = [HAPBTLETransactionIdentifier alloc];
        v26 = [(HAPBTLETransactionIdentifier *)v27 initWithUnsignedCharValue:buf[0]];
        goto LABEL_18;
      }
    }
LABEL_19:
    self = v21;
    v19 = self;
    goto LABEL_12;
  }
  v16 = sub_100083F74();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    v18 = "%{public}@[HAPBTLERequest] A request type is required";
    goto LABEL_10;
  }
LABEL_11:

  v19 = 0;
LABEL_12:

  return v19;
}

- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  v7 = self;
  if (a3)
  {
    v7 = (HAPBTLERequest *)[(HAPBTLERequest *)self _initWithCharacteristic:a3 requestType:a4 bodyData:a5 shouldEncrypt:a6 timeoutInterval:a7];
    v8 = v7;
  }
  else
  {
    v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = sub_100083FD0(0);
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] A characteristic is required", (uint8_t *)&v12, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6
{
  return (HAPBTLERequest *)[(HAPBTLERequest *)self _initWithCharacteristic:0 requestType:a3 bodyData:a4 shouldEncrypt:a5 timeoutInterval:a6];
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HAPBTLERequest *)self shortDescription];
  if (v3)
  {
    v6 = +[NSString stringWithFormat:@" %p", self];
  }
  else
  {
    v6 = &stru_10027B0E8;
  }
  unsigned __int8 v7 = [(HAPBTLERequest *)self type] + 1;
  if (v7 > 9u) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = off_100273218[(char)v7];
  }
  [(HAPBTLERequest *)self timeoutInterval];
  uint64_t v10 = v9;
  if ([(HAPBTLERequest *)self isEncrypted]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  int v12 = [(HAPBTLERequest *)self identifier];
  id v13 = [(HAPBTLERequest *)self body];
  id v14 = [v13 length];
  v15 = [(HAPBTLERequest *)self characteristic];
  v16 = +[NSString stringWithFormat:@"<%@%@, Type = %@, Timeout = %f, Encrypted = %@, Request Identifier = %@, Body Length = %tu, Characteristic = %@>", v5, v6, v8, v10, v11, v12, v14, v15];

  if (v3) {

  }
  return v16;
}

- (id)debugDescription
{
  return [(HAPBTLERequest *)self descriptionWithPointer:1];
}

- (id)description
{
  return [(HAPBTLERequest *)self descriptionWithPointer:0];
}

- (void)cancelWithError:(id)a3
{
  id v6 = a3;
  if (![(HAPBTLERequest *)self isFinished])
  {
    id v4 = [(HAPBTLERequest *)self operation];
    [v4 cancelWithError:v6];

    v5 = [(HAPBTLERequest *)self responseTimer];
    [v5 suspend];
  }
}

- (id)serialize
{
  if ([(HAPBTLERequest *)self type] == 255)
  {
    unsigned __int8 v7 = [(HAPBTLERequest *)self body];
    id v4 = [v7 mutableCopy];
  }
  else
  {
    BOOL v3 = [(HAPBTLERequest *)self _serializeHeader];
    id v4 = [v3 mutableCopy];

    v5 = [(HAPBTLERequest *)self body];
    id v6 = [v5 length];

    if (!v6) {
      goto LABEL_6;
    }
    unsigned __int8 v7 = [(HAPBTLERequest *)self body];
    [v4 appendData:v7];
  }

LABEL_6:

  return v4;
}

- (id)_serializeHeader
{
  BOOL v3 = +[NSMutableData dataWithCapacity:6];
  unsigned __int8 v23 = [(HAPBTLERequest *)self type];
  [v3 appendBytes:&v23 length:1];
  id v4 = [(HAPBTLERequest *)self identifier];
  unsigned __int8 v5 = [v4 unsignedCharValue];

  unsigned __int8 v22 = v5;
  [v3 appendBytes:&v22 length:1];
  if ([(HAPBTLERequest *)self type] == 6 || [(HAPBTLERequest *)self type] == 8)
  {
    id v6 = [(HAPBTLERequest *)self service];
    unsigned __int8 v7 = [v6 instanceID];
    unsigned __int16 v8 = (unsigned __int16)[v7 unsignedShortValue];

    unsigned __int16 v21 = v8;
    [v3 appendBytes:&v21 length:2];
  }
  else
  {
    uint64_t v9 = [(HAPBTLERequest *)self characteristic];
    uint64_t v10 = v9;
    if (v9)
    {
      CFStringRef v11 = [v9 instanceID];
      unsigned __int16 v12 = (unsigned __int16)[v11 unsignedShortValue];
    }
    else
    {
      unsigned __int16 v12 = 0;
    }
    unsigned __int16 v20 = v12;
    [v3 appendBytes:&v20 length:2];
  }
  id v13 = [(HAPBTLERequest *)self body];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = [(HAPBTLERequest *)self body];
    unsigned __int16 v16 = (unsigned __int16)[v15 length];

    unsigned __int16 v19 = v16;
    [v3 appendBytes:&v19 length:2];
  }
  id v17 = [v3 copy];

  return v17;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPService)service
{
  return self->_service;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSData)body
{
  return self->_body;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (HMFBlockOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);

  return (HMFBlockOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (HAPBTLEControlOutputStream)controlOutputStream
{
  return self->_controlOutputStream;
}

- (void)setControlOutputStream:(id)a3
{
}

- (HMFTimer)responseTimer
{
  return self->_responseTimer;
}

- (void)setResponseTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_controlOutputStream, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
@interface HAPBTLEResponse
- (BOOL)isBodyComplete;
- (BOOL)isComplete;
- (BOOL)isEncrypted;
- (BOOL)isHeaderComplete;
- (BOOL)isValid;
- (HAPBTLERequest)request;
- (HAPBTLEResponse)init;
- (HAPBTLEResponse)initWithRequest:(id)a3;
- (HAPBTLETransactionIdentifier)identifier;
- (NSData)body;
- (NSMutableData)_internalBody;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4;
- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4;
- (unint64_t)_remainingBodyLength;
- (unint64_t)appendData:(id)a3 error:(id *)a4;
- (unint64_t)bodyLength;
- (unsigned)statusCode;
- (void)_setInternalBody:(id)a3;
- (void)setBody:(id)a3;
- (void)setHeaderComplete:(BOOL)a3;
@end

@implementation HAPBTLEResponse

- (HAPBTLEResponse)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPBTLEResponse)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPBTLEResponse;
  v6 = [(HAPBTLEResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HAPBTLEResponse *)self shortDescription];
  if (v3)
  {
    v6 = +[NSString stringWithFormat:@" %p", self];
  }
  else
  {
    v6 = &stru_10027B0E8;
  }
  if ([(HAPBTLEResponse *)self isEncrypted]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  v8 = [(HAPBTLEResponse *)self identifier];
  unint64_t v9 = [(HAPBTLEResponse *)self bodyLength];
  v10 = [(HAPBTLEResponse *)self request];
  v11 = [(HAPBTLEResponse *)self body];
  v12 = +[NSString stringWithFormat:@"<%@%@, Encrypted = %@, Response Identifier = %@, Body Length = %tu, Request = %@> <Body: %@>", v5, v6, v7, v8, v9, v10, v11];

  if (v3) {

  }
  return v12;
}

- (id)debugDescription
{
  return [(HAPBTLEResponse *)self descriptionWithPointer:1];
}

- (id)description
{
  return [(HAPBTLEResponse *)self descriptionWithPointer:0];
}

- (BOOL)isEncrypted
{
  v2 = [(HAPBTLEResponse *)self request];
  unsigned __int8 v3 = [v2 isEncrypted];

  return v3;
}

- (BOOL)isComplete
{
  BOOL v3 = [(HAPBTLEResponse *)self isHeaderComplete];
  if (v3)
  {
    LOBYTE(v3) = [(HAPBTLEResponse *)self isBodyComplete];
  }
  return v3;
}

- (BOOL)isBodyComplete
{
  if (![(HAPBTLEResponse *)self isHeaderComplete]) {
    return 0;
  }
  id v3 = [(HAPBTLEResponse *)self bodyLength];
  id v4 = [(HAPBTLEResponse *)self body];
  BOOL v5 = v3 == [v4 length];

  return v5;
}

- (BOOL)isValid
{
  BOOL v3 = [(HAPBTLEResponse *)self isComplete];
  if (v3)
  {
    id v4 = [(HAPBTLEResponse *)self identifier];
    BOOL v5 = [(HAPBTLEResponse *)self request];
    v6 = [v5 identifier];
    unsigned __int8 v7 = [v4 isEqual:v6];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (unint64_t)_remainingBodyLength
{
  BOOL v3 = [(HAPBTLEResponse *)self body];

  if (v3) {
    return 0;
  }
  unint64_t v5 = [(HAPBTLEResponse *)self bodyLength];
  v6 = [(HAPBTLEResponse *)self _internalBody];
  unint64_t v4 = v5 - (void)[v6 length];

  return v4;
}

- (unint64_t)appendData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(HAPBTLEResponse *)self isComplete])
  {
    unsigned __int8 v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sub_100083FD0(0);
      unint64_t v9 = [(HAPBTLEResponse *)self shortDescription];
      int v24 = 138543618;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not appending data, the response is complete", (uint8_t *)&v24, 0x16u);
    }
    if (a4)
    {
      CFStringRef v10 = @"Response is complete.";
LABEL_6:
      +[NSError hapErrorWithcode:3 description:@"Failed to parse response." reason:v10 suggestion:0 underlyingError:0];
      unint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if ([(HAPBTLEResponse *)self isHeaderComplete])
  {
    unint64_t v11 = 0;
  }
  else
  {
    if ((unint64_t)[v6 length] <= 1)
    {
      v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = sub_100083FD0(0);
        v14 = [(HAPBTLEResponse *)self shortDescription];
        int v24 = 138543874;
        v25 = v13;
        __int16 v26 = 2112;
        v27 = v14;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[%@] The data, %@, does not contain the entire response header", (uint8_t *)&v24, 0x20u);
      }
      if (a4)
      {
        CFStringRef v10 = @"The entire header was not present.";
        goto LABEL_6;
      }
LABEL_14:
      unint64_t v11 = 0;
      goto LABEL_27;
    }
    unint64_t v11 = [(HAPBTLEResponse *)self _deserializeHeaderWithData:v6 error:a4];
    if (!v11) {
      goto LABEL_27;
    }
  }
  v15 = (char *)[v6 length];
  if (![(HAPBTLEResponse *)self isBodyComplete] && v15 != (char *)v11)
  {
    unint64_t v16 = [(HAPBTLEResponse *)self _remainingBodyLength];
    if (v16)
    {
      if (v16 >= (unint64_t)&v15[-v11]) {
        unint64_t v17 = (unint64_t)&v15[-v11];
      }
      else {
        unint64_t v17 = v16;
      }
      v18 = [(HAPBTLEResponse *)self _internalBody];

      if (!v18)
      {
        v19 = +[NSMutableData dataWithCapacity:[(HAPBTLEResponse *)self bodyLength]];
        [(HAPBTLEResponse *)self _setInternalBody:v19];
      }
      v20 = [(HAPBTLEResponse *)self _internalBody];
      v21 = [v6 subdataWithRange:v11, v17];
      [v20 appendData:v21];

      v11 += v17;
    }
    if (![(HAPBTLEResponse *)self _remainingBodyLength])
    {
      v22 = [(HAPBTLEResponse *)self _internalBody];
      [(HAPBTLEResponse *)self setBody:v22];

      [(HAPBTLEResponse *)self _setInternalBody:0];
    }
  }
LABEL_27:

  return v11;
}

- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = 2;
  [v6 getBytes:v14 length:2];
  v8 = [HAPBTLETransactionIdentifier alloc];
  unint64_t v9 = [(HAPBTLETransactionIdentifier *)v8 initWithUnsignedCharValue:v14[0]];
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_statusCode = v14[1];
  if ((unint64_t)[v6 length] >= 3)
  {
    unint64_t v11 = [v6 subdataWithRange:2, [v6 length] - 2];
    unint64_t v12 = [(HAPBTLEResponse *)self _deserializeHeaderBodyLengthWithData:v11 error:a4];

    if (!v12)
    {
      unint64_t v7 = 0;
      goto LABEL_6;
    }
    unint64_t v7 = v12 + 2;
  }
  [(HAPBTLEResponse *)self setHeaderComplete:1];
LABEL_6:

  return v7;
}

- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 length] > 1)
  {
    LOWORD(v12) = 0;
    unint64_t v10 = 2;
    [v6 getBytes:&v12 range:0];
    self->_bodyLength = (unsigned __int16)v12;
  }
  else
  {
    unint64_t v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_100083FD0(0);
      unint64_t v9 = [(HAPBTLEResponse *)self shortDescription];
      int v12 = 138543874;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse header body length with control body: %@", (uint8_t *)&v12, 0x20u);
    }
    if (a4)
    {
      +[NSError hapErrorWithcode:15 description:@"Failed to parse response." reason:@"Failed to parse header body length." suggestion:0 underlyingError:0];
      unint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v10 = 0;
    }
  }

  return v10;
}

- (HAPBTLERequest)request
{
  return self->_request;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isHeaderComplete
{
  return self->_headerComplete;
}

- (void)setHeaderComplete:(BOOL)a3
{
  self->_headerComplete = a3;
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (NSMutableData)_internalBody
{
  return self->__internalBody;
}

- (void)_setInternalBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end
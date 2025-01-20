@interface RPNearFieldAuthenticationPayload
+ (id)_authTagWithSelfIdentity:(id)a3 data:(id)a4;
+ (id)_signatureWithSelfIdentity:(id)a3 data:(id)a4;
- (BOOL)isValidTimeStamp;
- (BOOL)isValidTimeStampSince:(id)a3;
- (BOOL)verifyWithIdentity:(id)a3;
- (NSData)authTag;
- (NSData)pkData;
- (NSData)signatureData;
- (NSDate)timeStamp;
- (NSUUID)bonjourListenerUUID;
- (RPNearFieldAuthenticationPayload)initWithDictionary:(id)a3;
- (RPNearFieldAuthenticationPayload)initWithTimeStamp:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5 selfIdentity:(id)a6;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
@end

@implementation RPNearFieldAuthenticationPayload

- (RPNearFieldAuthenticationPayload)initWithTimeStamp:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5 selfIdentity:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)RPNearFieldAuthenticationPayload;
  v15 = [(RPNearFieldMessagePayload *)&v34 initWithType:1];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeStamp, a3);
    v17 = (NSData *)[v12 copy];
    pkData = v16->_pkData;
    v16->_pkData = v17;

    objc_storeStrong((id *)&v16->_bonjourListenerUUID, a5);
    uint64_t v19 = [(id)objc_opt_class() _authTagWithSelfIdentity:v14 data:v16->_pkData];
    authTag = v16->_authTag;
    v16->_authTag = (NSData *)v19;

    v21 = v16->_authTag;
    v22 = v16->_pkData;
    v23 = v16->_timeStamp;
    v24 = v21;
    v25 = v22;
    id v26 = [objc_alloc((Class)NSMutableData) initWithCapacity:42];
    [(NSDate *)v23 timeIntervalSinceReferenceDate];
    double v28 = v27;

    int v35 = (int)v28;
    v29 = +[NSData dataWithBytes:&v35 length:4];
    [v26 appendData:v24];

    [v26 appendData:v25];
    [v26 appendData:v29];

    uint64_t v30 = [(id)objc_opt_class() _signatureWithSelfIdentity:v14 data:v26];
    signatureData = v16->_signatureData;
    v16->_signatureData = (NSData *)v30;

    v32 = v16;
  }

  return v16;
}

- (RPNearFieldAuthenticationPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = CFDictionaryGetCFDataOfLength();
  v6 = v5;
  if (!v5)
  {
    v22 = 0;
    goto LABEL_21;
  }
  id v7 = v5;
  if ([v7 length] != (id)4)
  {

    goto LABEL_12;
  }
  id v8 = v7;
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)*(int *)[v8 bytes]);

  if (!v9)
  {
    while (1)
LABEL_12:
      +[NSException raise:@"CUGuardLetNoReturn" format:@"CUGuardLet with no return"];
  }
  CFDataGetTypeID();
  v10 = CFDictionaryGetTypedValue();
  if (v10)
  {
    id v11 = CFDictionaryGetCFDataOfLength();
    if (v11)
    {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v11 bytes]];
      CFDataGetTypeID();
      id v13 = CFDictionaryGetTypedValue();
      if (v13)
      {
        CFDataGetTypeID();
        id v14 = CFDictionaryGetTypedValue();
        if (v14
          && (v24.receiver = self,
              v24.super_class = (Class)RPNearFieldAuthenticationPayload,
              v15 = [(RPNearFieldMessagePayload *)&v24 initWithDictionary:v4],
              (self = v15) != 0))
        {
          objc_storeStrong((id *)&v15->_timeStamp, v9);
          v16 = (NSData *)[v10 copy];
          pkData = self->_pkData;
          self->_pkData = v16;

          objc_storeStrong((id *)&self->_bonjourListenerUUID, v12);
          v18 = (NSData *)[v14 copy];
          authTag = self->_authTag;
          self->_authTag = v18;

          v20 = (NSData *)[v13 copy];
          signatureData = self->_signatureData;
          self->_signatureData = v20;

          self = self;
          v22 = self;
        }
        else
        {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

LABEL_21:
  return v22;
}

- (id)dictionaryRepresentation
{
  v16[0] = 0;
  v16[1] = 0;
  [(NSUUID *)self->_bonjourListenerUUID getUUIDBytes:v16];
  v3 = +[NSData dataWithBytes:v16 length:16];
  v14[0] = &off_10012B0F0;
  [(NSDate *)self->_timeStamp timeIntervalSinceReferenceDate];
  int v13 = (int)v4;
  v5 = +[NSData dataWithBytes:&v13 length:4];
  pkData = self->_pkData;
  v15[0] = v5;
  v15[1] = pkData;
  v14[1] = &off_10012B108;
  v14[2] = &off_10012B120;
  authTag = self->_authTag;
  v15[2] = v3;
  v15[3] = authTag;
  v14[3] = &off_10012B150;
  v14[4] = &off_10012B138;
  v15[4] = self->_signatureData;
  id v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  v12.receiver = self;
  v12.super_class = (Class)RPNearFieldAuthenticationPayload;
  v9 = [(RPNearFieldMessagePayload *)&v12 dictionaryRepresentation];
  v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  [v10 addEntriesFromDictionary:v8];

  return v10;
}

- (BOOL)isValidTimeStamp
{
  v3 = +[NSDate now];
  LOBYTE(self) = [(RPNearFieldAuthenticationPayload *)self isValidTimeStampSince:v3];

  return (char)self;
}

- (BOOL)isValidTimeStampSince:(id)a3
{
  [(NSDate *)self->_timeStamp timeIntervalSinceDate:a3];
  return v3 < 30.0 && v3 > -30.0;
}

- (BOOL)verifyWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = [v4 edPKData];
  if (v5)
  {
    authTag = self->_authTag;
    pkData = self->_pkData;
    id v25 = 0;
    unsigned int v8 = [v4 verifyAuthTag:authTag data:pkData type:4 error:&v25];
    id v9 = v25;
    v10 = v9;
    if (v8)
    {
      id v11 = self->_authTag;
      objc_super v12 = self->_pkData;
      int v13 = self->_timeStamp;
      id v14 = v11;
      v15 = v12;
      id v16 = [objc_alloc((Class)NSMutableData) initWithCapacity:42];
      [(NSDate *)v13 timeIntervalSinceReferenceDate];
      double v18 = v17;

      int v26 = (int)v18;
      uint64_t v19 = +[NSData dataWithBytes:&v26 length:4];
      [v16 appendData:v14];

      [v16 appendData:v15];
      [v16 appendData:v19];

      signatureData = self->_signatureData;
      id v24 = v10;
      unsigned __int8 v21 = [v4 verifySignature:signatureData data:v16 error:&v24];
      id v22 = v24;

      if ((v21 & 1) == 0 && dword_1001414E8 <= 90 && (dword_1001414E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      unsigned __int8 v21 = 0;
      id v22 = v9;
    }
  }
  else
  {
    unsigned __int8 v21 = 0;
  }

  return v21;
}

+ (id)_authTagWithSelfIdentity:(id)a3 data:(id)a4
{
  id v9 = 0;
  id v4 = [a3 authTagForData:a4 type:4 error:&v9];
  id v5 = v9;
  if (v5 && dword_1001414E8 < 91 && (dword_1001414E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSData data];
  }
  id v7 = v6;

  return v7;
}

+ (id)_signatureWithSelfIdentity:(id)a3 data:(id)a4
{
  id v9 = 0;
  id v4 = [a3 signData:a4 error:&v9];
  id v5 = v9;
  if (v5 && dword_1001414E8 <= 90 && (dword_1001414E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSData data];
  }
  id v7 = v6;

  return v7;
}

- (id)description
{
  return [(RPNearFieldAuthenticationPayload *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  pkData = self->_pkData;
  id v18 = [(NSData *)pkData length];
  NSAppendPrintF();
  id v20 = 0;
  id v5 = [(NSUUID *)self->_bonjourListenerUUID UUIDString];
  NSAppendPrintF();
  id v6 = v20;

  authTag = self->_authTag;
  NSAppendPrintF();
  id v7 = v6;

  signatureData = self->_signatureData;
  NSUInteger v9 = [(NSData *)signatureData length];
  id v16 = signatureData;
  NSUInteger v19 = v9;
  NSAppendPrintF();
  id v10 = v7;

  if (qword_100142CC8 != -1) {
    dispatch_once(&qword_100142CC8, &stru_100122BD8);
  }
  timeStamp = self->_timeStamp;
  id v12 = (id)qword_100142CC0;
  double v17 = [v12 stringFromDate:timeStamp v16 v19];
  [(RPNearFieldAuthenticationPayload *)self isValidTimeStamp];
  NSAppendPrintF();
  id v13 = v10;

  return v13;
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_bonjourListenerUUID, 0);

  objc_storeStrong((id *)&self->_pkData, 0);
}

@end
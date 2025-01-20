@interface MSCMSAppleExpirationTimeAttribute
- (MSCMSAppleExpirationTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleExpirationTimeAttribute)initWithExpirationTime:(id)a3;
- (MSOID)attributeType;
- (NSDate)expirationTime;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleExpirationTimeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113635.100.9.3" error:0];
}

- (MSCMSAppleExpirationTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 attributeType];
  char v8 = [v7 isEqualToString:@"1.2.840.113635.100.9.3"];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      id v16 = *a4;
      v17 = @"Not an Expiration Time attribute according to AttributeType";
      uint64_t v15 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_19;
  }
  v9 = [v6 attributeValues];
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      id v16 = *a4;
      v17 = @"Expiration Time Attribute MUST have a single signed attribute value";
      uint64_t v15 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v11 = [v6 attributeValues];
  v12 = [v11 objectAtIndex:0];
  int v13 = nsheim_decode_Time(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      uint64_t v15 = v13;
      id v16 = *a4;
      v17 = @"unable to decode Expiration Time value";
LABEL_10:
      +[MSError MSErrorWithDomain:v14 code:v15 underlyingError:v16 description:v17];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)MSCMSAppleExpirationTimeAttribute;
  v19 = [(MSCMSAppleExpirationTimeAttribute *)&v23 init];
  if (v19)
  {
    if (v24 == 2 || v24 == 1)
    {
      uint64_t v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v25];
      expirationTime = v19->_expirationTime;
      v19->_expirationTime = (NSDate *)v20;
    }
    else if (a4)
    {
      *a4 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-26275 underlyingError:*a4 description:@"invalid Time choice in Expiration Time"];
    }
  }
  free_Time();
  self = v19;
  v18 = self;
LABEL_19:

  return v18;
}

- (MSCMSAppleExpirationTimeAttribute)initWithExpirationTime:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleExpirationTimeAttribute;
  id v6 = [(MSCMSAppleExpirationTimeAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expirationTime, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:-1609459200.0];
  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:1546300800.0];
  if ([(NSDate *)self->_expirationTime compare:v5] == NSOrderedAscending
    || [(NSDate *)self->_expirationTime compare:v6] == NSOrderedDescending)
  {
    __int16 v17 = 3864;
    v7 = [MEMORY[0x263EFF990] dataWithBytes:&v17 length:2];
    char v8 = generalizedTimeStringFromDate(self->_expirationTime);
  }
  else
  {
    __int16 v16 = 3351;
    v7 = [MEMORY[0x263EFF990] dataWithBytes:&v16 length:2];
    char v8 = UTCStringFromDate(self->_expirationTime);
  }
  objc_super v9 = v8;
  uint64_t v10 = [v8 dataUsingEncoding:4];
  [v7 appendData:v10];

  v11 = [MSCMSAttribute alloc];
  v12 = +[MSOID OIDWithString:@"1.2.840.113635.100.9.3" error:a3];
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
  v14 = [(MSCMSAttribute *)v11 initWithAttributeType:v12 values:v13];

  return v14;
}

- (NSDate)expirationTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
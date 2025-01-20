@interface MSCMSSigningTimeAttribute
- (MSCMSSigningTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSSigningTimeAttribute)initWithSigningTime:(id)a3;
- (MSOID)attributeType;
- (NSDate)signingTime;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSSigningTimeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.5" error:0];
}

- (MSCMSSigningTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 attributeType];
  char v8 = [v7 isEqualToString:@"1.2.840.113549.1.9.5"];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      id v16 = *a4;
      v17 = @"Not a Signing Time attribute according to AttributeType";
      uint64_t v15 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v9 = [v6 attributeValues];
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      id v16 = *a4;
      v17 = @"Signing Time Attribute MUST have a single signed attribute value";
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
      v17 = @"unable to decode Signing Time value";
LABEL_10:
      +[MSError MSErrorWithDomain:v14 code:v15 underlyingError:v16 description:v17];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)MSCMSSigningTimeAttribute;
  v20 = [(MSCMSSigningTimeAttribute *)&v23 init];
  if (v20)
  {
    if (v24 == 2 || v24 == 1)
    {
      uint64_t v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v25];
      signingTime = v20->_signingTime;
      v20->_signingTime = (NSDate *)v21;
    }
    else if (a4)
    {
      *a4 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-26275 underlyingError:*a4 description:@"invalid Time choice in Signing Time"];
    }
  }
  free_Time();
  self = v20;
  v18 = self;
LABEL_12:

  return v18;
}

- (MSCMSSigningTimeAttribute)initWithSigningTime:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSSigningTimeAttribute;
  id v6 = [(MSCMSSigningTimeAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signingTime, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:-1609459200.0];
  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:1546300800.0];
  if ([(NSDate *)self->_signingTime compare:v5] == NSOrderedAscending
    || [(NSDate *)self->_signingTime compare:v6] == NSOrderedDescending)
  {
    __int16 v17 = 3864;
    v7 = [MEMORY[0x263EFF990] dataWithBytes:&v17 length:2];
    char v8 = generalizedTimeStringFromDate(self->_signingTime);
  }
  else
  {
    __int16 v16 = 3351;
    v7 = [MEMORY[0x263EFF990] dataWithBytes:&v16 length:2];
    char v8 = UTCStringFromDate(self->_signingTime);
  }
  objc_super v9 = v8;
  uint64_t v10 = [v8 dataUsingEncoding:4];
  [v7 appendData:v10];

  v11 = [MSCMSAttribute alloc];
  v12 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.5" error:a3];
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
  v14 = [(MSCMSAttribute *)v11 initWithAttributeType:v12 values:v13];

  return v14;
}

- (NSDate)signingTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
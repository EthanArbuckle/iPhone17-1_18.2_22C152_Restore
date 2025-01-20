@interface RKResponse
- (NSDictionary)attributes;
- (NSString)category;
- (NSString)string;
- (RKResponse)initWithString:(id)a3 attributes:(id)a4 category:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setCategory:(id)a3;
- (void)setString:(id)a3;
@end

@implementation RKResponse

void __19___RKResponse_type__block_invoke()
{
  v14[11] = *MEMORY[0x263EF8340];
  v13[0] = @"Postpone";
  v12 = [NSNumber numberWithUnsignedInteger:4];
  v14[0] = v12;
  v13[1] = @"YesNo";
  v0 = [NSNumber numberWithUnsignedInteger:1];
  v14[1] = v0;
  v13[2] = @"YesNoRequest";
  v1 = [NSNumber numberWithUnsignedInteger:1];
  v14[2] = v1;
  v13[3] = @"NotSure";
  v2 = [NSNumber numberWithUnsignedInteger:2];
  v14[3] = v2;
  v13[4] = @"GoodBadOk";
  v3 = [NSNumber numberWithUnsignedInteger:1];
  v14[4] = v3;
  v13[5] = @"GoodBadOkState";
  v4 = [NSNumber numberWithUnsignedInteger:1];
  v14[5] = v4;
  v13[6] = @"DontKnow";
  v5 = [NSNumber numberWithUnsignedInteger:2];
  v14[6] = v5;
  v13[7] = @"Acknowledgment";
  v6 = [NSNumber numberWithUnsignedInteger:1];
  v14[7] = v6;
  v13[8] = @"YouAreWelcome";
  v7 = [NSNumber numberWithUnsignedInteger:1];
  v14[8] = v7;
  v13[9] = @"LocationSelf";
  v8 = [NSNumber numberWithUnsignedInteger:1];
  v14[9] = v8;
  v13[10] = @"CloseFar";
  v9 = [NSNumber numberWithUnsignedInteger:1];
  v14[10] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:11];
  v11 = (void *)type_sSpeechActResponseType;
  type_sSpeechActResponseType = v10;
}

- (RKResponse)initWithString:(id)a3 attributes:(id)a4 category:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RKResponse;
  v12 = [(RKResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a3);
    objc_storeStrong((id *)&v13->_attributes, a4);
    objc_storeStrong((id *)&v13->_category, a5);
  }

  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end
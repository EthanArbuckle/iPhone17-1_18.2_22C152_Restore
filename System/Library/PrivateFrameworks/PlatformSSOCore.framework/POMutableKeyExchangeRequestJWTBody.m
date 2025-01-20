@interface POMutableKeyExchangeRequestJWTBody
- (void)addCustomClaims:(id)a3;
- (void)setAud:(id)a3;
- (void)setExp:(id)a3;
- (void)setIat:(id)a3;
- (void)setIss:(id)a3;
- (void)setKey_context:(id)a3;
- (void)setKey_purpose:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOther_publickey:(id)a3;
- (void)setRefresh_token:(id)a3;
- (void)setRequest_nonce:(id)a3;
- (void)setRequest_type:(id)a3;
- (void)setSub:(id)a3;
- (void)setUsername:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation POMutableKeyExchangeRequestJWTBody

- (void)setRequest_type:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"request_type"];
}

- (void)setVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"version"];
}

- (void)setAud:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"aud"];
}

- (void)setIss:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"iss"];
}

- (void)setSub:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"sub"];
}

- (void)setIat:(id)a3
{
  id v4 = NSNumber;
  [a3 timeIntervalSince1970];
  id v7 = [v4 numberWithDouble:floor(v5)];
  v6 = [(_POJWTBodyBase *)self data];
  [v6 setObject:v7 forKeyedSubscript:@"iat"];
}

- (void)setExp:(id)a3
{
  id v4 = NSNumber;
  [a3 timeIntervalSince1970];
  id v7 = [v4 numberWithDouble:floor(v5)];
  v6 = [(_POJWTBodyBase *)self data];
  [v6 setObject:v7 forKeyedSubscript:@"exp"];
}

- (void)setNonce:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"nonce"];
}

- (void)setRequest_nonce:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"request_nonce"];
}

- (void)setRefresh_token:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"refresh_token"];
}

- (void)setOther_publickey:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"other_publickey"];
}

- (void)setKey_context:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"key_context"];
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"username"];
}

- (void)setKey_purpose:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"key_purpose"];
}

- (void)addCustomClaims:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 addEntriesFromDictionary:v4];
}

@end
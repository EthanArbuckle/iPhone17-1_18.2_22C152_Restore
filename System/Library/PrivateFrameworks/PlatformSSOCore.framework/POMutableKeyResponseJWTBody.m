@interface POMutableKeyResponseJWTBody
- (void)addCustomClaims:(id)a3;
- (void)setCertificate:(id)a3;
- (void)setExp:(id)a3;
- (void)setIat:(id)a3;
- (void)setKey_context:(id)a3;
@end

@implementation POMutableKeyResponseJWTBody

- (void)setIat:(id)a3
{
  v4 = NSNumber;
  [a3 timeIntervalSince1970];
  id v7 = [v4 numberWithDouble:floor(v5)];
  v6 = [(_POJWTBodyBase *)self data];
  [v6 setObject:v7 forKeyedSubscript:@"iat"];
}

- (void)setExp:(id)a3
{
  v4 = NSNumber;
  [a3 timeIntervalSince1970];
  id v7 = [v4 numberWithDouble:floor(v5)];
  v6 = [(_POJWTBodyBase *)self data];
  [v6 setObject:v7 forKeyedSubscript:@"exp"];
}

- (void)setCertificate:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"certificate"];
}

- (void)setKey_context:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"key_context"];
}

- (void)addCustomClaims:(id)a3
{
  id v4 = a3;
  id v5 = [(_POJWTBodyBase *)self data];
  [v5 addEntriesFromDictionary:v4];
}

@end
@interface SBKPushValueResponse
+ (id)responseWithResponse:(id)a3 transaction:(id)a4;
- (NSData)conflictItemValuePayload;
- (NSString)conflictItemKey;
- (NSString)conflictItemVersionAnchor;
- (NSString)domainVersion;
- (void)deserializeResponseBodyWithTransaction:(id)a3;
@end

@implementation SBKPushValueResponse

+ (id)responseWithResponse:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  v7 = [a1 responseWithResponse:a3];
  [v7 deserializeResponseBodyWithTransaction:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_conflictItemKey, 0);
  objc_storeStrong((id *)&self->_conflictItemValuePayload, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
}

- (NSString)conflictItemVersionAnchor
{
  return self->_conflictItemVersionAnchor;
}

- (NSString)conflictItemKey
{
  return self->_conflictItemKey;
}

- (NSData)conflictItemValuePayload
{
  return self->_conflictItemValuePayload;
}

- (NSString)domainVersion
{
  return self->_domainVersion;
}

- (void)deserializeResponseBodyWithTransaction:(id)a3
{
  id v14 = a3;
  v5 = [(SBKResponse *)self responseDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"value"];
  conflictItemValuePayload = self->_conflictItemValuePayload;
  self->_conflictItemValuePayload = v6;

  v8 = self->_conflictItemValuePayload;
  if (v8)
  {
    v3 = [v14 requestItemPayloadPair];
    v9 = [v3 kvsKey];
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)&self->_conflictItemKey, v9);
  if (v8)
  {
  }
  v10 = self->_conflictItemValuePayload;
  if (v10)
  {
    v11 = [v5 objectForKeyedSubscript:@"version"];
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_conflictItemVersionAnchor, v11);
  if (v10) {

  }
  v12 = [v5 objectForKeyedSubscript:@"domain-version"];
  domainVersion = self->_domainVersion;
  self->_domainVersion = v12;
}

@end
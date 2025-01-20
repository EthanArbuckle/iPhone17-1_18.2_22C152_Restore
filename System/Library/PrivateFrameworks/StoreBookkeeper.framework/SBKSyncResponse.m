@interface SBKSyncResponse
+ (id)responseWithResponse:(id)a3 transaction:(id)a4;
- (SBKSyncResponseData)syncResponseData;
- (void)deserializeResponseBodyWithTransaction:(id)a3;
@end

@implementation SBKSyncResponse

+ (id)responseWithResponse:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  v7 = [a1 responseWithResponse:a3];
  [v7 deserializeResponseBodyWithTransaction:v6];

  return v7;
}

- (void).cxx_destruct
{
}

- (SBKSyncResponseData)syncResponseData
{
  return self->_syncResponseData;
}

- (void)deserializeResponseBodyWithTransaction:(id)a3
{
  id v4 = a3;
  id v7 = [(SBKResponse *)self responseDictionary];
  v5 = +[SBKSyncResponseData deserializedResponseBodyWithTransaction:v4 responseDictionary:v7 response:self];

  syncResponseData = self->_syncResponseData;
  self->_syncResponseData = v5;
}

@end
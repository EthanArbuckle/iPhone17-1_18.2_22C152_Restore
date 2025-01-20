@interface CKKSCloudKitFetchRequest
- (BOOL)participateInFetch;
- (BOOL)resync;
- (CKServerChangeToken)changeToken;
- (void)setChangeToken:(id)a3;
- (void)setParticipateInFetch:(BOOL)a3;
- (void)setResync:(BOOL)a3;
@end

@implementation CKKSCloudKitFetchRequest

- (void).cxx_destruct
{
}

- (void)setChangeToken:(id)a3
{
}

- (CKServerChangeToken)changeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResync:(BOOL)a3
{
  self->_resync = a3;
}

- (BOOL)resync
{
  return self->_resync;
}

- (void)setParticipateInFetch:(BOOL)a3
{
  self->_participateInFetch = a3;
}

- (BOOL)participateInFetch
{
  return self->_participateInFetch;
}

@end
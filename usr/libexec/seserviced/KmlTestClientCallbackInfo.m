@interface KmlTestClientCallbackInfo
- (KmlTestClientCallbackInfo)init;
- (NSMutableDictionary)results;
- (NSMutableSet)invitationSet;
- (id)ownerCompletionHandler;
- (void)setInvitationSet:(id)a3;
- (void)setOwnerCompletionHandler:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation KmlTestClientCallbackInfo

- (KmlTestClientCallbackInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)KmlTestClientCallbackInfo;
  v2 = [(KmlTestClientCallbackInfo *)&v10 init];
  v3 = v2;
  if (v2)
  {
    id ownerCompletionHandler = v2->_ownerCompletionHandler;
    v2->_id ownerCompletionHandler = 0;

    uint64_t v5 = +[NSMutableSet set];
    invitationSet = v3->_invitationSet;
    v3->_invitationSet = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    results = v3->_results;
    v3->_results = (NSMutableDictionary *)v7;
  }
  return v3;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSMutableSet)invitationSet
{
  return self->_invitationSet;
}

- (void)setInvitationSet:(id)a3
{
}

- (id)ownerCompletionHandler
{
  return self->_ownerCompletionHandler;
}

- (void)setOwnerCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ownerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_invitationSet, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end
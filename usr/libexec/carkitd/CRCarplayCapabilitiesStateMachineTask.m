@interface CRCarplayCapabilitiesStateMachineTask
- (CARSession)session;
- (NSURL)plistURL;
- (id)responseBlock;
- (void)setPlistURL:(id)a3;
- (void)setResponseBlock:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation CRCarplayCapabilitiesStateMachineTask

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (void)setPlistURL:(id)a3
{
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
}

- (CARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_responseBlock, 0);

  objc_storeStrong((id *)&self->_plistURL, 0);
}

@end
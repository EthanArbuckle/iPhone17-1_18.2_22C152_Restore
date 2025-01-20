@interface PDStatefulShareAcceptanceResponse
- (BOOL)shouldWaitForResponse;
- (PKAppletSubcredential)subcredential;
- (PKPassShare)localAcceptedShare;
- (PKSharingMessage)keySignRequestMessage;
- (void)setKeySignRequestMessage:(id)a3;
- (void)setLocalAcceptedShare:(id)a3;
- (void)setShouldWaitForResponse:(BOOL)a3;
- (void)setSubcredential:(id)a3;
@end

@implementation PDStatefulShareAcceptanceResponse

- (PKAppletSubcredential)subcredential
{
  return self->_subcredential;
}

- (void)setSubcredential:(id)a3
{
}

- (PKPassShare)localAcceptedShare
{
  return self->_localAcceptedShare;
}

- (void)setLocalAcceptedShare:(id)a3
{
}

- (PKSharingMessage)keySignRequestMessage
{
  return self->_keySignRequestMessage;
}

- (void)setKeySignRequestMessage:(id)a3
{
}

- (BOOL)shouldWaitForResponse
{
  return self->_shouldWaitForResponse;
}

- (void)setShouldWaitForResponse:(BOOL)a3
{
  self->_shouldWaitForResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySignRequestMessage, 0);
  objc_storeStrong((id *)&self->_localAcceptedShare, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end
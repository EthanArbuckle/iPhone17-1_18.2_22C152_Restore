@interface NRLinkDirectorMessageState
- (id)description;
@end

@implementation NRLinkDirectorMessageState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localReceiveID, 0);

  objc_storeStrong((id *)&self->_sequenceNum, 0);
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"[%@, %@]", self->_sequenceNum, self->_localReceiveID];

  return v2;
}

@end
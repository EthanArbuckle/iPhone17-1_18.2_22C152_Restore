@interface NRLinkDirectorMessage
- (id)description;
- (void)dealloc;
@end

@implementation NRLinkDirectorMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUID, 0);

  objc_storeStrong((id *)&self->_preferredLink, 0);
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t v4 = sub_100024424((uint64_t)self);
  if (self)
  {
    uint64_t messageVersion = self->_messageVersion;
    uint64_t payloadLength = self->_payloadLength;
  }
  else
  {
    uint64_t messageVersion = 0;
    uint64_t payloadLength = 0;
  }
  id v7 = [v3 initWithFormat:@"[%llu, vers %u, len %u]", v4, messageVersion, payloadLength];

  return v7;
}

- (void)dealloc
{
  if (self)
  {
    messageBufferPtr = self->_messageBufferPtr;
    if (messageBufferPtr)
    {
      free(messageBufferPtr);
      self->_messageBufferPtr = 0;
    }
    self->_messageLen = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NRLinkDirectorMessage;
  [(NRLinkDirectorMessage *)&v4 dealloc];
}

@end
@interface SMUFairPlayRemoteServerPlaybackContext
- (NSData)blob;
- (SMUFairPlayRemoteServerPlaybackContext)initWithBlob:(id)a3 identifier:(unsigned int)a4;
- (unsigned)identifier;
@end

@implementation SMUFairPlayRemoteServerPlaybackContext

- (SMUFairPlayRemoteServerPlaybackContext)initWithBlob:(id)a3 identifier:(unsigned int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMUFairPlayRemoteServerPlaybackContext;
  v7 = [(SMUFairPlayRemoteServerPlaybackContext *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    blob = v7->_blob;
    v7->_blob = (NSData *)v8;

    v7->_identifier = a4;
  }

  return v7;
}

- (NSData)blob
{
  return self->_blob;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end
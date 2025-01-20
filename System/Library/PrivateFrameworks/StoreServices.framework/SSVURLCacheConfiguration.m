@interface SSVURLCacheConfiguration
- (BOOL)supportsProcessSharing;
- (NSString)sessionIdentifier;
- (void)setSessionIdentifier:(id)a3;
- (void)setSupportsProcessSharing:(BOOL)a3;
@end

@implementation SSVURLCacheConfiguration

- (void)setSupportsProcessSharing:(BOOL)a3
{
  self->_supportsProcessSharing = a3;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (BOOL)supportsProcessSharing
{
  return self->_supportsProcessSharing;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
}

@end
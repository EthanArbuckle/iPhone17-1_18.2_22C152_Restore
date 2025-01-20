@interface UnifiedAccessReaderEngagement
- (id)cipherSuites;
- (id)description;
- (void)setCipherSuites:(id)a3;
@end

@implementation UnifiedAccessReaderEngagement

- (id)description
{
  return +[NSString stringWithFormat:@"<CipherSuites=%@>", self->_cipherList];
}

- (void)setCipherSuites:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:v4];

  sub_10001CA30((uint64_t)self, v5);

  [(ISOReaderEngagement *)self setCborObj:0];
}

- (id)cipherSuites
{
  if (self) {
    self = (UnifiedAccessReaderEngagement *)self->_cipherList;
  }
  return self;
}

- (void).cxx_destruct
{
}

@end
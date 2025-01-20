@interface STSUnifiedAccessHandler
@end

@implementation STSUnifiedAccessHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcHandoverHandler, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_readerSharedSecret, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end
@interface PDNFSecureXPCEventStreamManager
- (PDNFSecureXPCEventStreamManager)init;
@end

@implementation PDNFSecureXPCEventStreamManager

- (PDNFSecureXPCEventStreamManager)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeyObservers, 0);
  objc_storeStrong((id *)&self->_secureElementObservers, 0);
  objc_storeStrong((id *)&self->_fieldDetectObservers, 0);
  objc_storeStrong((id *)&self->_expressTransactionObservers, 0);
  objc_storeStrong((id *)&self->_contactlessPresentationObservers, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
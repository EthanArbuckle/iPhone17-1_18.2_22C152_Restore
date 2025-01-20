@interface NRDIDSKeyManager
@end

@implementation NRDIDSKeyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyManagerAnalytics, 0);
  objc_storeStrong((id *)&self->_deviceRecords, 0);
  objc_storeStrong((id *)&self->_localIDSClassAIdentity, 0);
  objc_storeStrong((id *)&self->_localIDSClassCIdentity, 0);
  objc_storeStrong((id *)&self->_localIDSClassDIdentity, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
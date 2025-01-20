@interface NRDIDSKMDeviceRecord
@end

@implementation NRDIDSKMDeviceRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingQueries, 0);
  objc_storeStrong((id *)&self->_remoteIDSClassAIdentity, 0);
  objc_storeStrong((id *)&self->_remoteIDSClassCIdentity, 0);

  objc_storeStrong((id *)&self->_remoteIDSClassDIdentity, 0);
}

@end
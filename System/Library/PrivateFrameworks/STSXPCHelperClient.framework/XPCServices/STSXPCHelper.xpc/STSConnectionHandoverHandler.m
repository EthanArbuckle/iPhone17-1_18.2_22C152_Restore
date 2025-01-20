@interface STSConnectionHandoverHandler
@end

@implementation STSConnectionHandoverHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportLayerKey, 0);
  objc_storeStrong((id *)&self->_readerACList, 0);
  objc_storeStrong((id *)&self->_handoverSelectMessage, 0);
  objc_storeStrong((id *)&self->_handoverRequestMessage, 0);
  objc_storeStrong((id *)&self->_deviceEngagement, 0);
  objc_storeStrong((id *)&self->_ephemeralReaderKey, 0);
  objc_storeStrong((id *)&self->_ephemeralDeviceKey, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end
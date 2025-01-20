@interface CXChannelUpdate
- (CXCallUpdate)csd_callUpdate;
@end

@implementation CXChannelUpdate

- (CXCallUpdate)csd_callUpdate
{
  id v3 = objc_alloc_init((Class)CXCallUpdate);
  if ([(CXChannelUpdate *)self hasSet])
  {
    v4 = [(CXChannelUpdate *)self activeRemoteParticipant];
    [v3 setActiveRemoteParticipant:v4];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x40) != 0)
  {
    v5 = [(CXChannelUpdate *)self name];
    [v3 setLocalizedCallerName:v5];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x80) != 0)
  {
    v6 = [(CXChannelUpdate *)self sandboxExtendedImageURL];
    [v3 setLocalizedCallerImageURL:v6];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x100) != 0) {
    objc_msgSend(v3, "setServiceStatus:", -[CXChannelUpdate serviceStatus](self, "serviceStatus"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x200) != 0) {
    objc_msgSend(v3, "setTransmissionMode:", -[CXChannelUpdate transmissionMode](self, "transmissionMode"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x400) != 0) {
    objc_msgSend(v3, "setAccessoryButtonEventsEnabled:", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }

  return (CXCallUpdate *)v3;
}

@end
@interface MRRemoveSyncedOutputDevicesMessage
- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUID:(id)a3;
- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUIDs:(id)a3;
- (NSArray)outputDeviceUIDs;
- (unint64_t)type;
@end

@implementation MRRemoveSyncedOutputDevicesMessage

- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v9 count:1];

    v7 = -[MRRemoveSyncedOutputDevicesMessage initWithOutputDeviceUIDs:](self, "initWithOutputDeviceUIDs:", v6, v9, v10);
    self = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRemoveSyncedOutputDevicesMessage;
  id v5 = [(MRProtocolMessage *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRRemoveOutputDevicesMessageProtobuf);
    v7 = (void *)[v4 mutableCopy];
    [(_MRRemoveOutputDevicesMessageProtobuf *)v6 setOutputDeviceUIDs:v7];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (NSArray)outputDeviceUIDs
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 outputDeviceUIDs];

  return (NSArray *)v3;
}

- (unint64_t)type
{
  return 66;
}

@end
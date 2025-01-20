@interface MBPeerTransferRequest
- (MBPeerTransferRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerTransferRequest)initWithTargetDeviceUDID:(id)a3 freeDiskSpace:(id)a4;
- (NSNumber)freeDiskSpace;
- (NSString)description;
- (NSString)targetDeviceUDID;
- (id)dictionaryRepresentation;
@end

@implementation MBPeerTransferRequest

- (id)dictionaryRepresentation
{
  v7[0] = @"MBDeviceUDID";
  v3 = [(MBPeerTransferRequest *)self targetDeviceUDID];
  v7[1] = @"MBFreeDiskSpace";
  v8[0] = v3;
  v4 = [(MBPeerTransferRequest *)self freeDiskSpace];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (MBPeerTransferRequest)initWithTargetDeviceUDID:(id)a3 freeDiskSpace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBPeerTransferRequest;
  v9 = [(MBPeerTransferRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDeviceUDID, a3);
    objc_storeStrong((id *)&v10->_freeDiskSpace, a4);
  }

  return v10;
}

- (MBPeerTransferRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MBPeerTransferRequest;
  id v7 = [(MBPeerTransferRequest *)&v14 init];
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"MBDeviceUDID"];
  targetDeviceUDID = v7->_targetDeviceUDID;
  v7->_targetDeviceUDID = (NSString *)v8;

  uint64_t v10 = [v6 objectForKeyedSubscript:@"MBFreeDiskSpace"];
  freeDiskSpace = v7->_freeDiskSpace;
  v7->_freeDiskSpace = (NSNumber *)v10;

  if (!v7->_freeDiskSpace) {
    goto LABEL_5;
  }
  if (v7->_targetDeviceUDID)
  {
LABEL_4:
    objc_super v12 = v7;
  }
  else
  {
LABEL_5:
    if (a4)
    {
      +[MBError errorWithCode:11, @"Failed to decode request. Missing property in dictionary %@", v6 format];
      objc_super v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  v5 = [(MBPeerTransferRequest *)self freeDiskSpace];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; freeDiskSpace=%llu>",
    Name,
    self,
  id v6 = [v5 unsignedLongLongValue]);

  return (NSString *)v6;
}

- (NSString)targetDeviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)freeDiskSpace
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeDiskSpace, 0);
  objc_storeStrong((id *)&self->_targetDeviceUDID, 0);
}

@end
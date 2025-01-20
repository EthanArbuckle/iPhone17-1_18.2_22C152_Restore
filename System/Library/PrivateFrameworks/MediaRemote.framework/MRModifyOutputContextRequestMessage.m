@interface MRModifyOutputContextRequestMessage
- (MRGroupTopologyModificationRequest)request;
- (MRModifyOutputContextRequestMessage)initWithRequest:(id)a3;
- (NSArray)addingOutputDeviceUIDs;
- (NSArray)removingOutputDeviceUIDs;
- (NSArray)settingOutputDeviceUIDs;
- (unint64_t)type;
- (unsigned)contextType;
@end

@implementation MRModifyOutputContextRequestMessage

- (MRModifyOutputContextRequestMessage)initWithRequest:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRModifyOutputContextRequestMessage;
  v5 = [(MRProtocolMessage *)&v12 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRAVModifyOutputContextRequestProtobuf);
    [(_MRAVModifyOutputContextRequestProtobuf *)v6 setOutputContextType:1];
    v7 = [v4 protobuf];
    [(_MRAVModifyOutputContextRequestProtobuf *)v6 setRequest:v7];

    switch([v4 type])
    {
      case 0:

        v8 = 0;
        goto LABEL_10;
      case 1:
        v9 = [v4 outputDeviceUIDs];
        v10 = (void *)[v9 mutableCopy];
        [(_MRAVModifyOutputContextRequestProtobuf *)v6 setClusterAwareAddingOutputDeviceUIDs:v10];
        goto LABEL_7;
      case 2:
        v9 = [v4 outputDeviceUIDs];
        v10 = (void *)[v9 mutableCopy];
        [(_MRAVModifyOutputContextRequestProtobuf *)v6 setClusterAwareRemovingOutputDeviceUIDs:v10];
        goto LABEL_7;
      case 3:
        v9 = [v4 outputDeviceUIDs];
        v10 = (void *)[v9 mutableCopy];
        [(_MRAVModifyOutputContextRequestProtobuf *)v6 setClusterAwareSettingOutputDeviceUIDs:v10];
LABEL_7:

        break;
      default:
        break;
    }
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }
  v8 = v5;
LABEL_10:

  return v8;
}

- (unsigned)contextType
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 outputContextType];
  if (v3 - 1 >= 5) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = v3;
  }

  return v4;
}

- (MRGroupTopologyModificationRequest)request
{
  if (!self->_request)
  {
    unsigned int v3 = [(MRProtocolMessage *)self underlyingCodableMessage];
    int v4 = [v3 hasRequest];

    if (v4)
    {
      v5 = [MRGroupTopologyModificationRequest alloc];
      v6 = [(MRProtocolMessage *)self underlyingCodableMessage];
      v7 = [(MRRequestDetails *)v6 request];
      v8 = [(MRGroupTopologyModificationRequest *)v5 initWithProtobuf:v7];
LABEL_12:
      request = self->_request;
      self->_request = v8;

      goto LABEL_13;
    }
    v9 = [MRRequestDetails alloc];
    v10 = [(MRProtocolMessage *)self replyIdentifier];
    v6 = [(MRRequestDetails *)v9 initWithName:@"MRModifyOutputContextRequestMessage" requestID:v10 reason:@"MRModifyOutputContextRequestMessage"];

    v11 = [(MRProtocolMessage *)self underlyingCodableMessage];
    objc_super v12 = [v11 clusterAwareAddingOutputDeviceUIDs];
    uint64_t v13 = [v12 count];

    v14 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v15 = v14;
    if (v13)
    {
      v7 = [v14 clusterAwareAddingOutputDeviceUIDs];
      uint64_t v16 = 1;
    }
    else
    {
      v17 = [v14 clusterAwareRemovingOutputDeviceUIDs];
      uint64_t v18 = [v17 count];

      v19 = [(MRProtocolMessage *)self underlyingCodableMessage];
      v15 = v19;
      if (v18)
      {
        v7 = [v19 clusterAwareRemovingOutputDeviceUIDs];
        uint64_t v16 = 2;
      }
      else
      {
        v20 = [v19 clusterAwareSettingOutputDeviceUIDs];
        uint64_t v16 = [v20 count];

        if (!v16)
        {
          v7 = 0;
          goto LABEL_11;
        }
        v15 = [(MRProtocolMessage *)self underlyingCodableMessage];
        v7 = [v15 clusterAwareSettingOutputDeviceUIDs];
        uint64_t v16 = 3;
      }
    }

LABEL_11:
    v8 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v6 type:v16 outputDeviceUIDs:v7];
    goto LABEL_12;
  }
LABEL_13:
  v22 = self->_request;

  return v22;
}

- (NSArray)addingOutputDeviceUIDs
{
  unsigned int v3 = [(MRModifyOutputContextRequestMessage *)self request];
  if ([v3 type] == 1)
  {
    int v4 = [(MRModifyOutputContextRequestMessage *)self request];
    v5 = [v4 outputDeviceUIDs];
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)removingOutputDeviceUIDs
{
  unsigned int v3 = [(MRModifyOutputContextRequestMessage *)self request];
  if ([v3 type] == 2)
  {
    int v4 = [(MRModifyOutputContextRequestMessage *)self request];
    v5 = [v4 outputDeviceUIDs];
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)settingOutputDeviceUIDs
{
  unsigned int v3 = [(MRModifyOutputContextRequestMessage *)self request];
  if ([v3 type] == 3)
  {
    int v4 = [(MRModifyOutputContextRequestMessage *)self request];
    v5 = [v4 outputDeviceUIDs];
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (unint64_t)type
{
  return 48;
}

- (void).cxx_destruct
{
}

@end
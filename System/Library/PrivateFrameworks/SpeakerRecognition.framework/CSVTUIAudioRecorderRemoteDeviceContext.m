@interface CSVTUIAudioRecorderRemoteDeviceContext
- (CSVTUIAudioRecorderRemoteDeviceContext)initWithRemoteTrainingDeviceType:(unint64_t)a3 remoteTrainingDeviceUUIDList:(id)a4;
- (NSArray)remoteTrainingDeviceUUIDList;
- (unint64_t)remoteTrainingDeviceType;
@end

@implementation CSVTUIAudioRecorderRemoteDeviceContext

- (void).cxx_destruct
{
}

- (NSArray)remoteTrainingDeviceUUIDList
{
  return self->_remoteTrainingDeviceUUIDList;
}

- (unint64_t)remoteTrainingDeviceType
{
  return self->_remoteTrainingDeviceType;
}

- (CSVTUIAudioRecorderRemoteDeviceContext)initWithRemoteTrainingDeviceType:(unint64_t)a3 remoteTrainingDeviceUUIDList:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSVTUIAudioRecorderRemoteDeviceContext;
  v7 = [(CSVTUIAudioRecorderRemoteDeviceContext *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_remoteTrainingDeviceType = a3;
    uint64_t v9 = [v6 copy];
    remoteTrainingDeviceUUIDList = v8->_remoteTrainingDeviceUUIDList;
    v8->_remoteTrainingDeviceUUIDList = (NSArray *)v9;
  }
  return v8;
}

@end
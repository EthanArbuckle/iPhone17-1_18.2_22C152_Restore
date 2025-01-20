@interface NMROriginInfo
- (NMROriginInfo)init;
- (NMROriginInfo)initWithProtobuf:(id)a3;
- (NMROriginInfo)initWithProtobufData:(id)a3;
- (NSData)deviceInfoData;
- (NSString)description;
- (NSString)displayName;
- (id)protobuf;
- (id)protobufData;
- (int)uniqueIdentifier;
- (void)setDeviceInfoData:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setUniqueIdentifier:(int)a3;
@end

@implementation NMROriginInfo

- (NMROriginInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMROriginInfo;
  v2 = [(NMROriginInfo *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_NMROriginProtobuf);
    protobuf = v2->_protobuf;
    v2->_protobuf = v3;
  }
  return v2;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [(_NMROriginProtobuf *)self->_protobuf uniqueIdentifier];
  objc_super v6 = [(_NMROriginProtobuf *)self->_protobuf displayName];
  v7 = +[NSString stringWithFormat:@"<%@:%p identifier: %d, displayName: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NMROriginInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMROriginInfo;
  uint64_t v5 = [(NMROriginInfo *)&v9 init];
  if (v5)
  {
    objc_super v6 = (_NMROriginProtobuf *)[v4 copy];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;
  }
  return v5;
}

- (id)protobuf
{
  id v2 = [(_NMROriginProtobuf *)self->_protobuf copy];

  return v2;
}

- (int)uniqueIdentifier
{
  return [(_NMROriginProtobuf *)self->_protobuf uniqueIdentifier];
}

- (void)setUniqueIdentifier:(int)a3
{
}

- (NSString)displayName
{
  return [(_NMROriginProtobuf *)self->_protobuf displayName];
}

- (void)setDisplayName:(id)a3
{
}

- (NSData)deviceInfoData
{
  return [(_NMROriginProtobuf *)self->_protobuf deviceInfoData];
}

- (void)setDeviceInfoData:(id)a3
{
}

- (NMROriginInfo)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMROriginInfo;
  uint64_t v5 = [(NMROriginInfo *)&v9 init];
  if (v5)
  {
    objc_super v6 = [[_NMROriginProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;
  }
  return v5;
}

- (id)protobufData
{
  return [(_NMROriginProtobuf *)self->_protobuf data];
}

- (void).cxx_destruct
{
}

@end
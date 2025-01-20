@interface MRAVOutputDeviceDescription
- (BOOL)containsUID:(id)a3;
- (BOOL)isClusterLeader;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsEngageOnClusterActivation;
- (MRAVOutputDeviceDescription)initWithAVDescription:(id)a3;
- (MRAVOutputDeviceDescription)initWithDescriptor:(id)a3;
- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5;
- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6;
- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6 modelID:(id)a7;
- (MRAVOutputDeviceDescriptionImpl)impl;
- (NSArray)subComponents;
- (NSString)composedTypeDescription;
- (NSString)modelID;
- (NSString)name;
- (NSString)roomID;
- (NSString)roomName;
- (NSString)uid;
- (_MRAVOutputDeviceDescriptorProtobuf)descriptor;
- (id)description;
- (unint64_t)hash;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (void)setImpl:(id)a3;
- (void)setSubComponents:(id)a3;
@end

@implementation MRAVOutputDeviceDescription

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5
{
  return [(MRAVOutputDeviceDescription *)self initWithDeviceType:*(void *)&a3 deviceSubtype:*(void *)&a4 uid:a5 name:0];
}

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6
{
  return [(MRAVOutputDeviceDescription *)self initWithDeviceType:*(void *)&a3 deviceSubtype:*(void *)&a4 uid:a5 name:a6 modelID:0];
}

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6 modelID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  [(_MRAVOutputDeviceDescriptorProtobuf *)v15 setUniqueIdentifier:v14];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v15 setDeviceType:v10];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v15 setDeviceSubType:v9];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v15 setName:v13];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v15 setModelID:v12];
  v16 = [(MRAVOutputDeviceDescription *)self initWithDescriptor:v15];

  return v16;
}

- (MRAVOutputDeviceDescription)initWithAVDescription:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceDescription;
  v5 = [(MRAVOutputDeviceDescription *)&v11 init];
  if (v5)
  {
    v6 = [[MRAVConcreteOutputDeviceDescriptionImpl alloc] initWithAVDescription:v4];
    impl = v5->_impl;
    v5->_impl = (MRAVOutputDeviceDescriptionImpl *)v6;

    uint64_t v8 = [(MRAVOutputDeviceDescriptionImpl *)v5->_impl subComponents];
    subComponents = v5->_subComponents;
    v5->_subComponents = (NSArray *)v8;
  }
  return v5;
}

- (MRAVOutputDeviceDescription)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceDescription;
  v5 = [(MRAVOutputDeviceDescription *)&v11 init];
  if (v5)
  {
    v6 = [[MRAVDistantOutputDeviceDescriptionImpl alloc] initWithDescriptor:v4];
    impl = v5->_impl;
    v5->_impl = (MRAVOutputDeviceDescriptionImpl *)v6;

    uint64_t v8 = [(MRAVOutputDeviceDescriptionImpl *)v5->_impl subComponents];
    subComponents = v5->_subComponents;
    v5->_subComponents = (NSArray *)v8;
  }
  return v5;
}

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  v3 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  id v4 = [(MRAVOutputDeviceDescription *)self uid];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setUniqueIdentifier:v4];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDeviceSubType:[(MRAVOutputDeviceDescription *)self deviceSubtype]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDeviceType:[(MRAVOutputDeviceDescription *)self deviceType]];
  v5 = [(MRAVOutputDeviceDescription *)self name];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setName:v5];

  v6 = [(MRAVOutputDeviceDescription *)self modelID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setModelID:v6];

  v7 = [(MRAVOutputDeviceDescription *)self roomName];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setRoomName:v7];

  uint64_t v8 = [(MRAVOutputDeviceDescription *)self roomID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setRoomID:v8];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setClusterType:[(MRAVOutputDeviceDescription *)self clusterType]];
  uint64_t v9 = [(MRAVOutputDeviceDescription *)self subComponents];
  uint64_t v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_1);
  objc_super v11 = (void *)[v10 mutableCopy];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setAllClusterMembers:v11];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setEngageOnClusterActivate:[(MRAVOutputDeviceDescription *)self supportsEngageOnClusterActivation]];

  return v3;
}

uint64_t __41__MRAVOutputDeviceDescription_descriptor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRAVOutputDeviceDescription *)self name];
  v6 = [(MRAVOutputDeviceDescription *)self uid];
  v7 = MRAVOutputDeviceTypeCopyDescription([(MRAVOutputDeviceDescription *)self deviceType]);
  uint64_t v8 = MRAVOutputDeviceSubtypeCopyDescription([(MRAVOutputDeviceDescription *)self deviceSubtype]);
  uint64_t v9 = [(MRAVOutputDeviceDescription *)self modelID];
  uint64_t v10 = [(MRAVOutputDeviceDescription *)self roomName];
  objc_super v11 = [(MRAVOutputDeviceDescription *)self roomID];
  unsigned int v12 = [(MRAVOutputDeviceDescription *)self clusterType] - 1;
  if (v12 > 2) {
    id v13 = @"None";
  }
  else {
    id v13 = off_1E57D04A0[v12];
  }
  id v14 = [v3 stringWithFormat:@"<%@:%p %@:%@ %@:%@:%@ room=%@:%@ clusterType=%@>", v4, self, v5, v6, v7, v8, v9, v10, v11, v13];

  return v14;
}

- (NSString)composedTypeDescription
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v4 = MRAVOutputDeviceTypeCopyDescription([(MRAVOutputDeviceDescription *)self deviceType]);
  [v3 addObject:v4];

  if ([(MRAVOutputDeviceDescription *)self deviceType] == 1) {
    [v3 addObject:@"2"];
  }
  v5 = MRAVOutputDeviceSubtypeCopyDescription([(MRAVOutputDeviceDescription *)self deviceSubtype]);
  [v3 addObject:v5];

  v6 = [v3 componentsJoinedByString:@" "];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRAVOutputDeviceDescription *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MRAVOutputDeviceDescription *)self uid];
      v7 = [(MRAVOutputDeviceDescription *)v5 uid];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MRAVOutputDeviceDescription *)self uid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)deviceType
{
  return [(MRAVOutputDeviceDescriptionImpl *)self->_impl deviceType];
}

- (unsigned)deviceSubtype
{
  return [(MRAVOutputDeviceDescriptionImpl *)self->_impl deviceSubtype];
}

- (NSString)uid
{
  return (NSString *)[(MRAVOutputDeviceDescriptionImpl *)self->_impl uid];
}

- (NSString)name
{
  return (NSString *)[(MRAVOutputDeviceDescriptionImpl *)self->_impl name];
}

- (NSString)modelID
{
  return (NSString *)[(MRAVOutputDeviceDescriptionImpl *)self->_impl modelID];
}

- (NSString)roomID
{
  return (NSString *)[(MRAVOutputDeviceDescriptionImpl *)self->_impl roomID];
}

- (NSString)roomName
{
  return (NSString *)[(MRAVOutputDeviceDescriptionImpl *)self->_impl roomName];
}

- (BOOL)isClusterLeader
{
  return [(MRAVOutputDeviceDescriptionImpl *)self->_impl isClusterLeader];
}

- (unsigned)clusterType
{
  return [(MRAVOutputDeviceDescriptionImpl *)self->_impl clusterType];
}

- (BOOL)supportsEngageOnClusterActivation
{
  return [(MRAVOutputDeviceDescriptionImpl *)self->_impl supportsEngageOnClusterActivation];
}

- (NSArray)subComponents
{
  return self->_subComponents;
}

- (BOOL)containsUID:(id)a3
{
  id v4 = a3;
  v5 = [(MRAVOutputDeviceDescription *)self uid];
  if ([v5 isEqualToString:v4])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(MRAVOutputDeviceDescription *)self subComponents];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__MRAVOutputDeviceDescription_containsUID___block_invoke;
    v10[3] = &unk_1E57D0460;
    id v11 = v4;
    char v8 = objc_msgSend(v7, "msv_firstWhere:", v10);
    BOOL v6 = v8 != 0;
  }
  return v6;
}

uint64_t __43__MRAVOutputDeviceDescription_containsUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)setSubComponents:(id)a3
{
}

- (MRAVOutputDeviceDescriptionImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);

  objc_storeStrong((id *)&self->_subComponents, 0);
}

@end
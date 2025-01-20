@interface SVDDeviceUnit
+ (BOOL)supportsSecureCoding;
- (BOOL)isCommunalDevice;
- (BOOL)isEqual:(id)a3;
- (NSString)assistantId;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)identifier;
- (NSString)mediaRouteIdentifier;
- (NSString)name;
- (NSString)roomName;
- (SVDDeviceUnit)initWithCoder:(id)a3;
- (SVDDeviceUnit)initWithDeviceUnit:(id)a3;
- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5;
- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 name:(id)a5 roomName:(id)a6 proximity:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDDeviceUnit

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  unint64_t v6 = [(SVDDeviceUnit *)self hash];
  LOBYTE(v6) = v6 == [v5 hash];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(SVDDeviceUnit *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SVDDeviceUnit *)self assistantId];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SVDDeviceUnit alloc];
  id v5 = [(SVDDeviceUnit *)self identifier];
  unint64_t v6 = [(SVDDeviceUnit *)self assistantId];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__SVDDeviceUnit_copyWithZone___block_invoke;
  v9[3] = &unk_1E65A34B8;
  v9[4] = self;
  v7 = [(SVDDeviceUnit *)v4 initWithIdentifier:v5 assistantId:v6 builder:v9];

  return v7;
}

void __30__SVDDeviceUnit_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 name];
  [v4 setName:v5];

  unint64_t v6 = [*(id *)(a1 + 32) roomName];
  [v4 setRoomName:v6];

  objc_msgSend(v4, "setProximity:", objc_msgSend(*(id *)(a1 + 32), "proximity"));
  v7 = [*(id *)(a1 + 32) mediaRouteIdentifier];
  [v4 setMediaRouteIdentifier:v7];

  objc_msgSend(v4, "setIsCommunalDevice:", objc_msgSend(*(id *)(a1 + 32), "isCommunalDevice"));
  id v8 = [*(id *)(a1 + 32) homeKitAccessoryIdentifier];
  [v4 setHomeKitAccessoryIdentifier:v8];
}

- (SVDDeviceUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDDeviceUnit;
  id v5 = [(SVDDeviceUnit *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backing"];
    backing = v5->_backing;
    v5->_backing = (SVDDeviceUnitSwift *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SVDDeviceUnit *)self identifier];
  id v5 = [(SVDDeviceUnit *)self assistantId];
  uint64_t v6 = [(SVDDeviceUnit *)self name];
  v7 = [(SVDDeviceUnit *)self roomName];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SVDDeviceUnit proximity](self, "proximity"));
  objc_super v9 = [(SVDDeviceUnit *)self mediaRouteIdentifier];
  BOOL v10 = [(SVDDeviceUnit *)self isCommunalDevice];
  v11 = [(SVDDeviceUnit *)self homeKitAccessoryIdentifier];
  v12 = [v3 stringWithFormat:@"identifier:%@, assistantId:%@, name:%@, roomName:%@, proximity:%@, mediaRouteId:%@, isCommunalDevice:%d, homeKitId:%@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)homeKitAccessoryIdentifier
{
  return [(SVDDeviceUnitSwift *)self->_backing homeKitAccessoryIdentifier];
}

- (BOOL)isCommunalDevice
{
  return [(SVDDeviceUnitSwift *)self->_backing isCommunalDevice];
}

- (NSString)mediaRouteIdentifier
{
  return [(SVDDeviceUnitSwift *)self->_backing mediaRouteIdentifier];
}

- (int64_t)proximity
{
  return [(SVDDeviceUnitSwift *)self->_backing proximity];
}

- (NSString)roomName
{
  return [(SVDDeviceUnitSwift *)self->_backing roomName];
}

- (NSString)name
{
  return [(SVDDeviceUnitSwift *)self->_backing name];
}

- (NSString)assistantId
{
  return [(SVDDeviceUnitSwift *)self->_backing assistantId];
}

- (NSString)identifier
{
  return [(SVDDeviceUnitSwift *)self->_backing identifier];
}

- (SVDDeviceUnit)initWithDeviceUnit:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDDeviceUnit;
  uint64_t v6 = [(SVDDeviceUnit *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backing, a3);
  }

  return v7;
}

- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 name:(id)a5 roomName:(id)a6 proximity:(int64_t)a7
{
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__SVDDeviceUnit_initWithIdentifier_assistantId_name_roomName_proximity___block_invoke;
  v18[3] = &unk_1E65A3490;
  id v19 = v12;
  id v20 = v13;
  int64_t v21 = a7;
  id v14 = v13;
  id v15 = v12;
  v16 = [(SVDDeviceUnit *)self initWithIdentifier:a3 assistantId:a4 builder:v18];

  return v16;
}

void __72__SVDDeviceUnit_initWithIdentifier_assistantId_name_roomName_proximity___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setName:v3];
  [v4 setRoomName:a1[5]];
  [v4 setProximity:a1[6]];
}

- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SVDDeviceUnit;
  v11 = [(SVDDeviceUnit *)&v18 init];
  if (v11)
  {
    id v12 = [SVDDeviceUnitSwift alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__SVDDeviceUnit_initWithIdentifier_assistantId_builder___block_invoke;
    v16[3] = &unk_1E65A3468;
    id v17 = v10;
    uint64_t v13 = [(SVDDeviceUnitSwift *)v12 initWithIdentifier:v8 assistantId:v9 builder:v16];
    backing = v11->_backing;
    v11->_backing = (SVDDeviceUnitSwift *)v13;
  }
  return v11;
}

void __56__SVDDeviceUnit_initWithIdentifier_assistantId_builder___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = a2;
    id v8 = objc_alloc_init(_SVDMutableDeviceUnit);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = [(_SVDMutableDeviceUnit *)v8 name];
    [v3 setName:v4];

    id v5 = [(_SVDMutableDeviceUnit *)v8 roomName];
    [v3 setRoomName:v5];

    objc_msgSend(v3, "setProximity:", -[_SVDMutableDeviceUnit proximity](v8, "proximity"));
    uint64_t v6 = [(_SVDMutableDeviceUnit *)v8 mediaRouteIdentifier];
    [v3 setMediaRouteIdentifier:v6];

    objc_msgSend(v3, "setIsCommunalDevice:", -[_SVDMutableDeviceUnit isCommunalDevice](v8, "isCommunalDevice"));
    v7 = [(_SVDMutableDeviceUnit *)v8 homeKitAccessoryIdentifier];
    [v3 setHomeKitAccessoryIdentifier:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
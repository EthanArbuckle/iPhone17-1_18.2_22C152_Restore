@interface NRMutableDeviceProperty
+ (BOOL)supportsSecureCoding;
+ (id)diffFrom:(id)a3 to:(id)a4;
+ (id)enclosedClassTypes;
- (BOOL)isEqual:(id)a3;
- (NRMutableDeviceProperty)init;
- (NRMutableDeviceProperty)initWithCoder:(id)a3;
- (NRMutableDeviceProperty)initWithProtobuf:(id)a3;
- (NRMutableDeviceProperty)initWithValue:(id)a3;
- (NRPBMutableDeviceProperty)protobuf;
- (NSObject)value;
- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProtobuf:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NRMutableDeviceProperty

+ (id)enclosedClassTypes
{
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v14, "setWithObjects:", v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[NRDevicePropertyDiff alloc] initWithValue:v4];

  id v5 = [(NRMutableDeviceProperty *)self applyDiff:v6 upOnly:0 notifyParent:1 unconditional:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRMutableDeviceProperty)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRMutableDeviceProperty;
  return [(NRMutableStateBase *)&v3 init];
}

- (NRMutableDeviceProperty)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRMutableDeviceProperty;
  uint64_t v6 = [(NRMutableStateBase *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

- (NRMutableDeviceProperty)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRMutableDeviceProperty;
  id v5 = [(NRMutableStateBase *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 value];
    uint64_t v7 = +[NRDevicePropertyDiff unpackPropertyValue:v6];
    value = v5->_value;
    v5->_value = v7;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_value name:@"property value" owner:v5];
  }

  return v5;
}

- (NRPBMutableDeviceProperty)protobuf
{
  objc_super v3 = objc_opt_new();
  id v4 = +[NRDevicePropertyDiff packPropertyValue:self->_value];
  [v3 setValue:v4];

  return (NRPBMutableDeviceProperty *)v3;
}

- (NRMutableDeviceProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NRMutableDeviceProperty;
  id v5 = [(NRMutableStateBase *)&v14 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    objc_super v10 = +[NRMutableDeviceProperty enclosedClassTypes];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"value"];
    value = v5->_value;
    v5->_value = v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_value name:@"property value" owner:v5];
LABEL_5:
    objc_super v9 = v5;
    goto LABEL_6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [[NRPBMutableDeviceProperty alloc] initWithData:v6];
  objc_super v9 = [(NRMutableDeviceProperty *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRMutableDeviceProperty *)self protobuf];
  id v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6 || ([v5 isEqual:v6] & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = v6;
    objc_super v9 = [NRDevicePropertyDiff alloc];
    if (v8) {
      uint64_t v10 = v8[4];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v7 = [(NRDevicePropertyDiff *)v9 initWithValue:v10];
  }

  return v7;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1A624A5B0]();
  uint64_t v11 = self;
  v12 = v11;
  uint64_t v13 = v11;
  if (!a6)
  {
    uint64_t v13 = [(NRMutableDeviceProperty *)v11 copyWithZone:0];
  }
  uint64_t v14 = [v9 value];
  value = v12->_value;
  v12->_value = v14;

  v16 = v9;
  if (!a6)
  {
    v16 = [(id)objc_opt_class() diffFrom:v13 to:v12];
  }
  if (v16)
  {
    if (v7) {
      [(NRMutableStateBase *)v12 notifyParentWithDiff:v16];
    }
    [(NRMutableStateBase *)v12 notifyObserversWithDiff:v16];
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  value = self->_value;

  return (id)[v4 initWithValue:value];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [self->_value hash] - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NRMutableDeviceProperty *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  value = self->_value;
  if (v4->_value == value) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSObject isEqual:](value, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (id)description
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = +[NRTextFormattingUtilities dateFormatter:self->_value];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    value = self->_value;
    if (isKindOfClass) {
      [value UUIDString];
    }
    else {
    uint64_t v3 = [value description];
    }
  }

  return v3;
}

- (void)setProtobuf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobuf, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end
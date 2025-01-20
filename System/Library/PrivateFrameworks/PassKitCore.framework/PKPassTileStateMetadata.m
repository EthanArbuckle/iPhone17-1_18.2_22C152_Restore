@interface PKPassTileStateMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_createForType:(int64_t)a3 dictionary:(id)a4;
+ (id)_createWithType:(int64_t)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedMetadata:(id)a3;
- (PKPassTileStateMetadata)init;
- (PKPassTileStateMetadata)initWithCoder:(id)a3;
- (PKPassTileStateMetadataVehicleFunction)metadataTypeVehicleFunction;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassTileStateMetadata

+ (id)_createForType:(int64_t)a3 dictionary:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = +[PKPassTileStateMetadata _createWithType:a3];
    v7 = v6;
    if (v6 && [v6 _setUpWithDictionary:v5]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_createWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2 && a3 != 0)
  {
    if (a3 == 1)
    {
      id v5 = [PKPassTileStateMetadataVehicleFunction alloc];
      id v6 = v5;
      if (v5)
      {
        v9.receiver = v5;
        v9.super_class = (Class)PKPassTileStateMetadata;
        v7 = objc_msgSendSuper2(&v9, sel_init);
        v4 = v7;
        if (v7) {
          v7[1] = 1;
        }
        goto LABEL_13;
      }
    }
    else
    {
      id v6 = 0;
    }
    v4 = 0;
LABEL_13:

    return v4;
  }
  return 0;
}

- (PKPassTileStateMetadata)init
{
  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v12 = 0;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  char v6 = PKPassTileTypeFromString(v5, &v12);

  if (v6)
  {
    if (self)
    {
      int64_t v7 = v12;
      v13.receiver = self;
      v13.super_class = (Class)PKPassTileStateMetadata;
      id v8 = [(PKPassTileStateMetadata *)&v13 init];
      if (v8) {
        v8->_type = v7;
      }
    }
    else
    {
      id v8 = 0;
    }
    self = v8;
    objc_super v9 = self;
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassTileStateMetadataDecoder" code:0 userInfo:0];
    [v4 failWithError:v10];

    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  if (type > 3) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E56EC440[type];
  }
  [a3 encodeObject:v5 forKey:@"type"];
}

- (BOOL)isEqualToUnresolvedMetadata:(id)a3
{
  return *((void *)a3 + 1) == self->_type;
}

- (PKPassTileStateMetadataVehicleFunction)metadataTypeVehicleFunction
{
  if (self->_type != 1) {
    self = 0;
  }
  return (PKPassTileStateMetadataVehicleFunction *)self;
}

- (int64_t)type
{
  return self->_type;
}

@end
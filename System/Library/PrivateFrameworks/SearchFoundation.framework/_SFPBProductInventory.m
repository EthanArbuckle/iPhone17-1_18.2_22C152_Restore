@interface _SFPBProductInventory
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)storeAddress;
- (NSString)storeId;
- (NSString)storeName;
- (_SFPBDate)timestamp;
- (_SFPBProductInventory)initWithDictionary:(id)a3;
- (_SFPBProductInventory)initWithFacade:(id)a3;
- (_SFPBProductInventory)initWithJSON:(id)a3;
- (float)distance;
- (id)dictionaryRepresentation;
- (int)availabilityStatus;
- (int)distanceUnit;
- (int)type;
- (unint64_t)hash;
- (void)setAvailabilityStatus:(int)a3;
- (void)setDistance:(float)a3;
- (void)setDistanceUnit:(int)a3;
- (void)setStoreAddress:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBProductInventory

- (_SFPBProductInventory)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBProductInventory *)self init];
  if (v5)
  {
    if ([v4 hasType]) {
      -[_SFPBProductInventory setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 storeId];

    if (v6)
    {
      v7 = [v4 storeId];
      [(_SFPBProductInventory *)v5 setStoreId:v7];
    }
    if ([v4 hasAvailabilityStatus]) {
      -[_SFPBProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", [v4 availabilityStatus]);
    }
    v8 = [v4 distance];

    if (v8)
    {
      v9 = [v4 distance];
      [v9 floatValue];
      -[_SFPBProductInventory setDistance:](v5, "setDistance:");
    }
    if ([v4 hasDistanceUnit]) {
      -[_SFPBProductInventory setDistanceUnit:](v5, "setDistanceUnit:", [v4 distanceUnit]);
    }
    v10 = [v4 timestamp];

    if (v10)
    {
      v11 = [_SFPBDate alloc];
      v12 = [v4 timestamp];
      v13 = [(_SFPBDate *)v11 initWithNSDate:v12];
      [(_SFPBProductInventory *)v5 setTimestamp:v13];
    }
    v14 = [v4 storeName];

    if (v14)
    {
      v15 = [v4 storeName];
      [(_SFPBProductInventory *)v5 setStoreName:v15];
    }
    v16 = [v4 storeAddress];

    if (v16)
    {
      v17 = [v4 storeAddress];
      [(_SFPBProductInventory *)v5 setStoreAddress:v17];
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAddress, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
}

- (NSString)storeAddress
{
  return self->_storeAddress;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (_SFPBDate)timestamp
{
  return self->_timestamp;
}

- (int)distanceUnit
{
  return self->_distanceUnit;
}

- (float)distance
{
  return self->_distance;
}

- (int)availabilityStatus
{
  return self->_availabilityStatus;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (int)type
{
  return self->_type;
}

- (_SFPBProductInventory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBProductInventory;
  v5 = [(_SFPBProductInventory *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBProductInventory setType:](v5, "setType:", [v6 intValue]);
    }
    v20 = v6;
    v7 = [v4 objectForKeyedSubscript:@"storeId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(_SFPBProductInventory *)v5 setStoreId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"availabilityStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"distance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[_SFPBProductInventory setDistance:](v5, "setDistance:");
    }
    v11 = [v4 objectForKeyedSubscript:@"distanceUnit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBProductInventory setDistanceUnit:](v5, "setDistanceUnit:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBDate alloc] initWithDictionary:v12];
      [(_SFPBProductInventory *)v5 setTimestamp:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"storeName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBProductInventory *)v5 setStoreName:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"storeAddress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBProductInventory *)v5 setStoreAddress:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBProductInventory)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBProductInventory *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBProductInventory *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_availabilityStatus)
  {
    uint64_t v4 = [(_SFPBProductInventory *)self availabilityStatus];
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F070[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"availabilityStatus"];
  }
  if (self->_distance != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBProductInventory *)self distance];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"distance"];
  }
  if (self->_distanceUnit)
  {
    uint64_t v8 = [(_SFPBProductInventory *)self distanceUnit];
    if (v8)
    {
      if (v8 == 1)
      {
        v9 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"0";
    }
    [v3 setObject:v9 forKeyedSubscript:@"distanceUnit"];
  }
  if (self->_storeAddress)
  {
    v10 = [(_SFPBProductInventory *)self storeAddress];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"storeAddress"];
  }
  if (self->_storeId)
  {
    v12 = [(_SFPBProductInventory *)self storeId];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"storeId"];
  }
  if (self->_storeName)
  {
    v14 = [(_SFPBProductInventory *)self storeName];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"storeName"];
  }
  if (self->_timestamp)
  {
    v16 = [(_SFPBProductInventory *)self timestamp];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"timestamp"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"timestamp"];
    }
  }
  if (self->_type)
  {
    uint64_t v19 = [(_SFPBProductInventory *)self type];
    if (v19)
    {
      if (v19 == 1)
      {
        v20 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = @"0";
    }
    [v3 setObject:v20 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  NSUInteger v4 = [(NSString *)self->_storeId hash];
  uint64_t availabilityStatus = self->_availabilityStatus;
  float distance = self->_distance;
  BOOL v7 = distance < 0.0;
  if (distance == 0.0)
  {
    unint64_t v12 = 0;
  }
  else
  {
    double v8 = distance;
    double v9 = -v8;
    if (!v7) {
      double v9 = v8;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v12 += (unint64_t)v11;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  uint64_t v13 = 2654435761 * self->_distanceUnit;
  uint64_t v14 = v4 ^ (2654435761 * type) ^ (2654435761 * availabilityStatus) ^ v12;
  unint64_t v15 = v13 ^ [(_SFPBDate *)self->_timestamp hash];
  NSUInteger v16 = v14 ^ v15 ^ [(NSString *)self->_storeName hash];
  return v16 ^ [(NSString *)self->_storeAddress hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_26;
  }
  v6 = [(_SFPBProductInventory *)self storeId];
  BOOL v7 = [v4 storeId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v8 = [(_SFPBProductInventory *)self storeId];
  if (v8)
  {
    double v9 = (void *)v8;
    long double v10 = [(_SFPBProductInventory *)self storeId];
    double v11 = [v4 storeId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int availabilityStatus = self->_availabilityStatus;
  if (availabilityStatus != [v4 availabilityStatus]) {
    goto LABEL_26;
  }
  float distance = self->_distance;
  [v4 distance];
  if (distance != v15) {
    goto LABEL_26;
  }
  int distanceUnit = self->_distanceUnit;
  if (distanceUnit != [v4 distanceUnit]) {
    goto LABEL_26;
  }
  v6 = [(_SFPBProductInventory *)self timestamp];
  BOOL v7 = [v4 timestamp];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v17 = [(_SFPBProductInventory *)self timestamp];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_SFPBProductInventory *)self timestamp];
    v20 = [v4 timestamp];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v6 = [(_SFPBProductInventory *)self storeName];
  BOOL v7 = [v4 storeName];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v22 = [(_SFPBProductInventory *)self storeName];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBProductInventory *)self storeName];
    v25 = [v4 storeName];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v6 = [(_SFPBProductInventory *)self storeAddress];
  BOOL v7 = [v4 storeAddress];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v27 = [(_SFPBProductInventory *)self storeAddress];
    if (!v27)
    {

LABEL_29:
      BOOL v32 = 1;
      goto LABEL_27;
    }
    v28 = (void *)v27;
    v29 = [(_SFPBProductInventory *)self storeAddress];
    v30 = [v4 storeAddress];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v32 = 0;
LABEL_27:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_SFPBProductInventory *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBProductInventory *)self storeId];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBProductInventory *)self availabilityStatus]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBProductInventory *)self distance];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBProductInventory *)self distanceUnit]) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(_SFPBProductInventory *)self timestamp];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  BOOL v7 = [(_SFPBProductInventory *)self storeName];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBProductInventory *)self storeAddress];
  if (v8) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBProductInventoryReadFrom(self, (uint64_t)a3, v3);
}

- (void)setStoreAddress:(id)a3
{
  self->_storeAddress = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setStoreName:(id)a3
{
  self->_storeName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTimestamp:(id)a3
{
}

- (void)setDistanceUnit:(int)a3
{
  self->_int distanceUnit = a3;
}

- (void)setDistance:(float)a3
{
  self->_float distance = a3;
}

- (void)setAvailabilityStatus:(int)a3
{
  self->_int availabilityStatus = a3;
}

- (void)setStoreId:(id)a3
{
  self->_storeId = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

@end
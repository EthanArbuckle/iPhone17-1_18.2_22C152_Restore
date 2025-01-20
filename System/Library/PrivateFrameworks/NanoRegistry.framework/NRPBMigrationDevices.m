@interface NRPBMigrationDevices
+ (Class)devicesType;
- (BOOL)hasPhoneUDIDHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)phoneUDIDHash;
- (NSMutableArray)devices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)devicesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)devicesCount;
- (unint64_t)hash;
- (void)addDevices:(id)a3;
- (void)clearDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDevices:(id)a3;
- (void)setPhoneUDIDHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBMigrationDevices

- (void)clearDevices
{
}

- (void)addDevices:(id)a3
{
  id v4 = a3;
  devices = self->_devices;
  id v8 = v4;
  if (!devices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_devices;
    self->_devices = v6;

    id v4 = v8;
    devices = self->_devices;
  }
  [(NSMutableArray *)devices addObject:v4];
}

- (unint64_t)devicesCount
{
  return [(NSMutableArray *)self->_devices count];
}

- (id)devicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_devices objectAtIndex:a3];
}

+ (Class)devicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPhoneUDIDHash
{
  return self->_phoneUDIDHash != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBMigrationDevices;
  id v4 = [(NRPBMigrationDevices *)&v8 description];
  v5 = [(NRPBMigrationDevices *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_devices count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_devices, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_devices;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"devices"];
  }
  phoneUDIDHash = self->_phoneUDIDHash;
  if (phoneUDIDHash) {
    [v3 setObject:phoneUDIDHash forKey:@"phoneUDIDHash"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBMigrationDevicesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_devices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_phoneUDIDHash) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NRPBMigrationDevices *)self devicesCount])
  {
    [v8 clearDevices];
    unint64_t v4 = [(NRPBMigrationDevices *)self devicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NRPBMigrationDevices *)self devicesAtIndex:i];
        [v8 addDevices:v7];
      }
    }
  }
  if (self->_phoneUDIDHash) {
    objc_msgSend(v8, "setPhoneUDIDHash:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_devices;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addDevices:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_phoneUDIDHash copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((devices = self->_devices, !((unint64_t)devices | v4[1]))
     || -[NSMutableArray isEqual:](devices, "isEqual:")))
  {
    phoneUDIDHash = self->_phoneUDIDHash;
    if ((unint64_t)phoneUDIDHash | v4[2]) {
      char v7 = -[NSData isEqual:](phoneUDIDHash, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_devices hash];
  return [(NSData *)self->_phoneUDIDHash hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NRPBMigrationDevices addDevices:](self, "addDevices:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[NRPBMigrationDevices setPhoneUDIDHash:](self, "setPhoneUDIDHash:");
  }
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSData)phoneUDIDHash
{
  return self->_phoneUDIDHash;
}

- (void)setPhoneUDIDHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneUDIDHash, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end
@interface NRPBMigrationDeviceInfo
- (BOOL)hasAdvertisedName;
- (BOOL)hasID;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iD;
- (NSString)advertisedName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdvertisedName:(id)a3;
- (void)setID:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBMigrationDeviceInfo

- (BOOL)hasID
{
  return self->_iD != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasAdvertisedName
{
  return self->_advertisedName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBMigrationDeviceInfo;
  v4 = [(NRPBMigrationDeviceInfo *)&v8 description];
  v5 = [(NRPBMigrationDeviceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  iD = self->_iD;
  if (iD) {
    [v3 setObject:iD forKey:@"ID"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  advertisedName = self->_advertisedName;
  if (advertisedName) {
    [v4 setObject:advertisedName forKey:@"advertisedName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBMigrationDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iD)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_advertisedName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iD)
  {
    objc_msgSend(v4, "setID:");
    id v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
  if (self->_advertisedName)
  {
    objc_msgSend(v5, "setAdvertisedName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_iD copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_advertisedName copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((iD = self->_iD, !((unint64_t)iD | v4[2])) || -[NSData isEqual:](iD, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[3])) || -[NSString isEqual:](name, "isEqual:")))
  {
    advertisedName = self->_advertisedName;
    if ((unint64_t)advertisedName | v4[1]) {
      char v8 = -[NSString isEqual:](advertisedName, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_iD hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ [(NSString *)self->_advertisedName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[NRPBMigrationDeviceInfo setID:](self, "setID:");
  }
  if (v4[3]) {
    -[NRPBMigrationDeviceInfo setName:](self, "setName:");
  }
  if (v4[1]) {
    -[NRPBMigrationDeviceInfo setAdvertisedName:](self, "setAdvertisedName:");
  }
}

- (NSData)iD
{
  return self->_iD;
}

- (void)setID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)advertisedName
{
  return self->_advertisedName;
}

- (void)setAdvertisedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iD, 0);

  objc_storeStrong((id *)&self->_advertisedName, 0);
}

@end
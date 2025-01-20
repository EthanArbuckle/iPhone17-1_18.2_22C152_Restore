@interface _NMROriginProtobuf
- (BOOL)hasDeviceInfoData;
- (BOOL)hasDisplayName;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)deviceInfoData;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)uniqueIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfoData:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasUniqueIdentifier:(BOOL)a3;
- (void)setUniqueIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMROriginProtobuf

- (void)setUniqueIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUniqueIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasDeviceInfoData
{
  return self->_deviceInfoData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMROriginProtobuf;
  v3 = [(_NMROriginProtobuf *)&v7 description];
  v4 = [(_NMROriginProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithInt:self->_uniqueIdentifier];
    [v3 setObject:v4 forKey:@"uniqueIdentifier"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  deviceInfoData = self->_deviceInfoData;
  if (deviceInfoData) {
    [v3 setObject:deviceInfoData forKey:@"deviceInfoData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100013DD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_uniqueIdentifier;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_displayName)
  {
    [v4 setDisplayName:];
    id v4 = v5;
  }
  if (self->_deviceInfoData)
  {
    [v5 setDeviceInfoData:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_uniqueIdentifier;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v7 = [(NSString *)self->_displayName copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSData *)self->_deviceInfoData copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_uniqueIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2)
    && !-[NSString isEqual:](displayName, "isEqual:"))
  {
    goto LABEL_11;
  }
  deviceInfoData = self->_deviceInfoData;
  if ((unint64_t)deviceInfoData | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSData isEqual:](deviceInfoData, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_uniqueIdentifier;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_displayName hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_deviceInfoData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[7])
  {
    self->_uniqueIdentifier = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[_NMROriginProtobuf setDisplayName:](self, "setDisplayName:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[_NMROriginProtobuf setDeviceInfoData:](self, "setDeviceInfoData:");
    unint64_t v4 = v5;
  }
}

- (int)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSData)deviceInfoData
{
  return self->_deviceInfoData;
}

- (void)setDeviceInfoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_deviceInfoData, 0);
}

@end
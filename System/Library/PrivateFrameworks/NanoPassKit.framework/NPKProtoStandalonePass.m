@interface NPKProtoStandalonePass
+ (Class)userInfosType;
- (BOOL)hasDeviceName;
- (BOOL)hasImageData;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasLocalizedName;
- (BOOL)hasOrganizationName;
- (BOOL)hasPassType;
- (BOOL)hasPassTypeIdentifier;
- (BOOL)hasRemotePass;
- (BOOL)hasSerialNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remotePass;
- (NSData)imageData;
- (NSMutableArray)userInfos;
- (NSString)deviceName;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSString)organizationName;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)passTypeAsString:(int)a3;
- (id)userInfosAtIndex:(unint64_t)a3;
- (int)StringAsPassType:(id)a3;
- (int)passType;
- (unint64_t)hash;
- (unint64_t)userInfosCount;
- (void)addUserInfos:(id)a3;
- (void)clearUserInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasPassType:(BOOL)a3;
- (void)setHasRemotePass:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassType:(int)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setRemotePass:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUserInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePass

- (int)passType
{
  if (*(unsigned char *)&self->_has) {
    return self->_passType;
  }
  else {
    return 100;
  }
}

- (void)setPassType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passType = a3;
}

- (void)setHasPassType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)passTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 100)
    {
      v4 = @"Barcode";
    }
    else if (a3 == 110)
    {
      v4 = @"Payment";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Any";
  }
  return v4;
}

- (int)StringAsPassType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Barcode"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Payment"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Any"])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)clearUserInfos
{
}

- (void)addUserInfos:(id)a3
{
  id v4 = a3;
  userInfos = self->_userInfos;
  id v8 = v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    id v4 = v8;
    userInfos = self->_userInfos;
  }
  [(NSMutableArray *)userInfos addObject:v4];
}

- (unint64_t)userInfosCount
{
  return [(NSMutableArray *)self->_userInfos count];
}

- (id)userInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userInfos objectAtIndex:a3];
}

+ (Class)userInfosType
{
  return (Class)objc_opt_class();
}

- (void)setRemotePass:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_remotePass = a3;
}

- (void)setHasRemotePass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRemotePass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePass;
  id v4 = [(NPKProtoStandalonePass *)&v8 description];
  v5 = [(NPKProtoStandalonePass *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int passType = self->_passType;
    if (passType)
    {
      if (passType == 100)
      {
        v5 = @"Barcode";
      }
      else if (passType == 110)
      {
        v5 = @"Payment";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_passType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"Any";
    }
    [v3 setObject:v5 forKey:@"passType"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serialNumber"];
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v3 setObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    [v3 setObject:localizedName forKey:@"localizedName"];
  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v3 setObject:localizedDescription forKey:@"localizedDescription"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v3 setObject:organizationName forKey:@"organizationName"];
  }
  if ([(NSMutableArray *)self->_userInfos count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_userInfos, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = self->_userInfos;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"userInfos"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_remotePass];
    [v3 setObject:v19 forKey:@"remotePass"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePassReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  if (self->_serialNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_passTypeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_userInfos;
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_passType;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  long long v10 = v4;
  if (self->_imageData) {
    objc_msgSend(v4, "setImageData:");
  }
  if (self->_serialNumber) {
    objc_msgSend(v10, "setSerialNumber:");
  }
  if (self->_passTypeIdentifier) {
    objc_msgSend(v10, "setPassTypeIdentifier:");
  }
  if (self->_localizedName) {
    objc_msgSend(v10, "setLocalizedName:");
  }
  if (self->_localizedDescription) {
    objc_msgSend(v10, "setLocalizedDescription:");
  }
  if (self->_organizationName) {
    objc_msgSend(v10, "setOrganizationName:");
  }
  if ([(NPKProtoStandalonePass *)self userInfosCount])
  {
    [v10 clearUserInfos];
    unint64_t v5 = [(NPKProtoStandalonePass *)self userInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoStandalonePass *)self userInfosAtIndex:i];
        [v10 addUserInfos:v8];
      }
    }
  }
  uint64_t v9 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[80] = self->_remotePass;
    v10[84] |= 2u;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v10, "setDeviceName:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_passType;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_imageData copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_serialNumber copyWithZone:a3];
  long long v10 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  long long v12 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v11;

  uint64_t v13 = [(NSString *)self->_localizedName copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v13;

  uint64_t v15 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  uint64_t v17 = [(NSString *)self->_organizationName copyWithZone:a3];
  v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = self->_userInfos;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v23), "copyWithZone:", a3, (void)v28);
        [(id)v6 addUserInfos:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_remotePass;
    *(unsigned char *)(v6 + 84) |= 2u;
  }
  uint64_t v25 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3, (void)v28);
  v26 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_passType != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_25;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 2) && !-[NSData isEqual:](imageData, "isEqual:")) {
    goto LABEL_25;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_25;
    }
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:")) {
      goto LABEL_25;
    }
  }
  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](localizedName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:")) {
      goto LABEL_25;
    }
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  userInfos = self->_userInfos;
  if ((unint64_t)userInfos | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](userInfos, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0) {
      goto LABEL_31;
    }
LABEL_25:
    char v12 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 84) & 2) == 0) {
    goto LABEL_25;
  }
  if (!self->_remotePass)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  if (!*((unsigned char *)v4 + 80)) {
    goto LABEL_25;
  }
LABEL_31:
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 1)) {
    char v12 = -[NSString isEqual:](deviceName, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_passType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_imageData hash];
  NSUInteger v5 = [(NSString *)self->_serialNumber hash];
  NSUInteger v6 = [(NSString *)self->_passTypeIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_localizedName hash];
  NSUInteger v8 = [(NSString *)self->_localizedDescription hash];
  NSUInteger v9 = [(NSString *)self->_organizationName hash];
  uint64_t v10 = [(NSMutableArray *)self->_userInfos hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_remotePass;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_deviceName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[21])
  {
    self->_int passType = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NPKProtoStandalonePass setImageData:](self, "setImageData:");
  }
  if (*((void *)v5 + 8)) {
    -[NPKProtoStandalonePass setSerialNumber:](self, "setSerialNumber:");
  }
  if (*((void *)v5 + 7)) {
    -[NPKProtoStandalonePass setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  }
  if (*((void *)v5 + 4)) {
    -[NPKProtoStandalonePass setLocalizedName:](self, "setLocalizedName:");
  }
  if (*((void *)v5 + 3)) {
    -[NPKProtoStandalonePass setLocalizedDescription:](self, "setLocalizedDescription:");
  }
  if (*((void *)v5 + 5)) {
    -[NPKProtoStandalonePass setOrganizationName:](self, "setOrganizationName:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 9);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NPKProtoStandalonePass addUserInfos:](self, "addUserInfos:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v5 + 84) & 2) != 0)
  {
    self->_remotePass = *((unsigned char *)v5 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 1)) {
    -[NPKProtoStandalonePass setDeviceName:](self, "setDeviceName:");
  }
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
}

- (BOOL)remotePass
{
  return self->_remotePass;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
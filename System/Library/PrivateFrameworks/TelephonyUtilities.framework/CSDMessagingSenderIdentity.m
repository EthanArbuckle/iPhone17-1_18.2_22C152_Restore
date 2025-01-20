@interface CSDMessagingSenderIdentity
- (BOOL)hasAccountUUIDString;
- (BOOL)hasHandle;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasLocalizedName;
- (BOOL)hasLocalizedServiceName;
- (BOOL)hasLocalizedShortName;
- (BOOL)hasProtoUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (CSDMessagingSenderIdentity)initWithTUSenderIdentity:(id)a3;
- (NSString)accountUUIDString;
- (NSString)isoCountryCode;
- (NSString)localizedName;
- (NSString)localizedServiceName;
- (NSString)localizedShortName;
- (NSString)protoUUID;
- (NSUUID)UUID;
- (NSUUID)accountUUID;
- (TUSenderIdentity)tuSenderIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountUUID:(id)a3;
- (void)setAccountUUIDString:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedServiceName:(id)a3;
- (void)setLocalizedShortName:(id)a3;
- (void)setProtoUUID:(id)a3;
- (void)setUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingSenderIdentity

- (CSDMessagingSenderIdentity)initWithTUSenderIdentity:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMessagingSenderIdentity *)self init];
  if (v5)
  {
    v6 = [v4 UUID];
    [(CSDMessagingSenderIdentity *)v5 setUUID:v6];

    v7 = [v4 accountUUID];
    [(CSDMessagingSenderIdentity *)v5 setAccountUUID:v7];

    v8 = [v4 handle];
    v9 = +[CSDMessagingHandle handleWithTUHandle:v8];
    [(CSDMessagingSenderIdentity *)v5 setHandle:v9];

    v10 = [v4 ISOCountryCode];
    [(CSDMessagingSenderIdentity *)v5 setIsoCountryCode:v10];

    v11 = [v4 localizedName];
    [(CSDMessagingSenderIdentity *)v5 setLocalizedName:v11];

    v12 = [v4 localizedShortName];
    [(CSDMessagingSenderIdentity *)v5 setLocalizedShortName:v12];

    v13 = [v4 localizedServiceName];
    [(CSDMessagingSenderIdentity *)v5 setLocalizedServiceName:v13];
  }
  return v5;
}

- (NSUUID)UUID
{
  v3 = [(CSDMessagingSenderIdentity *)self protoUUID];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CSDMessagingSenderIdentity *)self protoUUID];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CSDMessagingSenderIdentity *)self setProtoUUID:v4];
}

- (NSUUID)accountUUID
{
  v3 = [(CSDMessagingSenderIdentity *)self accountUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CSDMessagingSenderIdentity *)self accountUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setAccountUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CSDMessagingSenderIdentity *)self setAccountUUIDString:v4];
}

- (TUSenderIdentity)tuSenderIdentity
{
  v3 = [(CSDMessagingSenderIdentity *)self UUID];
  id v4 = [(CSDMessagingSenderIdentity *)self accountUUID];
  uint64_t v5 = [(CSDMessagingSenderIdentity *)self isoCountryCode];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_100517F40;
  }
  v8 = v7;

  v9 = [(CSDMessagingSenderIdentity *)self localizedName];
  uint64_t v10 = [(CSDMessagingSenderIdentity *)self localizedShortName];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = &stru_100517F40;
  }
  v13 = v12;

  uint64_t v14 = [(CSDMessagingSenderIdentity *)self localizedServiceName];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_100517F40;
  }
  v17 = v16;

  v18 = [(CSDMessagingSenderIdentity *)self handle];
  v19 = [v18 tuHandle];

  id v20 = 0;
  if (v3 && v4 && v9) {
    id v20 = [objc_alloc((Class)TUSenderIdentity) initWithUUID:v3 accountUUID:v4 ISOCountryCode:v8 localizedName:v9 localizedShortName:v13 localizedServiceName:v17 handle:v19];
  }

  return (TUSenderIdentity *)v20;
}

- (BOOL)hasProtoUUID
{
  return self->_protoUUID != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (BOOL)hasLocalizedShortName
{
  return self->_localizedShortName != 0;
}

- (BOOL)hasAccountUUIDString
{
  return self->_accountUUIDString != 0;
}

- (BOOL)hasLocalizedServiceName
{
  return self->_localizedServiceName != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingSenderIdentity;
  v3 = [(CSDMessagingSenderIdentity *)&v7 description];
  id v4 = [(CSDMessagingSenderIdentity *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  protoUUID = self->_protoUUID;
  if (protoUUID) {
    [v3 setObject:protoUUID forKey:@"protoUUID"];
  }
  handle = self->_handle;
  if (handle)
  {
    objc_super v7 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"handle"];
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    [v4 setObject:localizedName forKey:@"localizedName"];
  }
  localizedShortName = self->_localizedShortName;
  if (localizedShortName) {
    [v4 setObject:localizedShortName forKey:@"localizedShortName"];
  }
  accountUUIDString = self->_accountUUIDString;
  if (accountUUIDString) {
    [v4 setObject:accountUUIDString forKey:@"accountUUIDString"];
  }
  localizedServiceName = self->_localizedServiceName;
  if (localizedServiceName) {
    [v4 setObject:localizedServiceName forKey:@"localizedServiceName"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v4 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001BC168((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_protoUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_localizedName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_localizedShortName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_accountUUIDString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_localizedServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_protoUUID)
  {
    objc_msgSend(v4, "setProtoUUID:");
    id v4 = v5;
  }
  if (self->_handle)
  {
    objc_msgSend(v5, "setHandle:");
    id v4 = v5;
  }
  if (self->_localizedName)
  {
    objc_msgSend(v5, "setLocalizedName:");
    id v4 = v5;
  }
  if (self->_localizedShortName)
  {
    objc_msgSend(v5, "setLocalizedShortName:");
    id v4 = v5;
  }
  if (self->_accountUUIDString)
  {
    objc_msgSend(v5, "setAccountUUIDString:");
    id v4 = v5;
  }
  if (self->_localizedServiceName)
  {
    objc_msgSend(v5, "setLocalizedServiceName:");
    id v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_protoUUID copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_localizedName copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NSString *)self->_localizedShortName copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(NSString *)self->_accountUUIDString copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  id v16 = [(NSString *)self->_localizedServiceName copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  id v18 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((protoUUID = self->_protoUUID, !((unint64_t)protoUUID | v4[7]))
     || -[NSString isEqual:](protoUUID, "isEqual:"))
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:"))
    && ((localizedName = self->_localizedName, !((unint64_t)localizedName | v4[4]))
     || -[NSString isEqual:](localizedName, "isEqual:"))
    && ((localizedShortName = self->_localizedShortName, !((unint64_t)localizedShortName | v4[6]))
     || -[NSString isEqual:](localizedShortName, "isEqual:"))
    && ((accountUUIDString = self->_accountUUIDString, !((unint64_t)accountUUIDString | v4[1]))
     || -[NSString isEqual:](accountUUIDString, "isEqual:"))
    && ((localizedServiceName = self->_localizedServiceName, !((unint64_t)localizedServiceName | v4[5]))
     || -[NSString isEqual:](localizedServiceName, "isEqual:")))
  {
    isoCountryCode = self->_isoCountryCode;
    if ((unint64_t)isoCountryCode | v4[3]) {
      unsigned __int8 v12 = -[NSString isEqual:](isoCountryCode, "isEqual:");
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_protoUUID hash];
  unint64_t v4 = [(CSDMessagingHandle *)self->_handle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_localizedName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_localizedShortName hash];
  NSUInteger v7 = [(NSString *)self->_accountUUIDString hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_localizedServiceName hash];
  return v6 ^ v8 ^ [(NSString *)self->_isoCountryCode hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v6 = a3;
  if (v6[7]) {
    -[CSDMessagingSenderIdentity setProtoUUID:](self, "setProtoUUID:");
  }
  handle = self->_handle;
  uint64_t v5 = v6[2];
  if (handle)
  {
    if (v5) {
      -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[CSDMessagingSenderIdentity setHandle:](self, "setHandle:");
  }
  if (v6[4]) {
    -[CSDMessagingSenderIdentity setLocalizedName:](self, "setLocalizedName:");
  }
  if (v6[6]) {
    -[CSDMessagingSenderIdentity setLocalizedShortName:](self, "setLocalizedShortName:");
  }
  if (v6[1]) {
    -[CSDMessagingSenderIdentity setAccountUUIDString:](self, "setAccountUUIDString:");
  }
  if (v6[5]) {
    -[CSDMessagingSenderIdentity setLocalizedServiceName:](self, "setLocalizedServiceName:");
  }
  if (v6[3]) {
    -[CSDMessagingSenderIdentity setIsoCountryCode:](self, "setIsoCountryCode:");
  }
}

- (NSString)protoUUID
{
  return self->_protoUUID;
}

- (void)setProtoUUID:(id)a3
{
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (void)setLocalizedShortName:(id)a3
{
}

- (NSString)accountUUIDString
{
  return self->_accountUUIDString;
}

- (void)setAccountUUIDString:(id)a3
{
}

- (NSString)localizedServiceName
{
  return self->_localizedServiceName;
}

- (void)setLocalizedServiceName:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoUUID, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedServiceName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_accountUUIDString, 0);
}

@end
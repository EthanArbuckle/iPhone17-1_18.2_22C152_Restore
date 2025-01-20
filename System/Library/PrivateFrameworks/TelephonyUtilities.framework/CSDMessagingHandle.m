@interface CSDMessagingHandle
+ (CSDMessagingHandle)handleWithTUHandle:(id)a3;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasSiriDisplayName;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)isoCountryCode;
- (NSString)siriDisplayName;
- (NSString)value;
- (TUHandle)tuHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setSiriDisplayName:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingHandle

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1005059F0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasSiriDisplayName
{
  return self->_siriDisplayName != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingHandle;
  id v3 = [(CSDMessagingHandle *)&v7 description];
  int v4 = [(CSDMessagingHandle *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = off_1005059F0[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v3 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  siriDisplayName = self->_siriDisplayName;
  if (siriDisplayName) {
    [v3 setObject:siriDisplayName forKey:@"siriDisplayName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000560AC((uint64_t)self, (uint64_t)a3);
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
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_siriDisplayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    id v4 = v5;
  }
  if (self->_siriDisplayName)
  {
    objc_msgSend(v5, "setSiriDisplayName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(NSString *)self->_value copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(NSString *)self->_siriDisplayName copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 4) && !-[NSString isEqual:](value, "isEqual:")) {
    goto LABEL_13;
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:")) {
      goto LABEL_13;
    }
  }
  siriDisplayName = self->_siriDisplayName;
  if ((unint64_t)siriDisplayName | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSString isEqual:](siriDisplayName, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_value hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_isoCountryCode hash];
  return v4 ^ v5 ^ [(NSString *)self->_siriDisplayName hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[10])
  {
    self->_uint64_t type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[CSDMessagingHandle setValue:](self, "setValue:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[CSDMessagingHandle setIsoCountryCode:](self, "setIsoCountryCode:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingHandle setSiriDisplayName:](self, "setSiriDisplayName:");
    unint64_t v4 = v5;
  }
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_siriDisplayName, 0);

  objc_storeStrong((id *)&self->_isoCountryCode, 0);
}

+ (CSDMessagingHandle)handleWithTUHandle:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = objc_alloc_init(CSDMessagingHandle);
    NSUInteger v5 = [v3 isoCountryCode];
    [(CSDMessagingHandle *)v4 setIsoCountryCode:v5];

    v6 = [v3 value];
    [(CSDMessagingHandle *)v4 setValue:v6];

    id v7 = [v3 siriDisplayName];
    [(CSDMessagingHandle *)v4 setSiriDisplayName:v7];

    unsigned __int8 v8 = (char *)[v3 type];
    if ((unint64_t)(v8 - 1) <= 2) {
      [(CSDMessagingHandle *)v4 setType:v8];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (TUHandle)tuHandle
{
  id v3 = [(CSDMessagingHandle *)self value];
  if ([v3 length])
  {
    switch([(CSDMessagingHandle *)self type])
    {
      case 0:
        if (![v3 destinationIdIsEmailAddress]) {
          goto LABEL_7;
        }
        goto LABEL_9;
      case 1:
LABEL_7:
        uint64_t v5 = +[TUHandle normalizedGenericHandleForValue:v3];
        goto LABEL_10;
      case 2:
        v6 = [(CSDMessagingHandle *)self isoCountryCode];
        unint64_t v4 = +[TUHandle normalizedPhoneNumberHandleForValue:v3 isoCountryCode:v6];

        break;
      case 3:
LABEL_9:
        uint64_t v5 = +[TUHandle normalizedEmailAddressHandleForValue:v3];
LABEL_10:
        unint64_t v4 = (void *)v5;
        break;
      default:
        unint64_t v4 = 0;
        break;
    }
    id v7 = [(CSDMessagingHandle *)self siriDisplayName];
    [v4 setSiriDisplayName:v7];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (TUHandle *)v4;
}

@end
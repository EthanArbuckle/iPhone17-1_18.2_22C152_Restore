@interface NPKProtoStandaloneVerificationChannel
- (BOOL)hasContactPoint;
- (BOOL)hasIdentifier;
- (BOOL)hasOrganizationName;
- (BOOL)hasRequiresUserInteraction;
- (BOOL)hasSourceAddress;
- (BOOL)hasType;
- (BOOL)hasTypeDescription;
- (BOOL)hasTypeDescriptionUnlocalized;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresUserInteraction;
- (NSString)contactPoint;
- (NSString)identifier;
- (NSString)organizationName;
- (NSString)sourceAddress;
- (NSString)typeDescription;
- (NSString)typeDescriptionUnlocalized;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactPoint:(id)a3;
- (void)setHasRequiresUserInteraction:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setRequiresUserInteraction:(BOOL)a3;
- (void)setSourceAddress:(id)a3;
- (void)setType:(int)a3;
- (void)setTypeDescription:(id)a3;
- (void)setTypeDescriptionUnlocalized:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneVerificationChannel

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 110;
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
  if (a3 > 159)
  {
    if (a3 <= 179)
    {
      if (a3 == 160)
      {
        v4 = @"Statement";
        return v4;
      }
      if (a3 == 170)
      {
        v4 = @"Other";
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 180:
          v4 = @"AppClip";
          return v4;
        case 190:
          v4 = @"WebPage";
          return v4;
        case 200:
          v4 = @"URL";
          return v4;
      }
    }
LABEL_44:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 <= 129)
  {
    if (a3 == 110)
    {
      v4 = @"Email";
      return v4;
    }
    if (a3 == 120)
    {
      v4 = @"SMS";
      return v4;
    }
    goto LABEL_44;
  }
  switch(a3)
  {
    case 130:
      v4 = @"InboundPhoneCall";
      break;
    case 140:
      v4 = @"OutboundPhoneCall";
      break;
    case 150:
      v4 = @"BankApp";
      return v4;
    default:
      goto LABEL_44;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Email"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"SMS"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"InboundPhoneCall"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"OutboundPhoneCall"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"BankApp"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"Statement"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"AppClip"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"WebPage"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 200;
  }
  else
  {
    int v4 = 110;
  }

  return v4;
}

- (BOOL)hasTypeDescriptionUnlocalized
{
  return self->_typeDescriptionUnlocalized != 0;
}

- (BOOL)hasTypeDescription
{
  return self->_typeDescription != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiresUserInteraction = a3;
}

- (void)setHasRequiresUserInteraction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiresUserInteraction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasContactPoint
{
  return self->_contactPoint != 0;
}

- (BOOL)hasSourceAddress
{
  return self->_sourceAddress != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneVerificationChannel;
  int v4 = [(NPKProtoStandaloneVerificationChannel *)&v8 description];
  v5 = [(NPKProtoStandaloneVerificationChannel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type > 159)
    {
      if (type <= 179)
      {
        if (type == 160)
        {
          v7 = @"Statement";
          goto LABEL_28;
        }
        if (type == 170)
        {
          v7 = @"Other";
          goto LABEL_28;
        }
      }
      else
      {
        switch(type)
        {
          case 180:
            v7 = @"AppClip";
            goto LABEL_28;
          case 190:
            v7 = @"WebPage";
            goto LABEL_28;
          case 200:
            v7 = @"URL";
            goto LABEL_28;
        }
      }
    }
    else if (type <= 129)
    {
      if (type == 110)
      {
        v7 = @"Email";
        goto LABEL_28;
      }
      if (type == 120)
      {
        v7 = @"SMS";
        goto LABEL_28;
      }
    }
    else
    {
      switch(type)
      {
        case 130:
          v7 = @"InboundPhoneCall";
          goto LABEL_28;
        case 140:
          v7 = @"OutboundPhoneCall";
          goto LABEL_28;
        case 150:
          v7 = @"BankApp";
LABEL_28:
          [v4 setObject:v7 forKey:@"type"];

          goto LABEL_29;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:
  typeDescriptionUnlocalized = self->_typeDescriptionUnlocalized;
  if (typeDescriptionUnlocalized) {
    [v4 setObject:typeDescriptionUnlocalized forKey:@"typeDescriptionUnlocalized"];
  }
  typeDescription = self->_typeDescription;
  if (typeDescription) {
    [v4 setObject:typeDescription forKey:@"typeDescription"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organizationName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_requiresUserInteraction];
    [v4 setObject:v11 forKey:@"requiresUserInteraction"];
  }
  contactPoint = self->_contactPoint;
  if (contactPoint) {
    [v4 setObject:contactPoint forKey:@"contactPoint"];
  }
  sourceAddress = self->_sourceAddress;
  if (sourceAddress) {
    [v4 setObject:sourceAddress forKey:@"sourceAddress"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneVerificationChannelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_typeDescriptionUnlocalized)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_typeDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_organizationName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_contactPoint)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_type;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_typeDescriptionUnlocalized)
  {
    objc_msgSend(v5, "setTypeDescriptionUnlocalized:");
    id v4 = v5;
  }
  if (self->_typeDescription)
  {
    objc_msgSend(v5, "setTypeDescription:");
    id v4 = v5;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v5, "setOrganizationName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_requiresUserInteraction;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_contactPoint)
  {
    objc_msgSend(v5, "setContactPoint:");
    id v4 = v5;
  }
  if (self->_sourceAddress)
  {
    objc_msgSend(v5, "setSourceAddress:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_typeDescriptionUnlocalized copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_typeDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_organizationName copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_requiresUserInteraction;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_contactPoint copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_sourceAddress copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_27;
  }
  typeDescriptionUnlocalized = self->_typeDescriptionUnlocalized;
  if ((unint64_t)typeDescriptionUnlocalized | *((void *)v4 + 7)
    && !-[NSString isEqual:](typeDescriptionUnlocalized, "isEqual:"))
  {
    goto LABEL_27;
  }
  typeDescription = self->_typeDescription;
  if ((unint64_t)typeDescription | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](typeDescription, "isEqual:")) {
      goto LABEL_27;
    }
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_requiresUserInteraction)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    char v11 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  contactPoint = self->_contactPoint;
  if ((unint64_t)contactPoint | *((void *)v4 + 1)
    && !-[NSString isEqual:](contactPoint, "isEqual:"))
  {
    goto LABEL_27;
  }
  sourceAddress = self->_sourceAddress;
  if ((unint64_t)sourceAddress | *((void *)v4 + 4)) {
    char v11 = -[NSString isEqual:](sourceAddress, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_typeDescriptionUnlocalized hash];
  NSUInteger v6 = [(NSString *)self->_typeDescription hash];
  NSUInteger v7 = [(NSString *)self->_organizationName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_requiresUserInteraction;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_contactPoint hash];
  return v9 ^ [(NSString *)self->_sourceAddress hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoStandaloneVerificationChannel setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 68))
  {
    self->_int type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 7))
  {
    -[NPKProtoStandaloneVerificationChannel setTypeDescriptionUnlocalized:](self, "setTypeDescriptionUnlocalized:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NPKProtoStandaloneVerificationChannel setTypeDescription:](self, "setTypeDescription:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoStandaloneVerificationChannel setOrganizationName:](self, "setOrganizationName:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_requiresUserInteraction = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoStandaloneVerificationChannel setContactPoint:](self, "setContactPoint:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NPKProtoStandaloneVerificationChannel setSourceAddress:](self, "setSourceAddress:");
    id v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)typeDescriptionUnlocalized
{
  return self->_typeDescriptionUnlocalized;
}

- (void)setTypeDescriptionUnlocalized:(id)a3
{
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (NSString)contactPoint
{
  return self->_contactPoint;
}

- (void)setContactPoint:(id)a3
{
}

- (NSString)sourceAddress
{
  return self->_sourceAddress;
}

- (void)setSourceAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDescriptionUnlocalized, 0);
  objc_storeStrong((id *)&self->_typeDescription, 0);
  objc_storeStrong((id *)&self->_sourceAddress, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactPoint, 0);
}

@end
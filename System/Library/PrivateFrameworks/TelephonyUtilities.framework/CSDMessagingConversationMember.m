@interface CSDMessagingConversationMember
+ (CSDMessagingConversationMember)memberWithTUConversationMember:(id)a3;
- (BOOL)hasAssociationVoucher;
- (BOOL)hasHandle;
- (BOOL)hasLightweightPrimary;
- (BOOL)hasLightweightPrimaryParticipantID;
- (BOOL)hasNickname;
- (BOOL)hasValidationSource;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (CSDMessagingHandle)lightweightPrimary;
- (CSDMessagingVoucher)associationVoucher;
- (NSString)nickname;
- (TUConversationMember)tuConversationMember;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)validationSourceAsString:(int)a3;
- (int)StringAsValidationSource:(id)a3;
- (int)validationSource;
- (unint64_t)hash;
- (unint64_t)lightweightPrimaryParticipantID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociationVoucher:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasLightweightPrimaryParticipantID:(BOOL)a3;
- (void)setHasValidationSource:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLightweightPrimary:(id)a3;
- (void)setLightweightPrimaryParticipantID:(unint64_t)a3;
- (void)setNickname:(id)a3;
- (void)setValidationSource:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationMember

+ (CSDMessagingConversationMember)memberWithTUConversationMember:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CSDMessagingConversationMember);
  v5 = [v3 handle];
  v6 = +[CSDMessagingHandle handleWithTUHandle:v5];
  [(CSDMessagingConversationMember *)v4 setHandle:v6];

  v7 = [v3 nickname];
  [(CSDMessagingConversationMember *)v4 setNickname:v7];

  v8 = [v3 lightweightPrimary];

  if (v8)
  {
    v9 = [v3 lightweightPrimary];
    v10 = +[CSDMessagingHandle handleWithTUHandle:v9];
    [(CSDMessagingConversationMember *)v4 setLightweightPrimary:v10];

    -[CSDMessagingConversationMember setLightweightPrimaryParticipantID:](v4, "setLightweightPrimaryParticipantID:", [v3 lightweightPrimaryParticipantIdentifier]);
  }
  uint64_t v11 = [v3 associationVoucher];
  if (v11)
  {
    v12 = (void *)v11;
    id v13 = [v3 validationSource];

    if (v13 == (id)2)
    {
      [(CSDMessagingConversationMember *)v4 setValidationSource:2];
      v14 = [v3 associationVoucher];
      v15 = +[CSDMessagingVoucher voucherWithTUVoucher:v14];
      [(CSDMessagingConversationMember *)v4 setAssociationVoucher:v15];
    }
  }

  return v4;
}

- (TUConversationMember)tuConversationMember
{
  id v3 = [(CSDMessagingConversationMember *)self handle];

  if (v3
    && ([(CSDMessagingConversationMember *)self handle],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 tuHandle],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = objc_alloc((Class)TUConversationMember);
    v7 = [(CSDMessagingConversationMember *)self nickname];
    id v8 = [v6 initWithHandle:v5 nickname:v7];

    v9 = [(CSDMessagingConversationMember *)self lightweightPrimary];
    v10 = [v9 tuHandle];
    [v8 setLightweightPrimary:v10];

    objc_msgSend(v8, "setLightweightPrimaryParticipantIdentifier:", -[CSDMessagingConversationMember lightweightPrimaryParticipantID](self, "lightweightPrimaryParticipantID"));
    uint64_t v11 = [v8 lightweightPrimary];
    if (v11)
    {
      v12 = (void *)v11;
      id v13 = [v8 lightweightPrimaryParticipantIdentifier];

      if (v13) {
        [v8 setIsLightweightMember:1];
      }
    }
    v14 = [(CSDMessagingConversationMember *)self associationVoucher];
    v15 = [v14 tuVoucher];

    if (v15 && [(CSDMessagingConversationMember *)self validationSource] == 2)
    {
      [v8 setValidationSource:2];
      [v8 setAssociationVoucher:v15];
      v16 = [CSDMessagingMemberAssociationClaim alloc];
      v17 = [v15 unsafeData];
      v18 = [(CSDMessagingMemberAssociationClaim *)v16 initWithData:v17];
      v19 = [(CSDMessagingMemberAssociationClaim *)v18 tuAssociationForHandle:v5];
      [v8 setAssociation:v19];
    }
  }
  else
  {
    id v8 = 0;
  }

  return (TUConversationMember *)v8;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationMember;
  id v3 = [(CSDMessagingConversationMember *)&v8 description];
  v4 = [(CSDMessagingConversationMember *)self dictionaryRepresentation];
  v5 = TULoggableStringForObject();
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasLightweightPrimary
{
  return self->_lightweightPrimary != 0;
}

- (void)setLightweightPrimaryParticipantID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lightweightPrimaryParticipantID = a3;
}

- (void)setHasLightweightPrimaryParticipantID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLightweightPrimaryParticipantID
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)validationSource
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_validationSource;
  }
  else {
    return 0;
  }
}

- (void)setValidationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_validationSource = a3;
}

- (void)setHasValidationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValidationSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)validationSourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100507600 + a3);
  }

  return v3;
}

- (int)StringAsValidationSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Endorsement"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Vouched"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAssociationVoucher
{
  return self->_associationVoucher != 0;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  handle = self->_handle;
  if (handle)
  {
    id v6 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"handle"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v3 setObject:nickname forKey:@"nickname"];
  }
  lightweightPrimary = self->_lightweightPrimary;
  if (lightweightPrimary)
  {
    v9 = [(CSDMessagingHandle *)lightweightPrimary dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"lightweightPrimary"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:self->_lightweightPrimaryParticipantID];
    [v3 setObject:v11 forKey:@"lightweightPrimaryParticipantID"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t validationSource = self->_validationSource;
    if (validationSource >= 3)
    {
      id v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_validationSource];
    }
    else
    {
      id v13 = *(&off_100507600 + validationSource);
    }
    [v3 setObject:v13 forKey:@"validationSource"];
  }
  associationVoucher = self->_associationVoucher;
  if (associationVoucher)
  {
    v15 = [(CSDMessagingVoucher *)associationVoucher dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"associationVoucher"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F12B4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_handle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_nickname)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_lightweightPrimary)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_associationVoucher)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[13] = self->_version;
    *((unsigned char *)v4 + 56) |= 4u;
  }
  id v6 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v6;
  }
  if (self->_nickname)
  {
    objc_msgSend(v6, "setNickname:");
    id v4 = v6;
  }
  if (self->_lightweightPrimary)
  {
    objc_msgSend(v6, "setLightweightPrimary:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_lightweightPrimaryParticipantID;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[12] = self->_validationSource;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_associationVoucher)
  {
    objc_msgSend(v6, "setAssociationVoucher:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[13] = self->_version;
    *((unsigned char *)v5 + 56) |= 4u;
  }
  id v7 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_nickname copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(CSDMessagingHandle *)self->_lightweightPrimary copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  char has = (char)self->_has;
  if (has)
  {
    v6[1] = self->_lightweightPrimaryParticipantID;
    *((unsigned char *)v6 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_validationSource;
    *((unsigned char *)v6 + 56) |= 2u;
  }
  id v14 = [(CSDMessagingVoucher *)self->_associationVoucher copyWithZone:a3];
  v15 = (void *)v6[2];
  v6[2] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_version != *((_DWORD *)v4 + 13)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_25:
    unsigned __int8 v9 = 0;
    goto LABEL_26;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 3) && !-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
    goto LABEL_25;
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:")) {
      goto LABEL_25;
    }
  }
  lightweightPrimary = self->_lightweightPrimary;
  if ((unint64_t)lightweightPrimary | *((void *)v4 + 4))
  {
    if (!-[CSDMessagingHandle isEqual:](lightweightPrimary, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_lightweightPrimaryParticipantID != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_validationSource != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_25;
  }
  associationVoucher = self->_associationVoucher;
  if ((unint64_t)associationVoucher | *((void *)v4 + 2)) {
    unsigned __int8 v9 = -[CSDMessagingVoucher isEqual:](associationVoucher, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(CSDMessagingHandle *)self->_handle hash];
  NSUInteger v5 = [(NSString *)self->_nickname hash];
  unint64_t v6 = [(CSDMessagingHandle *)self->_lightweightPrimary hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v7 = 2654435761u * self->_lightweightPrimaryParticipantID;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(CSDMessagingVoucher *)self->_associationVoucher hash];
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_validationSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(CSDMessagingVoucher *)self->_associationVoucher hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[14] & 4) != 0)
  {
    self->_version = v4[13];
    *(unsigned char *)&self->_has |= 4u;
  }
  handle = self->_handle;
  uint64_t v7 = *((void *)v5 + 3);
  id v13 = v5;
  if (handle)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationMember setHandle:](self, "setHandle:");
  }
  id v5 = v13;
LABEL_9:
  if (*((void *)v5 + 5))
  {
    -[CSDMessagingConversationMember setNickname:](self, "setNickname:");
    id v5 = v13;
  }
  lightweightPrimary = self->_lightweightPrimary;
  uint64_t v9 = *((void *)v5 + 4);
  if (lightweightPrimary)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[CSDMessagingHandle mergeFrom:](lightweightPrimary, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationMember setLightweightPrimary:](self, "setLightweightPrimary:");
  }
  id v5 = v13;
LABEL_17:
  char v10 = *((unsigned char *)v5 + 56);
  if (v10)
  {
    self->_lightweightPrimaryParticipantID = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)v5 + 56);
  }
  if ((v10 & 2) != 0)
  {
    self->_uint64_t validationSource = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  associationVoucher = self->_associationVoucher;
  uint64_t v12 = *((void *)v5 + 2);
  if (associationVoucher)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[CSDMessagingVoucher mergeFrom:](associationVoucher, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[CSDMessagingConversationMember setAssociationVoucher:](self, "setAssociationVoucher:");
  }
  id v5 = v13;
LABEL_27:
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingHandle)lightweightPrimary
{
  return self->_lightweightPrimary;
}

- (void)setLightweightPrimary:(id)a3
{
}

- (unint64_t)lightweightPrimaryParticipantID
{
  return self->_lightweightPrimaryParticipantID;
}

- (CSDMessagingVoucher)associationVoucher
{
  return self->_associationVoucher;
}

- (void)setAssociationVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_lightweightPrimary, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_associationVoucher, 0);
}

@end
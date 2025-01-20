@interface NNMKProtoMailbox
+ (id)protoMailboxFromMailbox:(id)a3;
- (BOOL)hasAccountId;
- (BOOL)hasCustomName;
- (BOOL)hasFilterType;
- (BOOL)hasMailboxId;
- (BOOL)hasSyncEnabled;
- (BOOL)hasSyncRequested;
- (BOOL)hasType;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)syncEnabled;
- (BOOL)syncRequested;
- (NSString)accountId;
- (NSString)customName;
- (NSString)mailboxId;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mailbox;
- (unint64_t)hash;
- (unsigned)filterType;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setFilterType:(unsigned int)a3;
- (void)setHasFilterType:(BOOL)a3;
- (void)setHasSyncEnabled:(BOOL)a3;
- (void)setHasSyncRequested:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setSyncEnabled:(BOOL)a3;
- (void)setSyncRequested:(BOOL)a3;
- (void)setType:(unsigned int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMailbox

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (BOOL)hasCustomName
{
  return self->_customName != 0;
}

- (void)setFilterType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_filterType = a3;
}

- (void)setHasFilterType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFilterType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSyncEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_syncEnabled = a3;
}

- (void)setHasSyncEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSyncRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_syncRequested = a3;
}

- (void)setHasSyncRequested:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSyncRequested
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMailbox;
  v4 = [(NNMKProtoMailbox *)&v8 description];
  v5 = [(NNMKProtoMailbox *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  accountId = self->_accountId;
  if (accountId) {
    [v3 setObject:accountId forKey:@"accountId"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v4 setObject:mailboxId forKey:@"mailboxId"];
  }
  customName = self->_customName;
  if (customName) {
    [v4 setObject:customName forKey:@"customName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_filterType];
    [v4 setObject:v12 forKey:@"filterType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithBool:self->_syncEnabled];
  [v4 setObject:v13 forKey:@"syncEnabled"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v14 = [NSNumber numberWithUnsignedInt:self->_type];
  [v4 setObject:v14 forKey:@"type"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithBool:self->_syncRequested];
    [v4 setObject:v9 forKey:@"syncRequested"];
  }
LABEL_12:
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMailboxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_customName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    id v4 = v6;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v6, "setMailboxId:");
    id v4 = v6;
  }
  if (self->_customName)
  {
    objc_msgSend(v6, "setCustomName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_filterType;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 56) = self->_syncEnabled;
  *((unsigned char *)v4 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  *((_DWORD *)v4 + 10) = self->_type;
  *((unsigned char *)v4 + 60) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 57) = self->_syncRequested;
    *((unsigned char *)v4 + 60) |= 8u;
  }
LABEL_12:
  if (self->_url)
  {
    objc_msgSend(v6, "setUrl:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_customName copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_filterType;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_type;
      *(unsigned char *)(v5 + 60) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 56) = self->_syncEnabled;
  *(unsigned char *)(v5 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 57) = self->_syncRequested;
    *(unsigned char *)(v5 + 60) |= 8u;
  }
LABEL_6:
  uint64_t v13 = [(NSString *)self->_url copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  customName = self->_customName;
  if ((unint64_t)customName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](customName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_syncEnabled)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0) {
      goto LABEL_36;
    }
LABEL_30:
    char v8 = 0;
    goto LABEL_31;
  }
  if ((*((unsigned char *)v4 + 60) & 8) == 0) {
    goto LABEL_30;
  }
  if (!self->_syncRequested)
  {
    if (!*((unsigned char *)v4 + 57)) {
      goto LABEL_36;
    }
    goto LABEL_30;
  }
  if (!*((unsigned char *)v4 + 57)) {
    goto LABEL_30;
  }
LABEL_36:
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 6)) {
    char v8 = -[NSString isEqual:](url, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountId hash];
  NSUInteger v4 = [(NSString *)self->_mailboxId hash];
  NSUInteger v5 = [(NSString *)self->_customName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_filterType;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_syncEnabled;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_url hash];
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_syncRequested;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_url hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoMailbox setAccountId:](self, "setAccountId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NNMKProtoMailbox setMailboxId:](self, "setMailboxId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoMailbox setCustomName:](self, "setCustomName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if (v5)
  {
    self->_filterType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_syncEnabled = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_type = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
LABEL_11:
    self->_syncRequested = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 6))
  {
    -[NNMKProtoMailbox setUrl:](self, "setUrl:");
    id v4 = v6;
  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
}

- (unsigned)filterType
{
  return self->_filterType;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)syncRequested
{
  return self->_syncRequested;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

- (id)mailbox
{
  NSUInteger v3 = objc_alloc_init(NNMKMailbox);
  id v4 = [(NNMKProtoMailbox *)self accountId];
  [(NNMKMailbox *)v3 setAccountId:v4];

  char v5 = [(NNMKProtoMailbox *)self mailboxId];
  [(NNMKMailbox *)v3 setMailboxId:v5];

  [(NNMKMailbox *)v3 setType:[(NNMKProtoMailbox *)self type]];
  [(NNMKMailbox *)v3 setFilterType:[(NNMKProtoMailbox *)self filterType]];
  id v6 = [(NNMKProtoMailbox *)self customName];
  [(NNMKMailbox *)v3 setCustomName:v6];

  [(NNMKMailbox *)v3 setSyncEnabled:[(NNMKProtoMailbox *)self syncEnabled]];
  [(NNMKMailbox *)v3 setSyncRequested:[(NNMKProtoMailbox *)self syncRequested]];
  uint64_t v7 = NSURL;
  uint64_t v8 = [(NNMKProtoMailbox *)self url];
  uint64_t v9 = [v7 URLWithString:v8];
  [(NNMKMailbox *)v3 setUrl:v9];

  return v3;
}

+ (id)protoMailboxFromMailbox:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NNMKProtoMailbox);
  char v5 = [v3 accountId];
  [(NNMKProtoMailbox *)v4 setAccountId:v5];

  id v6 = [v3 mailboxId];
  [(NNMKProtoMailbox *)v4 setMailboxId:v6];

  -[NNMKProtoMailbox setType:](v4, "setType:", [v3 type]);
  -[NNMKProtoMailbox setFilterType:](v4, "setFilterType:", [v3 filterType]);
  uint64_t v7 = [v3 customName];
  [(NNMKProtoMailbox *)v4 setCustomName:v7];

  -[NNMKProtoMailbox setSyncEnabled:](v4, "setSyncEnabled:", [v3 syncEnabled]);
  -[NNMKProtoMailbox setSyncRequested:](v4, "setSyncRequested:", [v3 syncRequested]);
  uint64_t v8 = [v3 url];

  uint64_t v9 = [v8 absoluteString];
  [(NNMKProtoMailbox *)v4 setUrl:v9];

  return v4;
}

@end
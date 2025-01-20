@interface ICIAMApplicationMessageSyncCommand
- (BOOL)hasApplicationMessage;
- (BOOL)hasCommandSerialNumber;
- (BOOL)hasCommandType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICIAMApplicationMessage)applicationMessage;
- (id)commandTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCommandType:(id)a3;
- (int)commandType;
- (int64_t)commandSerialNumber;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationMessage:(id)a3;
- (void)setCommandSerialNumber:(int64_t)a3;
- (void)setCommandType:(int)a3;
- (void)setHasCommandSerialNumber:(BOOL)a3;
- (void)setHasCommandType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMApplicationMessageSyncCommand

- (void).cxx_destruct
{
}

- (int64_t)commandSerialNumber
{
  return self->_commandSerialNumber;
}

- (void)setApplicationMessage:(id)a3
{
}

- (ICIAMApplicationMessage)applicationMessage
{
  return self->_applicationMessage;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if ((v4[7] & 2) != 0)
  {
    self->_commandType = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  applicationMessage = self->_applicationMessage;
  uint64_t v7 = *((void *)v5 + 2);
  if (applicationMessage)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v8 = v5;
    applicationMessage = (ICIAMApplicationMessage *)-[ICIAMApplicationMessage mergeFrom:](applicationMessage, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v8 = v5;
    applicationMessage = (ICIAMApplicationMessage *)-[ICIAMApplicationMessageSyncCommand setApplicationMessage:](self, "setApplicationMessage:");
  }
  v5 = v8;
LABEL_9:
  if (v5[7])
  {
    self->_commandSerialNumber = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8](applicationMessage, v5);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_commandType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ICIAMApplicationMessage *)self->_applicationMessage hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_commandSerialNumber;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 28);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_commandType != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  applicationMessage = self->_applicationMessage;
  if ((unint64_t)applicationMessage | *((void *)v4 + 2))
  {
    if (!-[ICIAMApplicationMessage isEqual:](applicationMessage, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 28);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_commandSerialNumber != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_commandType;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  id v7 = [(ICIAMApplicationMessage *)self->_applicationMessage copyWithZone:a3];
  BOOL v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_commandSerialNumber;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_commandType;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_applicationMessage)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setApplicationMessage:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_commandSerialNumber;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_applicationMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMApplicationMessageSyncCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t commandType = self->_commandType;
    if (commandType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_commandType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5AC8450[commandType];
    }
    [v3 setObject:v5 forKey:@"commandType"];
  }
  applicationMessage = self->_applicationMessage;
  if (applicationMessage)
  {
    id v7 = [(ICIAMApplicationMessage *)applicationMessage dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"applicationMessage"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v8 = [NSNumber numberWithLongLong:self->_commandSerialNumber];
    [v3 setObject:v8 forKey:@"commandSerialNumber"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMApplicationMessageSyncCommand;
  id v4 = [(ICIAMApplicationMessageSyncCommand *)&v8 description];
  id v5 = [(ICIAMApplicationMessageSyncCommand *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCommandSerialNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCommandSerialNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCommandSerialNumber:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_commandSerialNumber = a3;
}

- (BOOL)hasApplicationMessage
{
  return self->_applicationMessage != 0;
}

- (int)StringAsCommandType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Add"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Remove"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RemoveAll"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)commandTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC8450[a3];
  }

  return v3;
}

- (BOOL)hasCommandType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCommandType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCommandType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t commandType = a3;
}

- (int)commandType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_commandType;
  }
  else {
    return 0;
  }
}

@end
@interface MBSAccount
- (BOOL)hasAccountID;
- (BOOL)hasLoggingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)loggingEnabled;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)backupUDIDs;
- (NSString)accountID;
- (id)backupUDIDAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)backupUDIDsCount;
- (unint64_t)hash;
- (void)addBackupUDID:(id)a3;
- (void)clearBackupUDIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setBackupUDIDs:(id)a3;
- (void)setHasLoggingEnabled:(BOOL)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSAccount

- (void)dealloc
{
  [(MBSAccount *)self setAccountID:0];
  [(MBSAccount *)self setBackupUDIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSAccount;
  [(MBSAccount *)&v3 dealloc];
}

- (BOOL)hasAccountID
{
  return self->_accountID != 0;
}

- (void)clearBackupUDIDs
{
}

- (void)addBackupUDID:(id)a3
{
  backupUDIDs = self->_backupUDIDs;
  if (!backupUDIDs)
  {
    backupUDIDs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_backupUDIDs = backupUDIDs;
  }
  [(NSMutableArray *)backupUDIDs addObject:a3];
}

- (unint64_t)backupUDIDsCount
{
  return (unint64_t)[(NSMutableArray *)self->_backupUDIDs count];
}

- (id)backupUDIDAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_backupUDIDs objectAtIndex:a3];
}

- (void)setLoggingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_loggingEnabled = a3;
}

- (void)setHasLoggingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLoggingEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSAccount;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSAccount *)&v3 description], [(MBSAccount *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  accountID = self->_accountID;
  if (accountID) {
    [v3 setObject:accountID forKey:@"accountID"];
  }
  backupUDIDs = self->_backupUDIDs;
  if (backupUDIDs) {
    [v4 setObject:backupUDIDs forKey:@"backupUDID"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_loggingEnabled), @"loggingEnabled");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        LODWORD(v7) = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v7) = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    int v13 = (unsigned __int16)(v7 >> 3);
    switch(v13)
    {
      case 3:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
          v17 |= (unint64_t)(v19 & 0x7F) << v15;
          if ((v19 & 0x80) == 0) {
            goto LABEL_33;
          }
          v15 += 7;
          BOOL v10 = v16++ >= 9;
          if (v10)
          {
            uint64_t v17 = 0;
            goto LABEL_35;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_35:
        self->_loggingEnabled = v17 != 0;
        break;
      case 2:
        uint64_t Data = PBReaderReadData();
        if (Data) {
          [(MBSAccount *)self addBackupUDID:Data];
        }
        break;
      case 1:
        String = (void *)PBReaderReadString();

        self->_accountID = (NSString *)String;
        break;
      default:
        int v21 = PBReaderSkipValueWithTag();
        if (!v21) {
          return v21;
        }
        break;
    }
  }
  LOBYTE(v21) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v21;
}

- (void)writeTo:(id)a3
{
  if (self->_accountID) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  backupUDIDs = self->_backupUDIDs;
  char v5 = (char *)[(NSMutableArray *)backupUDIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(backupUDIDs);
        }
        PBDataWriterWriteDataField();
      }
      unsigned int v6 = (char *)[(NSMutableArray *)backupUDIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_accountID) {
    objc_msgSend(a3, "setAccountID:");
  }
  if ([(MBSAccount *)self backupUDIDsCount])
  {
    [a3 clearBackupUDIDs];
    unint64_t v5 = [(MBSAccount *)self backupUDIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addBackupUDID:", -[MBSAccount backupUDIDAtIndex:](self, "backupUDIDAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 24) = self->_loggingEnabled;
    *((unsigned char *)a3 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NSString *)self->_accountID copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  backupUDIDs = self->_backupUDIDs;
  id v7 = [(NSMutableArray *)backupUDIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(backupUDIDs);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [v5 addBackupUDID:v11];
      }
      id v8 = [(NSMutableArray *)backupUDIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_loggingEnabled;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    accountID = self->_accountID;
    if (!((unint64_t)accountID | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSString isEqual:](accountID, "isEqual:")) != 0)
    {
      backupUDIDs = self->_backupUDIDs;
      if (!((unint64_t)backupUDIDs | *((void *)a3 + 2))
        || (unsigned int v5 = -[NSMutableArray isEqual:](backupUDIDs, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 1) == 0;
        if (*(unsigned char *)&self->_has) {
          LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 1) != 0 && self->_loggingEnabled == *((unsigned __int8 *)a3 + 24);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountID hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_backupUDIDs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_loggingEnabled;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSAccount setAccountID:](self, "setAccountID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MBSAccount *)self addBackupUDID:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (*((unsigned char *)a3 + 28))
  {
    self->_loggingEnabled = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSMutableArray)backupUDIDs
{
  return self->_backupUDIDs;
}

- (void)setBackupUDIDs:(id)a3
{
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

@end
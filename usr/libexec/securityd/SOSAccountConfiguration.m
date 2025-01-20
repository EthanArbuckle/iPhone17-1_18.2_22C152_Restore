@interface SOSAccountConfiguration
+ (Class)pendingBackupPeersType;
- (BOOL)hasRingUpdateFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)ringUpdateFlag;
- (NSMutableArray)pendingBackupPeers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pendingBackupPeersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pendingBackupPeersCount;
- (void)addPendingBackupPeers:(id)a3;
- (void)clearPendingBackupPeers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRingUpdateFlag:(BOOL)a3;
- (void)setPendingBackupPeers:(id)a3;
- (void)setRingUpdateFlag:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SOSAccountConfiguration

- (void).cxx_destruct
{
}

- (BOOL)ringUpdateFlag
{
  return self->_ringUpdateFlag;
}

- (void)setPendingBackupPeers:(id)a3
{
}

- (NSMutableArray)pendingBackupPeers
{
  return self->_pendingBackupPeers;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SOSAccountConfiguration addPendingBackupPeers:](self, "addPendingBackupPeers:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_ringUpdateFlag = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_pendingBackupPeers hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_ringUpdateFlag;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  pendingBackupPeers = self->_pendingBackupPeers;
  if ((unint64_t)pendingBackupPeers | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](pendingBackupPeers, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_ringUpdateFlag)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = self->_pendingBackupPeers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addPendingBackupPeers:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[16] = self->_ringUpdateFlag;
    v5[20] |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SOSAccountConfiguration *)self pendingBackupPeersCount])
  {
    [v8 clearPendingBackupPeers];
    unint64_t v4 = [(SOSAccountConfiguration *)self pendingBackupPeersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SOSAccountConfiguration *)self pendingBackupPeersAtIndex:i];
        [v8 addPendingBackupPeers:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[16] = self->_ringUpdateFlag;
    v8[20] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_pendingBackupPeers;
  BOOL v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
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
    unint64_t v7 = 0;
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
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 >> 3) == 2)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_32;
        }
        v14 += 7;
        BOOL v10 = v15++ >= 9;
        if (v10)
        {
          uint64_t v16 = 0;
          goto LABEL_34;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v16 = 0;
      }
LABEL_34:
      self->_ringUpdateFlag = v16 != 0;
    }
    else if ((v7 >> 3) == 1)
    {
      long long v13 = PBReaderReadString();
      if (v13) {
        [(SOSAccountConfiguration *)self addPendingBackupPeers:v13];
      }
    }
    else
    {
      int v19 = PBReaderSkipValueWithTag();
      if (!v19) {
        return v19;
      }
    }
  }
  LOBYTE(v19) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v19;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  pendingBackupPeers = self->_pendingBackupPeers;
  if (pendingBackupPeers) {
    [v3 setObject:pendingBackupPeers forKey:@"pendingBackupPeers"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = +[NSNumber numberWithBool:self->_ringUpdateFlag];
    [v4 setObject:v6 forKey:@"ringUpdateFlag"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SOSAccountConfiguration;
  unint64_t v3 = [(SOSAccountConfiguration *)&v7 description];
  id v4 = [(SOSAccountConfiguration *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasRingUpdateFlag
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRingUpdateFlag:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRingUpdateFlag:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ringUpdateFlag = a3;
}

- (id)pendingBackupPeersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_pendingBackupPeers objectAtIndex:a3];
}

- (unint64_t)pendingBackupPeersCount
{
  return (unint64_t)[(NSMutableArray *)self->_pendingBackupPeers count];
}

- (void)addPendingBackupPeers:(id)a3
{
  id v4 = a3;
  pendingBackupPeers = self->_pendingBackupPeers;
  id v8 = v4;
  if (!pendingBackupPeers)
  {
    unsigned int v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_pendingBackupPeers;
    self->_pendingBackupPeers = v6;

    id v4 = v8;
    pendingBackupPeers = self->_pendingBackupPeers;
  }
  [(NSMutableArray *)pendingBackupPeers addObject:v4];
}

- (void)clearPendingBackupPeers
{
}

+ (Class)pendingBackupPeersType
{
  return (Class)objc_opt_class();
}

@end
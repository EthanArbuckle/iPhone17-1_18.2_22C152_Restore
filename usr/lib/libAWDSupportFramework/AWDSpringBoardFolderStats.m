@interface AWDSpringBoardFolderStats
- (BOOL)hasNumberOfFoldersInDock;
- (BOOL)hasNumberOfPagesInRootFolder;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalNumberOfFolders;
- (BOOL)hasTotalNumberOfIconsInDock;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numberOfFoldersInDock;
- (unint64_t)numberOfFoldersPerPageAtIndex:(unint64_t)a3;
- (unint64_t)numberOfFoldersPerPages;
- (unint64_t)numberOfFoldersPerPagesCount;
- (unint64_t)numberOfPagesInRootFolder;
- (unint64_t)timestamp;
- (unint64_t)totalNumberOfFolders;
- (unint64_t)totalNumberOfIconsInDock;
- (void)addNumberOfFoldersPerPage:(unint64_t)a3;
- (void)clearNumberOfFoldersPerPages;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfFoldersInDock:(BOOL)a3;
- (void)setHasNumberOfPagesInRootFolder:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalNumberOfFolders:(BOOL)a3;
- (void)setHasTotalNumberOfIconsInDock:(BOOL)a3;
- (void)setNumberOfFoldersInDock:(unint64_t)a3;
- (void)setNumberOfFoldersPerPages:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setNumberOfPagesInRootFolder:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalNumberOfFolders:(unint64_t)a3;
- (void)setTotalNumberOfIconsInDock:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardFolderStats

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardFolderStats;
  [(AWDSpringBoardFolderStats *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalNumberOfFolders:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalNumberOfFolders = a3;
}

- (void)setHasTotalNumberOfFolders:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalNumberOfFolders
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfPagesInRootFolder:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfPagesInRootFolder = a3;
}

- (void)setHasNumberOfPagesInRootFolder:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfPagesInRootFolder
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfIconsInDock:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalNumberOfIconsInDock = a3;
}

- (void)setHasTotalNumberOfIconsInDock:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalNumberOfIconsInDock
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumberOfFoldersInDock:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfFoldersInDock = a3;
}

- (void)setHasNumberOfFoldersInDock:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfFoldersInDock
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)numberOfFoldersPerPagesCount
{
  return self->_numberOfFoldersPerPages.count;
}

- (unint64_t)numberOfFoldersPerPages
{
  return self->_numberOfFoldersPerPages.list;
}

- (void)clearNumberOfFoldersPerPages
{
}

- (void)addNumberOfFoldersPerPage:(unint64_t)a3
{
}

- (unint64_t)numberOfFoldersPerPageAtIndex:(unint64_t)a3
{
  p_numberOfFoldersPerPages = &self->_numberOfFoldersPerPages;
  unint64_t count = self->_numberOfFoldersPerPages.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_numberOfFoldersPerPages->list[a3];
}

- (void)setNumberOfFoldersPerPages:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardFolderStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardFolderStats description](&v3, sel_description), -[AWDSpringBoardFolderStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalNumberOfFolders] forKey:@"totalNumberOfFolders"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalNumberOfIconsInDock] forKey:@"totalNumberOfIconsInDock"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numberOfPagesInRootFolder] forKey:@"numberOfPagesInRootFolder"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (has) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numberOfFoldersInDock] forKey:@"numberOfFoldersInDock"];
LABEL_7:
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"numberOfFoldersPerPage"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardFolderStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
  p_numberOfFoldersPerPages = &self->_numberOfFoldersPerPages;
  if (p_numberOfFoldersPerPages->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < p_numberOfFoldersPerPages->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((unsigned char *)a3 + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 7) = self->_totalNumberOfFolders;
  *((unsigned char *)a3 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((void *)a3 + 8) = self->_totalNumberOfIconsInDock;
    *((unsigned char *)a3 + 72) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  *((void *)a3 + 5) = self->_numberOfPagesInRootFolder;
  *((unsigned char *)a3 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *((void *)a3 + 4) = self->_numberOfFoldersInDock;
    *((unsigned char *)a3 + 72) |= 1u;
  }
LABEL_7:
  if ([(AWDSpringBoardFolderStats *)self numberOfFoldersPerPagesCount])
  {
    [a3 clearNumberOfFoldersPerPages];
    unint64_t v6 = [(AWDSpringBoardFolderStats *)self numberOfFoldersPerPagesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addNumberOfFoldersPerPage:-[AWDSpringBoardFolderStats numberOfFoldersPerPageAtIndex:](self, "numberOfFoldersPerPageAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v4 + 48) = self->_timestamp;
    *(unsigned char *)(v4 + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v4 + 56) = self->_totalNumberOfFolders;
  *(unsigned char *)(v4 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(void *)(v4 + 64) = self->_totalNumberOfIconsInDock;
    *(unsigned char *)(v4 + 72) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(void *)(v4 + 40) = self->_numberOfPagesInRootFolder;
  *(unsigned char *)(v4 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(void *)(v4 + 32) = self->_numberOfFoldersInDock;
    *(unsigned char *)(v4 + 72) |= 1u;
  }
LABEL_7:
  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_timestamp != *((void *)a3 + 6)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_totalNumberOfFolders != *((void *)a3 + 7)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_numberOfPagesInRootFolder != *((void *)a3 + 5)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_totalNumberOfIconsInDock != *((void *)a3 + 8)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_numberOfFoldersInDock != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 72))
  {
    return 0;
  }

  return PBRepeatedUInt64IsEqual();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_totalNumberOfFolders;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_numberOfPagesInRootFolder;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt64Hash();
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_totalNumberOfIconsInDock;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_numberOfFoldersInDock;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 72);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 72);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_totalNumberOfFolders = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 72);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_numberOfPagesInRootFolder = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 72);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  self->_totalNumberOfIconsInDock = *((void *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)a3 + 72))
  {
LABEL_6:
    self->_numberOfFoldersInDock = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  uint64_t v6 = [a3 numberOfFoldersPerPagesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDSpringBoardFolderStats addNumberOfFoldersPerPage:](self, "addNumberOfFoldersPerPage:", [a3 numberOfFoldersPerPageAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)totalNumberOfFolders
{
  return self->_totalNumberOfFolders;
}

- (unint64_t)numberOfPagesInRootFolder
{
  return self->_numberOfPagesInRootFolder;
}

- (unint64_t)totalNumberOfIconsInDock
{
  return self->_totalNumberOfIconsInDock;
}

- (unint64_t)numberOfFoldersInDock
{
  return self->_numberOfFoldersInDock;
}

@end
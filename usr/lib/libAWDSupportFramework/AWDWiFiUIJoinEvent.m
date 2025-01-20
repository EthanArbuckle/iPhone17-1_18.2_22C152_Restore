@interface AWDWiFiUIJoinEvent
+ (Class)sectionCountsType;
- (BOOL)hasError;
- (BOOL)hasProcess;
- (BOOL)hasSection;
- (BOOL)hasSecurityType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sectionCounts;
- (NSString)process;
- (NSString)section;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionCountsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sectionCountsCount;
- (unint64_t)timestamp;
- (unsigned)error;
- (unsigned)securityType;
- (void)addSectionCounts:(id)a3;
- (void)clearSectionCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setError:(unsigned int)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProcess:(id)a3;
- (void)setSection:(id)a3;
- (void)setSectionCounts:(id)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiUIJoinEvent

- (void)dealloc
{
  [(AWDWiFiUIJoinEvent *)self setProcess:0];
  [(AWDWiFiUIJoinEvent *)self setSection:0];
  [(AWDWiFiUIJoinEvent *)self setSectionCounts:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIJoinEvent;
  [(AWDWiFiUIJoinEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecurityType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setError:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSection
{
  return self->_section != 0;
}

- (void)clearSectionCounts
{
}

- (void)addSectionCounts:(id)a3
{
  sectionCounts = self->_sectionCounts;
  if (!sectionCounts)
  {
    sectionCounts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_sectionCounts = sectionCounts;
  }

  [(NSMutableArray *)sectionCounts addObject:a3];
}

- (unint64_t)sectionCountsCount
{
  return [(NSMutableArray *)self->_sectionCounts count];
}

- (id)sectionCountsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionCounts objectAtIndex:a3];
}

+ (Class)sectionCountsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIJoinEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiUIJoinEvent description](&v3, sel_description), -[AWDWiFiUIJoinEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  process = self->_process;
  if (process) {
    [v3 setObject:process forKey:@"process"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_error] forKey:@"error"];
  }
  section = self->_section;
  if (section) {
    [v3 setObject:section forKey:@"section"];
  }
  if ([(NSMutableArray *)self->_sectionCounts count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_sectionCounts, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    sectionCounts = self->_sectionCounts;
    uint64_t v9 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(sectionCounts);
          }
          [v7 addObject:[(*(id *)(*((void *)&v14 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"sectionCounts"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIJoinEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_process) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_section) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  sectionCounts = self->_sectionCounts;
  uint64_t v6 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(sectionCounts);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 1u;
  }
  if (self->_process) {
    [a3 setProcess:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_securityType;
    *((unsigned char *)a3 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_error;
    *((unsigned char *)a3 + 52) |= 2u;
  }
  if (self->_section) {
    [a3 setSection:];
  }
  if ([(AWDWiFiUIJoinEvent *)self sectionCountsCount])
  {
    [a3 clearSectionCounts];
    unint64_t v6 = [(AWDWiFiUIJoinEvent *)self sectionCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addSectionCounts:-[AWDWiFiUIJoinEvent sectionCountsAtIndex:](self, "sectionCountsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_process copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_securityType;
    *(unsigned char *)(v6 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_error;
    *(unsigned char *)(v6 + 52) |= 2u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_section copyWithZone:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  sectionCounts = self->_sectionCounts;
  uint64_t v9 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(sectionCounts);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSectionCounts:v13];
      }
      uint64_t v10 = [(NSMutableArray *)sectionCounts countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    process = self->_process;
    if ((unint64_t)process | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](process, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_securityType != *((_DWORD *)a3 + 12)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_error != *((_DWORD *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_24;
    }
    section = self->_section;
    if (!((unint64_t)section | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](section, "isEqual:")) != 0)
    {
      sectionCounts = self->_sectionCounts;
      if ((unint64_t)sectionCounts | *((void *)a3 + 5))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](sectionCounts, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_process hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_securityType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_error;
LABEL_9:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_section hash];
  return v7 ^ [(NSMutableArray *)self->_sectionCounts hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 52))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDWiFiUIJoinEvent setProcess:](self, "setProcess:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_error = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDWiFiUIJoinEvent setSection:](self, "setSection:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 5);
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
        [(AWDWiFiUIJoinEvent *)self addSectionCounts:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)error
{
  return self->_error;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSMutableArray)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
}

@end
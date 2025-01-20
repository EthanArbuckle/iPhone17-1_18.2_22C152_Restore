@interface AWDITesterTestFinish
- (BOOL)hasTestName;
- (BOOL)hasTestStatus;
- (BOOL)hasTimestamp;
- (BOOL)hasUniqueKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)testName;
- (NSString)uniqueKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)testStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTestStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setTestStatus:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUniqueKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterTestFinish

- (void)dealloc
{
  [(AWDITesterTestFinish *)self setTestName:0];
  [(AWDITesterTestFinish *)self setUniqueKey:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestFinish;
  [(AWDITesterTestFinish *)&v3 dealloc];
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

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (BOOL)hasUniqueKey
{
  return self->_uniqueKey != 0;
}

- (void)setTestStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_testStatus = a3;
}

- (void)setHasTestStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestFinish;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterTestFinish description](&v3, sel_description), -[AWDITesterTestFinish dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  testName = self->_testName;
  if (testName) {
    [v3 setObject:testName forKey:@"testName"];
  }
  uniqueKey = self->_uniqueKey;
  if (uniqueKey) {
    [v3 setObject:uniqueKey forKey:@"uniqueKey"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_testStatus] forKey:@"testStatus"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestFinishReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_testName) {
    PBDataWriterWriteStringField();
  }
  if (self->_uniqueKey) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_testName) {
    [a3 setTestName:];
  }
  if (self->_uniqueKey) {
    [a3 setUniqueKey:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_testStatus;
    *((unsigned char *)a3 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_testName copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_uniqueKey copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_testStatus;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    testName = self->_testName;
    if (!((unint64_t)testName | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
    {
      uniqueKey = self->_uniqueKey;
      if (!((unint64_t)uniqueKey | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](uniqueKey, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 2) == 0;
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_testStatus != *((_DWORD *)a3 + 6)) {
            goto LABEL_15;
          }
          LOBYTE(v5) = 1;
        }
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
  NSUInteger v4 = [(NSString *)self->_testName hash];
  NSUInteger v5 = [(NSString *)self->_uniqueKey hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_testStatus;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterTestFinish setTestName:](self, "setTestName:");
  }
  if (*((void *)a3 + 4)) {
    -[AWDITesterTestFinish setUniqueKey:](self, "setUniqueKey:");
  }
  if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    self->_testStatus = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (void)setUniqueKey:(id)a3
{
}

- (unsigned)testStatus
{
  return self->_testStatus;
}

@end
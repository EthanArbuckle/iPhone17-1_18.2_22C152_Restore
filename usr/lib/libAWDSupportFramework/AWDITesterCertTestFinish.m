@interface AWDITesterCertTestFinish
- (BOOL)hasAccessoryName;
- (BOOL)hasAccessoryType;
- (BOOL)hasTestName;
- (BOOL)hasTestStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessoryName;
- (NSString)accessoryType;
- (NSString)testName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)testStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setHasTestStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setTestStatus:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterCertTestFinish

- (void)dealloc
{
  [(AWDITesterCertTestFinish *)self setTestName:0];
  [(AWDITesterCertTestFinish *)self setAccessoryName:0];
  [(AWDITesterCertTestFinish *)self setAccessoryType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertTestFinish;
  [(AWDITesterCertTestFinish *)&v3 dealloc];
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

- (BOOL)hasAccessoryName
{
  return self->_accessoryName != 0;
}

- (BOOL)hasAccessoryType
{
  return self->_accessoryType != 0;
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
  v3.super_class = (Class)AWDITesterCertTestFinish;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterCertTestFinish description](&v3, sel_description), -[AWDITesterCertTestFinish dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  accessoryName = self->_accessoryName;
  if (accessoryName) {
    [v3 setObject:accessoryName forKey:@"accessoryName"];
  }
  accessoryType = self->_accessoryType;
  if (accessoryType) {
    [v3 setObject:accessoryType forKey:@"accessoryType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_testStatus] forKey:@"testStatus"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterCertTestFinishReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_testName) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryType) {
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
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_testName) {
    [a3 setTestName:];
  }
  if (self->_accessoryName) {
    [a3 setAccessoryName:];
  }
  if (self->_accessoryType) {
    [a3 setAccessoryType:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_testStatus;
    *((unsigned char *)a3 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_testName copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSString *)self->_accessoryName copyWithZone:a3];

  *(void *)(v6 + 24) = [(NSString *)self->_accessoryType copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_testStatus;
    *(unsigned char *)(v6 + 44) |= 2u;
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
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    testName = self->_testName;
    if (!((unint64_t)testName | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
    {
      accessoryName = self->_accessoryName;
      if (!((unint64_t)accessoryName | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](accessoryName, "isEqual:")) != 0)
      {
        accessoryType = self->_accessoryType;
        if (!((unint64_t)accessoryType | *((void *)a3 + 3))
          || (int v5 = -[NSString isEqual:](accessoryType, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
          if ((*(unsigned char *)&self->_has & 2) != 0)
          {
            if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_testStatus != *((_DWORD *)a3 + 10)) {
              goto LABEL_17;
            }
            LOBYTE(v5) = 1;
          }
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
  NSUInteger v5 = [(NSString *)self->_accessoryName hash];
  NSUInteger v6 = [(NSString *)self->_accessoryType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_testStatus;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDITesterCertTestFinish setTestName:](self, "setTestName:");
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterCertTestFinish setAccessoryName:](self, "setAccessoryName:");
  }
  if (*((void *)a3 + 3)) {
    -[AWDITesterCertTestFinish setAccessoryType:](self, "setAccessoryType:");
  }
  if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    self->_testStatus = *((_DWORD *)a3 + 10);
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

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (unsigned)testStatus
{
  return self->_testStatus;
}

@end
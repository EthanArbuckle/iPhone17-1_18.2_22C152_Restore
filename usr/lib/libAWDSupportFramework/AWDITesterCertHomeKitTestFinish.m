@interface AWDITesterCertHomeKitTestFinish
- (BOOL)hasAccessoryManufacturer;
- (BOOL)hasAccessoryName;
- (BOOL)hasTestErrorDescription;
- (BOOL)hasTestIterations;
- (BOOL)hasTestName;
- (BOOL)hasTestResult;
- (BOOL)hasTestStatus;
- (BOOL)hasTestUUID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessoryManufacturer;
- (NSString)accessoryName;
- (NSString)testErrorDescription;
- (NSString)testName;
- (NSString)testResult;
- (NSString)testStatus;
- (NSString)testUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)testIterations;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryManufacturer:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setHasTestIterations:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestErrorDescription:(id)a3;
- (void)setTestIterations:(unsigned int)a3;
- (void)setTestName:(id)a3;
- (void)setTestResult:(id)a3;
- (void)setTestStatus:(id)a3;
- (void)setTestUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterCertHomeKitTestFinish

- (void)dealloc
{
  [(AWDITesterCertHomeKitTestFinish *)self setAccessoryManufacturer:0];
  [(AWDITesterCertHomeKitTestFinish *)self setAccessoryName:0];
  [(AWDITesterCertHomeKitTestFinish *)self setTestUUID:0];
  [(AWDITesterCertHomeKitTestFinish *)self setTestName:0];
  [(AWDITesterCertHomeKitTestFinish *)self setTestStatus:0];
  [(AWDITesterCertHomeKitTestFinish *)self setTestResult:0];
  [(AWDITesterCertHomeKitTestFinish *)self setTestErrorDescription:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertHomeKitTestFinish;
  [(AWDITesterCertHomeKitTestFinish *)&v3 dealloc];
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

- (BOOL)hasAccessoryManufacturer
{
  return self->_accessoryManufacturer != 0;
}

- (BOOL)hasAccessoryName
{
  return self->_accessoryName != 0;
}

- (BOOL)hasTestUUID
{
  return self->_testUUID != 0;
}

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (BOOL)hasTestStatus
{
  return self->_testStatus != 0;
}

- (void)setTestIterations:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_testIterations = a3;
}

- (void)setHasTestIterations:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestIterations
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasTestResult
{
  return self->_testResult != 0;
}

- (BOOL)hasTestErrorDescription
{
  return self->_testErrorDescription != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertHomeKitTestFinish;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterCertHomeKitTestFinish description](&v3, sel_description), -[AWDITesterCertHomeKitTestFinish dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  accessoryManufacturer = self->_accessoryManufacturer;
  if (accessoryManufacturer) {
    [v3 setObject:accessoryManufacturer forKey:@"accessoryManufacturer"];
  }
  accessoryName = self->_accessoryName;
  if (accessoryName) {
    [v3 setObject:accessoryName forKey:@"accessoryName"];
  }
  testUUID = self->_testUUID;
  if (testUUID) {
    [v3 setObject:testUUID forKey:@"testUUID"];
  }
  testName = self->_testName;
  if (testName) {
    [v3 setObject:testName forKey:@"testName"];
  }
  testStatus = self->_testStatus;
  if (testStatus) {
    [v3 setObject:testStatus forKey:@"testStatus"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_testIterations] forKey:@"testIterations"];
  }
  testResult = self->_testResult;
  if (testResult) {
    [v3 setObject:testResult forKey:@"testResult"];
  }
  testErrorDescription = self->_testErrorDescription;
  if (testErrorDescription) {
    [v3 setObject:testErrorDescription forKey:@"testErrorDescription"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterCertHomeKitTestFinishReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_accessoryManufacturer) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_testUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_testName) {
    PBDataWriterWriteStringField();
  }
  if (self->_testStatus) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_testResult) {
    PBDataWriterWriteStringField();
  }
  if (self->_testErrorDescription)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 80) |= 1u;
  }
  if (self->_accessoryManufacturer) {
    [a3 setAccessoryManufacturer:];
  }
  if (self->_accessoryName) {
    [a3 setAccessoryName:];
  }
  if (self->_testUUID) {
    [a3 setTestUUID:];
  }
  if (self->_testName) {
    [a3 setTestName:];
  }
  if (self->_testStatus) {
    [a3 setTestStatus:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_testIterations;
    *((unsigned char *)a3 + 80) |= 2u;
  }
  if (self->_testResult) {
    [a3 setTestResult:];
  }
  if (self->_testErrorDescription)
  {
    [a3 setTestErrorDescription:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 80) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_accessoryManufacturer copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_accessoryName copyWithZone:a3];

  *(void *)(v6 + 72) = [(NSString *)self->_testUUID copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_testName copyWithZone:a3];

  *(void *)(v6 + 64) = [(NSString *)self->_testStatus copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_testIterations;
    *(unsigned char *)(v6 + 80) |= 2u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_testResult copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_testErrorDescription copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 80))
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    accessoryManufacturer = self->_accessoryManufacturer;
    if (!((unint64_t)accessoryManufacturer | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](accessoryManufacturer, "isEqual:")) != 0)
    {
      accessoryName = self->_accessoryName;
      if (!((unint64_t)accessoryName | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](accessoryName, "isEqual:")) != 0)
      {
        testUUID = self->_testUUID;
        if (!((unint64_t)testUUID | *((void *)a3 + 9))
          || (int v5 = -[NSString isEqual:](testUUID, "isEqual:")) != 0)
        {
          testName = self->_testName;
          if (!((unint64_t)testName | *((void *)a3 + 6))
            || (int v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
          {
            testStatus = self->_testStatus;
            if (!((unint64_t)testStatus | *((void *)a3 + 8))
              || (int v5 = -[NSString isEqual:](testStatus, "isEqual:")) != 0)
            {
              if ((*(unsigned char *)&self->_has & 2) != 0)
              {
                if ((*((unsigned char *)a3 + 80) & 2) == 0 || self->_testIterations != *((_DWORD *)a3 + 10)) {
                  goto LABEL_26;
                }
              }
              else if ((*((unsigned char *)a3 + 80) & 2) != 0)
              {
                goto LABEL_26;
              }
              testResult = self->_testResult;
              if (!((unint64_t)testResult | *((void *)a3 + 7))
                || (int v5 = -[NSString isEqual:](testResult, "isEqual:")) != 0)
              {
                testErrorDescription = self->_testErrorDescription;
                if ((unint64_t)testErrorDescription | *((void *)a3 + 4))
                {
                  LOBYTE(v5) = -[NSString isEqual:](testErrorDescription, "isEqual:");
                }
                else
                {
                  LOBYTE(v5) = 1;
                }
              }
            }
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
  NSUInteger v4 = [(NSString *)self->_accessoryManufacturer hash];
  NSUInteger v5 = [(NSString *)self->_accessoryName hash];
  NSUInteger v6 = [(NSString *)self->_testUUID hash];
  NSUInteger v7 = [(NSString *)self->_testName hash];
  NSUInteger v8 = [(NSString *)self->_testStatus hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_testIterations;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v11 = [(NSString *)self->_testResult hash];
  return v10 ^ v11 ^ [(NSString *)self->_testErrorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 80))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterCertHomeKitTestFinish setAccessoryManufacturer:](self, "setAccessoryManufacturer:");
  }
  if (*((void *)a3 + 3)) {
    -[AWDITesterCertHomeKitTestFinish setAccessoryName:](self, "setAccessoryName:");
  }
  if (*((void *)a3 + 9)) {
    -[AWDITesterCertHomeKitTestFinish setTestUUID:](self, "setTestUUID:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDITesterCertHomeKitTestFinish setTestName:](self, "setTestName:");
  }
  if (*((void *)a3 + 8)) {
    -[AWDITesterCertHomeKitTestFinish setTestStatus:](self, "setTestStatus:");
  }
  if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
    self->_testIterations = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDITesterCertHomeKitTestFinish setTestResult:](self, "setTestResult:");
  }
  if (*((void *)a3 + 4))
  {
    -[AWDITesterCertHomeKitTestFinish setTestErrorDescription:](self, "setTestErrorDescription:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryManufacturer:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)testUUID
{
  return self->_testUUID;
}

- (void)setTestUUID:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSString)testStatus
{
  return self->_testStatus;
}

- (void)setTestStatus:(id)a3
{
}

- (unsigned)testIterations
{
  return self->_testIterations;
}

- (NSString)testResult
{
  return self->_testResult;
}

- (void)setTestResult:(id)a3
{
}

- (NSString)testErrorDescription
{
  return self->_testErrorDescription;
}

- (void)setTestErrorDescription:(id)a3
{
}

@end
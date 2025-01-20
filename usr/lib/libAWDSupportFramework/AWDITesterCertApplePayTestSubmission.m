@interface AWDITesterCertApplePayTestSubmission
- (BOOL)hasAccessoryName;
- (BOOL)hasTestName;
- (BOOL)hasTestUUID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessoryName;
- (NSString)testName;
- (NSString)testUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setTestUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterCertApplePayTestSubmission

- (void)dealloc
{
  [(AWDITesterCertApplePayTestSubmission *)self setAccessoryName:0];
  [(AWDITesterCertApplePayTestSubmission *)self setTestUUID:0];
  [(AWDITesterCertApplePayTestSubmission *)self setTestName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertApplePayTestSubmission;
  [(AWDITesterCertApplePayTestSubmission *)&v3 dealloc];
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertApplePayTestSubmission;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterCertApplePayTestSubmission description](&v3, sel_description), -[AWDITesterCertApplePayTestSubmission dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterCertApplePayTestSubmissionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_testUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_testName)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_accessoryName) {
    [a3 setAccessoryName:];
  }
  if (self->_testUUID) {
    [a3 setTestUUID:];
  }
  if (self->_testName)
  {
    [a3 setTestName:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_accessoryName copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_testUUID copyWithZone:a3];

  *(void *)(v6 + 24) = [(NSString *)self->_testName copyWithZone:a3];
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
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    accessoryName = self->_accessoryName;
    if (!((unint64_t)accessoryName | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](accessoryName, "isEqual:")) != 0)
    {
      testUUID = self->_testUUID;
      if (!((unint64_t)testUUID | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](testUUID, "isEqual:")) != 0)
      {
        testName = self->_testName;
        if ((unint64_t)testName | *((void *)a3 + 3))
        {
          LOBYTE(v5) = -[NSString isEqual:](testName, "isEqual:");
        }
        else
        {
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
  NSUInteger v4 = [(NSString *)self->_accessoryName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_testUUID hash];
  return v4 ^ v5 ^ [(NSString *)self->_testName hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterCertApplePayTestSubmission setAccessoryName:](self, "setAccessoryName:");
  }
  if (*((void *)a3 + 4)) {
    -[AWDITesterCertApplePayTestSubmission setTestUUID:](self, "setTestUUID:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDITesterCertApplePayTestSubmission setTestName:](self, "setTestName:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
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

@end
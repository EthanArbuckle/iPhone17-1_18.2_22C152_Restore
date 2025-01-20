@interface AWDITesterTestStart
- (BOOL)hasTestName;
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
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUniqueKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterTestStart

- (void)dealloc
{
  [(AWDITesterTestStart *)self setTestName:0];
  [(AWDITesterTestStart *)self setUniqueKey:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestStart;
  [(AWDITesterTestStart *)&v3 dealloc];
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestStart;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterTestStart description](&v3, sel_description), -[AWDITesterTestStart dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_testName) {
    PBDataWriterWriteStringField();
  }
  if (self->_uniqueKey)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_testName) {
    [a3 setTestName:];
  }
  if (self->_uniqueKey)
  {
    [a3 setUniqueKey:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_testName copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_uniqueKey copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    testName = self->_testName;
    if (!((unint64_t)testName | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
    {
      uniqueKey = self->_uniqueKey;
      if ((unint64_t)uniqueKey | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](uniqueKey, "isEqual:");
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
  NSUInteger v4 = [(NSString *)self->_testName hash] ^ v3;
  return v4 ^ [(NSString *)self->_uniqueKey hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterTestStart setTestName:](self, "setTestName:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDITesterTestStart setUniqueKey:](self, "setUniqueKey:");
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

@end
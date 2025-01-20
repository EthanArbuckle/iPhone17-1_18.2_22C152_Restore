@interface AWDITesterTestShare
- (BOOL)hasShareMethod;
- (BOOL)hasShareOption;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)shareMethod;
- (NSString)shareOption;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setShareMethod:(id)a3;
- (void)setShareOption:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterTestShare

- (void)dealloc
{
  [(AWDITesterTestShare *)self setShareMethod:0];
  [(AWDITesterTestShare *)self setShareOption:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestShare;
  [(AWDITesterTestShare *)&v3 dealloc];
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

- (BOOL)hasShareMethod
{
  return self->_shareMethod != 0;
}

- (BOOL)hasShareOption
{
  return self->_shareOption != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestShare;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterTestShare description](&v3, sel_description), -[AWDITesterTestShare dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  shareMethod = self->_shareMethod;
  if (shareMethod) {
    [v3 setObject:shareMethod forKey:@"shareMethod"];
  }
  shareOption = self->_shareOption;
  if (shareOption) {
    [v3 setObject:shareOption forKey:@"shareOption"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestShareReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_shareMethod) {
    PBDataWriterWriteStringField();
  }
  if (self->_shareOption)
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
  if (self->_shareMethod) {
    [a3 setShareMethod:];
  }
  if (self->_shareOption)
  {
    [a3 setShareOption:];
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

  *(void *)(v6 + 16) = [(NSString *)self->_shareMethod copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_shareOption copyWithZone:a3];
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
    shareMethod = self->_shareMethod;
    if (!((unint64_t)shareMethod | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](shareMethod, "isEqual:")) != 0)
    {
      shareOption = self->_shareOption;
      if ((unint64_t)shareOption | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](shareOption, "isEqual:");
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
  NSUInteger v4 = [(NSString *)self->_shareMethod hash] ^ v3;
  return v4 ^ [(NSString *)self->_shareOption hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDITesterTestShare setShareMethod:](self, "setShareMethod:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDITesterTestShare setShareOption:](self, "setShareOption:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)shareMethod
{
  return self->_shareMethod;
}

- (void)setShareMethod:(id)a3
{
}

- (NSString)shareOption
{
  return self->_shareOption;
}

- (void)setShareOption:(id)a3
{
}

@end
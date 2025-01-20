@interface AWDBltUIBuildSuccess
- (BOOL)hasSectionid;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSectionid:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBltUIBuildSuccess

- (void)dealloc
{
  [(AWDBltUIBuildSuccess *)self setSectionid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDBltUIBuildSuccess;
  [(AWDBltUIBuildSuccess *)&v3 dealloc];
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

- (BOOL)hasSectionid
{
  return self->_sectionid != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDBltUIBuildSuccess;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDBltUIBuildSuccess description](&v3, sel_description), -[AWDBltUIBuildSuccess dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  sectionid = self->_sectionid;
  if (sectionid) {
    [v3 setObject:sectionid forKey:@"sectionid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBltUIBuildSuccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_sectionid)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  sectionid = self->_sectionid;
  if (sectionid) {
    [a3 setSectionid:sectionid];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }

  v6[2] = [(NSString *)self->_sectionid copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    sectionid = self->_sectionid;
    if ((unint64_t)sectionid | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSString isEqual:](sectionid, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSString *)self->_sectionid hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDBltUIBuildSuccess setSectionid:](self, "setSectionid:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sectionid
{
  return self->_sectionid;
}

- (void)setSectionid:(id)a3
{
}

@end
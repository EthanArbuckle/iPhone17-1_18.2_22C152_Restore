@interface AWDCpuLoad
- (BOOL)hasDuration;
- (BOOL)hasProcName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)procName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)duration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setProcName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCpuLoad

- (void)dealloc
{
  [(AWDCpuLoad *)self setProcName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCpuLoad;
  [(AWDCpuLoad *)&v3 dealloc];
}

- (BOOL)hasProcName
{
  return self->_procName != 0;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCpuLoad;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCpuLoad description](&v3, sel_description), -[AWDCpuLoad dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  procName = self->_procName;
  if (procName) {
    [v3 setObject:procName forKey:@"procName"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCpuLoadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_procName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_procName) {
    [a3 setProcName:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_duration;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_procName copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    procName = self->_procName;
    if (!((unint64_t)procName | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](procName, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_duration == *((_DWORD *)a3 + 2);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_procName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_duration;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDCpuLoad setProcName:](self, "setProcName:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_duration = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)procName
{
  return self->_procName;
}

- (void)setProcName:(id)a3
{
}

- (unsigned)duration
{
  return self->_duration;
}

@end
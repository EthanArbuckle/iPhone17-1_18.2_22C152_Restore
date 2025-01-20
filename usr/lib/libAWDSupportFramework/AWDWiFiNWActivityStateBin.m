@interface AWDWiFiNWActivityStateBin
- (BOOL)hasResidentTime;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)residentTime;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasResidentTime:(BOOL)a3;
- (void)setResidentTime:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityStateBin

- (void)dealloc
{
  [(AWDWiFiNWActivityStateBin *)self setState:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityStateBin;
  [(AWDWiFiNWActivityStateBin *)&v3 dealloc];
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (void)setResidentTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_residentTime = a3;
}

- (void)setHasResidentTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResidentTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityStateBin;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityStateBin description](&v3, sel_description), -[AWDWiFiNWActivityStateBin dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  state = self->_state;
  if (state) {
    [v3 setObject:state forKey:@"state"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_residentTime] forKey:@"residentTime"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityStateBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_state) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_state) {
    [a3 setState:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_residentTime;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_state copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_residentTime;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    state = self->_state;
    if (!((unint64_t)state | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](state, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_residentTime == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_state hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_residentTime;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDWiFiNWActivityStateBin setState:](self, "setState:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_residentTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (unint64_t)residentTime
{
  return self->_residentTime;
}

@end
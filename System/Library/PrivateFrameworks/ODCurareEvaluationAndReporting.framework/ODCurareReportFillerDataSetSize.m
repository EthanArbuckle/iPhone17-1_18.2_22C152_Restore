@interface ODCurareReportFillerDataSetSize
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)numberOfUserSamples;
- (unsigned)numberOfUserSessions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNumberOfUserSamples:(unsigned int)a3;
- (void)setNumberOfUserSessions:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerDataSetSize

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerDataSetSize;
  v4 = [(ODCurareReportFillerDataSetSize *)&v8 description];
  v5 = [(ODCurareReportFillerDataSetSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_numberOfUserSessions];
  [v3 setObject:v4 forKey:@"numberOfUserSessions"];

  v5 = [NSNumber numberWithUnsignedInt:self->_numberOfUserSamples];
  [v3 setObject:v5 forKey:@"numberOfUserSamples"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_numberOfUserSessions;
  *((_DWORD *)a3 + 2) = self->_numberOfUserSamples;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_numberOfUserSessions;
  *((_DWORD *)result + 2) = self->_numberOfUserSamples;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_numberOfUserSessions == v4[3]
    && self->_numberOfUserSamples == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_numberOfUserSamples) ^ (2654435761 * self->_numberOfUserSessions);
}

- (void)mergeFrom:(id)a3
{
  self->_numberOfUserSessions = *((_DWORD *)a3 + 3);
  self->_numberOfUserSamples = *((_DWORD *)a3 + 2);
}

- (unsigned)numberOfUserSessions
{
  return self->_numberOfUserSessions;
}

- (void)setNumberOfUserSessions:(unsigned int)a3
{
  self->_numberOfUserSessions = a3;
}

- (unsigned)numberOfUserSamples
{
  return self->_numberOfUserSamples;
}

- (void)setNumberOfUserSamples:(unsigned int)a3
{
  self->_numberOfUserSamples = a3;
}

@end
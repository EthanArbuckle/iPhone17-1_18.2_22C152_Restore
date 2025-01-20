@interface AWDMPTCPSubflowSwitchingReport
- (BOOL)hasSwitchCount;
- (BOOL)hasSwitchFromInterfaceName;
- (BOOL)hasSwitchToInterfaceName;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)switchFromInterfaceName;
- (NSString)switchToInterfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)switchCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasSwitchCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSwitchCount:(int)a3;
- (void)setSwitchFromInterfaceName:(id)a3;
- (void)setSwitchToInterfaceName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMPTCPSubflowSwitchingReport

- (void)dealloc
{
  [(AWDMPTCPSubflowSwitchingReport *)self setSwitchFromInterfaceName:0];
  [(AWDMPTCPSubflowSwitchingReport *)self setSwitchToInterfaceName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPSubflowSwitchingReport;
  [(AWDMPTCPSubflowSwitchingReport *)&v3 dealloc];
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

- (BOOL)hasSwitchFromInterfaceName
{
  return self->_switchFromInterfaceName != 0;
}

- (BOOL)hasSwitchToInterfaceName
{
  return self->_switchToInterfaceName != 0;
}

- (void)setSwitchCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_switchCount = a3;
}

- (void)setHasSwitchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSwitchCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPSubflowSwitchingReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMPTCPSubflowSwitchingReport description](&v3, sel_description), -[AWDMPTCPSubflowSwitchingReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  switchFromInterfaceName = self->_switchFromInterfaceName;
  if (switchFromInterfaceName) {
    [v3 setObject:switchFromInterfaceName forKey:@"switch_from_interface_name"];
  }
  switchToInterfaceName = self->_switchToInterfaceName;
  if (switchToInterfaceName) {
    [v3 setObject:switchToInterfaceName forKey:@"switch_to_interface_name"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_switchCount] forKey:@"switch_count"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPSubflowSwitchingReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_switchFromInterfaceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_switchToInterfaceName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_switchFromInterfaceName) {
    [a3 setSwitchFromInterfaceName:];
  }
  if (self->_switchToInterfaceName) {
    [a3 setSwitchToInterfaceName:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_switchCount;
    *((unsigned char *)a3 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_switchFromInterfaceName copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_switchToInterfaceName copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_switchCount;
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
    switchFromInterfaceName = self->_switchFromInterfaceName;
    if (!((unint64_t)switchFromInterfaceName | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](switchFromInterfaceName, "isEqual:")) != 0)
    {
      switchToInterfaceName = self->_switchToInterfaceName;
      if (!((unint64_t)switchToInterfaceName | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](switchToInterfaceName, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 2) == 0;
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_switchCount != *((_DWORD *)a3 + 4)) {
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
  NSUInteger v4 = [(NSString *)self->_switchFromInterfaceName hash];
  NSUInteger v5 = [(NSString *)self->_switchToInterfaceName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_switchCount;
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
  if (*((void *)a3 + 3)) {
    -[AWDMPTCPSubflowSwitchingReport setSwitchFromInterfaceName:](self, "setSwitchFromInterfaceName:");
  }
  if (*((void *)a3 + 4)) {
    -[AWDMPTCPSubflowSwitchingReport setSwitchToInterfaceName:](self, "setSwitchToInterfaceName:");
  }
  if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    self->_switchCount = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)switchFromInterfaceName
{
  return self->_switchFromInterfaceName;
}

- (void)setSwitchFromInterfaceName:(id)a3
{
}

- (NSString)switchToInterfaceName
{
  return self->_switchToInterfaceName;
}

- (void)setSwitchToInterfaceName:(id)a3
{
}

- (int)switchCount
{
  return self->_switchCount;
}

@end
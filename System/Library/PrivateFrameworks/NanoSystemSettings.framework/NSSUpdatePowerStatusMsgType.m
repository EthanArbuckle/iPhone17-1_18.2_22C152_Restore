@interface NSSUpdatePowerStatusMsgType
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)notificationType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNotificationType:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUpdatePowerStatusMsgType

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUpdatePowerStatusMsgType;
  v4 = [(NSSUpdatePowerStatusMsgType *)&v8 description];
  v5 = [(NSSUpdatePowerStatusMsgType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_notificationType];
  [v3 setObject:v4 forKey:@"notificationType"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUpdatePowerStatusMsgTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_notificationType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_notificationType;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_notificationType == v4[1];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761u * self->_notificationType;
}

- (void)mergeFrom:(id)a3
{
  self->_notificationType = *((void *)a3 + 1);
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

@end
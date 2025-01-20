@interface PUProtoSetShouldNotifyNextUnlock
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldNotify;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setShouldNotify:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PUProtoSetShouldNotifyNextUnlock

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUProtoSetShouldNotifyNextUnlock;
  v3 = [(PUProtoSetShouldNotifyNextUnlock *)&v7 description];
  v4 = [(PUProtoSetShouldNotifyNextUnlock *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_shouldNotify];
  [v3 setObject:v4 forKey:@"shouldNotify"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PUProtoSetShouldNotifyNextUnlockReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 8) = self->_shouldNotify;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_shouldNotify;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (self->_shouldNotify) {
      BOOL v5 = v4[8] != 0;
    }
    else {
      BOOL v5 = v4[8] == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_shouldNotify;
}

- (void)mergeFrom:(id)a3
{
  self->_shouldNotify = *((unsigned char *)a3 + 8);
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

@end
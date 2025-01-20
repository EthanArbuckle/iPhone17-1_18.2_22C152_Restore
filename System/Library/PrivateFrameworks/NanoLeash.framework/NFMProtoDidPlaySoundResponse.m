@interface NFMProtoDidPlaySoundResponse
- (BOOL)didPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)setDidPlay:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NFMProtoDidPlaySoundResponse

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NFMProtoDidPlaySoundResponse;
  v4 = [(NFMProtoDidPlaySoundResponse *)&v8 description];
  v5 = [(NFMProtoDidPlaySoundResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithBool:self->_didPlay];
  [v3 setObject:v4 forKey:@"didPlay"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NFMProtoDidPlaySoundResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 8) = self->_didPlay;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_didPlay;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_didPlay == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_didPlay;
}

- (BOOL)didPlay
{
  return self->_didPlay;
}

- (void)setDidPlay:(BOOL)a3
{
  self->_didPlay = a3;
}

@end
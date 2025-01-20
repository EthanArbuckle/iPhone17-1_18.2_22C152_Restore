@interface NRPBPairingModeResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPairingModeResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBPairingModeResponse;
  v3 = [(NRPBPairingModeResponse *)&v7 description];
  v4 = [(NRPBPairingModeResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_success];
  [v3 setObject:v4 forKey:@"success"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100023108((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_success;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (self->_success) {
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
  return 2654435761 * self->_success;
}

@end
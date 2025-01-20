@interface PBBProtoTinkerFitnessRouteTrackingEnabled
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoTinkerFitnessRouteTrackingEnabled

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTinkerFitnessRouteTrackingEnabled;
  v4 = [(PBBProtoTinkerFitnessRouteTrackingEnabled *)&v8 description];
  v5 = [(PBBProtoTinkerFitnessRouteTrackingEnabled *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v4 forKey:@"enabled"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTinkerFitnessRouteTrackingEnabledReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 8) = self->_enabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_enabled;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (self->_enabled) {
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
  return 2654435761 * self->_enabled;
}

- (void)mergeFrom:(id)a3
{
  self->_enabled = *((unsigned char *)a3 + 8);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
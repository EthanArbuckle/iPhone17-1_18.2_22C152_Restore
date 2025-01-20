@interface SISensitiveConditionsSet
+ (id)fromDeviceSensitivityState:(int)a3;
- (BOOL)intersectsWith:(id)a3;
- (BOOL)isDeviceSensitivityStateSet:(int)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConditionsSet:(id)a3;
- (SISensitiveConditionsSet)init;
- (SISensitiveConditionsSet)initWithBitMask:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)differenceSetFrom:(id)a3;
- (id)intersectionSetWith:(id)a3;
- (id)unionSetWith:(id)a3;
- (unint64_t)hash;
- (void)addDeviceSensitivityState:(int)a3;
- (void)removeConditions:(id)a3;
- (void)removeDeviceSensitivityState:(int)a3;
@end

@implementation SISensitiveConditionsSet

- (unint64_t)hash
{
  return self->_bitmask;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SISensitiveConditionsSet *)self isEqualToConditionsSet:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SISensitiveConditionsSet alloc];
  unint64_t bitmask = self->_bitmask;
  return [(SISensitiveConditionsSet *)v4 initWithBitMask:bitmask];
}

- (id)intersectionSetWith:(id)a3
{
  v3 = [[SISensitiveConditionsSet alloc] initWithBitMask:*((void *)a3 + 1) & self->_bitmask];
  return v3;
}

- (id)differenceSetFrom:(id)a3
{
  v3 = [[SISensitiveConditionsSet alloc] initWithBitMask:self->_bitmask & ~*((void *)a3 + 1)];
  return v3;
}

- (id)unionSetWith:(id)a3
{
  v3 = [[SISensitiveConditionsSet alloc] initWithBitMask:*((void *)a3 + 1) | self->_bitmask];
  return v3;
}

- (BOOL)isEqualToConditionsSet:(id)a3
{
  return self->_bitmask == *((void *)a3 + 1);
}

- (BOOL)intersectsWith:(id)a3
{
  return (*((void *)a3 + 1) & self->_bitmask) != 0;
}

- (BOOL)isEmpty
{
  return self->_bitmask == 0;
}

- (BOOL)isDeviceSensitivityStateSet:(int)a3
{
  return ((1 << a3) & ~self->_bitmask) == 0;
}

- (void)removeDeviceSensitivityState:(int)a3
{
  self->_bitmask &= ~(1 << a3);
}

- (void)addDeviceSensitivityState:(int)a3
{
  self->_bitmask |= 1 << a3;
}

- (void)removeConditions:(id)a3
{
  self->_bitmask &= ~*((void *)a3 + 1);
}

- (SISensitiveConditionsSet)initWithBitMask:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SISensitiveConditionsSet;
  result = [(SISensitiveConditionsSet *)&v5 init];
  if (result) {
    result->_unint64_t bitmask = a3;
  }
  return result;
}

- (SISensitiveConditionsSet)init
{
  return [(SISensitiveConditionsSet *)self initWithBitMask:0];
}

+ (id)fromDeviceSensitivityState:(int)a3
{
  v3 = [[SISensitiveConditionsSet alloc] initWithBitMask:1 << a3];
  return v3;
}

@end
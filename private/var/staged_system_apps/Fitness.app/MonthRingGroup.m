@interface MonthRingGroup
- (double)additionalSpacing;
- (double)backingOriginOffset;
- (void)setAdditionalSpacing:(double)a3;
- (void)setBackingOriginOffset:(double)a3;
@end

@implementation MonthRingGroup

- (double)backingOriginOffset
{
  return self->_backingOriginOffset;
}

- (void)setBackingOriginOffset:(double)a3
{
  self->_backingOriginOffset = a3;
}

- (double)additionalSpacing
{
  return self->_additionalSpacing;
}

- (void)setAdditionalSpacing:(double)a3
{
  self->_additionalSpacing = a3;
}

@end
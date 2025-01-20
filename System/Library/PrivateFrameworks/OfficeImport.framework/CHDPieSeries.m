@interface CHDPieSeries
- (CHDPieSeries)init;
- (id)shallowCopy;
- (int)explosion;
- (void)setExplosion:(int)a3;
@end

@implementation CHDPieSeries

- (void)setExplosion:(int)a3
{
  *(_DWORD *)(&self->super.mHiddenFlag + 3) = a3;
}

- (id)shallowCopy
{
  v5.receiver = self;
  v5.super_class = (Class)CHDPieSeries;
  v3 = [(CHDSeries *)&v5 shallowCopy];
  [v3 setExplosion:*(unsigned int *)(&self->super.mHiddenFlag + 3)];
  return v3;
}

- (int)explosion
{
  return *(_DWORD *)(&self->super.mHiddenFlag + 3);
}

- (CHDPieSeries)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDPieSeries;
  result = [(CHDPieSeries *)&v3 init];
  if (result) {
    *(_DWORD *)(&result->super.mHiddenFlag + 3) = 0;
  }
  return result;
}

@end
@interface CHDLineSeries
- (BOOL)isSmooth;
- (CHDLineSeries)initWithChart:(id)a3;
- (id)marker;
- (void)setMarker:(id)a3;
- (void)setSmooth:(BOOL)a3;
@end

@implementation CHDLineSeries

- (CHDLineSeries)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDLineSeries;
  result = [(CHDSeries *)&v4 initWithChart:a3];
  if (result) {
    result->mSmooth = 0;
  }
  return result;
}

- (void)setSmooth:(BOOL)a3
{
  self->mSmooth = a3;
}

- (void)setMarker:(id)a3
{
  v5 = (CHDMarker *)a3;
  if (self->mMarker != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mMarker, a3);
    v5 = v6;
  }
}

- (id)marker
{
  return self->mMarker;
}

- (BOOL)isSmooth
{
  return self->mSmooth;
}

- (void).cxx_destruct
{
}

@end
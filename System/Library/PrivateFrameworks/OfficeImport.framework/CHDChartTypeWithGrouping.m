@interface CHDChartTypeWithGrouping
- (BOOL)isGroupingStacked;
- (CHDChartTypeWithGrouping)initWithChart:(id)a3;
- (id)chdGroupingString;
- (int)grouping;
- (void)setGrouping:(int)a3;
@end

@implementation CHDChartTypeWithGrouping

- (CHDChartTypeWithGrouping)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDChartTypeWithGrouping;
  result = [(CHDChartType *)&v4 initWithChart:a3];
  if (result) {
    *((_DWORD *)&result->super.mVaryColors + 1) = 3;
  }
  return result;
}

- (BOOL)isGroupingStacked
{
  return (*((_DWORD *)&self->super.mVaryColors + 1) - 1) < 2;
}

- (int)grouping
{
  return *((_DWORD *)&self->super.mVaryColors + 1);
}

- (void)setGrouping:(int)a3
{
  *((_DWORD *)&self->super.mVaryColors + 1) = a3;
}

- (id)chdGroupingString
{
  uint64_t v2 = *((int *)&self->super.mVaryColors + 1);
  if (v2 > 3) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D67C38[v2];
  }
}

@end
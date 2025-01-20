@interface OIRenderLegendForSeriesInChart
@end

@implementation OIRenderLegendForSeriesInChart

double ___OIRenderLegendForSeriesInChart_block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  if (*(unsigned char *)(a1 + 120)) {
    double v2 = *(double *)(a1 + 96)
  }
       + v1
       + *(double *)(a1 + 48) * 0.5
       - *(double *)(a1 + 64) * ((double)(*(void *)(a1 + 80) / 2 - *(void *)(a1 + 88)) + -0.5);
  else {
    double v2 = *(double *)(a1 + 96) + v1 + *(double *)(a1 + 64) * (double)*(uint64_t *)(a1 + 88);
  }
  return floor(v2 + 4.0) + 0.5;
}

@end
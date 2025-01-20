@interface NSString(PFTTMLTypes)
- (double)intervalFromTimecode;
@end

@implementation NSString(PFTTMLTypes)

- (double)intervalFromTimecode
{
  v1 = (char *)[a1 cStringUsingEncoding:4];
  int v2 = 0;
  v3 = &v1[strlen(v1)];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  while (v1 < v3)
  {
    int64_t v7 = v3 - v1;
    while (1)
    {
      int v8 = *v1;
      unsigned int v9 = (v8 - 45);
      unsigned int v10 = v8 - 48;
      if (v9 < 2 || v10 < 0xA) {
        break;
      }
      ++v1;
      if (!--v7) {
        goto LABEL_16;
      }
    }
    v15 = 0;
    double v12 = strtod(v1, &v15);
    double v13 = INFINITY;
    if (fabs(v12) == INFINITY) {
      return v13;
    }
    v1 = v15;
    if (v2)
    {
      double v4 = v5;
      double v5 = v6;
    }
    ++v2;
    double v6 = v12;
    if (v2 == 3) {
      return v12 + v5 * 60.0 + v4 * 60.0 * 60.0;
    }
  }
LABEL_16:
  double v12 = v6;
  return v12 + v5 * 60.0 + v4 * 60.0 * 60.0;
}

@end
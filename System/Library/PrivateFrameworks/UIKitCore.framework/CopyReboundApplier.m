@interface CopyReboundApplier
@end

@implementation CopyReboundApplier

void ___CopyReboundApplier_block_invoke(double a1, uint64_t a2, double *a3, double *a4, double *a5)
{
  double v5 = a3[2];
  double v6 = a3[3];
  BOOL v7 = v6 < a1;
  if (v5 > a1 || v6 < a1)
  {
    if (v5 > a1) {
      goto LABEL_9;
    }
  }
  else
  {
    double v9 = vabdd_f64(*a5, v5);
    double v10 = vabdd_f64(*a5, v6);
    BOOL v7 = v9 > v10;
    if (v9 < v10)
    {
LABEL_9:
      double v11 = *a4;
      if (*a4 > 0.0) {
        goto LABEL_12;
      }
    }
  }
  if (!v7 || (double v11 = *a4, *a4 >= 0.0))
  {
    double v12 = a3[1];
    goto LABEL_14;
  }
LABEL_12:
  *a4 = -v11;
  double v12 = a3[1] + a3[1] - *a5;
LABEL_14:
  *a5 = v12;
}

@end
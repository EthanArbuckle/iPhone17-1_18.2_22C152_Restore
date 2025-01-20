@interface UIDragAndDropPlatformMetrics
@end

@implementation UIDragAndDropPlatformMetrics

id __37___UIDragAndDropPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[UIView _outlinePath](v2);
  }

  return v6;
}

@end
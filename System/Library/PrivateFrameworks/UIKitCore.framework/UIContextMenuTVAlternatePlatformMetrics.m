@interface UIContextMenuTVAlternatePlatformMetrics
@end

@implementation UIContextMenuTVAlternatePlatformMetrics

id __48___UIContextMenuTVAlternatePlatformMetrics_init__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 0xD) != 0)
  {
    v2 = +[UIColor labelColor];
    v3 = [v2 colorWithAlphaComponent:0.05];
  }
  else
  {
    v3 = +[UIColor clearColor];
  }
  return v3;
}

@end
@interface SKUISystemCombinedIndexBarEntry
+ (double)_dotDiameter;
- (CGSize)_calculatedContentSize;
- (SKUISystemCombinedIndexBarEntry)init;
- (void)_drawContentInRect:(CGRect)a3;
- (void)init;
@end

@implementation SKUISystemCombinedIndexBarEntry

- (SKUISystemCombinedIndexBarEntry)init
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUISystemCombinedIndexBarEntry *)v3 init];
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISystemCombinedIndexBarEntry;
  v11 = [(SKUISystemCombinedIndexBarEntry *)&v14 init];
  v12 = v11;
  if (v11) {
    [(SKUIIndexBarEntry *)v11 setEntryType:3];
  }
  return v12;
}

- (CGSize)_calculatedContentSize
{
  [(id)objc_opt_class() _dotDiameter];
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(SKUIIndexBarEntry *)self tintColor];
  [v7 setFill];

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fill];
}

+ (double)_dotDiameter
{
  return 4.0;
}

- (void)init
{
}

@end
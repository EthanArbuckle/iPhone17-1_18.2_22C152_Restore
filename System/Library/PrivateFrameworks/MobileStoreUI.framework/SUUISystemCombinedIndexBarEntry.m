@interface SUUISystemCombinedIndexBarEntry
+ (double)_dotDiameter;
- (CGSize)_calculatedContentSize;
- (SUUISystemCombinedIndexBarEntry)init;
- (void)_drawContentInRect:(CGRect)a3;
@end

@implementation SUUISystemCombinedIndexBarEntry

- (SUUISystemCombinedIndexBarEntry)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISystemCombinedIndexBarEntry;
  v2 = [(SUUISystemCombinedIndexBarEntry *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUUIIndexBarEntry *)v2 setEntryType:3];
  }
  return v3;
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
  v7 = [(SUUIIndexBarEntry *)self tintColor];
  [v7 setFill];

  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", x, y, width, height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fill];
}

+ (double)_dotDiameter
{
  return 4.0;
}

@end
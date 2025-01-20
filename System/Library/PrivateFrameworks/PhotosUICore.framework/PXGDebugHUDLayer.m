@interface PXGDebugHUDLayer
- (CGColor)green;
- (CGColor)red;
- (CGColor)yellow;
- (NSArray)graphLayers;
- (PXGDebugHUDLayer)init;
- (void)dealloc;
- (void)setFrame:(CGRect)a3;
- (void)setGraphLayers:(id)a3;
- (void)setGreen:(CGColor *)a3;
- (void)setRed:(CGColor *)a3;
- (void)setYellow:(CGColor *)a3;
- (void)updateDebugHUDWithStats:(id *)a3;
- (void)updateLayerAtIndex:(int64_t)a3 time:(double)a4 redZone:(double)a5 yellowZone:(double)a6;
@end

@implementation PXGDebugHUDLayer

- (void).cxx_destruct
{
}

- (void)setRed:(CGColor *)a3
{
  self->_red = a3;
}

- (CGColor)red
{
  return self->_red;
}

- (void)setYellow:(CGColor *)a3
{
  self->_yellow = a3;
}

- (CGColor)yellow
{
  return self->_yellow;
}

- (void)setGreen:(CGColor *)a3
{
  self->_green = a3;
}

- (CGColor)green
{
  return self->_green;
}

- (void)setGraphLayers:(id)a3
{
}

- (NSArray)graphLayers
{
  return self->_graphLayers;
}

- (void)dealloc
{
  CGColorRelease(self->_green);
  CGColorRelease(self->_yellow);
  CGColorRelease(self->_red);
  v3.receiver = self;
  v3.super_class = (Class)PXGDebugHUDLayer;
  [(PXGDebugHUDLayer *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGDebugHUDLayer;
  -[PXGDebugHUDLayer setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, 100.0, 90.0);
}

- (void)updateLayerAtIndex:(int64_t)a3 time:(double)a4 redZone:(double)a5 yellowZone:(double)a6
{
  v11 = [(PXGDebugHUDLayer *)self graphLayers];
  id v14 = [v11 objectAtIndexedSubscript:a3];

  if (a4 <= a5)
  {
    if (a4 <= a6)
    {
      v12 = &OBJC_IVAR___PXGDebugHUDLayer__green;
      double v13 = 40.0;
    }
    else
    {
      v12 = &OBJC_IVAR___PXGDebugHUDLayer__yellow;
      double v13 = 26.6666667;
    }
  }
  else
  {
    v12 = &OBJC_IVAR___PXGDebugHUDLayer__red;
    double v13 = 13.3333333;
  }
  [v14 setBackgroundColor:*(Class *)((char *)&self->super.super.isa + *v12)];
  objc_msgSend(v14, "setFrame:", 55.0, (double)a3 * 12.0 + 4.0, v13, 5.0);
}

- (void)updateDebugHUDWithStats:(id *)a3
{
  v5 = [off_1E5DA9658 sharedInstance];
  -[PXGDebugHUDLayer setHidden:](self, "setHidden:", [v5 wantsStatsDebugHUD] ^ 1);

  v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v7 = [v6 maximumFramesPerSecond];

  for (uint64_t i = 0; i != 6; ++i)
    [(PXGDebugHUDLayer *)self updateLayerAtIndex:i time:a3->var0[i] redZone:0.8 / (double)v7 / 6.0 yellowZone:0.5 / (double)v7 / 6.0];
  uint64_t v9 = 0;
  double v10 = 0.0;
  do
    double v10 = v10 + a3->var0[v9++];
  while (v9 != 6);
  [(PXGDebugHUDLayer *)self updateLayerAtIndex:6 time:v10 redZone:0.8 / (double)v7 yellowZone:0.5 / (double)v7];
}

- (PXGDebugHUDLayer)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PXGDebugHUDLayer;
  v2 = [(PXGDebugHUDLayer *)&v19 init];
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1AB35AA68;
    long long v27 = unk_1AB35AA78;
    v2->_green = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v24 = xmmword_1AB35AA88;
    long long v25 = unk_1AB35AA98;
    v2->_yellow = CGColorCreate(DeviceRGB, v24);
    *(_OWORD *)v22 = xmmword_1AB35AAA8;
    long long v23 = unk_1AB35AAB8;
    v2->_red = CGColorCreate(DeviceRGB, v22);
    -[PXGDebugHUDLayer setFrame:](v2, "setFrame:", 0.0, 0.0, 100.0, 90.0);
    [(PXGDebugHUDLayer *)v2 setZPosition:10000.0];
    [(PXGDebugHUDLayer *)v2 setShouldRasterize:1];
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    double v6 = v5;

    [(PXGDebugHUDLayer *)v2 setRasterizationScale:v6];
    *(_OWORD *)v20 = xmmword_1AB35B110;
    long long v21 = unk_1AB35B120;
    uint64_t v7 = CGColorCreate(DeviceRGB, v20);
    [(PXGDebugHUDLayer *)v2 setBackgroundColor:v7];
    CGColorRelease(v7);
    CGColorSpaceRelease(DeviceRGB);
    v8 = [MEMORY[0x1E4F39CE8] layer];
    [v8 setContentsScale:v6];
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 50.0, 90.0);
    [v8 setFontSize:10.0];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    for (uint64_t i = 0; i != 6; ++i)
    {
      v11 = _PXGDebugStatsKeyTitle();
      [v9 addObject:v11];
    }
    [v9 addObject:@"Total"];
    v12 = [v9 componentsJoinedByString:@"\n"];
    [v8 setString:v12];

    [(PXGDebugHUDLayer *)v2 addSublayer:v8];
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    for (uint64_t j = 0; j != 7; ++j)
    {
      v15 = [MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v15, "setFrame:", 55.0, (double)j * 12.0 + 4.0, 40.0, 5.0);
      [v15 setBackgroundColor:v2->_green];
      [(PXGDebugHUDLayer *)v2 addSublayer:v15];
      [v13 addObject:v15];
    }
    uint64_t v16 = [v13 copy];
    graphLayers = v2->_graphLayers;
    v2->_graphLayers = (NSArray *)v16;
  }
  return v2;
}

@end
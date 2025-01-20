@interface SUIAShockwaveRadialMaskSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (BOOL)donut;
- (BOOL)validateComputedValuesCorrespondToSourceValues;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)name;
- (PTSizeSettings)gradientLayerSize;
- (double)blurRadius;
- (double)innerRadius;
- (double)majorDiameter;
- (double)maximumExtentOfZeroOpacity;
- (double)outerRadius;
- (double)radiusOfMaximumOpacity;
- (double)ringWidth;
- (id)computeDerivativeValuesAndGenerateSource;
- (unint64_t)sampleCount;
- (void)setBlurRadius:(double)a3;
- (void)setColors:(id)a3;
- (void)setDefaultValues;
- (void)setDefaultValuesWithName:(id)a3 majorDiameter:(double)a4 ringWidth:(double)a5 blurRadius:(double)a6 sampleCount:(unint64_t)a7 locations:(id)a8 colors:(id)a9 gradientLayerSize:(CGSize)a10;
- (void)setGradientLayerSize:(id)a3;
- (void)setLocations:(id)a3;
- (void)setMajorDiameter:(double)a3;
- (void)setName:(id)a3;
- (void)setRingWidth:(double)a3;
- (void)setSampleCount:(unint64_t)a3;
@end

@implementation SUIAShockwaveRadialMaskSettings

- (NSString)name
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E75BEA0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_25E75BEB0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_name);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)locations
{
  return (NSArray *)sub_25E72927C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SUIAShockwaveRadialMaskSettings_locations, &qword_26A703FF8);
}

- (void)setLocations:(id)a3
{
}

- (NSArray)colors
{
  return (NSArray *)sub_25E72927C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SUIAShockwaveRadialMaskSettings_colors, (unint64_t *)&unk_26A704940);
}

- (void)setColors:(id)a3
{
}

- (PTSizeSettings)gradientLayerSize
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  return (PTSizeSettings *)*v2;
}

- (void)setGradientLayerSize:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (double)majorDiameter
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter);
  swift_beginAccess();
  return *v2;
}

- (void)setMajorDiameter:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (double)ringWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setRingWidth:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (double)blurRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setBlurRadius:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (unint64_t)sampleCount
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount);
  swift_beginAccess();
  return *v2;
}

- (void)setSampleCount:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

+ (BOOL)ignoresKey:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_25E75BEB0();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_getObjCClassMetadata();
  char v6 = static SUIAShockwaveRadialMaskSettings.ignoresKey(_:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)donut
{
  [(SUIAShockwaveRadialMaskSettings *)self ringWidth];
  return v2 > 0.0;
}

- (double)innerRadius
{
  double v2 = self;
  double v3 = SUIAShockwaveRadialMaskSettings.innerRadius.getter();

  return v3;
}

- (double)outerRadius
{
  double v2 = self;
  double v3 = SUIAShockwaveRadialMaskSettings.outerRadius.getter();

  return v3;
}

- (double)maximumExtentOfZeroOpacity
{
  double v2 = self;
  double v3 = SUIAShockwaveRadialMaskSettings.maximumExtentOfZeroOpacity.getter();

  return v3;
}

- (double)radiusOfMaximumOpacity
{
  double v2 = self;
  double v3 = SUIAShockwaveRadialMaskSettings.radiusOfMaximumOpacity.getter();

  return v3;
}

- (BOOL)validateComputedValuesCorrespondToSourceValues
{
  double v2 = self;
  Swift::Bool v3 = SUIAShockwaveRadialMaskSettings.validateComputedValuesCorrespondToSourceValues()();

  return v3;
}

- (id)computeDerivativeValuesAndGenerateSource
{
  double v2 = self;
  SUIAShockwaveRadialMaskSettings.computeDerivativeValuesAndGenerateSource()();

  Swift::Bool v3 = (void *)sub_25E75BEA0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)SUIAShockwaveRadialMaskSettings;
  [(PTSettings *)&v2 setDefaultValues];
}

- (void)setDefaultValuesWithName:(id)a3 majorDiameter:(double)a4 ringWidth:(double)a5 blurRadius:(double)a6 sampleCount:(unint64_t)a7 locations:(id)a8 colors:(id)a9 gradientLayerSize:(CGSize)a10
{
  double height = a10.height;
  double width = a10.width;
  uint64_t v17 = sub_25E75BEB0();
  uint64_t v19 = v18;
  sub_25E711DB8(0, &qword_26A703FF8);
  sub_25E75BF30();
  sub_25E711DB8(0, (unint64_t *)&unk_26A704940);
  sub_25E75BF30();
  v20 = self;
  SUIAShockwaveRadialMaskSettings.setDefaultValuesWithName(_:majorDiameter:ringWidth:blurRadius:sampleCount:locations:colors:gradientLayerSize:)(a4, a5, a6, width, height, v17, v19, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)settingsControllerModule
{
  _sSo31SUIAShockwaveRadialMaskSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::Bool v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
}

@end
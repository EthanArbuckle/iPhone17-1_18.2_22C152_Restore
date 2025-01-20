@interface SUIARadialGradientView
+ (Class)layerClass;
+ (void)calculateDescriptionForGradientMajorDiameter:(double)a3 ringWidth:(double)a4 blurRadius:(double)a5 numberOfSamples:(int64_t)a6 completion:(id)a7;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSArray)colors;
- (NSArray)locations;
- (SUIARadialGradientView)initWithCoder:(id)a3;
- (SUIARadialGradientView)initWithFrame:(CGRect)a3;
- (void)setColors:(id)a3;
- (void)setLocations:(id)a3;
@end

@implementation SUIARadialGradientView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_25E75BEB0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  Swift::Bool v9 = SUIARadialGradientView._shouldAnimateProperty(withKey:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

+ (Class)layerClass
{
  sub_25E711DB8(0, &qword_26A704BB8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (SUIARadialGradientView)initWithFrame:(CGRect)a3
{
  return (SUIARadialGradientView *)sub_25E758A9C();
}

- (SUIARadialGradientView)initWithCoder:(id)a3
{
  result = (SUIARadialGradientView *)sub_25E75C120();
  __break(1u);
  return result;
}

- (NSArray)colors
{
  v2 = self;
  uint64_t v3 = SUIARadialGradientView.colors.getter();

  if (v3)
  {
    sub_25E711DB8(0, (unint64_t *)&unk_26A704940);
    uint64_t v4 = (void *)sub_25E75BF20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setColors:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    sub_25E711DB8(0, (unint64_t *)&unk_26A704940);
    unint64_t v3 = sub_25E75BF30();
  }
  v5 = self;
  SUIARadialGradientView.colors.setter(v3);
}

- (NSArray)locations
{
  v2 = self;
  id v3 = [(SUIARadialGradientView *)v2 layer];
  self;
  id v4 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_locations);

  if (v4)
  {
    sub_25E711DB8(0, &qword_26A703FF8);
    sub_25E75BF30();

    v5 = (void *)sub_25E75BF20();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setLocations:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_25E711DB8(0, &qword_26A703FF8);
    uint64_t v3 = sub_25E75BF30();
  }
  v5 = self;
  id v6 = [(SUIARadialGradientView *)v5 layer];
  self;
  v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v3)
  {
    sub_25E711DB8(0, &qword_26A703FF8);
    id v8 = (id)sub_25E75BF20();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(v7, sel_setLocations_, v8);
}

+ (void)calculateDescriptionForGradientMajorDiameter:(double)a3 ringWidth:(double)a4 blurRadius:(double)a5 numberOfSamples:(int64_t)a6 completion:(id)a7
{
  v11 = _Block_copy(a7);
  sub_25E75AE50(a6, (uint64_t)v11, a3, a4, a5);
  _Block_release(v11);
}

@end
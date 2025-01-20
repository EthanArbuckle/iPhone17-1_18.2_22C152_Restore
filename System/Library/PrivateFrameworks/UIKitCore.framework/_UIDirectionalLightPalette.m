@interface _UIDirectionalLightPalette
+ (_UIDirectionalLightPalette)pondering;
+ (_UIDirectionalLightPalette)replaceBuildIn;
+ (_UIDirectionalLightPalette)replaceBuildOut;
- (_UIDirectionalLightPalette)init;
- (_UIDirectionalLightPalette)initWithColors:(id)a3;
- (_UIDirectionalLightPalette)initWithColors:(id)a3 locations:(id)a4;
@end

@implementation _UIDirectionalLightPalette

- (_UIDirectionalLightPalette)initWithColors:(id)a3
{
  sub_1853B985C(0, (unint64_t *)&qword_1EB255AB0);
  sub_186A1EB3C();
  id v4 = objc_allocWithZone((Class)_UIColorPalette);
  v5 = self;
  v6 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  v7 = (objc_class *)objc_msgSend(v4, sel_initWithColors_, v6);

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette) = v7;
  v9.receiver = v5;
  v9.super_class = (Class)_UIDirectionalLightPalette;
  return [(_UIDirectionalLightPalette *)&v9 init];
}

- (_UIDirectionalLightPalette)initWithColors:(id)a3 locations:(id)a4
{
  sub_1853B985C(0, (unint64_t *)&qword_1EB255AB0);
  sub_186A1EB3C();
  sub_1853B985C(0, (unint64_t *)&qword_1EB256318);
  sub_186A1EB3C();
  id v5 = objc_allocWithZone((Class)_UIColorPalette);
  v6 = self;
  v7 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  objc_super v9 = (objc_class *)objc_msgSend(v5, sel_initWithColors_locations_colorSpaceName_, v7, v8, 0);

  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette) = v9;
  v11.receiver = v6;
  v11.super_class = (Class)_UIDirectionalLightPalette;
  return [(_UIDirectionalLightPalette *)&v11 init];
}

- (_UIDirectionalLightPalette)init
{
  result = (_UIDirectionalLightPalette *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (_UIDirectionalLightPalette)pondering
{
  return (_UIDirectionalLightPalette *)sub_1859E2DF4((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantPonderingFillPalette);
}

+ (_UIDirectionalLightPalette)replaceBuildOut
{
  return (_UIDirectionalLightPalette *)sub_1859E2DF4((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantReplacementBuildOutPalette);
}

+ (_UIDirectionalLightPalette)replaceBuildIn
{
  return (_UIDirectionalLightPalette *)sub_1859E2DF4((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantReplacementBuildOutPalette);
}

@end
@interface VFXSceneLightParameters
- (_TtC3VFX23VFXSceneLightParameters)init;
- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3;
- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3 intensity:(float)a4 color:;
- (void)setAreaLightParametersWithExtents:(BOOL)a3 doubleSided:;
- (void)setAttenuationRadius:(float)a3;
- (void)setDirectionalParametersWithScale:(float)a3 zNear:(float)a4 zFar:(float)a5;
- (void)setIBLParametersWithEntity:(int64_t)a3;
- (void)setIBLParametersWithTag:(id)a3;
- (void)setIBLParametersWithUrl:(id)a3 texture:(id)a4;
- (void)setIntensity:(float)a3;
- (void)setOrientation:(_TtC3VFX23VFXSceneLightParameters *)self;
- (void)setPointLightParametersWithZNear:(float)a3 zFar:(float)a4;
- (void)setPosition:(_TtC3VFX23VFXSceneLightParameters *)self;
- (void)setSpotLightParametersWithOuterAngle:(float)a3 innerAngle:(float)a4 zNear:(float)a5 zFar:(float)a6;
@end

@implementation VFXSceneLightParameters

- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3
{
  return (_TtC3VFX23VFXSceneLightParameters *)VFXSceneLightParameters.init(type:)(a3);
}

- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3 intensity:(float)a4 color:
{
  return (_TtC3VFX23VFXSceneLightParameters *)VFXSceneLightParameters.init(type:intensity:color:)(a3, a4, v4);
}

- (void)setIntensity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_intensity) = a3;
}

- (void)setOrientation:(_TtC3VFX23VFXSceneLightParameters *)self
{
  v3 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_orientation;
  *(_OWORD *)v3 = v2;
  v3[16] = 0;
}

- (void)setPosition:(_TtC3VFX23VFXSceneLightParameters *)self
{
  v3 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_position;
  *(_OWORD *)v3 = v2;
  v3[16] = 0;
}

- (void)setAttenuationRadius:(float)a3
{
  v3 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_attenuationRadius);
  float *v3 = a3;
  *((unsigned char *)v3 + 4) = 0;
}

- (void)setDirectionalParametersWithScale:(float)a3 zNear:(float)a4 zFar:(float)a5
{
  v5 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_orthoScale);
  float *v5 = a3;
  *((unsigned char *)v5 + 4) = 0;
  v6 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  float *v6 = a4;
  *((unsigned char *)v6 + 4) = 0;
  v7 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  float *v7 = a5;
  *((unsigned char *)v7 + 4) = 0;
}

- (void)setSpotLightParametersWithOuterAngle:(float)a3 innerAngle:(float)a4 zNear:(float)a5 zFar:(float)a6
{
  v6 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_outerAngle);
  float *v6 = a3;
  *((unsigned char *)v6 + 4) = 0;
  v7 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_innerAngle);
  float *v7 = a4;
  *((unsigned char *)v7 + 4) = 0;
  v8 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  float *v8 = a5;
  *((unsigned char *)v8 + 4) = 0;
  v9 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  float *v9 = a6;
  *((unsigned char *)v9 + 4) = 0;
}

- (void)setPointLightParametersWithZNear:(float)a3 zFar:(float)a4
{
  __n128 v4 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  *__n128 v4 = a3;
  *((unsigned char *)v4 + 4) = 0;
  v5 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  float *v5 = a4;
  *((unsigned char *)v5 + 4) = 0;
}

- (void)setAreaLightParametersWithExtents:(BOOL)a3 doubleSided:
{
  __n128 v4 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_extents;
  *(void *)__n128 v4 = v3;
  v4[8] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_doubleSided) = a3;
}

- (void)setIBLParametersWithUrl:(id)a3 texture:(id)a4
{
  sub_1B638BEC8(0, (unint64_t *)&qword_1EB9857F0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v15 - v9;
  if (a3)
  {
    sub_1B6E30EE8();
    uint64_t v11 = sub_1B6E30F48();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_1B6E30F48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_url;
  swift_unknownObjectRetain();
  v14 = self;
  sub_1B663ABE8((uint64_t)v13);
  sub_1B663AB08((uint64_t)v10, (uint64_t)v13);
  *(Class *)((char *)&v14->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_texture) = (Class)a4;

  swift_unknownObjectRelease();
  sub_1B663ABE8((uint64_t)v10);
}

- (void)setIBLParametersWithEntity:(int64_t)a3
{
}

- (void)setIBLParametersWithTag:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B6E31798();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_textureTag);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (_TtC3VFX23VFXSceneLightParameters)init
{
  result = (_TtC3VFX23VFXSceneLightParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B663ABE8((uint64_t)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_url);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
@interface VFXCoreCamera
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthographic;
- (BOOL)reverseZ;
- (NSString)name;
- (_TtC3VFX13VFXCoreCamera)init;
- (__n128)orientation;
- (__n128)position;
- (char)projectionDirection;
- (double)filmOffset;
- (double)lastFrameWorldTransform;
- (double)projection;
- (double)worldTransform;
- (float)aperture;
- (float)exposure;
- (float)fStop;
- (float)fieldOfView;
- (float)focalLength;
- (float)focusDistance;
- (float)scale;
- (float)sensorSize;
- (float)zFar;
- (float)zNear;
- (uint64_t)setLastFrameWorldTransform:(uint64_t)result;
- (void)setIsOrthographic:(BOOL)a3;
- (void)setOrientation:(void *)a1;
- (void)setPosition:(_TtC3VFX13VFXCoreCamera *)self;
- (void)setProjection:(float32x4_t)a3;
- (void)setWorldTransform:(simd_float4)a3;
@end

@implementation VFXCoreCamera

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B6E32718();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1B6D61CEC((uint64_t)v8);

  sub_1B62B32CC((uint64_t)v8);
  return v6;
}

- (NSString)name
{
  uint64_t v3 = *(void *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  v4 = self;
  sub_1B69E547C(v3, v4);
  uint64_t v6 = v5;

  swift_release();
  if (v6)
  {
    v7 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isOrthographic
{
  return sub_1B6D64F60((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, char *))sub_1B69E44AC);
}

- (void)setIsOrthographic:(BOOL)a3
{
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  uint64_t v6 = self;
  sub_1B69DD674(v5, a3, v6);

  swift_release();
}

- (double)worldTransform
{
  *(void *)&double result = sub_1B6D64140(a1, a2, (double (*)(uint64_t, char *))sub_1B69E6BA0).n128_u64[0];
  return result;
}

- (void)setWorldTransform:(simd_float4)a3
{
  v6.columns[3] = a5;
  v6.columns[1] = a3;
  v6.columns[2] = a4;
  v6.columns[0] = a2;
  id v5 = a1;
  sub_1B6D627EC(v6);
}

- (double)lastFrameWorldTransform
{
  *(void *)&double result = sub_1B6D64140(a1, a2, (double (*)(uint64_t, char *))sub_1B69E6BF4).n128_u64[0];
  return result;
}

- (uint64_t)setLastFrameWorldTransform:(uint64_t)result
{
  if (*(_DWORD *)(result + OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance) != -1
    || *(_DWORD *)(result + OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 4) != 0)
  {
    v2 = (void *)result;
    uint64_t v3 = swift_retain();
    MEMORY[0x1F4188790](v3, v4);
    id v5 = v2;
    sub_1B636C318(0, (void (*)(unsigned char *))sub_1B6D65464);

    return swift_release();
  }
  return result;
}

- (__n128)position
{
  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  uint64_t v3 = a1;
  sub_1B69E6EC8(v2, v3);
  long long v6 = v4;

  swift_release();
  return (__n128)v6;
}

- (void)setPosition:(_TtC3VFX13VFXCoreCamera *)self
{
  __n128 v4 = v2;
  uint64_t v3 = self;
  sub_1B6D63358(v4);
}

- (__n128)orientation
{
  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  uint64_t v3 = a1;
  sub_1B69E70A8(v2, v3);
  long long v6 = v4;

  swift_release();
  return (__n128)v6;
}

- (void)setOrientation:(void *)a1
{
  id v2 = a1;
  sub_1B6D63AF8(a2);
}

- (double)projection
{
  *(void *)&double result = sub_1B6D64140(a1, a2, (double (*)(uint64_t, char *))sub_1B69E6C48).n128_u64[0];
  return result;
}

- (void)setProjection:(float32x4_t)a3
{
  id v5 = a1;
  sub_1B6D642BC(a2, a3, a4, a5);
}

- (float)fieldOfView
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E7288);
}

- (float)focalLength
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E7514);
}

- (float)focusDistance
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E7770);
}

- (float)sensorSize
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E79CC);
}

- (float)fStop
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E7C28);
}

- (float)exposure
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E7E84);
}

- (float)aperture
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E80E0);
}

- (double)filmOffset
{
  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  uint64_t v3 = a1;
  double v4 = sub_1B69E8634(v2, v3);

  swift_release();
  return v4;
}

- (float)scale
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E833C);
}

- (float)zNear
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E8390);
}

- (float)zFar
{
  return sub_1B6D64D04((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B69E83E4);
}

- (BOOL)reverseZ
{
  return sub_1B6D64F60((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, char *))sub_1B69E46E8);
}

- (char)projectionDirection
{
  uint64_t v3 = *(void *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  double v4 = self;
  sub_1B69E88A0(v3, v4);
  char v6 = v5;

  swift_release();
  return v6;
}

- (_TtC3VFX13VFXCoreCamera)init
{
  double result = (_TtC3VFX13VFXCoreCamera *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
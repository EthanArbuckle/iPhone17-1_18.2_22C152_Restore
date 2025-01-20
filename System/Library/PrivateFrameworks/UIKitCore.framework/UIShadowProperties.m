@interface UIShadowProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (UIBezierPath)_path;
- (UIBezierPath)path;
- (UIColor)color;
- (UIShadowProperties)init;
- (UIShadowProperties)initWithCoder:(id)a3;
- (double)offset;
- (double)opacity;
- (double)radius;
- (id)copyWithZone:(void *)a3;
- (int64_t)_backgroundConfigurationShadowType;
- (void)_applyPropertiesFromDefaultProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setOpacity:(double)a3;
- (void)setPath:(id)a3;
- (void)setRadius:(double)a3;
- (void)set_backgroundConfigurationShadowType:(int64_t)a3;
- (void)set_color:(id)a3;
- (void)set_offset:(CGSize)a3;
- (void)set_opacity:(double)a3;
- (void)set_path:(id)a3;
- (void)set_radius:(double)a3;
@end

@implementation UIShadowProperties

- (UIShadowProperties)init
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_blackColor);
  v6 = (char *)v4 + OBJC_IVAR___UIShadowProperties__backingProperties;
  *(void *)v6 = v5;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *((void *)v6 + 7) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)UIShadowProperties;
  return [(UIShadowProperties *)&v8 init];
}

- (UIColor)color
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setColor:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  v6 = *(void **)v5;
  id v7 = a3;
  objc_super v8 = self;

  *(void *)id v5 = v7;
  uint64_t v9 = *((void *)v5 + 6);
  if ((v9 & 1) == 0) {
    *((void *)v5 + 6) = v9 | 1;
  }
  swift_endAccess();
}

- (void)set_color:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  id v5 = *v4;
  UIShadowProperties *v4 = a3;
  id v6 = a3;
}

- (double)opacity
{
  v2 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return v2[1];
}

- (void)setOpacity:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[1] = a3;
  uint64_t v5 = *((void *)v4 + 6);
  if ((v5 & 2) == 0) {
    *((void *)v4 + 6) = v5 | 2;
  }
}

- (void)set_opacity:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[1] = a3;
}

- (double)radius
{
  v2 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return v2[2];
}

- (void)setRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[2] = a3;
  uint64_t v5 = *((void *)v4 + 6);
  if ((v5 & 4) == 0) {
    *((void *)v4 + 6) = v5 | 4;
  }
}

- (void)set_radius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[2] = a3;
}

- (void)setOffset:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = (CGFloat *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v5[3] = width;
  v5[4] = height;
  uint64_t v6 = *((void *)v5 + 6);
  if ((v6 & 8) == 0) {
    *((void *)v5 + 6) = v6 | 8;
  }
}

- (double)offset
{
  uint64_t v1 = a1 + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  return *(double *)(v1 + 24);
}

- (void)set_offset:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = (CGFloat *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v5[3] = width;
  v5[4] = height;
}

- (UIBezierPath)path
{
  v2 = self;
  v3 = (void *)sub_185AEED34();

  return (UIBezierPath *)v3;
}

- (void)setPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_185AEEE54(a3);
}

- (UIBezierPath)_path
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return (UIBezierPath *)v2[5];
}

- (void)set_path:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  id v5 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = a3;
  id v6 = a3;
}

- (int64_t)_backgroundConfigurationShadowType
{
  v2 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  return *((void *)v2 + 7);
}

- (void)set_backgroundConfigurationShadowType:(int64_t)a3
{
  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  *((void *)v4 + 7) = a3;
}

- (void)_applyPropertiesFromDefaultProperties:(id)a3
{
  id v5 = (char *)a3 + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 7);
  id v12 = *(id *)v5;
  long long v7 = *(_OWORD *)(v5 + 24);
  long long v13 = *(_OWORD *)(v5 + 8);
  long long v14 = v7;
  long long v15 = *(_OWORD *)(v5 + 40);
  uint64_t v16 = v6;
  swift_beginAccess();
  id v8 = (id)v15;
  id v9 = a3;
  v10 = self;
  id v11 = v12;
  sub_185AED9E8((uint64_t)&v12);
  swift_endAccess();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  BOOL v6 = UIShadowProperties.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  UIShadowProperties.description.getter();

  v3 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  id v5 = *(void **)v4;
  long long v20 = *(_OWORD *)(v4 + 8);
  uint64_t v6 = *((void *)v4 + 3);
  uint64_t v7 = *((void *)v4 + 4);
  id v8 = (void *)*((void *)v4 + 5);
  uint64_t v9 = *((void *)v4 + 6);
  uint64_t v10 = *((void *)v4 + 7);
  id v11 = objc_allocWithZone((Class)UIShadowProperties);
  id v12 = v8;
  long long v13 = self;
  id v14 = v5;
  long long v15 = (char *)objc_msgSend(v11, sel_init);
  uint64_t v16 = &v15[OBJC_IVAR___UIShadowProperties__backingProperties];
  swift_beginAccess();
  v17 = *(void **)v16;
  v18 = (void *)*((void *)v16 + 5);
  *(void *)uint64_t v16 = v14;
  *(_OWORD *)(v16 + 8) = v20;
  *((void *)v16 + 3) = v6;
  *((void *)v16 + 4) = v7;
  *((void *)v16 + 5) = v8;
  *((void *)v16 + 6) = v9;
  *((void *)v16 + 7) = v10;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIShadowProperties)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (UIShadowProperties *)sub_185AEFB30(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185AEF664(v4);
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->_backingProperties[OBJC_IVAR___UIShadowProperties__backingProperties + 32];
}

@end
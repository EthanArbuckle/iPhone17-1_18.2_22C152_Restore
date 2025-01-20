@interface UIHoverStyle
+ (UIHoverStyle)automaticStyle;
+ (UIHoverStyle)styleWithEffect:(id)effect shape:(UIShape *)shape;
+ (UIHoverStyle)styleWithShape:(UIShape *)shape;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)verboseDescription;
- (UIHoverStyle)init;
- (UIHoverStyle)styleWithEffect:(id)a3 shape:(id)a4;
- (UIHoverStyle)styleWithShape:(id)a3;
- (UIShape)shape;
- (id)copyWithZone:(void *)a3;
- (id)effect;
- (void)_invalidateAutomaticHoverEffect;
- (void)_invalidateAutomaticHoverShape;
- (void)setEffect:(id)effect;
- (void)setEnabled:(BOOL)enabled;
- (void)setShape:(UIShape *)shape;
@end

@implementation UIHoverStyle

- (void)_invalidateAutomaticHoverEffect
{
  v2 = self;
  sub_1856331C0(0, (uint64_t)sub_185637064, 0);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___UIHoverStyle__effect);

  sub_185638FA4(*(void **)((char *)&self->super.isa + OBJC_IVAR___UIHoverStyle__shape), *(void *)&self->_cachedBridgedEffect[OBJC_IVAR___UIHoverStyle__shape], *(void *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape], *(void *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 8], *(void *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 16], *(void *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 24], *(void *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 32], self->_cachedBridgedShape[OBJC_IVAR___UIHoverStyle__shape]);
  sub_1853B93B8((uint64_t)self + OBJC_IVAR___UIHoverStyle_host, &qword_1E8FAF480);
  sub_1853B93B8((uint64_t)self + OBJC_IVAR___UIHoverStyle_driverCoordinator, &qword_1E8FAF768);
  swift_bridgeObjectRelease();
}

- (void)_invalidateAutomaticHoverShape
{
  v2 = self;
  sub_1856331C0(0, (uint64_t)sub_185636BF0, 0);
}

+ (UIHoverStyle)styleWithShape:(UIShape *)shape
{
  id v4 = objc_allocWithZone((Class)UIHoverStyle);
  v5 = shape;
  id v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setShape_, v5);

  return (UIHoverStyle *)v6;
}

- (void)setShape:(UIShape *)shape
{
  id v6 = shape;
  v5 = self;
  sub_185638178(shape);
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t v4 = OBJC_IVAR___UIHoverStyle__isEnabled;
  int v5 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled) = enabled;
  v8 = self;
  if (v5 == [(UIHoverStyle *)v8 isEnabled])
  {
  }
  else
  {
    char v6 = *((unsigned char *)&self->super.isa + v4);
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = v6;
    sub_1856331C0(0, (uint64_t)sub_185AFDEF8, v7);

    swift_release();
  }
}

- (BOOL)isEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled);
}

- (UIHoverStyle)init
{
  return (UIHoverStyle *)sub_185638B4C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_185638764(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, (uint64_t)v6[3]);
  uint64_t v4 = (void *)sub_186A1F83C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (id)effect
{
  v2 = self;
  v3 = (void *)sub_185AFC030();

  return v3;
}

- (void)setEffect:(id)effect
{
  swift_unknownObjectRetain();
  int v5 = self;
  sub_185AFC16C((uint64_t)effect);
}

- (UIShape)shape
{
  v2 = self;
  v3 = sub_185AFC33C();

  return (UIShape *)v3;
}

- (UIHoverStyle)styleWithEffect:(id)a3 shape:(id)a4
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = (UIHoverStyle *)objc_msgSend(v6, sel_init);
  [(UIHoverStyle *)v8 setEffect:a3];
  [(UIHoverStyle *)v8 setShape:v7];
  swift_unknownObjectRelease();

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (UIHoverStyle)styleWithShape:(id)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  id v5 = a3;
  id v6 = (UIHoverStyle *)objc_msgSend(v4, sel_init);
  [(UIHoverStyle *)v6 setShape:v5];

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

+ (UIHoverStyle)styleWithEffect:(id)effect shape:(UIShape *)shape
{
  id v6 = objc_allocWithZone((Class)UIHoverStyle);
  swift_unknownObjectRetain();
  id v7 = shape;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setEffect_, effect);
  objc_msgSend(v8, sel_setShape_, v7);
  swift_unknownObjectRelease();

  return (UIHoverStyle *)v8;
}

+ (UIHoverStyle)automaticStyle
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)UIHoverStyle), sel_init);
  objc_msgSend(v2, sel_setShape_, 0);
  return (UIHoverStyle *)v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = UIHoverStyle.isEqual(_:)((uint64_t)v8);

  sub_1853B93B8((uint64_t)v8, &qword_1EB256B10);
  return v6 & 1;
}

- (NSString)description
{
  return (NSString *)sub_185AFD464(self, (uint64_t)a2, (void (*)(void))UIHoverStyle.description.getter);
}

- (NSString)verboseDescription
{
  return (NSString *)sub_185AFD464(self, (uint64_t)a2, (void (*)(void))sub_185AFD4D4);
}

@end
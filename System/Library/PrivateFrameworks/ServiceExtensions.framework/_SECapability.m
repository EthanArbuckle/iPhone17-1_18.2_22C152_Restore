@interface _SECapability
+ (id)assertionWithDomain:(id)a3 name:(id)a4;
+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5;
+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5 willInvalidate:(id)a6 didInvalidate:(id)a7;
+ (id)mediaWithWebsite:(id)a3;
- (BOOL)setActive:(BOOL)a3;
- (NSString)mediaEnvironment;
- (_SECapability)init;
@end

@implementation _SECapability

+ (id)mediaWithWebsite:(id)a3
{
  uint64_t v3 = sub_25C2219E8();
  id v5 = _s17ServiceExtensions13_SECapabilityC9assertion7websiteACSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)mediaEnvironment
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner);
  uint64_t v3 = *(void *)&self->inner[OBJC_IVAR____SECapability_inner];
  int v5 = self->inner[OBJC_IVAR____SECapability_inner + 72];
  if (v5 == 3)
  {
    swift_bridgeObjectRetain();
    v6 = (void *)sub_25C2219D8();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    if (v5 == 2)
    {
      self = (_SECapability *)sub_25C221C28();
      __break(1u);
    }
    char v8 = v5;
    uint64_t v9 = v2[8];
    uint64_t v10 = v2[9];
    uint64_t v11 = v2[6];
    uint64_t v17 = v2[7];
    uint64_t v13 = v2[4];
    uint64_t v12 = v2[5];
    uint64_t v15 = v2[2];
    uint64_t v14 = v2[3];
    v16 = self;
    sub_25C21C3DC(v4, v3, v15, v14, v13, v12, v11, v17, v9, v10, v8);
    result = (NSString *)sub_25C221CB8();
    __break(1u);
  }
  return result;
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4
{
  uint64_t v4 = sub_25C2219E8();
  uint64_t v6 = v5;
  uint64_t v7 = sub_25C2219E8();
  uint64_t v9 = v8;
  uint64_t v10 = (objc_class *)type metadata accessor for _SECapability();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  uint64_t v12 = &v11[OBJC_IVAR____SECapability_inner];
  *(void *)uint64_t v12 = v4;
  *((void *)v12 + 1) = v6;
  *((void *)v12 + 2) = v7;
  *((void *)v12 + 3) = v9;
  *((void *)v12 + 4) = 0;
  *((void *)v12 + 5) = 0;
  *((void *)v12 + 6) = nullsub_1;
  *((void *)v12 + 7) = 0;
  *((void *)v12 + 8) = nullsub_1;
  *((void *)v12 + 9) = 0;
  v12[80] = 2;
  v15.receiver = v11;
  v15.super_class = v10;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  return v13;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____SECapability_inner;
  sub_25C20C538(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SECapability_inner), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6), *((void *)v2 + 7), *((void *)v2 + 8), *((void *)v2 + 9), v2[80]);
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5
{
  uint64_t v5 = sub_25C2219E8();
  uint64_t v7 = v6;
  uint64_t v8 = sub_25C2219E8();
  uint64_t v10 = v9;
  uint64_t v11 = sub_25C2219E8();
  uint64_t v13 = v12;
  uint64_t v14 = (objc_class *)type metadata accessor for _SECapability();
  objc_super v15 = (char *)objc_allocWithZone(v14);
  v16 = &v15[OBJC_IVAR____SECapability_inner];
  *(void *)v16 = v5;
  *((void *)v16 + 1) = v7;
  *((void *)v16 + 2) = v8;
  *((void *)v16 + 3) = v10;
  *((void *)v16 + 4) = v11;
  *((void *)v16 + 5) = v13;
  *((void *)v16 + 6) = nullsub_1;
  *((void *)v16 + 7) = 0;
  *((void *)v16 + 8) = nullsub_1;
  *((void *)v16 + 9) = 0;
  v16[80] = 2;
  v19.receiver = v15;
  v19.super_class = v14;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  return v17;
}

+ (id)assertionWithDomain:(id)a3 name:(id)a4 environmentIdentifier:(id)a5 willInvalidate:(id)a6 didInvalidate:(id)a7
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = _Block_copy(a7);
  uint64_t v10 = sub_25C2219E8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_25C2219E8();
  uint64_t v15 = v14;
  uint64_t v16 = sub_25C2219E8();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v9;
  v21 = (objc_class *)type metadata accessor for _SECapability();
  v22 = (char *)objc_allocWithZone(v21);
  v23 = &v22[OBJC_IVAR____SECapability_inner];
  *(void *)v23 = v10;
  *((void *)v23 + 1) = v12;
  *((void *)v23 + 2) = v13;
  *((void *)v23 + 3) = v15;
  *((void *)v23 + 4) = v16;
  *((void *)v23 + 5) = v18;
  *((void *)v23 + 6) = sub_25C21C988;
  *((void *)v23 + 7) = v19;
  *((void *)v23 + 8) = sub_25C21CB4C;
  *((void *)v23 + 9) = v20;
  v23[80] = 2;
  v26.receiver = v22;
  v26.super_class = v21;
  id v24 = objc_msgSendSuper2(&v26, sel_init);
  return v24;
}

- (BOOL)setActive:(BOOL)a3
{
  return sub_25C21A088(a3) & 1;
}

- (_SECapability)init
{
  result = (_SECapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
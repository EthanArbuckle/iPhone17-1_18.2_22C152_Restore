@interface TPSUserGuide
+ (BOOL)supportsSecureCoding;
+ (id)getUserGuideFromURL:(id)a3;
+ (id)privateURLWithBookIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5 referrer:(id)a6;
+ (id)urlWithBook:(id)a3 topic:(id)a4 anchor:(id)a5 version:(id)a6 referrer:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)platformIndependent;
- (NSArray)gradientColorStrings;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)platform;
- (NSString)referrer;
- (NSString)symbol;
- (NSString)text;
- (NSString)topicIdentifier;
- (NSString)version;
- (TPSGradient)gradient;
- (TPSUserGuide)init;
- (TPSUserGuide)initWithCoder:(id)a3;
- (TPSUserGuide)initWithIdentifier:(id)a3 version:(id)a4 text:(id)a5 symbol:(id)a6 platform:(id)a7 platformIndependent:(BOOL)a8 gradientColorStrings:(id)a9;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReferrer:(id)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TPSUserGuide

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  UserGuide.encode(with:)((NSCoder)v4);
}

- (TPSUserGuide)initWithCoder:(id)a3
{
  return (TPSUserGuide *)UserGuide.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)getUserGuideFromURL:(id)a3
{
  uint64_t v3 = sub_19C976480();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976420();
  v7 = _s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)privateURLWithBookIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5 referrer:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_19C9768B0();
    a3 = v13;
    if (a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
LABEL_3:
    uint64_t v14 = sub_19C9768B0();
    a4 = v15;
    if (a5) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v16 = 0;
    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  uint64_t v14 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v16 = sub_19C9768B0();
  a5 = v17;
  if (a6)
  {
LABEL_5:
    uint64_t v18 = sub_19C9768B0();
    a6 = v19;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v18 = 0;
LABEL_10:
  swift_getObjCClassMetadata();
  static UserGuide.privateURL(bookIdentifier:topicIdentifier:version:referrer:)((uint64_t)a3, v14, (uint64_t)a4, v16, (uint64_t)a5, v18, (uint64_t)a6, (uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_19C976480();
  uint64_t v21 = *(void *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v12, 1, v20) != 1)
  {
    v22 = (void *)sub_19C976410();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v20);
  }
  return v22;
}

+ (id)urlWithBook:(id)a3 topic:(id)a4 anchor:(id)a5 version:(id)a6 referrer:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v31 = sub_19C9768B0();
    a3 = v15;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v30 = sub_19C9768B0();
      a4 = v16;
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v30 = 0;
  if (a5)
  {
LABEL_4:
    uint64_t v17 = sub_19C9768B0();
    a5 = v18;
    if (a6) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v19 = 0;
    id v21 = a7;
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v17 = 0;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v19 = sub_19C9768B0();
  a6 = v20;
  id v21 = a7;
  if (v21)
  {
LABEL_6:
    v22 = v21;
    uint64_t v23 = sub_19C9768B0();
    uint64_t v25 = v24;

    goto LABEL_12;
  }
LABEL_11:
  uint64_t v23 = 0;
  uint64_t v25 = 0;
LABEL_12:
  static UserGuide.url(book:topic:anchor:version:referrer:)((uint64_t)a3, v30, (uint64_t)a4, v17, (uint64_t)a5, v19, (uint64_t)a6, (uint64_t)v14, v23, v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_19C976480();
  uint64_t v27 = *(void *)(v26 - 8);
  v28 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v14, 1, v26) != 1)
  {
    v28 = (void *)sub_19C976410();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v26);
  }
  return v28;
}

- (BOOL)platformIndependent
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TPSUserGuide_platformIndependent);
}

- (NSString)identifier
{
  return (NSString *)sub_19C948554();
}

- (NSString)text
{
  return (NSString *)sub_19C948554();
}

- (NSString)symbol
{
  return (NSString *)sub_19C948554();
}

- (NSArray)gradientColorStrings
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (TPSGradient)gradient
{
  return (TPSGradient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___TPSUserGuide_gradient));
}

- (NSString)platform
{
  if (*(void *)&self->platformIndependent[OBJC_IVAR___TPSUserGuide_platform])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)referrer
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuide_referrer);
}

- (void)setReferrer:(id)a3
{
}

- (NSString)version
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuide_version);
}

- (void)setVersion:(id)a3
{
}

- (NSString)topicIdentifier
{
  swift_getKeyPath();
  sub_19C939EDC();
  uint64_t v3 = self;
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (char *)v3 + OBJC_IVAR___TPSUserGuide__topicIdentifier;
  swift_beginAccess();
  uint64_t v5 = *((void *)v4 + 1);
  swift_bridgeObjectRetain();

  if (v5)
  {
    v6 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setTopicIdentifier:(id)a3
{
  if (a3) {
    sub_19C9768B0();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x1F4188790](KeyPath);
  sub_19C939EDC();
  uint64_t v5 = self;
  sub_19C9765D0();

  swift_release();
  swift_bridgeObjectRelease();
}

- (TPSUserGuide)initWithIdentifier:(id)a3 version:(id)a4 text:(id)a5 symbol:(id)a6 platform:(id)a7 platformIndependent:(BOOL)a8 gradientColorStrings:(id)a9
{
  uint64_t v27 = sub_19C9768B0();
  uint64_t v13 = v12;
  if (a4)
  {
    uint64_t v14 = sub_19C9768B0();
    uint64_t v16 = v15;
    if (a5)
    {
LABEL_3:
      uint64_t v17 = sub_19C9768B0();
      unint64_t v19 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
  unint64_t v19 = 0;
LABEL_6:
  uint64_t v20 = sub_19C9768B0();
  uint64_t v22 = v21;
  if (a7)
  {
    a7 = (id)sub_19C9768B0();
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v25 = sub_19C9769E0();
  return (TPSUserGuide *)UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v27, v13, v14, v16, v17, v19, v20, v22, (uint64_t)a7, v24, a8, v25);
}

- (NSString)displayName
{
  return (NSString *)sub_19C949130(self, (uint64_t)a2, (void (*)(void))UserGuide.displayName.getter);
}

- (NSString)description
{
  return (NSString *)sub_19C949130(self, (uint64_t)a2, (void (*)(void))UserGuide.description.getter);
}

- (TPSUserGuide)init
{
  result = (TPSUserGuide *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___TPSUserGuide___observationRegistrar;
  uint64_t v4 = sub_19C976620();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  UserGuide.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_19C976FA0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_19C976990();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = UserGuide.isEqual(_:)((uint64_t)v8);

  sub_19C8E00AC((uint64_t)v8, &qword_1EB516E30);
  return v6 & 1;
}

@end
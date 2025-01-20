@interface TPSUserGuideTopic
+ (BOOL)isValidIdentifier:(id)a3;
+ (NSString)uti;
- (NSString)body;
- (NSString)identifier;
- (NSString)productId;
- (NSString)title;
- (NSString)topicId;
- (NSString)version;
- (NSURL)supportSiteURL;
- (TPSUserGuideTopic)init;
- (TPSUserGuideTopic)initWithProductIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5;
- (TPSUserGuideTopic)initWithSearchableItemUniqueIdentifier:(id)a3;
- (id)searchableItemUniqueIdentifierWith:(id)a3;
- (void)setBody:(id)a3;
- (void)setProductId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicId:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TPSUserGuideTopic

- (NSString)productId
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setProductId:(id)a3
{
  uint64_t v4 = sub_19C9768B0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)topicId
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_topicId);
}

- (void)setTopicId:(id)a3
{
}

- (NSString)version
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_version);
}

- (void)setVersion:(id)a3
{
}

+ (NSString)uti
{
  v2 = (void *)sub_19C976880();
  return (NSString *)v2;
}

- (NSString)identifier
{
  uint64_t v3 = sub_19C9765A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSUserGuideTopic_topicId;
  swift_beginAccess();
  if (*((void *)v7 + 1))
  {
    v8 = self;
  }
  else
  {
    v9 = self;
    sub_19C976590();
    sub_19C976570();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_bridgeObjectRetain();

  v10 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (NSString)title
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_body);
}

- (void)setBody:(id)a3
{
}

+ (BOOL)isValidIdentifier:(id)a3
{
  sub_19C9768B0();
  id v3 = objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
  swift_bridgeObjectRetain();
  id v4 = UserGuideTopic.init(searchableItemUniqueIdentifier:)();
  swift_bridgeObjectRelease();
  if (v4) {

  }
  return v4 != 0;
}

- (id)searchableItemUniqueIdentifierWith:(id)a3
{
  uint64_t v4 = sub_19C9768B0();
  uint64_t v6 = v5;
  v7 = self;
  sub_19C960B9C(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (TPSUserGuideTopic)initWithProductIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5
{
  uint64_t v7 = sub_19C9768B0();
  uint64_t v9 = v8;
  if (!a4)
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    return (TPSUserGuideTopic *)UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_19C9768B0();
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = sub_19C9768B0();
  uint64_t v14 = v13;
  return (TPSUserGuideTopic *)UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (TPSUserGuideTopic)initWithSearchableItemUniqueIdentifier:(id)a3
{
  return (TPSUserGuideTopic *)UserGuideTopic.init(searchableItemUniqueIdentifier:)();
}

- (TPSUserGuideTopic)init
{
  result = (TPSUserGuideTopic *)_swift_stdlib_reportUnimplementedInitializer();
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
}

- (NSURL)supportSiteURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  UserGuideTopic.supportSiteURL.getter((uint64_t)v5);

  uint64_t v7 = sub_19C976480();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_19C976410();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

@end
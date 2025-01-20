@interface InlineTip
- (NSArray)actions;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)iconURL;
- (_TtC14iCloudSettings9InlineTip)init;
- (id)init:(id)a3;
@end

@implementation InlineTip

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subtitle
{
  return (NSString *)sub_2629FD268();
}

- (NSURL)iconURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4229F0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262A14210((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings9InlineTip_iconURL, (uint64_t)v5);
  uint64_t v6 = sub_262B02A38();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_262B029E8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSURL *)v8;
}

- (NSArray)actions
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings9InlineTip_actions, v2, (void (*)(uint64_t))type metadata accessor for Action);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return InlineTip.init(_:)(v3);
}

- (_TtC14iCloudSettings9InlineTip)init
{
  result = (_TtC14iCloudSettings9InlineTip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2629F23F8((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings9InlineTip_iconURL, &qword_26B4229F0);

  swift_bridgeObjectRelease();
}

@end
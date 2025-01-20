@interface TSSharingActivityProvider
- (NSArray)activities;
- (NSArray)activityItemSources;
- (NSArray)activityItems;
- (NSArray)excludedActivityTypes;
- (TSSharingActivityProvider)init;
- (TSSharingActivityProvider)initWithActivityItems:(id)a3 activitySources:(id)a4 excludedActivityTypes:(id)a5 linkPresentationSource:(id)a6;
- (id)linkPresentationSource;
- (void)setActivities:(id)a3;
- (void)setActivityItemSources:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setLinkPresentationSource:(id)a3;
@end

@implementation TSSharingActivityProvider

- (NSArray)activityItemSources
{
  return (NSArray *)sub_1B5F977BC((uint64_t)self, (uint64_t)a2, (void (*)(void))SharingActivityProvider.activityItemSources.getter, (void (*)(void))sub_1B5F97398);
}

- (void)setActivityItemSources:(id)a3
{
}

- (NSArray)activities
{
  SharingActivityProvider.activities.getter();
  sub_1B5DFF760(0, &qword_1E9DAAD28);
  v2 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivities:(id)a3
{
  sub_1B5DFF760(0, &qword_1E9DAAD28);
  uint64_t v4 = sub_1B61B24E0();
  v5 = self;
  SharingActivityProvider.activities.setter(v4);
}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)sub_1B5F977BC((uint64_t)self, (uint64_t)a2, (void (*)(void))SharingActivityProvider.excludedActivityTypes.getter, type metadata accessor for ActivityType);
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (id)linkPresentationSource
{
  SharingActivityProvider.linkPresentationSource.getter((uint64_t)v9);
  uint64_t v2 = v10;
  if (v10)
  {
    v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x1F4188790](v3);
    v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = (void *)sub_1B61B3740();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setLinkPresentationSource:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1B61B3030();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v4 = self;
  }
  SharingActivityProvider.linkPresentationSource.setter((uint64_t)v6);
}

- (NSArray)activityItems
{
  uint64_t v2 = self;
  SharingActivityProvider.activityItems.getter();

  v3 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (TSSharingActivityProvider)initWithActivityItems:(id)a3 activitySources:(id)a4 excludedActivityTypes:(id)a5 linkPresentationSource:(id)a6
{
  if (a6)
  {
    swift_unknownObjectRetain();
    sub_1B61B3030();
    swift_unknownObjectRelease();
  }
  return (TSSharingActivityProvider *)SharingActivityProvider.init(activityItems:activitySources:excludedActivityTypes:linkPresentationSource:)();
}

- (TSSharingActivityProvider)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TSSharingActivityProvider_linkPresentationSource;
  sub_1B5E15B34((uint64_t)v3);
}

@end
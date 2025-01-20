@interface SyncKeysRepository
+ (BOOL)shouldSyncInReadOnlyMode;
+ (_TtC18PodcastsFoundation18SyncKeysRepository)shared;
- (BOOL)isBookmarksSyncDirtyFor:(int64_t)a3;
- (BOOL)isInterestSyncDirty;
- (BOOL)isLibrarySyncEnabled;
- (BOOL)isNonFollowedShowsSyncDirty;
- (BOOL)isPlaylistSyncDirty;
- (BOOL)isSubscriptionSyncDirtyFor:(int64_t)a3;
- (NSString)interestSyncVersion;
- (NSString)nonFollowedShowsSyncVersion;
- (NSString)podcastsDomainVersion;
- (_TtC18PodcastsFoundation18SyncKeysRepository)init;
- (double)subscriptionsLastSyncTimestampFor:(int64_t)a3;
- (id)subscriptionsSyncVersionFor:(int64_t)a3;
- (void)markBookmarksSyncDirty:(BOOL)a3 for:(int64_t)a4;
- (void)markInterestSyncDirty:(BOOL)a3;
- (void)markSubscriptionSyncDirty:(BOOL)a3 for:(int64_t)a4;
- (void)resetSubscriptionsLastSyncTimestampFor:(int64_t)a3;
- (void)resetSubscriptionsSyncVersionFor:(int64_t)a3;
- (void)setInterestSyncVersion:(id)a3;
- (void)setIsInterestSyncDirty:(BOOL)a3;
- (void)setIsLibrarySyncEnabled:(BOOL)a3;
- (void)setIsNonFollowedShowsSyncDirty:(BOOL)a3;
- (void)setIsPlaylistSyncDirty:(BOOL)a3;
- (void)setNonFollowedShowsSyncVersion:(id)a3;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)updateSubscriptionsLastSyncTimestampFor:(int64_t)a3;
- (void)updateSubscriptionsSyncVersionFor:(int64_t)a3 newValue:(id)a4;
@end

@implementation SyncKeysRepository

+ (_TtC18PodcastsFoundation18SyncKeysRepository)shared
{
  if (qword_1EB7693C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB7693B0;
  return (_TtC18PodcastsFoundation18SyncKeysRepository *)v2;
}

- (_TtC18PodcastsFoundation18SyncKeysRepository)init
{
  result = (_TtC18PodcastsFoundation18SyncKeysRepository *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isNonFollowedShowsSyncDirty
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsNonFollowedShowsSyncDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 16);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (BOOL)isInterestSyncDirty
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  uint64_t v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsInterestSyncDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 40);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (BOOL)isPlaylistSyncDirty
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 56);
  uint64_t v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsPlaylistSyncDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 64);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (BOOL)isSubscriptionSyncDirtyFor:(int64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = SyncKeysRepository.isSubscriptionSyncDirty(for:)(a3);

  return a3 & 1;
}

- (void)markSubscriptionSyncDirty:(BOOL)a3 for:(int64_t)a4
{
  uint64_t v6 = self;
  SyncKeysRepository.markSubscriptionSyncDirty(_:for:)(a3, a4);
}

- (id)subscriptionsSyncVersionFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v14);
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 96);
  v9 = self;
  v8(a3, v6, v7);
  uint64_t v11 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  if (v11)
  {
    v12 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)updateSubscriptionsSyncVersionFor:(int64_t)a3 newValue:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1ACE761B8();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v9, (uint64_t)v14);
  uint64_t v10 = v15;
  uint64_t v11 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v12 = *(void (**)(int64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 104);
  v13 = self;
  v12(a3, v6, v8, v10, v11);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  swift_bridgeObjectRelease();
}

- (void)resetSubscriptionsSyncVersionFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 112);
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
}

- (BOOL)isBookmarksSyncDirtyFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v11);
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v8 = *(uint64_t (**)(int64_t, uint64_t, uint64_t))(v7 + 120);
  v9 = self;
  LOBYTE(a3) = v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  return a3 & 1;
}

- (void)markBookmarksSyncDirty:(BOOL)a3 for:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v7, (uint64_t)v12);
  uint64_t v8 = v13;
  uint64_t v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  uint64_t v10 = *(void (**)(BOOL, int64_t, uint64_t, uint64_t))(v9 + 128);
  uint64_t v11 = self;
  v10(v5, a4, v8, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
}

- (void)markInterestSyncDirty:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 280);
  uint64_t v9 = self;
  v8(v3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
}

- (NSString)nonFollowedShowsSyncVersion
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 184);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;
  swift_endAccess();

  if (v9)
  {
    uint64_t v10 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (NSString *)v10;
}

- (void)setNonFollowedShowsSyncVersion:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1ACE761B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v8 = *((void *)v7 + 3);
  uint64_t v9 = *((void *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 192);
  uint64_t v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();
}

- (NSString)interestSyncVersion
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 232);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;
  swift_endAccess();

  if (v9)
  {
    uint64_t v10 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (NSString *)v10;
}

- (void)setInterestSyncVersion:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1ACE761B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v8 = *((void *)v7 + 3);
  uint64_t v9 = *((void *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 240);
  uint64_t v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();
}

- (NSString)podcastsDomainVersion
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 208);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;
  swift_endAccess();

  if (v9)
  {
    uint64_t v10 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (NSString *)v10;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1ACE761B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v8 = *((void *)v7 + 3);
  uint64_t v9 = *((void *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 216);
  uint64_t v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();
}

- (BOOL)isLibrarySyncEnabled
{
  BOOL v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 136);
  uint64_t v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsLibrarySyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 144);
  uint64_t v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (double)subscriptionsLastSyncTimestampFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v14);
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  uint64_t v8 = *(uint64_t (**)(int64_t, uint64_t, uint64_t))(v7 + 336);
  uint64_t v9 = self;
  double v10 = COERCE_DOUBLE(v8(a3, v6, v7));
  if (v11) {
    double v12 = 0.0;
  }
  else {
    double v12 = v10;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  return v12;
}

- (void)updateSubscriptionsLastSyncTimestampFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 344);
  uint64_t v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
}

- (void)resetSubscriptionsLastSyncTimestampFor:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1ACA3E158((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 352);
  uint64_t v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
}

+ (BOOL)shouldSyncInReadOnlyMode
{
  if ((isRunningUnitTests() & 1) != 0
    || (objc_msgSend(self, sel_isRunningOnHomepod) & 1) == 0)
  {
    char v2 = 0;
  }
  else
  {
    uint64_t v5 = &type metadata for Podcasts;
    unint64_t v6 = sub_1ACA56248();
    v4[0] = 26;
    char v2 = sub_1ACE75298();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  return v2 & 1;
}

@end
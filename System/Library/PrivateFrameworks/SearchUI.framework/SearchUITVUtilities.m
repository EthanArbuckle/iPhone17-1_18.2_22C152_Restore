@interface SearchUITVUtilities
+ (id)favoritesDidChangeNotificationName;
+ (void)fetchSportsFavoritesEnabledStatusWithCompletionHandler:(id)a3;
+ (void)fetchSportsItemIsFavoritedWithSportsItem:(SFSportsItem *)a3 completionHandler:(id)a4;
+ (void)updateSportsItemFavoriteStatusWithSportsItem:(SFSportsItem *)a3 shouldBeFavorite:(BOOL)a4 completionHandler:(id)a5;
- (_TtC8SearchUI19SearchUITVUtilities)init;
@end

@implementation SearchUITVUtilities

+ (void)fetchSportsFavoritesEnabledStatusWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE56320;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE56328;
  v12[5] = v11;
  sub_1E4693074((uint64_t)v7, (uint64_t)&unk_1EAE56330, (uint64_t)v12);
  swift_release();
}

+ (void)fetchSportsItemIsFavoritedWithSportsItem:(SFSportsItem *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EAE56300;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE56308;
  v14[5] = v13;
  v15 = a3;
  sub_1E4693074((uint64_t)v9, (uint64_t)&unk_1EAE56310, (uint64_t)v14);
  swift_release();
}

+ (void)updateSportsItemFavoriteStatusWithSportsItem:(SFSportsItem *)a3 shouldBeFavorite:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = a1;
  uint64_t v14 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EAE562D0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE559E0;
  v16[5] = v15;
  v17 = a3;
  sub_1E4693074((uint64_t)v11, (uint64_t)&unk_1EAE559E8, (uint64_t)v16);
  swift_release();
}

+ (id)favoritesDidChangeNotificationName
{
  v2 = (void *)sub_1E46A4F50();
  return v2;
}

- (_TtC8SearchUI19SearchUITVUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUITVUtilities();
  return [(SearchUITVUtilities *)&v3 init];
}

@end
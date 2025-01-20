@interface NewsConfigurationManager
- (FCNewsAppConfiguration)appConfiguration;
- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration;
- (NSArray)treatmentIDs;
- (_TtC10StocksCore24NewsConfigurationManager)init;
- (void)addAppConfigObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)fetchConfigurationIfNeededWithCompletion:(id)a3;
- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4;
- (void)removeAppConfigObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NewsConfigurationManager

- (_TtC10StocksCore24NewsConfigurationManager)init
{
  result = (_TtC10StocksCore24NewsConfigurationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  MEMORY[0x1F4188790](self);
  uint64_t v3 = v2;
  __swift_destroy_boxed_opaque_existential_1(v2 + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_appConfigurationManager);

  sub_1AFDB7CE0(v3 + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_lastKnownAppConfig, (uint64_t)v4);
  sub_1AFDB7FA0((uint64_t)v4);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)fetchConfigurationIfNeededWithCompletion:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AFDBE95C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (void *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;
  v6[4] = self;
  v7 = self;
  sub_1AFDBE820((uint64_t)v4);
  sub_1AFFCA828();
  swift_release();
  sub_1AFD309C0((uint64_t)v4);
}

- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1AFDBE8BC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1AFDB68DC((uint64_t)a3, (uint64_t)v6, v7);
  sub_1AFD309C0((uint64_t)v6);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (NSArray)treatmentIDs
{
  sub_1AFD7BE90();
  uint64_t v2 = (void *)sub_1AFFCB1B8();

  return (NSArray *)v2;
}

- (FCNewsAppConfiguration)appConfiguration
{
  uint64_t v2 = self;
  id v3 = sub_1AFDB60EC((uint64_t)v2);

  return (FCNewsAppConfiguration *)v3;
}

- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration
{
  uint64_t v2 = self;
  id v3 = sub_1AFDB60EC((uint64_t)v2);

  return (FCNewsAppConfiguration *)v3;
}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AFDBE95C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (void *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;
  v6[4] = self;
  uint64_t v7 = self;
  sub_1AFDBE820((uint64_t)v4);
  sub_1AFFCA828();
  swift_release();
  sub_1AFD309C0((uint64_t)v4);
}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1AFDBE95C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1AFDB705C((uint64_t)v8, (uint64_t)v6, v7);
  sub_1AFD309C0((uint64_t)v6);
}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1AFDBE95C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1AFDB7400(v8, (uint64_t)v6, v7);
  sub_1AFD309C0((uint64_t)v6);
}

- (void)addAppConfigObserver:(id)a3
{
}

- (void)removeAppConfigObserver:(id)a3
{
}

@end
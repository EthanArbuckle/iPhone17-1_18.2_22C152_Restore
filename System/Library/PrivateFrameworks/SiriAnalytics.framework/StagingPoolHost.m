@interface StagingPoolHost
- (_TtC13SiriAnalytics15StagingPoolHost)init;
- (void)dataPoolUrlWithCompletionHandler:(id)a3;
- (void)vendStagingAccessWithAuditToken:(id *)a3 completionHandler:(id)a4;
@end

@implementation StagingPoolHost

- (void)vendStagingAccessWithAuditToken:(id *)a3 completionHandler:(id)a4
{
  long long v8 = *(_OWORD *)&a3->var0[4];
  long long v9 = *(_OWORD *)a3->var0;
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 32) = v8;
  *(void *)(v6 + 48) = v5;
  *(void *)(v6 + 56) = self;
  v7 = self;
  sub_1A2B99048((uint64_t)&unk_1E9596CE0, v6);
}

- (void)dataPoolUrlWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;
  sub_1A2B99048((uint64_t)&unk_1E9596CA0, v5);
}

- (_TtC13SiriAnalytics15StagingPoolHost)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SiriAnalytics15StagingPoolHost_stagingContainerURL;
  sub_1A2C0CCF0();
  OUTLINED_FUNCTION_14();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end
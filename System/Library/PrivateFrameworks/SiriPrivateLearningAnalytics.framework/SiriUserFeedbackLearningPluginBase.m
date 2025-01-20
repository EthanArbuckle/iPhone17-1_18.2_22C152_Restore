@interface SiriUserFeedbackLearningPluginBase
- (_TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase)init;
- (id)performTask:(id)a3 error:(id *)a4;
@end

@implementation SiriUserFeedbackLearningPluginBase

- (_TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase)init
{
  v2 = (char *)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_usageLogger;
  *((void *)v2 + 3) = &type metadata for UsageLogger;
  *((void *)v2 + 4) = &protocol witness table for UsageLogger;
  uint64_t v3 = qword_1EBD5E6E0;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D3001988();
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EBD5E6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((uint64_t)v4 + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_timeout, v6, v5);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SiriUserFeedbackLearningPluginBase();
  return [(SiriUserFeedbackLearningPluginBase *)&v8 init];
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = sub_1D2FD3A28(v5);

  return v7;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_usageLogger);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_timeout;
  uint64_t v4 = sub_1D3001988();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end
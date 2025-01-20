@interface TSAlertArticleUnavailable
- (NSString)message;
- (NSString)title;
- (TSAlertArticleUnavailable)init;
- (TSAlertArticleUnavailable)initWithBlockedReason:(unint64_t)a3;
- (TSAlertArticleUnavailable)initWithType:(int64_t)a3;
@end

@implementation TSAlertArticleUnavailable

- (TSAlertArticleUnavailable)initWithBlockedReason:(unint64_t)a3
{
  uint64_t v4 = sub_1DFDE96E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1DFDE96A0();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR___TSAlertArticleUnavailable_alert, v7, v4);

  v9 = (objc_class *)type metadata accessor for BridgedAlertArticleUnavailable();
  v11.receiver = v8;
  v11.super_class = v9;
  return [(TSAlertArticleUnavailable *)&v11 init];
}

- (TSAlertArticleUnavailable)initWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
    uint64_t v5 = (unsigned int *)MEMORY[0x1E4F7D898];
LABEL_5:
    uint64_t v6 = *v5;
    uint64_t v7 = sub_1DFDE96E0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v4, v6, v7);
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for BridgedAlertArticleUnavailable();
    return [(TSAlertArticleUnavailable *)&v10 init];
  }
  if (!a3)
  {
    uint64_t v4 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
    uint64_t v5 = (unsigned int *)MEMORY[0x1E4F7D890];
    goto LABEL_5;
  }
  v9 = self;
  result = (TSAlertArticleUnavailable *)sub_1DFDFFFD0();
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_1DFBF75BC(self, (uint64_t)a2, MEMORY[0x1E4F7D8B0]);
}

- (NSString)message
{
  return (NSString *)sub_1DFBF75BC(self, (uint64_t)a2, MEMORY[0x1E4F7D8C0]);
}

- (TSAlertArticleUnavailable)init
{
  result = (TSAlertArticleUnavailable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
  uint64_t v3 = sub_1DFDE96E0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
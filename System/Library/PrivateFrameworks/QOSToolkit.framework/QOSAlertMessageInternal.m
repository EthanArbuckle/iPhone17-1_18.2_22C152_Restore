@interface QOSAlertMessageInternal
- (NSString)body;
- (NSString)title;
- (QOSAlertMessageInternal)init;
- (QOSAlertMessageInternal)initWithTitle:(id)a3 body:(id)a4;
@end

@implementation QOSAlertMessageInternal

- (NSString)title
{
  return (NSString *)sub_25AC79C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___QOSAlertMessageInternal_title);
}

- (NSString)body
{
  return (NSString *)sub_25AC79C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___QOSAlertMessageInternal_body);
}

- (QOSAlertMessageInternal)initWithTitle:(id)a3 body:(id)a4
{
  if (!a3)
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = sub_25AC8EDD8();
  uint64_t v8 = v7;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = sub_25AC8EDD8();
LABEL_6:
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___QOSAlertMessageInternal_title);
  uint64_t *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___QOSAlertMessageInternal_body);
  uint64_t *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return [(QOSAlertMessageInternal *)&v14 init];
}

- (QOSAlertMessageInternal)init
{
  result = (QOSAlertMessageInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
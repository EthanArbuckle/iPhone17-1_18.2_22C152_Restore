@interface LinkActionURLQualifier
- (BOOL)allowCopyingOfURL:(id)a3;
- (BOOL)allowOpenInNewWindowForURL:(id)a3;
- (BOOL)allowOpenInSafariForURL:(id)a3;
- (_TtC8StocksUI22LinkActionURLQualifier)init;
@end

@implementation LinkActionURLQualifier

- (BOOL)allowCopyingOfURL:(id)a3
{
  uint64_t v4 = sub_20A8C2530();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C24E0();
  v8 = self;
  v9 = (void *)sub_20A8C24D0();
  unsigned __int8 v10 = objc_msgSend(v9, sel_fc_isHardPaywallNewsArticleURL_, 0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInSafariForURL:(id)a3
{
  return sub_20A5C6F68((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_20A5C70B4);
}

- (BOOL)allowOpenInNewWindowForURL:(id)a3
{
  return sub_20A5C6F68((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_20A5C72D8);
}

- (_TtC8StocksUI22LinkActionURLQualifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LinkActionURLQualifier *)&v3 init];
}

@end
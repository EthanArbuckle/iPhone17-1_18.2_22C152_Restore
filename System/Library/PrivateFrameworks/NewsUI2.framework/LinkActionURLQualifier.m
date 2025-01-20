@interface LinkActionURLQualifier
- (BOOL)allowCopyingOfURL:(id)a3;
- (BOOL)allowOpenInNewWindowForURL:(id)a3;
- (BOOL)allowOpenInSafariForURL:(id)a3;
- (_TtC7NewsUI222LinkActionURLQualifier)init;
@end

@implementation LinkActionURLQualifier

- (BOOL)allowCopyingOfURL:(id)a3
{
  uint64_t v4 = sub_1DFDE7220();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  v8 = self;
  v9 = (void *)sub_1DFDE7130();
  unsigned __int8 v10 = objc_msgSend(v9, sel_fc_isHardPaywallNewsArticleURL_, 0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInSafariForURL:(id)a3
{
  uint64_t v4 = sub_1DFDE7220();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  v8 = self;
  v9 = (void *)sub_1DFDE7130();
  unsigned __int8 v10 = objc_msgSend(v9, sel_fc_isNewsURL);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInNewWindowForURL:(id)a3
{
  uint64_t v4 = sub_1DFDE7220();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  v8 = self;
  v9 = (void *)sub_1DFDE7130();
  unsigned int v10 = objc_msgSend(v9, sel_fc_isNewsURL);

  if (v10)
  {
    v11 = (_TtC7NewsUI222LinkActionURLQualifier *)objc_msgSend(self, sel_sharedApplication);
    unsigned __int8 v12 = [(LinkActionURLQualifier *)v11 supportsMultipleScenes];

    v8 = v11;
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (_TtC7NewsUI222LinkActionURLQualifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LinkActionURLQualifier *)&v3 init];
}

@end
@interface CHIntentHandler
- (CHIntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation CHIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v5 = objc_allocWithZone((Class)sub_100003D80());
  id v6 = a3;
  v7 = self;
  id v8 = [v5 init];
  id v9 = [v8 handlerForIntent:v6];

  if (v9)
  {
    sub_100003D90();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_100003C40((uint64_t)v17, (uint64_t)v18);

  uint64_t v10 = v19;
  if (v19)
  {
    v11 = sub_100003CEC(v18, v19);
    uint64_t v12 = *(void *)(v10 - 8);
    __chkstk_darwin(v11, v11);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    v15 = (void *)sub_100003DA0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    sub_100003D30(v18);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CHIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(CHIntentHandler *)&v3 init];
}

@end
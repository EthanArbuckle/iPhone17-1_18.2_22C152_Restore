@interface PASUIAppleIDAuthContextProvider
- (_TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider)init;
- (id)remoteUIStyle;
- (void)contextDidDismissLoginAlertController:(id)a3;
- (void)contextDidEndPresentingSecondaryUI:(id)a3;
- (void)contextDidPresentLoginAlertController:(id)a3;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)contextWillDismissLoginAlertController:(id)a3;
- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation PASUIAppleIDAuthContextProvider

- (_TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PASUIAppleIDAuthContextProvider *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CE0AC();
}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CE24C();
}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CE3EC();
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CE58C();
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CE72C();
}

- (id)remoteUIStyle
{
  v2 = (void *)sub_22E7CE8CC();
  return v2;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7CEA20();
}

- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686114B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268610A78;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22E7D7EAC((uint64_t)v9, (uint64_t)&unk_2686114C0, (uint64_t)v14);
  swift_release();
}

@end
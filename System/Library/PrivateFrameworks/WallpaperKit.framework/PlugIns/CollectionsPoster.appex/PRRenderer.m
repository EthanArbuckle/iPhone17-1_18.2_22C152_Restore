@interface PRRenderer
- (id)wk_extendRenderSessionForReason:(id)a3;
- (void)wk_noteContentSignificantlyChanged;
- (void)wk_setPreferredProminentColor:(id)a3;
@end

@implementation PRRenderer

- (id)wk_extendRenderSessionForReason:(id)a3
{
  sub_1000128B8();
  v4 = self;
  NSString v5 = sub_1000128A8();
  id v6 = [(PRRenderer *)v4 extendRenderingSessionForReason:v5];

  v7 = (objc_class *)type metadata accessor for CollectionsPosterInvalidatable();
  v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC17CollectionsPoster30CollectionsPosterInvalidatable_posterKitInvalidatable] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  v9 = [(PRRenderer *)&v11 init];

  swift_bridgeObjectRelease();
  return v9;
}

- (void)wk_noteContentSignificantlyChanged
{
}

- (void)wk_setPreferredProminentColor:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000122B0;
  *(void *)(v6 + 24) = v5;
  v10[4] = sub_1000122AC;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100011FE8;
  v10[3] = &unk_100018DA0;
  v7 = _Block_copy(v10);
  id v8 = a3;
  v9 = self;
  swift_retain();
  swift_release();
  [(PRRenderer *)v9 updatePreferences:v7];
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  swift_release();
  if (v7) {
    __break(1u);
  }
}

@end
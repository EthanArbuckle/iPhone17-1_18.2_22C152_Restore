@interface RDFeatureFlagsObjCWrapper
+ (id)temporaryOverrideWithEnabledFeatureFlags:(id)a3 disabledFeatureFlags:(id)a4;
+ (id)wrappedFeatureFlagsWithRawValue:(id)a3;
- (BOOL)isEnabled;
- (NSString)rawValue;
- (RDFeatureFlagsObjCWrapper)initWithRawValue:(id)a3;
@end

@implementation RDFeatureFlagsObjCWrapper

- (RDFeatureFlagsObjCWrapper)initWithRawValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDFeatureFlagsObjCWrapper;
  v6 = [(RDFeatureFlagsObjCWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValue, a3);
  }

  return v7;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (void).cxx_destruct
{
}

+ (id)wrappedFeatureFlagsWithRawValue:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = _sSo25RDFeatureFlagsObjCWrapperC7reminddE014wrappedFeatureB04withSo010REMFeaturebC9CWrapping_pSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)temporaryOverrideWithEnabledFeatureFlags:(id)a3 disabledFeatureFlags:(id)a4
{
  sub_100094134(&qword_10091FC90);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = _sSo25RDFeatureFlagsObjCWrapperC7reminddE17temporaryOverride018withEnabledFeatureB008disabledjB0So010REMFeatureb9TemporaryG12ObjcWrapping_pSaySo0lbC9CWrapping_pG_AItFZ_0(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)isEnabled
{
  uint64_t v3 = sub_100094134(&qword_10091FBF8);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  sub_10061AC9C((uint64_t)v5);
  uint64_t v7 = type metadata accessor for REMFeatureFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    sub_10061BE50((uint64_t)v5);
    char v9 = 0;
  }
  else
  {
    char v9 = REMFeatureFlags.isEnabled.getter();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v9 & 1;
}

@end
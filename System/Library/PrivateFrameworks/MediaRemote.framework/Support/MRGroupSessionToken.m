@interface MRGroupSessionToken
- (MRGroupSessionToken)initWithInvitationData:(id)a3 sharedSecret:(id)a4 sessionIdentifier:(id)a5 equivalentMediaIdentifier:(id)a6 version:(int64_t)a7;
@end

@implementation MRGroupSessionToken

- (MRGroupSessionToken)initWithInvitationData:(id)a3 sharedSecret:(id)a4 sessionIdentifier:(id)a5 equivalentMediaIdentifier:(id)a6 version:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  if (v12)
  {
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;

    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    if (v14) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    return (MRGroupSessionToken *)sub_10030BDAC(v15, v17, v18, v20, v21, v23, v24, v26, a7);
  }
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  if (!v14) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

  return (MRGroupSessionToken *)sub_10030BDAC(v15, v17, v18, v20, v21, v23, v24, v26, a7);
}

@end
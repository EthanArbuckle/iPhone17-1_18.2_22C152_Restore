@interface SMSendValidityUtilitiesInternal
+ (id)sendMessageFailureAlertCannotSendTitle;
+ (id)sendMessageFailureAlertOKButtonText;
+ (id)sendValidityAlertMessageFor:(int64_t)a3;
- (SMSendValidityUtilitiesInternal)init;
@end

@implementation SMSendValidityUtilitiesInternal

+ (id)sendMessageFailureAlertCannotSendTitle
{
  return sub_25B6EE844((uint64_t)a1, (uint64_t)a2, &qword_26A50D770);
}

+ (id)sendMessageFailureAlertOKButtonText
{
  return sub_25B6EE844((uint64_t)a1, (uint64_t)a2, &qword_26A50D778);
}

+ (id)sendValidityAlertMessageFor:(int64_t)a3
{
  static SendValidity.sendValidity(from:)(a3, (uint64_t)&v5);
  SendValidity.alertErrorMessage.getter();
  v3 = (void *)sub_25B7582E0();
  swift_bridgeObjectRelease();
  return v3;
}

- (SMSendValidityUtilitiesInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return [(SMSendValidityUtilitiesInternal *)&v3 init];
}

@end
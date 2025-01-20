@interface SMSendValidityUtilities
+ (id)sendMessageFailureAlertCannotSendTitle;
+ (id)sendMessageFailureAlertOKButtonText;
+ (id)sendValidityAlertMessageForSMError:(int64_t)a3;
@end

@implementation SMSendValidityUtilities

+ (id)sendMessageFailureAlertCannotSendTitle
{
  return +[SMSendValidityUtilitiesInternal sendMessageFailureAlertCannotSendTitle];
}

+ (id)sendMessageFailureAlertOKButtonText
{
  return +[SMSendValidityUtilitiesInternal sendMessageFailureAlertOKButtonText];
}

+ (id)sendValidityAlertMessageForSMError:(int64_t)a3
{
  return +[SMSendValidityUtilitiesInternal sendValidityAlertMessageFor:a3];
}

@end
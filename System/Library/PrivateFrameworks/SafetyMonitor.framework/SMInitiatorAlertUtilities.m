@interface SMInitiatorAlertUtilities
+ (id)alertMessageWithState:(id)a3 addTimeMode:(BOOL)a4 isWatchNotification:(BOOL)a5 shortStrings:(BOOL)a6 watchStrings:(BOOL)a7;
+ (id)alertTitleWithState:(id)a3 addTimeMode:(BOOL)a4 shortStrings:(BOOL)a5 watchStrings:(BOOL)a6;
@end

@implementation SMInitiatorAlertUtilities

+ (id)alertMessageWithState:(id)a3 addTimeMode:(BOOL)a4 isWatchNotification:(BOOL)a5 shortStrings:(BOOL)a6 watchStrings:(BOOL)a7
{
  return +[SMInitiatorAlertUtilitiesInternal alertMessageWith:a3 addTimeMode:a4 isWatchNotification:a5 shortStrings:a6 watchStrings:a7];
}

+ (id)alertTitleWithState:(id)a3 addTimeMode:(BOOL)a4 shortStrings:(BOOL)a5 watchStrings:(BOOL)a6
{
  return +[SMInitiatorAlertUtilitiesInternal alertTitleWith:a3 addTimeMode:a4 shortStrings:a5 watchStrings:a6];
}

@end
@interface PMOngoingCredentialSharingStrings
+ (NSString)cannotChangePermissionForGroupMemberTitle;
+ (NSString)groupCreationViewSubtitleString;
+ (NSString)groupManagementViewSubtitleStringForNonOwner;
+ (NSString)groupManagementViewSubtitleStringForOwner;
+ (NSString)newGroupButtonTitle;
+ (NSString)newGroupViewTitle;
+ (NSString)preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter;
+ (NSString)unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage;
+ (id)pickerTitleForNumberOfSelectedAccounts:(unint64_t)a3;
+ (id)unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:(id)a3;
@end

@implementation PMOngoingCredentialSharingStrings

+ (NSString)cannotChangePermissionForGroupMemberTitle
{
  return +[OngoingCredentialSharingStrings cannotChangePermissionForGroupMemberTitle];
}

+ (NSString)preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter
{
  return +[OngoingCredentialSharingStrings preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter];
}

+ (NSString)groupCreationViewSubtitleString
{
  return +[OngoingCredentialSharingStrings groupCreationViewSubtitleString];
}

+ (NSString)groupManagementViewSubtitleStringForOwner
{
  return +[OngoingCredentialSharingStrings groupManagementViewSubtitleStringForOwner];
}

+ (NSString)groupManagementViewSubtitleStringForNonOwner
{
  return +[OngoingCredentialSharingStrings groupManagementViewSubtitleStringForNonOwner];
}

+ (NSString)newGroupViewTitle
{
  return +[OngoingCredentialSharingStrings newGroupViewTitle];
}

+ (NSString)newGroupButtonTitle
{
  return +[OngoingCredentialSharingStrings newGroupButtonTitle];
}

+ (id)pickerTitleForNumberOfSelectedAccounts:(unint64_t)a3
{
  return +[OngoingCredentialSharingStrings pickerTitleWithNumberOfSelectedAccounts:a3];
}

+ (id)unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:(id)a3
{
  return +[OngoingCredentialSharingStrings unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:a3];
}

+ (NSString)unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage
{
  return +[OngoingCredentialSharingStrings unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage];
}

@end
@interface PMOngoingCredentialSharingAlertConfiguration
+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup;
+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup;
+ (NSString)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup;
+ (NSString)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup;
+ (NSString)groupDeletionConfirmationAlertSubtitle;
+ (NSString)groupDeletionConfirmationAlertTitle;
+ (NSString)groupDeletionWarningAlertSubtitle;
+ (NSString)leaveGroupConfirmationAlertSubtitle;
+ (NSString)leaveGroupConfirmationAlertTitle;
+ (NSString)leaveGroupWarningAlertSubtitle;
+ (id)alertSubtitleForFailingToMoveSavedAccounts:(id)a3 toGroupWithName:(id)a4;
+ (id)alertSubtitleForUnavailableGroup;
+ (id)alertTitleForFailingToAcceptInvitationWithError:(id)a3;
+ (id)alertTitleForFailingToAddGroupMemberWithError:(id)a3;
+ (id)alertTitleForFailingToCreateGroupWithError:(id)a3;
+ (id)alertTitleForFailingToDeclineInvitationWithError:(id)a3;
+ (id)alertTitleForFailingToDeleteGroupWithError:(id)a3;
+ (id)alertTitleForFailingToLeaveGroupWithError:(id)a3;
+ (id)alertTitleForFailingToMoveToGroup;
+ (id)alertTitleForFailingToRemoveGroupMemberWithError:(id)a3;
+ (id)alertTitleForFailingToUpdateGroupWithError:(id)a3;
+ (id)alertTitleForMovingSavedAccount:(id)a3 toGroupWithName:(id)a4;
+ (id)alertTitleForUnavailableGroup;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromGroupWithName:(id)a4;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromMyPasswordsToGroupWithName:(id)a4;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 toMyPasswordsFromGroup:(id)a4;
+ (id)confirmationAlertSubtitleForRemovingGroupMemberWithName:(id)a3;
+ (id)confirmationAlertTitleAndSubtitleForMovingSavedAccounts:(id)a3 toGroupWithName:(id)a4;
+ (id)confirmationAlertTitleForRemovingGroupMemberWithName:(id)a3;
+ (id)declineGroupInvitationAlertTitleForGroupWithName:(id)a3 fromKnownSender:(BOOL)a4;
+ (id)groupExitWarningAlertTitleWithGroupMemberNames:(id)a3;
+ (id)warningAlertMessageForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4;
+ (id)warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:(id)a3;
+ (id)warningAlertTitleForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4;
+ (id)warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:(id)a3;
@end

@implementation PMOngoingCredentialSharingAlertConfiguration

+ (id)alertTitleForFailingToMoveToGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToMoveToGroup];
}

+ (id)alertSubtitleForFailingToMoveSavedAccounts:(id)a3 toGroupWithName:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration alertSubtitleForFailingToMoveSavedAccounts:a3 toGroupWithName:a4];
}

+ (id)warningAlertTitleForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return +[OngoingCredentialSharingAlertConfiguration warningAlertTitleForMovingNumberOfReusedPasswords:a3 withTotalNumberOfAccountsSelected:a4];
}

+ (id)warningAlertMessageForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return +[OngoingCredentialSharingAlertConfiguration warningAlertMessageForMovingNumberOfReusedPasswords:a3 withTotalNumberOfAccountsSelected:a4];
}

+ (id)confirmationAlertTitleAndSubtitleForMovingSavedAccounts:(id)a3 toGroupWithName:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleAndSubtitleForMovingSavedAccounts:a3 toGroupWithName:a4 isDragAndDropOperation:0];
}

+ (id)alertTitleForMovingSavedAccount:(id)a3 toGroupWithName:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForMovingSavedAccount:a3 toGroupWithName:a4];
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 toMyPasswordsFromGroup:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration confirmationAlertSubtitleForMovingSavedAccount:a3 toMyPasswordsFromGroup:a4];
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromMyPasswordsToGroupWithName:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration confirmationAlertSubtitleForMovingSavedAccount:a3 fromMyPasswordstoGroupWithName:a4];
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromGroupWithName:(id)a4
{
  return +[OngoingCredentialSharingAlertConfiguration confirmationAlertSubtitleForMovingSavedAccount:a3 fromGroupWithName:a4];
}

+ (id)confirmationAlertTitleForRemovingGroupMemberWithName:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration confirmationAlertTitleForRemovingGroupMemberWithName:a3];
}

+ (id)confirmationAlertSubtitleForRemovingGroupMemberWithName:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration confirmationAlertSubtitleForRemovingGroupMemberWithName:a3];
}

+ (id)warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:a3];
}

+ (id)warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:a3];
}

+ (id)alertTitleForFailingToCreateGroupWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToCreateGroupWithError:a3];
}

+ (id)alertTitleForFailingToDeleteGroupWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToDeleteGroupWithError:a3];
}

+ (id)alertTitleForFailingToLeaveGroupWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToLeaveGroupWithError:a3];
}

+ (id)alertTitleForFailingToAddGroupMemberWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToAddGroupMemberWithError:a3];
}

+ (id)alertTitleForFailingToRemoveGroupMemberWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToRemoveGroupMemberWithError:a3];
}

+ (id)alertTitleForFailingToUpdateGroupWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToUpdateGroupWithError:a3];
}

+ (id)alertTitleForFailingToAcceptInvitationWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToAcceptInvitationWithError:a3];
}

+ (id)alertTitleForFailingToDeclineInvitationWithError:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToDeclineInvitationWithError:a3];
}

+ (NSString)groupDeletionConfirmationAlertTitle
{
  return +[OngoingCredentialSharingAlertConfiguration groupDeletionConfirmationAlertTitle];
}

+ (NSString)groupDeletionConfirmationAlertSubtitle
{
  return +[OngoingCredentialSharingAlertConfiguration groupDeletionConfirmationAlertSubtitle];
}

+ (NSString)groupDeletionWarningAlertSubtitle
{
  return +[OngoingCredentialSharingAlertConfiguration groupDeletionWarningAlertSubtitle];
}

+ (NSString)leaveGroupConfirmationAlertTitle
{
  return +[OngoingCredentialSharingAlertConfiguration leaveGroupConfirmationAlertTitle];
}

+ (NSString)leaveGroupConfirmationAlertSubtitle
{
  return +[OngoingCredentialSharingAlertConfiguration leaveGroupConfirmationAlertSubtitle];
}

+ (NSString)leaveGroupWarningAlertSubtitle
{
  return +[OngoingCredentialSharingAlertConfiguration leaveGroupWarningAlertSubtitle];
}

+ (id)groupExitWarningAlertTitleWithGroupMemberNames:(id)a3
{
  return +[OngoingCredentialSharingAlertConfiguration groupExitWarningAlertTitleWithGroupMemberNames:a3];
}

+ (NSString)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup];
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup];
}

+ (NSString)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup];
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup];
}

+ (id)alertTitleForUnavailableGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertTitleForUnavailableGroup];
}

+ (id)alertSubtitleForUnavailableGroup
{
  return +[OngoingCredentialSharingAlertConfiguration alertSubtitleForUnavailableGroup];
}

+ (id)declineGroupInvitationAlertTitleForGroupWithName:(id)a3 fromKnownSender:(BOOL)a4
{
  return +[OngoingCredentialSharingAlertConfiguration declineGroupInvitationAlertTitleForGroupWithName:a3 fromKnownSender:a4];
}

@end
@interface OngoingCredentialSharingAlertConfiguration
+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup;
+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup;
+ (NSString)alertSubtitleForUnavailableGroup;
+ (NSString)alertTitleForFailingToMoveToGroup;
+ (NSString)alertTitleForUnavailableGroup;
+ (NSString)groupDeletionConfirmationAlertSubtitle;
+ (NSString)groupDeletionConfirmationAlertTitle;
+ (NSString)groupDeletionWarningAlertSubtitle;
+ (NSString)leaveGroupConfirmationAlertSubtitle;
+ (NSString)leaveGroupConfirmationAlertTitle;
+ (NSString)leaveGroupWarningAlertSubtitle;
+ (id)alertSubtitleForFailingToMoveSavedAccounts:(id)a3 toGroupWithName:(id)a4;
+ (id)alertTitleAndSubtitleForMovingSavedAccounts:(id)a3 toGroupWithName:(id)a4 isDragAndDropOperation:(BOOL)a5;
+ (id)alertTitleForFailingToAcceptInvitationWithError:(id)a3;
+ (id)alertTitleForFailingToAddGroupMemberWithError:(id)a3;
+ (id)alertTitleForFailingToCreateGroupWithError:(id)a3;
+ (id)alertTitleForFailingToDeclineInvitationWithError:(id)a3;
+ (id)alertTitleForFailingToDeleteGroupWithError:(id)a3;
+ (id)alertTitleForFailingToLeaveGroupWithError:(id)a3;
+ (id)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup;
+ (id)alertTitleForFailingToRemoveGroupMemberWithError:(id)a3;
+ (id)alertTitleForFailingToUpdateGroupWithError:(id)a3;
+ (id)alertTitleForMovingSavedAccount:(id)a3 toGroupWithName:(id)a4;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromGroupWithName:(id)a4;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromMyPasswordstoGroupWithName:(id)a4;
+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 toMyPasswordsFromGroup:(id)a4;
+ (id)confirmationAlertSubtitleForRemovingGroupMemberWithName:(id)a3;
+ (id)confirmationAlertTitleForRemovingGroupMemberWithName:(id)a3;
+ (id)declineGroupInvitationAlertTitleForGroupWithName:(id)a3 fromKnownSender:(BOOL)a4;
+ (id)groupExitWarningAlertTitleWithGroupMemberNames:(id)a3;
+ (id)warningAlertMessageForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4;
+ (id)warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3;
+ (id)warningAlertTitleForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4;
+ (id)warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3;
- (_TtC17PasswordManagerUI42OngoingCredentialSharingAlertConfiguration)init;
@end

@implementation OngoingCredentialSharingAlertConfiguration

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 toMyPasswordsFromGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_2589399F0(v5, v6);
  uint64_t v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_258D6F458();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromMyPasswordstoGroupWithName:(id)a4
{
  id v4 = a3;
  sub_25893BD24(v4);

  id v5 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromGroupWithName:(id)a4
{
  uint64_t v5 = sub_258D6F498();
  uint64_t v7 = v6;
  id v8 = a3;
  sub_25893BEB8(v8, v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)confirmationAlertTitleForRemovingGroupMemberWithName:(id)a3
{
  return sub_258938610();
}

+ (id)confirmationAlertSubtitleForRemovingGroupMemberWithName:(id)a3
{
  return sub_258938610();
}

+ (id)warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3
{
  uint64_t v3 = sub_258D6F498();
  sub_25893C120(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3
{
  return sub_258938610();
}

+ (id)alertTitleAndSubtitleForMovingSavedAccounts:(id)a3 toGroupWithName:(id)a4 isDragAndDropOperation:(BOOL)a5
{
  sub_25893EF94(0, (unint64_t *)&qword_26A0A7D80);
  unint64_t v7 = sub_258D6F6D8();
  if (a4)
  {
    uint64_t v8 = sub_258D6F498();
    a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = sub_25893D280(v7, v8, (uint64_t)a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

+ (NSString)alertTitleForFailingToMoveToGroup
{
  return (NSString *)sub_258939044();
}

+ (id)alertSubtitleForFailingToMoveSavedAccounts:(id)a3 toGroupWithName:(id)a4
{
  sub_25893EF94(0, (unint64_t *)&qword_26A0A7D80);
  unint64_t v5 = sub_258D6F6D8();
  if (a4)
  {
    uint64_t v6 = sub_258D6F498();
    a4 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_25893D8A8(v5, v6, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v8;
}

+ (id)warningAlertTitleForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return sub_258938B9C();
}

+ (id)warningAlertMessageForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return sub_258938B9C();
}

+ (id)alertTitleForMovingSavedAccount:(id)a3 toGroupWithName:(id)a4
{
  if (a4)
  {
    uint64_t v5 = sub_258D6F498();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
  }
  id v8 = a3;
  sub_25893DA54(v8, v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v9;
}

+ (NSString)groupDeletionConfirmationAlertTitle
{
  return (NSString *)sub_258939044();
}

+ (NSString)groupDeletionConfirmationAlertSubtitle
{
  return (NSString *)sub_258939044();
}

+ (NSString)groupDeletionWarningAlertSubtitle
{
  return (NSString *)sub_258939044();
}

+ (NSString)leaveGroupConfirmationAlertTitle
{
  return (NSString *)sub_258939044();
}

+ (NSString)leaveGroupConfirmationAlertSubtitle
{
  return (NSString *)sub_258939044();
}

+ (NSString)leaveGroupWarningAlertSubtitle
{
  return (NSString *)sub_258939044();
}

+ (id)groupExitWarningAlertTitleWithGroupMemberNames:(id)a3
{
  uint64_t v3 = (void *)sub_258D6F6D8();
  sub_25893E588(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v4;
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  return (NSString *)sub_258939044();
}

+ (id)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  sub_25893E930();
  v0 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v0;
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup
{
  return (NSString *)sub_258939044();
}

+ (NSString)alertTitleForUnavailableGroup
{
  return (NSString *)sub_258939044();
}

+ (NSString)alertSubtitleForUnavailableGroup
{
  return (NSString *)sub_258939044();
}

+ (id)alertTitleForFailingToCreateGroupWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToDeleteGroupWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToLeaveGroupWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToAddGroupMemberWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToRemoveGroupMemberWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToUpdateGroupWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToAcceptInvitationWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToDeclineInvitationWithError:(id)a3
{
  return sub_258939728((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)declineGroupInvitationAlertTitleForGroupWithName:(id)a3 fromKnownSender:(BOOL)a4
{
  uint64_t v5 = sub_258D6F498();
  sub_25893EAC0(v5, v6, a4);
  swift_bridgeObjectRelease();
  unint64_t v7 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v7;
}

- (_TtC17PasswordManagerUI42OngoingCredentialSharingAlertConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OngoingCredentialSharingAlertConfiguration();
  return [(OngoingCredentialSharingAlertConfiguration *)&v3 init];
}

@end
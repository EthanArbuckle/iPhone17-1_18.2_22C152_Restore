@interface OngoingCredentialSharingStrings
+ (NSString)cannotChangePermissionForGroupMemberTitle;
+ (NSString)choosePasswordsButtonTitle;
+ (NSString)groupCreationViewSubtitleString;
+ (NSString)groupManagementViewSubtitleStringForNonOwner;
+ (NSString)groupManagementViewSubtitleStringForOwner;
+ (NSString)newGroupButtonTitle;
+ (NSString)newGroupViewTitle;
+ (NSString)preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter;
+ (NSString)removeDuplicatePasswordsTitle;
+ (NSString)reviewDuplicateButtonTitle;
+ (NSString)sharedPasswordsGroupsUnavailableAlertTitle;
+ (NSString)unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage;
+ (id)deleteDuplicatesButtonTitleWithNumberOfSelectedAccounts:(int64_t)a3;
+ (id)pickerTitleWithNumberOfSelectedAccounts:(int64_t)a3;
+ (id)unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:(id)a3;
- (_TtC17PasswordManagerUI31OngoingCredentialSharingStrings)init;
@end

@implementation OngoingCredentialSharingStrings

+ (NSString)cannotChangePermissionForGroupMemberTitle
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)groupCreationViewSubtitleString
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)groupManagementViewSubtitleStringForOwner
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)groupManagementViewSubtitleStringForNonOwner
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)newGroupViewTitle
{
  return (NSString *)sub_25893F240();
}

+ (NSString)newGroupButtonTitle
{
  return (NSString *)sub_25893F240();
}

+ (id)pickerTitleWithNumberOfSelectedAccounts:(int64_t)a3
{
  return sub_25893F648((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_25893FD30);
}

+ (NSString)choosePasswordsButtonTitle
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)reviewDuplicateButtonTitle
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)removeDuplicatePasswordsTitle
{
  return (NSString *)sub_25893FA24();
}

+ (id)deleteDuplicatesButtonTitleWithNumberOfSelectedAccounts:(int64_t)a3
{
  return sub_25893F648((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_25894012C);
}

+ (id)unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:(id)a3
{
  uint64_t v3 = sub_258D6B958();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_258D6F498();
  uint64_t v9 = v8;
  sub_258D6B948();
  sub_258D6B938();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0AFBA0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_258D87AB0;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_25893C0CC();
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_258D6F468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v11;
}

+ (NSString)unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage
{
  return (NSString *)sub_25893FA24();
}

+ (NSString)sharedPasswordsGroupsUnavailableAlertTitle
{
  return (NSString *)sub_25893FA24();
}

- (_TtC17PasswordManagerUI31OngoingCredentialSharingStrings)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OngoingCredentialSharingStrings();
  return [(OngoingCredentialSharingStrings *)&v3 init];
}

@end
@interface PrivateService
- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3;
- (void)applyIntroductionModel:(STIntroductionModel *)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5;
- (void)authenticateRestrictionsPasscode:(NSString *)a3 completionHandler:(id)a4;
- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3;
- (void)deleteAllWebApplicationHistory:(NSString *)a3 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a4 completionHandler:(id)a5;
- (void)deleteAllWebApplicationHistory:(NSString *)a3 completionHandler:(id)a4;
- (void)deleteAllWebApplicationHistory:(NSString *)a3 profileIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForDomain:(NSString *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForDomain:(NSString *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURLs:(NSArray *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURLs:(NSArray *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (void)enableRemoteManagementForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)fetchCommunicationPoliciesWithCompletionHandler:(id)a3;
- (void)fetchContactManagementStateForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)fetchContactsEditableWithReplyHandler:(id)a3;
- (void)fetchLastCommunicationLimitsModificationDateForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)fetchLastModificationDateForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)fetchRestrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)forceFamilyFetchWithCompletionHandler:(id)a3;
- (void)isAllowFindMyFriendsModificationSetForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)isContentPrivacyEnabledForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)isExplicitContentRestricted:(id)a3;
- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3;
- (void)isScreenTimeEnabledForLocalUserWithCompletionHandler:(id)a3;
- (void)isScreenTimeEnabledForRemoteUserWithDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)isScreenTimeSyncEnabledWithCompletionHandler:(id)a3;
- (void)needsToSetRestrictionsPasscodeWithCompletionHandler:(id)a3;
- (void)permitWebFilterURL:(NSURL *)a3 pageTitle:(NSString *)a4 completionHandler:(id)a5;
- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3;
- (void)requestToManageContactsForDSID:(NSNumber *)a3 completionHandler:(id)a4;
- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5;
- (void)setRestrictionsPasscode:(NSString *)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabledForLocalUser:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabledForRemoteUserWithDSID:(NSNumber *)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)setScreenTimeSyncEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForWebDomain:(NSString *)a3 completionHandler:(id)a4;
- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3;
- (void)updateAllowFindMyFriendsModification:(BOOL)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5;
@end

@implementation PrivateService

- (void)isScreenTimeEnabledForLocalUserWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344858;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344860;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344868, (uint64_t)v12);
  swift_release();
}

- (void)isScreenTimeEnabledForRemoteUserWithDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344838;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344840;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344848, (uint64_t)v14);
  swift_release();
}

- (void)setScreenTimeEnabledForLocalUser:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344810;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344818;
  v14[5] = v13;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344820, (uint64_t)v14);
  swift_release();
}

- (void)setScreenTimeEnabledForRemoteUserWithDSID:(NSNumber *)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1003447E8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003447F0;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_1003447F8, (uint64_t)v16);
  swift_release();
}

- (void)enableRemoteManagementForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003447C0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003447C8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_1003447D0, (uint64_t)v14);
  swift_release();
}

- (void)isScreenTimeSyncEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003447A0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003447A8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_1003447B0, (uint64_t)v12);
  swift_release();
}

- (void)setScreenTimeSyncEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344778;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344780;
  v14[5] = v13;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344788, (uint64_t)v14);
  swift_release();
}

- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344758;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344760;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344768, (uint64_t)v12);
  swift_release();
}

- (void)isContentPrivacyEnabledForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344738;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344740;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344748, (uint64_t)v14);
  swift_release();
}

- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344718;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344720;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344728, (uint64_t)v12);
  swift_release();
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003446F8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344700;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344708, (uint64_t)v12);
  swift_release();
}

- (void)needsToSetRestrictionsPasscodeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003446D8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003446E0;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_1003446E8, (uint64_t)v12);
  swift_release();
}

- (void)setRestrictionsPasscode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003446B0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003446B8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_1003446C0, (uint64_t)v14);
  swift_release();
}

- (void)authenticateRestrictionsPasscode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344688;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344690;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344698, (uint64_t)v14);
  swift_release();
}

- (void)fetchRestrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344668;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344670;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344678, (uint64_t)v12);
  swift_release();
}

- (void)fetchCommunicationPoliciesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344640;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344648;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344650, (uint64_t)v12);
  swift_release();
}

- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344620;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100344628;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100344630, (uint64_t)v16);
  swift_release();
}

- (void)requestToManageContactsForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344600;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344608;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344610, (uint64_t)v14);
  swift_release();
}

- (void)fetchContactManagementStateForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003445E0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003445E8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_1003445F0, (uint64_t)v14);
  swift_release();
}

- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003445C0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003445C8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_1003445D0, (uint64_t)v12);
  swift_release();
}

- (void)fetchContactsEditableWithReplyHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344598;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003445A0;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_1003445A8, (uint64_t)v12);
  swift_release();
}

- (void)fetchLastCommunicationLimitsModificationDateForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344578;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344580;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344588, (uint64_t)v14);
  swift_release();
}

- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344558;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344560;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344568, (uint64_t)v12);
  swift_release();
}

- (void)permitWebFilterURL:(NSURL *)a3 pageTitle:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344520;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100344528;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100344530, (uint64_t)v16);
  swift_release();
}

- (void)isExplicitContentRestricted:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100344500;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100344508;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344510, (uint64_t)v12);
  swift_release();
}

- (void)fetchLastModificationDateForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003444E0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003444E8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_1003444F0, (uint64_t)v14);
  swift_release();
}

- (void)applyIntroductionModel:(STIntroductionModel *)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1003444C0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003444C8;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_1003444D0, (uint64_t)v16);
  swift_release();
}

- (void)isAllowFindMyFriendsModificationSetForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003444A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003444A8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_1003444B0, (uint64_t)v14);
  swift_release();
}

- (void)updateAllowFindMyFriendsModification:(BOOL)a3 forDSID:(NSNumber *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344478;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100344480;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100344488, (uint64_t)v16);
  swift_release();
}

- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344458;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344460;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344468, (uint64_t)v14);
  swift_release();
}

- (void)shouldAllowOneMoreMinuteForWebDomain:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344438;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344440;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344448, (uint64_t)v14);
  swift_release();
}

- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344418;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344420;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344428, (uint64_t)v14);
  swift_release();
}

- (void)forceFamilyFetchWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003443F0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003443F8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100344400, (uint64_t)v12);
  swift_release();
}

- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1003443C0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003443C8;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_1003443D0, (uint64_t)v16);
  swift_release();
}

- (void)deleteWebHistoryForURLs:(NSArray *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344398;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003443A0;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_1003443A8, (uint64_t)v16);
  swift_release();
}

- (void)deleteWebHistoryForDomain:(NSString *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344380;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100342F60;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100342F68, (uint64_t)v16);
  swift_release();
}

- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344350;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100344358;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100344360, (uint64_t)v16);
  swift_release();
}

- (void)deleteAllWebApplicationHistory:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100344328;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100344330;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100344338, (uint64_t)v14);
  swift_release();
}

- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003442F8;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100344300;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_100344308, (uint64_t)v18);
  swift_release();
}

- (void)deleteWebHistoryForURLs:(NSArray *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003442D0;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1003442D8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_1003442E0, (uint64_t)v18);
  swift_release();
}

- (void)deleteWebHistoryForDomain:(NSString *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003442A8;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1003442B0;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_1003442B8, (uint64_t)v18);
  swift_release();
}

- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 profileIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100344278;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100344280;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_100344288, (uint64_t)v18);
  swift_release();
}

- (void)deleteAllWebApplicationHistory:(NSString *)a3 profileIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100344250;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100344258;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100344260, (uint64_t)v16);
  swift_release();
}

- (void)deleteWebHistoryForURL:(NSURL *)a3 webApplication:(NSString *)a4 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100344220;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100344228;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_100344230, (uint64_t)v18);
  swift_release();
}

- (void)deleteWebHistoryDuringInterval:(NSDateInterval *)a3 webApplication:(NSString *)a4 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003441F0;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1003441F8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_100344200, (uint64_t)v18);
  swift_release();
}

- (void)deleteAllWebApplicationHistory:(NSString *)a3 clientBundleURLWrapper:(NSSecurityScopedURLWrapper *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1003441D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003464F0;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100346060, (uint64_t)v16);
  swift_release();
}

@end
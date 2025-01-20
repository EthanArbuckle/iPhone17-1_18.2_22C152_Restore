@interface KmlKeyManagementSession
- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3;
- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5;
- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)consumeTrackingReceipt:(id)a3 otherJSONData:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6;
- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)deleteKey:(id)a3 callback:(id)a4;
- (void)endSessionWithCompletion:(id)a3;
- (void)finalizeUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 revert:(BOOL)a6 completionHandler:(id)a7;
- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4;
- (void)handleOwnerKeySharingCancelStatus:(id)a3;
- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4;
- (void)handleSharingCancelledMessage:(id)a3;
- (void)handleUpgradeCompletionWithStatus:(id)a3;
- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6;
- (void)listReceivedSharingInvitationsWithCallback:(id)a3;
- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4;
- (void)localDeleteKey:(id)a3 callback:(id)a4;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)remoteTerminateKeys:(id)a3 nodeGroupIdentifiers:(id)a4 treeGroupIdentifiers:(id)a5 adminKey:(id)a6 callback:(id)a7;
- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4;
- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7;
@end

@implementation KmlKeyManagementSession

- (void)deleteKey:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100354C64;
  v11[3] = &unk_10040BE80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)localDeleteKey:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100354DEC;
  v11[3] = &unk_10040BE80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)remoteTerminateKeys:(id)a3 nodeGroupIdentifiers:(id)a4 treeGroupIdentifiers:(id)a5 adminKey:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100354FD0;
  block[3] = &unk_10040B960;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, block);
}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100355268;
  v11[3] = &unk_10040BE80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)listReceivedSharingInvitationsWithCallback:(id)a3
{
  id v4 = a3;
  v5 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003553C8;
  block[3] = &unk_10040C108;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100355518;
  block[3] = &unk_10040C108;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10035567C;
  v11[3] = &unk_10040BE80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100355810;
  v15[3] = &unk_10040D360;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10031C120((id *)&self->super.super.isa);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100355B98;
  v13[3] = &unk_10041A930;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003560E4;
  block[3] = &unk_10040BEE8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);
}

- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10035625C;
  v11[3] = &unk_10040BE80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)consumeTrackingReceipt:(id)a3 otherJSONData:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10031C120((id *)&self->super.super.isa);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10035640C;
  v19[3] = &unk_10040B988;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, v19);
}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003565F4;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003567FC;
  v15[3] = &unk_10040B988;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003569C8;
  block[3] = &unk_10040BEE8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100356C4C;
  block[3] = &unk_10040BEE8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100356EF4;
  v15[3] = &unk_10040B988;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003571C0;
  v15[3] = &unk_10040B988;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100357450;
  v15[3] = &unk_10040B988;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_10031C120((id *)&self->super.super.isa);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100357710;
  v17[3] = &unk_10040D638;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unint64_t v21 = a4;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = sub_10031C120((id *)&self->super.super.isa);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100357900;
  v19[3] = &unk_10041A958;
  void v19[4] = self;
  id v20 = v12;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  dispatch_async(v15, v19);
}

- (void)finalizeUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 revert:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100357C1C;
  block[3] = &unk_10041A980;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  BOOL v22 = a6;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, block);
}

- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100357DB4;
  block[3] = &unk_10040BEE8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_10031C120((id *)&self->super.super.isa);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100357F04;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleOwnerKeySharingCancelStatus:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession handleOwnerKeySharingCancelStatus:]", 494, @"%@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003580F4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession handleOwnerKeySharingInvitations:withError:]", 502, @"Not applicable, Ignore", v4, v5, v6, v7, v8);
}

- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession handleOwnerCrossPlatformInvitations:withError:]", 507, @"Not applicable, Ignore", v4, v5, v6, v7, v8);
}

- (void)handleSharingCancelledMessage:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession handleSharingCancelledMessage:]", 514, &stru_100421848, v5, v6, v7, v8, v11[0]);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_100358218;
  v11[3] = (uint64_t)&unk_10040D1A0;
  void v11[4] = (uint64_t)self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)handleUpgradeCompletionWithStatus:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession handleUpgradeCompletionWithStatus:]", 525, &stru_100421848, v5, v6, v7, v8, v11[0]);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_100358308;
  v11[3] = (uint64_t)&unk_10040D1A0;
  void v11[4] = (uint64_t)self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sharingCancelWithMessageCallback, 0);
  objc_storeStrong(&self->_sharingCancelCallback, 0);
  objc_storeStrong(&self->_upgradeCompletionCallback, 0);
  objc_storeStrong((id *)&self->_epManager, 0);
  objc_storeStrong((id *)&self->_fsManager, 0);
  objc_storeStrong((id *)&self->_osSession, 0);

  objc_storeStrong((id *)&self->_osManager, 0);
}

@end
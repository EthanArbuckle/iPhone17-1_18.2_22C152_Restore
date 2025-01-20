@interface KmlKeySharingSession
- (void)acceptSharingInvitation:(id)a3 withIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 passcode:(id)a6 productPlanIdentifier:(id)a7 completionHandler:(id)a8;
- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6;
- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5;
- (void)cancelSharingInvitation:(id)a3 completionHandler:(id)a4;
- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8;
- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)handleCrossPlatformParseInvitationStatus:(id)a3;
- (void)handleCrossPlatformSigningRequest:(id)a3 status:(id)a4 keyInformation:(id)a5;
- (void)handleExchangeStartedWithFriendKey:(id)a3 status:(id)a4;
- (void)handleFriendSideKeySharingCancelStatus:(id)a3;
- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)handleInitiatorMessageResult:(id)a3;
- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4;
- (void)handleOwnerKeySharingCancelStatus:(id)a3;
- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4;
- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)handleRecipientMessageResult:(id)a3;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4;
- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendSharingInviteForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7;
- (void)sendSilentSharingInviteForKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation KmlKeySharingSession

- (void)sendSharingInviteForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = sub_10031C120((id *)&self->super.super.isa);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1003242A0;
  v23[3] = &unk_10041A4B0;
  v23[4] = self;
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
  dispatch_async(v17, v23);
}

- (void)sendSilentSharingInviteForKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_10031C120((id *)&self->super.super.isa);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100324590;
  v16[3] = &unk_10040B988;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100324824;
  block[3] = &unk_10040C108;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)cancelSharingInvitation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100324958;
  block[3] = &unk_10040BEE8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100324C94;
  block[3] = &unk_10041A4D8;
  id v22 = v12;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100324E20;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032505C;
  block[3] = &unk_10041A500;
  void block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(v20, block);
}

- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100325324;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003256E8;
  block[3] = &unk_10040B960;
  id v20 = v12;
  id v21 = v10;
  id v22 = self;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

- (void)acceptSharingInvitation:(id)a3 withIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 passcode:(id)a6 productPlanIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100325A18;
  block[3] = &unk_10041A550;
  id v28 = v15;
  id v29 = v16;
  id v30 = v14;
  id v31 = self;
  id v33 = v18;
  id v34 = v19;
  id v32 = v17;
  id v21 = v18;
  id v22 = v17;
  id v23 = v19;
  id v24 = v14;
  id v25 = v16;
  id v26 = v15;
  dispatch_async(v20, block);
}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100325D80;
  v15[3] = &unk_10040D360;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100325F40;
  v15[3] = &unk_10040D360;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032625C;
  v15[3] = &unk_10040D360;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100326554;
  block[3] = &unk_10040BEE8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
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
  v15[2] = sub_1003267FC;
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
  block[2] = sub_100326A60;
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
  block[2] = sub_100326CE4;
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
  v15[2] = sub_100326F8C;
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
  v15[2] = sub_100327258;
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
  v15[2] = sub_1003274E8;
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

- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003277A4;
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

- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10031C120((id *)&self->super.super.isa);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100327A8C;
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

- (void)handleOwnerKeySharingCancelStatus:(id)a3
{
  id v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingCancelStatus:]", 481, @"We don't cancel invitation on owner side from sharing session", v3, v4, v5, v6, v11);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingCancelStatus:]", 482, @"Ignoring this callback with status : %@", v7, v8, v9, v10, (uint64_t)v12);
}

- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v14 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingInvitations:withError:]", 487, @"invitations: %@, error %@", v7, v8, v9, v10, (uint64_t)v6);
  uint64_t v11 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100327D98;
  block[3] = &unk_10040D2C0;
  void block[4] = self;
  id v16 = v6;
  id v17 = v14;
  id v12 = v14;
  id v13 = v6;
  dispatch_async(v11, block);
}

- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerCrossPlatformInvitations:withError:]", 506, @"error - %@", v8, v9, v10, v11, (uint64_t)v7);
  id v12 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100327F80;
  block[3] = &unk_10040D2C0;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

- (void)handleExchangeStartedWithFriendKey:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleExchangeStartedWithFriendKey:status:]", 519, @"%@", v8, v9, v10, v11, (uint64_t)v7);
  id v12 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003280A4;
  block[3] = &unk_10040D2C0;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

- (void)handleFriendSideKeySharingCancelStatus:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleFriendSideKeySharingCancelStatus:]", 529, @"%@", v5, v6, v7, v8, (uint64_t)v4);
  uint64_t v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003281A4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleCrossPlatformSigningRequest:(id)a3 status:(id)a4 keyInformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleCrossPlatformSigningRequest:status:keyInformation:]", 539, @"%@", v11, v12, v13, v14, (uint64_t)v9);
  id v15 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003282E0;
  block[3] = &unk_100419A98;
  void block[4] = self;
  id v20 = v8;
  id v21 = v10;
  id v22 = v9;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  dispatch_async(v15, block);
}

- (void)handleCrossPlatformParseInvitationStatus:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleCrossPlatformParseInvitationStatus:]", 549, @"%@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003283E4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleRecipientMessageResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleRecipientMessageResult:]", 559, @"%@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003284E4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleInitiatorMessageResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleInitiatorMessageResult:]", 571, @"%@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003285E4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ownerSideSilentSharingCallback, 0);
  objc_storeStrong(&self->_sharingCancelCallback, 0);
  objc_storeStrong(&self->_ownerSideSharingInitCallback, 0);
  objc_storeStrong(&self->_initiatorSideHandleMessageCallback, 0);
  objc_storeStrong(&self->_recipientSideHandleMessageCallback, 0);
  objc_storeStrong(&self->_friendSideParseXPInvitationCallback, 0);
  objc_storeStrong(&self->_friendSideSendSigningRequestCallback, 0);
  objc_storeStrong(&self->_friendSideAcceptIDSCallback, 0);
  objc_storeStrong((id *)&self->_fsManager, 0);
  objc_storeStrong((id *)&self->_oksSession, 0);
  objc_storeStrong((id *)&self->_oksManager, 0);

  objc_storeStrong(&self->_cancelOwnerPairingHandler, 0);
}

@end
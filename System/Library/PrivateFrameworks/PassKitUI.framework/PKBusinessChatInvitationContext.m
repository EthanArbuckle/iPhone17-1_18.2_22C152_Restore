@interface PKBusinessChatInvitationContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatInvitationContext)initWithBusinessChatIdentifier:(id)a3 account:(id)a4 invitation:(id)a5 pendingInvitations:(id)a6 featureApplications:(id)a7;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatInvitationContext

- (PKBusinessChatInvitationContext)initWithBusinessChatIdentifier:(id)a3 account:(id)a4 invitation:(id)a5 pendingInvitations:(id)a6 featureApplications:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKBusinessChatInvitationContext;
  v17 = [(PKBusinessChatInvitationContext *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    businessChatIdentifier = v17->_businessChatIdentifier;
    v17->_businessChatIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_account, a4);
    objc_storeStrong((id *)&v17->_invitation, a5);
    uint64_t v20 = objc_msgSend(v15, "pk_objectsPassingTest:", &__block_literal_global_26);
    pendingInvitations = v17->_pendingInvitations;
    v17->_pendingInvitations = (NSArray *)v20;

    uint64_t v22 = objc_msgSend(v16, "pk_objectsPassingTest:", &__block_literal_global_680);
    featureApplications = v17->_featureApplications;
    v17->_featureApplications = (NSArray *)v22;
  }
  return v17;
}

uint64_t __124__PKBusinessChatInvitationContext_initWithBusinessChatIdentifier_account_invitation_pendingInvitations_featureApplications___block_invoke(uint64_t a1, void *a2)
{
  return PKFeatureApplicationStateIsTerminal() ^ 1;
}

uint64_t __124__PKBusinessChatInvitationContext_initWithBusinessChatIdentifier_account_invitation_pendingInvitations_featureApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return PKFeatureApplicationStateIsTerminal() ^ 1;
}

- (id)businessIdentifier
{
  return self->_businessChatIdentifier;
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"wallet_invite_contactsupport" forKeyedSubscript:@"targetDialog"];
  v4 = [(PKAccount *)self->_account accountIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"accountID"];

  v5 = [(PKFeatureApplication *)self->_invitation invitationDetails];
  uint64_t v6 = [v5 accountUserAccessLevel];
  v7 = @"participant";
  if (v6 != 2) {
    v7 = 0;
  }
  if (v6 == 1) {
    v8 = @"owner";
  }
  else {
    v8 = v7;
  }
  [v3 setObject:v8 forKeyedSubscript:@"accountRole"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_featureApplications, "count"));
  v10 = [v9 stringValue];
  [v3 setObject:v10 forKeyedSubscript:@"pendingApplicationCount"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_pendingInvitations, "count"));
  id v12 = [v11 stringValue];
  [v3 setObject:v12 forKeyedSubscript:@"pendingInvitationCount"];

  id v13 = [(NSArray *)self->_pendingInvitations pk_objectsPassingTest:&__block_literal_global_685];
  uint64_t v14 = [v13 count];

  id v15 = [NSNumber numberWithUnsignedInteger:v14];
  id v16 = [v15 stringValue];
  [v3 setObject:v16 forKeyedSubscript:@"pendingOwnerInvitationCount"];

  v17 = [(NSArray *)self->_pendingInvitations pk_objectsPassingTest:&__block_literal_global_687];
  uint64_t v18 = [v17 count];

  v19 = [NSNumber numberWithUnsignedInteger:v18];
  uint64_t v20 = [v19 stringValue];
  [v3 setObject:v20 forKeyedSubscript:@"pendingParticipantInvitationCount"];

  v21 = (void *)[v3 copy];

  return v21;
}

BOOL __51__PKBusinessChatInvitationContext_intentParameters__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 invitationDetails];
  BOOL v3 = [v2 accountUserAccessLevel] == 1;

  return v3;
}

BOOL __51__PKBusinessChatInvitationContext_intentParameters__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 invitationDetails];
  BOOL v3 = [v2 accountUserAccessLevel] == 2;

  return v3;
}

- (id)groupParameters
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"domain";
  v4[1] = @"origin";
  v5[0] = @"apple_pay";
  v5[1] = @"Wallet";
  v4[2] = @"page";
  v5[2] = @"wallet::invite::contactsupport";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)PKLocalizedFeatureStringWithDefaultValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
}

@end
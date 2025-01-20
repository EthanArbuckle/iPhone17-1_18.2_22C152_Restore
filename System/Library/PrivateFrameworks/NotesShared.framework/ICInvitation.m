@interface ICInvitation
+ (ICInvitation)invitationWithShareURL:(id)a3 context:(id)a4;
+ (NSValueTransformer)shareSystemFieldsTransformer;
+ (id)allInvitationsInContext:(id)a3;
+ (id)invitationsMatchingPredicate:(id)a3 context:(id)a4;
+ (id)makeInvitationIfNeededWithShareURL:(id)a3 account:(id)a4 context:(id)a5;
+ (id)makeInvitationWithShareURL:(id)a3 account:(id)a4 context:(id)a5;
+ (id)predicateForPendingInvitationsInAccount:(id)a3;
+ (id)predicateForPendingInvitationsInAccount:(id)a3 receivedSince:(id)a4;
- (CKShare)serverShare;
- (void)setServerShare:(id)a3;
@end

@implementation ICInvitation

+ (id)invitationsMatchingPredicate:(id)a3 context:(id)a4
{
  v4 = +[ICInvitation ic_objectsMatchingPredicate:a3 context:a4];
  v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

+ (id)predicateForPendingInvitationsInAccount:(id)a3 receivedSince:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = a4;
  v8 = [a1 predicateForPendingInvitationsInAccount:a3];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"receivedDate >= %@", v7, v8];

  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v6 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateForPendingInvitationsInAccount:(id)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"account == %@ AND rootObject == NIL", a3];
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"rootObject == NIL", v5);
  }
  return v3;
}

+ (NSValueTransformer)shareSystemFieldsTransformer
{
  if (shareSystemFieldsTransformer_onceToken_0 != -1) {
    dispatch_once(&shareSystemFieldsTransformer_onceToken_0, &__block_literal_global_40);
  }
  v2 = (void *)shareSystemFieldsTransformer_transformer;
  return (NSValueTransformer *)v2;
}

void __44__ICInvitation_shareSystemFieldsTransformer__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1A390], "ic_systemFieldsValueTransformer");
  v1 = (void *)shareSystemFieldsTransformer_transformer;
  shareSystemFieldsTransformer_transformer = v0;
}

- (CKShare)serverShare
{
  serverShare = self->_serverShare;
  if (!serverShare)
  {
    v4 = [(ICInvitation *)self serverShareData];
    if (v4)
    {
      uint64_t v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      id v6 = [(ICInvitation *)self serverShareData];
      id v7 = [v5 reverseTransformedValue:v6];
      v8 = self->_serverShare;
      self->_serverShare = v7;
    }
    else
    {
      uint64_t v5 = self->_serverShare;
      self->_serverShare = 0;
    }

    serverShare = self->_serverShare;
  }
  return serverShare;
}

- (void)setServerShare:(id)a3
{
  id v7 = a3;
  if ((-[CKShare isEqual:](self->_serverShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverShare, a3);
    if (v7)
    {
      uint64_t v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      id v6 = [v5 transformedValue:v7];
      [(ICInvitation *)self setServerShareData:v6];
    }
    else
    {
      [(ICInvitation *)self setServerShareData:0];
    }
  }
}

+ (id)makeInvitationWithShareURL:(id)a3 account:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  v10 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ICInvitation" inManagedObjectContext:v7];
  v11 = ICCheckedDynamicCast();

  v12 = [v8 persistentStore];
  [v7 assignObject:v11 toPersistentStore:v12];

  v13 = [v9 URLByDeletingFragment];

  [v11 setShareURL:v13];
  [v11 setAccount:v8];

  v14 = [MEMORY[0x1E4F1C9C8] now];
  [v11 setReceivedDate:v14];

  return v11;
}

+ (id)makeInvitationIfNeededWithShareURL:(id)a3 account:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 URLByDeletingFragment];
  v12 = [a1 invitationWithShareURL:v11 context:v10];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [v8 URLByDeletingFragment];
    id v14 = [a1 makeInvitationWithShareURL:v15 account:v9 context:v10];
  }
  return v14;
}

+ (id)allInvitationsInContext:(id)a3
{
  return (id)[a1 invitationsMatchingPredicate:0 context:a3];
}

+ (ICInvitation)invitationWithShareURL:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [a3 URLByDeletingFragment];
  id v9 = [v6 predicateWithFormat:@"shareURL == %@", v8];

  id v10 = [a1 invitationsMatchingPredicate:v9 context:v7];

  v11 = [v10 firstObject];

  return (ICInvitation *)v11;
}

- (void).cxx_destruct
{
}

@end
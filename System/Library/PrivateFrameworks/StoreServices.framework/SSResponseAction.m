@interface SSResponseAction
+ (id)_actionWithActionType:(id)a3;
+ (id)_checkInAppQueueActionWithClientID:(id)a3 environment:(id)a4;
+ (id)_dialogActionWithDialog:(id)a3;
+ (id)_dialogActionWithTouchIDDialog:(id)a3;
+ (id)_invalidateURLBagsAction;
+ (id)_selectFooterActionWithSection:(id)a3;
+ (id)_setActiveAccountActionWithAccount:(id)a3;
+ (id)_setCreditsActionWithCredits:(id)a3 account:(id)a4;
+ (id)_urlActionWithType:(id)a3 URL:(id)a4;
- (NSString)actionType;
- (NSString)clientIdentifier;
- (NSString)creditsString;
- (NSString)footerSection;
- (NSURL)URL;
- (SSAccount)account;
- (SSDialog)dialog;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)URLBagType;
@end

@implementation SSResponseAction

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 8), self->_account);
  uint64_t v6 = [(NSString *)self->_actionType copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_creditsString copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  objc_storeStrong((id *)(v5 + 40), self->_dialog);
  uint64_t v12 = [(NSString *)self->_footerSection copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSURL *)self->_url copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  *(void *)(v5 + 64) = self->_urlBagType;
  return (id)v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SSResponseAction;
  v4 = [(SSResponseAction *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: %@", v4, self->_actionType];

  return v5;
}

+ (id)_actionWithActionType:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (id)_checkInAppQueueActionWithClientID:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = (void *)v7[2];
  v7[2] = @"SSResponseActionTypeCheckInAppPurchaseQueue";

  uint64_t v9 = [v6 copy];
  uint64_t v10 = (void *)v7[3];
  v7[3] = v9;

  LODWORD(v6) = [v5 isEqualToString:@"sandbox"];
  v7[8] = v6;
  return v7;
}

+ (id)_dialogActionWithDialog:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)v4[2];
  v4[2] = @"SSResponseActionTypeShowDialog";

  id v6 = (void *)v4[5];
  v4[5] = v3;

  return v4;
}

+ (id)_dialogActionWithTouchIDDialog:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)v4[2];
  v4[2] = @"SSResponseActionTypeShowTouchIDDialog";

  id v6 = (void *)v4[5];
  v4[5] = v3;

  return v4;
}

+ (id)_invalidateURLBagsAction
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  id v3 = (void *)v2[2];
  v2[2] = @"SSResponseActionTypeInvalidateURLBags";

  return v2;
}

+ (id)_selectFooterActionWithSection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)v4[2];
  v4[2] = @"SSResponseActionTypeSelectFooterSection";

  uint64_t v6 = [v3 copy];
  objc_super v7 = (void *)v4[6];
  v4[6] = v6;

  return v4;
}

+ (id)_setActiveAccountActionWithAccount:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)v4[2];
  v4[2] = @"SSResponseActionTypeSetActiveAccount";

  uint64_t v6 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)_setCreditsActionWithCredits:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = (void *)v7[2];
  v7[2] = @"SSResponseActionTypeSetAccountCredits";

  uint64_t v9 = (void *)v7[1];
  v7[1] = v5;
  id v10 = v5;

  uint64_t v11 = [v6 copy];
  uint64_t v12 = (void *)v7[4];
  v7[4] = v11;

  return v7;
}

+ (id)_urlActionWithType:(id)a3 URL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = [v6 copy];

  uint64_t v9 = (void *)v7[2];
  v7[2] = v8;

  uint64_t v10 = [v5 copy];
  uint64_t v11 = (void *)v7[7];
  v7[7] = v10;

  return v7;
}

- (SSAccount)account
{
  return self->_account;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)creditsString
{
  return self->_creditsString;
}

- (SSDialog)dialog
{
  return self->_dialog;
}

- (NSString)footerSection
{
  return self->_footerSection;
}

- (NSURL)URL
{
  return self->_url;
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_footerSection, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_creditsString, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
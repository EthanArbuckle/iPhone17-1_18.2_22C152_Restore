@interface RingtonePurchase
+ (id)entityFromContext:(id)a3;
- (void)_assignToContact:(id)a3 inContactStore:(id)a4 withSoundIdentifier:(id)a5;
- (void)_assignToContactWithID:(id)a3 withIdentifier:(id)a4;
- (void)_assignToPersonWithID:(int)a3 withIdentifier:(id)a4;
- (void)applyUserActionWithToneIdentifier:(id)a3;
- (void)loadFromPurchase:(id)a3;
@end

@implementation RingtonePurchase

+ (id)entityFromContext:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName");

  return [v3 objectForKey:@"RingtonePurchase"];
}

- (void)applyUserActionWithToneIdentifier:(id)a3
{
  id v5 = [(RingtonePurchase *)self assignToPersonID];
  if (v5)
  {
    v6 = v5;
    if ((uint64_t)[v5 integerValue] >= 1) {
      -[RingtonePurchase _assignToPersonWithID:withIdentifier:](self, "_assignToPersonWithID:withIdentifier:", [v6 intValue], a3);
    }
  }
  id v7 = [(RingtonePurchase *)self assignToContactID];
  if (v7) {
    [(RingtonePurchase *)self _assignToContactWithID:v7 withIdentifier:a3];
  }
  uint64_t v8 = objc_msgSend(-[RingtonePurchase shouldMakeDefault](self, "shouldMakeDefault"), "BOOLValue");
  if (objc_msgSend(-[RingtonePurchase shouldMakeDefaultTextTone](self, "shouldMakeDefaultTextTone"), "BOOLValue"))uint64_t v9 = 2; {
  else
  }
    uint64_t v9 = v8;
  if (v9)
  {
    id v10 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    [v10 setCurrentToneIdentifier:a3 forAlertType:v9];
  }
}

- (void)loadFromPurchase:(id)a3
{
  -[RingtonePurchase setAdamID:](self, "setAdamID:", [a3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]);
  -[RingtonePurchase setAssigneeToneStyle:](self, "setAssigneeToneStyle:", [a3 assigneeToneStyle]);
  -[RingtonePurchase setAssignToPersonID:](self, "setAssignToPersonID:", [a3 assigneeIdentifier]);
  -[RingtonePurchase setAssignToContactID:](self, "setAssignToContactID:", [a3 assigneeContactIdentifier]);
  -[RingtonePurchase setShouldMakeDefault:](self, "setShouldMakeDefault:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 shouldMakeDefaultRingtone]));
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 shouldMakeDefaultTextTone]);

  [(RingtonePurchase *)self setShouldMakeDefaultTextTone:v5];
}

- (void)_assignToContactWithID:(id)a3 withIdentifier:(id)a4
{
  id v7 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v9[0] = ISWeakLinkedStringConstantForString();
  v9[1] = ISWeakLinkedStringConstantForString();
  id v8 = objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", a3, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2), 0);
  if (v8) {
    [(RingtonePurchase *)self _assignToContact:v8 inContactStore:v7 withSoundIdentifier:a4];
  }
}

- (void)_assignToPersonWithID:(int)a3 withIdentifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  -[RingtonePurchase _assignToContactWithID:withIdentifier:](self, "_assignToContactWithID:withIdentifier:", [v7 contactIdentifierFromPersonID:v5], a4);
}

- (void)_assignToContact:(id)a3 inContactStore:(id)a4 withSoundIdentifier:(id)a5
{
  id v9 = [a3 mutableCopy];
  id v10 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithSound:a5 vibration:0 ignoreMute:0];
  id v11 = [(RingtonePurchase *)self assigneeToneStyle];
  if ([v11 isEqualToString:SSItemToneStyleTextTone]) {
    [v9 setTextAlert:v10];
  }
  else {
    [v9 setCallAlert:v10];
  }

  id v12 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  [v12 updateContact:v9];
  id v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v28 = 138412802;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2112;
    id v31 = a5;
    __int16 v32 = 2112;
    id v33 = [a3 identifier];
    LODWORD(v26) = 32;
    v25 = &v28;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v28, v26);
      free(v17);
      v25 = (int *)v18;
      SSFileLog();
    }
  }
  v27 = 0;
  if ((objc_msgSend(a4, "executeSaveRequest:error:", v12, &v27, v25) & 1) == 0)
  {
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19) {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_INFO)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v22 = objc_opt_class();
      int v28 = 138412546;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      id v31 = v27;
      LODWORD(v26) = 22;
      uint64_t v23 = _os_log_send_and_compose_impl();
      if (v23)
      {
        v24 = (void *)v23;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v28, v26);
        free(v24);
        SSFileLog();
      }
    }
  }
}

@end
@interface UISceneSession
- (MFActiveDraft)mf_activeDraft;
- (id)mf_debugDescription;
- (id)mf_objectForSessionInfoKey:(id)a3;
- (void)mf_setActiveDraft:(id)a3;
- (void)mf_setObject:(id)a3 forSessionInfoKey:(id)a4;
@end

@implementation UISceneSession

- (MFActiveDraft)mf_activeDraft
{
  v3 = [(UISceneSession *)self mf_objectForSessionInfoKey:MailSceneSessionInfoActiveDraftIdentifier];
  v4 = [(UISceneSession *)self mf_objectForSessionInfoKey:MailSceneSessionInfoActiveDraftOriginalMessageIdentifier];
  v5 = +[EMObjectID objectIDFromSerializedRepresentation:v4];

  v6 = [[MFActiveDraft alloc] initWithIdentifier:v3 andOriginalMessageIdentifier:v5];

  return v6;
}

- (id)mf_objectForSessionInfoKey:(id)a3
{
  id v4 = a3;
  v5 = [(UISceneSession *)self userInfo];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)mf_setActiveDraft:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  [(UISceneSession *)self mf_setObject:v4 forSessionInfoKey:MailSceneSessionInfoActiveDraftIdentifier];

  v5 = [v7 originalMessageIdentifier];
  v6 = [v5 serializedRepresentation];
  [(UISceneSession *)self mf_setObject:v6 forSessionInfoKey:MailSceneSessionInfoActiveDraftOriginalMessageIdentifier];
}

- (void)mf_setObject:(id)a3 forSessionInfoKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(UISceneSession *)self userInfo];
  v8 = (void *)v7;
  v9 = &__NSDictionary0__struct;
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  id v11 = [v10 mutableCopy];
  [v11 setObject:v12 forKeyedSubscript:v6];
  [(UISceneSession *)self setUserInfo:v11];
}

- (id)mf_debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(UISceneSession *)self configuration];
  v5 = [v4 name];
  id v6 = [(UISceneSession *)self persistentIdentifier];
  [v3 appendFormat:@"\t%@ (ID: %@)\n", v5, v6];

  uint64_t v7 = [(UISceneSession *)self mf_activeDraft];
  v8 = [v7 ef_publicDescription];
  [v3 appendFormat:@"\t - Active Draft: %@\n", v8];

  v9 = [(UISceneSession *)self scene];
  CFStringRef v10 = @"YES";
  if (!v9) {
    CFStringRef v10 = @"NO";
  }
  [v3 appendFormat:@"\t - Attached: %@\n", v10];
  if (v9)
  {
    id v11 = [v9 activationState];
    if ((unint64_t)v11 > 2) {
      CFStringRef v12 = @"Unattached";
    }
    else {
      CFStringRef v12 = *(&off_10060E200 + (void)v11);
    }
    [v3 appendFormat:@"\t - Activation State: %@\n", v12];
    v13 = [v9 title];
    [v3 appendFormat:@"\t - Title: %@\n", v13];

    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v3 appendFormat:@"\t - Scene Instance: <%@: %p>\n", v15, v9];

    v16 = [v9 delegate];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v3 appendFormat:@"\t - Scene Delegate: <%@: %p>\n", v18, v16];
  }

  return v3;
}

@end
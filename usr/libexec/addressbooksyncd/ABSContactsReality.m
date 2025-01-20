@interface ABSContactsReality
+ (id)containerForContactIdentifier:(id)a3 store:(id)a4;
- (ABSContactsReality)init;
- (BOOL)ignoreContactAccountIDs;
- (BOOL)isMeContact:(id)a3;
- (id)accountExternalIdentifierForContact:(id)a3 inStore:(id)a4;
- (void)reloadMeIdentifiersForStore:(id)a3;
- (void)setIgnoreContactAccountIDs:(BOOL)a3;
@end

@implementation ABSContactsReality

- (ABSContactsReality)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABSContactsReality;
  return [(ABSContactsReality *)&v3 init];
}

+ (id)containerForContactIdentifier:(id)a3 store:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    NSExceptionName v17 = NSInvalidArgumentException;
    CFStringRef v18 = @"contactIdentifier is nil";
    goto LABEL_13;
  }
  v7 = v6;
  uint64_t v8 = +[CNContainer predicateForContainerOfContactWithIdentifier:v5];
  if (!v8)
  {
    NSExceptionName v17 = NSInternalInconsistencyException;
    CFStringRef v18 = @"received nil predicate";
LABEL_13:
    id v19 = +[NSException exceptionWithName:v17 reason:v18 userInfo:0];
    objc_exception_throw(v19);
  }
  v9 = (void *)v8;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1000193D8;
  v28 = sub_1000193E8;
  id v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000193F0;
  v20[3] = &unk_100055388;
  id v10 = v7;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  v23 = &v24;
  v12 = sub_100005874((uint64_t)v20);
  if (v12 || (v14 = (void *)v25[5]) == 0)
  {
    v13 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100037628((uint64_t)v5, (uint64_t)v12, v13);
    }
    v14 = (void *)v25[5];
  }
  id v15 = v14;

  _Block_object_dispose(&v24, 8);

  return v15;
}

- (id)accountExternalIdentifierForContact:(id)a3 inStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1000193D8;
  v34 = sub_1000193E8;
  id v35 = 0;
  if (!v7)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"ABSContactsReality.m" lineNumber:69 description:@"Attempt to fetch account external identifier for nil contact"];
  }
  v9 = [v7 identifier];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    uint64_t v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"ABSContactsReality.m" lineNumber:70 description:@"CNContact has a nil identifier"];
  }
  if (!v8)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"ABSContactsReality.m" lineNumber:71 description:@"Cannot fetch anything from a nil CNContactStore"];
  }
  if (![(ABSContactsReality *)self ignoreContactAccountIDs])
  {
    id v11 = objc_opt_class();
    v12 = [v7 identifier];
    v13 = [v11 containerForContactIdentifier:v12 store:v8];

    if (v13)
    {
      v14 = [v13 identifier];
      id v15 = +[CNAccount predicateForAccountForContainerWithIdentifier:v14];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100019834;
      v26[3] = &unk_100055388;
      id v27 = v8;
      id v16 = v15;
      id v28 = v16;
      id v29 = &v30;
      NSExceptionName v17 = sub_100005874((uint64_t)v26);
      if (v17 || !v31[5])
      {
        CFStringRef v18 = *(id *)(qword_100069D78 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = [v13 identifier];
          sub_100037708(v19, (uint64_t)v17, buf, v18);
        }
      }
    }
    else
    {
      NSExceptionName v17 = *(id *)(qword_100069D78 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = [v7 identifier];
        sub_1000376B0(v20, buf, v17);
      }
    }
  }
  id v21 = [(id)v31[5] externalIdentifierString];
  _Block_object_dispose(&v30, 8);

  return v21;
}

- (void)reloadMeIdentifiersForStore:(id)a3
{
  id v4 = a3;
  v31 = CNContactIdentifierKey;
  id v5 = +[NSArray arrayWithObjects:&v31 count:1];
  id v29 = 0;
  id v6 = [v4 _ios_meContactWithKeysToFetch:v5 error:&v29];
  id v7 = v29;
  if (!v6)
  {
    id v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_ios_meContactWithKeysToFetch returned nil", buf, 2u);
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v10 = [v6 linkedContacts];
  if (v10)
  {
    id v11 = (void *)v10;
    v12 = [v6 linkedContacts];
    id v13 = [v12 count];

    if (v13)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v14 = [v6 linkedContacts];
      id v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v15)
      {
        id v16 = v15;
        id v23 = v7;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v24 + 1) + 8 * i) identifier];
            [v9 addObject:v19];
          }
          id v16 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v16);
        id v7 = v23;
      }
      goto LABEL_16;
    }
  }
  v20 = [v6 identifier];

  if (v20)
  {
    v14 = [v6 identifier];
    [v9 addObject:v14];
LABEL_16:
  }
  id v21 = (NSSet *)[v9 copy];
  meIdentifiers = self->_meIdentifiers;
  self->_meIdentifiers = v21;
}

- (BOOL)isMeContact:(id)a3
{
  return [(NSSet *)self->_meIdentifiers containsObject:a3];
}

- (BOOL)ignoreContactAccountIDs
{
  return self->_ignoreContactAccountIDs;
}

- (void)setIgnoreContactAccountIDs:(BOOL)a3
{
  self->_ignoreContactAccountIDs = a3;
}

- (void).cxx_destruct
{
}

@end
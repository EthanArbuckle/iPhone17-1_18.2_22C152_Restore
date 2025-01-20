@interface KTContactsStore
- (BOOL)haveContact:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (KTContactsStore)initWithContactStore:(id)a3;
- (void)fetchAndStoreContactsSyncTokenWithConfigStore:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation KTContactsStore

- (KTContactsStore)initWithContactStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTContactsStore;
  v5 = [(KTContactsStore *)&v8 init];
  v6 = v5;
  if (v5) {
    [(KTContactsStore *)v5 setContactStore:v4];
  }

  return v6;
}

- (void)fetchAndStoreContactsSyncTokenWithConfigStore:(id)a3
{
  id v8 = a3;
  id v4 = [(KTContactsStore *)self contactStore];
  v5 = [v4 currentHistoryToken];

  if (v5)
  {
    v6 = [(KTContactsStore *)self contactStore];
    v7 = [v6 currentHistoryToken];
    [v8 setSettingsData:@"lastContactSyncData" data:v7];
  }
}

- (BOOL)haveContact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:@"mailto:"])
  {
    v6 = [v5 substringFromIndex:7];
    v7 = +[CNContact predicateForContactsMatchingEmailAddress:v6];
  }
  else
  {
    if (![v5 hasPrefix:@"tel:"])
    {
      BOOL v13 = 0;
      goto LABEL_7;
    }
    v6 = [v5 substringFromIndex:4];
    id v8 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v6];
    v7 = +[CNContact predicateForContactsMatchingPhoneNumber:v8];
  }
  id v9 = objc_alloc((Class)CNContactFetchRequest);
  v20[0] = CNContactEmailAddressesKey;
  v20[1] = CNContactPhoneNumbersKey;
  v10 = +[NSArray arrayWithObjects:v20 count:2];
  id v11 = [v9 initWithKeysToFetch:v10];

  [v11 setUnifyResults:1];
  [v11 setPredicate:v7];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12 = [(KTContactsStore *)self contactStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000377F0;
  v15[3] = &unk_1002B99D8;
  v15[4] = &v16;
  [v12 enumerateContactsWithFetchRequest:v11 error:0 usingBlock:v15];

  BOOL v13 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);

LABEL_7:
  return v13;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
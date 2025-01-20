@interface AddressBookObserver
- ($5E5F304956FB491AF6F034FDF0808287)getDatabaseIdentifier;
- ($5E5F304956FB491AF6F034FDF0808287)getPrimaryFolderVersionForAddressBook:(int)a3;
- ($5E5F304956FB491AF6F034FDF0808287)getSecondaryFolderVersionForAddressBook:(int)a3;
- (AddressBookObserver)init;
- (BOOL)_incrementOI_UINT128:(id *)a3;
- (NSMutableDictionary)primaryFolderVersions;
- (NSMutableDictionary)secondaryFolderVersions;
- (NSUUID)databaseIdentifier;
- (id)_addressBookToString:(int)a3;
- (void)_handleCNContactStoreDidChangeNotification:(id)a3;
- (void)_incrementPrimaryFolderVersionForAddressBook:(int)a3;
- (void)_incrementSecondaryFolderVersionForAddressBook:(int)a3;
- (void)_initializeDatabaseIdentifer;
- (void)_initializePrimaryFolderVersions;
- (void)_initializeSecondaryFolderVersions;
- (void)incrementMainAddressBookVersions;
- (void)setDatabaseIdentifier:(id)a3;
- (void)setPrimaryFolderVersions:(id)a3;
- (void)setSecondaryFolderVersions:(id)a3;
@end

@implementation AddressBookObserver

- (AddressBookObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)AddressBookObserver;
  v2 = [(AddressBookObserver *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10073845C, CNFavoritesChangedExternallyNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(AddressBookObserver *)v2 _initializePrimaryFolderVersions];
    [(AddressBookObserver *)v2 _initializeSecondaryFolderVersions];
    [(AddressBookObserver *)v2 _initializeDatabaseIdentifer];
  }
  return v2;
}

- ($5E5F304956FB491AF6F034FDF0808287)getPrimaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(AddressBookObserver *)self primaryFolderVersions];
  objc_super v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [v5 objectForKey:v6];

  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [v7 getValue:&v16];
  v8 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_INFO))
  {
    int v10 = v16;
    int v9 = HIDWORD(v16);
    int v12 = v17;
    int v11 = HIDWORD(v17);
    v13 = [(AddressBookObserver *)self _addressBookToString:v3];
    *(_DWORD *)buf = 67110146;
    int v19 = v10;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    int v23 = v12;
    __int16 v24 = 1024;
    int v25 = v11;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retrieving primary folder version %u-%u-%u-%u for '%@'", buf, 0x24u);
  }
  uint64_t v14 = v16;
  uint64_t v15 = v17;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- ($5E5F304956FB491AF6F034FDF0808287)getSecondaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(AddressBookObserver *)self secondaryFolderVersions];
  objc_super v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [v5 objectForKey:v6];

  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [v7 getValue:&v16];
  v8 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_INFO))
  {
    int v10 = v16;
    int v9 = HIDWORD(v16);
    int v12 = v17;
    int v11 = HIDWORD(v17);
    v13 = [(AddressBookObserver *)self _addressBookToString:v3];
    *(_DWORD *)buf = 67110146;
    int v19 = v10;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    int v23 = v12;
    __int16 v24 = 1024;
    int v25 = v11;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retrieving secondary folder version %u-%u-%u-%u for '%@'", buf, 0x24u);
  }
  uint64_t v14 = v16;
  uint64_t v15 = v17;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- ($5E5F304956FB491AF6F034FDF0808287)getDatabaseIdentifier
{
  v17[0] = 0;
  v17[1] = 0;
  v2 = [(AddressBookObserver *)self databaseIdentifier];
  [v2 getUUIDBytes:v17];

  uint64_t v3 = +[NSData dataWithBytes:v17 length:16];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [v3 getBytes:&v7 range:0, 4];
  [v3 getBytes:&v7 + 4 range:4];
  [v3 getBytes:&v8 range:8, 4];
  [v3 getBytes:&v8 + 4 range:4];
  v4 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    int v10 = v7;
    __int16 v11 = 1024;
    int v12 = HIDWORD(v7);
    __int16 v13 = 1024;
    int v14 = v8;
    __int16 v15 = 1024;
    int v16 = HIDWORD(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Retrieving database identifier %u-%u-%u-%u", buf, 0x1Au);
  }

  uint64_t v5 = v7;
  uint64_t v6 = v8;
  result.var2 = v6;
  result.var3 = HIDWORD(v6);
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (void)incrementMainAddressBookVersions
{
  [(AddressBookObserver *)self _incrementPrimaryFolderVersionForAddressBook:2];

  [(AddressBookObserver *)self _incrementSecondaryFolderVersionForAddressBook:2];
}

- (void)_incrementPrimaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(AddressBookObserver *)self _addressBookToString:v3];
    LODWORD(v11) = 138412290;
    *(void *)((char *)&v11 + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incrementing primary folder version for '%@'", (uint8_t *)&v11, 0xCu);
  }
  *(void *)&long long v11 = [(AddressBookObserver *)self getPrimaryFolderVersionForAddressBook:v3];
  *((void *)&v11 + 1) = v7;
  if ([(AddressBookObserver *)self _incrementOI_UINT128:&v11]) {
    [(AddressBookObserver *)self _initializeDatabaseIdentifer];
  }
  uint64_t v8 = +[NSValue value:&v11 withObjCType:"{?=IIII}"];
  int v9 = [(AddressBookObserver *)self primaryFolderVersions];
  int v10 = +[NSNumber numberWithUnsignedInt:v3];
  [v9 setObject:v8 forKey:v10];
}

- (void)_incrementSecondaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(AddressBookObserver *)self _addressBookToString:v3];
    LODWORD(v11) = 138412290;
    *(void *)((char *)&v11 + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incrementing secondary folder version for '%@'", (uint8_t *)&v11, 0xCu);
  }
  *(void *)&long long v11 = [(AddressBookObserver *)self getSecondaryFolderVersionForAddressBook:v3];
  *((void *)&v11 + 1) = v7;
  if ([(AddressBookObserver *)self _incrementOI_UINT128:&v11]) {
    [(AddressBookObserver *)self _initializeDatabaseIdentifer];
  }
  uint64_t v8 = +[NSValue value:&v11 withObjCType:"{?=IIII}"];
  int v9 = [(AddressBookObserver *)self secondaryFolderVersions];
  int v10 = +[NSNumber numberWithUnsignedInt:v3];
  [v9 setObject:v8 forKey:v10];
}

- (BOOL)_incrementOI_UINT128:(id *)a3
{
  unsigned int var3 = a3->var3;
  if (var3 == -1)
  {
    unsigned int var2 = a3->var2;
    if (var2 == -1)
    {
      unsigned int var1 = a3->var1;
      BOOL result = var1 == -1 && a3->var0++ == -1;
      a3->unsigned int var1 = var1 + 1;
    }
    else
    {
      BOOL result = 0;
    }
    a3->unsigned int var2 = var2 + 1;
  }
  else
  {
    BOOL result = 0;
  }
  a3->unsigned int var3 = var3 + 1;
  return result;
}

- (void)_initializePrimaryFolderVersions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(AddressBookObserver *)self setPrimaryFolderVersions:v3];

  v14[0] = 0;
  v14[1] = 0;
  v4 = +[NSValue value:v14 withObjCType:"{?=IIII}"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [&off_1009E1A98 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&off_1009E1A98);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        int v9 = [(AddressBookObserver *)self primaryFolderVersions];
        [v9 setObject:v4 forKey:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_1009E1A98 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_initializeSecondaryFolderVersions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(AddressBookObserver *)self setSecondaryFolderVersions:v3];

  v14[0] = 0;
  v14[1] = 0;
  v4 = +[NSValue value:v14 withObjCType:"{?=IIII}"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [&off_1009E1AB0 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&off_1009E1AB0);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        int v9 = [(AddressBookObserver *)self secondaryFolderVersions];
        [v9 setObject:v4 forKey:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_1009E1AB0 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_initializeDatabaseIdentifer
{
  id v3 = +[NSUUID UUID];
  -[AddressBookObserver setDatabaseIdentifier:](self, "setDatabaseIdentifier:");
}

- (id)_addressBookToString:(int)a3
{
  if ((a3 - 2) > 6) {
    return @"Invalid";
  }
  else {
    return off_1009C0CD8[a3 - 2];
  }
}

- (void)_handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = qword_100A19EF0;
  if (os_log_type_enabled((os_log_t)qword_100A19EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received 'contact store changed' notification", v6, 2u);
  }
  [(AddressBookObserver *)self _incrementPrimaryFolderVersionForAddressBook:2];
  [(AddressBookObserver *)self _incrementSecondaryFolderVersionForAddressBook:2];
}

- (NSMutableDictionary)primaryFolderVersions
{
  return self->_primaryFolderVersions;
}

- (void)setPrimaryFolderVersions:(id)a3
{
}

- (NSMutableDictionary)secondaryFolderVersions
{
  return self->_secondaryFolderVersions;
}

- (void)setSecondaryFolderVersions:(id)a3
{
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFolderVersions, 0);

  objc_storeStrong((id *)&self->_primaryFolderVersions, 0);
}

@end
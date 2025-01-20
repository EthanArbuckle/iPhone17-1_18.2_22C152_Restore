void _resetDataSourceState()
{
  if (sDataSourceCreators)
  {
    CFRelease((CFTypeRef)sDataSourceCreators);
    sDataSourceCreators = 0;
  }
}

uint64_t CreateDataSourceForDataClassName(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef *a5)
{
  if (a3)
  {
    if (a1)
    {
      if ((sDataSourcesInitialized & 1) == 0)
      {
        _dataSourceRegisterCreatorForDataClassName(@"com.apple.Bookmarks", (uint64_t)a5);
        _dataSourceRegisterCreatorForDataClassName(@"com.apple.Calendars", (uint64_t)a5);
        _dataSourceRegisterCreatorForDataClassName(@"com.apple.Contacts", (uint64_t)a5);
        _dataSourceRegisterCreatorForDataClassName(@"com.apple.MailAccounts", (uint64_t)a5);
        sDataSourcesInitialized = 1;
      }
      if (DLShouldLog()) {
        _DLLog();
      }
      if (sDataSourceCreators
        && (Value = (uint64_t (*)(uint64_t, uint64_t, uint64_t, CFStringRef *))CFDictionaryGetValue((CFDictionaryRef)sDataSourceCreators, a1)) != 0)
      {
        return Value(a3, a2, a4, a5);
      }
      else
      {
        if (a5) {
          *a5 = CFStringCreateWithFormat(0, 0, @"CreateDataSourceForDataClassName: Data Source is not registered for %@", a1);
        }
        return 0xFFFFFFFFLL;
      }
    }
    v12 = @"CreateDataSourceForDataClassName: Parameter for dataClassName is NULL";
  }
  else
  {
    v12 = @"CreateDataSourceForDataClassName: Out parameter for dataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a5, v12);
}

uint64_t DataSourceDeleteDataSource(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 128))();
  }
  else {
    return MEMORY[0x270F4ADB8](4294967293, a2, @"DataSourceDeleteDataSource: DataSource is NULL");
  }
}

uint64_t DataSourceShouldLockData(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t DataSourceLockFilePath(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t DataSourceGetVersion(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t DataSourceCanSyncWithVersion(uint64_t a1, const __CFNumber *a2, void *a3, uint64_t a4)
{
  CFNumberRef number = 0;
  (*(void (**)(uint64_t, CFNumberRef *, uint64_t))(a1 + 16))(a1, &number, a4);
  uint64_t valuePtr = 0;
  if (a2 && number)
  {
    CFNumberGetValue(number, kCFNumberIntType, (char *)&valuePtr + 4);
    CFNumberGetValue(a2, kCFNumberIntType, &valuePtr);
    if (valuePtr != -1 && SHIDWORD(valuePtr) > (int)valuePtr)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t, const __CFNumber *, void *, uint64_t))(a1 + 24))(a1, a2, a3, a4);
      goto LABEL_11;
    }
    uint64_t v10 = 0;
    v9 = (void *)MEMORY[0x263EFFB40];
  }
  else
  {
    uint64_t v10 = 0;
    v9 = (void *)MEMORY[0x263EFFB38];
  }
  *a3 = *v9;
LABEL_11:
  if (DLShouldLog()) {
    _DLLog();
  }
  return v10;
}

uint64_t DataSourceMigrateRecords(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1)
  {
    v5 = @"DataSourceMigrateRecords: source DataSource is NULL";
    return MEMORY[0x270F4ADB8](4294967293, a3, v5);
  }
  if (!a2)
  {
    v5 = @"DataSourceMigrateRecords: destination DataSource is NULL";
    return MEMORY[0x270F4ADB8](4294967293, a3, v5);
  }
  if (a1 == a2)
  {
    v5 = @"DataSourceMigrateRecords: What are you thinking?? You can't migrate from and to the same store.";
    return MEMORY[0x270F4ADB8](4294967293, a3, v5);
  }
  v3 = *(uint64_t (**)(void))(a1 + 32);
  if (v3) {
    return v3();
  }
  else {
    return 0;
  }
}

uint64_t DataSourceRemoveStore(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return MEMORY[0x270F4ADB8](4294967293, a3, @"DataSourceRemoveStore: DataSource is NULL");
  }
  v3 = *(uint64_t (**)(void))(a1 + 40);
  if (v3) {
    return v3();
  }
  else {
    return 0;
  }
}

uint64_t DataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CFTypeRef *a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a5)
      {
        if (a6)
        {
          uint64_t v8 = (*(uint64_t (**)(void))(a1 + 48))();
          if (*a5)
          {
            if (CFEqual((CFStringRef)*a5, @"---DATACLASS_CLEARED---"))
            {
              CFRelease(*a5);
              *a5 = 0;
            }
          }
          return v8;
        }
        uint64_t v10 = @"SADataSourceGetSyncTypeAndSyncAnchors: Out parameter for nextDeviceAnchor is NULL";
      }
      else
      {
        uint64_t v10 = @"SADataSourceGetSyncTypeAndSyncAnchors: Out parameter for previousComputerAnchor is NULL";
      }
    }
    else
    {
      uint64_t v10 = @"SADataSourceGetSyncTypeAndSyncAnchors: Out parameter for syncType is NULL";
    }
  }
  else
  {
    uint64_t v10 = @"SADataSourceGetSyncTypeAndSyncAnchors: DataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a7, v10);
}

uint64_t DataSourceClearSyncAnchors(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return MEMORY[0x270F4ADB8](4294967293, a2, @"DataSourceClearSyncAnchors: DataSource is NULL");
  }
  v2 = *(uint64_t (**)(void))(a1 + 56);
  if (v2) {
    return v2();
  }
  else {
    return 0;
  }
}

uint64_t DataSourceClearAllRecords(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 64))();
  }
  else {
    return MEMORY[0x270F4ADB8](4294967293, a2, @"DataSourceClearAllRecords: DataSource is NULL");
  }
}

uint64_t DataSourceGetChanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (a2)
    {
      if (a3) {
        return (*(uint64_t (**)(void))(a1 + 72))();
      }
      v5 = @"DataSourceGetChanges: Out parameter for moreComing is NULL";
    }
    else
    {
      v5 = @"DataSourceGetChanges: Out parameter for changes is NULL";
    }
  }
  else
  {
    v5 = @"DataSourceGetChanges: DataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a4, v5);
}

uint64_t DataSourceGetAllRecords(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (a2)
    {
      if (a3) {
        return (*(uint64_t (**)(void))(a1 + 80))();
      }
      v5 = @"DataSourceGetAllRecords: Out parameter for moreComing is NULL";
    }
    else
    {
      v5 = @"DataSourceGetAllRecords: Out parameter for records is NULL";
    }
  }
  else
  {
    v5 = @"DataSourceGetAllRecords: DataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a4, v5);
}

uint64_t DataSourceGetCountOfRecords(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return (*(uint64_t (**)(void))(a1 + 88))();
    }
    v4 = @"DataSourceGetCountOfRecords: Out parameter for count is NULL";
  }
  else
  {
    v4 = @"DataSourceGetCountOfRecords: DataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a3, v4);
}

uint64_t DataSourceProcessChanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a4) {
        return (*(uint64_t (**)(void))(a1 + 96))();
      }
      v7 = @"DataSourceProcessChanges: Out parameter for oldToNewIdentifiers is NULL";
    }
    else
    {
      v7 = @"DataSourceProcessChanges: changes parameter is NULL";
    }
  }
  else
  {
    v7 = @"DataSourceProcessChanges: DataSource is NULL";
  }
  return MEMORY[0x270F4ADB8](4294967293, a6, v7);
}

uint64_t DataSourceCommit(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 104))();
  }
  else {
    return MEMORY[0x270F4ADB8](4294967293, a2, @"DataSourceCommit: DataSource is NULL");
  }
}

uint64_t DataSourceRollback(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 112))();
  }
  else {
    return MEMORY[0x270F4ADB8](4294967293, a2, @"DataSourceRollback: DataSource is NULL");
  }
}

uint64_t DataSourceGetEntityTypeProcessOrder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 120))();
  }
  else {
    return MEMORY[0x270F4ADB8](4294967293, a3, @"DataSourceGetEntityTypeProcessOrder: DataSource is NULL");
  }
}

void _dataSourceRegisterCreatorForDataClassName(CFStringRef theString1, uint64_t a2)
{
  if (theString1)
  {
    if (!sDataSourceCreators) {
      sDataSourceCreators = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], 0);
    }
    CFComparisonResult v4 = CFStringCompare(theString1, @"com.apple.Bookmarks", 0);
    v5 = BookmarksDataSourceCreator;
    if (v4)
    {
      CFComparisonResult v6 = CFStringCompare(theString1, @"com.apple.Calendars", 0);
      v5 = CalendarsDataSourceCreator;
      if (v6)
      {
        CFComparisonResult v7 = CFStringCompare(theString1, @"com.apple.Contacts", 0);
        v5 = ContactsDataSourceCreator;
        if (v7)
        {
          CFComparisonResult v8 = CFStringCompare(theString1, @"com.apple.MailAccounts", 0);
          v5 = MailAccountsDataSourceCreator;
          if (v8) {
            v5 = 0;
          }
        }
      }
    }
    v9 = (__CFDictionary *)sDataSourceCreators;
    CFDictionarySetValue(v9, theString1, v5);
  }
  else
  {
    MEMORY[0x270F4ADB8](4294967293, a2, @"_dataSourceRegisterCreatorForDataClassName: Parameter for dataClassName is NULL");
  }
}

uint64_t ContactsDataSourceCreator(void *a1, uint64_t a2, const __CFDictionary *a3, CFStringRef *a4)
{
  CFComparisonResult v8 = (char *)malloc_type_calloc(0x1C0uLL, 1uLL, 0x373D4789uLL);
  *a1 = v8;
  *(void *)CFComparisonResult v8 = *MEMORY[0x263EFFB38];
  *((void *)v8 + 2) = ContactsDataSourceGetVersionFunction;
  *((void *)v8 + 3) = ContactsDataSourceCanSyncWithVersionFunction;
  *((void *)v8 + 4) = ContactsDataSourceMigrateFunction;
  *((void *)v8 + 5) = ContactsDataSourceRemoveStoreFunction;
  *((void *)v8 + 6) = ContactsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((void *)v8 + 7) = ContactsDataSourceClearSyncAnchors;
  *((void *)v8 + 8) = ContactsDataSourceClearAllRecords;
  *((void *)v8 + 9) = ContactsDataSourceGetChanges;
  *((void *)v8 + 10) = ContactsDataSourceGetAllRecords;
  *((void *)v8 + 11) = ContactsDataSourceGetCountOfRecords;
  *((void *)v8 + 12) = ContactsDataSourceProcessChanges;
  *((void *)v8 + 13) = ContactsDataSourceCommit;
  *((void *)v8 + 14) = ContactsDataSourceRollback;
  *((void *)v8 + 16) = ContactsDataSourceDeleteDataSource;
  *((void *)v8 + 15) = ContactsDataSourceGetEntityTypeProcessOrder;
  v8[136] = 0;
  v8[138] = 0;
  *((_DWORD *)v8 + 35) = 0;
  *((void *)v8 + 22) = 0;
  *((_DWORD *)v8 + 108) = 0;
  *((void *)v8 + 32) = 0;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 12) = 0u;
  *((_OWORD *)v8 + 13) = 0u;
  *(_OWORD *)(v8 + 280) = 0u;
  *(_OWORD *)(v8 + 296) = 0u;
  *(_OWORD *)(v8 + 312) = 0u;
  *(_OWORD *)(v8 + 328) = 0u;
  *(_OWORD *)(v8 + 344) = 0u;
  *(_OWORD *)(v8 + 360) = 0u;
  *(_OWORD *)(v8 + 376) = 0u;
  *(_OWORD *)(v8 + 392) = 0u;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  *((void *)v8 + 51) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((void *)v8 + 52) = CFDictionaryCreateMutable(v9, 0, v10, v11);
  CFErrorRef error = 0;
  ABAddressBookRef v12 = ABAddressBookCreateWithOptions(0, &error);
  *((void *)v8 + 18) = v12;
  if (!v12)
  {
    if (DLShouldLog()) {
      goto LABEL_98;
    }
    return 0xFFFFFFFFLL;
  }
  ABAddressBookSetIsBackgroundProcess();
  *((_WORD *)v8 + 220) = 0;
  if (a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, @"UseImageChangedPlaceholder");
    if (Value)
    {
      v8[440] = CFBooleanGetValue(Value) != 0;
      if (DLShouldLog()) {
        _DLLog();
      }
    }
    CFBooleanRef v14 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"UpdateAnchorsOnPull");
    if (v14)
    {
      v8[441] = CFBooleanGetValue(v14) != 0;
      if (DLShouldLog()) {
        _DLLog();
      }
    }
  }
  v8[443] = 0;
  CFErrorRef v45 = 0;
  if (!a2)
  {
    uint64_t v29 = ABAddressBookCopyLocalSource();
    *((void *)v8 + 19) = v29;
    if (v29)
    {
      v8[443] = 1;
    }
    else if (a4)
    {
      *a4 = @"Could not get the default address book store";
    }
    goto LABEL_92;
  }
  CFArrayRef v15 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier();
  CFArrayRef v16 = v15;
  if (v15 && CFArrayGetCount(v15) >= 1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v16, 0);
    CFRetain(ValueAtIndex);
LABEL_19:
    CFRelease(v16);
    goto LABEL_20;
  }
  v18 = (void *)ABAddressBookCopySourceWithAccountAndExternalIdentifiers();
  ValueAtIndex = v18;
  if (v18)
  {
    CFTypeRef v19 = ABRecordCopyValue(v18, *MEMORY[0x263F245D0]);
    if (v19)
    {
      v20 = v19;
      _makeAccountForSource((uint64_t)v8, ValueAtIndex);
      CFRelease(v20);
    }
  }
  if (v16) {
    goto LABEL_19;
  }
LABEL_20:
  BOOL v21 = ValueAtIndex == 0;
  v22 = (__CFError *)ValueAtIndex;
  if (ValueAtIndex) {
    goto LABEL_102;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v30 = ABSourceCreate();
  if (!v30)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a4)
    {
      *a4 = @"Could not create an AddressBook store";
      CFRetain(@"Could not create an AddressBook store");
    }
    goto LABEL_92;
  }
  v22 = (__CFError *)v30;
  if (DLShouldLog()) {
    _DLLog();
  }
  if (!_makeAccountForSource((uint64_t)v8, v22))
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a4) {
      *a4 = CFStringCreateWithFormat(0, 0, @"Could not set external identifier on AB store: %@", 0);
    }
    CFErrorRef v33 = v22;
    goto LABEL_91;
  }
  BOOL v31 = ABAddressBookAddRecord(*((ABAddressBookRef *)v8 + 18), v22, &v45);
  if (!v31)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a4) {
      *a4 = CFStringCreateWithFormat(0, 0, @"Could not add store to AddressBook: %@", v45);
    }
    CFRelease(v22);
    v22 = 0;
  }
  if (v45)
  {
    CFRelease(v45);
    CFErrorRef v45 = 0;
  }
  char v32 = !v31;
  if (!v22) {
    char v32 = 1;
  }
  if ((v32 & 1) == 0)
  {
LABEL_102:
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a3)
    {
      v23 = CFDictionaryGetValue(a3, @"StoreDisplayName");
      if (v23)
      {
        if (!ABRecordSetValue(v22, *MEMORY[0x263F245D8], v23, &v45) && DLShouldLog()) {
          _DLLog();
        }
        if (v45)
        {
          CFRelease(v45);
          CFErrorRef v45 = 0;
        }
      }
      v24 = CFDictionaryGetValue(a3, @"StoreType");
      if (v24)
      {
        if (!ABRecordSetValue(v22, *MEMORY[0x263F245E0], v24, &v45) && DLShouldLog()) {
          _DLLog();
        }
        if (v45)
        {
          CFRelease(v45);
          CFErrorRef v45 = 0;
        }
      }
      CFBooleanRef v25 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"SetAsDefault");
      if (v25 && CFBooleanGetValue(v25))
      {
        ABRecordRef v26 = ABAddressBookCopyDefaultSource(*((ABAddressBookRef *)v8 + 18));
        if (v26)
        {
          v27 = v26;
          ABRecordID RecordID = ABRecordGetRecordID(v26);
          CFRelease(v27);
        }
        else
        {
          ABRecordID RecordID = -1;
        }
        CFBooleanRef v34 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"SetAsDefaultOnlyIfNotSet");
        if (v34) {
          CFBooleanGetValue(v34);
        }
        if (DLShouldLog())
        {
          ABRecordGetRecordID(v22);
          _DLLog();
        }
        if (!ValueAtIndex) {
          ABAddressBookProcessAddedRecords();
        }
        ABAddressBookSetDefaultSource();
        ABRecordRef v35 = ABAddressBookCopyDefaultSource(*((ABAddressBookRef *)v8 + 18));
        if (v35)
        {
          v36 = v35;
          ABRecordID v37 = ABRecordGetRecordID(v35);
          CFRelease(v36);
        }
        else
        {
          ABRecordID v37 = -1;
        }
        if (v37 != RecordID)
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          BOOL v21 = 1;
        }
      }
    }
    v38 = (const void *)*((void *)v8 + 19);
    if (v38) {
      CFRelease(v38);
    }
    *((void *)v8 + 19) = v22;
    if (!v21) {
      goto LABEL_92;
    }
  }
  else if (!v31)
  {
    goto LABEL_92;
  }
  CFErrorRef v44 = 0;
  ABAddressBookSave(*((ABAddressBookRef *)v8 + 18), &v44);
  if (v44)
  {
    *a4 = CFStringCreateWithFormat(0, 0, @"Could not save new AddressBook store: %@", v44);
    CFErrorRef v33 = v44;
    if (v44) {
LABEL_91:
    }
      CFRelease(v33);
  }
LABEL_92:
  if (!*((void *)v8 + 19))
  {
    if (DLShouldLog()) {
LABEL_98:
    }
      _DLLog();
    return 0xFFFFFFFFLL;
  }
  *((_DWORD *)v8 + 106) = 0;
  *((void *)v8 + 20) = 0;
  *((void *)v8 + 21) = 0;
  LOBYTE(v45) = 0;
  AppIntegerCFBooleanRef Value = CFPreferencesGetAppIntegerValue(@"MaxCompressedImageSize", @"com.apple.SyncAgent", (Boolean *)&v45);
  if ((_BYTE)v45) {
    int v40 = AppIntegerValue;
  }
  else {
    int v40 = 768000;
  }
  *((_DWORD *)v8 + 107) = v40;
  ABChangeHistorySetAddressBookClientIdentifier();
  int v41 = ABChangeHistoryRegisterClientForSource();
  uint64_t result = 0;
  *((_DWORD *)v8 + 109) = v41;
  v8[442] = 0;
  return result;
}

uint64_t ContactsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3 = (CFNumberRef)sContactsDataSourceVersionNumber;
  if (!sContactsDataSourceVersionNumber)
  {
    int valuePtr = 106;
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    sContactsDataSourceVersionNumber = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t ContactsDataSourceCanSyncWithVersionFunction(uint64_t a1, CFNumberRef number, void *a3)
{
  int valuePtr = 0;
  CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
  int v5 = valuePtr;
  if (valuePtr == 104)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  else
  {
    if (valuePtr != 103) {
      goto LABEL_9;
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    *(unsigned char *)(a1 + 138) = 1;
  }
  int v5 = valuePtr;
LABEL_9:
  if (v5 <= 105)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    *(unsigned char *)(a1 + 440) = 0;
    int v5 = valuePtr;
  }
  if (v5 <= 102) {
    CFComparisonResult v6 = (void *)MEMORY[0x263EFFB38];
  }
  else {
    CFComparisonResult v6 = (void *)MEMORY[0x263EFFB40];
  }
  *a3 = *v6;
  return 0;
}

uint64_t ContactsDataSourceMigrateFunction(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294967293;
  if (a1 && a2)
  {
    if (DLShouldLog())
    {
      ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
      ABRecordGetRecordID(*(ABRecordRef *)(a2 + 152));
      _DLLog();
    }
    if (ABAddressBookMoveAllRecordsInSourceToSource())
    {
      ContactsDataSourceClearSyncAnchors(a1);
      ContactsDataSourceClearSyncAnchors(a2);
      return 0;
    }
    else
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ContactsDataSourceRemoveStoreFunction(uint64_t a1, const __CFDictionary *a2)
{
  CFErrorRef error = 0;
  _setComputerSyncAnchorForStore(a1);
  _setDeviceSyncAnchorForStore(a1);
  ABRecordRef v4 = ABAddressBookCopyDefaultSource(*(ABAddressBookRef *)(a1 + 144));
  if (v4)
  {
    int v5 = v4;
    ABRecordID RecordID = ABRecordGetRecordID(v4);
    CFRelease(v5);
  }
  else
  {
    ABRecordID RecordID = -1;
  }
  if (!ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152)))
  {
    CFArrayRef v8 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
    if (v8)
    {
      CFArrayRef v9 = v8;
      CFIndex Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        CFIndex v11 = Count;
        for (CFIndex i = 0; i != v11; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), ValueAtIndex, &error)
            && DLShouldLog())
          {
            ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
            _DLLog();
          }
        }
      }
      CFRelease(v9);
    }
    CFArrayRef v14 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
    if (v14)
    {
      CFArrayRef v15 = v14;
      CFIndex v16 = CFArrayGetCount(v14);
      if (v16 >= 1)
      {
        CFIndex v17 = v16;
        for (CFIndex j = 0; j != v17; ++j)
        {
          CFTypeRef v19 = CFArrayGetValueAtIndex(v15, j);
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), v19, &error) && DLShouldLog())
          {
            ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
            _DLLog();
          }
        }
      }
      CFRelease(v15);
    }
LABEL_26:
    if (!a2 || CFDictionaryGetValue(a2, @"ClearDefaultStore") != (const void *)*MEMORY[0x263EFFB40]) {
      return (ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) - 1);
    }
    goto LABEL_28;
  }
  ABRecordID v7 = ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
  if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152), &error)
    && DLShouldLog())
  {
    ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
    _DLLog();
  }
  if (v7 != RecordID) {
    goto LABEL_26;
  }
LABEL_28:
  CFArrayRef v20 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
  if (v20)
  {
    CFArrayRef v21 = v20;
    CFIndex v22 = CFArrayGetCount(v20);
    if (v22 >= 1)
    {
      CFIndex v23 = v22;
      CFIndex v24 = 0;
      ABPropertyID v25 = *MEMORY[0x263F245E0];
      do
      {
        ABRecordRef v26 = CFArrayGetValueAtIndex(v21, v24);
        int valuePtr = -1;
        CFNumberRef v27 = (const __CFNumber *)ABRecordCopyValue(v26, v25);
        if (v27)
        {
          CFNumberRef v28 = v27;
          CFNumberGetValue(v27, kCFNumberIntType, &valuePtr);
          if (valuePtr)
          {
            CFRetain(v26);
            CFRelease(v28);
            if (v26) {
              goto LABEL_38;
            }
          }
          else
          {
            CFRelease(v28);
          }
        }
        ++v24;
      }
      while (v23 != v24);
    }
    ABRecordRef v26 = 0;
LABEL_38:
    CFRelease(v21);
  }
  else
  {
    ABRecordRef v26 = 0;
  }
  uint64_t v29 = *(const void **)(a1 + 152);
  if (v29) {
    CFRelease(v29);
  }
  *(void *)(a1 + 152) = v26;
  ABAddressBookSetDefaultSource();
  return (ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) - 1);
}

uint64_t ContactsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, const __CFString *a3, const __CFString *cf, uint64_t *a5, CFTypeRef *a6)
{
  v31[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFStringRef v12 = _copyComputerSyncAnchorKey(a1);
    uint64_t v13 = ABAddressBookCopyValue();
    if (!v13)
    {
      CFStringRef v14 = (const __CFString *)ABAddressBookCopyValue();
      if (v14)
      {
        CFStringRef v15 = v14;
        if (CFStringCompare(v14, @"__UNUSED__", 0))
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          ABAddressBookSetValue();
          ABAddressBookSetValue();
          uint64_t v13 = (uint64_t)CFRetain(v15);
        }
        else
        {
          uint64_t v13 = 0;
        }
        CFRelease(v15);
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    if (v12) {
      CFRelease(v12);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (cf
    && (*(void *)(a1 + 168) = CFRetain(cf),
        CFEqual(cf, @"---DATACLASS_CLEARED---")))
  {
    ABChangeHistoryUnregisterClientForSource();
    int v16 = 0;
  }
  else
  {
    int v16 = 1;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = CFRetain(@"SDSyncTypeFast");
  *a5 = v13;
  CFStringRef v17 = _copyDeviceSyncAnchorKey(a1);
  CFStringRef v18 = (const __CFString *)ABAddressBookCopyValue();
  if (!v18)
  {
    CFStringRef v19 = (const __CFString *)ABAddressBookCopyValue();
    if (v19)
    {
      CFStringRef v20 = v19;
      if (CFStringCompare(v19, @"__UNUSED__", 0))
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        ABAddressBookSetValue();
        ABAddressBookSetValue();
        CFStringRef v18 = (const __CFString *)CFRetain(v20);
      }
      else
      {
        CFStringRef v18 = 0;
      }
      CFRelease(v20);
    }
    else
    {
      CFStringRef v18 = 0;
    }
  }
  if (v17) {
    CFRelease(v17);
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  if (v18)
  {
    if (a3 && CFEqual(v18, a3))
    {
      if (!v16) {
        goto LABEL_39;
      }
      ABRecordRef v26 = (const void *)*MEMORY[0x263F242D8];
      v31[0] = *MEMORY[0x263F242D8];
      [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      uint64_t v27 = 0;
      int v28 = 0;
      do
      {
        CFDictionaryRef EntityChangesSinceSequenceNumberForClient = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
        if (EntityChangesSinceSequenceNumberForClient)
        {
          CFDictionaryRef v30 = EntityChangesSinceSequenceNumberForClient;
          if (CFDictionaryGetCount(EntityChangesSinceSequenceNumberForClient) >= 1) {
            v28 |= objc_msgSend((id)CFDictionaryGetValue(v30, v26), "BOOLValue");
          }
        }
        v27 += 4;
      }
      while (v27 != 12);
      if ((v28 & 1) == 0) {
        goto LABEL_39;
      }
      if (DLShouldLog()) {
        goto LABEL_37;
      }
    }
    else if (DLShouldLog())
    {
LABEL_37:
      _DLLog();
    }
    *a2 = CFRetain(@"SDSyncTypeSlow");
LABEL_39:
    CFRelease(v18);
    goto LABEL_43;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = CFRetain(@"SDSyncTypeReset");
LABEL_43:
  CFLocaleRef v21 = CFLocaleCopyCurrent();
  CFIndex v22 = CFDateFormatterCreate(0, v21, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
  CFDateFormatterSetFormat(v22, @"MMM dd yyyy HH:mm:ss ZZZ");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(0, v22, Current);
  *(void *)(a1 + 160) = StringWithAbsoluteTime;
  *a6 = CFRetain(StringWithAbsoluteTime);
  if (DLShouldLog()) {
    _DLLog();
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v21) {
    CFRelease(v21);
  }
  return 0;
}

uint64_t ContactsDataSourceClearSyncAnchors(uint64_t a1)
{
  CFErrorRef error = 0;
  _setComputerSyncAnchorForStore(a1);
  _setDeviceSyncAnchorForStore(a1);
  BOOL v2 = ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error);
  if (error) {
    CFRelease(error);
  }
  return (v2 - 1);
}

uint64_t ContactsDataSourceClearAllRecords(uint64_t a1)
{
  CFArrayRef v2 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v2)
  {
    CFArrayRef v3 = v2;
    _RemoveRecordsFromAddressBook(a1, v2, 0);
    CFRelease(v3);
  }
  CFArrayRef v4 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v4)
  {
    CFArrayRef v5 = v4;
    _RemoveRecordsFromAddressBook(a1, v4, (void (*)(uint64_t, const void *))_SaveClearedPersonsSounds);
    CFRelease(v5);
  }
  if ((*(_DWORD *)(a1 + 436) & 0x80000000) == 0) {
    ABChangeHistoryClearChangesUpToSequenceNumberForClient();
  }
  if (!*(void *)(a1 + 160)) {
    *(void *)(a1 + 160) = CFRetain(@"---");
  }
  _setDeviceSyncAnchorForStore(a1);
  return 0;
}

uint64_t ContactsDataSourceGetChanges(uint64_t a1, __CFDictionary **a2, const __CFAllocator *a3, void *a4)
{
  uint64_t v6 = a1;
  v89[5] = *MEMORY[0x263EF8340];
  ABRecordID v7 = (const void *)*MEMORY[0x263EFFB40];
  *(void *)a3 = *MEMORY[0x263EFFB40];
  int v8 = *(_DWORD *)(a1 + 140);
  if (v8 == 8)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    CFAllocatorRef allocator = a3;
    v79 = a2;
    CFAllocatorRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    CFAllocatorRef v86 = Mutable;
    if (*(void *)(v6 + 176))
    {
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F243C8], @"com.apple.contacts.Email Address", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F24570], @"com.apple.contacts.Phone Number", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F24368], @"com.apple.contacts.Street Address", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F245B0], @"com.apple.contacts.URL", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F24590], @"com.apple.contacts.Related Name", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F24430], @"com.apple.contacts.IM", Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x263F243B0], @"com.apple.contacts.Date", Mutable);
    }
    CFStringRef v19 = (const void *)*MEMORY[0x263F24300];
    keya = (void *)*MEMORY[0x263F24310];
    v88[0] = *MEMORY[0x263F24310];
    v88[1] = v19;
    CFStringRef v20 = (const void *)*MEMORY[0x263F242F8];
    v88[2] = *MEMORY[0x263F242F8];
    [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:3];
    CFDictionaryRef EntityChangesSinceSequenceNumberForClient = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
    if (!EntityChangesSinceSequenceNumberForClient) {
      goto LABEL_31;
    }
    CFDictionaryRef v22 = EntityChangesSinceSequenceNumberForClient;
    if (CFDictionaryGetCount(EntityChangesSinceSequenceNumberForClient) < 1) {
      goto LABEL_31;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v22, keya);
    CFArrayRef theArraya = (const __CFArray *)CFDictionaryGetValue(v22, v19);
    CFArrayRef v24 = (const __CFArray *)CFDictionaryGetValue(v22, v20);
    CFIndex Count = CFArrayGetCount(Value);
    if (Count < 1) {
      goto LABEL_31;
    }
    CFIndex v26 = Count;
    CFIndex v27 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(Value, v27);
      CFArrayRef v29 = (const __CFArray *)CFArrayGetValueAtIndex(theArraya, v27);
      CFDictionaryRef v30 = CFArrayGetValueAtIndex(v24, v27);
      PersonWithABRecordID RecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v6 + 144), (ABRecordID)ValueAtIndex);
      if (PersonWithRecordID)
      {
        CFTypeRef v32 = ABRecordCopyValue(PersonWithRecordID, (ABPropertyID)v29);
        if (!v32
          || (CFErrorRef v33 = v32,
              CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v32, (ABMultiValueIdentifier)v30),
              CFRelease(v33),
              BOOL v35 = IndexForIdentifier == -1,
              uint64_t v6 = a1,
              v35))
        {
          CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"%d/%d/%d", v29, ValueAtIndex, v30);
          if (!Mutable) {
            CFAllocatorRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
          }
          CFDictionarySetValue(Mutable, v36, v36);
          if (v36) {
            CFRelease(v36);
          }
          goto LABEL_29;
        }
        if (DLShouldLog())
        {
          CFArrayRef v73 = v29;
          v74 = ValueAtIndex;
          v72 = v30;
LABEL_28:
          _DLLog();
        }
      }
      else if (DLShouldLog())
      {
        CFArrayRef v73 = v29;
        v74 = ValueAtIndex;
        v72 = v30;
        goto LABEL_28;
      }
LABEL_29:
      if (v26 == ++v27)
      {
        CFAllocatorRef v86 = Mutable;
LABEL_31:
        ABRecordID v37 = (const void *)*MEMORY[0x263F242E0];
        v87[0] = keya;
        v87[1] = v37;
        objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v87, 2, v72, v73, v74);
        CFDictionaryRef v38 = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
        v39 = v79;
        if (!v38) {
          goto LABEL_125;
        }
        CFDictionaryRef v40 = v38;
        if (CFDictionaryGetCount(v38) < 1) {
          goto LABEL_125;
        }
        CFArrayRef v41 = (const __CFArray *)CFDictionaryGetValue(v40, keya);
        CFArrayRef v42 = (const __CFArray *)CFDictionaryGetValue(v40, v37);
        if (v41) {
          CFIndex v43 = CFArrayGetCount(v41);
        }
        else {
          CFIndex v43 = 0;
        }
        CFIndex v60 = CFArrayGetCount(v41);
        if (v60 != CFArrayGetCount(v42))
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          goto LABEL_125;
        }
        if (v43 < 1)
        {
LABEL_125:
          if (DLShouldLog()) {
            _DLLog();
          }
          if (!*(unsigned char *)(v6 + 441)) {
            _saveDeviceSyncAnchorAndClearChangeHistory(v6);
          }
          uint64_t v44 = 0;
          CFAllocatorRef *v39 = v86;
          *(void *)CFAllocatorRef allocator = *MEMORY[0x263EFFB38];
          *(_DWORD *)(v6 + 140) = 9;
          return v44;
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        v61 = 0;
        v62 = 0;
        CFIndex v63 = 0;
        CFAllocatorRef v64 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        while (2)
        {
          v65 = CFArrayGetValueAtIndex(v41, v63);
          unsigned int v66 = CFArrayGetValueAtIndex(v42, v63);
          if (v66 > 1)
          {
            if (v66 == 2)
            {
              CFStringRef v69 = CFStringCreateWithFormat(0, 0, @"Group/%d", v65);
              CFAllocatorRef v70 = v86;
              if (!v86)
              {
                CFAllocatorRef v70 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
                CFAllocatorRef v86 = v70;
              }
              CFDictionarySetValue(v70, v69, v69);
              if (v69) {
                CFRelease(v69);
              }
              goto LABEL_115;
            }
            if (!DLShouldLog()) {
              goto LABEL_115;
            }
          }
          else
          {
            GroupWithABRecordID RecordID = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a1 + 144), (ABRecordID)v65);
            if (GroupWithRecordID)
            {
              v68 = GroupWithRecordID;
              if (v62)
              {
                if (v61) {
                  goto LABEL_102;
                }
LABEL_118:
                v61 = CFSetCreateMutable(0, 0, 0);
              }
              else
              {
                v62 = CFArrayCreateMutable(v64, 0, MEMORY[0x263EFFF70]);
                if (!v61) {
                  goto LABEL_118;
                }
              }
LABEL_102:
              if (!v86) {
                CFAllocatorRef v86 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
              }
              if (!CFSetContainsValue(v61, (const void *)(int)v65))
              {
                CFSetAddValue(v61, (const void *)(int)v65);
                CFArrayAppendValue(v62, v68);
              }
LABEL_115:
              if (v43 == ++v63)
              {
                v39 = v79;
                if (v62)
                {
                  _AccumulateGroups(&v86, v62);
                  CFRelease(v62);
                }
                uint64_t v6 = a1;
                if (v61) {
                  CFRelease(v61);
                }
                goto LABEL_125;
              }
              continue;
            }
            if (!DLShouldLog()) {
              goto LABEL_115;
            }
          }
          break;
        }
        _DLLog();
        goto LABEL_115;
      }
    }
  }
  if (v8)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    uint64_t v44 = 0;
    *a2 = 0;
    *(void *)a3 = *MEMORY[0x263EFFB38];
    return v44;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v10 = (const void *)*MEMORY[0x263F24310];
  CFIndex v11 = (const void *)*MEMORY[0x263F242E0];
  v89[0] = *MEMORY[0x263F24310];
  v89[1] = v11;
  CFStringRef v12 = (const void *)*MEMORY[0x263F242E8];
  uint64_t v13 = (const void *)*MEMORY[0x263F242F0];
  v89[2] = *MEMORY[0x263F242E8];
  v89[3] = v13;
  v89[4] = *MEMORY[0x263F24308];
  [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:5];
  CFDictionaryRef v14 = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
  if (!v14 || (CFDictionaryRef v15 = v14, CFDictionaryGetCount(v14) < 1))
  {
    uint64_t v44 = 0;
    goto LABEL_85;
  }
  CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue(v15, v10);
  CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v15, v11);
  CFDictionaryGetValue(v15, v12);
  CFArrayRef key = (const __CFArray *)CFDictionaryGetValue(v15, v13);
  if (v16) {
    CFIndex theArray = CFArrayGetCount(v16);
  }
  else {
    CFIndex theArray = 0;
  }
  CFIndex v45 = CFArrayGetCount(v16);
  if (v45 != CFArrayGetCount(v17))
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a4)
    {
      *a4 = @"The changedIDs and changeTypes counts do not match";
      CFRetain(@"The changedIDs and changeTypes counts do not match");
    }
    goto LABEL_82;
  }
  if (theArray < 1)
  {
LABEL_82:
    if (*a4) {
      uint64_t v44 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v44 = 0;
    }
    goto LABEL_85;
  }
  v75 = a4;
  v80 = a2;
  if (DLShouldLog())
  {
    CFArrayRef v73 = v17;
    _DLLog();
  }
  v46 = 0;
  v47 = 0;
  CFIndex v48 = 0;
  CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v76 = (const void *)*MEMORY[0x263EFFB38];
  do
  {
    while (1)
    {
      v49 = CFArrayGetValueAtIndex(v16, v48);
      unsigned int HasImageData = CFArrayGetValueAtIndex(key, v48);
      unsigned int v51 = CFArrayGetValueAtIndex(v17, v48);
      unsigned int v52 = v51;
      if (v51 > 1) {
        break;
      }
      ABRecordRef v53 = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a1 + 144), (ABRecordID)v49);
      if (!v53)
      {
        if (!DLShouldLog()) {
          goto LABEL_72;
        }
        goto LABEL_71;
      }
      v54 = v53;
      if (!*(void *)(a1 + 176)) {
        *(void *)(a1 + 176) = CFArrayCreateMutable(allocatora, 0, MEMORY[0x263EFFF70]);
      }
      if (v47)
      {
        if (v46) {
          goto LABEL_51;
        }
      }
      else
      {
        v47 = CFSetCreateMutable(0, 0, 0);
        if (v46)
        {
LABEL_51:
          if (v47) {
            goto LABEL_52;
          }
          goto LABEL_76;
        }
      }
      v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      if (v47)
      {
LABEL_52:
        if (!CFSetContainsValue(v47, (const void *)(int)v49))
        {
          CFSetAddValue(v47, (const void *)(int)v49);
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 176), v54);
          v55 = *(__CFDictionary **)(a1 + 184);
          if (!v55)
          {
            v55 = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
            *(void *)(a1 + 184) = v55;
          }
          if (!v52)
          {
            unsigned int HasImageData = ABPersonHasImageData(v54);
            v55 = *(__CFDictionary **)(a1 + 184);
          }
          if (HasImageData) {
            v56 = v7;
          }
          else {
            v56 = v76;
          }
          CFDictionarySetValue(v55, (const void *)(int)v49, v56);
        }
        goto LABEL_72;
      }
LABEL_76:
      if (++v48 == theArray) {
        goto LABEL_133;
      }
    }
    if (v51 != 2)
    {
      if (!DLShouldLog()) {
        goto LABEL_72;
      }
LABEL_71:
      _DLLog();
      goto LABEL_72;
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    CFStringRef v57 = CFStringCreateWithFormat(0, 0, @"%d", v49, v73);
    if (!v46) {
      v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    }
    CFDictionarySetValue(v46, v57, v57);
    if (v57) {
      CFRelease(v57);
    }
LABEL_72:
    ++v48;
  }
  while (v48 != theArray);
  if (v47) {
    CFRelease(v47);
  }
LABEL_133:
  if (*v75) {
    uint64_t v44 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v44 = 0;
  }
  a2 = v80;
  if (!v46) {
LABEL_85:
  }
    v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  if (*(void *)(a1 + 176) && v46) {
    _AccumulateContacts(a1, v46);
  }
  *a2 = v46;
  CFArrayRef v58 = *(const __CFArray **)(a1 + 176);
  if (!v58 || (uint64_t v59 = *(int *)(a1 + 432), CFArrayGetCount(v58) == v59)) {
    *(_DWORD *)(a1 + 140) = 8;
  }
  return v44;
}

uint64_t ContactsDataSourceGetAllRecords(uint64_t a1, CFMutableDictionaryRef *a2, void *a3)
{
  *a3 = *MEMORY[0x263EFFB40];
  switch(*(_DWORD *)(a1 + 140))
  {
    case 0:
      if (!*(void *)(a1 + 176))
      {
        CFArrayRef v6 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
        *(void *)(a1 + 176) = v6;
        if (!v6)
        {
          *a2 = 0;
          goto LABEL_28;
        }
      }
      CFAllocatorRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulateContacts(a1, Mutable);
      *a2 = Mutable;
      if (!Mutable)
      {
LABEL_28:
        int v11 = 9;
LABEL_29:
        *(_DWORD *)(a1 + 140) = v11;
        goto LABEL_30;
      }
      uint64_t v8 = *(int *)(a1 + 432);
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 176));
      int v10 = DLShouldLog();
      if (Count == v8)
      {
        if (v10) {
          _DLLog();
        }
        int v11 = 1;
        goto LABEL_29;
      }
      if (v10)
      {
        CFArrayGetCount(*(CFArrayRef *)(a1 + 176));
        _DLLog();
      }
      if (!*(_DWORD *)(a1 + 140)) {
        return 0;
      }
LABEL_30:
      CFArrayRef v27 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
      if (v27)
      {
        CFArrayRef v28 = v27;
        _AccumulateGroups(a2, v27);
        CFRelease(v28);
      }
      if (*(_DWORD *)(a1 + 140) == 9) {
        goto LABEL_20;
      }
      return 0;
    case 1:
      uint64_t v12 = *MEMORY[0x263F243C8];
      uint64_t v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v12, @"com.apple.contacts.Email Address", v13);
      *a2 = v13;
      int v14 = 2;
      goto LABEL_17;
    case 2:
      uint64_t v15 = *MEMORY[0x263F24570];
      CFArrayRef v16 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v15, @"com.apple.contacts.Phone Number", v16);
      *a2 = v16;
      int v14 = 3;
      goto LABEL_17;
    case 3:
      uint64_t v17 = *MEMORY[0x263F24368];
      CFStringRef v18 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v17, @"com.apple.contacts.Street Address", v18);
      *a2 = v18;
      int v14 = 4;
      goto LABEL_17;
    case 4:
      uint64_t v19 = *MEMORY[0x263F245B0];
      CFStringRef v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v19, @"com.apple.contacts.URL", v20);
      *a2 = v20;
      int v14 = 5;
      goto LABEL_17;
    case 5:
      uint64_t v21 = *MEMORY[0x263F24590];
      CFDictionaryRef v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v21, @"com.apple.contacts.Related Name", v22);
      *a2 = v22;
      int v14 = 6;
      goto LABEL_17;
    case 6:
      uint64_t v23 = *MEMORY[0x263F24430];
      CFArrayRef v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v23, @"com.apple.contacts.IM", v24);
      *a2 = v24;
      int v14 = 7;
LABEL_17:
      *(_DWORD *)(a1 + 140) = v14;
      return 0;
    case 7:
      uint64_t v25 = *MEMORY[0x263F243B0];
      CFIndex v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v25, @"com.apple.contacts.Date", v26);
      *a2 = v26;
      goto LABEL_19;
    default:
      if (DLShouldLog()) {
        _DLLog();
      }
LABEL_19:
      *(_DWORD *)(a1 + 140) = 9;
LABEL_20:
      *a3 = *MEMORY[0x263EFFB38];
      if (!*(unsigned char *)(a1 + 441) && !*(unsigned char *)(a1 + 442)) {
        _saveDeviceSyncAnchorAndClearChangeHistory(a1);
      }
      return 0;
  }
}

uint64_t ContactsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  *a2 = ABAddressBookGetPersonCountInSource();
  return 0;
}

uint64_t ContactsDataSourceProcessChanges(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, void *a4, const __CFDictionary *a5)
{
  uint64_t v7 = a1;
  if (*(unsigned char *)(a1 + 443))
  {
    CFErrorRef error = 0;
    if (!ABRecordSetValue(*(ABRecordRef *)(a1 + 152), *MEMORY[0x263F245C8], (CFTypeRef)*MEMORY[0x263EFFB40], &error))
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      if (error) {
        CFRelease(error);
      }
    }
    *(unsigned char *)(v7 + 443) = 0;
  }
  if (*(unsigned char *)(v7 + 441) && !*(unsigned char *)(v7 + 442)) {
    _saveDeviceSyncAnchorAndClearChangeHistory(v7);
  }
  *(void *)(v7 + 240) = 0;
  if (!theDict || CFDictionaryGetCount(theDict) < 1) {
    goto LABEL_146;
  }
  *(unsigned char *)(v7 + 137) = 0;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_ChangesApplierFunction, (void *)v7);
  if (*(unsigned char *)(v7 + 137))
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    ABProcessAddedImages();
  }
  uint64_t v72 = v7;
  if (!*(unsigned char *)(v7 + 136))
  {
    CFBooleanRef v8 = a5
       ? (const __CFBoolean *)CFDictionaryGetValue(a5, @"SyncDeviceLinkAllRecordsOfPulledEntityTypeSentKey")
       : (const __CFBoolean *)*MEMORY[0x263EFFB40];
    if (*(unsigned char *)(v7 + 138) || v8 && CFBooleanGetValue(v8) == 1)
    {
      ABAddressBookProcessAddedRecords();
      CFDictionaryRef v9 = *(const __CFDictionary **)(v7 + 200);
      if (v9)
      {
        CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)_UpdateContactRemapping, (void *)v7);
        int v10 = *(const void **)(v7 + 200);
        if (v10)
        {
          CFRelease(v10);
          *(void *)(v7 + 200) = 0;
        }
      }
      if (*(void *)(v7 + 224))
      {
        CFDictionaryRef v11 = *(const __CFDictionary **)(v7 + 208);
        if (v11)
        {
          CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_UpdateGroupRemapping, (void *)v7);
          uint64_t v12 = *(const void **)(v7 + 208);
          if (v12)
          {
            CFRelease(v12);
            *(void *)(v7 + 208) = 0;
          }
        }
        CFErrorRef error = 0;
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v7 + 224));
        CFIndex v14 = CFArrayGetCount(*(CFArrayRef *)(v7 + 232));
        if (v14 != Count && DLShouldLog()) {
          _DLLog();
        }
        if (v14 >= Count) {
          uint64_t v15 = Count;
        }
        else {
          uint64_t v15 = v14;
        }
        uint64_t v65 = v15;
        if (v15 >= 1)
        {
          CFIndex v16 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 224), v16);
            CFArrayRef v18 = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 232), v16);
            CFArrayRef v19 = v18;
            CFIndex v67 = v16;
            if (v18)
            {
              uint64_t v20 = CFArrayGetCount(v18);
              if (v20 >= 1)
              {
                CFAllocatorRef Mutable = CFSetCreateMutable(0, v20, MEMORY[0x263EFFFA0]);
                goto LABEL_42;
              }
            }
            else
            {
              uint64_t v20 = 0;
            }
            CFAllocatorRef Mutable = 0;
LABEL_42:
            CFArrayRef v22 = (const __CFArray *)ABGroupCopyArrayOfAllMembersAndSubgroups();
            CFArrayRef v23 = v22;
            if (!v22)
            {
              uint64_t v24 = 0;
LABEL_48:
              CFSetRef theSet = 0;
              goto LABEL_49;
            }
            uint64_t v24 = CFArrayGetCount(v22);
            if (v24 < 1) {
              goto LABEL_48;
            }
            uint64_t v25 = CFSetCreateMutable(0, v24, MEMORY[0x263EFFFA0]);
            for (CFIndex i = 0; i != v24; ++i)
            {
              CFArrayRef v27 = CFArrayGetValueAtIndex(v23, i);
              CFSetAddValue(v25, v27);
            }
            CFSetRef theSet = v25;
LABEL_49:
            ABRecordRef record = ValueAtIndex;
            if (v20 >= 1)
            {
              CFIndex v28 = 0;
              *(void *)property = v19;
              do
              {
                CFStringRef v29 = (const __CFString *)CFArrayGetValueAtIndex(v19, v28);
                CFDictionaryRef Value = *(const __CFDictionary **)(v7 + 248);
                if (Value) {
                  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v29);
                }
                if (Value) {
                  CFStringRef v29 = (const __CFString *)Value;
                }
                if (!recordIdentifierIsLocal(v29))
                {
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                  goto LABEL_79;
                }
                CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v29, @"/");
                CFArrayRef v32 = ArrayBySeparatingStrings;
                if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) == 2)
                {
                  CFStringRef v33 = (const __CFString *)CFArrayGetValueAtIndex(v32, 1);
                  if (!v33) {
                    goto LABEL_78;
                  }
                  IntCFDictionaryRef Value = CFStringGetIntValue(v33);
                  GroupWithABRecordID RecordID = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(v7 + 144), IntValue);
                  int v36 = 1;
                  if (!GroupWithRecordID) {
                    goto LABEL_60;
                  }
                }
                else
                {
                  if (!v29) {
                    goto LABEL_77;
                  }
                  SInt32 v37 = CFStringGetIntValue(v29);
                  GroupWithABRecordID RecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v7 + 144), v37);
                  int v36 = 0;
                  if (!GroupWithRecordID)
                  {
LABEL_60:
                    if (DLShouldLog()) {
                      _DLLog();
                    }
                    goto LABEL_77;
                  }
                }
                CFSetAddValue(Mutable, GroupWithRecordID);
                if (!theSet || !CFSetContainsValue(theSet, GroupWithRecordID))
                {
                  if (DLShouldLog())
                  {
                    ABRecordGetRecordID(record);
                    uint64_t v7 = v72;
                    _DLLog();
                  }
                  if (v36)
                  {
                    ABGroupAddSubgroup();
                  }
                  else
                  {
                    if (!ABGroupAddMember(record, GroupWithRecordID, &error) && DLShouldLog())
                    {
                      ABRecordGetRecordID(GroupWithRecordID);
                      ABRecordGetRecordID(record);
                      _DLLog();
                    }
                    if (error)
                    {
                      CFRelease(error);
                      CFErrorRef error = 0;
                    }
                  }
                }
LABEL_77:
                CFArrayRef v19 = *(const __CFArray **)property;
                if (v32) {
LABEL_78:
                }
                  CFRelease(v32);
LABEL_79:
                ++v28;
              }
              while (v20 != v28);
            }
            if (v24 >= 1)
            {
              for (CFIndex j = 0; j != v24; ++j)
              {
                v39 = CFArrayGetValueAtIndex(v23, j);
                if (!Mutable || !CFSetContainsValue(Mutable, v39))
                {
                  if (DLShouldLog())
                  {
                    ABRecordGetRecordID(v39);
                    ABRecordGetRecordID(record);
                    uint64_t v7 = v72;
                    _DLLog();
                  }
                  if (!ABGroupRemoveMember(record, v39, &error) && DLShouldLog())
                  {
                    ABRecordGetRecordID(v39);
                    ABRecordGetRecordID(record);
                    _DLLog();
                  }
                  if (error)
                  {
                    CFRelease(error);
                    CFErrorRef error = 0;
                  }
                }
              }
            }
            if (v23) {
              CFRelease(v23);
            }
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (theSet) {
              CFRelease(theSet);
            }
            CFIndex v16 = v67 + 1;
          }
          while (v67 + 1 != v65);
        }
        CFDictionaryRef v40 = *(const void **)(v7 + 224);
        if (v40)
        {
          CFRelease(v40);
          *(void *)(v7 + 224) = 0;
        }
      }
      *(unsigned char *)(v7 + 136) = 1;
    }
  }
  CFArrayRef v41 = *(const __CFArray **)(v7 + 216);
  if (v41)
  {
    CFIndex v42 = CFArrayGetCount(v41);
    if (v42 >= 1)
    {
      CFIndex v43 = v42;
      CFIndex v44 = 0;
      CFIndex v45 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/ContactsDataSource.m";
      do
      {
        CFStringRef v46 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 216), v44);
        CFArrayRef v47 = CFStringCreateArrayBySeparatingStrings(0, v46, @"/");
        if (DLShouldLog()) {
          _DLLog();
        }
        if (!v47 || CFArrayGetCount(v47) != 3)
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          if (!v47) {
            goto LABEL_142;
          }
          goto LABEL_141;
        }
        CFIndex v48 = v43;
        CFStringRef v49 = (const __CFString *)CFArrayGetValueAtIndex(v47, 0);
        CFStringRef v50 = (const __CFString *)CFArrayGetValueAtIndex(v47, 1);
        unsigned int v51 = v45;
        CFStringRef v52 = (const __CFString *)CFArrayGetValueAtIndex(v47, 2);
        SInt32 propertya = CFStringGetIntValue(v49);
        SInt32 v53 = CFStringGetIntValue(v50);
        CFStringRef v54 = v52;
        CFIndex v45 = v51;
        SInt32 v55 = CFStringGetIntValue(v54);
        CFErrorRef error = 0;
        if (DLShouldLog()) {
          _DLLog();
        }
        PersonWithABRecordID RecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v72 + 144), v53);
        if (PersonWithRecordID)
        {
          CFStringRef v57 = PersonWithRecordID;
          CFTypeRef v58 = ABRecordCopyValue(PersonWithRecordID, propertya);
          if (v58)
          {
            uint64_t v59 = v58;
            CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v58, v55);
            if (IndexForIdentifier == -1)
            {
              CFIndex v45 = v51;
              CFIndex v43 = v48;
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            else
            {
              CFIndex v61 = IndexForIdentifier;
              if (ABMultiValueGetCount(v59) < 2)
              {
                ABMutableMultiValueRef MutableCopy = 0;
              }
              else
              {
                ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v59);
                ABMultiValueRemoveValueAndLabelAtIndex(MutableCopy, v61);
              }
              CFIndex v45 = v51;
              CFIndex v43 = v48;
              if (!ABRecordRemoveValue(v57, propertya, &error) && DLShouldLog())
              {
                ABRecordGetRecordID(v57);
                _DLLog();
              }
              if (error)
              {
                CFRelease(error);
                CFErrorRef error = 0;
              }
              if (MutableCopy)
              {
                ABMultiValueSetImmutable();
                if (!ABRecordSetValue(v57, propertya, MutableCopy, &error) && DLShouldLog())
                {
                  ABRecordGetRecordID(v57);
                  _DLLog();
                }
                if (error)
                {
                  CFRelease(error);
                  CFErrorRef error = 0;
                }
                CFRelease(MutableCopy);
              }
            }
            CFRelease(v59);
            goto LABEL_140;
          }
          CFIndex v43 = v48;
          if (DLShouldLog()) {
LABEL_123:
          }
            _DLLog();
        }
        else
        {
          CFIndex v43 = v48;
          if (DLShouldLog()) {
            goto LABEL_123;
          }
        }
LABEL_140:
        uint64_t v7 = v72;
LABEL_141:
        CFRelease(v47);
LABEL_142:
        ++v44;
      }
      while (v43 != v44);
    }
    CFIndex v63 = *(const void **)(v7 + 216);
    if (v63) {
      CFRelease(v63);
    }
    *(void *)(v7 + 216) = 0;
  }
LABEL_146:
  *a4 = *(void *)(v7 + 240);
  return 0;
}

uint64_t ContactsDataSourceCommit(uint64_t a1, void *a2)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  CFArrayRef v4 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        _RestoreClearedPersonsSound(*(const __CFDictionary **)(a1 + 408), (uint64_t)ValueAtIndex);
        _RestoreClearedPersonsSound(*(const __CFDictionary **)(a1 + 416), (uint64_t)ValueAtIndex);
      }
    }
    CFRelease(v5);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
  if (*(unsigned char *)(a1 + 441) && !*(unsigned char *)(a1 + 442)) {
    _saveDeviceSyncAnchorAndClearChangeHistory(a1);
  }
  CFErrorRef error = 0;
  if (!*(void *)(a1 + 168)) {
    *(void *)(a1 + 168) = CFRetain(@"---");
  }
  _setComputerSyncAnchorForStore(a1);
  BOOL v10 = ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error);
  if (!v10 && DLShouldLog()) {
    _DLLog();
  }
  if (error) {
    CFRelease(error);
  }
  if (v10) {
    return 0;
  }
  if (a2)
  {
    *a2 = @"Can't commit Address Book";
    CFRetain(@"Can't commit Address Book");
  }
  return 0xFFFFFFFFLL;
}

uint64_t ContactsDataSourceRollback(uint64_t a1)
{
  return 0;
}

uint64_t ContactsDataSourceDeleteDataSource(void *a1)
{
  CFArrayRef v2 = (const void *)a1[18];
  if (v2)
  {
    CFRelease(v2);
    a1[18] = 0;
  }
  CFArrayRef v3 = (const void *)a1[19];
  if (v3)
  {
    CFRelease(v3);
    a1[19] = 0;
  }
  CFArrayRef v4 = (const void *)a1[20];
  if (v4)
  {
    CFRelease(v4);
    a1[20] = 0;
  }
  CFArrayRef v5 = (const void *)a1[21];
  if (v5)
  {
    CFRelease(v5);
    a1[21] = 0;
  }
  CFArrayRef v6 = (const void *)a1[22];
  if (v6)
  {
    CFRelease(v6);
    a1[22] = 0;
  }
  CFIndex v7 = (const void *)a1[23];
  if (v7)
  {
    CFRelease(v7);
    a1[23] = 0;
  }
  CFBooleanRef v8 = (const void *)a1[24];
  if (v8)
  {
    CFRelease(v8);
    a1[24] = 0;
  }
  CFDictionaryRef v9 = (const void *)a1[25];
  if (v9)
  {
    CFRelease(v9);
    a1[25] = 0;
  }
  BOOL v10 = (const void *)a1[26];
  if (v10)
  {
    CFRelease(v10);
    a1[26] = 0;
  }
  CFDictionaryRef v11 = (const void *)a1[27];
  if (v11)
  {
    CFRelease(v11);
    a1[27] = 0;
  }
  uint64_t v12 = (const void *)a1[28];
  if (v12)
  {
    CFRelease(v12);
    a1[28] = 0;
  }
  uint64_t v13 = (const void *)a1[29];
  if (v13)
  {
    CFRelease(v13);
    a1[29] = 0;
  }
  CFIndex v14 = (const void *)a1[31];
  if (v14)
  {
    CFRelease(v14);
    a1[31] = 0;
  }
  uint64_t v15 = (const void *)a1[32];
  if (v15)
  {
    CFRelease(v15);
    a1[32] = 0;
  }
  CFIndex v16 = (const void *)a1[33];
  if (v16)
  {
    CFRelease(v16);
    a1[33] = 0;
  }
  uint64_t v17 = (const void *)a1[34];
  if (v17)
  {
    CFRelease(v17);
    a1[34] = 0;
  }
  CFArrayRef v18 = (const void *)a1[35];
  if (v18)
  {
    CFRelease(v18);
    a1[35] = 0;
  }
  CFArrayRef v19 = (const void *)a1[36];
  if (v19)
  {
    CFRelease(v19);
    a1[36] = 0;
  }
  uint64_t v20 = (const void *)a1[37];
  if (v20)
  {
    CFRelease(v20);
    a1[37] = 0;
  }
  uint64_t v21 = (const void *)a1[38];
  if (v21)
  {
    CFRelease(v21);
    a1[38] = 0;
  }
  CFArrayRef v22 = (const void *)a1[39];
  if (v22)
  {
    CFRelease(v22);
    a1[39] = 0;
  }
  CFArrayRef v23 = (const void *)a1[40];
  if (v23)
  {
    CFRelease(v23);
    a1[40] = 0;
  }
  uint64_t v24 = (const void *)a1[41];
  if (v24)
  {
    CFRelease(v24);
    a1[41] = 0;
  }
  uint64_t v25 = (const void *)a1[42];
  if (v25)
  {
    CFRelease(v25);
    a1[42] = 0;
  }
  CFIndex v26 = (const void *)a1[43];
  if (v26)
  {
    CFRelease(v26);
    a1[43] = 0;
  }
  CFArrayRef v27 = (const void *)a1[44];
  if (v27)
  {
    CFRelease(v27);
    a1[44] = 0;
  }
  CFIndex v28 = (const void *)a1[45];
  if (v28)
  {
    CFRelease(v28);
    a1[45] = 0;
  }
  CFStringRef v29 = (const void *)a1[46];
  if (v29)
  {
    CFRelease(v29);
    a1[46] = 0;
  }
  CFDictionaryRef v30 = (const void *)a1[47];
  if (v30)
  {
    CFRelease(v30);
    a1[47] = 0;
  }
  BOOL v31 = (const void *)a1[48];
  if (v31)
  {
    CFRelease(v31);
    a1[48] = 0;
  }
  CFArrayRef v32 = (const void *)a1[49];
  if (v32)
  {
    CFRelease(v32);
    a1[49] = 0;
  }
  CFStringRef v33 = (const void *)a1[50];
  if (v33)
  {
    CFRelease(v33);
    a1[50] = 0;
  }
  CFBooleanRef v34 = (const void *)a1[52];
  if (v34)
  {
    CFRelease(v34);
    a1[52] = 0;
  }
  BOOL v35 = (const void *)a1[51];
  if (v35) {
    CFRelease(v35);
  }
  free(a1);
  return 0;
}

uint64_t ContactsDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  CFAllocatorRef Mutable = *(__CFArray **)(a1 + 400);
  if (!Mutable)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef v6 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    CFAllocatorRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFIndex v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, @"com.apple.contacts.Contact");
    CFArrayAppendValue(v7, @"com.apple.contacts.Group");
    CFArrayAppendValue(Mutable, v7);
    if (v7) {
      CFRelease(v7);
    }
    CFBooleanRef v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v8, @"com.apple.contacts.Email Address");
    CFArrayAppendValue(Mutable, v8);
    if (v8) {
      CFRelease(v8);
    }
    CFDictionaryRef v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v9, @"com.apple.contacts.Phone Number");
    CFArrayAppendValue(Mutable, v9);
    if (v9) {
      CFRelease(v9);
    }
    BOOL v10 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v10, @"com.apple.contacts.Street Address");
    CFArrayAppendValue(Mutable, v10);
    if (v10) {
      CFRelease(v10);
    }
    CFDictionaryRef v11 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v11, @"com.apple.contacts.URL");
    CFArrayAppendValue(Mutable, v11);
    if (v11) {
      CFRelease(v11);
    }
    uint64_t v12 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v12, @"com.apple.contacts.Related Name");
    CFArrayAppendValue(Mutable, v12);
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v13 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v13, @"com.apple.contacts.IM");
    CFArrayAppendValue(Mutable, v13);
    if (v13) {
      CFRelease(v13);
    }
    CFIndex v14 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v14, @"com.apple.contacts.Date");
    CFArrayAppendValue(Mutable, v14);
    if (v14) {
      CFRelease(v14);
    }
    *(void *)(a1 + 400) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t _makeAccountForSource(uint64_t a1, const void *a2)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  CFErrorRef error = 0;
  uint64_t v4 = ABAccountCreate();
  if (v4)
  {
    CFAllocatorRef v5 = (const void *)v4;
    if (ABAccountSetIdentifier())
    {
      if (ABAddressBookAddRecord(*(ABAddressBookRef *)(a1 + 144), v5, &error))
      {
        ABAddressBookProcessAddedRecords();
        if (ABAddressBookSetAccountForSource())
        {
          uint64_t v6 = 1;
LABEL_21:
          CFRelease(v5);
          return v6;
        }
        if (!DLShouldLog())
        {
LABEL_18:
          if (error)
          {
            CFRelease(error);
            uint64_t v6 = 0;
            CFErrorRef error = 0;
          }
          else
          {
            uint64_t v6 = 0;
          }
          goto LABEL_21;
        }
        ABRecordGetRecordID(a2);
      }
      else if (!DLShouldLog())
      {
        goto LABEL_18;
      }
    }
    else
    {
      if (!DLShouldLog()) {
        goto LABEL_18;
      }
      ABRecordGetRecordID(a2);
    }
    _DLLog();
    goto LABEL_18;
  }
  if (DLShouldLog())
  {
    ABRecordGetRecordID(a2);
    _DLLog();
  }
  return 1;
}

void _setComputerSyncAnchorForStore(uint64_t a1)
{
  if (a1)
  {
    CFStringRef v1 = _copyComputerSyncAnchorKey(a1);
    if (DLShouldLog()) {
      _DLLog();
    }
    ABAddressBookSetValue();
    if (v1)
    {
      CFRelease(v1);
    }
  }
}

void _setDeviceSyncAnchorForStore(uint64_t a1)
{
  CFStringRef v1 = _copyDeviceSyncAnchorKey(a1);
  if (DLShouldLog()) {
    _DLLog();
  }
  ABAddressBookSetValue();
  if (v1)
  {
    CFRelease(v1);
  }
}

CFStringRef _copyComputerSyncAnchorKey(uint64_t a1)
{
  CFStringRef v1 = *(const void **)(a1 + 152);
  if (v1) {
    uint64_t RecordID = ABRecordGetRecordID(v1);
  }
  else {
    uint64_t RecordID = 0xFFFFFFFFLL;
  }
  return CFStringCreateWithFormat(0, 0, @"ComputerStoreSyncAnchor-%d", RecordID);
}

CFStringRef _copyDeviceSyncAnchorKey(uint64_t a1)
{
  if (a1 && (CFStringRef v1 = *(const void **)(a1 + 152)) != 0) {
    uint64_t RecordID = ABRecordGetRecordID(v1);
  }
  else {
    uint64_t RecordID = 0xFFFFFFFFLL;
  }
  return CFStringCreateWithFormat(0, 0, @"DeviceStoreSyncAnchor-%d", RecordID);
}

void _RemoveRecordsFromAddressBook(uint64_t a1, CFArrayRef theArray, void (*a3)(uint64_t, const void *))
{
  CFErrorRef error = 0;
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      if (a3) {
        a3(a1, ValueAtIndex);
      }
      if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), ValueAtIndex, &error)
        && DLShouldLog())
      {
        _DLLog();
      }
      if (error)
      {
        CFRelease(error);
        CFErrorRef error = 0;
      }
    }
  }
}

void _SaveClearedPersonsSounds(uint64_t a1, uint64_t a2)
{
  _SaveClearedPersonsSound(*(const __CFDictionary **)(a1 + 408), a2, 0xFFFFFFFFLL);
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 416);
  _SaveClearedPersonsSound(v4, a2, 4294967294);
}

void _SaveClearedPersonsSound(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return;
  }
  uint64_t v6 = ABPersonCopyCompositeName();
  if (!v6) {
    return;
  }
  CFIndex v7 = (const void *)v6;
  CFStringRef v8 = (const __CFString *)MEMORY[0x23ECBFF80](a2, a3);
  if (!v8) {
    CFStringRef v8 = (const __CFString *)CFRetain(@"<null>");
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, v7);
  if (!Value)
  {
    if (CFStringCompare(v8, @"<null>", 0) && DLShouldLog()) {
      _DLLog();
    }
    CFDictionaryAddValue(a1, v7, v8);
    goto LABEL_20;
  }
  CFStringRef v10 = Value;
  if (CFStringCompare(Value, v8, 0))
  {
    CFComparisonResult v11 = CFStringCompare(v10, @"<conflict>", 0);
    int v12 = DLShouldLog();
    if (v11)
    {
      if (v12) {
        _DLLog();
      }
      CFDictionaryReplaceValue(a1, v7, @"<conflict>");
      goto LABEL_20;
    }
    if (v12) {
      goto LABEL_19;
    }
  }
  else if (CFStringCompare(v8, @"<null>", 0) && DLShouldLog())
  {
LABEL_19:
    _DLLog();
  }
LABEL_20:
  CFRelease(v7);
  if (v8)
  {
    CFRelease(v8);
  }
}

void _AccumulateContacts(uint64_t a1, __CFDictionary *a2)
{
  CFArrayRef v3 = *(const __CFArray **)(a1 + 176);
  if (v3)
  {
    CFIndex Count = CFArrayGetCount(v3);
    ABPropertyID property = *MEMORY[0x263F24408];
    ABPropertyID v35 = *MEMORY[0x263F244D0];
    ABPropertyID v34 = *MEMORY[0x263F244F8];
    ABPropertyID v33 = *MEMORY[0x263F24588];
    ABPropertyID v31 = *MEMORY[0x263F24508];
    ABPropertyID v32 = *MEMORY[0x263F245A8];
    ABPropertyID v29 = *MEMORY[0x263F244C0];
    ABPropertyID v30 = *MEMORY[0x263F243F8];
    ABPropertyID v28 = *MEMORY[0x263F244E8];
    ABPropertyID v27 = *MEMORY[0x263F24518];
    ABPropertyID v25 = *MEMORY[0x263F243B8];
    ABPropertyID v26 = *MEMORY[0x263F244A0];
    ABPropertyID v24 = *MEMORY[0x263F24510];
    ABPropertyID v4 = *MEMORY[0x263F24398];
    ABPropertyID v5 = *MEMORY[0x263F244B8];
    CFNumberRef v6 = (const __CFNumber *)*MEMORY[0x263F244B0];
    CFNumberRef otherNumber = (const __CFNumber *)*MEMORY[0x263F244A8];
    CFIndex v7 = (const void *)*MEMORY[0x263EFFB40];
    CFArrayRef v22 = (const void *)*MEMORY[0x263EFFB38];
    int v8 = *(_DWORD *)(a1 + 432);
    do
    {
      if (Count <= v8) {
        return;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 176), v8);
      uint64_t RecordID = ABRecordGetRecordID(ValueAtIndex);
      CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%d", RecordID);
      CFAllocatorRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.contacts.Contact");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, property, @"first name");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v35, @"last name");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v34, @"middle name");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v33, @"title");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v32, @"suffix");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v31, @"nickname");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v30, @"first name yomi");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v29, @"last name yomi");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v28, @"middle name yomi");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v27, @"company name");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v26, @"job title");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v25, @"department");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v24, @"notes");
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v4, @"birthday");
      CFNumberRef v13 = (const __CFNumber *)ABRecordCopyValue(ValueAtIndex, v5);
      if (CFNumberCompare(v13, v6, 0))
      {
        if (CFNumberCompare(v13, otherNumber, 0)) {
          goto LABEL_9;
        }
        CFIndex v14 = @"company";
      }
      else
      {
        CFIndex v14 = @"person";
      }
      CFDictionarySetValue(Mutable, @"display as company", v14);
LABEL_9:
      if (v13) {
        CFRelease(v13);
      }
      CFDataRef v15 = ABPersonCopyImageDataWithFormat(ValueAtIndex, (ABPersonImageFormat)5u);
      if (!v15) {
        CFDataRef v15 = ABPersonCopyImageDataWithFormat(ValueAtIndex, kABPersonImageFormatThumbnail);
      }
      CFStringRef Value = v7;
      if (*(unsigned char *)(a1 + 440))
      {
        CFDictionaryRef v17 = *(const __CFDictionary **)(a1 + 184);
        if (v17)
        {
          ABRecordID v18 = ABRecordGetRecordID(ValueAtIndex);
          CFStringRef Value = CFDictionaryGetValue(v17, (const void *)v18);
          if (!Value)
          {
            CFStringRef Value = v7;
            if (DLShouldLog())
            {
              ABRecordGetRecordID(ValueAtIndex);
              _DLLog();
              CFStringRef Value = v7;
            }
          }
        }
        else if (v15)
        {
          CFStringRef Value = v7;
        }
        else
        {
          CFStringRef Value = v22;
        }
        CFDictionarySetValue(Mutable, @"ImageChanged", Value);
      }
      if (Value == v7 && v15)
      {
        CFDictionarySetValue(Mutable, @"image", v15);
        int Length = CFDataGetLength(v15);
LABEL_26:
        CFRelease(v15);
        int v20 = Length;
        goto LABEL_27;
      }
      int Length = 0;
      int v20 = 0;
      if (v15) {
        goto LABEL_26;
      }
LABEL_27:
      int v21 = *(_DWORD *)(a1 + 424) + v20;
      *(_DWORD *)(a1 + 424) = v21;
      if (v21 >= 4000001)
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        ABProcessAddedImages();
        *(_DWORD *)(a1 + 424) = 0;
      }
      CFDictionarySetValue(a2, v11, Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v11) {
        CFRelease(v11);
      }
      int v8 = *(_DWORD *)(a1 + 432) + 1;
      *(_DWORD *)(a1 + 432) = v8;
    }
    while (v21 < 4000001);
  }
}

CFStringRef _CreateContactRecordIdentifier(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"%d", a1);
}

void _SetRecordValueInDictionary(__CFDictionary *a1, ABRecordRef record, ABPropertyID property, const void *a4)
{
  CFTypeRef v6 = ABRecordCopyValue(record, property);
  if (v6)
  {
    CFIndex v7 = v6;
    CFDictionarySetValue(a1, a4, v6);
    CFRelease(v7);
  }
}

void _AccumulateGroups(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  CFArrayRef v2 = theArray;
  uint64_t Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return;
  }
  uint64_t v5 = Count;
  if (!*a1) {
    *a1 = CFDictionaryCreateMutable(0, Count, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  }
  CFIndex v6 = 0;
  ABPropertyID property = *MEMORY[0x263F24338];
  ABPropertyID v24 = a1;
  CFArrayRef v25 = v2;
  uint64_t v23 = v5;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v6);
    uint64_t RecordID = ABRecordGetRecordID(ValueAtIndex);
    CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"Group/%d", RecordID);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(*a1, v9, Mutable);
    CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.contacts.Group");
    _SetRecordValueInDictionary(Mutable, ValueAtIndex, property, @"name");
    if (v9) {
      CFRelease(v9);
    }
    CFArrayRef v11 = (const __CFArray *)ABGroupCopyArrayOfAllMembersAndSubgroups();
    if (!v11) {
      goto LABEL_24;
    }
    CFArrayRef v12 = v11;
    uint64_t v13 = CFArrayGetCount(v11);
    if (v13 < 1) {
      goto LABEL_23;
    }
    uint64_t v14 = v13;
    CFDataRef v15 = CFArrayCreateMutable(0, v13, MEMORY[0x263EFFF70]);
    for (CFIndex i = 0; i != v14; ++i)
    {
      CFDictionaryRef v17 = CFArrayGetValueAtIndex(v12, i);
      ABRecordType RecordType = ABRecordGetRecordType(v17);
      uint64_t v19 = ABRecordGetRecordID(v17);
      if (RecordType == 1)
      {
        CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"Group/%d", v19, v22);
LABEL_14:
        if (v20)
        {
          CFStringRef v21 = v20;
          CFArrayAppendValue(v15, v20);
          CFRelease(v21);
        }
        continue;
      }
      if (!RecordType)
      {
        CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"%d", v19, v22);
        goto LABEL_14;
      }
      if (DLShouldLog())
      {
        CFArrayRef v22 = v17;
        _DLLog();
      }
    }
    if (CFArrayGetCount(v15) >= 1) {
      CFDictionarySetValue(Mutable, @"members", v15);
    }
    a1 = v24;
    CFArrayRef v2 = v25;
    uint64_t v5 = v23;
    if (v15) {
      CFRelease(v15);
    }
LABEL_23:
    CFRelease(v12);
LABEL_24:
    if (Mutable) {
      CFRelease(Mutable);
    }
    ++v6;
  }
  while (v6 != v5);
}

CFStringRef _CreateGroupRecordIdentifier(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"Group/%d", a1);
}

void _AccumulatePropertiesForType(const __CFArray **a1, uint64_t a2, const void *a3, __CFDictionary *a4)
{
  CFArrayRef v5 = a1[22];
  if (v5)
  {
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      CFAllocatorRef v61 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      int v8 = *MEMORY[0x263F24368];
      int v59 = *MEMORY[0x263F24430];
      CFIndex v48 = (void *)*MEMORY[0x263F24490];
      CFStringRef v49 = (void *)*MEMORY[0x263F24468];
      SInt32 v55 = (void *)*MEMORY[0x263F24350];
      CFArrayRef key = (void *)*MEMORY[0x263F24378];
      SInt32 v53 = (void *)*MEMORY[0x263F24380];
      CFStringRef v54 = (void *)*MEMORY[0x263F24370];
      unsigned int v51 = (void *)*MEMORY[0x263F24358];
      CFStringRef v52 = (void *)*MEMORY[0x263F24360];
      int v60 = *MEMORY[0x263F243C8];
      int v58 = *MEMORY[0x263F24570];
      int v42 = *MEMORY[0x263F24590];
      int v43 = *MEMORY[0x263F245B0];
      int v41 = *MEMORY[0x263F243B0];
      uint64_t v39 = *MEMORY[0x263F24388];
      uint64_t v40 = *MEMORY[0x263F24418];
      uint64_t v46 = *MEMORY[0x263F245F0];
      uint64_t v47 = *MEMORY[0x263F24340];
      CFStringRef v57 = (const __CFString *)*MEMORY[0x263F24550];
      CFStringRef theString2 = (const __CFString *)*MEMORY[0x263F24348];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1[22], v7);
        CFTypeRef v10 = ABRecordCopyValue(ValueAtIndex, a2);
        if (v10)
        {
          CFArrayRef v11 = v10;
          CFIndex v45 = v7;
          uint64_t RecordID = ABRecordGetRecordID(ValueAtIndex);
          CFIndex v64 = ABMultiValueGetCount(v11);
          if (v64 >= 1)
          {
            for (CFIndex i = 0; v64 != i; ++i)
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, @"%d", RecordID);
              CFArrayRef v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
              uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v11, i);
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v61, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", a3);
              CFDictionarySetValue(Mutable, @"contact", v14);
              if (v14) {
                CFRelease(v14);
              }
              CFDictionaryRef v17 = (const __CFDictionary *)ABMultiValueCopyValueAtIndex(v11, i);
              CFDictionaryRef v18 = v17;
              if (v8 == a2)
              {
                if (!v17) {
                  goto LABEL_36;
                }
                CFStringRef Value = CFDictionaryGetValue(v17, key);
                if (Value) {
                  CFDictionarySetValue(Mutable, @"street", Value);
                }
                CFStringRef v20 = CFDictionaryGetValue(v18, v55);
                if (v20) {
                  CFDictionarySetValue(Mutable, @"city", v20);
                }
                CFStringRef v21 = CFDictionaryGetValue(v18, v54);
                if (v21) {
                  CFDictionarySetValue(Mutable, @"state", v21);
                }
                CFArrayRef v22 = CFDictionaryGetValue(v18, v53);
                if (v22) {
                  CFDictionarySetValue(Mutable, @"postal code", v22);
                }
                uint64_t v23 = CFDictionaryGetValue(v18, v52);
                if (v23) {
                  CFDictionarySetValue(Mutable, @"country", v23);
                }
                CFDictionaryRef v24 = (const __CFDictionary *)CFDictionaryGetValue(v18, v51);
                if (!v24) {
                  goto LABEL_35;
                }
                CFDictionaryRef v25 = v24;
                ABPropertyID v26 = Mutable;
                ABPropertyID v27 = @"country code";
              }
              else if (v59 == a2)
              {
                if (!v17) {
                  goto LABEL_36;
                }
                ABPropertyID v28 = CFDictionaryGetValue(v17, v49);
                if (v28)
                {
                  ABPropertyID v29 = v28;
                  CFDictionaryRef v30 = a1[43];
                  if (!v30)
                  {
                    _InitializeInstantMessageServiceStringsArrays();
                    CFDictionaryRef v30 = CFDictionaryCreate(0, (const void **)&sABInstantMessageServiceStrings, (const void **)&sSyncServicesInstantMessageServiceStrings, 10, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    a1[43] = v30;
                  }
                  ABPropertyID v31 = CFDictionaryGetValue(v30, v29);
                  if (v31) {
                    CFDictionarySetValue(Mutable, v49, v31);
                  }
                }
                CFDictionaryRef v32 = (const __CFDictionary *)CFDictionaryGetValue(v18, v48);
                if (!v32) {
                  goto LABEL_35;
                }
                CFDictionaryRef v25 = v32;
                ABPropertyID v26 = Mutable;
                ABPropertyID v27 = @"user";
              }
              else
              {
                if (!v17) {
                  goto LABEL_36;
                }
                ABPropertyID v26 = Mutable;
                ABPropertyID v27 = @"value";
                CFDictionaryRef v25 = v18;
              }
              CFDictionarySetValue(v26, v27, v25);
LABEL_35:
              CFRelease(v18);
LABEL_36:
              CFStringRef v33 = ABMultiValueCopyLabelAtIndex(v11, i);
              if (v60 == a2)
              {
                CFDictionaryRef v34 = a1[33];
                if (!v34)
                {
                  if (!sABEmailTypeStrings)
                  {
                    sABEmailTypeStrings = v47;
                    unk_268A592B0 = v46;
                    sSyncServicesEmailTypeStrings = @"home";
                    unk_268A592C0 = @"work";
                  }
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABEmailTypeStrings, (const void **)&sSyncServicesEmailTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[33] = v34;
                }
              }
              else if (v58 == a2)
              {
                CFDictionaryRef v34 = a1[35];
                if (!v34)
                {
                  _InitializePhoneTypeStringsArrays();
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABPhoneTypeStrings, (const void **)&sSyncServicesPhoneTypeStrings, 7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[35] = v34;
                }
              }
              else if (v8 == a2)
              {
                CFDictionaryRef v34 = a1[37];
                if (!v34)
                {
                  if (!sABAddressTypeStrings)
                  {
                    sABAddressTypeStrings = v47;
                    unk_268A59340 = v46;
                    sSyncServicesAddressTypeStrings = @"home";
                    unk_268A59350 = @"work";
                  }
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABAddressTypeStrings, (const void **)&sSyncServicesAddressTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[37] = v34;
                }
              }
              else if (v59 == a2)
              {
                CFDictionaryRef v34 = a1[45];
                if (!v34)
                {
                  if (!sABInstantMessageTypeStrings)
                  {
                    sABInstantMessageTypeStrings = v47;
                    unk_268A59360 = v46;
                    sSyncServicesInstantMessageTypeStrings = @"home";
                    unk_268A59370 = @"work";
                  }
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABInstantMessageTypeStrings, (const void **)&sSyncServicesInstantMessageTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[45] = v34;
                }
              }
              else if (v43 == a2)
              {
                CFDictionaryRef v34 = a1[39];
                if (!v34)
                {
                  if (!sABURLTypeStrings)
                  {
                    sABURLTypeStrings = v40;
                    unk_268A59380 = v47;
                    qword_268A59388 = v46;
                    sSyncServicesURLTypeStrings = @"home page";
                    *(void *)algn_268A59398 = @"home";
                    qword_268A593A0 = @"work";
                  }
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABURLTypeStrings, (const void **)&sSyncServicesURLTypeStrings, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[39] = v34;
                }
              }
              else if (v42 == a2)
              {
                CFDictionaryRef v34 = a1[41];
                if (!v34)
                {
                  _InitializeRelatedNamesTypeStringsArrays();
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABRelatedNamesTypeStrings, (const void **)&sSyncServicesRelatedNamesTypeStrings, 11, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[41] = v34;
                }
              }
              else if (v41 == a2)
              {
                CFDictionaryRef v34 = a1[47];
                if (!v34)
                {
                  if (!sABDateTypeStrings)
                  {
                    sABDateTypeStrings = v39;
                    sSyncServicesDateTypeStrings = @"anniversary";
                  }
                  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&sABDateTypeStrings, (const void **)&sSyncServicesDateTypeStrings, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  a1[47] = v34;
                }
              }
              else
              {
                CFDictionaryRef v34 = 0;
              }
              if (!v33) {
                CFStringRef v33 = (const __CFString *)CFRetain(@"other");
              }
              ABPropertyID v35 = (__CFString *)CFDictionaryGetValue(v34, v33);
              if (v35) {
                goto LABEL_79;
              }
              if (CFEqual(v33, v57))
              {
                SInt32 v37 = @"iPhone";
LABEL_77:
                CFDictionarySetValue(Mutable, @"label", v37);
                goto LABEL_78;
              }
              if (CFStringCompare(v33, theString2, 0))
              {
                CFComparisonResult v36 = CFStringCompare(v33, @"other", 0);
                if (!v33)
                {
                  ABPropertyID v35 = @"other";
                  goto LABEL_79;
                }
                SInt32 v37 = (__CFString *)v33;
                ABPropertyID v35 = @"other";
                if (v36 == kCFCompareEqualTo) {
                  goto LABEL_79;
                }
                goto LABEL_77;
              }
LABEL_78:
              ABPropertyID v35 = @"other";
LABEL_79:
              CFDictionarySetValue(Mutable, @"type", v35);
              if (v33) {
                CFRelease(v33);
              }
              CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"%d/%d/%d", a2, RecordID, IdentifierAtIndex);
              CFDictionarySetValue(a4, v38, Mutable);
              if (v38) {
                CFRelease(v38);
              }
              if (Mutable) {
                CFRelease(Mutable);
              }
              if (values) {
                CFRelease(values);
              }
            }
          }
          CFRelease(v11);
          CFIndex v7 = v45;
        }
        ++v7;
      }
      while (v7 != Count);
    }
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _InitializePhoneTypeStringsArrays()
{
  if (!sABPhoneTypeStrings)
  {
    uint64_t v0 = *MEMORY[0x263F245F0];
    sABPhoneTypeStrings = *MEMORY[0x263F24340];
    unk_268A592D0 = v0;
    uint64_t v1 = *MEMORY[0x263F24558];
    qword_268A592D8 = *MEMORY[0x263F24560];
    unk_268A592E0 = v1;
    uint64_t v2 = *MEMORY[0x263F24580];
    qword_268A592E8 = *MEMORY[0x263F24548];
    unk_268A592F0 = v2;
    qword_268A592F8 = *MEMORY[0x263F24568];
    sSyncServicesPhoneTypeStrings = @"home";
    *(void *)algn_268A59308 = @"work";
    qword_268A59310 = @"mobile";
    unk_268A59318 = @"main";
    qword_268A59320 = @"home fax";
    unk_268A59328 = @"work fax";
    qword_268A59330 = @"pager";
  }
}

void _InitializeRelatedNamesTypeStringsArrays()
{
  if (!sABRelatedNamesTypeStrings)
  {
    uint64_t v0 = *MEMORY[0x263F24500];
    sABRelatedNamesTypeStrings = *MEMORY[0x263F243F0];
    unk_268A593B0 = v0;
    uint64_t v1 = *MEMORY[0x263F243A8];
    qword_268A593B8 = *MEMORY[0x263F24520];
    unk_268A593C0 = v1;
    uint64_t v2 = *MEMORY[0x263F24598];
    qword_268A593C8 = *MEMORY[0x263F243A0];
    unk_268A593D0 = v2;
    uint64_t v3 = *MEMORY[0x263F245A0];
    qword_268A593D8 = *MEMORY[0x263F24410];
    unk_268A593E0 = v3;
    uint64_t v4 = *MEMORY[0x263F24390];
    qword_268A593E8 = *MEMORY[0x263F24528];
    unk_268A593F0 = v4;
    qword_268A593F8 = *MEMORY[0x263F244E0];
    sSyncServicesRelatedNamesTypeStrings = @"father";
    *(void *)algn_268A59408 = @"mother";
    qword_268A59410 = @"parent";
    unk_268A59418 = @"child";
    qword_268A59420 = @"brother";
    unk_268A59428 = @"sister";
    qword_268A59430 = @"friend";
    unk_268A59438 = @"spouse";
    qword_268A59440 = @"partner";
    unk_268A59448 = @"assistant";
    qword_268A59450 = @"manager";
  }
}

void _InitializeInstantMessageServiceStringsArrays()
{
  if (!sABInstantMessageServiceStrings)
  {
    uint64_t v0 = *MEMORY[0x263F24460];
    sABInstantMessageServiceStrings = *MEMORY[0x263F24488];
    unk_268A59470 = v0;
    uint64_t v1 = *MEMORY[0x263F24458];
    qword_268A59478 = *MEMORY[0x263F24470];
    unk_268A59480 = v1;
    uint64_t v2 = *MEMORY[0x263F24478];
    qword_268A59488 = *MEMORY[0x263F24438];
    unk_268A59490 = v2;
    uint64_t v3 = *MEMORY[0x263F24480];
    qword_268A59498 = *MEMORY[0x263F24450];
    unk_268A594A0 = v3;
    uint64_t v4 = *MEMORY[0x263F24448];
    qword_268A594A8 = *MEMORY[0x263F24440];
    unk_268A594B0 = v4;
    sSyncServicesInstantMessageServiceStrings = @"yahoo";
    unk_268A594C0 = @"jabber";
    qword_268A594C8 = @"msn";
    unk_268A594D0 = @"icq";
    qword_268A594D8 = @"aim";
    unk_268A594E0 = @"qq";
    qword_268A594E8 = @"googletalk";
    unk_268A594F0 = @"skype";
    qword_268A594F8 = @"facebook";
    unk_268A59500 = @"gadugadu";
  }
}

void _saveDeviceSyncAnchorAndClearChangeHistory(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 436) & 0x80000000) == 0) {
    ABChangeHistoryClearChangesUpToSequenceNumberForClient();
  }
  CFErrorRef error = 0;
  if (!*(void *)(a1 + 160)) {
    *(void *)(a1 + 160) = CFRetain(@"---");
  }
  _setDeviceSyncAnchorForStore(a1);
  if (!ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) && DLShouldLog()) {
    _DLLog();
  }
  *(unsigned char *)(a1 + 442) = 1;
  if (error) {
    CFRelease(error);
  }
}

void _ChangesApplierFunction(const __CFString *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    CFStringRef v12 = (const __CFString *)CFDictionaryGetValue(a2, @"com.apple.syncservices.RecordEntityName");
    if (!v12)
    {
      if (!DLShouldLog()) {
        return;
      }
      goto LABEL_30;
    }
    CFStringRef v13 = v12;
    if (CFStringCompare(v12, @"com.apple.contacts.Group", 0))
    {
      if (CFStringCompare(v13, @"com.apple.contacts.Contact", 0))
      {
        if (CFStringCompare(v13, @"com.apple.contacts.Email Address", 0)
          && CFStringCompare(v13, @"com.apple.contacts.Phone Number", 0)
          && CFStringCompare(v13, @"com.apple.contacts.Street Address", 0)
          && CFStringCompare(v13, @"com.apple.contacts.URL", 0)
          && CFStringCompare(v13, @"com.apple.contacts.IM", 0)
          && CFStringCompare(v13, @"com.apple.contacts.Related Name", 0)
          && CFStringCompare(v13, @"com.apple.contacts.Date", 0))
        {
          if (!DLShouldLog()) {
            return;
          }
          goto LABEL_30;
        }
        CFDictionaryRef v14 = *(const __CFDictionary **)(a3 + 392);
        if (v14) {
          goto LABEL_319;
        }
        sSyncServicesEntityTypeStrings = @"com.apple.contacts.Email Address";
        unk_268A59510 = @"com.apple.contacts.Phone Number";
        qword_268A59518 = @"com.apple.contacts.Street Address";
        unk_268A59520 = @"com.apple.contacts.URL";
        qword_268A59528 = @"com.apple.contacts.Date";
        unk_268A59530 = @"com.apple.contacts.Related Name";
        qword_268A59538 = @"com.apple.contacts.IM";
        uint64_t v15 = (int)*MEMORY[0x263F24570];
        sABPropertyNames = (int)*MEMORY[0x263F243C8];
        *(void *)algn_268A59548 = v15;
        uint64_t v16 = (int)*MEMORY[0x263F245B0];
        qword_268A59550 = (int)*MEMORY[0x263F24368];
        unk_268A59558 = v16;
        uint64_t v17 = (int)*MEMORY[0x263F24590];
        qword_268A59560 = (int)*MEMORY[0x263F243B0];
        unk_268A59568 = v17;
        qword_268A59570 = (int)*MEMORY[0x263F24430];
        CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)&sSyncServicesEntityTypeStrings, (const void **)&sABPropertyNames, 7, MEMORY[0x263EFFF88], 0);
        *(void *)(a3 + 392) = v14;
        if (v14)
        {
LABEL_319:
          CFErrorRef error = 0;
          if (CFDictionaryGetValueIfPresent(v14, v13, (const void **)&error))
          {
            uint64_t v18 = error;
            CFArrayRef v19 = (const __CFArray *)CFDictionaryGetValue(a2, @"contact");
            if (v19 && (CFArrayRef v20 = v19, CFArrayGetCount(v19) == 1))
            {
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v20, 0);
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            else
            {
              CFStringRef ValueAtIndex = 0;
            }
            CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, @"/");
            GroupWithuint64_t RecordID = ArrayBySeparatingStrings;
            if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) >= 2)
            {
              if (CFArrayGetCount(GroupWithRecordID) == 3)
              {
                CFStringRef v34 = (const __CFString *)CFArrayGetValueAtIndex(GroupWithRecordID, 1);
                CFStringRef v35 = (const __CFString *)CFArrayGetValueAtIndex(GroupWithRecordID, 2);
                if (v35) {
                  IntCFStringRef Value = CFStringGetIntValue(v35);
                }
                else {
                  IntCFStringRef Value = -1;
                }
                if (ValueAtIndex && v34)
                {
                  if (CFEqual(v34, ValueAtIndex)) {
                    goto LABEL_141;
                  }
                  IntCFStringRef Value = -1;
                  goto LABEL_132;
                }
                if (v34) {
                  goto LABEL_141;
                }
LABEL_131:
                if (!ValueAtIndex)
                {
                  CFStringRef v34 = 0;
                  goto LABEL_138;
                }
LABEL_132:
                CFDictionaryRef v46 = *(const __CFDictionary **)(a3 + 248);
                if (v46 && (CFStringRef v47 = (const __CFString *)CFDictionaryGetValue(v46, ValueAtIndex)) != 0)
                {
                  CFStringRef v34 = v47;
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                }
                else
                {
                  CFStringRef v34 = ValueAtIndex;
                }
LABEL_138:
                if (DLShouldLog()) {
                  _DLLog();
                }
                if (!v34)
                {
                  if (!DLShouldLog()) {
                    goto LABEL_314;
                  }
                  goto LABEL_160;
                }
LABEL_141:
                if (recordIdentifierIsLocal(v34))
                {
                  uint64_t recordID = CFStringGetIntValue(v34);
                }
                else
                {
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                  uint64_t recordID = 0xFFFFFFFFLL;
                }
                CFDictionaryRef v48 = *(const __CFDictionary **)(a3 + 192);
                if (v48)
                {
                  CFStringRef v49 = CFDictionaryGetValue(v48, v34);
                  if (v49)
                  {
                    PersonWithuint64_t RecordID = v49;
                    if (DLShouldLog()) {
                      _DLLog();
                    }
LABEL_154:
                    if (DLShouldLog()) {
                      _DLLog();
                    }
                    LODWORD(value) = IntValue;
                    CFErrorRef error = 0;
                    CFTypeRef v51 = ABRecordCopyValue(PersonWithRecordID, v18);
                    CFStringRef v52 = v51;
                    if (v51)
                    {
                      if (IntValue == -1) {
                        CFIndex IndexForIdentifier = -1;
                      }
                      else {
                        CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v51, IntValue);
                      }
                      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v52);
                    }
                    else
                    {
                      if (*MEMORY[0x263F24430] == v18 || *MEMORY[0x263F24368] == v18) {
                        ABPropertyType v55 = 261;
                      }
                      else {
                        ABPropertyType v55 = 257;
                      }
                      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutable(v55);
                      CFIndex IndexForIdentifier = -1;
                    }
                    if (!MutableCopy) {
                      goto LABEL_311;
                    }
                    multiCFStringRef Value = MutableCopy;
                    int v57 = *MEMORY[0x263F24368];
                    CFIndex v88 = IndexForIdentifier;
                    if (*MEMORY[0x263F24368] == v18)
                    {
                      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
                      int v59 = CFDictionaryGetValue(a2, @"street");
                      if (v59) {
                        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24378], v59);
                      }
                      int v60 = CFDictionaryGetValue(a2, @"city");
                      if (v60) {
                        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24350], v60);
                      }
                      CFAllocatorRef v61 = CFDictionaryGetValue(a2, @"state");
                      if (v61) {
                        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24370], v61);
                      }
                      v62 = CFDictionaryGetValue(a2, @"postal code");
                      if (v62) {
                        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24380], v62);
                      }
                      CFIndex v63 = CFDictionaryGetValue(a2, @"country");
                      if (v63) {
                        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24360], v63);
                      }
                      CFIndex v64 = CFDictionaryGetValue(a2, @"country code");
                      if (v64)
                      {
                        uint64_t v65 = v64;
                        unsigned int v66 = (const void **)MEMORY[0x263F24358];
LABEL_217:
                        CFDictionarySetValue(Mutable, *v66, v65);
                      }
                    }
                    else if (*MEMORY[0x263F24430] == v18)
                    {
                      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
                      CFIndex v67 = CFDictionaryGetValue(a2, @"service");
                      if (v67)
                      {
                        v68 = v67;
                        CFDictionaryRef v69 = *(const __CFDictionary **)(a3 + 352);
                        if (!v69)
                        {
                          _InitializeInstantMessageServiceStringsArrays();
                          CFDictionaryRef v69 = CFDictionaryCreate(0, (const void **)&sSyncServicesInstantMessageServiceStrings, (const void **)&sABInstantMessageServiceStrings, 10, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 352) = v69;
                        }
                        CFAllocatorRef v70 = CFDictionaryGetValue(v69, v68);
                        if (v70) {
                          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24468], v70);
                        }
                      }
                      v71 = CFDictionaryGetValue(a2, @"user");
                      if (v71)
                      {
                        uint64_t v65 = v71;
                        unsigned int v66 = (const void **)MEMORY[0x263F24490];
                        goto LABEL_217;
                      }
                    }
                    else
                    {
                      int v72 = *MEMORY[0x263F245B0];
                      CFStringRef v73 = (const __CFString *)CFDictionaryGetValue(a2, @"value");
                      CFMutableDictionaryRef Mutable = (__CFDictionary *)v73;
                      if (v72 == v18)
                      {
                        CFMutableDictionaryRef Mutable = (__CFDictionary *)CFURLCreateStringByReplacingPercentEscapes(0, v73, &stru_26EE18D58);
                      }
                      else if (v73)
                      {
                        CFRetain(v73);
                      }
                      else
                      {
                        if (DLShouldLog()) {
                          _DLLog();
                        }
                        CFMutableDictionaryRef Mutable = 0;
                      }
                    }
                    CFStringRef v74 = (const __CFString *)CFDictionaryGetValue(a2, @"type");
                    if (!v74)
                    {
                      BOOL v78 = Mutable != 0;
                      goto LABEL_293;
                    }
                    CFStringRef v75 = v74;
                    if (CFStringCompare(v74, @"other", 0))
                    {
                      if (*MEMORY[0x263F243C8] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 272);
                        if (!v76)
                        {
                          if (!sABEmailTypeStrings)
                          {
                            uint64_t v77 = *MEMORY[0x263F245F0];
                            sABEmailTypeStrings = *MEMORY[0x263F24340];
                            unk_268A592B0 = v77;
                            sSyncServicesEmailTypeStrings = @"home";
                            unk_268A592C0 = @"work";
                          }
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesEmailTypeStrings, (const void **)&sABEmailTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 272) = v76;
                        }
                      }
                      else if (*MEMORY[0x263F24570] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 288);
                        if (!v76)
                        {
                          _InitializePhoneTypeStringsArrays();
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesPhoneTypeStrings, (const void **)&sABPhoneTypeStrings, 7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 288) = v76;
                        }
                      }
                      else if (v57 == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 304);
                        if (!v76)
                        {
                          if (!sABAddressTypeStrings)
                          {
                            uint64_t v82 = *MEMORY[0x263F245F0];
                            sABAddressTypeStrings = *MEMORY[0x263F24340];
                            unk_268A59340 = v82;
                            sSyncServicesAddressTypeStrings = @"home";
                            unk_268A59350 = @"work";
                          }
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesAddressTypeStrings, (const void **)&sABAddressTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 304) = v76;
                        }
                      }
                      else if (*MEMORY[0x263F24430] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 368);
                        if (!v76)
                        {
                          if (!sABInstantMessageTypeStrings)
                          {
                            uint64_t v83 = *MEMORY[0x263F245F0];
                            sABInstantMessageTypeStrings = *MEMORY[0x263F24340];
                            unk_268A59360 = v83;
                            sSyncServicesInstantMessageTypeStrings = @"home";
                            unk_268A59370 = @"work";
                          }
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesInstantMessageTypeStrings, (const void **)&sABInstantMessageTypeStrings, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 368) = v76;
                        }
                      }
                      else if (*MEMORY[0x263F245B0] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 320);
                        if (!v76)
                        {
                          if (!sABURLTypeStrings)
                          {
                            uint64_t v84 = *MEMORY[0x263F24340];
                            sABURLTypeStrings = *MEMORY[0x263F24418];
                            unk_268A59380 = v84;
                            qword_268A59388 = *MEMORY[0x263F245F0];
                            sSyncServicesURLTypeStrings = @"home page";
                            *(void *)algn_268A59398 = @"home";
                            qword_268A593A0 = @"work";
                          }
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesURLTypeStrings, (const void **)&sABURLTypeStrings, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 320) = v76;
                        }
                      }
                      else if (*MEMORY[0x263F24590] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 336);
                        if (!v76)
                        {
                          _InitializeRelatedNamesTypeStringsArrays();
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesRelatedNamesTypeStrings, (const void **)&sABRelatedNamesTypeStrings, 11, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 336) = v76;
                        }
                      }
                      else if (*MEMORY[0x263F243B0] == v18)
                      {
                        CFDictionaryRef v76 = *(const __CFDictionary **)(a3 + 384);
                        if (!v76)
                        {
                          if (!sABDateTypeStrings)
                          {
                            sABDateTypeStrings = *MEMORY[0x263F24388];
                            sSyncServicesDateTypeStrings = @"anniversary";
                          }
                          CFDictionaryRef v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesDateTypeStrings, (const void **)&sABDateTypeStrings, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 384) = v76;
                        }
                      }
                      else
                      {
                        CFDictionaryRef v76 = 0;
                      }
                      CFStringRef v80 = (const __CFString *)CFDictionaryGetValue(v76, v75);
                      if (DLShouldLog()) {
                        goto LABEL_286;
                      }
                    }
                    else
                    {
                      CFStringRef v79 = (const __CFString *)CFDictionaryGetValue(a2, @"label");
                      if (v79)
                      {
                        CFStringRef v80 = v79;
                        if (CFEqual(v79, @"iPhone"))
                        {
                          int v81 = DLShouldLog();
                          CFStringRef v80 = (const __CFString *)*MEMORY[0x263F24550];
                          if (v81) {
                            _DLLog();
                          }
                        }
                        if (DLShouldLog()) {
                          goto LABEL_286;
                        }
                      }
                      else
                      {
                        CFStringRef v80 = (const __CFString *)*MEMORY[0x263F24348];
                        if (DLShouldLog()) {
LABEL_286:
                        }
                          _DLLog();
                      }
                    }
                    BOOL v78 = Mutable != 0;
                    if (Mutable && v80)
                    {
                      if (v88 == -1)
                      {
                        ABMultiValueAddValueAndLabel(multiValue, Mutable, v80, (ABMultiValueIdentifier *)&value);
                        CFStringRef v86 = CFStringCreateWithFormat(0, 0, @"%d/%d/%d", v18, recordID, value);
                        CFMutableDictionaryRef v87 = *(CFMutableDictionaryRef *)(a3 + 256);
                        if (!v87)
                        {
                          CFMutableDictionaryRef v87 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
                          *(void *)(a3 + 256) = v87;
                        }
                        *(void *)(a3 + 240) = v87;
                        if (DLShouldLog()) {
                          _DLLog();
                        }
                        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 240), a1, v86);
                        v85 = multiValue;
                        if (v86) {
                          CFRelease(v86);
                        }
                      }
                      else
                      {
                        if (DLShouldLog()) {
                          _DLLog();
                        }
                        v85 = multiValue;
                        ABMultiValueReplaceValueAtIndex(multiValue, Mutable, v88);
                        ABMultiValueReplaceLabelAtIndex(multiValue, v80, v88);
                      }
                      ABMultiValueSetImmutable();
                      if (!ABRecordSetValue(PersonWithRecordID, v18, v85, &error) && DLShouldLog())
                      {
                        ABRecordGetRecordID(PersonWithRecordID);
                        _DLLog();
                      }
                      if (error)
                      {
                        CFRelease(error);
                        CFErrorRef error = 0;
                      }
                      goto LABEL_309;
                    }
LABEL_293:
                    if (DLShouldLog())
                    {
                      _DLLog();
                      v85 = multiValue;
                      if (!v78) {
                        goto LABEL_310;
                      }
                    }
                    else
                    {
                      v85 = multiValue;
                      if (!v78) {
                        goto LABEL_310;
                      }
                    }
LABEL_309:
                    CFRelease(Mutable);
LABEL_310:
                    CFRelease(v85);
LABEL_311:
                    if (!v52) {
                      goto LABEL_314;
                    }
                    CFArrayRef v45 = (CFArrayRef)v52;
                    goto LABEL_313;
                  }
                }
                if (recordID != -1)
                {
                  PersonWithuint64_t RecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a3 + 144), recordID);
                  if (PersonWithRecordID) {
                    goto LABEL_154;
                  }
                }
                if (!DLShouldLog()) {
                  goto LABEL_314;
                }
LABEL_160:
                _DLLog();
                goto LABEL_314;
              }
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            IntCFStringRef Value = -1;
            goto LABEL_131;
          }
        }
        if (!DLShouldLog()) {
          return;
        }
LABEL_30:
        _DLLog();
        return;
      }
      CFErrorRef v91 = 0;
      if (recordIdentifierIsLocal(a1)
        && (SInt32 v27 = CFStringGetIntValue(a1),
            (CFArrayRef v28 = (const __CFArray *)ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a3 + 144), v27)) != 0))
      {
        GroupWithuint64_t RecordID = v28;
        if (DLShouldLog()) {
          _DLLog();
        }
        CFRetain(GroupWithRecordID);
      }
      else
      {
        CFArrayRef v30 = (const __CFArray *)ABPersonCreateInSource(*(ABRecordRef *)(a3 + 152));
        if (!v30)
        {
          if (!DLShouldLog()) {
            return;
          }
          goto LABEL_30;
        }
        GroupWithuint64_t RecordID = v30;
        if (!ABAddressBookAddRecord(*(ABAddressBookRef *)(a3 + 144), v30, &v91))
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          CFRelease(GroupWithRecordID);
          CFErrorRef v29 = v91;
          if (v91) {
            goto LABEL_316;
          }
          return;
        }
        if (v91)
        {
          CFRelease(v91);
          CFErrorRef v91 = 0;
        }
        if (!*(void *)(a3 + 200)) {
          *(void *)(a3 + 200) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 200), a1, GroupWithRecordID);
      }
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24408], @"first name");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F244D0], @"last name");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F244F8], @"middle name");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24588], @"title");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F245A8], @"suffix");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24508], @"nickname");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F243F8], @"first name yomi");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F244C0], @"last name yomi");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F244E8], @"middle name yomi");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24518], @"company name");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F244A0], @"job title");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F243B8], @"department");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24510], @"notes");
      _SetContactValueInABPerson(a2, GroupWithRecordID, *MEMORY[0x263F24398], @"birthday");
      CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(a2, @"display as company");
      if (!v31)
      {
        ABRecordRemoveValue(GroupWithRecordID, *MEMORY[0x263F244B8], &v91);
        goto LABEL_171;
      }
      CFStringRef v32 = v31;
      if (CFStringCompare(v31, @"person", 0))
      {
        if (CFStringCompare(v32, @"company", 0)) {
          goto LABEL_173;
        }
        if (!ABRecordSetValue(GroupWithRecordID, *MEMORY[0x263F244B8], (CFTypeRef)*MEMORY[0x263F244A8], &v91)
          && DLShouldLog())
        {
          goto LABEL_170;
        }
      }
      else if (!ABRecordSetValue(GroupWithRecordID, *MEMORY[0x263F244B8], (CFTypeRef)*MEMORY[0x263F244B0], &v91) {
             && DLShouldLog())
      }
      {
LABEL_170:
        ABRecordGetRecordID(GroupWithRecordID);
        _DLLog();
      }
LABEL_171:
      if (v91)
      {
        CFRelease(v91);
        CFErrorRef v91 = 0;
      }
LABEL_173:
      value = 0;
      CFErrorRef error = 0;
      if (*(unsigned char *)(a3 + 440) && CFDictionaryGetValue(a2, @"ImageChanged") == (const void *)*MEMORY[0x263EFFB38])
      {
        if (DLShouldLog()) {
          goto LABEL_191;
        }
      }
      else
      {
        if (CFDictionaryGetValue(a2, @"SDImageUnchangedMarker"))
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          if (!CFDictionaryContainsKey(a2, @"image") || !DLShouldLog()) {
            goto LABEL_315;
          }
          goto LABEL_192;
        }
        if (!ABPersonRemoveImageData(GroupWithRecordID, &error) && DLShouldLog())
        {
          ABRecordGetRecordID(GroupWithRecordID);
          _DLLog();
        }
        if (error)
        {
          CFRelease(error);
          CFErrorRef error = 0;
        }
        if (!CFDictionaryGetValueIfPresent(a2, @"image", (const void **)&value)) {
          goto LABEL_315;
        }
        *(unsigned char *)(a3 + 137) = 1;
        if (CFDataGetLength((CFDataRef)value) <= *(int *)(a3 + 428))
        {
          if (!ABPersonSetImageData(GroupWithRecordID, (CFDataRef)value, &error))
          {
            if (DLShouldLog())
            {
              ABRecordGetRecordID(GroupWithRecordID);
              _DLLog();
            }
            if (error)
            {
              CFRelease(error);
              CFErrorRef error = 0;
            }
          }
          if ((ABPersonSetImageDataAndCropRect() & 1) == 0)
          {
            if (DLShouldLog())
            {
              ABRecordGetRecordID(GroupWithRecordID);
              _DLLog();
            }
            if (error) {
              CFRelease(error);
            }
          }
          goto LABEL_315;
        }
        if (DLShouldLog())
        {
LABEL_191:
          ABRecordGetRecordID(GroupWithRecordID);
LABEL_192:
          _DLLog();
        }
      }
LABEL_315:
      CFErrorRef v29 = GroupWithRecordID;
LABEL_316:
      CFRelease(v29);
      return;
    }
    CFErrorRef error = 0;
    if (recordIdentifierIsLocal(a1))
    {
      CFArrayRef v22 = CFStringCreateArrayBySeparatingStrings(0, a1, @"/");
      CFArrayRef v23 = v22;
      if (v22 && CFArrayGetCount(v22) == 2)
      {
        CFStringRef v24 = (const __CFString *)CFArrayGetValueAtIndex(v23, 1);
        SInt32 v25 = CFStringGetIntValue(v24);
        GroupWithuint64_t RecordID = (const __CFArray *)ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a3 + 144), v25);
        goto LABEL_83;
      }
      if (DLShouldLog()) {
        _DLLog();
      }
      if (v23)
      {
        GroupWithuint64_t RecordID = 0;
LABEL_83:
        CFRelease(v23);
        SInt32 v37 = CFDictionaryGetValue(a2, @"name");
        if (v37)
        {
          CFStringRef v38 = v37;
          if (GroupWithRecordID)
          {
            CFRetain(GroupWithRecordID);
            if (DLShouldLog())
            {
              ABRecordGetRecordID(GroupWithRecordID);
              _DLLog();
            }
LABEL_95:
            if (!ABRecordSetValue(GroupWithRecordID, *MEMORY[0x263F24338], v38, &error) && DLShouldLog())
            {
              ABRecordGetRecordID(GroupWithRecordID);
              _DLLog();
            }
            if (error)
            {
              CFRelease(error);
              CFErrorRef error = 0;
            }
            CFArrayRef v40 = (const __CFArray *)CFDictionaryGetValue(a2, @"members");
            if (v40)
            {
              CFArrayRef v41 = v40;
              CFRetain(v40);
            }
            else
            {
              CFArrayRef v41 = CFArrayCreate(0, 0, 0, 0);
            }
            int v42 = *(__CFArray **)(a3 + 224);
            if (!v42)
            {
              CFAllocatorRef v43 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
              CFIndex v44 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
              *(void *)(a3 + 224) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
              *(void *)(a3 + 232) = CFArrayCreateMutable(v43, 0, v44);
              int v42 = *(__CFArray **)(a3 + 224);
            }
            CFArrayAppendValue(v42, GroupWithRecordID);
            CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 232), v41);
            if (!v41)
            {
LABEL_314:
              if (!GroupWithRecordID) {
                return;
              }
              goto LABEL_315;
            }
            CFArrayRef v45 = v41;
LABEL_313:
            CFRelease(v45);
            goto LABEL_314;
          }
LABEL_88:
          if (DLShouldLog()) {
            _DLLog();
          }
          GroupWithuint64_t RecordID = (const __CFArray *)ABGroupCreateInSource(*(ABRecordRef *)(a3 + 152));
          if (!ABAddressBookAddRecord(*(ABAddressBookRef *)(a3 + 144), GroupWithRecordID, &error))
          {
            if (DLShouldLog()) {
              _DLLog();
            }
            CFShow(GroupWithRecordID);
            if (GroupWithRecordID) {
              CFRelease(GroupWithRecordID);
            }
            CFErrorRef v29 = error;
            if (error) {
              goto LABEL_316;
            }
            return;
          }
          uint64_t v39 = *(__CFDictionary **)(a3 + 208);
          if (!v39)
          {
            uint64_t v39 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            *(void *)(a3 + 208) = v39;
          }
          CFDictionaryAddValue(v39, a1, GroupWithRecordID);
          if (error)
          {
            CFRelease(error);
            CFErrorRef error = 0;
          }
          goto LABEL_95;
        }
LABEL_102:
        if (!DLShouldLog()) {
          return;
        }
        goto LABEL_30;
      }
    }
    CFStringRef v38 = CFDictionaryGetValue(a2, @"name");
    if (v38) {
      goto LABEL_88;
    }
    goto LABEL_102;
  }
  CFArrayRef v7 = CFStringCreateArrayBySeparatingStrings(0, a1, @"/");
  if (v7)
  {
    CFArrayRef v8 = v7;
    if (CFArrayGetCount(v7) >= 2)
    {
      if (CFArrayGetCount(v8) == 2)
      {
        CFStringRef v9 = (const __CFString *)CFArrayGetValueAtIndex(v8, 1);
        CFErrorRef error = 0;
        if (DLShouldLog()) {
          _DLLog();
        }
        if (recordIdentifierIsLocal(v9)
          && (SInt32 v10 = CFStringGetIntValue(v9),
              (ABRecordRef v11 = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a3 + 144), v10)) != 0))
        {
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a3 + 144), v11, &error) && DLShouldLog()) {
            _DLLog();
          }
          if (error) {
            CFRelease(error);
          }
        }
        else if (DLShouldLog())
        {
          _DLLog();
        }
        CFErrorRef v29 = v8;
        goto LABEL_316;
      }
      if (CFArrayGetCount(v8) == 3)
      {
        if (!*(void *)(a3 + 216)) {
          *(void *)(a3 + 216) = CFArrayCreateMutable(0, 0, 0);
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 216), a1);
        goto LABEL_107;
      }
      if (DLShouldLog()) {
        _DLLog();
      }
    }
    _DeleteContact(a3, a1);
LABEL_107:
    CFRelease(v8);
    return;
  }
  _DeleteContact(a3, a1);
}

void _DeleteContact(uint64_t a1, const __CFString *a2)
{
  CFErrorRef error = 0;
  if (DLShouldLog()) {
    _DLLog();
  }
  if (recordIdentifierIsLocal(a2)
    && (IntCFStringRef Value = CFStringGetIntValue(a2),
        (PersonWithuint64_t RecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a1 + 144), IntValue)) != 0))
  {
    if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), PersonWithRecordID, &error)
      && DLShouldLog())
    {
      _DLLog();
    }
    if (error) {
      CFRelease(error);
    }
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _SetContactValueInABPerson(const __CFDictionary *a1, const void *a2, ABPropertyID a3, void *key)
{
  CFErrorRef error = 0;
  CFStringRef Value = CFDictionaryGetValue(a1, key);
  if (Value)
  {
    if (ABRecordSetValue(a2, a3, Value, &error) || !DLShouldLog()) {
      goto LABEL_8;
    }
  }
  else if (ABRecordRemoveValue(a2, a3, &error) || !DLShouldLog())
  {
    goto LABEL_8;
  }
  ABRecordGetRecordID(a2);
  _DLLog();
LABEL_8:
  if (error) {
    CFRelease(error);
  }
}

void _UpdateContactRemapping(const void *a1, const void *a2, __CFDictionary **a3)
{
}

void _UpdateGroupRemapping(const void *a1, const void *a2, __CFDictionary **a3)
{
}

void _UpdateRecordRemapping(const void *a1, ABRecordRef record, __CFDictionary **a3, uint64_t (*a4)(uint64_t))
{
  uint64_t RecordID = ABRecordGetRecordID(record);
  if (RecordID)
  {
    uint64_t v9 = RecordID;
    CFMutableDictionaryRef Mutable = a3[31];
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      a3[31] = Mutable;
    }
    a3[30] = Mutable;
    ABRecordRef v11 = (const void *)a4(v9);
    if (DLShouldLog()) {
      _DLLog();
    }
    CFDictionarySetValue(a3[30], a1, v11);
    CFStringRef v12 = a3[24];
    if (!v12)
    {
      CFStringRef v12 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      a3[24] = v12;
    }
    CFDictionaryAddValue(v12, v11, record);
    if (v11)
    {
      CFRelease(v11);
    }
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _RestoreClearedPersonsSound(const __CFDictionary *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (const void *)ABPersonCopyCompositeName();
    if (v3)
    {
      uint64_t v4 = v3;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, v3);
      if (Value)
      {
        CFStringRef v6 = Value;
        if (CFStringCompare(Value, @"<null>", 0))
        {
          if (CFStringCompare(v6, @"<conflict>", 0))
          {
            if (DLShouldLog()) {
              _DLLog();
            }
            ABPersonSetSoundIdentifierForMultiValueIdentifier();
          }
          else if (DLShouldLog())
          {
            _DLLog();
          }
        }
      }
      CFRelease(v4);
    }
  }
}

uint64_t CalendarsDataSourceCreator(void *a1, uint64_t a2, const __CFDictionary *a3, void *a4)
{
  CFArrayRef v8 = (char *)malloc_type_calloc(0x168uLL, 1uLL, 0xC41700C8uLL);
  uint64_t v9 = (void *)MEMORY[0x263EFFB38];
  *a1 = v8;
  *(void *)CFArrayRef v8 = *v9;
  *((void *)v8 + 2) = CalendarsDataSourceGetVersionFunction;
  *((void *)v8 + 3) = CalendarsDataSourceCanSyncWithVersionFunction;
  *((void *)v8 + 4) = CalendarsDataSourceMigrateFunction;
  *((void *)v8 + 5) = CalendarsDataSourceRemoveStoreFunction;
  *((void *)v8 + 6) = CalendarsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((void *)v8 + 7) = CalendarsDataSourceClearSyncAnchors;
  *((void *)v8 + 8) = CalendarsDataSourceClearAllRecords;
  *((void *)v8 + 9) = CalendarsDataSourceGetChanges;
  *((void *)v8 + 10) = CalendarsDataSourceGetAllRecords;
  *((void *)v8 + 11) = CalendarsDataSourceGetCountOfRecords;
  *((void *)v8 + 12) = CalendarsDataSourceProcessChanges;
  *((void *)v8 + 13) = CalendarsDataSourceCommit;
  *((void *)v8 + 14) = CalendarsDataSourceRollback;
  *((void *)v8 + 15) = CalendarsDataSourceGetEntityTypeProcessOrder;
  *((void *)v8 + 16) = CalendarsDataSourceDeleteDataSource;
  *((void *)v8 + 17) = DLMemoryPoolCreate();
  *((void *)v8 + 37) = 0;
  *((_OWORD *)v8 + 9) = 0u;
  *((_OWORD *)v8 + 10) = 0u;
  *((_DWORD *)v8 + 44) = 0;
  *((_OWORD *)v8 + 13) = 0u;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 16) = 0u;
  *((_OWORD *)v8 + 17) = 0u;
  *((void *)v8 + 23) = CalDatabaseCreateWithOptions();
  CalDatabaseSetClientIdentifier();
  *((void *)v8 + 24) = CalDatabaseCopyDefaultLocalCalendar();
  if (!a2)
  {
    uint64_t v25 = CalDatabaseCopyLocalStore();
    *((void *)v8 + 25) = v25;
    if (v25)
    {
      uint64_t v24 = 0;
      goto LABEL_45;
    }
    if (!DLShouldLog()) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  uint64_t v10 = CalDatabaseCopyStoreWithExternalID();
  uint64_t v11 = v10;
  if (v10) {
    goto LABEL_7;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t Store = CalDatabaseCreateStore();
  if (Store)
  {
    uint64_t v11 = Store;
    CalStoreSetExternalID();
LABEL_7:
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a3)
    {
      if (CFDictionaryGetValue(a3, @"StoreDisplayName")) {
        CalStoreSetName();
      }
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"StoreType");
      if (Value)
      {
        int valuePtr = -1;
        if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr)) {
          CalStoreSetType();
        }
      }
    }
    CFStringRef v14 = (const __CFString *)CalDatabaseCopyProperty();
    if (!v14) {
      goto LABEL_27;
    }
    uint64_t v15 = v14;
    if (CFStringGetIntValue(v14) <= 106)
    {
      int Type = CalStoreGetType();
      CFRelease(v15);
      if (Type != 3) {
        goto LABEL_27;
      }
      if (DLShouldLog()) {
        _DLLog();
      }
      CFArrayRef v17 = (const __CFArray *)CalStoreCopyCalendars();
      if (!v17) {
        goto LABEL_27;
      }
      uint64_t v15 = v17;
      CFIndex Count = CFArrayGetCount(v17);
      if (Count >= 1)
      {
        CFIndex v19 = Count;
        for (CFIndex i = 0; i != v19; ++i)
        {
          CFArrayGetValueAtIndex((CFArrayRef)v15, i);
          uint64_t UID = CalCalendarGetUID();
          CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"%d", UID);
          CalCalendarSetExternalID();
          if (v22) {
            CFRelease(v22);
          }
        }
      }
    }
    CFRelease(v15);
LABEL_27:
    if (!v10) {
      CalDatabaseSave();
    }
    CFArrayRef v23 = (const void *)*((void *)v8 + 25);
    if (v23) {
      CFRelease(v23);
    }
    uint64_t v24 = 0;
    *((void *)v8 + 25) = v11;
    goto LABEL_45;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  if (a4)
  {
    *a4 = @"Could not create a new calendar store";
    CFRetain(@"Could not create a new calendar store");
  }
  if (DLShouldLog()) {
LABEL_41:
  }
    _DLLog();
LABEL_42:
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v24 = 0xFFFFFFFFLL;
LABEL_45:
  *((_DWORD *)v8 + 78) = CalDatabaseRegisterClientForPersistentChangeTrackingInStore();
  *(void *)&long long v26 = 0x100000001;
  *((void *)&v26 + 1) = 0x100000001;
  *(_OWORD *)(v8 + 316) = v26;
  *(void *)(v8 + 332) = 0xFFFFFFFEFFFFFFFELL;
  *((void *)v8 + 43) = 0;
  v8[340] = 0;
  *((_DWORD *)v8 + 88) = 257;
  v8[356] = 1;
  if (a3)
  {
    CFBooleanRef v27 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"ShouldSendAllCalendarsOnFastSync");
    if (v27)
    {
      CFBooleanRef v28 = v27;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[340] = CFBooleanGetValue(v28);
    }
    CFErrorRef v29 = CFDictionaryGetValue(a3, @"OrganizerAddressSet");
    if (v29)
    {
      CFArrayRef v30 = v29;
      if (DLShouldLog()) {
        _DLLog();
      }
      *((void *)v8 + 43) = CFRetain(v30);
    }
    CFBooleanRef v31 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"ShouldSyncAttendeesAndOrganizers");
    if (v31)
    {
      CFBooleanRef v32 = v31;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[352] = CFBooleanGetValue(v32);
    }
    CFBooleanRef v33 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"ShouldSyncCalendarColors");
    if (v33)
    {
      CFBooleanRef v34 = v33;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[353] = CFBooleanGetValue(v34);
    }
    CFBooleanRef v35 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"UpdateAnchorsOnPull");
    if (v35)
    {
      CFBooleanRef v36 = v35;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[354] = CFBooleanGetValue(v36);
    }
    CFBooleanRef v37 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"IsEventsOnly");
    if (v37)
    {
      CFBooleanRef v38 = v37;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[357] = CFBooleanGetValue(v38);
    }
    CFBooleanRef v39 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"IsRemindersOnly");
    if (v39)
    {
      CFBooleanRef v40 = v39;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[358] = CFBooleanGetValue(v40);
    }
    CFBooleanRef v41 = (const __CFBoolean *)CFDictionaryGetValue(a3, @"IsTetheredSync");
    if (v41)
    {
      CFBooleanRef v42 = v41;
      if (DLShouldLog()) {
        _DLLog();
      }
      v8[359] = CFBooleanGetValue(v42);
    }
  }
  return v24;
}

uint64_t CalendarsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3 = (CFNumberRef)sCalendarDataSourceVersion;
  if (!sCalendarDataSourceVersion)
  {
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultCalendarsDataSourceVersion);
    sCalendarDataSourceVersion = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t CalendarsDataSourceCanSyncWithVersionFunction(uint64_t a1, CFNumberRef number, void *a3)
{
  int valuePtr = 0;
  CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
  CFArrayRef v5 = (void *)MEMORY[0x263EFFB40];
  int v6 = valuePtr;
  if (valuePtr <= 102) {
    CFArrayRef v5 = (void *)MEMORY[0x263EFFB38];
  }
  *a3 = *v5;
  if (v6 <= 104)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    *(_WORD *)(a1 + 352) = 0;
    int v6 = valuePtr;
  }
  if (v6 <= 107)
  {
    *(unsigned char *)(a1 + 356) = 0;
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  return 0;
}

uint64_t CalendarsDataSourceMigrateFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CalStoreGetUID();
  uint64_t v6 = CalDatabaseCopyStoreWithUID();
  if (v6)
  {
    CFArrayRef v7 = (const void *)v6;
    if (DLShouldLog()) {
      _DLLog();
    }
    CFArrayRef v8 = (const __CFArray *)CalStoreCopyCalendars();
    if (v8)
    {
      CFArrayRef v9 = v8;
      CFIndex Count = CFArrayGetCount(v8);
      if (Count < 1)
      {
        CFRelease(v9);
      }
      else
      {
        CFIndex v11 = Count;
        uint64_t v21 = a1;
        CFIndex v12 = 0;
        int v13 = 0;
        do
        {
          CFArrayGetValueAtIndex(v9, v12);
          CFStringRef v14 = (const __CFString *)CalCalendarCopyType();
          if ((CalCalendarIsSubscribed() & 1) != 0
            || (CalCalendarIsInbox() & 1) != 0
            || (CalCalendarIsNotificationsCollection() & 1) != 0
            || CalCalendarGetSharingStatus() == 3
            || v14
            && (CFEqual(v14, @"caldav")
             || CFEqual(v14, @"urlsubscribe"))
            || CalCalendarGetSharingStatus() == 2
            || CalCalendarIsReadOnly())
          {
            uint64_t v15 = (const void *)CalCalendarCopyTitle();
            if (DLShouldLog())
            {
              CalCalendarGetUID();
              _DLLog();
            }
            if (v15) {
              CFRelease(v15);
            }
            CalRemoveCalendar();
            int v13 = 1;
          }
          if (v14) {
            CFRelease(v14);
          }
          ++v12;
        }
        while (v11 != v12);
        CFRelease(v9);
        a1 = v21;
        if (v13) {
          CalDatabaseSave();
        }
      }
    }
    if (*(unsigned char *)(a1 + 357) || *(unsigned char *)(a1 + 358) || *(unsigned char *)(a2 + 357) || *(unsigned char *)(a2 + 358)) {
      int v17 = CalDatabaseMigrateCalendarsWithEntityType();
    }
    else {
      int v17 = CalStoreMigrateToStore();
    }
    int v18 = v17;
    CFRelease(v7);
    if (v18)
    {
      _setComputerSyncAnchorForStore_0(a2);
      _setDeviceSyncAnchorForStore_0(a2);
      if (CalDatabaseSave())
      {
        uint64_t v19 = 0;
      }
      else
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        uint64_t v19 = 0xFFFFFFFFLL;
      }
      _setComputerSyncAnchorForStore_0(a1);
      _setDeviceSyncAnchorForStore_0(a1);
      if ((CalDatabaseSave() & 1) == 0)
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        return 0xFFFFFFFFLL;
      }
      return v19;
    }
    uint64_t v16 = @"CalendarsDataSourceMigrateFunction: could not perform cal store migration";
  }
  else
  {
    uint64_t v16 = @"CalendarsDataSourceMigrateFunction: Could not get the destination data source";
  }
  return MEMORY[0x270F4ADB8](0xFFFFFFFFLL, a3, v16);
}

uint64_t CalendarsDataSourceRemoveStoreFunction(uint64_t a1)
{
  if (DLShouldLog())
  {
    CalStoreGetUID();
    _DLLog();
  }
  _setComputerSyncAnchorForStore_0(a1);
  _setDeviceSyncAnchorForStore_0(a1);
  uint64_t v2 = (const void *)CalStoreCopyExternalID();
  CalRemoveStore();
  if (CalDatabaseSave())
  {
    uint64_t v3 = 0;
    if (!v2) {
      return v3;
    }
    goto LABEL_9;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (v2) {
LABEL_9:
  }
    CFRelease(v2);
  return v3;
}

uint64_t CalendarsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, const __CFString *a3, const void *a4, uint64_t *a5, CFTypeRef *a6)
{
  CFStringRef v12 = _copyComputerSyncAnchorKey_0(a1);
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v13 = CalDatabaseCopyProperty();
  if (!v13)
  {
    CFStringRef v14 = (const __CFString *)CalDatabaseCopyProperty();
    if (v14)
    {
      CFStringRef v15 = v14;
      if (CFStringCompare(v14, @"__UNUSED__", 0))
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        CalDatabaseSetProperty();
        CalDatabaseSetProperty();
        uint64_t v13 = (uint64_t)CFRetain(v15);
      }
      else
      {
        uint64_t v13 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  if (v12) {
    CFRelease(v12);
  }
  if (a4)
  {
    CFRetain(a4);
    *(void *)(a1 + 152) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = CFRetain(@"SDSyncTypeFast");
  *a5 = v13;
  CFStringRef v16 = _copyDeviceSyncAnchorKey_0(a1);
  if (DLShouldLog()) {
    _DLLog();
  }
  CFStringRef v17 = (const __CFString *)CalDatabaseCopyProperty();
  if (!v17)
  {
    CFStringRef v18 = (const __CFString *)CalDatabaseCopyProperty();
    if (v18)
    {
      CFStringRef v19 = v18;
      if (CFStringCompare(v18, @"__UNUSED__", 0))
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        CalDatabaseSetProperty();
        CalDatabaseSetProperty();
        CFStringRef v17 = (const __CFString *)CFRetain(v19);
      }
      else
      {
        CFStringRef v17 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      CFStringRef v17 = 0;
    }
  }
  if (v16) {
    CFRelease(v16);
  }
  CFStringRef v20 = (const __CFString *)CalDatabaseCopyProperty();
  CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%d", kDefaultCalendarsDataSourceVersion);
  if (DLShouldLog()) {
    _DLLog();
  }
  if (v17)
  {
    if (v20 && CFEqual(v20, v21))
    {
      if (a3 && CFEqual(v17, a3))
      {
LABEL_40:
        CFRelease(v17);
        if (!v20) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      if (DLShouldLog()) {
        _DLLog();
      }
      CFStringRef v22 = @"SDSyncTypeSlow";
    }
    else
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      CFStringRef v22 = @"SDSyncTypeReset";
    }
    *a2 = CFRetain(v22);
    goto LABEL_40;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = CFRetain(@"SDSyncTypeReset");
  if (v20) {
LABEL_41:
  }
    CFRelease(v20);
LABEL_42:
  if (v21) {
    CFRelease(v21);
  }
  CFLocaleRef v23 = CFLocaleCopyCurrent();
  uint64_t v24 = CFDateFormatterCreate(0, v23, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
  CFDateFormatterSetFormat(v24, @"MMM dd yyyy HH:mm:ss ZZZ");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateFormatterCreateStringWithAbsoluteTime(0, v24, Current);
  long long v26 = (const void *)DLMemoryPoolAddObject();
  *(void *)(a1 + 144) = v26;
  *a6 = CFRetain(v26);
  if (DLShouldLog()) {
    _DLLog();
  }
  CFRelease(v24);
  CFRelease(v23);
  return 0;
}

uint64_t CalendarsDataSourceClearSyncAnchors(uint64_t a1)
{
  return CalDatabaseSave() - 1;
}

uint64_t CalendarsDataSourceClearAllRecords(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 357) || *(unsigned char *)(a1 + 358))
  {
    CFArrayRef v2 = (const __CFArray *)CalStoreCopyCalendars();
    if (v2)
    {
      CFArrayRef v3 = v2;
      CFIndex Count = CFArrayGetCount(v2);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFArrayGetValueAtIndex(v3, i);
          if (CalCalendarCanContainEntityType())
          {
            if (DLShouldLog())
            {
              CalCalendarGetUID();
              _DLLog();
            }
            if (CalCalendarCanContainEntityType())
            {
              CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType();
              CalCalendarSetCanContainEntityType();
            }
            else
            {
              CFArrayRef v7 = (const void *)CalCalendarCopyTitle();
              CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", v7);
              if (v7) {
                CFRelease(v7);
              }
              CalDatabaseSetProperty();
              if (v8) {
                CFRelease(v8);
              }
              CalRemoveCalendar();
            }
          }
        }
      }
      CFRelease(v3);
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 312) & 0x80000000) == 0) {
      CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
    }
    CFArrayRef v9 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
    if (v9)
    {
      CFArrayRef v10 = v9;
      CFIndex v11 = CFArrayGetCount(v9);
      if (v11 >= 1)
      {
        CFIndex v12 = v11;
        for (CFIndex j = 0; j != v12; ++j)
        {
          CFArrayGetValueAtIndex(v10, j);
          CFStringRef v14 = (const void *)CalCalendarCopyTitle();
          if (DLShouldLog())
          {
            uint64_t UID = CalCalendarGetUID();
            _DLLog();
          }
          CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", v14, UID);
          if (v14) {
            CFRelease(v14);
          }
          CalDatabaseSetProperty();
          if (v15) {
            CFRelease(v15);
          }
          CalRemoveCalendar();
        }
      }
      CFRelease(v10);
    }
    if (!*(void *)(a1 + 144))
    {
      CFRetain(@"---");
      *(void *)(a1 + 144) = DLMemoryPoolAddObject();
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    _setDeviceSyncAnchorForStore_0(a1);
  }
  return 0;
}

uint64_t CalendarsDataSourceGetChanges(uint64_t a1, CFMutableDictionaryRef *a2, void *a3)
{
  *a2 = 0;
  int v6 = *(_DWORD *)(a1 + 176);
  if (v6 == 2)
  {
LABEL_4:
    *(_DWORD *)(a1 + 320) = CalDatabaseCopyEventChangesInStore();
    *(_DWORD *)(a1 + 324) = CalDatabaseCopyTaskChangesInStore();
    *(_DWORD *)(a1 + 328) = CalDatabaseCopyAlarmChangesInStore();
    *(_DWORD *)(a1 + 332) = CalDatabaseCopyRecurrenceChangesInStore();
    *(_DWORD *)(a1 + 336) = CalDatabaseCopyAttendeeChangesInStore();
    *a3 = *MEMORY[0x263EFFB38];
    _AccumulateChangedRecords(a1, 2, a2, 0, 0);
    _AccumulateChangedRecords(a1, 8, a2, 0, 0);
    _AccumulateChangedRecords(a1, 4, a2, 0, 0);
    _AccumulateChangedRecords(a1, 5, a2, 0, 0);
    _AccumulateChangedRecords(a1, 7, a2, 0, 0);
    if (!*(unsigned char *)(a1 + 354)) {
      _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
    }
    uint64_t result = 0;
    *(_DWORD *)(a1 + 176) = 6;
    return result;
  }
  if (!v6)
  {
    *(_DWORD *)(a1 + 176) = 2;
    *(_DWORD *)(a1 + 316) = CalDatabaseCopyCalendarChangesInStore();
    *(void *)(a1 + 304) = CFSetCreateMutable(0, 0, 0);
    if (CFArrayGetCount(0) >= 1)
    {
      CFIndex v8 = 0;
      do
      {
        CFArrayRef v9 = *(__CFSet **)(a1 + 304);
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(0, v8);
        CFSetAddValue(v9, ValueAtIndex);
        ++v8;
      }
      while (v8 < CFArrayGetCount(0));
    }
    if (*(unsigned char *)(a1 + 340) == 1)
    {
      CFArrayRef v11 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
      if (v11)
      {
        CFArrayRef v12 = v11;
        _AccumulateCalendars(a1, a2, v11);
        CFRelease(v12);
        if (DLShouldLog()) {
          _DLLog();
        }
        if (*a2 && CFDictionaryGetCount(*a2) >= 1)
        {
          *a3 = *MEMORY[0x263EFFB40];
          return 0;
        }
      }
    }
    else
    {
      _AccumulateChangedRecords(a1, 1, a2, 0, 0);
      if (DLShouldLog()) {
        _DLLog();
      }
      if (*a2 && CFDictionaryGetCount(*a2) >= 1)
      {
        uint64_t result = 0;
        *a3 = *MEMORY[0x263EFFB40];
        return result;
      }
    }
    goto LABEL_4;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  return 0xFFFFFFFFLL;
}

uint64_t CalendarsDataSourceGetAllRecords(uint64_t a1, CFMutableDictionaryRef *a2, void *a3)
{
  *a2 = 0;
  *a3 = *MEMORY[0x263EFFB40];
  switch(*(_DWORD *)(a1 + 176))
  {
    case 0:
      *(_DWORD *)(a1 + 316) = CalDatabaseCopyCalendarChangesInStore();
      CFArrayRef v6 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
      if (v6)
      {
        CFArrayRef v7 = v6;
        _AccumulateCalendars(a1, a2, v6);
        CFRelease(v7);
      }
      int v8 = 2;
      goto LABEL_21;
    case 2:
      *(_DWORD *)(a1 + 320) = CalDatabaseCopyEventChangesInStore();
      CFArrayRef v9 = (const __CFArray *)CalDatabaseCopyOfAllEventsInStore();
      if (v9)
      {
        CFArrayRef v10 = v9;
        _AccumulateEvents(a1, a2, v9);
        if (*(unsigned char *)(a1 + 352) == 1)
        {
          CFArrayRef v11 = *(const void **)(a1 + 288);
          if (v11)
          {
            CFRelease(v11);
            *(void *)(a1 + 288) = 0;
          }
          _AccumulateOrganizers(a1, (CFMutableDictionaryRef *)(a1 + 288), v10);
        }
        CFRelease(v10);
      }
      int v8 = 3;
      goto LABEL_21;
    case 3:
      *(_DWORD *)(a1 + 328) = CalDatabaseCopyAlarmChangesInStore();
      CFArrayRef v12 = (const __CFArray *)CalDatabaseCopyOfAllAlarmsInStore();
      if (v12)
      {
        CFArrayRef v13 = v12;
        _AccumulateAlarms(a2, v12);
        CFRelease(v13);
      }
      int v8 = 4;
      goto LABEL_21;
    case 4:
      *(_DWORD *)(a1 + 332) = CalDatabaseCopyRecurrenceChangesInStore();
      CFArrayRef v14 = (const __CFArray *)CalDatabaseCopyOfAllRecurrencesInStore();
      if (v14)
      {
        CFArrayRef v15 = v14;
        _AccumulateRecurrences(a2, v14);
        CFRelease(v15);
      }
      if (!*(unsigned char *)(a1 + 352)) {
        goto LABEL_28;
      }
      int v8 = 5;
LABEL_21:
      *(_DWORD *)(a1 + 176) = v8;
      break;
    case 5:
      *(_DWORD *)(a1 + 336) = CalDatabaseCopyAttendeeChangesInStore();
      CFArrayRef v16 = (const __CFArray *)CalDatabaseCopyOfAllAttendeesInStore();
      if (v16)
      {
        CFArrayRef v17 = v16;
        _AccumulateAttendees(a1, a2, v16);
        CFRelease(v17);
      }
      CFDictionaryRef v18 = *(const __CFDictionary **)(a1 + 288);
      if (v18)
      {
        CFMutableDictionaryRef Mutable = *a2;
        if (!*a2)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          *a2 = Mutable;
          CFDictionaryRef v18 = *(const __CFDictionary **)(a1 + 288);
        }
        CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)_addOrganizersToDictionary, Mutable);
        CFRelease(*(CFTypeRef *)(a1 + 288));
      }
      goto LABEL_28;
    default:
      if (DLShouldLog()) {
        _DLLog();
      }
LABEL_28:
      *(_DWORD *)(a1 + 176) = 6;
      *a3 = *MEMORY[0x263EFFB38];
      if (!*(unsigned char *)(a1 + 354) && !*(unsigned char *)(a1 + 355)) {
        _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
      }
      break;
  }
  return 0;
}

uint64_t CalendarsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  if (*(unsigned char *)(a1 + 357))
  {
    *a2 = 0;
    CountOfEventsInuint64_t Store = CalDatabaseGetCountOfEventsInStore();
  }
  else
  {
    int v4 = *(unsigned __int8 *)(a1 + 358);
    *a2 = 0;
    if (v4) {
      CountOfEventsInuint64_t Store = CalDatabaseGetCountOfTasksInStore();
    }
    else {
      CountOfEventsInuint64_t Store = CalDatabaseGetCountOfCalendarItemsInStore();
    }
  }
  *a2 = CountOfEventsInStore;
  return 0;
}

uint64_t CalendarsDataSourceProcessChanges(uint64_t context, CFDictionaryRef theDict, uint64_t a3, void *a4)
{
  if (*(unsigned char *)(context + 354) && !*(unsigned char *)(context + 355)) {
    _saveDeviceSyncAnchorAndClearChangeHistory_0(context);
  }
  if (*(unsigned char *)(context + 352) == 1 && !*(void *)(context + 344)) {
    *(void *)(context + 344) = _copySetOfEmailAddressesFromMessageFramework(context);
  }
  CFDictionaryRef v7 = *(const __CFDictionary **)(context + 160);
  if (v7)
  {
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)_addCurrentRemappingsToAllRemappings, (void *)context);
    *(void *)(context + 160) = 0;
  }
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_ChangesApplierFunction_0, (void *)context);
  CalDatabaseProcessAddedRecords();
  CFDictionaryRef v8 = *(const __CFDictionary **)(context + 208);
  if (v8)
  {
    CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)_UpdateCalendarRemapping, (void *)context);
    *(void *)(context + 208) = 0;
  }
  CFDictionaryRef v9 = *(const __CFDictionary **)(context + 216);
  if (v9)
  {
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)_UpdateEventRemapping, (void *)context);
    *(void *)(context + 216) = 0;
  }
  CFDictionaryRef v10 = *(const __CFDictionary **)(context + 272);
  if (v10 && CFDictionaryGetCount(v10))
  {
    if (*(void *)(context + 264))
    {
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(context + 272), (CFDictionaryApplierFunction)_UpdateDetachedEvents, (void *)context);
      CFSetRef v11 = *(const __CFSet **)(context + 280);
      if (v11)
      {
        CFSetApplyFunction(v11, (CFSetApplierFunction)_RemoveProcessedMainRecordIds, (void *)context);
        CFSetRemoveAllValues(*(CFMutableSetRef *)(context + 280));
      }
    }
    else if (DLShouldLog())
    {
      _DLLog();
    }
  }
  CFDictionaryRef v12 = *(const __CFDictionary **)(context + 248);
  if (v12)
  {
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)_UpdateOrganizerRemapping, (void *)context);
    *(void *)(context + 248) = 0;
  }
  CFDictionaryRef v13 = *(const __CFDictionary **)(context + 224);
  if (v13)
  {
    CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_UpdateTaskRemapping, (void *)context);
    *(void *)(context + 224) = 0;
  }
  CFDictionaryRef v14 = *(const __CFDictionary **)(context + 232);
  if (v14)
  {
    CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)_UpdateAlarmRemapping, (void *)context);
    *(void *)(context + 232) = 0;
  }
  CFDictionaryRef v15 = *(const __CFDictionary **)(context + 240);
  if (v15)
  {
    CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)_UpdateRecurrenceRemapping, (void *)context);
    *(void *)(context + 240) = 0;
  }
  CFDictionaryRef v16 = *(const __CFDictionary **)(context + 256);
  if (v16)
  {
    CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)_UpdateAttendeeRemapping, (void *)context);
    *(void *)(context + 256) = 0;
  }
  *a4 = *(void *)(context + 160);
  return 0;
}

uint64_t CalendarsDataSourceCommit(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 354) && !*(unsigned char *)(a1 + 355)) {
    _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
  }
  if (!*(void *)(a1 + 152))
  {
    CFRetain(@"---");
    *(void *)(a1 + 152) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  _setComputerSyncAnchorForStore_0(a1);
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%d", kDefaultCalendarsDataSourceVersion);
  CalDatabaseSetProperty();
  if (v4) {
    CFRelease(v4);
  }
  if (*(unsigned char *)(a1 + 359)) {
    CalStoreSetAllowsEvents();
  }
  if (CalDatabaseSaveAndFlushCaches())
  {
    CalDatabaseWaitForSpotlight();
    return 0;
  }
  else
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    if (a2)
    {
      *a2 = @"Can't commit Calendars";
      CFRetain(@"Can't commit Calendars");
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t CalendarsDataSourceRollback()
{
  return 0;
}

uint64_t CalendarsDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  CFMutableDictionaryRef Mutable = *(__CFArray **)(a1 + 296);
  if (!Mutable)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef v6 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFDictionaryRef v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, @"com.apple.calendars.Calendar");
    CFArrayAppendValue(Mutable, v7);
    if (v7) {
      CFRelease(v7);
    }
    CFDictionaryRef v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v8, @"com.apple.calendars.Event");
    CFArrayAppendValue(Mutable, v8);
    if (v8) {
      CFRelease(v8);
    }
    CFDictionaryRef v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v9, @"com.apple.calendars.AudioAlarm");
    CFArrayAppendValue(v9, @"com.apple.calendars.DisplayAlarm");
    CFArrayAppendValue(Mutable, v9);
    if (v9) {
      CFRelease(v9);
    }
    CFDictionaryRef v10 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v10, @"com.apple.calendars.Recurrence");
    CFArrayAppendValue(Mutable, v10);
    if (v10) {
      CFRelease(v10);
    }
    CFSetRef v11 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v11, @"com.apple.calendars.Attendee");
    CFArrayAppendValue(v11, @"com.apple.calendars.Organizer");
    CFArrayAppendValue(Mutable, v11);
    if (v11) {
      CFRelease(v11);
    }
    CFDictionaryRef v12 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v12, @"com.apple.calendars.CalendarOrder");
    CFArrayAppendValue(Mutable, v12);
    if (v12) {
      CFRelease(v12);
    }
    *(void *)(a1 + 296) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t CalendarsDataSourceDeleteDataSource(void *a1)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  CFArrayRef v2 = (const void *)a1[17];
  if (v2)
  {
    CFRelease(v2);
    a1[17] = 0;
  }
  CFArrayRef v3 = (const void *)a1[37];
  if (v3)
  {
    CFRelease(v3);
    a1[37] = 0;
  }
  CFStringRef v4 = (const void *)a1[24];
  if (v4)
  {
    CFRelease(v4);
    a1[24] = 0;
  }
  CFAllocatorRef v5 = (const void *)a1[25];
  if (v5)
  {
    CFRelease(v5);
    a1[25] = 0;
  }
  CFArrayRef v6 = (const void *)a1[43];
  if (v6)
  {
    CFRelease(v6);
    a1[43] = 0;
  }
  CFDictionaryRef v7 = (const void *)a1[23];
  if (v7)
  {
    CFRelease(v7);
    a1[23] = 0;
  }
  CFDictionaryRef v8 = (const void *)a1[38];
  if (v8) {
    CFRelease(v8);
  }
  free(a1);
  return 0;
}

id _reallyCopySetOfEmailAddressesFromMessageFramework()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (DLShouldLog()) {
    _DLLog();
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  if (_calendarSyncAccountLoader_onceToken != -1) {
    dispatch_once(&_calendarSyncAccountLoader_onceToken, &__block_literal_global);
  }
  uint64_t v1 = (void *)[(id)_calendarSyncAccountLoader_sSyncAccountLoader mailAccounts];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "emailAddresses"));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  int v6 = DLShouldLog();
  if (v0)
  {
    if (v6) {
      goto LABEL_16;
    }
  }
  else if (v6)
  {
LABEL_16:
    _DLLog();
  }
  return v0;
}

uint64_t _copySetOfEmailAddressesFromMessageFramework(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___copySetOfEmailAddressesFromMessageFramework_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_copySetOfEmailAddressesFromMessageFramework_onceToken != -1) {
    dispatch_once(&_copySetOfEmailAddressesFromMessageFramework_onceToken, block);
  }
  return _copySetOfEmailAddressesFromMessageFramework_sEmails;
}

id ___copySetOfEmailAddressesFromMessageFramework_block_invoke()
{
  id result = _reallyCopySetOfEmailAddressesFromMessageFramework();
  _copySetOfEmailAddressesFromMessageFramework_sEmails = (uint64_t)result;
  return result;
}

void _setComputerSyncAnchorForStore_0(uint64_t a1)
{
  CFStringRef v1 = _copyComputerSyncAnchorKey_0(a1);
  if (DLShouldLog()) {
    _DLLog();
  }
  CalDatabaseSetProperty();
  if (v1)
  {
    CFRelease(v1);
  }
}

void _setDeviceSyncAnchorForStore_0(uint64_t a1)
{
  CFStringRef v1 = _copyDeviceSyncAnchorKey_0(a1);
  if (DLShouldLog()) {
    _DLLog();
  }
  CalDatabaseSetProperty();
  if (v1)
  {
    CFRelease(v1);
  }
}

CFStringRef _copyComputerSyncAnchorKey_0(uint64_t a1)
{
  if (DLShouldLog())
  {
    if (a1)
    {
      uint64_t v2 = *(void *)(a1 + 200);
      if (v2)
      {
        uint64_t UID = CalStoreGetUID();
LABEL_7:
        uint64_t v6 = v2;
        uint64_t v7 = UID;
        _DLLog();
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
    uint64_t UID = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:
  if (a1 && *(void *)(a1 + 200)) {
    uint64_t v4 = CalStoreGetUID();
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  return CFStringCreateWithFormat(0, 0, @"ComputerStoreSyncAnchor-%d", v4, v6, v7);
}

CFStringRef _copyDeviceSyncAnchorKey_0(uint64_t a1)
{
  if (DLShouldLog())
  {
    if (a1)
    {
      uint64_t v2 = *(void *)(a1 + 200);
      if (v2)
      {
        uint64_t UID = CalStoreGetUID();
LABEL_7:
        uint64_t v6 = v2;
        uint64_t v7 = UID;
        _DLLog();
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
    uint64_t UID = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:
  if (a1 && *(void *)(a1 + 200)) {
    uint64_t v4 = CalStoreGetUID();
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  return CFStringCreateWithFormat(0, 0, @"DeviceStoreSyncAnchor-%d", v4, v6, v7);
}

void _AccumulateCalendars(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  if (CFArrayGetCount(theArray))
  {
    uint64_t v6 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a2) {
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      CFAllocatorRef v10 = *v6;
      value = (void *)*MEMORY[0x263EFFB40];
      do
      {
        if (CFArrayGetValueAtIndex(theArray, v9) == *(const void **)(a1 + 192))
        {
          if (DLShouldLog()) {
            goto LABEL_25;
          }
        }
        else if (CalCalendarIsSubscribed())
        {
          if (DLShouldLog()) {
            goto LABEL_25;
          }
        }
        else if (CalCalendarCanContainEntityType())
        {
          int UID = CalCalendarGetUID();
          uint64_t v12 = CalCalendarCopyTitle();
          if (UID == -1)
          {
            CFDictionaryRef v18 = (const void *)v12;
            if (DLShouldLog()) {
              _DLLog();
            }
            if (!v18) {
              goto LABEL_26;
            }
            goto LABEL_65;
          }
          if (v12)
          {
            CFTypeRef cf = (CFTypeRef)v12;
            CFStringRef key = CFStringCreateWithFormat(0, 0, @"%d/%d", 1, UID);
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFSetRef v14 = *(const __CFSet **)(a1 + 304);
            if (v14 && CFSetContainsValue(v14, (const void *)UID)) {
              CFDictionarySetValue(Mutable, @"com.apple.MobileSync.updated", value);
            }
            CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.Calendar");
            theDict = Mutable;
            CFDictionarySetValue(Mutable, @"title", cf);
            int valuePtr = 0;
            CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", cf);
            CFStringRef v16 = (const __CFString *)CalDatabaseCopyProperty();
            if (v16)
            {
              CFStringRef v17 = v16;
              if (CFStringGetIntValue(v16)) {
                int valuePtr = 1;
              }
              CFDictionarySetValue(theDict, @"com.apple.MobileSync.calDAVInfo", value);
              if (DLShouldLog()) {
                _DLLog();
              }
              CFRelease(v17);
            }
            else
            {
              int valuePtr = CalCalendarIsReadOnly();
              if (valuePtr && DLShouldLog()) {
                _DLLog();
              }
            }
            if (v15) {
              CFRelease(v15);
            }
            CFNumberRef v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            if (v19)
            {
              CFNumberRef v20 = v19;
              CFDictionarySetValue(theDict, @"read only", v19);
              CFRelease(v20);
            }
            else if (DLShouldLog())
            {
              _DLLog();
            }
            if (*(unsigned char *)(a1 + 353) == 1)
            {
              int v37 = -1;
              int v38 = -1;
              int v35 = 255;
              int v36 = -1;
              char ColorComponents = CalCalendarGetColorComponents();
              if (DLShouldLog()) {
                _DLLog();
              }
              CFStringRef v22 = CFArrayCreateMutable(v10, 0, MEMORY[0x263EFFF70]);
              if ((ColorComponents & 1) == 0)
              {
                if (DLShouldLog()) {
                  _DLLog();
                }
                int v36 = -1;
                int v37 = -1;
                int v38 = -1;
              }
              CFAllocatorRef v29 = v10;
              CFArrayRef v30 = a2;
              CFNumberRef v23 = CFNumberCreate(0, kCFNumberIntType, &v38);
              CFNumberRef v24 = CFNumberCreate(0, kCFNumberIntType, &v37);
              CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &v36);
              CFNumberRef v26 = CFNumberCreate(0, kCFNumberIntType, &v35);
              CFArrayAppendValue(v22, v23);
              CFArrayAppendValue(v22, v24);
              CFArrayAppendValue(v22, v25);
              CFArrayAppendValue(v22, v26);
              if (v23) {
                CFRelease(v23);
              }
              if (v24) {
                CFRelease(v24);
              }
              if (v25) {
                CFRelease(v25);
              }
              CFAllocatorRef v10 = v29;
              if (v26) {
                CFRelease(v26);
              }
              CFDictionarySetValue(theDict, @"colorComponents", v22);
              a2 = v30;
              if (v22) {
                CFRelease(v22);
              }
            }
            CFBooleanRef v27 = (const void *)CalCalendarCopyType();
            if (v27)
            {
              CFBooleanRef v28 = v27;
              CFDictionarySetValue(theDict, @"com.apple.ical.type", v27);
              CFRelease(v28);
            }
            CFDictionaryRef v18 = key;
            CFDictionarySetValue(*a2, key, theDict);
            if (DLShouldLog()) {
              _DLLog();
            }
            CFRelease(cf);
            CFRelease(theDict);
LABEL_65:
            CFRelease(v18);
            goto LABEL_26;
          }
          if (DLShouldLog()) {
LABEL_25:
          }
            _DLLog();
        }
        else if (DLShouldLog())
        {
          goto LABEL_25;
        }
LABEL_26:
        ++v9;
      }
      while (v8 != v9);
    }
  }
}

void _AccumulateEvents(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  if (CFArrayGetCount(theArray))
  {
    uint64_t v6 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a2) {
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      CFAllocatorRef allocator = *v6;
      uint64_t v51 = a1;
      double v10 = *MEMORY[0x263F300F0];
      CFStringRef v52 = a2;
      do
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
        uint64_t RowID = CalCalendarItemGetRowID();
        uint64_t v13 = (const void *)MEMORY[0x23ECC0B60](ValueAtIndex);
        uint64_t v14 = CalCalendarItemCopyCalendar();
        CFStringRef v15 = (const void *)v14;
        if (RowID == -1)
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          if (v13) {
            CFRelease(v13);
          }
          if (!v15) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if (!v14)
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          CFStringRef v15 = v13;
          if (!v13) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if (CalCalendarIsSubscribed())
        {
          if (!DLShouldLog()) {
            goto LABEL_28;
          }
        }
        else if (CalCalendarCanContainEntityType())
        {
          if (v15 == *(const void **)(a1 + 192))
          {
            uint64_t UID = 0xFFFFFFFFLL;
LABEL_34:
            CFStringRef key = CFStringCreateWithFormat(0, 0, @"%d/%d", 2, RowID, v45);
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.Event");
            if (v15 == *(const void **)(a1 + 192))
            {
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            else
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", 1, UID);
              CFArrayRef v18 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
              CFDictionarySetValue(Mutable, @"calendar", v18);
              CFRelease(v18);
              CFRelease(values);
            }
            if (v13) {
              CFDictionarySetValue(Mutable, @"summary", v13);
            }
            CFNumberRef v19 = (const void *)CalEventCopyLocation_Deprecated();
            if (v19)
            {
              CFNumberRef v20 = v19;
              CFDictionarySetValue(Mutable, @"location", v19);
              CFRelease(v20);
            }
            CFStringRef v21 = (const void *)MEMORY[0x23ECC0B00](ValueAtIndex);
            if (v21)
            {
              CFStringRef v22 = v21;
              CFDictionarySetValue(Mutable, @"description", v21);
              CFRelease(v22);
            }
            if (CalEventIsAllDay())
            {
              LODWORD(values) = 1;
              CFNumberRef v23 = CFNumberCreate(0, kCFNumberIntType, &values);
              CFDictionarySetValue(Mutable, @"all day", v23);
              if (v23) {
                CFRelease(v23);
              }
            }
            CFNumberRef v24 = (void *)MEMORY[0x23ECC0B70](ValueAtIndex);
            if (v24)
            {
              CFNumberRef v25 = v24;
              CFDictionarySetValue(Mutable, @"url", (const void *)[v24 absoluteString]);
              CFRelease(v25);
            }
            *(double *)&uint64_t v26 = COERCE_DOUBLE(CalEventCopyStartDate());
            CFStringRef v28 = v27;
            CalEventGetEndDate();
            if (v28)
            {
              CFAbsoluteTime v30 = v29;
              CFAbsoluteTime v31 = *(double *)&v26;
              if (CFStringCompare(v28, @"_float", 0))
              {
                CFDictionarySetValue(Mutable, @"start date.timezone", v28);
                goto LABEL_54;
              }
              if (CalEventIsAllDay())
              {
LABEL_54:
                CFDateRef v32 = CFDateCreate(0, *(CFAbsoluteTime *)&v26);
                CFDateRef v33 = CFDateCreate(0, v30);
                if (v32) {
                  goto LABEL_55;
                }
              }
              else
              {
                CFTimeZoneRef v41 = CFTimeZoneCopyDefault();
                CFStringRef v46 = CFTimeZoneCopyAbbreviation(v41, v31);
                CFDictionarySetValue(Mutable, @"start date.timezone", v46);
                CFTimeZoneRef cf = v41;
                double SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v41, v31);
                values = (void *)(uint64_t)SecondsFromGMT;
                CFNumberRef v43 = CFNumberCreate(0, kCFNumberSInt64Type, &values);
                CFDateRef v44 = CFDateCreate(0, SecondsFromGMT + v31);
                CFNumberRef v49 = v43;
                CFDictionarySetValue(Mutable, @"floatingOffset", v43);
                CFDateRef v48 = v44;
                CFDictionarySetValue(Mutable, @"floatingGMTDate", v44);
                CFDateRef v32 = CFDateCreate(0, v31 - SecondsFromGMT);
                CFDateRef v33 = CFDateCreate(0, v30 - SecondsFromGMT);
                if (DLShouldLog())
                {
                  CFDateRef v45 = v48;
                  _DLLog();
                }
                CFRelease(cf);
                CFRelease(v46);
                CFRelease(v48);
                CFRelease(v49);
                if (v32)
                {
LABEL_55:
                  CFDictionarySetValue(Mutable, @"start date", v32);
                  CFRelease(v32);
                }
              }
              CalDateTimeRelease();
              if (v33)
              {
                CFDictionarySetValue(Mutable, @"end date", v33);
                CFRelease(v33);
              }
            }
            else
            {
              CalDateTimeRelease();
            }
            CalEventGetOriginalStartDate();
            if (v34 != v10)
            {
              CFDateRef v35 = CFDateCreate(0, v34);
              CFDictionarySetValue(Mutable, @"original date", v35);
              CFRelease(v35);
            }
            uint64_t v36 = CalEventCopyOriginalEvent();
            if (v36)
            {
              uint64_t v37 = CalCalendarItemGetRowID();
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", 2, v37);
              CFArrayRef v38 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
              CFDictionarySetValue(Mutable, @"main event", v38);
              CFRelease(v38);
              CFRelease(values);
            }
            CFBooleanRef v39 = (const void *)MEMORY[0x23ECC0B20](ValueAtIndex);
            if (v39)
            {
              CFBooleanRef v40 = v39;
              CFDictionarySetValue(Mutable, @"exception dates", v39);
              CFRelease(v40);
            }
            CFDictionarySetValue(*v52, key, Mutable);
            if (DLShouldLog()) {
              _DLLog();
            }
            a1 = v51;
            if (v13) {
              CFRelease(v13);
            }
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (key) {
              CFRelease(key);
            }
            CFRelease(v15);
            CFStringRef v15 = (const void *)v36;
            if (!v36) {
              goto LABEL_31;
            }
            goto LABEL_30;
          }
          uint64_t UID = CalCalendarGetUID();
          if (UID != -1) {
            goto LABEL_34;
          }
          if (!DLShouldLog()) {
            goto LABEL_28;
          }
        }
        else if (!DLShouldLog())
        {
          goto LABEL_28;
        }
        _DLLog();
LABEL_28:
        if (v13) {
          CFRelease(v13);
        }
LABEL_30:
        CFRelease(v15);
LABEL_31:
        ++v9;
      }
      while (v8 != v9);
    }
  }
}

void _AccumulateOrganizers(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  if (*(unsigned char *)(a1 + 352) && CFArrayGetCount(theArray))
  {
    uint64_t v4 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a2) {
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      CFAllocatorRef allocator = *v4;
      CFIndex v8 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/CalendarsDataSource.m";
      do
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
        uint64_t v10 = CalCalendarItemCopyCalendar();
        if (v10)
        {
          long long v11 = (const void *)v10;
          if (CalCalendarIsSubscribed())
          {
            if (DLShouldLog()) {
LABEL_31:
            }
              _DLLog();
LABEL_32:
            CFNumberRef v24 = v11;
LABEL_33:
            CFRelease(v24);
            goto LABEL_34;
          }
          if ((CalCalendarCanContainEntityType() & 1) == 0)
          {
            if (DLShouldLog()) {
              goto LABEL_31;
            }
            goto LABEL_32;
          }
          CFRelease(v11);
        }
        uint64_t v12 = MEMORY[0x23ECC0B30](ValueAtIndex);
        if (v12)
        {
          uint64_t v13 = (const void *)v12;
          uint64_t RowID = CalCalendarItemGetRowID();
          if (RowID == -1)
          {
            if (DLShouldLog()) {
              _DLLog();
            }
            goto LABEL_34;
          }
          uint64_t v15 = RowID;
          CFStringRef v16 = v8;
          values = 0;
          values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", 2, RowID);
          CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"%d/%d", 8, v15);
          CFArrayRef v18 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.Organizer");
          CFDictionarySetValue(Mutable, @"owner", v18);
          CFNumberRef v20 = (const void *)MEMORY[0x23ECC0C90](v13);
          if (v20)
          {
            CFStringRef v21 = v20;
            CFDictionarySetValue(Mutable, @"common name", v20);
            CFRelease(v21);
          }
          CFStringRef v22 = (const void *)MEMORY[0x23ECC0CA0](v13);
          if (v22)
          {
            CFNumberRef v23 = v22;
            CFDictionarySetValue(Mutable, @"email", v22);
            CFRelease(v23);
          }
          CFDictionarySetValue(*a2, v17, Mutable);
          CFIndex v8 = v16;
          if (DLShouldLog()) {
            _DLLog();
          }
          if (Mutable) {
            CFRelease(Mutable);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v17) {
            CFRelease(v17);
          }
          if (values)
          {
            CFRelease(values);
            values = 0;
          }
          CFNumberRef v24 = v13;
          goto LABEL_33;
        }
LABEL_34:
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

void _AccumulateAlarms(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  if (CFArrayGetCount(theArray))
  {
    uint64_t v3 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a1) {
      *a1 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      CFAllocatorRef allocator = *v3;
      do
      {
        CFArrayGetValueAtIndex(theArray, v6);
        uint64_t UID = CalAlarmGetUID();
        if (UID == -1)
        {
          if (DLShouldLog()) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v8 = UID;
          uint64_t v9 = CalAlarmCopyOwningEntity();
          if (v9)
          {
            uint64_t v10 = (const void *)v9;
            int v11 = _entityTypeForRecord();
            uint64_t RowID = CalCalendarItemGetRowID();
            if (RowID == -1)
            {
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            else
            {
              uint64_t v13 = RowID;
              uint64_t v14 = CalCalendarItemCopyCalendar();
              if (v14)
              {
                uint64_t v15 = (const void *)v14;
                if (CalCalendarIsSubscribed())
                {
                  if (DLShouldLog()) {
LABEL_35:
                  }
                    _DLLog();
LABEL_36:
                  CFRelease(v10);
                  uint64_t v26 = v15;
LABEL_37:
                  CFRelease(v26);
                  goto LABEL_38;
                }
                if ((CalCalendarCanContainEntityType() & 1) == 0)
                {
                  if (DLShouldLog()) {
                    goto LABEL_35;
                  }
                  goto LABEL_36;
                }
                CFRelease(v15);
              }
              values = 0;
              uint64_t v16 = 2;
              if (v11 != 2) {
                uint64_t v16 = 3;
              }
              values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", v16, v13);
              CFArrayRef v17 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
              CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"%d/%d", 4, v8);
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              if (CalAlarmGetType() == 1)
              {
                CFNumberRef v20 = Mutable;
                CFStringRef v21 = @"com.apple.syncservices.RecordEntityName";
                CFStringRef v22 = @"com.apple.calendars.AudioAlarm";
              }
              else
              {
                CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.DisplayAlarm");
                CFNumberRef v20 = Mutable;
                CFStringRef v21 = @"description";
                CFStringRef v22 = @"Event reminder";
              }
              CFDictionarySetValue(v20, v21, v22);
              CFDictionarySetValue(Mutable, @"owner", v17);
              CalAlarmGetTriggerDate();
              if (v23 != 1.17549435e-38)
              {
                CFDateRef v24 = CFDateCreate(0, v23);
                CFDictionarySetValue(Mutable, @"triggerdate", v24);
                CFRelease(v24);
              }
              int valuePtr = 0;
              int valuePtr = CalAlarmGetTriggerInterval();
              if (valuePtr != 0x7FFFFFFF)
              {
                CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, @"triggerduration", v25);
                CFRelease(v25);
              }
              CFDictionarySetValue(*a1, v18, Mutable);
              if (DLShouldLog()) {
                _DLLog();
              }
              CFRelease(Mutable);
              CFRelease(values);
              CFRelease(v17);
              CFRelease(v18);
            }
            uint64_t v26 = v10;
            goto LABEL_37;
          }
          if (DLShouldLog()) {
LABEL_16:
          }
            _DLLog();
        }
LABEL_38:
        ++v6;
      }
      while (v5 != v6);
    }
  }
}

void _AccumulateRecurrences(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  CFArrayRef v2 = theArray;
  if (CFArrayGetCount(theArray))
  {
    uint64_t v4 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a1) {
      *a1 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      CFAllocatorRef allocator = *v4;
      CFStringRef v73 = a1;
      double v8 = *MEMORY[0x263F300F0];
      CFArrayRef v74 = v2;
      CFIndex v75 = Count;
      do
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v2, v7);
        uint64_t UID = CalRecurrenceGetUID();
        if (UID == -1)
        {
          if (DLShouldLog()) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v11 = UID;
          uint64_t v12 = MEMORY[0x23ECC0D30](ValueAtIndex);
          if (v12)
          {
            uint64_t v13 = (const void *)v12;
            uint64_t v14 = CalCalendarItemCopyCalendar();
            if (v14)
            {
              uint64_t v15 = (const void *)v14;
              if (CalCalendarIsSubscribed())
              {
                if (DLShouldLog()) {
LABEL_26:
                }
                  _DLLog();
LABEL_27:
                CFRelease(v13);
                CFStringRef v21 = v15;
LABEL_28:
                CFRelease(v21);
                goto LABEL_103;
              }
              if ((CalCalendarCanContainEntityType() & 1) == 0)
              {
                if (DLShouldLog()) {
                  goto LABEL_26;
                }
                goto LABEL_27;
              }
              CFRelease(v15);
            }
            uint64_t RowID = CalCalendarItemGetRowID();
            if (RowID != -1)
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", 2, RowID);
              CFArrayRef v17 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
              CFStringRef key = CFStringCreateWithFormat(0, 0, @"%d/%d", 5, v11);
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.Recurrence");
              CFArrayRef cf = v17;
              CFDictionarySetValue(Mutable, @"owner", v17);
              int WeekStartDirectly = CalRecurrenceGetWeekStartDirectly();
              if (WeekStartDirectly != 7)
              {
                DayOfWeekStringForDayOfWeeCFIndex k = _GetDayOfWeekStringForDayOfWeek(WeekStartDirectly);
                if (DayOfWeekStringForDayOfWeek)
                {
                  CFDictionarySetValue(Mutable, @"weekstartday", DayOfWeekStringForDayOfWeek);
                }
                else if (DLShouldLog())
                {
                  _DLLog();
                }
              }
              int Frequency = CalRecurrenceGetFrequency();
              if (Frequency)
              {
                CFAbsoluteTime v23 = (__CFString *)sFrequencyStrings_0;
                if (!sFrequencyStrings_0)
                {
                  CFAbsoluteTime v23 = @"daily";
                  sFrequencyStrings_0 = @"daily";
                  sFrequencyStrings_1 = @"weekly";
                  sFrequencyStrings_2 = @"monthly";
                  sFrequencyStrings_3 = @"yearly";
                }
                switch(Frequency)
                {
                  case 1:
                    goto LABEL_38;
                  case 2:
                    CFAbsoluteTime v23 = (__CFString *)sFrequencyStrings_1;
                    if (!sFrequencyStrings_1) {
                      goto LABEL_41;
                    }
                    goto LABEL_39;
                  case 3:
                    CFAbsoluteTime v23 = (__CFString *)sFrequencyStrings_2;
LABEL_38:
                    if (v23) {
                      goto LABEL_39;
                    }
                    goto LABEL_41;
                  case 4:
                    CFAbsoluteTime v23 = (__CFString *)sFrequencyStrings_3;
                    if (!sFrequencyStrings_3) {
                      goto LABEL_41;
                    }
LABEL_39:
                    CFDictionarySetValue(Mutable, @"frequency", v23);
                    break;
                  default:
LABEL_41:
                    if (DLShouldLog()) {
                      _DLLog();
                    }
                    break;
                }
              }
              int valuePtr = CalRecurrenceGetInterval();
              if (valuePtr)
              {
                CFNumberRef v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, @"interval", v24);
                CFRelease(v24);
              }
              int v80 = 0;
              int v80 = CalRecurrenceGetCount();
              if (v80 >= 1)
              {
                CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &v80);
                CFDictionarySetValue(Mutable, @"count", v25);
                CFRelease(v25);
              }
              CalRecurrenceGetEndDate();
              if (v26 != v8)
              {
                CFDateRef v27 = CFDateCreate(0, v26);
                CFDictionarySetValue(Mutable, @"until", v27);
                CFRelease(v27);
              }
              unsigned int v28 = CalRecurrenceGetByMonthMonths();
              if (v28)
              {
                unsigned int v29 = v28;
                CFAbsoluteTime v30 = CFArrayCreateMutable(0, 12, MEMORY[0x263EFFF70]);
                uint64_t v31 = 0;
                do
                {
                  if ((v29 >> v31))
                  {
                    uint64_t v79 = ++v31;
                    CFNumberRef v32 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v30, v32);
                    CFRelease(v32);
                  }
                  else
                  {
                    ++v31;
                  }
                }
                while (v31 != 12);
                if (CFArrayGetCount(v30) >= 1) {
                  CFDictionarySetValue(Mutable, @"bymonth", v30);
                }
                CFRelease(v30);
              }
              CFArrayRef v33 = (const __CFArray *)CalRecurrenceCopyByWeekWeeks();
              if (v33)
              {
                CFArrayRef v34 = v33;
                uint64_t v35 = CFArrayGetCount(v33);
                if (v35 >= 1)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = CFArrayCreateMutable(0, v35, MEMORY[0x263EFFF70]);
                  for (CFIndex i = 0; i != v36; ++i)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v34, i);
                    CFNumberRef v39 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v37, v39);
                    CFRelease(v39);
                  }
                  if (CFArrayGetCount(v37) >= 1) {
                    CFDictionarySetValue(Mutable, @"byweeknumber", v37);
                  }
                  CFRelease(v37);
                }
                CFRelease(v34);
              }
              CFArrayRef v40 = (const __CFArray *)CalRecurrenceCopyByYearDayDays();
              if (v40)
              {
                CFArrayRef v41 = v40;
                uint64_t v42 = CFArrayGetCount(v40);
                if (v42 >= 1)
                {
                  uint64_t v43 = v42;
                  CFDateRef v44 = CFArrayCreateMutable(0, v42, MEMORY[0x263EFFF70]);
                  for (CFIndex j = 0; j != v43; ++j)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v41, j);
                    CFNumberRef v46 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v44, v46);
                    CFRelease(v46);
                  }
                  if (CFArrayGetCount(v44) >= 1) {
                    CFDictionarySetValue(Mutable, @"byyearday", v44);
                  }
                  CFRelease(v44);
                }
                CFRelease(v41);
              }
              CFArrayRef v47 = (const __CFArray *)CalRecurrenceCopyByMonthDayDays();
              if (v47)
              {
                CFArrayRef v48 = v47;
                uint64_t v49 = CFArrayGetCount(v47);
                if (v49 >= 1)
                {
                  uint64_t v50 = v49;
                  uint64_t v51 = CFArrayCreateMutable(0, v49, MEMORY[0x263EFFF70]);
                  for (CFIndex k = 0; k != v50; ++k)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v48, k);
                    CFNumberRef v53 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v51, v53);
                    CFRelease(v53);
                  }
                  if (CFArrayGetCount(v51) >= 1) {
                    CFDictionarySetValue(Mutable, @"bymonthday", v51);
                  }
                  CFRelease(v51);
                }
                CFRelease(v48);
              }
              CFArrayRef v54 = (const __CFArray *)CalRecurrenceCopyBySetPos();
              if (v54)
              {
                CFArrayRef v55 = v54;
                uint64_t v56 = CFArrayGetCount(v54);
                if (v56 >= 1)
                {
                  uint64_t v57 = v56;
                  int v58 = CFArrayCreateMutable(0, v56, MEMORY[0x263EFFF70]);
                  for (CFIndex m = 0; m != v57; ++m)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v55, m);
                    CFNumberRef v60 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v58, v60);
                    CFRelease(v60);
                  }
                  if (CFArrayGetCount(v58) >= 1) {
                    CFDictionarySetValue(Mutable, @"bysetpos", v58);
                  }
                  CFRelease(v58);
                }
                CFRelease(v55);
              }
              CFArrayRef v61 = (const __CFArray *)CalRecurrenceCopyByDayDays();
              CFIndex v6 = v75;
              if (v61)
              {
                CFArrayRef v62 = v61;
                uint64_t v63 = CFArrayGetCount(v61);
                if (v63 >= 1)
                {
                  CFIndex v64 = v63;
                  uint64_t v65 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
                  unsigned int v66 = CFArrayCreateMutable(0, v63, MEMORY[0x263EFFF70]);
                  CFIndex v67 = CFArrayCreateMutable(0, v64, v65);
                  for (CFIndex n = 0; n != v64; ++n)
                  {
                    CFDictionaryRef v69 = (int *)CFArrayGetValueAtIndex(v62, n);
                    CFNumberRef v70 = CFNumberCreate(0, kCFNumberIntType, v69);
                    v71 = _GetDayOfWeekStringForDayOfWeek(v69[1]);
                    if (v71)
                    {
                      CFArrayAppendValue(v66, v71);
                      CFArrayAppendValue(v67, v70);
                    }
                    CFRelease(v70);
                  }
                  if (CFArrayGetCount(v66) >= 1)
                  {
                    CFDictionarySetValue(Mutable, @"bydaydays", v66);
                    CFDictionarySetValue(Mutable, @"bydayfreq", v67);
                  }
                  CFRelease(v66);
                  CFRelease(v67);
                  CFIndex v6 = v75;
                }
                CFRelease(v62);
              }
              CFDictionarySetValue(*v73, key, Mutable);
              if (DLShouldLog()) {
                _DLLog();
              }
              CFRelease(Mutable);
              CFRelease(values);
              CFRelease(cf);
              CFRelease(key);
              CFRelease(v13);
              CFArrayRef v2 = v74;
              goto LABEL_103;
            }
            if (DLShouldLog()) {
              _DLLog();
            }
            CFStringRef v21 = v13;
            goto LABEL_28;
          }
          if (DLShouldLog()) {
LABEL_15:
          }
            _DLLog();
        }
LABEL_103:
        ++v7;
      }
      while (v7 != v6);
    }
  }
}

void _AccumulateAttendees(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  if (*(unsigned char *)(a1 + 352) && CFArrayGetCount(theArray))
  {
    CFIndex v5 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (!*a2) {
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      CFArrayRef v34 = a2;
      CFAllocatorRef allocator = *v5;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/CalendarsDataSource.m";
      do
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        uint64_t v12 = MEMORY[0x23ECC05C0](ValueAtIndex, v11);
        if (v12 == -1)
        {
          if (DLShouldLog()) {
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v13 = v12;
          uint64_t v14 = MEMORY[0x23ECC0580](ValueAtIndex);
          if (v14)
          {
            uint64_t v15 = (const void *)v14;
            uint64_t v16 = CalCalendarItemCopyCalendar();
            if (v16)
            {
              CFArrayRef v17 = (const void *)v16;
              if (CalCalendarIsSubscribed())
              {
                if (DLShouldLog()) {
                  _DLLog();
                }
                CFRelease(v17);
                goto LABEL_36;
              }
              if (CalCalendarCanContainEntityType())
              {
                CFRelease(v17);
                goto LABEL_20;
              }
              if (DLShouldLog()) {
                _DLLog();
              }
              CFRelease(v15);
              CFArrayRef v33 = v17;
            }
            else
            {
LABEL_20:
              uint64_t RowID = CalCalendarItemGetRowID();
              if (RowID != -1)
              {
                CFNumberRef v19 = v9;
                values = 0;
                values = (void *)CFStringCreateWithFormat(0, 0, @"%d/%d", 2, RowID);
                CFArrayRef v20 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
                CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%d/%d", 7, v13);
                CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.calendars.Attendee");
                CFDictionarySetValue(Mutable, @"owner", v20);
                CFAbsoluteTime v23 = (const void *)MEMORY[0x23ECC0560](ValueAtIndex);
                if (v23)
                {
                  CFNumberRef v24 = v23;
                  CFDictionarySetValue(Mutable, @"common name", v23);
                  CFRelease(v24);
                }
                CFNumberRef v25 = (const void *)MEMORY[0x23ECC0570](ValueAtIndex);
                if (v25)
                {
                  CFAbsoluteTime v26 = v25;
                  CFDictionarySetValue(Mutable, @"email", v25);
                  CFRelease(v26);
                }
                unsigned int v27 = CalAttendeeGetType() - 1;
                unsigned int v28 = @"unknown";
                if (v27 <= 3) {
                  unsigned int v28 = off_264DC6ED8[v27];
                }
                CFDictionarySetValue(Mutable, @"user type", v28);
                unsigned int Role = CalAttendeeGetRole();
                CFAbsoluteTime v30 = @"requiredparticipant";
                uint64_t v9 = v19;
                if (Role <= 5) {
                  CFAbsoluteTime v30 = off_264DC6EF8[Role];
                }
                CFDictionarySetValue(Mutable, @"role", v30);
                unsigned int Status = CalAttendeeGetStatus();
                CFNumberRef v32 = @"tentative";
                if (Status <= 6) {
                  CFNumberRef v32 = off_264DC6F28[Status];
                }
                CFDictionarySetValue(Mutable, @"status", v32);
                CFDictionarySetValue(*v34, v21, Mutable);
                if (DLShouldLog()) {
                  _DLLog();
                }
                CFRelease(Mutable);
                CFRelease(values);
                CFRelease(v20);
                CFRelease(v21);
                CFRelease(v15);
                goto LABEL_41;
              }
              if (DLShouldLog()) {
                _DLLog();
              }
LABEL_36:
              CFArrayRef v33 = v15;
            }
            CFRelease(v33);
            goto LABEL_41;
          }
          if (DLShouldLog()) {
LABEL_17:
          }
            _DLLog();
        }
LABEL_41:
        ++v8;
      }
      while (v7 != v8);
    }
  }
}

void _addOrganizersToDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t _entityTypeForRecord()
{
  LODWORD(result) = CalEntityGetType();
  if ((result - 1) >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

__CFString *_GetDayOfWeekStringForDayOfWeek(int a1)
{
  uint64_t result = (__CFString *)sDayOfWeekStrings_0;
  if (!sDayOfWeekStrings_0)
  {
    uint64_t result = @"sunday";
    sDayOfWeekStrings_0 = @"sunday";
    sDayOfWeekStrings_1 = @"monday";
    sDayOfWeekStrings_2 = @"tuesday";
    sDayOfWeekStrings_3 = @"wednesday";
    sDayOfWeekStrings_4 = @"thursday";
    sDayOfWeekStrings_5 = @"friday";
    sDayOfWeekStrings_6 = @"saturday";
  }
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = (__CFString *)sDayOfWeekStrings_1;
      break;
    case 2:
      uint64_t result = (__CFString *)sDayOfWeekStrings_2;
      break;
    case 3:
      uint64_t result = (__CFString *)sDayOfWeekStrings_3;
      break;
    case 4:
      uint64_t result = (__CFString *)sDayOfWeekStrings_4;
      break;
    case 5:
      uint64_t result = (__CFString *)sDayOfWeekStrings_5;
      break;
    case 6:
      uint64_t result = (__CFString *)sDayOfWeekStrings_6;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _saveDeviceSyncAnchorAndClearChangeHistory_0(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 312) & 0x80000000) == 0) {
    CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
  }
  if (!*(void *)(a1 + 144))
  {
    CFRetain(@"---");
    *(void *)(a1 + 144) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  _setDeviceSyncAnchorForStore_0(a1);
  uint64_t result = CalDatabaseSave();
  if ((result & 1) == 0)
  {
    uint64_t result = DLShouldLog();
    if (result) {
      uint64_t result = _DLLog();
    }
  }
  *(unsigned char *)(a1 + 355) = 1;
  return result;
}

void _AccumulateChangedRecords(uint64_t a1, uint64_t a2, CFMutableDictionaryRef *a3, CFArrayRef theArray, const __CFArray *a5)
{
  if (!theArray) {
    return;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (a5)
  {
    uint64_t v11 = Count;
    CFIndex v12 = CFArrayGetCount(theArray);
    if (v12 == CFArrayGetCount(a5))
    {
      if (v11 < 1) {
        return;
      }
      CFStringRef v22 = a3;
      CFArrayRef theArraya = 0;
      CFMutableDictionaryRef Mutable = 0;
      CFIndex v14 = 0;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      while (1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
        unsigned int v16 = CFArrayGetValueAtIndex(a5, v14);
        if (v16 <= 1)
        {
          switch((int)a2)
          {
            case 1:
              uint64_t v20 = CalDatabaseCopyCalendarWithUID();
              goto LABEL_24;
            case 2:
            case 3:
            case 8:
              uint64_t v20 = CalDatabaseCopyCalendarItemWithRowID();
              goto LABEL_24;
            case 4:
              uint64_t v20 = CalDatabaseCopyAlarmWithUID();
              goto LABEL_24;
            case 5:
              uint64_t v20 = CalDatabaseCopyRecurrenceWithUID();
              goto LABEL_24;
            case 7:
              uint64_t v20 = MEMORY[0x23ECC0820](*(void *)(a1 + 184), ValueAtIndex);
LABEL_24:
              CFStringRef v18 = (const void *)v20;
              if (!v20) {
                goto LABEL_30;
              }
              if (!theArraya)
              {
                CFArrayRef theArraya = CFArrayCreateMutable(allocator, 0, 0);
                CFMutableDictionaryRef Mutable = CFSetCreateMutable(0, 0, 0);
              }
              if (!CFSetContainsValue(Mutable, (const void *)(int)ValueAtIndex))
              {
                CFSetAddValue(Mutable, (const void *)(int)ValueAtIndex);
                CFArrayAppendValue(theArraya, v18);
              }
              goto LABEL_29;
            default:
              if (DLShouldLog()) {
                _DLLog();
              }
LABEL_30:
              if (DLShouldLog()) {
                goto LABEL_35;
              }
              goto LABEL_36;
          }
        }
        if (v16 == 2)
        {
          if (a2 <= 8 && ((1 << a2) & 0x1BE) != 0)
          {
            CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"%d/%d", a2, ValueAtIndex);
            if (v17)
            {
              CFStringRef v18 = v17;
              CFNumberRef v19 = *v22;
              if (!*v22)
              {
                CFNumberRef v19 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                CFMutableDictionaryRef *v22 = v19;
              }
              CFDictionarySetValue(v19, v18, v18);
LABEL_29:
              CFRelease(v18);
              goto LABEL_36;
            }
          }
          else if (DLShouldLog())
          {
            _DLLog();
          }
          if (DLShouldLog()) {
LABEL_35:
          }
            _DLLog();
        }
        else if (DLShouldLog())
        {
          goto LABEL_35;
        }
LABEL_36:
        if (v11 == ++v14)
        {
          if (Mutable) {
            CFRelease(Mutable);
          }
          if (theArraya)
          {
            switch((int)a2)
            {
              case 1:
                _AccumulateCalendars(a1, v22, theArraya);
                break;
              case 2:
                _AccumulateEvents(a1, v22, theArraya);
                break;
              case 4:
                _AccumulateAlarms(v22, theArraya);
                break;
              case 5:
                _AccumulateRecurrences(v22, theArraya);
                break;
              case 7:
                _AccumulateAttendees(a1, v22, theArraya);
                break;
              case 8:
                _AccumulateOrganizers(a1, v22, theArraya);
                break;
              default:
                if (DLShouldLog()) {
                  _DLLog();
                }
                break;
            }
            CFRelease(theArraya);
          }
          return;
        }
      }
    }
  }
  if (DLShouldLog())
  {
    _DLLog();
  }
}

objc_class *___calendarSyncAccountLoader_block_invoke()
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", @"/System/Library/PrivateFrameworks/Message.framework")), "load") & 1) == 0)___calendarSyncAccountLoader_block_invoke_cold_1(); {
  uint64_t result = NSClassFromString(&cfstr_Mailaccount.isa);
  }
  _calendarSyncAccountLoader_sSyncAccountLoader = (uint64_t)result;
  return result;
}

void _addCurrentRemappingsToAllRemappings(void *key, void *value, uint64_t a3)
{
  CFIndex v5 = *(__CFDictionary **)(a3 + 168);
  if (!v5)
  {
    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFIndex v5 = (__CFDictionary *)DLMemoryPoolAddObject();
    *(void *)(a3 + 168) = v5;
  }
  CFDictionarySetValue(v5, key, value);
}

void _ChangesApplierFunction_0(const __CFString *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, @"com.apple.syncservices.RecordEntityName");
    if (!Value)
    {
      if (!DLShouldLog()) {
        return;
      }
      goto LABEL_76;
    }
    CFStringRef v13 = Value;
    unsigned int v215 = 0;
    uint64_t v214 = 0;
    SInt32 v213 = 0;
    char v14 = _deconstructRecordIdentifier(a1, &v213, (SInt32 *)&v214, (SInt32 *)&v214 + 1, (SInt32 *)&v215);
    if (CFStringCompare(v13, @"com.apple.calendars.Calendar", 0))
    {
      if (CFStringCompare(v13, @"com.apple.calendars.Event", 0))
      {
        if (CFStringCompare(v13, @"com.apple.calendars.Task", 0))
        {
          if (CFStringCompare(v13, @"com.apple.calendars.AudioAlarm", 0)
            && CFStringCompare(v13, @"com.apple.calendars.DisplayAlarm", 0))
          {
            if (CFStringCompare(v13, @"com.apple.calendars.Recurrence", 0))
            {
              if (CFStringCompare(v13, @"com.apple.calendars.Organizer", 0))
              {
                if (CFStringCompare(v13, @"com.apple.calendars.Attendee", 0))
                {
                  if (CFEqual(v13, @"com.apple.calendars.CalendarOrder"))
                  {
                    CFArrayRef v105 = (const __CFArray *)CFDictionaryGetValue(a2, @"calendars");
                    if (v105)
                    {
                      CFArrayRef v106 = v105;
                      if (CFArrayGetCount(v105) >= 1)
                      {
                        CFIndex v107 = 0;
                        do
                        {
                          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v106, v107);
                          uint64_t v109 = _CopyCalendarForUIDString(a3, ValueAtIndex);
                          if (v109)
                          {
                            v110 = (const void *)v109;
                            CalCalendarSetDisplayOrder();
                            CFRelease(v110);
                          }
                          ++v107;
                        }
                        while (CFArrayGetCount(v106) > v107);
                      }
                    }
                    return;
                  }
                  if (!DLShouldLog()) {
                    return;
                  }
LABEL_76:
                  _DLLog();
                  return;
                }
                if (v214 == 7) {
                  char v88 = 0;
                }
                else {
                  char v88 = v14;
                }
                if ((v88 & 1) == 0)
                {
                  uint64_t v89 = v215;
                  *(_DWORD *)&valuePtr[4] = 0;
                  v90 = CFDictionaryGetValue(a2, @"email");
                  CFStringRef v91 = (const __CFString *)CFDictionaryGetValue(a2, @"role");
                  CFStringRef v92 = (const __CFString *)CFDictionaryGetValue(a2, @"status");
                  CFStringRef v93 = (const __CFString *)CFDictionaryGetValue(a2, @"user type");
                  v94 = CFDictionaryGetValue(a2, @"common name");
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                  if (v89 != -1)
                  {
                    AlarCFIndex m = (const void *)MEMORY[0x23ECC0820](*(void *)(a3 + 184), v89);
                    if (Alarm) {
                      goto LABEL_237;
                    }
                    if (DLShouldLog()) {
                      _DLLog();
                    }
                  }
                  AlarCFIndex m = 0;
LABEL_237:
                  uint64_t v95 = _CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
                  if (v95)
                  {
                    v96 = (const void *)v95;
                    if (Alarm)
                    {
                      if (DLShouldLog()) {
                        _DLLog();
                      }
                    }
                    else
                    {
                      uint64_t Attendee = CalDatabaseCreateAttendee();
                      if (!Attendee)
                      {
                        if (DLShouldLog()) {
                          _DLLog();
                        }
                        AlarCFIndex m = v96;
                        goto LABEL_225;
                      }
                      AlarCFIndex m = (const void *)Attendee;
                      if (DLShouldLog()) {
                        _DLLog();
                      }
                      int v149 = *(_DWORD *)&valuePtr[4];
                      int v150 = DLShouldLog();
                      if (v149 == 2)
                      {
                        if (v150) {
                          _DLLog();
                        }
                        MEMORY[0x23ECC0AC0](v96, Alarm);
                      }
                      else if (v150)
                      {
                        _DLLog();
                      }
                      v203 = *(__CFDictionary **)(a3 + 256);
                      if (!v203)
                      {
                        CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                        v203 = (__CFDictionary *)DLMemoryPoolAddObject();
                        *(void *)(a3 + 256) = v203;
                      }
                      CFDictionaryAddValue(v203, a1, Alarm);
                    }
                    MEMORY[0x23ECC05E0](Alarm, v90);
                    if (v91
                      && CFStringCompare(v91, @"requiredparticipant", 0)
                      && CFStringCompare(v91, @"optionalparticipant", 0)
                      && CFStringCompare(v91, @"chair", 0))
                    {
                      CFStringCompare(v91, @"nonparticipant", 0);
                    }
                    CalAttendeeSetRole();
                    if (v92
                      && CFStringCompare(v92, @"needsaction", 0)
                      && CFStringCompare(v92, @"accepted", 0)
                      && CFStringCompare(v92, @"declined", 0)
                      && CFStringCompare(v92, @"tentative", 0)
                      && CFStringCompare(v92, @"delegated", 0)
                      && CFStringCompare(v92, @"completed", 0))
                    {
                      CFStringCompare(v92, @"inprocess", 0);
                    }
                    CalAttendeeSetStatus();
                    if (v93
                      && CFStringCompare(v93, @"individual", 0)
                      && CFStringCompare(v93, @"room", 0)
                      && CFStringCompare(v93, @"resource", 0)
                      && CFStringCompare(v93, @"group", 0))
                    {
                      CFStringCompare(v93, @"unknown", 0);
                    }
                    CalAttendeeSetType();
                    MEMORY[0x23ECC05D0](Alarm, v94);
                    CFRelease(v96);
LABEL_225:
                    uint64_t v11 = Alarm;
                    goto LABEL_483;
                  }
                  if (!DLShouldLog())
                  {
LABEL_179:
                    if (!Alarm) {
                      return;
                    }
                    goto LABEL_225;
                  }
LABEL_178:
                  _DLLog();
                  goto LABEL_179;
                }
              }
              else
              {
                if (v214 == 8) {
                  char v75 = 0;
                }
                else {
                  char v75 = v14;
                }
                if ((v75 & 1) == 0)
                {
                  *(_DWORD *)&valuePtr[4] = 0;
                  CFDictionaryRef v76 = CFDictionaryGetValue(a2, @"common name");
                  uint64_t v77 = CFDictionaryGetValue(a2, @"email");
                  BOOL v78 = (const void *)_CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                  if (!v78)
                  {
                    if (!DLShouldLog()) {
                      return;
                    }
                    goto LABEL_76;
                  }
                  v217[0] = -1;
                  if (_deconstructRecordIdentifier(a1, 0, 0, 0, v217))
                  {
                    SInt32 v79 = v217[0];
                    if (v79 != CalCalendarItemGetRowID())
                    {
                      if (DLShouldLog()) {
                        _DLLog();
                      }
                      uint64_t v80 = CalDatabaseCopyCalendarItemWithRowID();
                      if (v80)
                      {
                        int v81 = (const void *)v80;
                        CalCalendarItemSetOrganizer();
                        CFRelease(v81);
                      }
                    }
                  }
                  if (*(_DWORD *)&valuePtr[4] == 2)
                  {
                    uint64_t Organizer = MEMORY[0x23ECC0B30](v78);
                    if (!Organizer)
                    {
                      if (DLShouldLog())
                      {
                        CalCalendarItemGetRowID();
                        _DLLog();
                      }
                      uint64_t Organizer = CalDatabaseCreateOrganizer();
                      CalCalendarItemSetOrganizer();
                    }
                  }
                  else
                  {
                    if (DLShouldLog()) {
                      _DLLog();
                    }
                    uint64_t Organizer = CalDatabaseCreateOrganizer();
                  }
                  CFSetRef v143 = *(const __CFSet **)(a3 + 344);
                  if (v143 && CFSetContainsValue(v143, v77)) {
                    CalOrganizerSetIsSelf();
                  }
                  MEMORY[0x23ECC0CC0](Organizer, v77);
                  MEMORY[0x23ECC0CB0](Organizer, v76);
                  v144 = *(__CFDictionary **)(a3 + 248);
                  if (!v144)
                  {
                    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    v144 = (__CFDictionary *)DLMemoryPoolAddObject();
                    *(void *)(a3 + 248) = v144;
                  }
                  CFDictionaryAddValue(v144, a1, v78);
                  CFRelease(v78);
                  if (!Organizer) {
                    return;
                  }
LABEL_15:
                  uint64_t v11 = (const void *)Organizer;
LABEL_483:
                  CFRelease(v11);
                  return;
                }
              }
LABEL_75:
              if (!DLShouldLog()) {
                return;
              }
              goto LABEL_76;
            }
            if (v214 == 5) {
              char v68 = 0;
            }
            else {
              char v68 = v14;
            }
            if (v68) {
              goto LABEL_75;
            }
            unsigned int v69 = v215;
            CFArrayRef v70 = (const __CFArray *)CFDictionaryGetValue(a2, @"owner");
            if (v70 && (CFArrayRef v71 = v70, CFArrayGetCount(v70) >= 1))
            {
              *(_DWORD *)&valuePtr[4] = 0;
              v217[0] = 0;
              CFStringRef v72 = (const __CFString *)CFArrayGetValueAtIndex(v71, 0);
              CFDictionaryRef v73 = *(const __CFDictionary **)(a3 + 168);
              if (v73)
              {
                CFStringRef v74 = (const __CFString *)CFDictionaryGetValue(v73, v72);
                if (v74) {
                  CFStringRef v72 = v74;
                }
              }
              CalendarForEntityint Type = 0;
              if (!_deconstructRecordIdentifier(v72, 0, v217, 0, (SInt32 *)&valuePtr[4])
                || *(_DWORD *)&valuePtr[4] == -1)
              {
LABEL_248:
                if (DLShouldLog()) {
                  _DLLog();
                }
                if (v69 != -1)
                {
                  v97 = (const void *)CalDatabaseCopyRecurrenceWithUID();
                  if (v97) {
                    goto LABEL_255;
                  }
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                }
                v97 = 0;
LABEL_255:
                if (!CalendarForEntityType)
                {
                  if (DLShouldLog()) {
                    _DLLog();
                  }
                  CalendarForEntityint Type = v97;
                  if (!v97) {
                    return;
                  }
                  goto LABEL_482;
                }
                v98 = (const void *)MEMORY[0x23ECC0B60](CalendarForEntityType);
                int v99 = DLShouldLog();
                if (v97)
                {
                  if (v99) {
                    _DLLog();
                  }
                  MEMORY[0x23ECC0BD0](CalendarForEntityType, v97);
                }
                else if (v99)
                {
                  _DLLog();
                }
                if (v98) {
                  CFRelease(v98);
                }
                if (v97) {
                  CFRelease(v97);
                }
                Recurrence = (const void *)CalDatabaseCreateRecurrence();
                if (DLShouldLog()) {
                  _DLLog();
                }
                v139 = *(__CFDictionary **)(a3 + 240);
                if (!v139)
                {
                  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  v139 = (__CFDictionary *)DLMemoryPoolAddObject();
                  *(void *)(a3 + 240) = v139;
                }
                CFDictionaryAddValue(v139, a1, Recurrence);
                CFStringRef v140 = (const __CFString *)CFDictionaryGetValue(a2, @"weekstartday");
                _GetDayOfWeekFromString(v140);
                CalRecurrenceSetWeekStart();
                CFStringRef v141 = (const __CFString *)CFDictionaryGetValue(a2, @"frequency");
                if (!v141) {
                  goto LABEL_410;
                }
                int CharacterAtIndex = CFStringGetCharacterAtIndex(v141, 0);
                if (CharacterAtIndex > 118)
                {
                  if (CharacterAtIndex == 121 || CharacterAtIndex == 119) {
                    goto LABEL_409;
                  }
                }
                else if (CharacterAtIndex == 100 || CharacterAtIndex == 109)
                {
LABEL_409:
                  CalRecurrenceSetFrequency();
LABEL_410:
                  CFNumberRef v151 = (const __CFNumber *)CFDictionaryGetValue(a2, @"interval");
                  if (v151)
                  {
                    *(_DWORD *)&valuePtr[4] = 0;
                    if (CFNumberGetValue(v151, kCFNumberIntType, &valuePtr[4]))
                    {
                      if (*(_DWORD *)&valuePtr[4]) {
                        CalRecurrenceSetInterval();
                      }
                    }
                  }
                  CFNumberRef v152 = (const __CFNumber *)CFDictionaryGetValue(a2, @"count");
                  if (v152
                    && (*(_DWORD *)&valuePtr[4] = 0, CFNumberGetValue(v152, kCFNumberIntType, &valuePtr[4]))
                    && *(_DWORD *)&valuePtr[4])
                  {
                    CalRecurrenceSetCount();
                  }
                  else
                  {
                    v153 = CFDictionaryGetValue(a2, @"until");
                    if (v153)
                    {
                      v154 = v153;
                      CFTypeID v155 = CFGetTypeID(v153);
                      if (v155 == CFDateGetTypeID())
                      {
                        MEMORY[0x23ECC0160](v154);
                        if (DLShouldLog()) {
                          _DLLog();
                        }
                      }
                    }
                    CalRecurrenceSetEndDate();
                  }
                  CFArrayRef v156 = (const __CFArray *)CFDictionaryGetValue(a2, @"bymonth");
                  if (v156)
                  {
                    CFArrayRef v157 = v156;
                    CFIndex Count = CFArrayGetCount(v156);
                    if (Count >= 1)
                    {
                      CFIndex v159 = Count;
                      CFIndex v160 = 0;
                      int v161 = 0;
                      do
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        CFNumberRef v162 = (const __CFNumber *)CFArrayGetValueAtIndex(v157, v160);
                        BOOL v163 = CFNumberGetValue(v162, kCFNumberIntType, &valuePtr[4]) != 0;
                        if (v163 && *(_DWORD *)&valuePtr[4] != 0) {
                          int v164 = 1 << (valuePtr[4] - 1);
                        }
                        else {
                          int v164 = 0;
                        }
                        v161 |= v164;
                        ++v160;
                      }
                      while (v159 != v160);
                      if (v161) {
                        CalRecurrenceSetByMonthMonths();
                      }
                    }
                  }
                  CFArrayRef v165 = (const __CFArray *)CFDictionaryGetValue(a2, @"byweeknumber");
                  if (v165)
                  {
                    CFArrayRef v166 = v165;
                    uint64_t v167 = CFArrayGetCount(v165);
                    if (v167 >= 1)
                    {
                      uint64_t v168 = v167;
                      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, v167, 0);
                      for (CFIndex i = 0; i != v168; ++i)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        CFNumberRef v171 = (const __CFNumber *)CFArrayGetValueAtIndex(v166, i);
                        if (CFNumberGetValue(v171, kCFNumberIntType, &valuePtr[4])) {
                          CFArrayAppendValue(Mutable, (const void *)*(int *)&valuePtr[4]);
                        }
                      }
                      if (CFArrayGetCount(Mutable)) {
                        CalRecurrenceSetByWeekWeeks();
                      }
                      CFRelease(Mutable);
                    }
                  }
                  CFArrayRef v172 = (const __CFArray *)CFDictionaryGetValue(a2, @"byyearday");
                  if (v172)
                  {
                    CFArrayRef v173 = v172;
                    uint64_t v174 = CFArrayGetCount(v172);
                    if (v174 >= 1)
                    {
                      uint64_t v175 = v174;
                      v176 = CFArrayCreateMutable(0, v174, 0);
                      for (CFIndex j = 0; j != v175; ++j)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        CFNumberRef v178 = (const __CFNumber *)CFArrayGetValueAtIndex(v173, j);
                        if (CFNumberGetValue(v178, kCFNumberIntType, &valuePtr[4])) {
                          CFArrayAppendValue(v176, (const void *)*(int *)&valuePtr[4]);
                        }
                      }
                      if (CFArrayGetCount(v176)) {
                        CalRecurrenceSetByYearDayDays();
                      }
                      CFRelease(v176);
                    }
                  }
                  CFArrayRef v179 = (const __CFArray *)CFDictionaryGetValue(a2, @"bymonthday");
                  if (v179)
                  {
                    CFArrayRef v180 = v179;
                    uint64_t v181 = CFArrayGetCount(v179);
                    if (v181 >= 1)
                    {
                      uint64_t v182 = v181;
                      v183 = CFArrayCreateMutable(0, v181, 0);
                      for (CFIndex k = 0; k != v182; ++k)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        CFNumberRef v185 = (const __CFNumber *)CFArrayGetValueAtIndex(v180, k);
                        if (CFNumberGetValue(v185, kCFNumberIntType, &valuePtr[4])) {
                          CFArrayAppendValue(v183, (const void *)*(int *)&valuePtr[4]);
                        }
                      }
                      if (CFArrayGetCount(v183)) {
                        CalRecurrenceSetByMonthDayDays();
                      }
                      CFRelease(v183);
                    }
                  }
                  CFArrayRef v186 = (const __CFArray *)CFDictionaryGetValue(a2, @"bysetpos");
                  if (v186)
                  {
                    CFArrayRef v187 = v186;
                    uint64_t v188 = CFArrayGetCount(v186);
                    if (v188 >= 1)
                    {
                      uint64_t v189 = v188;
                      v190 = CFArrayCreateMutable(0, v188, 0);
                      for (CFIndex m = 0; m != v189; ++m)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        CFNumberRef v192 = (const __CFNumber *)CFArrayGetValueAtIndex(v187, m);
                        if (CFNumberGetValue(v192, kCFNumberIntType, &valuePtr[4])) {
                          CFArrayAppendValue(v190, (const void *)*(int *)&valuePtr[4]);
                        }
                      }
                      if (CFArrayGetCount(v190)) {
                        CalRecurrenceSetBySetPos();
                      }
                      CFRelease(v190);
                    }
                  }
                  CFArrayRef v193 = (const __CFArray *)CFDictionaryGetValue(a2, @"bydayfreq");
                  CFArrayRef v194 = (const __CFArray *)CFDictionaryGetValue(a2, @"bydaydays");
                  if (v193)
                  {
                    CFArrayRef v195 = v194;
                    if (v194)
                    {
                      CFIndex v196 = CFArrayGetCount(v193);
                      if (v196 >= 1)
                      {
                        CFIndex v197 = v196;
                        if (CFArrayGetCount(v195) == v196)
                        {
                          *(void *)&valuePtr[4] = 0;
                          v198 = CFArrayCreateMutable(0, v197, MEMORY[0x263F300F8]);
                          for (CFIndex n = 0; n != v197; ++n)
                          {
                            v217[0] = 0;
                            CFNumberRef v200 = (const __CFNumber *)CFArrayGetValueAtIndex(v193, n);
                            CFStringRef v201 = (const __CFString *)CFArrayGetValueAtIndex(v195, n);
                            LODWORD(v200) = CFNumberGetValue(v200, kCFNumberIntType, v217);
                            int DayOfWeekFromString = _GetDayOfWeekFromString(v201);
                            if (v200 && DayOfWeekFromString != 7)
                            {
                              *(_DWORD *)&valuePtr[4] = v217[0];
                              *(_DWORD *)&valuePtr[8] = DayOfWeekFromString;
                              CFArrayAppendValue(v198, &valuePtr[4]);
                            }
                          }
                          if (CFArrayGetCount(v198)) {
                            CalRecurrenceSetByDayDays();
                          }
                          CFRelease(v198);
                        }
                      }
                    }
                  }
                  MEMORY[0x23ECC0AE0](CalendarForEntityType, Recurrence);
                  v104 = Recurrence;
LABEL_481:
                  CFRelease(v104);
LABEL_482:
                  uint64_t v11 = CalendarForEntityType;
                  goto LABEL_483;
                }
                if (DLShouldLog()) {
                  _DLLog();
                }
                goto LABEL_410;
              }
              if (v217[0] == 2)
              {
                CalendarForEntityint Type = (const void *)CalDatabaseCopyCalendarItemWithRowID();
                goto LABEL_248;
              }
              if (DLShouldLog()) {
                goto LABEL_246;
              }
            }
            else if (DLShouldLog())
            {
LABEL_246:
              _DLLog();
            }
            CalendarForEntityint Type = 0;
            goto LABEL_248;
          }
          if (v214 == 4) {
            char v33 = 0;
          }
          else {
            char v33 = v14;
          }
          if (v33) {
            goto LABEL_75;
          }
          unsigned int v34 = v215;
          if (DLShouldLog()) {
            _DLLog();
          }
          if (v34 != -1)
          {
            AlarCFIndex m = (const void *)CalDatabaseCopyAlarmWithUID();
            if (Alarm) {
              goto LABEL_67;
            }
            if (DLShouldLog()) {
              _DLLog();
            }
          }
          AlarCFIndex m = 0;
LABEL_67:
          *(_DWORD *)&valuePtr[4] = 0;
          uint64_t v36 = _CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
          if (!v36)
          {
            if (!DLShouldLog()) {
              goto LABEL_179;
            }
            goto LABEL_178;
          }
          uint64_t v37 = (const void *)v36;
          if (Alarm)
          {
            if (DLShouldLog()) {
              _DLLog();
            }
          }
          else
          {
            AlarCFIndex m = (const void *)CalDatabaseCreateAlarm();
            if (DLShouldLog()) {
              _DLLog();
            }
            if (DLShouldLog()) {
              _DLLog();
            }
            CalCalendarItemAddAlarm();
            uint64_t v82 = *(__CFDictionary **)(a3 + 232);
            if (!v82)
            {
              CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              uint64_t v82 = (__CFDictionary *)DLMemoryPoolAddObject();
              *(void *)(a3 + 232) = v82;
            }
            CFDictionaryAddValue(v82, a1, Alarm);
          }
          CFStringCompare(v13, @"com.apple.calendars.AudioAlarm", 0);
          CalAlarmSetType();
          CFNumberRef v83 = (const __CFNumber *)CFDictionaryGetValue(a2, @"triggerduration");
          if (v83 && (v217[0] = 0, CFNumberGetValue(v83, kCFNumberIntType, v217)))
          {
            SInt32 v84 = v217[0];
            CalAlarmSetTriggerInterval();
            if (v84 != 0x7FFFFFFF)
            {
LABEL_224:
              CFRelease(Alarm);
              AlarCFIndex m = v37;
              goto LABEL_225;
            }
          }
          else
          {
            CalAlarmSetTriggerInterval();
          }
          v85 = CFDictionaryGetValue(a2, @"triggerdate");
          if (v85)
          {
            CFStringRef v86 = v85;
            CFTypeID v87 = CFGetTypeID(v85);
            if (v87 == CFDateGetTypeID())
            {
              MEMORY[0x23ECC0160](v86);
              if (DLShouldLog()) {
                _DLLog();
              }
            }
          }
          CalAlarmSetTriggerDate();
          goto LABEL_224;
        }
        if (v214 == 3) {
          char v38 = 0;
        }
        else {
          char v38 = v14;
        }
        if (v38) {
          goto LABEL_75;
        }
        unsigned int v50 = v215;
        uint64_t v51 = _CopyParentCalendar(a3, a2);
        if (!v51)
        {
          if (!DLShouldLog()) {
            return;
          }
          goto LABEL_76;
        }
        CalendarForEntityint Type = (const void *)v51;
        CFStringRef v52 = CFDictionaryGetValue(a2, @"summary");
        CFNumberRef v53 = CFDictionaryGetValue(a2, @"priority");
        CFArrayRef v54 = CFDictionaryGetValue(a2, @"due date");
        CFArrayRef v55 = CFDictionaryGetValue(a2, @"completion date");
        if (DLShouldLog()) {
          _DLLog();
        }
        if (v50 != -1)
        {
          TasCFIndex k = (const void *)CalDatabaseCopyCalendarItemWithRowID();
          int v57 = DLShouldLog();
          if (Task)
          {
            if (v57) {
              _DLLog();
            }
LABEL_267:
            MEMORY[0x23ECC0630](CalendarForEntityType, Task);
            if (v52)
            {
              CFTypeID v100 = CFGetTypeID(v52);
              if (v100 == CFStringGetTypeID()) {
                CalCalendarItemSetSummary();
              }
            }
            if (v53)
            {
              CFTypeID v101 = CFGetTypeID(v53);
              if (v101 == CFNumberGetTypeID())
              {
                *(_DWORD *)&valuePtr[4] = 0;
                if (CFNumberGetValue((CFNumberRef)v53, kCFNumberIntType, &valuePtr[4])) {
                  CalCalendarItemSetPriority();
                }
              }
            }
            if (v54)
            {
              CFTypeID v102 = CFGetTypeID(v54);
              if (v102 == CFDateGetTypeID())
              {
                if (DLShouldLog()) {
                  _DLLog();
                }
              }
            }
            CalTaskSetDueDate();
            if (v55)
            {
              CFTypeID v103 = CFGetTypeID(v55);
              if (v103 == CFDateGetTypeID())
              {
                if (DLShouldLog()) {
                  _DLLog();
                }
              }
            }
            CalTaskSetCompletionDate();
            v104 = Task;
            goto LABEL_481;
          }
          if (v57) {
            _DLLog();
          }
        }
        TasCFIndex k = (const void *)CalDatabaseCreateTask();
        if (!*(void *)(a3 + 224))
        {
          CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          *(void *)(a3 + 224) = DLMemoryPoolAddObject();
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 224), a1, Task);
        goto LABEL_267;
      }
      if (v214 == 2) {
        char v22 = 0;
      }
      else {
        char v22 = v14;
      }
      if (v22) {
        goto LABEL_75;
      }
      unsigned int v23 = v215;
      uint64_t v24 = _CopyParentCalendar(a3, a2);
      if (!v24)
      {
        if (!DLShouldLog()) {
          return;
        }
        goto LABEL_76;
      }
      CalendarForEntityint Type = (const void *)v24;
      CFNumberRef v25 = CFDictionaryGetValue(a2, @"summary");
      CFAbsoluteTime v26 = CFDictionaryGetValue(a2, @"description");
      unsigned int v27 = CFDictionaryGetValue(a2, @"location");
      CFNumberRef v211 = (const __CFNumber *)CFDictionaryGetValue(a2, @"all day");
      CFDateRef v28 = (const __CFDate *)CFDictionaryGetValue(a2, @"start date");
      CFNumberRef number = (const __CFNumber *)CFDictionaryGetValue(a2, @"floatingOffset");
      CFDateRef v29 = (const __CFDate *)CFDictionaryGetValue(a2, @"end date");
      v209 = CFDictionaryGetValue(a2, @"original date");
      v210 = CFDictionaryGetValue(a2, @"exception dates");
      CFArrayRef v208 = (const __CFArray *)CFDictionaryGetValue(a2, @"main event");
      CFStringRef v30 = (const __CFString *)CFDictionaryGetValue(a2, @"url");
      CFDateRef v212 = v28;
      if (!v28 || !v29)
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        goto LABEL_482;
      }
      CFStringRef URLString = v30;
      v206 = CalendarForEntityType;
      if (v23 != -1)
      {
        Event = (const void *)CalDatabaseCopyCalendarItemWithRowID();
        int v32 = DLShouldLog();
        if (Event)
        {
          if (v32) {
            _DLLog();
          }
          char v204 = 0;
          goto LABEL_297;
        }
        if (v32) {
          _DLLog();
        }
      }
      Event = (const void *)CalDatabaseCreateEvent();
      if (!*(void *)(a3 + 216))
      {
        CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        *(void *)(a3 + 216) = DLMemoryPoolAddObject();
      }
      if (DLShouldLog()) {
        _DLLog();
      }
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 216), a1, Event);
      char v204 = 1;
LABEL_297:
      MEMORY[0x23ECC0620](CalendarForEntityType, Event);
      if (v25)
      {
        CFTypeID v111 = CFGetTypeID(v25);
        if (v111 == CFStringGetTypeID()) {
          CalCalendarItemSetSummary();
        }
      }
      if (v26)
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        CFTypeID v112 = CFGetTypeID(v26);
        if (v112 == CFStringGetTypeID()) {
          v113 = v26;
        }
        else {
          v113 = 0;
        }
      }
      else
      {
        v113 = 0;
      }
      MEMORY[0x23ECC0BF0](Event, v113);
      if (v27)
      {
        CFGetTypeID(v27);
        CFStringGetTypeID();
      }
      CFDateRef v114 = v29;
      CalEventSetLocation_Deprecated();
      CFDateRef v115 = v28;
      if (v211 && (CFTypeID v116 = CFGetTypeID(v211), v116 == CFNumberGetTypeID()))
      {
        *(_DWORD *)&valuePtr[4] = 0;
        if (CFNumberGetValue(v211, kCFNumberIntType, &valuePtr[4])) {
          BOOL v117 = *(_DWORD *)&valuePtr[4] == 0;
        }
        else {
          BOOL v117 = 1;
        }
        char v118 = !v117;
        CalEventSetAllDay();
        if (v118)
        {
          CFStringRef v119 = @"_float";
          CalendarForEntityint Type = v206;
          CFArrayRef v121 = v208;
          v120 = v209;
          goto LABEL_330;
        }
      }
      else
      {
        CalEventSetAllDay();
      }
      CFStringRef v122 = (const __CFString *)CFDictionaryGetValue(a2, @"start date.timezone");
      CalendarForEntityint Type = v206;
      CFArrayRef v121 = v208;
      v120 = v209;
      if (!v122) {
        goto LABEL_527;
      }
      CFStringRef v119 = v122;
      if (CFStringCompare(v122, @"LOCAL", 1uLL) == kCFCompareEqualTo)
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        uint64_t v123 = CalCopyDefaultTimeZone();
        if (v123)
        {
          v127 = (const void *)v123;
          CFStringRef v119 = (const __CFString *)MEMORY[0x23ECC0460](v123, v124, v125, v126);
          CFRelease(v127);
          if (!v119)
          {
LABEL_527:
            if (number)
            {
              *(void *)&valuePtr[4] = 0;
              CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr[4]);
              double v128 = MEMORY[0x23ECC0160](v212);
              CFDateRef v115 = CFDateCreate(0, v128 + (double)*(uint64_t *)&valuePtr[4]);
              double v129 = MEMORY[0x23ECC0160](v114);
              CFDateRef v114 = CFDateCreate(0, v129 + (double)*(uint64_t *)&valuePtr[4]);
              if (DLShouldLog()) {
                _DLLog();
              }
            }
            CFStringRef v119 = @"_float";
          }
        }
      }
LABEL_330:
      MEMORY[0x23ECC0160](v115);
      CalEventSetStartDateDirectly();
      MEMORY[0x23ECC0160](v114);
      CalEventSetEndDate();
      CFTimeZoneRef v130 = CFTimeZoneCreateWithName(0, v119, 1u);
      CalCalendarItemSetEndTimeZone();
      if (v130) {
        CFRelease(v130);
      }
      if (v120 && (MEMORY[0x23ECC0160](v120), CalEventSetOriginalStartDate(), v121) && CFArrayGetCount(v121) == 1)
      {
        CFStringRef v131 = (const __CFString *)CFArrayGetValueAtIndex(v121, 0);
        *(_DWORD *)&valuePtr[4] = -1;
        v217[0] = 0;
        if (DLShouldLog()) {
          _DLLog();
        }
        if (!_deconstructRecordIdentifier(v131, 0, v217, 0, (SInt32 *)&valuePtr[4])) {
          goto LABEL_348;
        }
        if (v217[0] != 2)
        {
          v134 = v210;
          if (DLShouldLog()) {
            _DLLog();
          }
          CalEventSetOriginalEvent();
          if (v210) {
            goto LABEL_343;
          }
          goto LABEL_392;
        }
        uint64_t v132 = CalDatabaseCopyCalendarItemWithRowID();
        if (v132)
        {
          v133 = (const void *)v132;
          MEMORY[0x23ECC0AD0](v132, v120);
          CalEventSetOriginalEvent();
          CFRelease(v133);
        }
        else
        {
LABEL_348:
          CFDictionaryRef v135 = *(const __CFDictionary **)(a3 + 264);
          if (!v135)
          {
            CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionaryRef v135 = (const __CFDictionary *)DLMemoryPoolAddObject();
            *(void *)(a3 + 264) = v135;
          }
          if (!CFDictionaryContainsKey(v135, v131)) {
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 264), v131, v131);
          }
          CFDictionaryRef v136 = *(const __CFDictionary **)(a3 + 272);
          if (!v136)
          {
            CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionaryRef v136 = (const __CFDictionary *)DLMemoryPoolAddObject();
            *(void *)(a3 + 272) = v136;
          }
          v137 = (void *)CFDictionaryGetValue(v136, v131);
          if (!v137)
          {
            v137 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 272), v131, v137);
            CFRelease(v137);
          }
          CFArrayAppendValue((CFMutableArrayRef)v137, Event);
        }
      }
      else
      {
        CalEventSetOriginalEvent();
      }
      v134 = v210;
      if (v210)
      {
LABEL_343:
        MEMORY[0x23ECC0C20](Event, v134);
LABEL_395:
        if (URLString)
        {
          CFURLRef v147 = CFURLCreateWithString(0, URLString, 0);
          MEMORY[0x23ECC0C80](Event, v147);
          if (v147) {
            CFRelease(v147);
          }
        }
        else
        {
          MEMORY[0x23ECC0C80](Event);
        }
        v104 = Event;
        goto LABEL_481;
      }
LABEL_392:
      if ((v204 & 1) == 0)
      {
        uint64_t v145 = MEMORY[0x23ECC0B20](Event);
        if (v145)
        {
          v146 = (const void *)v145;
          MEMORY[0x23ECC0C20](Event, 0);
          CFRelease(v146);
        }
      }
      goto LABEL_395;
    }
    if (v214 == 1) {
      char v15 = 0;
    }
    else {
      char v15 = v14;
    }
    if (v15) {
      goto LABEL_75;
    }
    unsigned int v16 = v215;
    CFStringRef v17 = CFDictionaryGetValue(a2, @"title");
    if (v16 != -1)
    {
      CalendarForEntityint Type = (const void *)CalDatabaseCopyCalendarWithUID();
      int v19 = DLShouldLog();
      if (CalendarForEntityType)
      {
        if (v19) {
          _DLLog();
        }
        uint64_t v20 = (const void *)CalCalendarCopyTitle();
        CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", v17);
        CalDatabaseSetProperty();
        if (v21) {
          CFRelease(v21);
        }
        if (v20) {
          CFRelease(v20);
        }
LABEL_117:
        CFNumberRef v58 = (const __CFNumber *)CFDictionaryGetValue(a2, @"read only");
        if (v58)
        {
          *(_DWORD *)&valuePtr[4] = 0;
          if (CFNumberGetValue(v58, kCFNumberIntType, &valuePtr[4])) {
            BOOL v59 = *(_DWORD *)&valuePtr[4] == 0;
          }
          else {
            BOOL v59 = 1;
          }
          unsigned int v60 = !v59;
          if (!v59 && DLShouldLog()) {
            _DLLog();
          }
        }
        else
        {
          unsigned int v60 = 0;
        }
        CalCalendarSetReadOnly();
        CalCalendarSetTitle();
        if (CFDictionaryGetValue(a2, @"com.apple.ical.type")) {
          CalCalendarSetType();
        }
        if (*(unsigned char *)(a3 + 353) == 1)
        {
          CFArrayRef v61 = (const __CFArray *)CFDictionaryGetValue(a2, @"colorComponents");
          if (v61)
          {
            CFArrayRef v62 = v61;
            if (CFArrayGetCount(v61) >= 3)
            {
              *(void *)int valuePtr = 0;
              v217[0] = 0;
              CFNumberRef v63 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 0);
              CFNumberGetValue(v63, kCFNumberIntType, &valuePtr[4]);
              CFNumberRef v64 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 1);
              CFNumberGetValue(v64, kCFNumberIntType, v217);
              CFNumberRef v65 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 2);
              CFNumberGetValue(v65, kCFNumberIntType, valuePtr);
              if (DLShouldLog()) {
                _DLLog();
              }
              CalCalendarSetColorComponents();
            }
          }
        }
        if (CFDictionaryGetValue(a2, @"com.apple.MobileSync.calDAVInfo"))
        {
          CFStringRef v66 = CFStringCreateWithFormat(0, 0, @"%d", v60);
          CFStringRef v67 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", v17);
          if (DLShouldLog()) {
            _DLLog();
          }
          CalDatabaseSetProperty();
          if (v66) {
            CFRelease(v66);
          }
          if (v67) {
            CFRelease(v67);
          }
          CalCalendarSetReadOnly();
        }
        goto LABEL_482;
      }
      if (v19) {
        _DLLog();
      }
    }
    if (!v17)
    {
      if (!DLShouldLog()) {
        return;
      }
      goto LABEL_76;
    }
    CalendarForEntityint Type = (const void *)CalDatabaseCreateCalendarForEntityType();
    CalStoreAddCalendar();
    if (!*(void *)(a3 + 208))
    {
      CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      *(void *)(a3 + 208) = DLMemoryPoolAddObject();
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 208), a1, CalendarForEntityType);
    goto LABEL_117;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  *(void *)int valuePtr = 0;
  v217[0] = 0;
  unsigned int v215 = 0;
  if (!_deconstructRecordIdentifier(a1, (SInt32 *)&v215, (SInt32 *)valuePtr, v217, (SInt32 *)&valuePtr[4]))
  {
    if (!DLShouldLog()) {
      return;
    }
    goto LABEL_76;
  }
  switch(*(_DWORD *)valuePtr)
  {
    case 1:
      uint64_t v7 = CalDatabaseCopyCalendarWithUID();
      if (v7)
      {
        uint64_t Organizer = v7;
        uint64_t v9 = (const void *)CalCalendarCopyTitle();
        CalRemoveCalendar();
        CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@-CalDAVInfo", v9);
        if (v9) {
          CFRelease(v9);
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        CalDatabaseSetProperty();
        if (v10) {
          CFRelease(v10);
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        goto LABEL_15;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 2:
      uint64_t v39 = CalDatabaseCopyCalendarItemWithRowID();
      if (v39)
      {
        CFArrayRef v40 = (const void *)v39;
        CalRemoveEvent();
        if (!DLShouldLog()) {
          goto LABEL_244;
        }
        goto LABEL_204;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 3:
      uint64_t v41 = CalDatabaseCopyCalendarItemWithRowID();
      if (v41)
      {
        CFArrayRef v40 = (const void *)v41;
        CalRemoveTask();
        if (!DLShouldLog()) {
          goto LABEL_244;
        }
        goto LABEL_204;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 4:
      uint64_t v42 = CalDatabaseCopyAlarmWithUID();
      if (v42)
      {
        CFArrayRef v40 = (const void *)v42;
        uint64_t v43 = CalAlarmCopyOwningEntity();
        if (v43)
        {
          CFDateRef v44 = (const void *)v43;
          v217[0] = CalCalendarItemGetRowID();
          CalCalendarItemRemoveAlarm();
          if (!DLShouldLog()) {
            goto LABEL_243;
          }
          goto LABEL_242;
        }
        if (!DLShouldLog()) {
          goto LABEL_244;
        }
        goto LABEL_204;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 5:
      uint64_t v45 = CalDatabaseCopyRecurrenceWithUID();
      if (v45)
      {
        CFArrayRef v40 = (const void *)v45;
        uint64_t v46 = MEMORY[0x23ECC0D30](v45);
        if (v46)
        {
          CFDateRef v44 = (const void *)v46;
          v217[0] = CalCalendarItemGetRowID();
          MEMORY[0x23ECC0BD0](v44, v40);
          if (!DLShouldLog()) {
            goto LABEL_243;
          }
          goto LABEL_242;
        }
        if (!DLShouldLog()) {
          goto LABEL_244;
        }
        goto LABEL_204;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 6:
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      return;
    case 7:
      uint64_t v47 = MEMORY[0x23ECC0820](*(void *)(a3 + 184), *(unsigned int *)&valuePtr[4]);
      if (v47)
      {
        CFArrayRef v40 = (const void *)v47;
        uint64_t v48 = MEMORY[0x23ECC0580](v47);
        if (!v48)
        {
          if (DLShouldLog()) {
LABEL_204:
          }
            _DLLog();
          goto LABEL_244;
        }
        CFDateRef v44 = (const void *)v48;
        unsigned int v49 = _entityTypeForRecord();
        unsigned int v215 = v49;
        if (v49 == 3)
        {
          if (!DLShouldLog())
          {
LABEL_243:
            CFRelease(v44);
LABEL_244:
            uint64_t v11 = v40;
            goto LABEL_483;
          }
        }
        else
        {
          if (v49 != 2) {
            goto LABEL_243;
          }
          MEMORY[0x23ECC0BC0](v44, v40);
          if (!DLShouldLog()) {
            goto LABEL_243;
          }
        }
LABEL_242:
        _DLLog();
        goto LABEL_243;
      }
      if (DLShouldLog()) {
        goto LABEL_76;
      }
      break;
    case 8:
      if (CalDatabaseCopyCalendarItemWithRowID())
      {
        CalCalendarItemSetOrganizer();
        if (!DLShouldLog()) {
          return;
        }
      }
      else if (!DLShouldLog())
      {
        return;
      }
      goto LABEL_76;
    default:
      return;
  }
}

void _UpdateCalendarRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID = CalCalendarGetUID();
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 1, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
  uint64_t v7 = CalCalendarGetUID();
  CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"%d", v7);
  CalCalendarSetExternalID();
  if (v8)
  {
    CFRelease(v8);
  }
}

void _UpdateEventRemapping(const void *a1, const void *a2, uint64_t a3)
{
  uint64_t RowID = CalCalendarItemGetRowID();
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%d/%d", 2, RowID);
  _addRemapping(a3, a1, v7);
  CFDictionaryRef v8 = *(const __CFDictionary **)(a3 + 264);
  if (v8 && CFDictionaryContainsKey(v8, a1)) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 264), a1, a2);
  }
  CFRelease(v7);
}

void _UpdateDetachedEvents(void *key, const __CFArray *a2, uint64_t a3)
{
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 264), key);
  if (Value && (v7 = Value, CFTypeID v8 = CFGetTypeID(Value), v8 != CFStringGetTypeID()))
  {
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0; i != v10; ++i)
      {
        CFArrayGetValueAtIndex(a2, i);
        if (DLShouldLog())
        {
          CalCalendarItemGetRowID();
          CalCalendarItemGetRowID();
          _DLLog();
        }
        CalEventGetOriginalStartDate();
        CFDateRef v13 = CFDateCreate(0, v12);
        if (v13)
        {
          CFDateRef v14 = v13;
          MEMORY[0x23ECC0AD0](v7, v13);
          CFRelease(v14);
        }
        else if (DLShouldLog())
        {
          CalEventGetOriginalStartDate();
          _DLLog();
        }
        CalEventSetOriginalEvent();
      }
    }
    char v15 = *(__CFSet **)(a3 + 280);
    if (!v15)
    {
      CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
      char v15 = (__CFSet *)DLMemoryPoolAddObject();
      *(void *)(a3 + 280) = v15;
    }
    CFSetAddValue(v15, key);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _RemoveProcessedMainRecordIds(const void *a1, uint64_t a2)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  uint64_t v4 = *(__CFDictionary **)(a2 + 272);
  CFDictionaryRemoveValue(v4, a1);
}

void _UpdateOrganizerRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t RowID = CalCalendarItemGetRowID();
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 8, RowID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateTaskRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t RowID = CalCalendarItemGetRowID();
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 3, RowID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateAlarmRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID = CalAlarmGetUID();
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 4, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateRecurrenceRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID = CalRecurrenceGetUID();
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 5, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateAttendeeRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = MEMORY[0x23ECC05C0](a2);
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d/%d", 7, v5);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

uint64_t _deconstructRecordIdentifier(const __CFString *a1, SInt32 *a2, SInt32 *a3, SInt32 *a4, SInt32 *a5)
{
  if (a5) {
    *a5 = -1;
  }
  if (a4) {
    *a4 = -1;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  if (recordIdentifierIsLocal(a1))
  {
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, @"/");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v11 = ArrayBySeparatingStrings;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count == 4)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v11, 0);
        if (a2) {
          *a2 = CFStringGetIntValue(ValueAtIndex);
        }
        CFStringRef v17 = (const __CFString *)CFArrayGetValueAtIndex(v11, 1);
        if (a3) {
          *a3 = CFStringGetIntValue(v17);
        }
        CFStringRef v18 = (const __CFString *)CFArrayGetValueAtIndex(v11, 2);
        if (a4) {
          *a4 = CFStringGetIntValue(v18);
        }
        CFStringRef v15 = (const __CFString *)CFArrayGetValueAtIndex(v11, 3);
        if (!a5) {
          goto LABEL_28;
        }
      }
      else
      {
        if (Count != 2)
        {
          if (DLShouldLog()) {
            _DLLog();
          }
          uint64_t v14 = 0;
          goto LABEL_32;
        }
        CFStringRef v13 = (const __CFString *)CFArrayGetValueAtIndex(v11, 0);
        if (a3) {
          *a3 = CFStringGetIntValue(v13);
        }
        uint64_t v14 = 1;
        CFStringRef v15 = (const __CFString *)CFArrayGetValueAtIndex(v11, 1);
        if (!a5)
        {
LABEL_32:
          CFRelease(v11);
          return v14;
        }
      }
      *a5 = CFStringGetIntValue(v15);
LABEL_28:
      uint64_t v14 = 1;
      goto LABEL_32;
    }
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  return 0;
}

uint64_t _CopyParentCalendar(uint64_t a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"calendar");
  if (Value && (CFArrayRef v4 = Value, CFArrayGetCount(Value) >= 1))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
    return _CopyCalendarForUIDString(a1, ValueAtIndex);
  }
  else
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    return 0;
  }
}

uint64_t _CopyCalendarForUIDString(uint64_t a1, const __CFString *key)
{
  CFStringRef v2 = key;
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 168);
  if (v3)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v3, key);
    if (Value) {
      CFStringRef v2 = Value;
    }
  }
  uint64_t v7 = 0;
  int v5 = _deconstructRecordIdentifier(v2, 0, (SInt32 *)&v7, 0, (SInt32 *)&v7 + 1);
  uint64_t result = 0;
  if (v5 && HIDWORD(v7) != -1)
  {
    if (v7 == 1)
    {
      uint64_t result = CalDatabaseCopyCalendarWithUID();
      if (result) {
        return result;
      }
      if (!DLShouldLog()) {
        return 0;
      }
    }
    else if (!DLShouldLog())
    {
      return 0;
    }
    _DLLog();
    return 0;
  }
  return result;
}

uint64_t _CopyCalEntityOwner(uint64_t a1, CFDictionaryRef theDict, SInt32 *a3)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"owner");
  if (!Value || (CFArrayRef v6 = Value, CFArrayGetCount(Value) < 1))
  {
    if (!DLShouldLog()) {
      return 0;
    }
LABEL_11:
    _DLLog();
    return 0;
  }
  SInt32 v12 = 0;
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
  CFDictionaryRef v8 = *(const __CFDictionary **)(a1 + 168);
  if (v8)
  {
    CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(v8, ValueAtIndex);
    if (v9) {
      CFStringRef ValueAtIndex = v9;
    }
  }
  int v10 = _deconstructRecordIdentifier(ValueAtIndex, 0, a3, 0, &v12);
  uint64_t result = 0;
  if (v10 && v12 != -1)
  {
    if ((*a3 & 0xFFFFFFFE) == 2) {
      return CalDatabaseCopyCalendarItemWithRowID();
    }
    if (!DLShouldLog()) {
      return 0;
    }
    goto LABEL_11;
  }
  return result;
}

uint64_t _GetDayOfWeekFromString(const __CFString *a1)
{
  if (!a1) {
    return 7;
  }
  int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
  if (CharacterAtIndex <= 114)
  {
    if (CharacterAtIndex == 102) {
      return 5;
    }
    if (CharacterAtIndex == 109) {
      return 1;
    }
  }
  else
  {
    switch(CharacterAtIndex)
    {
      case 's':
        if (CFStringGetCharacterAtIndex(a1, 1) == 97) {
          return 6;
        }
        else {
          return 0;
        }
      case 'w':
        return 3;
      case 't':
        if (CFStringGetCharacterAtIndex(a1, 1) == 117) {
          return 2;
        }
        else {
          return 4;
        }
    }
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  return 7;
}

void _addRemapping(uint64_t a1, const void *a2, const void *a3)
{
  if (!*(void *)(a1 + 160))
  {
    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 160) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  CFArrayRef v6 = *(__CFDictionary **)(a1 + 160);
  CFDictionarySetValue(v6, a2, a3);
}

CFStringRef dataTypeForDataClassName(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (CFStringCompare(result, @"com.apple.Bookmarks", 0))
    {
      if (CFStringCompare(v1, @"com.apple.Calendars", 0))
      {
        if (CFStringCompare(v1, @"com.apple.Contacts", 0))
        {
          if (CFStringCompare(v1, @"com.apple.MailAccounts", 0))
          {
            if (CFStringCompare(v1, @"com.apple.Notes", 0)) {
              return 0;
            }
            else {
              return @"Notes";
            }
          }
          else
          {
            return @"Mail Accounts";
          }
        }
        else
        {
          return @"Contacts";
        }
      }
      else
      {
        return @"Calendars";
      }
    }
    else
    {
      return @"Bookmarks";
    }
  }
  return result;
}

CFStringRef dataClassNameForDataType(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (CFStringCompare(result, @"Bookmarks", 0))
    {
      if (CFStringCompare(v1, @"Calendars", 0))
      {
        if (CFStringCompare(v1, @"Contacts", 0))
        {
          if (CFStringCompare(v1, @"Mail Accounts", 0))
          {
            if (CFStringCompare(v1, @"Notes", 0)) {
              return 0;
            }
            else {
              return @"com.apple.Notes";
            }
          }
          else
          {
            return @"com.apple.MailAccounts";
          }
        }
        else
        {
          return @"com.apple.Contacts";
        }
      }
      else
      {
        return @"com.apple.Calendars";
      }
    }
    else
    {
      return @"com.apple.Bookmarks";
    }
  }
  return result;
}

uint64_t setPlaybackEnabled(char a1)
{
  uint64_t result = DLShouldLog();
  if (result) {
    uint64_t result = _DLLog();
  }
  playbackEnabledChecked = 1;
  playbackEnabled = a1;
  return result;
}

BOOL SyncPlaybackEnabled()
{
  if (playbackEnabledChecked == 1) {
    return playbackEnabled != 0;
  }
  playbackEnabledChecked = 1;
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v0 = CFPreferencesGetAppBooleanValue(@"SyncPlayback", @"com.apple.SyncServices.iPodSync", &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  else
  {
    BOOL v0 = 0;
  }
  playbackEnabled = v0;
  return v0;
}

CFStringRef CreateCleanUuid(const __CFString *a1)
{
  CFStringRef v1 = a1;
  if (CFStringHasPrefix(a1, @"com.apple.syncservices:"))
  {
    CFIndex Length = CFStringGetLength(v1);
    CFIndex v3 = CFStringGetLength(@"com.apple.syncservices:");
    BOOL v4 = Length <= v3;
    CFIndex v5 = Length - v3;
    if (v4)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
    }
    else
    {
      CFIndex v6 = v3;
      if (DLShouldLog()) {
        _DLLog();
      }
      v9.locatioCFIndex n = v6;
      v9.length = v5;
      CFStringRef v7 = CFStringCreateWithSubstring(0, v1, v9);
      if (DLShouldLog()) {
        _DLLog();
      }
      return v7;
    }
  }
  else
  {
    CFRetain(v1);
  }
  return v1;
}

uint64_t recordIdentifierIsLocal(const __CFString *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (CFStringHasPrefix(a1, @"com.apple.syncservices:")) {
    return 0;
  }
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr) {
    return strlen(CStringPtr) < 9 || CStringPtr[8] != 45;
  }
  CStringPtr = buffer;
  uint64_t result = CFStringGetCString(a1, buffer, 64, 0x8000100u);
  if (result) {
    return strlen(CStringPtr) < 9 || CStringPtr[8] != 45;
  }
  return result;
}

uint64_t BookmarksDataSourceCreator(void *a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v5 = (char *)malloc_type_calloc(0xE0uLL, 1uLL, 0x1EC0411uLL);
  *a1 = v5;
  *(void *)uint64_t v5 = *MEMORY[0x263EFFB40];
  *((void *)v5 + 1) = @"~/Library/Safari/com.apple.Bookmarks.lock";
  *((void *)v5 + 2) = BookmarksDataSourceGetVersionFunction;
  *((void *)v5 + 3) = BookmarksDataSourceCanSyncWithVersionFunction;
  *((void *)v5 + 4) = 0;
  *((void *)v5 + 5) = BookmarksDataSourceRemoveStoreFunction;
  *((void *)v5 + 6) = BookmarksDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((void *)v5 + 7) = BookmarksDataSourceClearSyncAnchors;
  *((void *)v5 + 8) = BookmarksDataSourceClearAllRecords;
  *((void *)v5 + 9) = BookmarksDataSourceGetChanges;
  *((void *)v5 + 10) = BookmarksDataSourceGetAllRecords;
  *((void *)v5 + 11) = BookmarksDataSourceGetCountOfRecords;
  *((void *)v5 + 12) = BookmarksDataSourceProcessChanges;
  *((void *)v5 + 13) = BookmarksDataSourceCommit;
  *((void *)v5 + 14) = BookmarksDataSourceRollback;
  *((void *)v5 + 15) = BookmarksDataSourceGetEntityTypeProcessOrder;
  *((void *)v5 + 16) = BookmarksDataSourceDeleteDataSource;
  *((void *)v5 + 17) = (id)[MEMORY[0x263F861E0] safariBookmarkCollection];
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *(_OWORD *)(v5 + 204) = 0u;
  if (a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, @"ShouldClearHiddenBookmarks");
    if (Value)
    {
      CFBooleanRef v7 = Value;
      if (DLShouldLog()) {
        _DLLog();
      }
      v5[219] = CFBooleanGetValue(v7);
    }
  }
  return 0;
}

uint64_t BookmarksDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3 = (CFNumberRef)kBookmarksDataSourceVersion;
  if (!kBookmarksDataSourceVersion)
  {
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultDataSourceVersion);
    kBookmarksDataSourceVersioCFIndex n = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t BookmarksDataSourceCanSyncWithVersionFunction(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t BookmarksDataSourceRemoveStoreFunction(id *a1, uint64_t a2, void *a3)
{
  BookmarksDataSourceClearAllRecords((uint64_t)a1);
  [a1[17] syncSetString:0 forKey:@"ComputerAnchorKey"];
  [a1[17] syncSetString:0 forKey:@"BookmarksLastGeneration"];
  return BookmarksDataSourceCommit(a1, a3);
}

uint64_t BookmarksDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, uint64_t a3, __CFString *a4, CFTypeRef *a5, CFTypeRef *a6, void *a7)
{
  *a7 = 0;
  if (a4) {
    CFArrayRef v11 = a4;
  }
  else {
    CFArrayRef v11 = @"Empty-Bookmarks-Anchor";
  }
  *(void *)(a1 + 200) = CFRetain(v11);
  SInt32 v12 = (__CFString *)[*(id *)(a1 + 136) syncStringForKey:@"ComputerAnchorKey"];
  CFStringRef v13 = v12;
  if (!v12) {
    SInt32 v12 = @"Unknown-Bookmarks-Anchor";
  }
  *a5 = CFRetain(v12);
  *a6 = CFRetain(@"Bookmarks-Device-Anchor");
  uint64_t v14 = (const void *)[*(id *)(a1 + 136) bookmarksDictionary];
  if (!v14)
  {
    int v16 = 6;
    do
    {
      int v17 = DLShouldLog();
      if (!--v16)
      {
        if (v17) {
          _DLLog();
        }
        return 0xFFFFFFFFLL;
      }
      if (v17) {
        _DLLog();
      }
      sleep(1u);
      uint64_t v18 = [*(id *)(a1 + 136) bookmarksDictionary];
    }
    while (!v18);
    uint64_t v14 = (const void *)v18;
    if (v13) {
      goto LABEL_8;
    }
LABEL_17:
    *a2 = CFRetain(@"SDSyncTypeReset");
    if ((DLShouldLog() & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v13) {
    goto LABEL_17;
  }
LABEL_8:
  uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 136), "syncStringForKey:", @"BookmarksLastGeneration"), "integerValue");
  if (v15 == [*(id *)(a1 + 136) generation])
  {
    *a2 = CFRetain(@"SDSyncTypeFast");
    if ((DLShouldLog() & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    *a2 = CFRetain(@"SDSyncTypeSlow");
    if (!DLShouldLog()) {
      goto LABEL_21;
    }
  }
LABEL_20:
  _DLLog();
LABEL_21:
  int v19 = 5;
  while (([*(id *)(a1 + 136) beginSyncTransaction] & 1) == 0)
  {
    sleep(1u);
    if (!--v19) {
      return 0xFFFFFFFFLL;
    }
  }
  *(void *)(a1 + 144) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v14, 2uLL);
  if (DLShouldLog()) {
    _DLLog();
  }
  _initializeMaps((void *)a1);
  return 0;
}

uint64_t BookmarksDataSourceClearSyncAnchors(uint64_t a1)
{
  return 0;
}

uint64_t BookmarksDataSourceClearAllRecords(uint64_t a1)
{
  CFStringRef v2 = *(const void **)(a1 + 144);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 144) = 0;
  }
  CFNumberRef v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 152) = 0;
  }
  BOOL v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 160) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 168) = 0;
  }
  int valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFDictionaryRef v8 = CFDictionaryCreateMutable(0, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 144) = v8;
  CFDictionarySetValue(v8, @"Children", Mutable);
  CFRelease(Mutable);
  CFDictionarySetValue(v8, @"WebBookmarkType", @"WebBookmarkTypeList");
  CFDictionarySetValue(v8, @"WebBookmarkFileVersion", v6);
  CFRelease(v6);
  CFDictionarySetValue(v8, @"WebBookmarkUUID", @"Root");
  _initializeMaps((void *)a1);
  *(unsigned char *)(a1 + 218) = 1;
  return 0;
}

uint64_t BookmarksDataSourceGetChanges(uint64_t a1, void *a2, void *a3)
{
  *a2 = 0;
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t BookmarksDataSourceGetAllRecords(uint64_t a1, CFDictionaryRef *a2, void *a3)
{
  *a2 = CFDictionaryCreateCopy(0, *(CFDictionaryRef *)(a1 + 160));
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t BookmarksDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  *a2 = _getCountOfChildrenForContainer((const __CFDictionary *)[*(id *)(a1 + 136) bookmarksDictionary]);
  return 0;
}

uint64_t BookmarksDataSourceProcessChanges(unsigned char *a1, CFDictionaryRef theDict, uint64_t a3, void *a4)
{
  if (theDict && CFDictionaryGetCount(theDict) >= 1)
  {
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_processRecord, a1);
    a1[218] = 1;
  }
  *a4 = 0;
  return 0;
}

uint64_t BookmarksDataSourceCommit(void *context, void *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)*((void *)context + 23);
  if (v4 && CFDictionaryGetCount(v4) && DLShouldLog())
  {
    id v8 = (id)*((void *)context + 23);
    _DLLog();
  }
  if (*((unsigned char *)context + 218) != 1) {
    goto LABEL_11;
  }
  CFSetRef v5 = (const __CFSet *)*((void *)context + 22);
  if (v5) {
    CFSetApplyFunction(v5, (CFSetApplierFunction)_sortBookmarksForParentUuid, context);
  }
  id v9 = 0;
  if (DLShouldLog())
  {
    id v8 = (id)*((void *)context + 18);
    _DLLog();
  }
  if (!objc_msgSend(*((id *)context + 17), "mergeWithBookmarksDictionary:clearHidden:error:", *((void *)context + 18), *((unsigned char *)context + 219) != 0, &v9, v8))
  {
    *a2 = (id)[v9 description];
    if (DLShouldLog())
    {
      id v8 = v9;
      _DLLog();
    }
    objc_msgSend(*((id *)context + 17), "rollbackSyncTransaction", v8);
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_11:
    objc_msgSend(*((id *)context + 17), "syncSetString:forKey:", *((void *)context + 25), @"ComputerAnchorKey", v8);
    [*((id *)context + 17) syncSetString:objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*((id *)context + 17), "generation")), @"BookmarksLastGeneration" forKey];
    [*((id *)context + 17) commitSyncTransaction];
    if (*((unsigned char *)context + 218) == 1)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bookmarks.BookmarksFileChanged", 0, 0, 0);
    }
    return 0;
  }
}

uint64_t BookmarksDataSourceRollback(uint64_t a1)
{
  return 0;
}

uint64_t BookmarksDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  CFMutableArrayRef Mutable = *(__CFArray **)(a1 + 208);
  if (!Mutable)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v6 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFBooleanRef v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, @"com.apple.bookmarks.Folder");
    CFArrayAppendValue(Mutable, v7);
    if (v7) {
      CFRelease(v7);
    }
    id v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
    CFArrayAppendValue(v8, @"com.apple.bookmarks.Bookmark");
    CFArrayAppendValue(Mutable, v8);
    if (v8) {
      CFRelease(v8);
    }
    *(void *)(a1 + 208) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t BookmarksDataSourceDeleteDataSource(uint64_t a1)
{
  CFStringRef v2 = *(const void **)(a1 + 144);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 144) = 0;
  }
  CFNumberRef v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 152) = 0;
  }
  CFDictionaryRef v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 160) = 0;
  }
  CFAllocatorRef v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 168) = 0;
  }
  CFNumberRef v6 = *(const void **)(a1 + 176);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 176) = 0;
  }
  CFBooleanRef v7 = *(const void **)(a1 + 184);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 184) = 0;
  }
  id v8 = *(const void **)(a1 + 192);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 192) = 0;
  }
  id v9 = *(const void **)(a1 + 200);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 200) = 0;
  }
  int v10 = *(const void **)(a1 + 208);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 208) = 0;
  }

  free((void *)a1);
  return 0;
}

void _initializeMaps(void *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFDictionaryRef v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  a1[19] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  a1[20] = CFDictionaryCreateMutable(v2, 0, v3, v4);
  a1[21] = CFDictionaryCreateMutable(v2, 0, v3, v4);
  CFNumberRef v6 = (const void *)a1[18];
  CFAllocatorRef v5 = (__CFDictionary *)a1[19];
  CFDictionarySetValue(v5, @"Root", v6);
}

void _createBookmarksForChildren(uint64_t a1, const __CFDictionary *a2, void *a3, uint64_t a4)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"Children");
  if (Value)
  {
    CFArrayRef v8 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      CFIndex v11 = 0;
      unsigned int v26 = a4;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v11);
        CFStringRef v13 = CFDictionaryGetValue(ValueAtIndex, @"WebBookmarkUUID");
        CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"WebBookmarkType");
        if (v13)
        {
          CFStringRef v15 = v14;
          if (v14)
          {
            if (a3) {
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 168), v13, a3);
            }
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 152), v13, ValueAtIndex);
            if (CFEqual(v15, @"WebBookmarkTypeLeaf"))
            {
              if (a4 != 1) {
                goto LABEL_47;
              }
              int v16 = (__CFString *)CFDictionaryGetValue(ValueAtIndex, @"URLString");
              CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"URIDictionary");
              uint64_t v18 = v17 ? (__CFString *)CFDictionaryGetValue(v17, @"title") : 0;
              CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.bookmarks.Bookmark");
              uint64_t v24 = v18 ? v18 : &stru_26EE18D58;
              CFDictionarySetValue(Mutable, @"name", v24);
              CFNumberRef v25 = v16 ? v16 : &stru_26EE18D58;
              CFDictionarySetValue(Mutable, @"url", v25);
              _setParentUUIDAndPosition(Mutable, a3, v11);
              a4 = v26;
              if (!Mutable) {
                goto LABEL_47;
              }
LABEL_46:
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 160), v13, Mutable);
              CFRelease(Mutable);
              goto LABEL_47;
            }
            if (CFStringCompare(v15, @"WebBookmarkTypeList", 0))
            {
              if (CFEqual(v15, @"WebBookmarkTypeProxy")
                || !DLShouldLog())
              {
                goto LABEL_47;
              }
LABEL_16:
              _DLLog();
              goto LABEL_47;
            }
            if (a4 == 1)
            {
              CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Title");
              if (v19)
              {
                CFStringRef v20 = v19;
                CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                CFDictionarySetValue(Mutable, @"com.apple.syncservices.RecordEntityName", @"com.apple.bookmarks.Folder");
                CFDictionarySetValue(Mutable, @"name", v20);
                uint64_t v22 = v11;
                if (!a3)
                {
                  if (*(unsigned char *)(a1 + 216) || CFStringCompare(v20, @"BookmarksBar", 0))
                  {
                    uint64_t v22 = v11;
                    if (!*(unsigned char *)(a1 + 217))
                    {
                      CFComparisonResult v23 = CFStringCompare(v20, @"BookmarksMenu", 0);
                      uint64_t v22 = v11;
                      if (v23 == kCFCompareEqualTo)
                      {
                        *(unsigned char *)(a1 + 217) = 1;
                        goto LABEL_42;
                      }
                    }
                  }
                  else
                  {
                    *(unsigned char *)(a1 + 216) = 1;
LABEL_42:
                    uint64_t v22 = -2;
                  }
                }
                _setParentUUIDAndPosition(Mutable, a3, v22);
              }
              else
              {
                if (DLShouldLog()) {
                  _DLLog();
                }
                CFMutableArrayRef Mutable = 0;
              }
              a4 = v26;
            }
            else
            {
              CFMutableArrayRef Mutable = 0;
            }
            _createBookmarksForChildren(a1, ValueAtIndex, v13, a4);
            if (Mutable) {
              goto LABEL_46;
            }
            goto LABEL_47;
          }
          if (DLShouldLog()) {
            goto LABEL_16;
          }
        }
        else if (DLShouldLog())
        {
          goto LABEL_16;
        }
LABEL_47:
        ++v11;
      }
      while (v10 != v11);
    }
  }
}

void _setParentUUIDAndPosition(__CFDictionary *a1, void *a2, uint64_t a3)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t valuePtr = a3;
  if (a2)
  {
    values[0] = a2;
    CFArrayRef v4 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
    CFDictionarySetValue(a1, @"parent", v4);
    CFRelease(v4);
  }
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  CFDictionarySetValue(a1, @"position", v5);
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t _getCountOfChildrenForContainer(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"WebBookmarkType");
  if (CFEqual(Value, @"WebBookmarkTypeLeaf")) {
    return 1;
  }
  if (CFStringCompare(Value, @"WebBookmarkTypeList", 0)) {
    return 0;
  }
  CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a1, @"Title");
  unint64_t v3 = (unint64_t)v5;
  if (v5)
  {
    if (CFStringCompare(v5, @"BookmarksBar", 0)) {
      unint64_t v3 = CFStringCompare((CFStringRef)v3, @"BookmarksMenu", 0) != kCFCompareEqualTo;
    }
    else {
      unint64_t v3 = 0;
    }
  }
  CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue(a1, @"Children");
  if (v6)
  {
    CFArrayRef v7 = v6;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      CFIndex Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0; i != v10; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
          unint64_t v3 = _getCountOfChildrenForContainer(ValueAtIndex) + v3;
        }
      }
    }
  }
  return v3;
}

void _processRecord(const __CFString *a1, const void *a2, const __CFDictionary **a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    CFStringRef Value = CFDictionaryGetValue(a3[21], a1);
    if (Value)
    {
      CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], Value);
      if (v8)
      {
LABEL_4:
        _removeChild(v8, a1);
        return;
      }
    }
    else
    {
      CFDictionaryRef v8 = a3[18];
      if (v8) {
        goto LABEL_4;
      }
    }
    if (!DLShouldLog()) {
      return;
    }
LABEL_16:
    _DLLog();
    return;
  }
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, @"com.apple.syncservices.RecordEntityName");
  if (!v9)
  {
    if (!DLShouldLog()) {
      return;
    }
    goto LABEL_16;
  }
  CFStringRef v10 = v9;
  CFComparisonResult v11 = CFStringCompare(v9, @"com.apple.bookmarks.Bookmark", 0);
  if (v11)
  {
    if (CFStringCompare(v10, @"com.apple.bookmarks.Folder", 0))
    {
      if (!DLShouldLog()) {
        return;
      }
      goto LABEL_16;
    }
    SInt32 v12 = @"WebBookmarkTypeList";
  }
  else
  {
    SInt32 v12 = @"WebBookmarkTypeLeaf";
  }
  CFStringRef v13 = (__CFDictionary *)CFDictionaryGetValue(a3[19], a1);
  if (v13)
  {
    CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(a3[21], a1);
    CFMutableDictionaryRef Mutable = v13;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(a3[19], a1, Mutable);
    CFRelease(Mutable);
    CFStringRef v14 = 0;
  }
  CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a2, @"parent");
  CFArrayRef ValueAtIndex = v16;
  if (v16)
  {
    if (CFArrayGetCount(v16) < 1) {
      CFArrayRef ValueAtIndex = 0;
    }
    else {
      CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    }
  }
  uint64_t v18 = a3[22];
  if (!v18)
  {
    uint64_t v18 = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
    a3[22] = v18;
  }
  if (ValueAtIndex) {
    CFStringRef v19 = (__CFString *)ValueAtIndex;
  }
  else {
    CFStringRef v19 = @"Root";
  }
  CFSetAddValue(v18, v19);
  CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)a2, @"position");
  if (v20) {
    CFDictionarySetValue(Mutable, @"position", v20);
  }
  if (!v13 || v14 == (const __CFString *)ValueAtIndex)
  {
    if (v13) {
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  if (!v14 || !ValueAtIndex)
  {
    if (v14)
    {
LABEL_42:
      CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], v14);
      if (!v21) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    CFDictionaryRef v21 = a3[18];
    if (v21) {
LABEL_43:
    }
      _removeChild(v21, a1);
LABEL_44:
    if (ValueAtIndex)
    {
      CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], ValueAtIndex);
      if (v22) {
        goto LABEL_46;
      }
    }
    else
    {
      CFDictionaryRef v22 = a3[18];
      if (v22)
      {
LABEL_46:
        _addChild(v22, Mutable);
        if (v13) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
    CFDictionaryRef v38 = a3[23];
    if (!v38)
    {
      CFDictionaryRef v38 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      a3[23] = v38;
    }
    uint64_t v39 = (void *)CFDictionaryGetValue(v38, ValueAtIndex);
    if (!v39)
    {
      uint64_t v39 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      CFDictionaryAddValue(a3[23], ValueAtIndex, v39);
      CFRelease(v39);
    }
    CFArrayAppendValue((CFMutableArrayRef)v39, a1);
    if (v13)
    {
LABEL_48:
      if (!ValueAtIndex) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
LABEL_47:
    CFDictionarySetValue(Mutable, @"WebBookmarkType", v12);
    CFDictionarySetValue(Mutable, @"WebBookmarkUUID", a1);
    goto LABEL_48;
  }
  if (CFStringCompare(v14, (CFStringRef)ValueAtIndex, 0)) {
    goto LABEL_42;
  }
LABEL_49:
  CFDictionarySetValue(a3[21], a1, ValueAtIndex);
LABEL_50:
  CFComparisonResult v23 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, @"name");
  uint64_t v24 = v23;
  if (v11)
  {
    if (!v23)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      uint64_t v24 = @"Folder";
    }
    CFDictionarySetValue(Mutable, @"Title", v24);
    if (!v13
      && ([(__CFString *)v24 isEqualToString:@"Bookmarks Menu"] & 1) == 0
      && ([(__CFString *)v24 isEqualToString:@"Bookmarks Bar"] & 1) == 0)
    {
      CFDictionaryRef v25 = a3[23];
      if (v25)
      {
        CFArrayRef v26 = (const __CFArray *)CFDictionaryGetValue(v25, a1);
        if (v26)
        {
          CFArrayRef v27 = v26;
          CFIndex Count = CFArrayGetCount(v26);
          if (Count >= 1)
          {
            CFIndex v29 = Count;
            for (CFIndex i = 0; i != v29; ++i)
            {
              CFDictionaryRef v31 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], a1);
              int v32 = CFArrayGetValueAtIndex(v27, i);
              char v33 = CFDictionaryGetValue(a3[19], v32);
              if (v33)
              {
                _addChild(v31, v33);
              }
              else if (DLShouldLog())
              {
                _DLLog();
              }
            }
          }
          unsigned int v34 = a3[23];
          CFDictionaryRemoveValue(v34, a1);
        }
      }
    }
  }
  else
  {
    uint64_t v35 = (void *)CFDictionaryGetValue(Mutable, @"URIDictionary");
    if (!v35)
    {
      uint64_t v35 = CFDictionaryCreateMutable(0, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, @"URIDictionary", v35);
      CFRelease(v35);
    }
    uint64_t v36 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, @"url");
    if (!v36)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      uint64_t v36 = &stru_26EE18D58;
    }
    if (v24) {
      uint64_t v37 = v24;
    }
    else {
      uint64_t v37 = v36;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v35, &stru_26EE18D58, v36);
    CFDictionarySetValue((CFMutableDictionaryRef)v35, @"title", v37);
    CFDictionarySetValue(Mutable, @"URLString", v36);
  }
}

void _removeChild(const __CFDictionary *a1, const __CFString *a2)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Children");
  if (Value)
  {
    CFArrayRef v4 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
        CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"WebBookmarkUUID");
        if (v9)
        {
          if (CFEqual(v9, a2)) {
            break;
          }
        }
        if (v6 == ++v7) {
          return;
        }
      }
      CFArrayRemoveValueAtIndex(v4, v7);
    }
  }
}

void _addChild(const __CFDictionary *a1, const void *a2)
{
  CFArrayRef Value = (void *)CFDictionaryGetValue(a1, @"Children");
  if (!Value)
  {
    CFArrayRef Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFDictionarySetValue(a1, @"Children", Value);
    CFRelease(Value);
  }
  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

void _sortBookmarksForParentUuid(void *key, uint64_t a2)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 152), key);
  if (!Value)
  {
    if (!DLShouldLog()) {
      return;
    }
LABEL_15:
    _DLLog();
    return;
  }
  CFArrayRef v3 = (const __CFArray *)CFDictionaryGetValue(Value, @"Children");
  if (!v3)
  {
    if (!DLShouldLog()) {
      return;
    }
    goto LABEL_15;
  }
  CFArrayRef v4 = v3;
  uint64_t Count = CFArrayGetCount(v3);
  CFIndex valuePtr = 0;
  if (Count < 1)
  {
    v11.locatioCFIndex n = 0;
    v11.length = Count;
    CFArraySortValues(v4, v11, (CFComparatorFunction)_childrenSortCallback, 0);
  }
  else
  {
    for (i = 0; i < Count; CFIndex valuePtr = i)
    {
      CFDictionaryRef ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v4, i);
      if (!CFDictionaryGetValue(ValueAtIndex, @"position"))
      {
        CFNumberRef v8 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
        CFDictionaryAddValue(ValueAtIndex, @"position", v8);
        CFRelease(v8);
      }
      CFIndex i = valuePtr + 1;
    }
    v14.locatioCFIndex n = 0;
    v14.length = Count;
    CFArraySortValues(v4, v14, (CFComparatorFunction)_childrenSortCallback, 0);
    CFIndex valuePtr = 0;
    for (j = 0; j < Count; CFIndex valuePtr = j)
    {
      CFStringRef v10 = (__CFDictionary *)CFArrayGetValueAtIndex(v4, j);
      CFDictionaryRemoveValue(v10, @"position");
      CFIndex j = valuePtr + 1;
    }
  }
}

CFComparisonResult _childrenSortCallback(const __CFDictionary *a1, const __CFDictionary *a2)
{
  uint64_t v21 = 0;
  uint64_t valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"position");
  CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a2, @"position");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
  }
  if (v5)
  {
    CFNumberGetValue(v5, kCFNumberLongType, &v21);
    uint64_t v6 = v21;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (valuePtr < v6) {
    return -1;
  }
  if (valuePtr > v6) {
    return 1;
  }
  CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a1, @"WebBookmarkType");
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a2, @"WebBookmarkType");
  CFStringRef v10 = v9;
  if (v8)
  {
    CFComparisonResult v11 = CFStringCompare(v8, @"WebBookmarkTypeList", 0);
    LODWORD(v8) = v11 == kCFCompareEqualTo;
    BOOL v12 = v11 != kCFCompareEqualTo;
    if (v10)
    {
LABEL_12:
      CFComparisonResult v13 = CFStringCompare(v10, @"WebBookmarkTypeList", 0);
      LODWORD(v10) = v13 == kCFCompareEqualTo;
      BOOL v14 = v13 != kCFCompareEqualTo;
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v12 = 1;
    if (v9) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_15:
  if ((v12 | v10) != 1) {
    return -1;
  }
  if ((v8 | v14) != 1) {
    return 1;
  }
  if (v8)
  {
    CFStringRef v15 = @"Title";
    CFDictionaryRef v16 = a1;
  }
  else
  {
    CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"URIDictionary");
    if (!v16)
    {
      CFStringRef v17 = 0;
      if (v10) {
        goto LABEL_22;
      }
      goto LABEL_24;
    }
    CFStringRef v15 = @"title";
  }
  CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v16, v15);
  if (v10)
  {
LABEL_22:
    uint64_t v18 = @"Title";
    CFDictionaryRef v19 = a2;
    goto LABEL_26;
  }
LABEL_24:
  CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(a2, @"URIDictionary");
  if (v19)
  {
    uint64_t v18 = @"title";
LABEL_26:
    CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(v19, v18);
    if (v17)
    {
      if (v20) {
        return CFStringCompare(v17, v20, 0);
      }
      return 1;
    }
    return -1;
  }
  if (v17) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t _identityStringWithInfo(void *a1, __CFString *a2, __CFString *a3)
{
  CFArrayRef v4 = a2;
  uint64_t v6 = (void *)MEMORY[0x263EFAE58];
  CFIndex v7 = @"@";
  if (a1 && !a2)
  {
    if (([a1 isEqualToString:*MEMORY[0x263EFAF98]] & 1) != 0
      || [a1 isEqualToString:*v6])
    {
      CFArrayRef v4 = &stru_26EE18D58;
      CFIndex v7 = &stru_26EE18D58;
    }
    else
    {
      CFArrayRef v4 = 0;
      CFIndex v7 = &stru_26EE18D58;
    }
  }
  int v8 = [a1 isEqualToString:*v6];
  CFStringRef v9 = @"smtp.icloud.com";
  if (!v8) {
    CFStringRef v9 = a3;
  }
  if (!a1 || v9)
  {
LABEL_13:
    if (!a1) {
      return 0;
    }
    goto LABEL_17;
  }
  if ([a1 isEqualToString:*MEMORY[0x263EFAFE0]])
  {
    CFStringRef v9 = @"Yahoo";
    goto LABEL_13;
  }
  int v10 = [a1 isEqualToString:*MEMORY[0x263EFAEE8]];
  CFStringRef v9 = @"Gmail";
  if (!v10) {
    CFStringRef v9 = 0;
  }
LABEL_17:
  if (v4 && v9) {
    return [NSString stringWithFormat:@"%@:%@%@%@", a1, v4, v7, v9];
  }
  return 0;
}

uint64_t _bestiCloudUsernameFromEmails(void *a1, void *a2)
{
  if ([a1 rangeOfString:@"@"] != 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 count])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "lowercaseString"), "stringByAppendingString:", @"@");
    if (_bestiCloudUsernameFromEmails_onceToken != -1)
    {
      uint64_t v7 = v4;
      dispatch_once(&_bestiCloudUsernameFromEmails_onceToken, &__block_literal_global_54);
      uint64_t v4 = v7;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___bestiCloudUsernameFromEmails_block_invoke_3;
    v8[3] = &unk_264DC7008;
    v8[4] = v4;
    v8[5] = &__block_literal_global_69;
    CFNumberRef v5 = objc_msgSend((id)objc_msgSend(a2, "sortedArrayUsingComparator:", v8), "objectAtIndex:", 0);
  }
  else
  {
    CFNumberRef v5 = 0;
  }
  if (![v5 length]) {
    return [a1 stringByAppendingString:@"@icloud.com"];
  }
  return (uint64_t)v5;
}

uint64_t MailAccountsDataSourceCreator(void *a1)
{
  CFAllocatorRef v2 = malloc_type_calloc(0xB8uLL, 1uLL, 0x665F5F8AuLL);
  *a1 = v2;
  *CFAllocatorRef v2 = *MEMORY[0x263EFFB40];
  v2[2] = MailAccountsDataSourceGetVersionFunction;
  v2[3] = MailAccountsDataSourceCanSyncWithVersionFunction;
  v2[5] = 0;
  v2[6] = MailAccountsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  v2[7] = 0;
  v2[8] = MailAccountsDataSourceClearAllRecords;
  v2[9] = MailAccountsDataSourceGetChanges;
  v2[10] = MailAccountsDataSourceGetAllRecords;
  v2[11] = MailAccountsDataSourceGetCountOfRecords;
  v2[12] = MailAccountsDataSourceProcessChanges;
  v2[13] = MailAccountsDataSourceCommit;
  v2[14] = MailAccountsDataSourceRollback;
  v2[16] = MailAccountsDataSourceDeleteDataSource;
  *((_WORD *)v2 + 68) = 0;
  *((_OWORD *)v2 + 9) = 0u;
  *((_OWORD *)v2 + 10) = 0u;
  v2[22] = objc_alloc_init(MEMORY[0x263EFB210]);
  return 0;
}

uint64_t MailAccountsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3 = (CFNumberRef)kMailAccountsDataSourceVersion;
  if (!kMailAccountsDataSourceVersion)
  {
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultDataSourceVersion);
    kMailAccountsDataSourceVersioCFIndex n = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t MailAccountsDataSourceCanSyncWithVersionFunction(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t MailAccountsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, CFTypeRef *a5, CFTypeRef *a6)
{
  int v9 = [*(id *)(a1 + 176) hasMailAccountsForSync];
  if (DLShouldLog()) {
    _DLLog();
  }
  if (v9) {
    int v10 = @"SDSyncTypeFast";
  }
  else {
    int v10 = @"SDSyncTypeReset";
  }
  *a2 = CFRetain(v10);
  *a5 = CFRetain(@"MailAccounts-Computer-Anchor");
  *a6 = CFRetain(@"MailAccounts-Device-Anchor");
  return 0;
}

uint64_t MailAccountsDataSourceClearAllRecords()
{
  if (DLShouldLog()) {
    _DLLog();
  }
  return 0;
}

uint64_t MailAccountsDataSourceGetChanges(uint64_t a1, void *a2, void *a3)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = 0;
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t MailAccountsDataSourceGetAllRecords(uint64_t a1, void *a2, void *a3)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = 0;
  *a3 = *MEMORY[0x263EFFB38];
  return 0;
}

uint64_t MailAccountsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  *a2 = 0;
  return 0;
}

uint64_t MailAccountsDataSourceProcessChanges(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (theDict && CFDictionaryGetCount(theDict) >= 1)
  {
    if (!*(void *)(a1 + 144))
    {

      *(void *)(a1 + 144) = objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(void *)(a1 + 152) = objc_alloc_init(MEMORY[0x263EFF980]);
      if (!*(unsigned char *)(a1 + 136))
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 176), "mailAccountsForSync", 0);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              uint64_t v13 = [v12 syncIdentityString];
              if (v13) {
                objc_msgSend(*(id *)(a1 + 144), "setValue:forKey:", objc_msgSend(v12, "identifier"), v13);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v9);
        }
      }
    }
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_processRecord_0, (void *)a1);
    *(unsigned char *)(a1 + 137) = 1;
  }
  *a4 = *(void *)(a1 + 160);
  return 0;
}

uint64_t MailAccountsDataSourceCommit(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 137))
  {
    CFAllocatorRef v2 = dispatch_group_create();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obCFIndex j = *(id *)(a1 + 152);
    uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v3) {
      goto LABEL_22;
    }
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v34;
    uint64_t v6 = *MEMORY[0x263EFAE58];
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        dispatch_group_enter(v2);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        CFDateRef v28 = __MailAccountsDataSourceCommit_block_invoke;
        CFIndex v29 = &unk_264DC7058;
        CFDictionaryRef v31 = v2;
        uint64_t v32 = a1;
        CFStringRef v30 = v8;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "accountType"), "identifier"), "isEqualToString:", v6)&& objc_msgSend(v8, "aa_needsRegistration"))
        {
          if (DLShouldLog())
          {
            CFComparisonResult v23 = (UInt8 *)[v8 identifier];
            _DLLog();
          }
          if (!objc_msgSend(*(id *)(a1 + 176), "aa_primaryAppleAccount", v23)) {
            objc_msgSend(v8, "aa_setPrimaryAccount:", 1);
          }
          objc_msgSend(v8, "aa_setPrimaryEmailVerified:", 1);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "credential"), "password"), "length"))
          {
            uint64_t v9 = *(void **)(a1 + 176);
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __MailAccountsDataSourceCommit_block_invoke_3;
            v26[3] = &unk_264DC7080;
            v26[4] = v8;
            v26[5] = v27;
            objc_msgSend(v9, "aa_updatePropertiesForAppleAccount:completion:", v8, v26);
            goto LABEL_18;
          }
          [v8 setAuthenticated:0];
        }
        else if (DLShouldLog())
        {
          CFComparisonResult v23 = (UInt8 *)[v8 identifier];
          _DLLog();
        }
        v28((uint64_t)v27);
LABEL_18:
        ++v7;
      }
      while (v4 != v7);
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v4 = v10;
      if (!v10)
      {
LABEL_22:
        if (DLShouldLog()) {
          _DLLog();
        }
        dispatch_time_t v11 = dispatch_time(0, 120000000000);
        dispatch_group_wait(v2, v11);
        BOOL v12 = (const void *)CFCopyHomeDirectoryURLForUser();
        CFURLRef v13 = (const __CFURL *)MEMORY[0x23ECC0490](0, "Library/Mail/Accounts.plist.synced", 34, 0, v12);
        CFRelease(v12);
        CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v13);
        if (PathComponent)
        {
          CFURLRef v15 = PathComponent;
          if (CFURLGetFileSystemRepresentation(PathComponent, 1u, buffer, 1024))
          {
            CFStringRef v16 = CFStringCreateWithCString(0, (const char *)buffer, 0x8000100u);
            if (DLShouldLog())
            {
              CFComparisonResult v23 = (UInt8 *)v16;
              _DLLog();
            }
            if (v16)
            {
              DLEnsureDirectoryExists();
              CFRelease(v16);
            }
          }
          CFRelease(v15);
        }
        int v17 = CFURLGetFileSystemRepresentation(v13, 1u, buffer, 1024);
        if (v13) {
          CFRelease(v13);
        }
        if (v17)
        {
          int v18 = open((const char *)buffer, 512, 420);
          if (v18 < 0 && DLShouldLog())
          {
            CFDictionaryRef v19 = __error();
            CFComparisonResult v23 = buffer;
            uint64_t v24 = strerror(*v19);
            _DLLog();
          }
          close(v18);
        }
        else if (DLShouldLog())
        {
          CFComparisonResult v23 = 0;
          _DLLog();
        }
        if (DLShouldLog()) {
          _DLLog();
        }
        uint64_t v20 = objc_msgSend(@"~/Library/Mail/AutoFetchEnabled", "stringByExpandingTildeInPath", v23, v24);
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", v20, 0);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mail.AutoLaunchSettingsChanged", 0, 0, 0);
        return 0;
      }
    }
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  return 0;
}

uint64_t MailAccountsDataSourceRollback()
{
  return 0;
}

uint64_t MailAccountsDataSourceDeleteDataSource(id *a1)
{
  free(a1);
  return 0;
}

void *___bestiCloudUsernameFromEmails_block_invoke()
{
  uint64_t result = &unk_26EE1C578;
  _bestiCloudUsernameFromEmails_sAppleDomains = (uint64_t)result;
  return result;
}

uint64_t ___bestiCloudUsernameFromEmails_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = (void *)_bestiCloudUsernameFromEmails_sAppleDomains;
  uint64_t result = [(id)_bestiCloudUsernameFromEmails_sAppleDomains countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([a2 hasSuffix:*(void *)(*((void *)&v8 + 1) + 8 * v7)]) {
          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t ___bestiCloudUsernameFromEmails_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return -1;
  }
  uint64_t v6 = (void *)[a2 lowercaseString];
  uint64_t v7 = (void *)[a3 lowercaseString];
  if ([v6 isEqualToString:v7]) {
    return 0;
  }
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()
    || ![v6 hasPrefix:*(void *)(a1 + 32)])
  {
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()
      || ([v7 hasPrefix:*(void *)(a1 + 32)] & 1) == 0)
    {
      goto LABEL_13;
    }
    return 1;
  }
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()
    || ([v7 hasPrefix:*(void *)(a1 + 32)] & 1) == 0)
  {
    return -1;
  }
LABEL_13:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = (void *)_bestiCloudUsernameFromEmails_sAppleDomains;
  uint64_t v10 = [(id)_bestiCloudUsernameFromEmails_sAppleDomains countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    uint64_t v8 = 1;
LABEL_15:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
      int v15 = [v6 hasSuffix:v14];
      char v16 = [v7 hasSuffix:v14];
      if (v15) {
        break;
      }
      if (v16) {
        return v8;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_15;
        }
        return [v6 compare:v7];
      }
    }
    if ((v16 & 1) == 0) {
      return -1;
    }
  }
  return [v6 compare:v7];
}

void _processRecord_0(const __CFString *a1, void *a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  CleanUuid = (__CFString *)CreateCleanUuid(a1);
  int v6 = DLShouldLog();
  if (CleanUuid == a1)
  {
    if (!v6) {
      goto LABEL_7;
    }
    CFStringRef v35 = a1;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    CFStringRef v35 = a1;
    uint64_t v39 = CleanUuid;
  }
  _DLLog();
LABEL_7:
  if (DLShouldLog())
  {
    uint64_t v7 = (__CFString *)[a2 mutableCopy];
    [(__CFString *)v7 removeObjectForKey:@"__Password__"];
    if (DLShouldLog())
    {
      CFStringRef v35 = v7;
      _DLLog();
    }
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2)) {
    goto LABEL_12;
  }
  [*(id *)(a3 + 176) accountWithIdentifier:CleanUuid];
  uint64_t v10 = (void *)_ACAccountTypeForSyncAccountType([a2 objectForKey:@"AccountType"]);
  uint64_t v11 = (__CFString *)[a2 objectForKey:@"Username"];
  uint64_t v12 = *MEMORY[0x263EFAE58];
  if ([v10 isEqualToString:*MEMORY[0x263EFAE58]]) {
    uint64_t v11 = (__CFString *)_bestiCloudUsernameFromEmails(v11, (void *)[a2 objectForKey:@"EmailAddresses"]);
  }
  uint64_t v13 = _identityStringWithInfo(v10, v11, (__CFString *)objc_msgSend(a2, "objectForKey:", @"Hostname", v35, v39));
  if (DLShouldLog())
  {
    uint64_t v36 = v13;
    _DLLog();
  }
  if (v13)
  {
    uint64_t v14 = objc_msgSend(*(id *)(a3 + 176), "accountWithIdentifier:", objc_msgSend(*(id *)(a3 + 144), "objectForKey:", v13));
    if (v14)
    {
      int v15 = (void *)v14;
      if (DLShouldLog())
      {
        uint64_t v36 = [v15 identifier];
        _DLLog();
      }
      if (DLShouldLog())
      {
        uint64_t v36 = (uint64_t)CleanUuid;
        _DLLog();
      }
      uint64_t v16 = objc_msgSend(v15, "identifier", v36);
      if (!v16)
      {
        if (!DLShouldLog()) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      long long v9 = (void *)v16;
      int v17 = *(void **)(a3 + 168);
      if (!v17 || ![v17 containsObject:v9])
      {
        _addRemapping_0(a3, (uint64_t)CleanUuid, (uint64_t)v9);

        id v18 = v9;
LABEL_68:
        [v15 applySyncProperties:a2];
        long long v34 = (void *)[a2 objectForKey:@"__Password__"];
        if (v34) {
          objc_msgSend(v15, "setPasswordFromSync:", objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v34, "bytes")));
        }
        [*(id *)(a3 + 152) addObject:v15];
        goto LABEL_71;
      }
      if (DLShouldLog()) {
LABEL_30:
      }
        _DLLog();
    }
  }
LABEL_31:
  long long v19 = objc_msgSend(a2, "objectForKey:", @"AccountType", v36);
  if (v19)
  {
    uint64_t v20 = (uint64_t)v19;
    if ([v19 isEqualToString:@"iToolsAccount"]
      && (long long v21 = (void *)[a2 objectForKey:@"AuthenticationScheme"]) != 0
      && ![v21 length])
    {
      if (!DLShouldLog()) {
        goto LABEL_12;
      }
    }
    else
    {
      CFDictionaryRef v22 = (void *)_ACAccountTypeForSyncAccountType(v20);
      uint64_t v23 = [*(id *)(a3 + 176) accountTypeWithAccountTypeIdentifier:v22];
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        if (DLShouldLog())
        {
          uint64_t v37 = v22;
          _DLLog();
        }
        if (objc_msgSend(v22, "isEqualToString:", v12, v37))
        {
          uint64_t v25 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v24];
        }
        else
        {
          uint64_t v45 = 0;
          if (_syncAccountLoader_onceToken != -1) {
            dispatch_once(&_syncAccountLoader_onceToken, &__block_literal_global_185);
          }
          CFArrayRef v26 = (void *)[(id)_syncAccountLoader_sSyncAccountLoader accountWithAccountTypeIdentifier:v22 error:&v45];
          if (v45)
          {
            if (DLShouldLog())
            {
              uint64_t v38 = v45;
              _DLLog();
            }
            int v15 = 0;
LABEL_57:
            if (v15)
            {
              objc_msgSend(v15, "setAccountProperty:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 0xFFFFFFFFLL), @"NumberOfDaysToKeepTrash");
              CFArrayRef v27 = (void *)[v24 supportedDataclasses];
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v29; ++i)
                  {
                    if (*(void *)v42 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    objc_msgSend(v15, "setProvisioned:forDataclass:", 1, *(void *)(*((void *)&v41 + 1) + 8 * i), v38);
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
                }
                while (v29);
              }
              uint64_t v32 = objc_msgSend(v24, "supportedDataclasses", v38);
              uint64_t v33 = *MEMORY[0x263EFB438];
              if ([v32 containsObject:*MEMORY[0x263EFB438]]) {
                [v15 setEnabled:1 forDataclass:v33];
              }
              objc_msgSend(v15, "aa_setSyncedAccount:", 1);
              _addRemapping_0(a3, [v15 identifier], (uint64_t)CleanUuid);
              long long v9 = CleanUuid;
              goto LABEL_68;
            }
LABEL_12:
            long long v9 = CleanUuid;
LABEL_71:

            return;
          }
          uint64_t v25 = [v26 persistentAccount];
        }
        int v15 = (void *)v25;
        goto LABEL_57;
      }
      if (!DLShouldLog()) {
        goto LABEL_12;
      }
    }
    _DLLog();
    goto LABEL_12;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
}

uint64_t _addRemapping_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 160)) {
    *(void *)(a1 + 160) = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  if (!*(void *)(a1 + 168)) {
    *(void *)(a1 + 168) = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  if (DLShouldLog())
  {
    uint64_t v8 = a2;
    uint64_t v9 = a3;
    _DLLog();
  }
  objc_msgSend(*(id *)(a1 + 160), "setObject:forKey:", a3, a2, v8, v9);
  int v6 = *(void **)(a1 + 168);
  return [v6 addObject:a3];
}

uint64_t _ACAccountTypeForSyncAccountType(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (_ACAccountTypeForSyncAccountType_onceToken != -1) {
      dispatch_once(&_ACAccountTypeForSyncAccountType_onceToken, &__block_literal_global_164);
    }
    CFAllocatorRef v2 = (void *)_ACAccountTypeForSyncAccountType_accountTypeForAccountClass;
    return [v2 objectForKey:v1];
  }
  return result;
}

objc_class *___syncAccountLoader_block_invoke()
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", @"/System/Library/PrivateFrameworks/Message.framework")), "load") & 1) == 0)___syncAccountLoader_block_invoke_cold_1(); {
  uint64_t result = NSClassFromString(&cfstr_Mfaccountloade.isa);
  }
  _syncAccountLoader_sSyncAccountLoader = (uint64_t)result;
  return result;
}

uint64_t __MailAccountsDataSourceCommit_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 48) + 176);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __MailAccountsDataSourceCommit_block_invoke_2;
  v3[3] = &unk_264DC7030;
  return [v1 saveVerifiedAccount:*(void *)(a1 + 32) withCompletionHandler:v3];
}

void __MailAccountsDataSourceCommit_block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!DLShouldLog()) {
      goto LABEL_6;
    }
  }
  else if (!DLShouldLog())
  {
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) identifier];
  _DLLog();
LABEL_6:
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __MailAccountsDataSourceCommit_block_invoke_3(uint64_t a1)
{
  if (DLShouldLog())
  {
    [*(id *)(a1 + 32) identifier];
    _DLLog();
  }
  CFAllocatorRef v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void ___calendarSyncAccountLoader_block_invoke_cold_1()
{
}

void ___syncAccountLoader_block_invoke_cold_1()
{
}

uint64_t ABAccountCreate()
{
  return MEMORY[0x270F0B378]();
}

uint64_t ABAccountSetIdentifier()
{
  return MEMORY[0x270F0B380]();
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x270F0B388](addressBook, record, error);
}

CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x270F0B3A0](addressBook, source);
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x270F0B3B0](addressBook, source);
}

uint64_t ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources()
{
  return MEMORY[0x270F0B3C8]();
}

uint64_t ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier()
{
  return MEMORY[0x270F0B3D0]();
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  return (ABRecordRef)MEMORY[0x270F0B3E0](addressBook);
}

uint64_t ABAddressBookCopyLocalSource()
{
  return MEMORY[0x270F0B3E8]();
}

uint64_t ABAddressBookCopySourceWithAccountAndExternalIdentifiers()
{
  return MEMORY[0x270F0B418]();
}

uint64_t ABAddressBookCopyValue()
{
  return MEMORY[0x270F0B428]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x270F0B438](options, error);
}

ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x270F0B440](addressBook, *(void *)&recordID);
}

uint64_t ABAddressBookGetPersonCountInSource()
{
  return MEMORY[0x270F0B450]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x270F0B458](addressBook, *(void *)&recordID);
}

uint64_t ABAddressBookMoveAllRecordsInSourceToSource()
{
  return MEMORY[0x270F0B470]();
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x270F0B478]();
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x270F0B490](addressBook, record, error);
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  return MEMORY[0x270F0B4A0](addressBook, error);
}

uint64_t ABAddressBookSetAccountForSource()
{
  return MEMORY[0x270F0B4A8]();
}

uint64_t ABAddressBookSetDefaultSource()
{
  return MEMORY[0x270F0B4B0]();
}

uint64_t ABAddressBookSetIsBackgroundProcess()
{
  return MEMORY[0x270F0B4B8]();
}

uint64_t ABAddressBookSetValue()
{
  return MEMORY[0x270F0B4C0]();
}

uint64_t ABChangeHistoryClearChangesUpToSequenceNumberForClient()
{
  return MEMORY[0x270F0B4D0]();
}

uint64_t ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient()
{
  return MEMORY[0x270F0B4E0]();
}

uint64_t ABChangeHistoryRegisterClientForSource()
{
  return MEMORY[0x270F0B4E8]();
}

uint64_t ABChangeHistorySetAddressBookClientIdentifier()
{
  return MEMORY[0x270F0B4F0]();
}

uint64_t ABChangeHistoryUnregisterClientForSource()
{
  return MEMORY[0x270F0B4F8]();
}

BOOL ABGroupAddMember(ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  return MEMORY[0x270F0B510](group, person, error);
}

uint64_t ABGroupAddSubgroup()
{
  return MEMORY[0x270F0B518]();
}

uint64_t ABGroupCopyArrayOfAllMembersAndSubgroups()
{
  return MEMORY[0x270F0B528]();
}

ABRecordRef ABGroupCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x270F0B538](source);
}

BOOL ABGroupRemoveMember(ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  return MEMORY[0x270F0B540](group, member, error);
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  return MEMORY[0x270F0B548](multiValue, value, label, outIdentifier);
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x270F0B558](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x270F0B560](multiValue, index);
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  return (ABMutableMultiValueRef)MEMORY[0x270F0B568](*(void *)&type);
}

ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef multiValue)
{
  return (ABMutableMultiValueRef)MEMORY[0x270F0B570](multiValue);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x270F0B578](multiValue);
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x270F0B580](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x270F0B588](multiValue, *(void *)&identifier);
}

BOOL ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x270F0B590](multiValue, index);
}

BOOL ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef multiValue, CFStringRef label, CFIndex index)
{
  return MEMORY[0x270F0B598](multiValue, label, index);
}

BOOL ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFIndex index)
{
  return MEMORY[0x270F0B5A0](multiValue, value, index);
}

uint64_t ABMultiValueSetImmutable()
{
  return MEMORY[0x270F0B5A8]();
}

uint64_t ABPersonCopyCompositeName()
{
  return MEMORY[0x270F0B5B8]();
}

CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef person, ABPersonImageFormat format)
{
  return (CFDataRef)MEMORY[0x270F0B5C0](person, *(void *)&format);
}

uint64_t ABPersonCopySoundIdentifierForMultiValueIdentifier()
{
  return MEMORY[0x270F0B5D8]();
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x270F0B5E0](source);
}

BOOL ABPersonHasImageData(ABRecordRef person)
{
  return MEMORY[0x270F0B610](person);
}

BOOL ABPersonRemoveImageData(ABRecordRef person, CFErrorRef *error)
{
  return MEMORY[0x270F0B618](person, error);
}

BOOL ABPersonSetImageData(ABRecordRef person, CFDataRef imageData, CFErrorRef *error)
{
  return MEMORY[0x270F0B620](person, imageData, error);
}

uint64_t ABPersonSetImageDataAndCropRect()
{
  return MEMORY[0x270F0B628]();
}

uint64_t ABPersonSetSoundIdentifierForMultiValueIdentifier()
{
  return MEMORY[0x270F0B640]();
}

uint64_t ABProcessAddedImages()
{
  return MEMORY[0x270F0B648]();
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x270F0B658](record, *(void *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x270F0B670](record);
}

ABRecordType ABRecordGetRecordType(ABRecordRef record)
{
  return MEMORY[0x270F0B678](record);
}

BOOL ABRecordRemoveValue(ABRecordRef record, ABPropertyID property, CFErrorRef *error)
{
  return MEMORY[0x270F0B680](record, *(void *)&property, error);
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x270F0B688](record, *(void *)&property, value, error);
}

uint64_t ABSourceCreate()
{
  return MEMORY[0x270F0B690]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x270EE4798]();
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE52D8](tz, at);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E0]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52F0](allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return (CFStringRef)MEMORY[0x270EE5300](tz);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  MEMORY[0x270EE5308](tz, at);
  return result;
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53C8](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE53D8](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x270F0CDE8]();
}

uint64_t CalAlarmCopyOwningEntity()
{
  return MEMORY[0x270F135A8]();
}

uint64_t CalAlarmGetTriggerDate()
{
  return MEMORY[0x270F135B0]();
}

uint64_t CalAlarmGetTriggerInterval()
{
  return MEMORY[0x270F135B8]();
}

uint64_t CalAlarmGetType()
{
  return MEMORY[0x270F135C0]();
}

uint64_t CalAlarmGetUID()
{
  return MEMORY[0x270F135C8]();
}

uint64_t CalAlarmSetTriggerDate()
{
  return MEMORY[0x270F135D8]();
}

uint64_t CalAlarmSetTriggerInterval()
{
  return MEMORY[0x270F135E0]();
}

uint64_t CalAlarmSetType()
{
  return MEMORY[0x270F135E8]();
}

uint64_t CalAttendeeCopyDisplayName()
{
  return MEMORY[0x270F13688]();
}

uint64_t CalAttendeeCopyEmailAddress()
{
  return MEMORY[0x270F13690]();
}

uint64_t CalAttendeeCopyOwningEvent()
{
  return MEMORY[0x270F136A8]();
}

uint64_t CalAttendeeGetRole()
{
  return MEMORY[0x270F136C8]();
}

uint64_t CalAttendeeGetStatus()
{
  return MEMORY[0x270F136D0]();
}

uint64_t CalAttendeeGetType()
{
  return MEMORY[0x270F136D8]();
}

uint64_t CalAttendeeGetUID()
{
  return MEMORY[0x270F136E0]();
}

uint64_t CalAttendeeSetDisplayName()
{
  return MEMORY[0x270F136E8]();
}

uint64_t CalAttendeeSetEmailAddress()
{
  return MEMORY[0x270F136F0]();
}

uint64_t CalAttendeeSetRole()
{
  return MEMORY[0x270F13720]();
}

uint64_t CalAttendeeSetStatus()
{
  return MEMORY[0x270F13728]();
}

uint64_t CalAttendeeSetType()
{
  return MEMORY[0x270F13730]();
}

uint64_t CalCalendarAddEvent()
{
  return MEMORY[0x270F13740]();
}

uint64_t CalCalendarAddTask()
{
  return MEMORY[0x270F13748]();
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x270F13750]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x270F13838]();
}

uint64_t CalCalendarCopyType()
{
  return MEMORY[0x270F13840]();
}

uint64_t CalCalendarGetColorComponents()
{
  return MEMORY[0x270F13868]();
}

uint64_t CalCalendarGetSharingStatus()
{
  return MEMORY[0x270F13890]();
}

uint64_t CalCalendarGetUID()
{
  return MEMORY[0x270F138A8]();
}

uint64_t CalCalendarIsInbox()
{
  return MEMORY[0x270F138F0]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x270F13908]();
}

uint64_t CalCalendarIsReadOnly()
{
  return MEMORY[0x270F13910]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x270F13928]();
}

uint64_t CalCalendarItemAddAlarm()
{
  return MEMORY[0x270F13930]();
}

uint64_t CalCalendarItemCopyCalendar()
{
  return MEMORY[0x270F13978]();
}

uint64_t CalCalendarItemGetRowID()
{
  return MEMORY[0x270F13A18]();
}

uint64_t CalCalendarItemRemoveAlarm()
{
  return MEMORY[0x270F13A40]();
}

uint64_t CalCalendarItemSetEndTimeZone()
{
  return MEMORY[0x270F13AB0]();
}

uint64_t CalCalendarItemSetOrganizer()
{
  return MEMORY[0x270F13B28]();
}

uint64_t CalCalendarItemSetPriority()
{
  return MEMORY[0x270F13B30]();
}

uint64_t CalCalendarItemSetSummary()
{
  return MEMORY[0x270F13B50]();
}

uint64_t CalCalendarSetCanContainEntityType()
{
  return MEMORY[0x270F13B88]();
}

uint64_t CalCalendarSetColorComponents()
{
  return MEMORY[0x270F13B90]();
}

uint64_t CalCalendarSetDisplayOrder()
{
  return MEMORY[0x270F13BA8]();
}

uint64_t CalCalendarSetExternalID()
{
  return MEMORY[0x270F13BB8]();
}

uint64_t CalCalendarSetReadOnly()
{
  return MEMORY[0x270F13C60]();
}

uint64_t CalCalendarSetTitle()
{
  return MEMORY[0x270F13CE8]();
}

uint64_t CalCalendarSetType()
{
  return MEMORY[0x270F13CF0]();
}

uint64_t CalCopyDefaultTimeZone()
{
  return MEMORY[0x270F14980]();
}

uint64_t CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient()
{
  return MEMORY[0x270F13D20]();
}

uint64_t CalDatabaseCopyAlarmChangesInStore()
{
  return MEMORY[0x270F13D30]();
}

uint64_t CalDatabaseCopyAlarmWithUID()
{
  return MEMORY[0x270F13D38]();
}

uint64_t CalDatabaseCopyAttendeeChangesInStore()
{
  return MEMORY[0x270F13D78]();
}

uint64_t CalDatabaseCopyAttendeeWithUID()
{
  return MEMORY[0x270F13D80]();
}

uint64_t CalDatabaseCopyCalendarChangesInStore()
{
  return MEMORY[0x270F13D88]();
}

uint64_t CalDatabaseCopyCalendarItemWithRowID()
{
  return MEMORY[0x270F13DA8]();
}

uint64_t CalDatabaseCopyCalendarWithUID()
{
  return MEMORY[0x270F13DC8]();
}

uint64_t CalDatabaseCopyDefaultLocalCalendar()
{
  return MEMORY[0x270F13DD8]();
}

uint64_t CalDatabaseCopyEventChangesInStore()
{
  return MEMORY[0x270F13E10]();
}

uint64_t CalDatabaseCopyEventWithUID()
{
  return MEMORY[0x270F13E28]();
}

uint64_t CalDatabaseCopyLocalStore()
{
  return MEMORY[0x270F13E48]();
}

uint64_t CalDatabaseCopyOfAllAlarmsInStore()
{
  return MEMORY[0x270F13E70]();
}

uint64_t CalDatabaseCopyOfAllAttendeesInStore()
{
  return MEMORY[0x270F13E80]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStore()
{
  return MEMORY[0x270F13E88]();
}

uint64_t CalDatabaseCopyOfAllEventsInStore()
{
  return MEMORY[0x270F13EA0]();
}

uint64_t CalDatabaseCopyOfAllRecurrencesInStore()
{
  return MEMORY[0x270F13EA8]();
}

uint64_t CalDatabaseCopyProperty()
{
  return MEMORY[0x270F13EB8]();
}

uint64_t CalDatabaseCopyRecurrenceChangesInStore()
{
  return MEMORY[0x270F13EC0]();
}

uint64_t CalDatabaseCopyRecurrenceWithUID()
{
  return MEMORY[0x270F13EC8]();
}

uint64_t CalDatabaseCopyStoreWithExternalID()
{
  return MEMORY[0x270F13EE8]();
}

uint64_t CalDatabaseCopyStoreWithUID()
{
  return MEMORY[0x270F13EF0]();
}

uint64_t CalDatabaseCopyTaskChangesInStore()
{
  return MEMORY[0x270F13F00]();
}

uint64_t CalDatabaseCreateAlarm()
{
  return MEMORY[0x270F13F20]();
}

uint64_t CalDatabaseCreateAttendee()
{
  return MEMORY[0x270F13F30]();
}

uint64_t CalDatabaseCreateCalendarForEntityType()
{
  return MEMORY[0x270F13F40]();
}

uint64_t CalDatabaseCreateEvent()
{
  return MEMORY[0x270F13F50]();
}

uint64_t CalDatabaseCreateOrganizer()
{
  return MEMORY[0x270F13F68]();
}

uint64_t CalDatabaseCreateRecurrence()
{
  return MEMORY[0x270F13F70]();
}

uint64_t CalDatabaseCreateStore()
{
  return MEMORY[0x270F13F80]();
}

uint64_t CalDatabaseCreateTask()
{
  return MEMORY[0x270F13F88]();
}

uint64_t CalDatabaseCreateWithOptions()
{
  return MEMORY[0x270F13FA0]();
}

uint64_t CalDatabaseGetCountOfCalendarItemsInStore()
{
  return MEMORY[0x270F13FC8]();
}

uint64_t CalDatabaseGetCountOfEventsInStore()
{
  return MEMORY[0x270F13FD0]();
}

uint64_t CalDatabaseGetCountOfTasksInStore()
{
  return MEMORY[0x270F13FD8]();
}

uint64_t CalDatabaseMigrateCalendarsWithEntityType()
{
  return MEMORY[0x270F13FE8]();
}

uint64_t CalDatabaseProcessAddedRecords()
{
  return MEMORY[0x270F13FF0]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTrackingInStore()
{
  return MEMORY[0x270F13FF8]();
}

uint64_t CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType()
{
  return MEMORY[0x270F14008]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x270F14018]();
}

uint64_t CalDatabaseSaveAndFlushCaches()
{
  return MEMORY[0x270F14020]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x270F14030]();
}

uint64_t CalDatabaseSetProperty()
{
  return MEMORY[0x270F14038]();
}

uint64_t CalDatabaseWaitForSpotlight()
{
  return MEMORY[0x270F14050]();
}

uint64_t CalDateTimeRelease()
{
  return MEMORY[0x270F14998]();
}

uint64_t CalEntityGetType()
{
  return MEMORY[0x270F14070]();
}

uint64_t CalEventAddAttendee()
{
  return MEMORY[0x270F140E0]();
}

uint64_t CalEventAddExceptionDate()
{
  return MEMORY[0x270F140F8]();
}

uint64_t CalEventAddRecurrenceDirectly()
{
  return MEMORY[0x270F14108]();
}

uint64_t CalEventCopyCalendar()
{
  return MEMORY[0x270F14118]();
}

uint64_t CalEventCopyDescription()
{
  return MEMORY[0x270F14120]();
}

uint64_t CalEventCopyLocation_Deprecated()
{
  return MEMORY[0x270F14140]();
}

uint64_t CalEventCopyNonDetachedExceptionDates()
{
  return MEMORY[0x270F14150]();
}

uint64_t CalEventCopyOrganizer()
{
  return MEMORY[0x270F14158]();
}

uint64_t CalEventCopyOriginalEvent()
{
  return MEMORY[0x270F14160]();
}

uint64_t CalEventCopyStartDate()
{
  return MEMORY[0x270F14178]();
}

uint64_t CalEventCopySummary()
{
  return MEMORY[0x270F14180]();
}

uint64_t CalEventCopyURL()
{
  return MEMORY[0x270F14188]();
}

uint64_t CalEventGetEndDate()
{
  return MEMORY[0x270F141A8]();
}

uint64_t CalEventGetOriginalStartDate()
{
  return MEMORY[0x270F141D8]();
}

uint64_t CalEventGetUID()
{
  return MEMORY[0x270F14208]();
}

uint64_t CalEventIsAllDay()
{
  return MEMORY[0x270F14210]();
}

uint64_t CalEventRemoveAttendee()
{
  return MEMORY[0x270F14248]();
}

uint64_t CalEventRemoveRecurrenceDirectly()
{
  return MEMORY[0x270F14260]();
}

uint64_t CalEventSetAllDay()
{
  return MEMORY[0x270F14268]();
}

uint64_t CalEventSetDescription()
{
  return MEMORY[0x270F14278]();
}

uint64_t CalEventSetEndDate()
{
  return MEMORY[0x270F14288]();
}

uint64_t CalEventSetLocation_Deprecated()
{
  return MEMORY[0x270F142B0]();
}

uint64_t CalEventSetNonDetachedExceptionDates()
{
  return MEMORY[0x270F142C0]();
}

uint64_t CalEventSetOrganizer()
{
  return MEMORY[0x270F142C8]();
}

uint64_t CalEventSetOriginalEvent()
{
  return MEMORY[0x270F142D0]();
}

uint64_t CalEventSetOriginalStartDate()
{
  return MEMORY[0x270F142D8]();
}

uint64_t CalEventSetStartDateDirectly()
{
  return MEMORY[0x270F142F8]();
}

uint64_t CalEventSetSummary()
{
  return MEMORY[0x270F14300]();
}

uint64_t CalEventSetURL()
{
  return MEMORY[0x270F14308]();
}

uint64_t CalOrganizerCopyDisplayName()
{
  return MEMORY[0x270F14380]();
}

uint64_t CalOrganizerCopyEmailAddress()
{
  return MEMORY[0x270F14388]();
}

uint64_t CalOrganizerSetDisplayName()
{
  return MEMORY[0x270F14390]();
}

uint64_t CalOrganizerSetEmailAddress()
{
  return MEMORY[0x270F14398]();
}

uint64_t CalOrganizerSetIsSelf()
{
  return MEMORY[0x270F143A0]();
}

uint64_t CalRecurrenceCopyByDayDays()
{
  return MEMORY[0x270F143D0]();
}

uint64_t CalRecurrenceCopyByMonthDayDays()
{
  return MEMORY[0x270F143D8]();
}

uint64_t CalRecurrenceCopyBySetPos()
{
  return MEMORY[0x270F143E0]();
}

uint64_t CalRecurrenceCopyByWeekWeeks()
{
  return MEMORY[0x270F143E8]();
}

uint64_t CalRecurrenceCopyByYearDayDays()
{
  return MEMORY[0x270F143F0]();
}

uint64_t CalRecurrenceCopyOwningEvent()
{
  return MEMORY[0x270F143F8]();
}

uint64_t CalRecurrenceGetByMonthMonths()
{
  return MEMORY[0x270F14400]();
}

uint64_t CalRecurrenceGetCount()
{
  return MEMORY[0x270F14408]();
}

uint64_t CalRecurrenceGetEndDate()
{
  return MEMORY[0x270F14410]();
}

uint64_t CalRecurrenceGetFrequency()
{
  return MEMORY[0x270F14418]();
}

uint64_t CalRecurrenceGetInterval()
{
  return MEMORY[0x270F14420]();
}

uint64_t CalRecurrenceGetUID()
{
  return MEMORY[0x270F14428]();
}

uint64_t CalRecurrenceGetWeekStartDirectly()
{
  return MEMORY[0x270F14438]();
}

uint64_t CalRecurrenceSetByDayDays()
{
  return MEMORY[0x270F14440]();
}

uint64_t CalRecurrenceSetByMonthDayDays()
{
  return MEMORY[0x270F14448]();
}

uint64_t CalRecurrenceSetByMonthMonths()
{
  return MEMORY[0x270F14450]();
}

uint64_t CalRecurrenceSetBySetPos()
{
  return MEMORY[0x270F14458]();
}

uint64_t CalRecurrenceSetByWeekWeeks()
{
  return MEMORY[0x270F14460]();
}

uint64_t CalRecurrenceSetByYearDayDays()
{
  return MEMORY[0x270F14468]();
}

uint64_t CalRecurrenceSetCount()
{
  return MEMORY[0x270F14470]();
}

uint64_t CalRecurrenceSetEndDate()
{
  return MEMORY[0x270F14478]();
}

uint64_t CalRecurrenceSetFrequency()
{
  return MEMORY[0x270F14480]();
}

uint64_t CalRecurrenceSetInterval()
{
  return MEMORY[0x270F14488]();
}

uint64_t CalRecurrenceSetWeekStart()
{
  return MEMORY[0x270F14490]();
}

uint64_t CalRemoveCalendar()
{
  return MEMORY[0x270F14498]();
}

uint64_t CalRemoveEvent()
{
  return MEMORY[0x270F144A8]();
}

uint64_t CalRemoveStore()
{
  return MEMORY[0x270F144C8]();
}

uint64_t CalRemoveTask()
{
  return MEMORY[0x270F144D0]();
}

uint64_t CalStoreAddCalendar()
{
  return MEMORY[0x270F14548]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x270F14580]();
}

uint64_t CalStoreCopyExternalID()
{
  return MEMORY[0x270F145A0]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x270F14608]();
}

uint64_t CalStoreGetUID()
{
  return MEMORY[0x270F14610]();
}

uint64_t CalStoreMigrateToStore()
{
  return MEMORY[0x270F14628]();
}

uint64_t CalStoreSetAllowsEvents()
{
  return MEMORY[0x270F146A0]();
}

uint64_t CalStoreSetExternalID()
{
  return MEMORY[0x270F146F8]();
}

uint64_t CalStoreSetName()
{
  return MEMORY[0x270F14710]();
}

uint64_t CalStoreSetType()
{
  return MEMORY[0x270F14850]();
}

uint64_t CalTaskSetCompletionDate()
{
  return MEMORY[0x270F14938]();
}

uint64_t CalTaskSetDueDate()
{
  return MEMORY[0x270F14940]();
}

uint64_t DLEnsureDirectoryExists()
{
  return MEMORY[0x270F4ADA0]();
}

uint64_t DLMemoryPoolAddObject()
{
  return MEMORY[0x270F4ADA8]();
}

uint64_t DLMemoryPoolCreate()
{
  return MEMORY[0x270F4ADB0]();
}

uint64_t DLShouldLog()
{
  return MEMORY[0x270F4ADC0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t _DLLog()
{
  return MEMORY[0x270F4ADC8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}
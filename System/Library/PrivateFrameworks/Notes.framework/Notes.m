id NoteContextManagedObjectModelPath()
{
  void *v0;
  void *v1;
  uint64_t vars8;

  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"NotesModel" ofType:@"momd"];

  return v1;
}

void sub_1CFDA6094(_Unwind_Exception *a1)
{
}

void sub_1CFDA6FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36)
{
  objc_sync_exit(v36);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1CFDA7AA0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1CFDA7A1CLL);
  }
  _Unwind_Resume(exception_object);
}

id NoteContextPersistentStorePath()
{
  v0 = NoteContextRootDirectoryPath();
  v1 = [v0 stringByAppendingPathComponent:@"notes.sqlite"];

  return v1;
}

id NoteContextRootDirectoryPath()
{
  if (s_testsNotesRootPath) {
    id v0 = (id)s_testsNotesRootPath;
  }
  else {
    id v0 = (id)NoteStoreCopyRootPath();
  }
  return v0;
}

__CFString *_NoteStoreCopyPath()
{
  id v0 = _NoteStoreCopyRootPath();
  v1 = v0;
  if (v0)
  {
    if (_testingFilePrefix)
    {
      CFStringAppend(v0, (CFStringRef)_testingFilePrefix);
      CFStringRef v2 = @".db";
    }
    else
    {
      CFStringRef v2 = @"notes.db";
    }
    CFStringAppend(v1, v2);
  }
  return v1;
}

__CFString *_NoteStoreCopyRootPath()
{
  CFStringRef v0 = (const __CFString *)CPSharedResourcesDirectory();
  if (!v0) {
    return 0;
  }
  MutableCopy = CFStringCreateMutableCopy(0, 0, v0);
  CFStringAppend(MutableCopy, @"/Library/Notes/");
  CPFileBuildDirectoriesToPath();
  return MutableCopy;
}

void sub_1CFDA8224(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  if (a2)
  {
    objc_end_catch();
    if (a2 == 2)
    {
      id v17 = objc_begin_catch(a1);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [v17 name];
        int v19 = [v18 isEqualToString:@"NoteStoreHasMismatchedNoteBodies"];

        if (v19)
        {
          v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            -[NoteContext handleMigration]();
          }

          v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          a14 = 0;
          char v22 = [v21 removeItemAtPath:a11 error:&a14];
          id v23 = a14;

          if ((v22 & 1) == 0)
          {
            v24 = os_log_create("com.apple.notes", "HTML");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              [v23 userInfo];
              objc_claimAutoreleasedReturnValue();
              -[NoteContext handleMigration]();
            }
          }
          [v14 invalidate];

          objc_end_catch();
          JUMPOUT(0x1CFDA81B4);
        }
      }
      objc_exception_rethrow();
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1CFDA83EC(_Unwind_Exception *a1)
{
}

void sub_1CFDA83F8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1CFDA8404);
}

uint64_t __ReceiveNotification(int a1, void *a2, CFTypeRef cf1)
{
  BOOL v4 = CFEqual(cf1, @"NoteContextDarwinNotificationWithLoggedChanges") != 0;
  return [a2 receiveDarwinNotificationWithChangeLogging:v4];
}

void sub_1CFDAD964(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1CFDAD8CCLL);
  }
  _Unwind_Resume(exception_object);
}

id NoteContextIndexPath()
{
  CFStringRef v0 = NoteContextRootDirectoryPath();
  v1 = [v0 stringByAppendingPathComponent:@"notes.idx"];

  return v1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1CFDB1A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E686E080;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    CFStringRef v2 = (void *)v4[0];
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CFStringRef v2 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t NoteGetTitle()
{
  return CPRecordGetProperty();
}

uint64_t NoteGetContent()
{
  return CPRecordGetProperty();
}

BOOL NoteGetContainsCJK()
{
  return CPRecordGetProperty() != 0;
}

double NoteGetCreationDate()
{
  return (double)(int)CPRecordGetProperty();
}

double NoteGetModificationDate()
{
  return (double)(int)CPRecordGetProperty();
}

uint64_t NoteGetAuthor()
{
  return CPRecordGetProperty();
}

BOOL NoteGetContentIsPlain()
{
  return CPRecordGetProperty() == 1;
}

void sub_1CFDB282C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1CFDB25A8);
  }
  _Unwind_Resume(a1);
}

void sub_1CFDB2F84(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Block_object_dispose(&v2, 8);
  _Unwind_Resume(a1);
}

void sub_1CFDB2F90()
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1CFDB405C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFDB4228(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFDB4364(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFDB445C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACUILocalizationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccountsUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccountsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E686E0F8;
    uint64_t v6 = 0;
    AccountsUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AccountsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ACUILocalization");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getACUILocalizationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getACUILocalizationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccountsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccountsUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1CFDB54B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id NoteAttachmentObjectDataBasePath(void *a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = [v3 managedObjectContext];
  v10[0] = v3;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  int v6 = [v4 obtainPermanentIDsForObjects:v5 error:a2];

  if (v6)
  {
    uint64_t v7 = [v3 objectID];
    v8 = +[NoteAttachmentObject attachmentDirectoryPathForAttachmentObjectID:v7 error:a2];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id NoteAttachmentObjectDataPath(void *a1, uint64_t a2)
{
  id v3 = a1;
  BOOL v4 = NoteAttachmentObjectDataBasePath(v3, a2);
  if (v4)
  {
    long long v5 = [v3 valueForKey:@"filename"];
    if (![(__CFString *)v5 length])
    {

      long long v5 = @"attachmentFile";
    }
    int v6 = [v4 stringByAppendingPathComponent:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

uint64_t DataWritingOptionForFileProtectionOption(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (DataWritingOptionForFileProtectionOption_onceToken != -1) {
      dispatch_once(&DataWritingOptionForFileProtectionOption_onceToken, &__block_literal_global_2);
    }
    uint64_t v2 = [(id)DataWritingOptionForFileProtectionOption_s_mappings objectForKeyedSubscript:v1];
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __DataWritingOptionForFileProtectionOption_block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F28340];
  v4[0] = *MEMORY[0x1E4F28378];
  v4[1] = v0;
  v5[0] = &unk_1F2679988;
  v5[1] = &unk_1F26799A0;
  uint64_t v1 = *MEMORY[0x1E4F28358];
  v4[2] = *MEMORY[0x1E4F28348];
  v4[3] = v1;
  v5[2] = &unk_1F26799B8;
  v5[3] = &unk_1F26799D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v3 = (void *)DataWritingOptionForFileProtectionOption_s_mappings;
  DataWritingOptionForFileProtectionOption_s_mappings = v2;
}

id NoteAttachmentObjectDataBasePathBetween12A173And12A189()
{
  uint64_t v0 = NoteContextRootDirectoryPath();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"attachments"];

  return v1;
}

id NoteAttachmentObjectDataPathBetween12A173And12A189(void *a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = [v3 managedObjectContext];
  v13[0] = v3;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  LODWORD(a2) = [v4 obtainPermanentIDsForObjects:v5 error:a2];

  if (a2)
  {
    int v6 = [v3 objectID];
    uint64_t v7 = [v6 URIRepresentation];
    v8 = [v7 absoluteString];

    uint64_t v9 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, 0, @"/", 0x8000100u);
    uint64_t v10 = NoteAttachmentObjectDataBasePathBetween12A173And12A189();
    v11 = [v10 stringByAppendingPathComponent:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1CFDB7968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t NoteStoreGetSharedNoteStore()
{
  uint64_t v0 = __SharedNoteStore;
  if (!__SharedNoteStore)
  {
    uint64_t v1 = _NoteStoreCopyPath();
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v0 = CPRecordStoreCreateWithPath();
      CFRelease(v2);
      CPRecordStoreLogChanges();
      CPRecordStoreSetSetupHandler();
      CPRecordStoreGetDatabase();
      CPSqliteDatabaseSetMigrationHandlers();
      CPSqliteDatabaseSetVersion();
    }
    else
    {
      uint64_t v0 = 0;
    }
    __SharedNoteStore = v0;
  }
  return v0;
}

uint64_t NoteStoreCopyAllNotes(uint64_t a1)
{
  return MEMORY[0x1F41094B0](a1, NoteClass, @"ORDER BY modification_date DESC");
}

uint64_t NoteStoreCopyProperty()
{
  return MEMORY[0x1F41094E8]();
}

void __LoadContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = CPSqliteConnectionStatementForSQL();
  if (v4)
  {
    long long v5 = *(sqlite3_stmt **)(v4 + 8);
    int ID = CPRecordGetID();
    sqlite3_bind_int(v5, 1, ID);
    LODWORD(v5) = CPSqliteStatementIntegerResult();
    CPSqliteStatementReset();
    ppBlob = 0;
    if (sqlite3_blob_open(*(sqlite3 **)(a3 + 8), "main", "note_bodies", "data", (int)v5, 0, &ppBlob))
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NoteStoreHasMismatchedNoteBodies" reason:@"Couldn't find the note body for a note" userInfo:0];
      objc_exception_throw(v17);
    }
    uint64_t v7 = malloc_type_calloc(1uLL, 0x4000uLL, 0x5059AC01uLL);
    int v8 = sqlite3_blob_bytes(ppBlob);
    CFAllocatorRef v9 = (const __CFAllocator *)MFGetMappedAllocator();
    CFIndex v10 = v8;
    Mutable = CFDataCreateMutable(v9, v8);
    if (v8 >= 1)
    {
      int v12 = 0;
      do
      {
        if ((int)v10 - v12 >= 0x4000) {
          int v13 = 0x4000;
        }
        else {
          int v13 = v10 - v12;
        }
        if (sqlite3_blob_read(ppBlob, v7, v13, v12)) {
          __LoadContent_cold_2();
        }
        v12 += v13;
        CFDataAppendBytes(Mutable, (const UInt8 *)v7, v13);
      }
      while (v12 < (int)v10);
    }
    free(v7);
    CFAllocatorRef v14 = (const __CFAllocator *)MFGetMappedAllocator();
    BytePtr = CFDataGetBytePtr(Mutable);
    CFStringRef v16 = CFStringCreateWithBytes(v14, BytePtr, v10, 0x8000100u, 0);
    CFRelease(Mutable);
    if (sqlite3_blob_close(ppBlob)) {
      __LoadContent_cold_1();
    }
    CPSqliteDatabaseReleaseSqliteConnection();
    if (v16)
    {
      CPRecordInitializeProperty();
      CFRelease(v16);
    }
  }
}

void __SaveContent()
{
  uint64_t v0 = CPSqliteConnectionStatementForSQL();
  if (!v0) {
    return;
  }
  uint64_t v1 = *(sqlite3_stmt **)(v0 + 8);
  int ID = CPRecordGetID();
  sqlite3_bind_int(v1, 1, ID);
  LODWORD(v1) = CPSqliteStatementPerform();
  CPSqliteStatementReset();
  if (v1 != 100) {
    return;
  }
  uint64_t v3 = CPSqliteConnectionStatementForSQL();
  if (!v3) {
    return;
  }
  uint64_t v4 = v3;
  CFStringRef Property = (const __CFString *)CPRecordGetProperty();
  CStringPtr = CFStringGetCStringPtr(Property, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v7 = (char *)CStringPtr;
    int v8 = 0;
LABEL_6:
    CFAllocatorRef v9 = *(sqlite3_stmt **)(v4 + 8);
    int v10 = CPRecordGetID();
    sqlite3_bind_int(v9, 1, v10);
    sqlite3_bind_text(*(sqlite3_stmt **)(v4 + 8), 2, v7, -1, 0);
    uint64_t v7 = v8;
    goto LABEL_7;
  }
  CFIndex Length = CFStringGetLength(Property);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length + 1, 0x8000100u);
  uint64_t v7 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xC8A231FBuLL);
  if (v7)
  {
    int CString = CFStringGetCString(Property, v7, MaximumSizeForEncoding, 0x8000100u);
    int v8 = v7;
    if (CString == 1) {
      goto LABEL_6;
    }
  }
LABEL_7:
  CPSqliteStatementPerform();
  CPSqliteStatementReset();
  if (v7)
  {
    free(v7);
  }
}

uint64_t configureNotesDatabase()
{
  CPRecordStoreCreateTablesForClass();
  CPSqliteConnectionPerformSQL();
  return _CreateBodiesTrigger();
}

BOOL _migrationVersionChecker(uint64_t a1, uint64_t a2, int a3)
{
  return a3 == 4 || (a3 & 0xFFFFFFFE) == 2;
}

uint64_t _migrationHandler(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 4:
      goto LABEL_6;
    case 3:
      CPSqliteConnectionPerformSQL();
LABEL_6:
      _UpdateNoteTableWithCJK();
      goto LABEL_7;
    case 2:
      CPSqliteConnectionPerformSQL();
      CPRecordStoreCreateTablesForClass();
      CPSqliteConnectionPerformSQL();
      CPSqliteConnectionPerformSQL();
LABEL_7:
      _CreateBodiesTrigger();
      return 0;
  }
  return 1;
}

uint64_t _CreateBodiesTrigger()
{
  uint64_t result = CPSqliteConnectionStatementForSQL();
  if (result)
  {
    CPSqliteStatementPerform();
    return CPSqliteStatementReset();
  }
  return result;
}

uint64_t _UpdateNoteTableWithCJK()
{
  CPSqliteConnectionPerformSQL();
  CPRecordStoreCreateTablesForClass();
  CPSqliteConnectionPerformSQL();
  return CPSqliteConnectionPerformSQL();
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:](v0);
}

uint64_t __getACUILocalizationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1(v0);
}

void __LoadContent_cold_1()
{
  __assert_rtn("__LoadContent", "NoteStore.m", 165, "SQLITE_OK == err");
}

void __LoadContent_cold_2()
{
  __assert_rtn("__LoadContent", "NoteStore.m", 155, "SQLITE_OK == err");
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1F41092F8]();
}

uint64_t CPRecordGetID()
{
  return MEMORY[0x1F41093F8]();
}

uint64_t CPRecordGetProperty()
{
  return MEMORY[0x1F4109410]();
}

uint64_t CPRecordInitializeProperty()
{
  return MEMORY[0x1F4109438]();
}

uint64_t CPRecordStoreCreateTablesForClass()
{
  return MEMORY[0x1F4109528]();
}

uint64_t CPRecordStoreCreateWithPath()
{
  return MEMORY[0x1F4109530]();
}

uint64_t CPRecordStoreGetDatabase()
{
  return MEMORY[0x1F41095C0]();
}

uint64_t CPRecordStoreLogChanges()
{
  return MEMORY[0x1F4109618]();
}

uint64_t CPRecordStoreSetSetupHandler()
{
  return MEMORY[0x1F41096A0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CPSqliteConnectionPerformSQL()
{
  return MEMORY[0x1F4109730]();
}

uint64_t CPSqliteConnectionStatementForSQL()
{
  return MEMORY[0x1F4109760]();
}

uint64_t CPSqliteDatabaseReleaseSqliteConnection()
{
  return MEMORY[0x1F41097C8]();
}

uint64_t CPSqliteDatabaseSetMigrationHandlers()
{
  return MEMORY[0x1F4109828]();
}

uint64_t CPSqliteDatabaseSetVersion()
{
  return MEMORY[0x1F4109878]();
}

uint64_t CPSqliteStatementIntegerResult()
{
  return MEMORY[0x1F41098C8]();
}

uint64_t CPSqliteStatementPerform()
{
  return MEMORY[0x1F41098D0]();
}

uint64_t CPSqliteStatementReset()
{
  return MEMORY[0x1F41098E0]();
}

uint64_t ICCheckedDynamicCast()
{
  return MEMORY[0x1F4139C30]();
}

uint64_t ICCheckedProtocolCast()
{
  return MEMORY[0x1F4139C38]();
}

uint64_t ICDynamicCast()
{
  return MEMORY[0x1F4139C60]();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return MEMORY[0x1F4139DC0]();
}

uint64_t MFGetMappedAllocator()
{
  return MEMORY[0x1F412C0D8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_blob_bytes(sqlite3_blob *a1)
{
  return MEMORY[0x1F4182018](a1);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return MEMORY[0x1F4182020](a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return MEMORY[0x1F4182028](a1, zDb, zTable, zColumn, iRow, *(void *)&flags, ppBlob);
}

int sqlite3_blob_read(sqlite3_blob *a1, void *Z, int N, int iOffset)
{
  return MEMORY[0x1F4182030](a1, Z, *(void *)&N, *(void *)&iOffset);
}
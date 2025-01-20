void sub_21C045498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a55);
  _Unwind_Resume(a1);
}

void sub_21C045700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C045814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Unwind_Resume(a1);
}

void performBlockExclusively(void *a1)
{
  v1 = a1;
  if (performBlockExclusively(void({block_pointer})(void))::onceToken != -1) {
    dispatch_once(&performBlockExclusively(void({block_pointer})(void))::onceToken, &__block_literal_global_1830);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)performBlockExclusively(void({block_pointer})(void))::mutex, 0xFFFFFFFFFFFFFFFFLL);
  v1[2]();
  dispatch_semaphore_signal((dispatch_semaphore_t)performBlockExclusively(void({block_pointer})(void))::mutex);
}

void sub_21C0458C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C045A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id collectionTypeToDeviceIdentifierDictionary(void)
{
  {
    collectionTypeToDeviceIdentifierDictionary(void)::dictionary = [MEMORY[0x263EFF9A0] dictionary];
  }
  v0 = (void *)collectionTypeToDeviceIdentifierDictionary(void)::dictionary;
  return v0;
}

void sub_21C045D9C(_Unwind_Exception *a1)
{
}

void sub_21C046D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0471B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C047650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a32);

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(uint64_t this, sqlite3_stmt *a2)
{
  *(void *)this = &unk_26CC2DFE0;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 1;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

NSString *whereClauseWithAppendingINConditions(NSString *a1, NSString *a2, NSString *a3)
{
  v5 = a1;
  v6 = a2;
  v7 = a3;
  uint64_t v8 = [(NSString *)v6 length];
  uint64_t v9 = [(NSString *)v7 length];
  if (v8 && v9)
  {
    uint64_t v10 = [NSString stringWithFormat:@"(%@ AND %@) OR %@", v5, v7, v6];
LABEL_11:
    v13 = (NSString *)v10;

    v5 = v13;
    goto LABEL_12;
  }
  if (v8 && !v9)
  {
    v11 = @"(%@) OR %@";
    v12 = v6;
LABEL_10:
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v11, v5, v12);
    goto LABEL_11;
  }
  if (!v8 && v9)
  {
    v11 = @"(%@ AND %@)";
    v12 = v7;
    goto LABEL_10;
  }
LABEL_12:

  return v5;
}

void sub_21C04782C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0479E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id commaSeparatedIDStringForBookmarkIDs(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v2 length])
        {
          uint64_t v8 = [v7 stringValue];
          [v2 appendFormat:@",%@", v8];
        }
        else
        {
          uint64_t v8 = [v7 stringValue];
          [v2 appendString:v8];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

void sub_21C047BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C047D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C047FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C048114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0483D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_21C0492E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0495F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::executeSQL(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *a2, NSString *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = (sqlite3 *)[(sqlite3 *)v4 UTF8String];
  uint64_t v7 = WebBookmarks::BookmarkSQLStatement::executeSQL(this, v5, v6);

  return v7;
}

void sub_21C04965C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04A070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

uint64_t bindAttributesToSQLStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  v11[4] = *(id *)MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    sqlite3_bind_null(a1, a2);
LABEL_9:
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x21D4A0FE0]();
  v11[0] = 0;
  uint64_t v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v5 format:200 options:0 error:v11];
  id v8 = v11[0];
  if (v7)
  {
    sqlite3_bind_blob(a1, a2, (const void *)[ (id) v7 bytes], objc_msgSend( (id) v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "wb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      bindAttributesToSQLStatement_cold_1();
    }
  }
  if (v7) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

void sub_21C04A674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04A82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04A958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04AB10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C04B000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C04B1AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::selectInt(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *zSql, const char *a3)
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, this, (const char *)zSql);
  if (v7 && sqlite3_step(v6) == 100) {
    uint64_t v3 = sqlite3_column_int(v6, 0);
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

void sub_21C04B248(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::executeSQL(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *zSql, const char *a3)
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, this, (const char *)zSql);
  if (v7)
  {
    sqlite3_step(pStmt);
    if (v8)
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
    else
    {
      char v8 = 1;
      uint64_t v3 = sqlite3_finalize(pStmt);
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

void sub_21C04B2DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement(WebBookmarks::BookmarkSQLStatement *this)
{
  *(void *)this = &unk_26CC2DFE0;
  if (!*((unsigned char *)this + 17))
  {
    *((unsigned char *)this + 17) = 1;
    sqlite3_finalize(*((sqlite3_stmt **)this + 1));
  }
}

{
  uint64_t vars8;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement(this);
  JUMPOUT(0x21D4A0CE0);
}

WebBookmarks::BookmarkSQLStatement *WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *db, const char *zSql)
{
  *(void *)this = &unk_26CC2DFE0;
  *((unsigned char *)this + 17) = 0;
  int v4 = sqlite3_prepare_v2(db, zSql, -1, (sqlite3_stmt **)this + 1, 0);
  *((unsigned char *)this + 16) = v4 == 0;
  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v4, v5);
    }
  }
  *((_DWORD *)this + 5) = v4;
  return this;
}

void sub_21C04B694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::finalize(WebBookmarks::BookmarkSQLStatement *this)
{
  if (*((unsigned char *)this + 17)) {
    return 0xFFFFFFFFLL;
  }
  *((unsigned char *)this + 17) = 1;
  return sqlite3_finalize(*((sqlite3_stmt **)this + 1));
}

void sub_21C04B7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04B858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04B8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04BC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::selectInt(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *a2, NSString *a3)
{
  int v4 = a2;
  id v5 = (sqlite3 *)[(sqlite3 *)v4 UTF8String];
  uint64_t v7 = WebBookmarks::BookmarkSQLStatement::selectInt(this, v5, v6);

  return v7;
}

void sub_21C04BCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04C368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C04C4F4(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id BookmarkSQLiteColumns()
{
  if (BookmarkSQLiteColumns_onceToken != -1) {
    dispatch_once(&BookmarkSQLiteColumns_onceToken, &__block_literal_global_81);
  }
  v0 = (void *)BookmarkSQLiteColumns_columns;
  return v0;
}

void sub_21C04C7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C04C8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04CAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void bindNullableDataToSQLStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    sqlite3_bind_blob(a1, a2, (const void *)[v5 bytes], objc_msgSend(v5, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(a1, a2);
  }
}

void sub_21C04CBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C04CC9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C04CD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04CE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04CEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D010(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C04D09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04D780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C04D878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

Class __getWFUserSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!WebContentAnalysisLibraryCore()) {
    __getWFUserSettingsClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("WFUserSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getWFUserSettingsClass_block_invoke_cold_2();
  }
  getWFUserSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WebContentAnalysisLibraryCore()
{
  if (!WebContentAnalysisLibraryCore_frameworkLibrary) {
    WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WebContentAnalysisLibraryCore_frameworkLibrary;
}

void sub_21C04DA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04DB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04DC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04DD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C04DE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C04E0F8(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v2, 0x10A1C4022337C91);

  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction(WebBookmarks::BookmarkSQLWriteTransaction *this, uint64_t a2, const char *a3)
{
  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, a2, a3);
  JUMPOUT(0x21D4A0CE0);
}

WebBookmarks::BookmarkSQLWriteTransaction *WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(WebBookmarks::BookmarkSQLWriteTransaction *this, sqlite3 *a2, const char *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *((_WORD *)this + 8) = 0;
  *(void *)this = &unk_26CC2E040;
  *((void *)this + 1) = a2;
  *((unsigned char *)this + 18) = 0;
  int v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(a2, (sqlite3 *)"BEGIN IMMEDIATE", a3);
  if ((v4 - 5) <= 1)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start an immediate transaction; sleeping.",
        buf,
        2u);
    }
    notify_post("com.apple.MobileSafari.StopSyncing");
    usleep(0xC350u);
    int v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"BEGIN IMMEDIATE", v6);
    if ((v4 - 5) <= 1)
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start an immediate transaction; sleeping longer.",
          buf,
          2u);
      }
      usleep(0x6DDD0u);
      int v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"BEGIN IMMEDIATE", v8);
    }
  }
  *((unsigned char *)this + 17) = v4 == 0;
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        long long v10 = sqlite3_errmsg(*((sqlite3 **)this + 1));
        WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((uint64_t)v10, (uint64_t)buf);
      }
    }
    else
    {
      long long v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(v4, v11);
      }
    }
    if ([MEMORY[0x263F662A0] hasInternalContent])
    {
      long long v12 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v13 = [MEMORY[0x263F08B88] callStackSymbols];
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v13, (uint64_t)&v15);
      }
    }
  }
  return this;
}

void sub_21C04E39C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(v1, v5, v6);
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLWriteTransaction::requestSecureDelete(uint64_t this, char a2)
{
  *(unsigned char *)(this + 18) |= a2;
  return this;
}

void WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  *(void *)this = &unk_26CC2E000;
  if (*((unsigned char *)this + 17))
  {
    if (!*((unsigned char *)this + 16)) {
      WebBookmarks::BookmarkSQLTransaction::rollback(this, a2, a3);
    }
  }
}

{
  uint64_t vars8;

  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, a2, a3);
  JUMPOUT(0x21D4A0CE0);
}

BOOL WebBookmarks::BookmarkSQLTransaction::commit(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  if (!*((unsigned char *)this + 17) || *((unsigned char *)this + 16)) {
    return 0;
  }
  int v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"COMMIT", a3);
  *((unsigned char *)this + 16) = 1;
  return v5 == 0;
}

void sub_21C04E67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04E72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL WebBookmarks::BookmarkSQLTransaction::rollback(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  if (!*((unsigned char *)this + 17) || *((unsigned char *)this + 16)) {
    return 0;
  }
  int v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"ROLLBACK", a3);
  *((unsigned char *)this + 16) = 1;
  return v5 == 0;
}

void sub_21C04EB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(void *)(a2 + 10) = result;
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21C04F088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04F218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C04F3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C04F8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C04FAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04FC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C04FD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0505CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0507D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C05126C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05134C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0513F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C051B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va2);
  _Unwind_Resume(a1);
}

void sub_21C051D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C052034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBDataFromNullableColumn(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v5 = sqlite3_column_blob(a1, a2);
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", v5, sqlite3_column_bytes(a1, a2));
  }
  return v4;
}

unsigned __int8 *WBUTF8StringFromSQLStatement(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
    if (v4) {
      int v4 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v4];
    }
  }
  return v4;
}

id newStringFromNullableColumn(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5) {
    int v4 = 0;
  }
  else {
    int v4 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(a1, a2));
  }
  return v4;
}

void sub_21C055298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21C0558EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C056080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BookmarkSQLiteColumnNames_block_invoke()
{
  v2[25] = *MEMORY[0x263EF8340];
  v2[0] = @"bookmarks.type";
  v2[1] = @"bookmarks.title";
  v2[2] = @"bookmarks.url";
  v2[3] = @"bookmarks.id";
  v2[4] = @"bookmarks.editable";
  v2[5] = @"bookmarks.deletable";
  v2[6] = @"bookmarks.hidden";
  v2[7] = @"bookmarks.parent";
  v2[8] = @"bookmarks.order_index";
  v2[9] = @"bookmarks.external_uuid";
  v2[10] = @"bookmarks.special_id";
  v2[11] = @"bookmarks.server_id";
  v2[12] = @"bookmarks.sync_key";
  v2[13] = @"bookmarks.sync_data";
  v2[14] = @"bookmarks.extra_attributes";
  v2[15] = @"bookmarks.local_attributes";
  v2[16] = @"bookmarks.fetched_icon";
  v2[17] = @"bookmarks.icon";
  v2[18] = @"bookmarks.locally_added";
  v2[19] = @"bookmarks.archive_status";
  v2[20] = @"bookmarks.syncable";
  v2[21] = @"bookmarks.web_filter_status";
  v2[22] = @"bookmarks.modified_attributes";
  v2[23] = @"bookmarks.last_selected_child";
  v2[24] = @"bookmarks.subtype";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:25];
  id v1 = (void *)BookmarkSQLiteColumnNames_columns;
  BookmarkSQLiteColumnNames_columns = v0;
}

void sub_21C0567DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0568E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C056A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C056CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

id WBObjectFromColumn(sqlite3_stmt *a1, int a2)
{
  switch(sqlite3_column_type(a1, a2))
  {
    case 1:
      int v4 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 2:
      int v4 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 3:
      int v4 = WBUTF8StringFromSQLStatement(a1, a2);
      break;
    case 4:
      int v4 = WBDataFromNullableColumn(a1, a2);
      break;
    case 5:
      int v4 = [MEMORY[0x263EFF9D0] null];
      break;
    default:
      int v4 = 0;
      break;
  }
  return v4;
}

void sub_21C05748C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C057758(_Unwind_Exception *a1)
{
}

void sub_21C057AA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21C057D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C057F68(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v5, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void WBSetupTabGroupSyncAgentProtocolInterface(void *a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = a1;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  int v4 = [v1 setWithArray:v3];

  [v2 setClasses:v4 forSelector:sel_userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v4 forSelector:sel_beginSharingTabGroupWithUUID_completionHandler_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v4 forSelector:sel_acceptShareForURL_invitationTokenData_completionHandler_ argumentIndex:1 ofReply:1];
  uint64_t v5 = WBTabGroupSyncAgentSyncObserverInterface();
  [v2 setInterface:v5 forSelector:sel_addSyncObserver_ argumentIndex:0 ofReply:0];
  [v2 setInterface:v5 forSelector:sel_removeSyncObserver_ argumentIndex:0 ofReply:0];
}

id WBTabGroupSyncAgentSyncObserverInterface()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC4A798];
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_participants_didJoinSharedTabGroupWithUUID_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_participants_didLeaveSharedTabGroupWithUUID_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t __cjkIdeographCharacterSet_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  id v1 = (void *)cjkIdeographCharacterSet_cjkIdeographCharacterSet;
  cjkIdeographCharacterSet_cjkIdeographCharacterSet = (uint64_t)v0;

  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 19968, 20992);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 13312, 6592);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 11904, 128);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 12032, 224);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 12736, 48);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 63744, 512);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 0x20000, 42720);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 173824, 4160);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 177984, 224);
  uint64_t v2 = (void *)cjkIdeographCharacterSet_cjkIdeographCharacterSet;
  return objc_msgSend(v2, "addCharactersInRange:", 194560, 544);
}

void sub_21C059244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0596A4(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C059818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0599A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C059B9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C059CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C059E8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C05A01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05ADD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken, &__block_literal_global_17);
  }
  return WBS_LOG_CHANNEL_PREFIXBookmarks_log;
}

void sub_21C05B1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05B37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05B83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C05B954(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21C05BA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05C9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05CB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_21C05CBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05CC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05CFC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C05D15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05D580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C05DC40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05DCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05DD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05DDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05DF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05DFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C05E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_21C05F010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05F0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05F1DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05F6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05F80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C05FB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  uint64_t v9 = v8;

  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void __WBSafariDirectoryPath_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Safari"];
  id v1 = (void *)WBSafariDirectoryPath_safariDirectoryPath;
  WBSafariDirectoryPath_safariDirectoryPath = v0;

  id v2 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", WBSafariDirectoryPath_safariDirectoryPath, 0);
}

void sub_21C05FDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C06005C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0602E8(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_21C060480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarkSync()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken, &__block_literal_global_4);
  }
  return WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
}

void sub_21C06077C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

id bookmarksCollectionQueue(void)
{
  if (bookmarksCollectionQueue(void)::onceToken != -1) {
    dispatch_once(&bookmarksCollectionQueue(void)::onceToken, &__block_literal_global_1812);
  }
  uint64_t v0 = (void *)bookmarksCollectionQueue(void)::bookmarksCollectionQueue;
  return v0;
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
}

void sub_21C060A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSafariDirectoryPath()
{
  if (WBSafariDirectoryPath_onceToken != -1) {
    dispatch_once(&WBSafariDirectoryPath_onceToken, &__block_literal_global_11_0);
  }
  uint64_t v0 = (void *)WBSafariDirectoryPath_safariDirectoryPath;
  return v0;
}

void sub_21C060B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C060C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C060DA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

id syncLockQueue(void)
{
  if (syncLockQueue(void)::onceToken != -1) {
    dispatch_once(&syncLockQueue(void)::onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)syncLockQueue(void)::syncLockQueue;
  return v0;
}

void sub_21C06113C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);

  _Unwind_Resume(a1);
}

void sub_21C061750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C061AD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getTIWordTokenizerClass_block_invoke(uint64_t a1)
{
  if (!TextInputLibraryCore_frameworkLibrary) {
    TextInputLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("TIWordTokenizer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTIWordTokenizerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21C061D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_21C061EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C062018(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabGroup()
{
  if (WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken, &__block_literal_global_22_0);
  }
  return WBS_LOG_CHANNEL_PREFIXTabGroup_log;
}

void sub_21C06215C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0628A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL19syncFlagsDictionaryv_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v1 = syncFlagsDictionary(void)::syncFlagsDictionary;
  syncFlagsDictionary(void)::syncFlagsDictionary = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21C0629EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C062B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C062BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C062D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL23performBlockExclusivelyU13block_pointerFvvE_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  uint64_t v1 = performBlockExclusively(void({block_pointer})(void))::mutex;
  performBlockExclusively(void({block_pointer})(void))::mutex = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __BookmarkSQLiteColumns_block_invoke()
{
  BookmarkSQLiteColumnNames();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 componentsJoinedByString:@", "];
  uint64_t v1 = (void *)BookmarkSQLiteColumns_columns;
  BookmarkSQLiteColumns_columns = v0;
}

id BookmarkSQLiteColumnNames()
{
  if (BookmarkSQLiteColumnNames_onceToken != -1) {
    dispatch_once(&BookmarkSQLiteColumnNames_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)BookmarkSQLiteColumnNames_columns;
  return v0;
}

uint64_t ___ZL13syncLockQueuev_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("come.apple.WebBookmarks.syncLockQueue", MEMORY[0x263EF83A8]);
  uint64_t v1 = syncLockQueue(void)::syncLockQueue;
  syncLockQueue(void)::syncLockQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void ___ZL24bookmarksCollectionQueuev_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.WebBookmarks.bookmarksCollectionQueue", v2);
  uint64_t v1 = (void *)bookmarksCollectionQueue(void)::bookmarksCollectionQueue;
  bookmarksCollectionQueue(void)::bookmarksCollectionQueue = (uint64_t)v0;
}

void sub_21C0632EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C063594(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0639D4(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C063BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C063DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C06408C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C065B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C065D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C065E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C065FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C066088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C066180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0663E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C066504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C06666C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0668C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C066A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21C066B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C066C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C066D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C066E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C06701C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C06711C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0672E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C067418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0674AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C067700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C067A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_21C067B28()
{
}

void sub_21C067B30()
{
}

void sub_21C067B38()
{
}

void sub_21C067B40()
{
  JUMPOUT(0x21C067B18);
}

void sub_21C067B58()
{
}

void sub_21C067BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C067C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C067CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C067D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C067E84(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21C068528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35)
{
  _Unwind_Resume(a1);
}

id makeSettingDictionary(NSString *a1, objc_object *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = *MEMORY[0x263F666D0];
  v10[0] = *MEMORY[0x263F666C8];
  v10[1] = v6;
  uint64_t v7 = &stru_26CC2ED50;
  if (v4) {
    uint64_t v7 = (__CFString *)v4;
  }
  v11[0] = v3;
  v11[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

void sub_21C068838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0688A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C068904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C06899C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C068B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C068C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t CKBABookmarkTypeForBookmark(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 isReadingListItem])
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    uint64_t v3 = 1;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "CKBABookmarkTypeForBookmark";
      uint64_t v3 = 1;
      _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeReadingListItem", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = [v1 subtype];
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4 == 1)
    {
      if (v6)
      {
        int v8 = 136315138;
        uint64_t v9 = "CKBABookmarkTypeForBookmark";
        _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeTabGroupScopedBookmark", (uint8_t *)&v8, 0xCu);
      }
      uint64_t v3 = 2;
    }
    else
    {
      if (v6)
      {
        int v8 = 136315138;
        uint64_t v9 = "CKBABookmarkTypeForBookmark";
        _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeRegular", (uint8_t *)&v8, 0xCu);
      }
      uint64_t v3 = 0;
    }
  }

  return v3;
}

uint64_t __redactedArrayOfServerIDs_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wb_stringByRedactingBookmarkDAVServerID");
}

id copyBookmarkAttributes(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = 1;
  if (([v5 attributesMarkedAsModified:1] & 1) == 0) {
    int v7 = [v5 attributesMarkedAsModified:2];
  }
  int v8 = [MEMORY[0x263EFF9A0] dictionary];
  if ((a3 & 1) != 0 || v7)
  {
    uint64_t v11 = [v5 title];
    uint64_t v9 = (void *)v11;
    if (v11) {
      char v12 = a3;
    }
    else {
      char v12 = 0;
    }
    int v13 = a3 ^ 1;
    if ((v12 & 1) != 0 || v13)
    {
      if (v11)
      {
        [v8 setObject:v11 forKeyedSubscript:@"Title"];
      }
      else
      {
        uint64_t v14 = [MEMORY[0x263EFF9D0] null];
        [v8 setObject:v14 forKeyedSubscript:@"Title"];
      }
    }
    if (([v5 isFolder] & 1) == 0)
    {
      uint64_t v10 = [v5 address];

      if (v10)
      {
        uint64_t v17 = [NSURL URLWithString:v10];
      }
      else
      {
        uint64_t v17 = 0;
      }
      if (v17) {
        int v18 = a3;
      }
      else {
        int v18 = 0;
      }
      if ((v18 | v13) == 1)
      {
        if (v17)
        {
          [v8 setObject:v17 forKeyedSubscript:@"URL"];
        }
        else
        {
          v33 = [MEMORY[0x263EFF9D0] null];
          [v8 setObject:v33 forKeyedSubscript:@"URL"];
        }
      }

LABEL_77:
      if ([v5 isReadingListItem]) {
        goto LABEL_88;
      }
      if ((a3 & 1) == 0 && ![v5 attributesMarkedAsModified:0x200000])
      {
        if (([v5 isReadingListItem] & 1) == 0) {
          goto LABEL_142;
        }
LABEL_92:
        if (![v5 attributesMarkedAsModified:16]) {
          goto LABEL_105;
        }
LABEL_93:
        v36 = v10;
        uint64_t v10 = [v5 dateAdded];

        if (v10) {
          char v37 = a3;
        }
        else {
          char v37 = 0;
        }
        if ((v37 & 1) != 0 || !a3)
        {
          if (!v10)
          {
            v41 = [MEMORY[0x263EFF9D0] null];
            [v8 setObject:v41 forKeyedSubscript:@"DateAdded"];

            uint64_t v10 = 0;
            if (a3) {
              goto LABEL_101;
            }
            goto LABEL_105;
          }
          [v8 setObject:v10 forKeyedSubscript:@"DateAdded"];
        }
        if (a3)
        {
LABEL_101:
          int v38 = 0;
          goto LABEL_107;
        }
LABEL_105:
        if (![v5 attributesMarkedAsModified:8]) {
          goto LABEL_115;
        }
        int v38 = 1;
LABEL_107:
        v42 = v10;
        uint64_t v10 = [v5 dateLastViewed];

        if (v10) {
          char v43 = a3;
        }
        else {
          char v43 = 0;
        }
        if ((v43 & 1) != 0 || v38)
        {
          if (!v10)
          {
            v49 = [MEMORY[0x263EFF9D0] null];
            [v8 setObject:v49 forKeyedSubscript:@"DateLastViewed"];

            uint64_t v10 = 0;
            if (a3) {
              goto LABEL_117;
            }
            goto LABEL_115;
          }
          [v8 setObject:v10 forKeyedSubscript:@"DateLastViewed"];
        }
        if (a3) {
          goto LABEL_117;
        }
LABEL_115:
        if (![v5 attributesMarkedAsModified:256]) {
          goto LABEL_125;
        }
        int v38 = 1;
LABEL_117:
        v44 = v10;
        uint64_t v10 = [v5 previewText];

        if (v10) {
          char v45 = a3;
        }
        else {
          char v45 = 0;
        }
        if ((v45 & 1) != 0 || v38)
        {
          if (!v10)
          {
            v50 = [MEMORY[0x263EFF9D0] null];
            [v8 setObject:v50 forKeyedSubscript:@"PreviewText"];

            uint64_t v10 = 0;
            if ((a3 & 1) == 0)
            {
LABEL_125:
              if (![v5 attributesMarkedAsModified:128]) {
                goto LABEL_142;
              }
            }
LABEL_126:
            v46 = v10;
            uint64_t v10 = [v5 readingListIconURL];

            if (v10)
            {
              v47 = [NSURL URLWithString:v10];
            }
            else
            {
              v47 = 0;
            }
            if (v47) {
              char v48 = a3;
            }
            else {
              char v48 = 0;
            }
            if ((v48 & 1) != 0 || !a3)
            {
              if (v47)
              {
                [v8 setObject:v47 forKeyedSubscript:@"ImageURL"];
              }
              else
              {
                v51 = [MEMORY[0x263EFF9D0] null];
                [v8 setObject:v51 forKeyedSubscript:@"ImageURL"];
              }
            }

            goto LABEL_142;
          }
          [v8 setObject:v10 forKeyedSubscript:@"PreviewText"];
        }
        if ((a3 & 1) == 0) {
          goto LABEL_125;
        }
        goto LABEL_126;
      }
      uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "showIconOnly"));

      if (v34) {
        char v35 = a3;
      }
      else {
        char v35 = 0;
      }
      if ((v35 & 1) != 0 || !a3)
      {
        if (!v34)
        {
          v40 = [MEMORY[0x263EFF9D0] null];
          [v8 setObject:v40 forKeyedSubscript:@"ShowIconOnly"];

          uint64_t v10 = 0;
LABEL_88:
          if (([v5 isReadingListItem] & 1) == 0) {
            goto LABEL_142;
          }
          if (a3) {
            goto LABEL_93;
          }
          goto LABEL_92;
        }
        [v8 setObject:v34 forKeyedSubscript:@"ShowIconOnly"];
      }
      uint64_t v10 = (void *)v34;
      goto LABEL_88;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if (![v5 isFolder]) {
      goto LABEL_77;
    }
  }
  if ((a3 & 1) != 0 || [v5 attributesMarkedAsModified:32])
  {
    uint64_t v15 = [v5 isSelectedFavoritesFolder];

    if (v15) {
      char v16 = a3;
    }
    else {
      char v16 = 0;
    }
    if ((v16 & 1) != 0 || !a3)
    {
      if (v15)
      {
        [v8 setObject:v15 forKeyedSubscript:@"IsSelectedFavoritesFolder"];
      }
      else
      {
        v19 = [MEMORY[0x263EFF9D0] null];
        [v8 setObject:v19 forKeyedSubscript:@"IsSelectedFavoritesFolder"];

        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v15 = v9;
  }
  v20 = [v6 configuration];
  if ([v20 collectionType] != 1)
  {
LABEL_43:

    if (a3) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (a3)
  {

    goto LABEL_40;
  }
  char v21 = [v5 attributesMarkedAsModified:512];

  if (v21)
  {
LABEL_40:
    v20 = objc_msgSend(v6, "serverIDForBookmarkID:", objc_msgSend(v5, "lastSelectedChildID"));
    if (v20)
    {
      [v8 setObject:v20 forKeyedSubscript:@"LastSelectedTab"];
    }
    else
    {
      v22 = [MEMORY[0x263EFF9D0] null];
      [v8 setObject:v22 forKeyedSubscript:@"LastSelectedTab"];
    }
    goto LABEL_43;
  }
LABEL_44:
  if (![v5 attributesMarkedAsModified:4096])
  {
    v23 = v15;
    goto LABEL_54;
  }
LABEL_45:
  v23 = [v5 symbolImageName];

  if (v23) {
    char v24 = a3;
  }
  else {
    char v24 = 0;
  }
  if ((v24 & 1) != 0 || !a3)
  {
    if (v23)
    {
      [v8 setObject:v23 forKeyedSubscript:@"SymbolImageName"];
    }
    else
    {
      v25 = [MEMORY[0x263EFF9D0] null];
      [v8 setObject:v25 forKeyedSubscript:@"SymbolImageName"];
    }
  }
LABEL_54:
  v26 = [v6 configuration];
  if ([(WBTabGroup *)v26 collectionType] == 1)
  {
    if (a3)
    {
    }
    else
    {
      char v27 = [v5 attributesMarkedAsModified:0x2000];

      if ((v27 & 1) == 0)
      {
        if ([v5 isReadingListItem]) {
          goto LABEL_74;
        }
        goto LABEL_66;
      }
    }
    v26 = [[WBTabGroup alloc] initWithBookmark:v5];
    v28 = [MEMORY[0x263F08850] defaultManager];
    v29 = [(WBTabGroup *)v26 uuid];
    v30 = objc_msgSend(v28, "safari_startPageBackgroundImageFileURLForIdentifier:", v29);

    if ([v30 checkResourceIsReachableAndReturnError:0])
    {
      [v8 setObject:v30 forKeyedSubscript:@"BackgroundImage"];
    }
    else
    {
      v31 = [MEMORY[0x263EFF9D0] null];
      [v8 setObject:v31 forKeyedSubscript:@"BackgroundImage"];
    }
  }

  if ([v5 isReadingListItem]) {
    goto LABEL_74;
  }
  if ((a3 & 1) == 0)
  {
LABEL_66:
    if ([v5 attributesMarkedAsModified:0x200000]) {
      goto LABEL_67;
    }
LABEL_74:
    uint64_t v10 = v23;
    goto LABEL_142;
  }
LABEL_67:
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "showIconOnly"));

  if (v10) {
    char v32 = a3;
  }
  else {
    char v32 = 0;
  }
  if ((v32 & 1) != 0 || !a3)
  {
    if (v10)
    {
      [v8 setObject:v10 forKeyedSubscript:@"ShowIconOnly"];
    }
    else
    {
      v39 = [MEMORY[0x263EFF9D0] null];
      [v8 setObject:v39 forKeyedSubscript:@"ShowIconOnly"];
    }
  }
LABEL_142:

  return v8;
}

uint64_t __CKBAItemSetModifiedAttributes_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInserted];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _saveBookmark:v4 withSpecialID:0 updateGenerationIfNeeded:0];
  }
  return result;
}

id bookmarkURLWithString(void *a1)
{
  if (a1)
  {
    a1 = [NSURL URLWithString:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void sub_21C071890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBBookmarkSyncModifiedAttributesForKey(void *a1)
{
  uint64_t v1 = WBBookmarkSyncModifiedAttributesForKey_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&WBBookmarkSyncModifiedAttributesForKey_onceToken, &__block_literal_global_3);
  }
  uint64_t v3 = [(id)WBBookmarkSyncModifiedAttributesForKey_keysToModifiedAttributeMasks objectForKeyedSubscript:v2];

  uint64_t v4 = [v3 integerValue];
  return v4;
}

void __WBBookmarkSyncModifiedAttributesForKey_block_invoke()
{
  uint64_t v0 = (void *)WBBookmarkSyncModifiedAttributesForKey_keysToModifiedAttributeMasks;
  WBBookmarkSyncModifiedAttributesForKey_keysToModifiedAttributeMasks = (uint64_t)&unk_26CC40110;
}

uint64_t WBBookmarkSyncModifiedAttributesForKeys(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 |= WBBookmarkSyncModifiedAttributesForKey(*(void **)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id WBKeysForBookmarkSyncModifiedAttributes(int a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __WBKeysForBookmarkSyncModifiedAttributes_block_invoke;
  void v6[3] = &unk_2643D9F08;
  id v7 = v2;
  id v3 = v2;
  _keysForModifiedAttributeMaskUsingBlock(a1, v6);
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

void _keysForModifiedAttributeMaskUsingBlock(int a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v3[2](v3, @"ParentAndPosition");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  v3[2](v3, @"Title");
  if ((a1 & 0x40) == 0)
  {
LABEL_4:
    if ((a1 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v3[2](v3, @"IsSelectedFavoritesFolder");
  if ((a1 & 0x80) == 0)
  {
LABEL_5:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v3[2](v3, @"IsTabGroup");
  if ((a1 & 0x1000) == 0)
  {
LABEL_6:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v3[2](v3, @"DateAdded");
  if ((a1 & 0x2000) == 0)
  {
LABEL_7:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v3[2](v3, @"DateLastViewed");
  if ((a1 & 0x4000) == 0)
  {
LABEL_8:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v3[2](v3, @"HasUserDefinedPreviewText");
  if ((a1 & 0x8000) == 0)
  {
LABEL_9:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v3[2](v3, @"ImageURL");
  if ((a1 & 0x10000) == 0)
  {
LABEL_10:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v3[2](v3, @"PreviewText");
  if ((a1 & 0x20000) == 0)
  {
LABEL_11:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v3[2](v3, @"URL");
  if ((a1 & 0x40000) == 0)
  {
LABEL_12:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v3[2](v3, @"LastSelectedTab");
  if ((a1 & 0x80000) == 0)
  {
LABEL_13:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  v3[2](v3, @"SymbolImageName");
  if ((a1 & 0x400000) == 0)
  {
LABEL_14:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  v3[2](v3, @"CustomFavoritesFolderServerID");
  if ((a1 & 0x100000) == 0)
  {
LABEL_15:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  v3[2](v3, @"BackgroundImage");
  if ((a1 & 0x200000) == 0)
  {
LABEL_16:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  v3[2](v3, @"IsPinned");
  if ((a1 & 0x800000) != 0) {
LABEL_17:
  }
    v3[2](v3, @"ShowIconOnly");
LABEL_18:
}

uint64_t __WBKeysForBookmarkSyncModifiedAttributes_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id WBDescriptionForBookmarkSyncModifiedAttributes(int a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __WBDescriptionForBookmarkSyncModifiedAttributes_block_invoke;
  void v6[3] = &unk_2643D9F08;
  id v7 = v2;
  id v3 = v2;
  _keysForModifiedAttributeMaskUsingBlock(a1, v6);
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

uint64_t __WBDescriptionForBookmarkSyncModifiedAttributes_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_21C073268(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 name];
      +[WBBookmarkSyncData positionFromContentsOfData:v3];
    }

    objc_end_catch();
    JUMPOUT(0x21C07320CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C076FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07735C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0776C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C077A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C078000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  _Unwind_Resume(a1);
}

void sub_21C07811C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C078668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0787A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07892C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C078A78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C078BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C078D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C078F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C079210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C079888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C079A8C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21C079C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C079E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C07A044(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21C07A11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07A330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07A3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07A5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07A740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07A8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07AA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C07AB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07AC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C07AD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07AEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07AF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07B02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21C07B720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C07BCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, ...)
{
  va_start(va, a12);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C07BFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07C0F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07C224(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07C304(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07C3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07C438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07C6D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C07C834(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07C94C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07CA34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07CB30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07CC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C07CD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C07CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C07D3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07D6A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07D7C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C07D8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C07D998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C07DBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DCB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07DFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07E9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07EA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07EAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07EB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C07EC90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07ED44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07EEE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07F1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C07F3DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C07F458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

WebBookmarks::BookmarkSQLReadTransaction *WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(WebBookmarks::BookmarkSQLReadTransaction *this, sqlite3 *a2, const char *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *((_WORD *)this + 8) = 0;
  *(void *)this = &unk_26CC2E020;
  *((void *)this + 1) = a2;
  WebBookmarks::BookmarkSQLStatement::executeSQL(a2, (sqlite3 *)"BEGIN DEFERRED", a3);
  int v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v4);
  if ((v5 - 5) <= 1)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start a deferred transaction; sleeping and trying again later",
        buf,
        2u);
    }
    notify_post("com.apple.MobileSafari.StopSyncing");
    usleep(0xC350u);
    int v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v7);
    if ((v5 - 5) <= 1)
    {
      long long v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_DEFAULT, "WebBookmarks still could not start a deferred transaction; sleeping longer",
          buf,
          2u);
      }
      usleep(0x6DDD0u);
      int v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v9);
    }
  }
  *((unsigned char *)this + 17) = v5 == 0;
  if (v5)
  {
    if (v5 == 1)
    {
      long long v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = sqlite3_errmsg(*((sqlite3 **)this + 1));
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((uint64_t)v11, (uint64_t)buf);
      }
    }
    else
    {
      char v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v5, v12);
      }
    }
    if ([MEMORY[0x263F662A0] hasInternalContent])
    {
      uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [MEMORY[0x263F08B88] callStackSymbols];
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v14, (uint64_t)&v16);
      }
    }
  }
  return this;
}

void sub_21C07FBA0(_Unwind_Exception *a1)
{
  id v3 = v2;

  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(v1, v5, v6);
  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction(WebBookmarks::BookmarkSQLReadTransaction *this, uint64_t a2, const char *a3)
{
  *(void *)this = &unk_26CC2E020;
  WebBookmarks::BookmarkSQLTransaction::commit(this, a2, a3);
  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, v4, v5);
}

{
  uint64_t vars8;

  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction(this, a2, a3);
  JUMPOUT(0x21D4A0CE0);
}

__CFString *WBStringFromBookmarkSyncState(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"State <%zd>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2643DA508[a1];
  }
  return v1;
}

uint64_t WebNSStringFromBookmarkID(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
}

void sub_21C084F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21C086C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C086E74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C086EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C086F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0870F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21C0872A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0879AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)(v38 - 256));

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a35);
  _Unwind_Resume(a1);
}

void sub_21C087B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C087E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C08809C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C088374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C088534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C08863C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08877C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C088924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C088A38(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21C088C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C088D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C089034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_21C089214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0893F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0897A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089864(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C089978(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C089A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089AF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C089B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089C9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C089D9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C089E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C089FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08A818(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C08A908(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C08A99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08AA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08AD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)&a30);
  _Unwind_Resume(a1);
}

void sub_21C08AECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08B0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C08B200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08B3A8(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_21C08B534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08B634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08B6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08B898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C08B980(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);

  _Unwind_Resume(a1);
}

void sub_21C08BBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C08BE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08BF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08C0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08C1DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08C2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C08C514(_Unwind_Exception *a1)
{
  long long v10 = v8;

  _Unwind_Resume(a1);
}

void sub_21C08C7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08C8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08CA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08CADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C08CF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a24, 8);

  _Unwind_Resume(a1);
}

void sub_21C08D0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C08D14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08D1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08D51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C08D7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C08DA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08DC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08DDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08E2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_21C08E4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08E610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08E6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C08E8E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C08EACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08EF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21C08F0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08F14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08F488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C08F6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08F7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08F8A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C08F94C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C08FA60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C08FB8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C08FC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08FD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08FE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C08FEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C08FF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C090058(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_21C0901A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C090374(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C090540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09074C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09088C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0909D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C090ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C090BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C090D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C090E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C090F14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C091030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C091150(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C091290(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09141C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0914C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C091674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C091768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C091D38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C091F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C092174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09227C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C092868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C093198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, ...)
{
  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C093240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C093420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0939A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va1);
  _Unwind_Resume(a1);
}

void sub_21C093BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C093DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C093EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C093FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C094104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0942D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0943F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0944B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09455C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0945F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0948B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C094AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C094C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C094D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C094D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C094F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0950BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09562C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0958AC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21C095944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0959B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C095A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C095AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C095B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C095CF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C095F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0961CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C09631C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C096408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C096498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C096724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v13 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va2);

  _Unwind_Resume(a1);
}

void sub_21C0969A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C096B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C096C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C096D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C096EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C097178(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);

  _Unwind_Resume(a1);
}

void sub_21C097330(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0974A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C097924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a32);

  _Unwind_Resume(a1);
}

uint64_t compareBookmarksByOrder(void *a1, void *a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = a2;
  unsigned int v6 = [v4 orderIndex];
  if (v6 <= [v5 orderIndex])
  {
    unsigned int v8 = [v4 orderIndex];
    if (v8 >= [v5 orderIndex]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void sub_21C097A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C097B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C097B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C097CAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C097DAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C097EA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09802C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09824C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C098418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0984F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0985B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C098748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C098854(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0988FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C098978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C098A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void BookmarksFileChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  unsigned int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Received com.apple.bookmarks.BookmarksFileChanged", buf, 2u);
  }
  uint64_t v7 = a2;
  if (v7)
  {
    unsigned int v8 = bookmarksCollectionQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke;
    block[3] = &unk_2643DA0D0;
    id v10 = v7;
    dispatch_sync(v8, block);
  }
}

void sub_21C098CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C098D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C098E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C098EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C098F78(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21C099064(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C099158(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_21C0991F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09940C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0994CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C099574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0995CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09962C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0996D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C099774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0998D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C099D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C099EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C09A2FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09A384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09A5B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09A6E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09A774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09A7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09AF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09B124(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21C09B1B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09B224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09B2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09B40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09B564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C09B63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09B7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09B8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09B9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09BA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09BB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C09BC48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_21C09BD00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09BDAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09CA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  (*(void (**)(uint64_t))(*(void *)a29 + 8))(a29);
  (*(void (**)(uint64_t))(*(void *)a33 + 8))(a33);

  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);

  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);

  _Unwind_Resume(a1);
}

void sub_21C09CF34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09D228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C09D338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09D50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09D5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09D8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C09DB4C(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_21C09DCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C09E0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09E268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09E4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09E658(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C09E7E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  uint64_t v5 = v4;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09E8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09E988(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09EA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09EB08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09ECD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09EEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09EF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09EFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09F1D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21C09F388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C09F418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09F4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C09F57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09F64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C09F6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C09F7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C09F8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A0114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_21C0A0328(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21C0A0404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A04B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A0550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A05E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A06C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C0A07CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0A08E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0A09C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A0BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_21C0A0CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_21C0A0D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A14A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke()
{
  uint64_t v0 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
  id v1 = (void *)prefixEndingWithFirstWordOfString(NSString *)::tokenizer;
  prefixEndingWithFirstWordOfString(NSString *)::tokenizer = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.WebBookmarks.titleWordTokenizerAccess", 0);
  uint64_t v3 = prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue;
  prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue = (uint64_t)v2;
  return MEMORY[0x270F9A758](v2, v3);
}

__n128 __Block_byref_object_copy__1817(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke_1820(uint64_t a1)
{
  [(id)prefixEndingWithFirstWordOfString(NSString *)::tokenizer setString:*(void *)(a1 + 32)];
  uint64_t result = [(id)prefixEndingWithFirstWordOfString(NSString *)::tokenizer advanceToNextToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 48) = result;
  *(void *)(v3 + 56) = v4;
  return result;
}

void ___ZL6isIPadv_block_invoke()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    isIPad(void)::uint64_t result = CFEqual(v0, @"iPad") != 0;
    CFRelease(v1);
  }
}

void ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2
    && ([*(id *)(v2 + 16) isReadonly] & 1) == 0
    && ([*(id *)(*(void *)(a1 + 32) + 16) skipsExternalNotifications] & 1) == 0)
  {
    [*(id *)(a1 + 32) _updateSyncNotificationType];
    [*(id *)(a1 + 32) _clearCachedFavoritesFolderIdentifier];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 _inMemoryChangeSet];
    id v5 = (id)[v3 _applyInMemoryChanges:v4 postChangeNotification:0];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke_2;
  block[3] = &unk_2643DA0D0;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_21C0A17B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WebBookmarksDidReloadNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void sub_21C0A182C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_21C0A1B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A1D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _SetErrorFromSQLiteResult(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    if ((a1 - 1) > 0x19) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = qword_21C0E9008[(int)a1 - 1];
    }
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    id v7 = @"SQLiteResult";
    uint64_t v5 = [NSNumber numberWithInt:a1];
    v8[0] = v5;
    unsigned int v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    *a2 = [v4 errorWithDomain:@"com.apple.WebBookmarks.ErrorDomain" code:v3 userInfo:v6];
  }
}

void sub_21C0A1EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A2118(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);

  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_21C0A2340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A25E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C0A28C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A2968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A2A68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0A2B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A2D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a9);

  _Unwind_Resume(a1);
}

void sub_21C0A2EEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0A3090(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21C0A31C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A3328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A35F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21C0A375C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_21C0A3958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A3B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  uint64_t v14 = v13;

  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21C0A3CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

uint64_t WebBookmarksRootBookmarkTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksHistoryFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksReadingListFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksWebFilterAllowedSitesFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksBookmarksBarFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksBookmarksMenuFolderTitle()
{
  return _WBSLocalizedString();
}

void webFilterConfigurationChanged(uint64_t a1, void *a2)
{
  [a2 reloadSettings];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"WBWebFilterSettingsDidChange", 0, 0, 1u);
}

uint64_t __WebContentAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebContentAnalysisLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __TextInputLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextInputLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21C0A6AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A6C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t bookmarkMatchesFilter(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::onceToken != -1) {
    dispatch_once(&bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::onceToken, &__block_literal_global_165);
  }
  if ([v4 count])
  {
    uint64_t v5 = [v3 title];
    unsigned int v6 = [v5 componentsSeparatedByCharactersInSet:bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v14 = v3;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke_2;
          v15[3] = &unk_2643DAF50;
          v15[4] = v11;
          if (objc_msgSend(v6, "indexOfObjectPassingTest:", v15, v14) == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      uint64_t v12 = 1;
LABEL_14:
      id v3 = v14;
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

void sub_21C0A6EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_21C0A6FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A7150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A7290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  uint64_t v1 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  id v2 = [MEMORY[0x263F08708] punctuationCharacterSet];
  [v0 formUnionWithCharacterSet:v2];

  id v3 = (void *)bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet;
  bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet = (uint64_t)v0;
}

void sub_21C0A7348(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

BOOL ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 rangeOfString:*(void *)(a1 + 32) options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_21C0A7480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A755C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A7678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A77FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A78F0(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_21C0A7CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A7E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A7F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C0A814C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A8330(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A8548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A85C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A86FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A8830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A89C8(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A8B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C0A8D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A8E7C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A906C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A9150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0A92DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A95D4(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A9778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9824(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21C0A9960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9AE4(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A9C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0A9DEC(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0A9F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AA07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AA1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AA30C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0AA664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AA6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AA7C0(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0AA95C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AAA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v13;

  _Unwind_Resume(a1);
}

void sub_21C0AAB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AAC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0AAE9C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21C0AB210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_21C0AB31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AB994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ABA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0ABB78(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0ABC80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ABD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ABDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0ABF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v16 = v15;

  _Unwind_Resume(a1);
}

void sub_21C0AC5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC6E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AC9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ACF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0AD8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C0ADE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE16C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AE9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AEA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AED58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AEEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AEFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AF8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AFA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0AFA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AFBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0AFC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0AFE08(_Unwind_Exception *a1)
{
  unsigned int v6 = v4;

  _Unwind_Resume(a1);
}

void sub_21C0AFF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0204(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0B02C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B03C0(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0B0744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);

  _Unwind_Resume(a1);
}

void sub_21C0B08B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_21C0B0BCC(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0B0D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B0F60(_Unwind_Exception *a1)
{
  uint64_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_21C0B11D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B13A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21C0B15E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B19A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B1F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B21CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B223C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B23B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B24B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B264C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4A0CE0](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21C0B271C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B284C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B29C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21C0B2EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B2FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B30A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B3318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C0B3748(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v23 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_21C0B4348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_21C0B4610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B48AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id BookmarkInFolderWithoutIconColumnsSelectQuery()
{
  if (BookmarkInFolderWithoutIconColumnsSelectQuery_onceToken != -1) {
    dispatch_once(&BookmarkInFolderWithoutIconColumnsSelectQuery_onceToken, &__block_literal_global_86);
  }
  id v0 = (void *)BookmarkInFolderWithoutIconColumnsSelectQuery_query;
  return v0;
}

uint64_t __BookmarkInFolderWithoutIconColumnsSelectQuery_block_invoke()
{
  uint64_t v0 = BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions(0);
  uint64_t v1 = BookmarkInFolderWithoutIconColumnsSelectQuery_query;
  BookmarkInFolderWithoutIconColumnsSelectQuery_query = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions(char a1)
{
  if (BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_onceToken != -1) {
    dispatch_once(&BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_onceToken, &__block_literal_global_88);
  }
  uint64_t v2 = &stru_26CC2ED50;
  uint64_t v3 = @"AND hidden = 0 ";
  if (a1) {
    uint64_t v3 = &stru_26CC2ED50;
  }
  if ((a1 & 6) == 2) {
    uint64_t v2 = @"AND type = 0 ";
  }
  if ((a1 & 6) == 4) {
    uint64_t v2 = @"AND type = 1 ";
  }
  return [NSString stringWithFormat:@"SELECT %@ FROM bookmarks WHERE parent = ? %@%@ORDER BY order_index ASC", BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon, v3, v2];
}

void __BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_block_invoke()
{
  uint64_t v0 = BookmarkSQLiteColumnNames();
  id v3 = (id)[v0 mutableCopy];

  [v3 removeObject:@"bookmarks.icon"];
  uint64_t v1 = [v3 componentsJoinedByString:@", "];
  uint64_t v2 = (void *)BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon;
  BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon = v1;
}

id WBSafariPreferencesDomain()
{
  if (WBSafariPreferencesDomain_onceToken != -1) {
    dispatch_once(&WBSafariPreferencesDomain_onceToken, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)WBSafariPreferencesDomain_domain;
  return v0;
}

void __WBSafariPreferencesDomain_block_invoke()
{
  uint64_t v0 = WBCurrentProcessContainerPath();

  if (v0)
  {
    uint64_t v1 = (void *)WBSafariPreferencesDomain_domain;
    WBSafariPreferencesDomain_domain = @"com.apple.mobilesafari";
  }
  else
  {
    uint64_t v2 = WBSafariContainerPath();
    id v5 = v2;
    if (v2)
    {
      id v3 = [v2 stringByAppendingPathComponent:@"Library/Preferences/com.apple.mobilesafari"];
    }
    else
    {
      id v3 = @"com.apple.mobilesafari";
    }
    uint64_t v4 = (void *)WBSafariPreferencesDomain_domain;
    WBSafariPreferencesDomain_domain = (uint64_t)v3;

    uint64_t v1 = v5;
  }
}

id WBCurrentProcessContainerPath()
{
  if (WBCurrentProcessContainerPath_onceToken != -1) {
    dispatch_once(&WBCurrentProcessContainerPath_onceToken, &__block_literal_global_6_0);
  }
  uint64_t v0 = (void *)WBCurrentProcessContainerPath_containerPath;
  return v0;
}

id WBSafariContainerPath()
{
  if (WBSafariContainerPath_onceToken != -1) {
    dispatch_once(&WBSafariContainerPath_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)WBSafariContainerPath_containerPath;
  return v0;
}

void __WBCurrentProcessContainerPath_block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  getpid();
  if (!sandbox_container_path_for_pid())
  {
    uint64_t v0 = [NSString stringWithUTF8String:v2];
    uint64_t v1 = (void *)WBCurrentProcessContainerPath_containerPath;
    WBCurrentProcessContainerPath_containerPath = v0;
  }
}

void __WBSafariContainerPath_block_invoke()
{
  uint64_t v0 = WBCurrentProcessContainerPath();
  uint64_t v1 = (void *)WBSafariContainerPath_containerPath;
  WBSafariContainerPath_containerPath = v0;

  if (!WBSafariContainerPath_containerPath)
  {
    id v5 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.mobilesafari" placeholder:0];
    uint64_t v2 = [v5 dataContainerURL];
    uint64_t v3 = [v2 path];
    uint64_t v4 = (void *)WBSafariContainerPath_containerPath;
    WBSafariContainerPath_containerPath = v3;
  }
}

__CFString *WBNSStringFromCollectionType(uint64_t a1)
{
  uint64_t v1 = @"Tabs";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Bookmarks";
  }
}

__CFString *WBNSStringFromCollectionStoreOwner(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Default";
  }
  else {
    return off_2643DB950[a1 - 1];
  }
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken, &__block_literal_global_7);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCycler()
{
  if (WBS_LOG_CHANNEL_PREFIXCycler_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCycler_onceToken, &__block_literal_global_10);
  }
  return WBS_LOG_CHANNEL_PREFIXCycler_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDataMigration()
{
  if (WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXDataMigration_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingList()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingList_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingList_onceToken, &__block_literal_global_16_0);
  }
  return WBS_LOG_CHANNEL_PREFIXReadingList_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingListIcons()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingListIcons_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingListIcons_onceToken, &__block_literal_global_19_0);
  }
  return WBS_LOG_CHANNEL_PREFIXReadingListIcons_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabs()
{
  if (WBS_LOG_CHANNEL_PREFIXTabs_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabs_onceToken, &__block_literal_global_25);
  }
  return WBS_LOG_CHANNEL_PREFIXTabs_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebsiteData()
{
  if (WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken, &__block_literal_global_28);
  }
  return WBS_LOG_CHANNEL_PREFIXWebsiteData_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebBookmarkServer()
{
  if (WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_onceToken, &__block_literal_global_31);
  }
  return WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudSettings()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken, &__block_literal_global_34_0);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudSettings_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXProfiles()
{
  if (WBS_LOG_CHANNEL_PREFIXProfiles_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXProfiles_onceToken, &__block_literal_global_37);
  }
  return WBS_LOG_CHANNEL_PREFIXProfiles_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXImport()
{
  if (WBS_LOG_CHANNEL_PREFIXImport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXImport_onceToken, &__block_literal_global_40);
  }
  return WBS_LOG_CHANNEL_PREFIXImport_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExport()
{
  if (WBS_LOG_CHANNEL_PREFIXExport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExport_onceToken, &__block_literal_global_43);
  }
  return WBS_LOG_CHANNEL_PREFIXExport_log;
}

void sub_21C0B9334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B943C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B95E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0B96C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B97A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B98E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B99CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0B9F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA4E0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21C0BA5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C0BA948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BAADC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21C0BAC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BAC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BAD40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BAF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __processAccessLevel_block_invoke()
{
  processAccessLevel_accessLevel = 0;
  uint64_t v0 = [MEMORY[0x263F53C50] sharedConnection];
  int v1 = [v0 isEphemeralMultiUser];

  if (v1) {
    processAccessLevel_accessLevel = 1;
  }
}

void sub_21C0BD064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C0BDADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BDCCC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21C0BDD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BDE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BDEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BDF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BE934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C0BEAC4(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 name];
      +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:v3];
    }

    objc_end_catch();
    JUMPOUT(0x21C0BEA7CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C0C2208(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21C0C251C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C0C2BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C0C47B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

uint64_t _tabGroupManagerProfilesChanged(uint64_t a1, void *a2)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  return [a2 _reloadProfilesAndTabGroupsAndNotify:1 withCompletionHandler:0];
}

void sub_21C0C7818(_Unwind_Exception *a1)
{
}

void sub_21C0CDBD8(_Unwind_Exception *a1)
{
}

void sub_21C0D0704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C0D1698(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21C0D2AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C0D3048(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

id messageReceivedAcknowledgementReply(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_BOOL(reply, webBookmarksMessageReceivedAcknowledgementKey, 1);
  return reply;
}

void sub_21C0D7654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C0D7D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C0D806C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C0DA97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Prepare statement failed (%i)", (uint8_t *)v2, 8u);
}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_1((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "%{public}@", v5);
}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v2, v3, "WebBookmarks could not start a deferred transaction; bailing. Error was: %{public}s",
    v4);
}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "WebBookmarks could not start a deferred transaction; bailing. Result code was: %d",
    (uint8_t *)v2,
    8u);
}

void WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v2, v3, "WebBookmarks could not start an immediate transaction; bailing. Error was: %{public}s",
    v4);
}

void WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "WebBookmarks could not start an immediate transaction; bailing. Result code was: %d",
    (uint8_t *)v2,
    8u);
}

void bindAttributesToSQLStatement_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Error reading bookmark attributes: %{public}@", v5);
}

void __getWFUserSettingsClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *WebContentAnalysisLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBWebFilterSettings.m", 12, @"%s", *a1);

  __break(1u);
}

void __getWFUserSettingsClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWFUserSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBWebFilterSettings.m", 13, @"Unable to find class %s", "WFUserSettings");

  __break(1u);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x270EE42E0](theArray, range.location, range.length, value, comparator, context);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4F68](metadata, parent, path);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x270EF4FD8](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x270F5C320]();
}

uint64_t WBSReleaseOnMainQueueImpl()
{
  return MEMORY[0x270F5C330]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x270F5C338]();
}

uint64_t SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  return MEMORY[0x270F5C340](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  return MEMORY[0x270F5C348](this, a2);
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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
  return MEMORY[0x270F76310]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x270F91828]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x270EDB2A8]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x270F9B4C8](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x270EDBE30]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC070](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x270EDC428](type);
}
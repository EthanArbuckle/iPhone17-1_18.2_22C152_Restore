void sub_10000194C(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012300;
  qword_100012300 = (uint64_t)v1;
}

void sub_1000019BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100001A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001AB0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) daemonInterface];
  v3 = [v2 accountRepository];
  id v7 = [v3 receivingAccounts];

  v4 = [v7 ef_map:&stru_10000C3E0];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [objc_alloc((Class)INObjectCollection) initWithItems:v4];
  (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, 0);
}

void sub_100001B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

MFIntentAccount *__cdecl sub_100001BBC(id a1, EMReceivingAccount *a2)
{
  v2 = a2;
  v3 = [(EMReceivingAccount *)v2 objectID];
  v4 = [v3 serializedRepresentation];
  uint64_t v5 = [v4 base64EncodedStringWithOptions:0];

  id v6 = [MFIntentAccount alloc];
  id v7 = [(EMReceivingAccount *)v2 name];
  v8 = [(MFIntentAccount *)v6 initWithIdentifier:v5 displayString:v7];

  [(MFIntentAccount *)v8 setSerializedRepresentation:v5];

  return v8;
}

void sub_100001C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100001E00(id a1)
{
  qword_100012310 = +[EFScheduler globalAsyncSchedulerWithQualityOfService:25];

  _objc_release_x1();
}

void sub_100001F50(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012320;
  qword_100012320 = (uint64_t)v1;
}

void sub_100001FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002074(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012330;
  qword_100012330 = (uint64_t)v1;
}

void sub_1000020E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000023D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002468(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[GetMailboxIntentHandler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v20 = [v5 count];
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetch mailboxes returned %lu mailboxes:\n%{public}@", buf, 0x16u);
    }

    v8 = [*(id *)(a1 + 32) daemonInterface];
    v9 = [v8 vipManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000269C;
    v15[3] = &unk_10000C4F0;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v11;
    id v18 = v12;
    [v9 getAllVIPsWithCompletion:v15];
  }
  else
  {
    v13 = +[GetMailboxIntentHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v6 ef_publicDescription];
      sub_1000070E0(v14, buf, v13);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100002640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000269C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = +[GetMailboxIntentHandler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v6 ef_publicDescription];
      sub_100007138(v8, v18, v7);
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [*(id *)(a1 + 32) ef_groupByObject:&stru_10000C488];
  uint64_t v11 = [*(id *)(a1 + 32) ef_filter:&stru_10000C4C8];
  id v12 = objc_alloc((Class)INObjectSection);
  v13 = [*(id *)(a1 + 40) _smartMailboxesWithInboxes:v11 hasVIPs:[v5 count] != 0];
  id v14 = [v12 initWithTitle:&stru_10000C818 items:v13];

  [v9 addObject:v14];
  v15 = [*(id *)(a1 + 40) _convertMailboxesIntoSections:v10];
  [v9 addObjectsFromArray:v15];

  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = [objc_alloc((Class)INObjectCollection) initWithSections:v9];
  (*(void (**)(uint64_t, id, void))(v16 + 16))(v16, v17, 0);
}

void sub_100002870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

EMReceivingAccount *__cdecl sub_1000028F0(id a1, EMMailbox *a2)
{
  v2 = [(EMMailbox *)a2 account];

  return (EMReceivingAccount *)v2;
}

BOOL sub_100002920(id a1, EMMailbox *a2)
{
  return [(EMMailbox *)a2 isInboxMailbox];
}

void sub_100002CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000035F4(id a1, EMMailbox *a2)
{
  v2 = [(EMMailbox *)a2 objectID];
  id v3 = [v2 serializedRepresentation];
  v4 = [v3 base64EncodedStringWithOptions:0];

  return (NSString *)v4;
}

void sub_100003660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000037B4(id a1, EMAccount *a2, EMAccount *a3)
{
  v4 = a3;
  id v5 = [(EMAccount *)a2 name];
  id v6 = [(EMAccount *)v4 name];
  id v7 = [v5 localizedStandardCompare:v6];

  return (int64_t)v7;
}

void sub_100003824(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100003850(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if ([v4 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000039A4;
    v10[3] = &unk_10000C5C0;
    v10[4] = *(void *)(a1 + 40);
    id v5 = [v4 ef_compactMap:v10];
    id v6 = objc_alloc((Class)INObjectSection);
    id v7 = [v3 name];
    id v8 = [v6 initWithTitle:v7 items:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10000396C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000039A4(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _intentMailboxFromMailbox:a2];

  return v2;
}

void sub_100003D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000041B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v20 = v18;

  _Unwind_Resume(a1);
}

id sub_100004258(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000433C;
  v6[3] = &unk_10000C610;
  id v7 = *(id *)(a1 + 32);
  id v3 = [a2 ef_map:v6];
  v4 = [v3 ef_filter:EFIsNotNull];

  return v4;
}

void sub_10000431C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10000433C(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) transformedValue:a2];

  return v2;
}

void sub_100004410(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012340;
  qword_100012340 = (uint64_t)v1;
}

void sub_100004480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000049AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_100004BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100004C18(id a1, NSDictionary *a2, NSDictionary *a3)
{
  v4 = a3;
  uint64_t v5 = MSResultsKeyDateSent;
  id v6 = [(NSDictionary *)a2 objectForKeyedSubscript:MSResultsKeyDateSent];
  id v7 = [(NSDictionary *)v4 objectForKeyedSubscript:v5];
  id v8 = [v6 compare:v7];

  return (int64_t)v8;
}

void sub_100004C9C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100004E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

MSIntentMail *__cdecl sub_100004E44(id a1, NSDictionary *a2)
{
  v2 = a2;
  id v3 = [objc_alloc((Class)MSIntentMail) initWithDictionary:v2];

  return (MSIntentMail *)v3;
}

void sub_100004E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004FD0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012350;
  qword_100012350 = (uint64_t)v1;
}

void sub_100005040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000051C8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_100012360;
  qword_100012360 = (uint64_t)v1;
}

void sub_100005238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000052C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000542C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_100005578(id a1, MFMailAccountProxy *a2)
{
  v2 = [(MFMailAccountProxy *)a2 emailAddresses];

  return (NSArray *)v2;
}

void sub_100005618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000057AC(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005810(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _resolutionResultForPerson:a2];

  return v2;
}

void sub_1000059AC(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005A04(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _resolutionResultForPerson:a2];

  return v2;
}

void sub_100005BA0(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005BF8(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _resolutionResultForPerson:a2];

  return v2;
}

void sub_100005D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100006180()
{
}

void sub_100006188()
{
}

void sub_100006190(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2) {
    id v6 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:4 userActivity:0];
  }
  else {
    id v6 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:5 userActivity:0];
  }
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_100006244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006268(uint64_t a1, int a2, int a3, void *a4)
{
  id v9 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    if (a3) {
      id v8 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:100 userActivity:0];
    }
    else {
      id v8 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:4 userActivity:0];
    }
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
  else
  {
    id v8 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:5 userActivity:0];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void sub_10000634C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000064B8(_Unwind_Exception *a1)
{
  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_100006604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100006638(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) reverseTransformedValue:a2];

  return v2;
}

void sub_100006730(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100006AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MFMessageFileWrapper *__cdecl sub_100006C04(id a1, INFile *a2)
{
  v2 = a2;
  id v3 = objc_alloc((Class)MFMessageFileWrapper);
  v4 = [(INFile *)v2 data];
  id v5 = [v3 initRegularFileWithContents:v4];

  id v6 = [(INFile *)v2 filename];
  [v5 setPreferredFilename:v6];

  return (MFMessageFileWrapper *)v5;
}

void sub_100006C9C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100006D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000070E0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetch mailboxes failed with error: %{public}@", buf, 0xCu);
}

void sub_100007138(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch VIPs: %{public}@", buf, 0xCu);
}

uint64_t MSCanSendMailWithOptions()
{
  return _MSCanSendMailWithOptions();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromEMSmartMailboxType()
{
  return _NSStringFromEMSmartMailboxType();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountProxyGenerator(void *a1, const char *a2, ...)
{
  return [a1 accountProxyGenerator];
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return [a1 accountRepository];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allVIPWaitForResult(void *a1, const char *a2, ...)
{
  return [a1 allVIPWaitForResult];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return [a1 bcc];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return [a1 cc];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_externalURL(void *a1, const char *a2, ...)
{
  return [a1 externalURL];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_firstEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 firstEmailAddress];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fullUserName(void *a1, const char *a2, ...)
{
  return [a1 fullUserName];
}

id objc_msgSend_isDraft(void *a1, const char *a2, ...)
{
  return [a1 isDraft];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_mailboxRepository(void *a1, const char *a2, ...)
{
  return [a1 mailboxRepository];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_messageData(void *a1, const char *a2, ...)
{
  return [a1 messageData];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return [a1 needsValue];
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return [a1 notRequired];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_personHandle(void *a1, const char *a2, ...)
{
  return [a1 personHandle];
}

id objc_msgSend_readStatus(void *a1, const char *a2, ...)
{
  return [a1 readStatus];
}

id objc_msgSend_receivingAccounts(void *a1, const char *a2, ...)
{
  return [a1 receivingAccounts];
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return [a1 recipient];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return [a1 scheduler];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return [a1 serializedRepresentation];
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return [a1 signpostID];
}

id objc_msgSend_signpostLog(void *a1, const char *a2, ...)
{
  return [a1 signpostLog];
}

id objc_msgSend_sortDescriptorForDisplayOrder(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorForDisplayOrder];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return [a1 unsupported];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vipManager(void *a1, const char *a2, ...)
{
  return [a1 vipManager];
}
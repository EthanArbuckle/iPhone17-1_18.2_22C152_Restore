void sub_100002FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000305C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_100003070(void *a1)
{
  id v1 = a1;
  v2 = +[NSMutableString string];
  id v3 = v1;
  v4 = (unsigned __int8 *)[v3 bytes];
  v5 = (char *)[v3 length];
  if (v5)
  {
    v6 = v5;
    do
    {
      unsigned int v7 = *v4++;
      v8 = +[NSString stringWithFormat:@"%c%c", a0123456789abcd[(unint64_t)v7 >> 4], a0123456789abcd[v7 & 0xF]];
      [v2 appendString:v8];

      --v6;
    }
    while (v6);
  }
  id v9 = [v2 copy];

  return v9;
}

void sub_1000031A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100003370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000342C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000350C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000351C(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0xB)
  {
    id v3 = [v2 rangeOfString:@"."];
    v4 = 0;
    if (v5 == 1 && v3 == (id)10)
    {
      v4 = [v2 substringToIndex:10];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1000035AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000036A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003C74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100004258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000442C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004504(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

int64_t sub_10000451C(id a1, UAClientController *a2, UAClientController *a3)
{
  v4 = a3;
  int64_t v5 = [(UACornerActionManagerHandler *)a2 priority];
  id v6 = [(UACornerActionManagerHandler *)v4 priority];
  uint64_t v7 = -1;
  if (v5 >= (uint64_t)v6) {
    uint64_t v7 = 1;
  }
  if ((id)v5 == v6) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = v7;
  }

  return v8;
}

void sub_100004570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000046D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000046F8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 mainDisplayLayoutMonitor];
  v4 = [v3 currentLayout];
  [v2 updateMainScreenLayout:v4];

  int64_t v5 = *(void **)(a1 + 32);
  id v7 = [v5 carPlayDisplayLayoutMonitor];
  id v6 = [v7 currentLayout];
  [v5 updateCarPlayScreenLayout:v6];
}

void sub_100004864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000049D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleAppStateMonitorUpdate:*(void *)(a1 + 32)];
}

void sub_100004A20(id *a1)
{
  v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v3 = [*((id *)a1[4] + 11) pid];
    v4 = [a1[5] description];
    int64_t v5 = sub_100063FF0(v4);
    int v12 = 67109379;
    unsigned int v13 = v3;
    __int16 v14 = 2113;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "CLIENT: Process info, for pid %d, is %{private}@ (on queue)", (uint8_t *)&v12, 0x12u);
  }
  id v6 = [a1[5] objectForKey:BKSApplicationStateDisplayIDKey];
  id v7 = a1[4];
  objc_sync_enter(v7);
  if (v6)
  {
    [a1[4] setBundleIdentifier:v6];
    [a1[6] addUserActivityClient:a1[4]];
  }
  else
  {
    int64_t v8 = sub_10000BA18(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = [*((id *)a1[4] + 11) pid];
      v10 = [a1[5] description];
      v11 = sub_100063FF0(v10);
      int v12 = 67109378;
      unsigned int v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLIENT: Process info, for pid %d, doesn't include bundle identifier, so unable to locate this process \texcept by pid.(is %{public}@)", (uint8_t *)&v12, 0x12u);
    }
    [a1[6] addUserActivityClient:a1[4]];
  }
  objc_sync_exit(v7);
}

void sub_100004C2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_100004C54(id a1, id a2, id a3)
{
  return sub_100004C78(a2, a3);
}

BOOL sub_100004C78(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v3 != v4;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___FBSDisplayLayoutElement]
    && [v4 conformsToProtocol:&OBJC_PROTOCOL___FBSDisplayLayoutElement])
  {
    id v6 = v3;
    id v7 = v4;
    id v8 = [v6 level];
    if (v8 == [v7 level])
    {
      if (([v6 hasKeyboardFocus] & 1) == 0
        && ([v7 hasKeyboardFocus] & 1) == 0)
      {
        if (![v6 conformsToProtocol:&OBJC_PROTOCOL___SBSDisplayLayoutElement]
          || ![v7 conformsToProtocol:&OBJC_PROTOCOL___SBSDisplayLayoutElement])
        {
          goto LABEL_11;
        }
        [v6 layoutRole];
        j__SBSDisplayLayoutRoleIsDefined();
        [v7 layoutRole];
        j__SBSDisplayLayoutRoleIsDefined();
      }
    }
    else
    {
      [v6 level];
      [v7 level];
    }
    BOOL v5 = 1;
LABEL_11:
  }
  return v5;
}

void sub_100004EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000051D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000052A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 88) pid];
    id v6 = [v3 description];
    id v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 67109379;
    unsigned int v16 = v5;
    __int16 v17 = 2113;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLIENT: Process info, for pid %d, is %{private}@", buf, 0x12u);
  }
  id v8 = [*(id *)(a1 + 32) manager];
  unsigned int v9 = [v8 mainDispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A20;
  block[3] = &unk_1000C4F10;
  id v12 = *(id *)(a1 + 32);
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  id v10 = v3;
  dispatch_async(v9, block);
}

void sub_100005858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1000062C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007574(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10000758C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unsigned int v5 = [*(id *)(a1 + 32) manager];
  id v6 = [v5 mainDispatchQ];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F3CC;
  v9[3] = &unk_1000C5BB0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v7;
  id v8 = v4;
  dispatch_async(v6, v9);
}

void sub_100007654(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  unsigned int v5 = [WeakRetained manager];
  id v6 = [v5 mainDispatchQ];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000049D0;
  v8[3] = &unk_1000C56C8;
  objc_copyWeak(&v10, a1);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
}

void sub_1000082B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  _Block_object_dispose((const void *)(v11 - 248), 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

uint64_t sub_100008308(void *a1)
{
  id v1 = a1;
  if (!v1
    || (uint64_t v2 = 1,
        +[NSNumber numberWithBool:1],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v1 isEqual:v3],
        v3,
        (v4 & 1) == 0))
  {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:@"YES"];
  }

  return v2;
}

void sub_100008EA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008F38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000098D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A9C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10000AA28(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

void sub_10000AB98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B9F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000BA18(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v2 = getenv("_UALOGGINGCATEGORY");
    if (!v2
      || (+[NSString stringWithCString:v2 encoding:4],
          (id v1 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v1 = @"main";
    }
  }
  if (pthread_mutex_lock(&stru_1000E61C0))
  {
    id v3 = 0;
  }
  else
  {
    unsigned __int8 v4 = (void *)qword_1000E67F8;
    if (!qword_1000E67F8)
    {
      uint64_t v5 = +[NSMutableDictionary dictionary];
      id v6 = (void *)qword_1000E67F8;
      qword_1000E67F8 = v5;

      unsigned __int8 v4 = (void *)qword_1000E67F8;
    }
    id v3 = [v4 objectForKey:v1];
    if (!v3)
    {
      id v7 = v1;
      os_log_t v8 = os_log_create("com.apple.useractivity", (const char *)[(__CFString *)v7 cStringUsingEncoding:4]);
      if (v8)
      {
        id v3 = v8;
        [(id)qword_1000E67F8 setValue:v8 forKey:v7];
      }
      else
      {
        id v3 = &_os_log_default;
        id v9 = &_os_log_default;
      }
    }
    pthread_mutex_unlock(&stru_1000E61C0);
  }

  return v3;
}

void sub_10000BB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BC08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C1C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C264(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *sub_10000C6B4(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v1;
  uint64_t v2 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  id v3 = v2;
  if (v2)
  {
    unsigned __int8 v4 = (__CFString *)SecTaskCopySigningIdentifier(v2, 0);
    CFRelease(v3);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

void sub_10000C748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000CC7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineItemToAdvertiseForHandoffThread];
}

void sub_10000CCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10000DBD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10000DD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DDF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10000E05C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E35C(_Unwind_Exception *a1)
{
  id v7 = v4;

  _Unwind_Resume(a1);
}

void sub_10000E774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

id sub_10000E878()
{
  if (qword_1000E6908 != -1) {
    dispatch_once(&qword_1000E6908, &stru_1000C6358);
  }
  v0 = (void *)qword_1000E6910;

  return v0;
}

void sub_10000E97C(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000EC0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EF4C(uint64_t result, BOOL *a2)
{
  if (result)
  {
    result = sandbox_check_by_audit_token();
    if (a2) {
      *a2 = result != 0;
    }
  }
  return result;
}

id sub_10000F05C(void *a1, uint64_t a2)
{
  id v20 = a1;
  id v3 = +[NSMutableString stringWithFormat:@"$"];
  id v4 = v20;
  v21 = (unsigned __int8 *)[v4 bytes];
  uint64_t v5 = (char *)[v4 length];
  audit_token_t v6 = v5;
  if (a2 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = a2 + 1;
  }
  uint64_t v8 = v7 >> 1;
  if ((unint64_t)v5 >= a2) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = (unint64_t)v5;
  }
  if (v9)
  {
    id v10 = v21;
    unint64_t v11 = v9;
    do
    {
      unsigned int v12 = *v10++;
      id v13 = +[NSString stringWithFormat:@"%c%c", a0123456789abcd[(unint64_t)v12 >> 4], a0123456789abcd[v12 & 0xF]];
      [v3 appendString:v13];

      --v11;
    }
    while (v11);
  }
  if ((unint64_t)v6 > v9)
  {
    objc_msgSend(v3, "appendFormat:", @".. %ld ..", v6);
    if (&v6[-v9] < v6)
    {
      uint64_t v14 = -(uint64_t)v9;
      v15 = &v6[(void)v21];
      do
      {
        unsigned int v16 = +[NSString stringWithFormat:@"%c%c", a0123456789abcd[(unint64_t)v15[v14] >> 4], a0123456789abcd[v15[v14] & 0xF]];
        [v3 appendString:v16];
      }
      while (!__CFADD__(v14++, 1));
    }
  }
  id v18 = [v3 copy];

  return v18;
}

void sub_10000F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

id sub_10000F3CC(uint64_t a1)
{
  return [*(id *)(a1 + 40) updateMainScreenLayout:*(void *)(a1 + 32)];
}

id sub_10000F3D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doIt];
}

uint64_t sub_10000F3E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F3F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F400(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F410(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F420(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000F42C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id sub_10000F43C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAdvertisement];
}

id sub_10000F444(uint64_t a1)
{
  return [*(id *)(a1 + 32) doIt];
}

id sub_10000F44C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _advertisePayload:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 48) name:0];
}

id sub_10000F460(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doIt];
}

id sub_10000F468()
{
  if (qword_1000E6838 != -1) {
    dispatch_once(&qword_1000E6838, &stru_1000C5A80);
  }
  v0 = (void *)qword_1000E6830;

  return v0;
}

id sub_10000F4BC()
{
  if (qword_1000E6828 != -1) {
    dispatch_once(&qword_1000E6828, &stru_1000C5A60);
  }
  v0 = (void *)qword_1000E6820;

  return v0;
}

id sub_10000F6D0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSMutableData data];
  if ([v1 length])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3 + 1;
      unsigned __int8 v5 = [v1 characterAtIndex:v3];
      if (v5 > 0x24u || ((1 << v5) & 0x1100000400) == 0)
      {
        char v7 = v5 - 48;
        if ((v5 - 48) >= 0xAu
          && (v5 - 65 > 0x25 || ((1 << (v5 - 65)) & 0x3F0000003FLL) == 0))
        {

          uint64_t v2 = 0;
          break;
        }
        if (v5 - 48 >= 0xA)
        {
          if (v5 - 97 > 5)
          {
            if (v5 - 65 >= 6) {
              char v7 = 0;
            }
            else {
              char v7 = v5 - 55;
            }
          }
          else
          {
            char v7 = v5 - 87;
          }
        }
        unint64_t v8 = v3 + 2;
        unsigned int v9 = [v1 characterAtIndex:v4];
        unsigned int v10 = v9 - 48;
        if (v9 - 65 <= 5) {
          char v11 = v9 - 55;
        }
        else {
          char v11 = 0;
        }
        if (v9 - 97 <= 5) {
          char v12 = v9 - 87;
        }
        else {
          char v12 = v11;
        }
        if (v10 > 9) {
          LOBYTE(v10) = v12;
        }
        char v15 = v10 | (16 * v7);
        [v2 appendBytes:&v15 length:1];
        unint64_t v4 = v8;
      }
      unint64_t v3 = v4;
    }
    while (v4 < (unint64_t)[v1 length]);
  }
  id v13 = [v2 copy];

  return v13;
}

void sub_10000FEBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PING: Received payload for PING; creating PONG response. error=%{public}@",
      (uint8_t *)&buf,
      0xCu);
  }

  if (!v3)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x3032000000;
    unsigned int v10 = sub_10000F3E0;
    char v11 = sub_1000100A4;
    id v12 = [[UAPingUserActivityInfo alloc] initFromPing:*(void *)(a1 + 32)];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000100AC;
    v7[3] = &unk_1000C4CA0;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = &buf;
    [*(id *)(*((void *)&buf + 1) + 40) setWasContinuedBlock:v7];
    unsigned __int8 v5 = [*(id *)(a1 + 40) pongItems];
    [v5 addObject:*(void *)(*((void *)&buf + 1) + 40)];

    audit_token_t v6 = [*(id *)(a1 + 40) manager];
    [v6 scheduleUpdatingAdvertisableItems];

    _Block_object_dispose(&buf, 8);
  }
}

void sub_100010084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000100A4(uint64_t a1)
{
}

void sub_1000100AC(uint64_t a1)
{
  uint64_t v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) uuid];
    unint64_t v4 = [v3 UUIDString];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v9 = 138543619;
    unsigned int v10 = v4;
    __int16 v11 = 2113;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "PING: Removing pong item %{public}@/%{private}@ because it was continued ", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPongCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "pongCount") + 1);
  audit_token_t v6 = [*(id *)(a1 + 32) pongItems];
  [v6 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100011154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

void sub_100011320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    audit_token_t v6 = [*(id *)(a1 + 32) name];
    uint64_t v7 = (void *)IOPMCopyUserActivityLevelDescription();
    unint64_t v8 = *(void **)(a1 + 32);
    id v9 = v7;
    unsigned int v10 = [v8 active];
    __int16 v11 = "";
    if (v10) {
      uint64_t v12 = "wasActive";
    }
    else {
      uint64_t v12 = "";
    }
    if ([*(id *)(a1 + 32) firstTime]) {
      __int16 v11 = " firstTime";
    }
    uint64_t v13 = *(void *)(a1 + 32);

    *(_DWORD *)long long buf = 138544386;
    v26 = v6;
    __int16 v27 = 2114;
    v28 = (const char *)v7;
    __int16 v29 = 2082;
    v30 = v12;
    __int16 v31 = 2082;
    v32 = v11;
    __int16 v33 = 2050;
    uint64_t v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IdleTracker: %{public}@: mostSignificantLevel=%{public}@ %{public}s%{public}s weakSelf=%{public}p", buf, 0x34u);
  }
  uint64_t v14 = *(void **)(a1 + 32);
  if (v14)
  {
    unsigned int v15 = [v14 active];
    [*(id *)(a1 + 32) setActive:a3 == 1];
    if ([*(id *)(a1 + 32) enabled])
    {
      if (([*(id *)(a1 + 32) firstTime] & 1) != 0
        || v15 != [*(id *)(a1 + 32) active])
      {
        unsigned int v16 = sub_10000BA18(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = [*(id *)(a1 + 32) name];
          if ([*(id *)(a1 + 32) active]) {
            id v18 = "Active";
          }
          else {
            id v18 = "-";
          }
          v19 = [*(id *)(a1 + 32) startTime];
          [v19 timeIntervalSinceNow];
          sub_10007C2C0(-v20);
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138543874;
          v26 = v17;
          __int16 v27 = 2082;
          v28 = v18;
          __int16 v29 = 2114;
          v30 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "IdleTracker: %{public}@, callingBlock, %{public}s, interval=%{public}@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) setFirstTime:0];
        v22 = [*(id *)(a1 + 32) queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100011670;
        block[3] = &unk_1000C4CF0;
        id v24 = *(id *)(a1 + 32);
        dispatch_async(v22, block);
      }
    }
  }
}

void sub_100011670(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) block];
  v2[2](v2, [*(id *)(a1 + 32) active]);
}

void sub_100011748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100011868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100011978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100011D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011DE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100012110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100012B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_100012DE4(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v6 = a2;
  int v7 = a3;
  char v8 = a4;
  unint64_t v4 = sub_100013104((uint64_t)&v6, a1, NSKeyedArchiveRootObjectKey);
  sub_100013338((uint64_t)&v6);

  return v4;
}

void sub_100012E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100012EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013104(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  if (*(void *)a1 && *(_DWORD *)(a1 + 8))
  {
    id v6 = [objc_alloc((Class)NSData) initWithBytes:*(void *)a1 length:*(unsigned int *)(a1 + 8)];
    id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
    char v8 = v7;
    if (v5) {
      id v9 = v5;
    }
    else {
      id v9 = NSKeyedArchiveRootObjectKey;
    }
    if (a2) {
      [v7 decodeObjectOfClass:a2 forKey:v9];
    }
    else {
    unsigned int v10 = [v7 decodeObjectForKey:v9];
    }
    [v8 finishDecoding];
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

void sub_100013234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013338(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 12))
  {
    if (*(void *)a1)
    {
      vm_size_t v2 = *(unsigned int *)(a1 + 8);
      if (v2) {
        vm_deallocate(mach_task_self_, *(void *)a1, v2);
      }
    }
  }
  return a1;
}

void sub_100013388(void *a1)
{
}

void sub_100013548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  v30 = v28;

  _Unwind_Resume(a1);
}

void sub_100013E90(uint64_t a1)
{
  [*(id *)(a1 + 32) update];
}

void sub_100013ED4(uint64_t a1)
{
  vm_size_t v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    unint64_t v4 = [v3 UUIDString];
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing bestAppSuggestion notifier %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 32);
  [v6 setConnection:0];
  id v7 = [*v5 manager];
  [v7 removeActivityNotifier:*v5];
}

void sub_100013FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014000(uint64_t a1)
{
  vm_size_t v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidating bestAppSuggestion notifier", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100014124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000141CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000146E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100014DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

int64_t sub_100014FD0(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  unint64_t v4 = a2;
  uint64_t v5 = a3;
  if (!sub_10000AA28((uint64_t)[(UAUserActivityInfo *)v4 type])
    && sub_10000AA28((uint64_t)[(UAUserActivityInfo *)v5 type])
    || ([(UAUserActivityInfo *)v5 dynamicActivityType],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(UAUserActivityInfo *)v4 dynamicActivityType],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    int64_t v11 = 1;
  }
  else
  {
    int v8 = [(UAUserActivityInfo *)v5 when];
    id v9 = [(UAUserActivityInfo *)v4 when];
    BOOL v10 = sub_100063D74(v8, v9);

    if (v10) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = -1;
    }
  }

  return v11;
}

void sub_1000150B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, _Unwind_Exception *exception_object, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1000161FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000164A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001653C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000167E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10)
{
  _Unwind_Resume(a1);
}

void sub_100016E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100016EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100017318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v12);
  _Unwind_Resume(a1);
}

void sub_100017B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100017CA0(uint64_t a1)
{
  vm_size_t v2 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    unint64_t v4 = [v3 UUIDString];
    uint64_t v5 = [*(id *)(a1 + 32) wasContinuedInfo];
    int v8 = 138543619;
    id v9 = v4;
    __int16 v10 = 2113;
    int64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "-- Sumbitting metric info for %{public}@, %{private}@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = +[UADiagnosticManager sharedManager];
  id v7 = [*(id *)(a1 + 32) wasContinuedInfo];
  [v6 submitUserActivityWasContinuedInfo:v7];
}

void sub_100017DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000180A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000182D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018330(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = sub_10000BA18(@"signposts");
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 32);
  if (v6 + 1 >= 2 && os_signpost_enabled(v4))
  {
    v7[0] = 67240192;
    v7[1] = v3 == 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "bestAppFetch", "result=%{public}d enableTelemetry=YES ", (uint8_t *)v7, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001842C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t start(int a1, const char **a2)
{
  unint64_t v4 = objc_alloc_init(UACornerActionManager);
  signal(1, (void (__cdecl *)(int))nullsub_6);
  v57 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = +[NSMutableArray array];
  if (a1 >= 2)
  {
    os_signpost_id_t v6 = a2 + 1;
    uint64_t v7 = a1 - 1;
    do
    {
      int v8 = +[NSString stringWithCString:*v6 encoding:4];
      [v5 addObject:v8];

      ++v6;
      --v7;
    }
    while (v7);
  }
  uint64_t v58 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  char v59 = 0;
  int v9 = 0;
  uint64_t v63 = 0;
  char v10 = 1;
  char v60 = 1;
  while (1)
  {
    if (!v5)
    {
      uint64_t v58 = 0;
      LOBYTE(v61) = 0;
      char v59 = 0;
      char v60 = 1;
LABEL_46:
      int v15 = 1;
      BYTE4(v61) = 1;
      uint64_t v62 = 0x100000001;
      int v9 = 1;
      uint64_t v63 = 0x100000001;
      goto LABEL_48;
    }
    if (![v5 count]) {
      break;
    }
    int64_t v11 = [v5 objectAtIndex:0];
    if ((unint64_t)[v5 count] < 2)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = [v5 objectAtIndex:1];
    }
    if (![v11 caseInsensitiveCompare:@"-noDefaultHandlers"])
    {
      char v10 = 0;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-sharingAdvertiser"])
    {
      char v10 = 0;
      HIDWORD(v63) = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-sharingScanner"])
    {
      char v10 = 0;
      int v9 = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-activityReceiver"])
    {
      char v10 = 0;
      LOBYTE(v63) = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-activityAdvertiser"])
    {
      char v10 = 0;
      BYTE4(v62) = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-bestAppSuggestionNotifier"])
    {
      char v10 = 0;
      LOBYTE(v62) = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-userActivityClientProcessesController"])
    {
      char v10 = 0;
      BYTE4(v61) = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-noSandbox"]) {
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-noTerminateOnSIGTERM"])
    {
      char v60 = 0;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-loggingAdvertiser"])
    {
      char v59 = 1;
      goto LABEL_43;
    }
    if (![v11 caseInsensitiveCompare:@"-loopback"])
    {
      LODWORD(v58) = 1;
      goto LABEL_43;
    }
    if ([v11 caseInsensitiveCompare:@"-enableNetworkUserActivity"]
      && [v11 caseInsensitiveCompare:@"-enableCoreSimulator"])
    {
      if (![v11 caseInsensitiveCompare:@"-disableEntitlmentChecking"])
      {
        sub_10000BA18(0);
        log = LOBYTE(v61) = 1;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          LOBYTE(v61) = 1;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "disableEntitlmentChecking=YES", buf, 2u);
        }
        uint64_t v14 = log;
        goto LABEL_41;
      }
      if ([v11 caseInsensitiveCompare:@"-disableReconnectionNotification"])
      {
        if (v12 && ![v11 caseInsensitiveCompare:@"-exitAfter"])
        {
          [v12 doubleValue];
          dispatch_time_t v51 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
          logb = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000193F0;
          block[3] = &unk_1000C4D40;
          v68 = v12;
          dispatch_after(v51, logb, block);

          [v5 removeObjectAtIndex:1];
          uint64_t v14 = v68;
LABEL_41:
        }
      }
      else
      {
        BYTE4(v58) = 1;
      }
    }
LABEL_43:

    [v5 removeObjectAtIndex:0];
  }
  if (v10) {
    goto LABEL_46;
  }
  int v15 = 0;
LABEL_48:
  _set_user_dir_suffix();
  unsigned int v16 = sub_10000BA18(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int loga = v15;
    __int16 v17 = *a2;
    if (!*a2) {
      __int16 v17 = "-";
    }
    v52 = v17;
    id v18 = +[NSMutableString string];
    if (a1 >= 2)
    {
      unint64_t v19 = 1;
      do
      {
        if (v19 <= 1) {
          CFStringRef v20 = &stru_1000C6800;
        }
        else {
          CFStringRef v20 = @" ";
        }
        [v18 appendFormat:@"%@%s", v20, a2[v19++]];
      }
      while (a1 != v19);
    }
    id v21 = [v18 copy];

    int v15 = loga;
    *(_DWORD *)long long buf = 136448002;
    v70 = (void *)v52;
    __int16 v71 = 2082;
    v72 = "";
    __int16 v73 = 2082;
    v74 = "Nov 10 2024";
    __int16 v75 = 2082;
    v76 = "03:52:00";
    __int16 v77 = 2048;
    uint64_t v78 = 0x4081380000000000;
    __int16 v79 = 2082;
    v80 = "Nov 10 2024";
    __int16 v81 = 2082;
    v82 = "03:52:00";
    __int16 v83 = 2114;
    id v84 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: Starting up, %{public}s %{public}s %{public}s version %g built on %{public}s %{public}s.  args=%{public}@", buf, 0x52u);
  }
  if (v61)
  {
    v22 = [(UACornerActionManager *)v4 debugManager];
    [v22 setDisableAdminEntitlmentChecking:1];
  }
  if ((v62 & 0x100000000) != 0)
  {
    v23 = [[UASharingAdvertiser alloc] initWithManager:v4 advertiser:0];
    BOOL v24 = v23 != 0;
    if ((HIDWORD(v63) & v24) == 1)
    {
      if (objc_opt_class())
      {
        v25 = +[UAUserActivityDefaults sharedDefaults];
        unsigned int v26 = [v25 enableSharingFramework];

        if (v26)
        {
          __int16 v27 = +[SFActivityAdvertiser sharedAdvertiser];
          if (!v27)
          {
            v28 = sub_10000BA18(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "### FAILURE trying to add sfActivityAdvertiser, likely Handoff will not work.", buf, 2u);
            }
          }
          [(UASharingAdvertiser *)v23 addSFActivityAdvertiser:v27];
        }
      }
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
    v23 = 0;
  }
  if (v63)
  {
    __int16 v29 = [[UASharingReceiver alloc] initWithManager:v4];
    BOOL v30 = v29 != 0;
    if ((v9 & v30) == 1)
    {
      if (objc_opt_class())
      {
        __int16 v31 = +[UAUserActivityDefaults sharedDefaults];
        unsigned int v32 = [v31 enableSharingFramework];

        if (v32)
        {
          id v33 = [objc_alloc((Class)SFActivityScanner) initWithDelegate:v29];
          if (!v33)
          {
            uint64_t v34 = sub_10000BA18(0);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "### FAILURE trying to add sfActivityScanner, likely Handoff will not work.", buf, 2u);
            }
          }
          [(UASharingReceiver *)v29 addSFActivityScanner:v33];
        }
      }
    }
    if ((v58 & v24) == 1 && v29)
    {
      v35 = [[UAPairedSFActivityAdvertiser alloc] initWithDelegate:v23];
      v36 = [[UAPairedSFActivityScanner alloc] initWithDelegate:v29];
      [(UAPairedSFActivityAdvertiser *)v35 setPairedScanner:v36];
      [(UAPairedSFActivityScanner *)v36 setPairedAdvertiser:v35];
      [(UASharingAdvertiser *)v23 addSFActivityAdvertiser:v35];
      [(UASharingReceiver *)v29 addSFActivityScanner:v36];

      BOOL v30 = 1;
    }
  }
  else
  {
    __int16 v29 = 0;
    BOOL v30 = 0;
  }
  if (v59)
  {
    v37 = [(UAAdvertiser *)[UALoggingAdvertiser alloc] initWithManager:v4 name:@"Logger"];
    [(UACornerActionManager *)v4 addAdvertiser:v37];
  }
  if (v24)
  {
    v38 = sub_10000BA18(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      v70 = v23;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "### Adding SFActivitySharingAdvertiser to manager, %{public}@", buf, 0xCu);
    }

    [(UACornerActionManager *)v4 addAdvertiser:v23];
  }
  if (v30)
  {
    v39 = sub_10000BA18(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      v70 = v29;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "### Adding SFActivityScanner to manager, %{public}@", buf, 0xCu);
    }

    [(UACornerActionManager *)v4 addReceiver:v29];
  }
  if ((v61 & 0x100000000) != 0)
  {
    v40 = [[UAUserActivityClientProcessesController alloc] initWithManager:v4 name:@"AppsActivityCreator"];
    [(UACornerActionManager *)v4 addClient:v40];
  }
  if (v62)
  {
    v41 = [[UABestAppSuggestionController alloc] initWithManager:v4 name:@"BestAppController"];
    [(UABestAppSuggestionController *)v41 setDisableEntitlementsCheck:v61 & 1];
    [(UACornerActionManager *)v4 addHandler:v41];
  }
  else
  {
    v41 = 0;
  }
  v42 = [(UAActivityNotifier *)[UABestAppSuggestionDarwinNotifier alloc] initWithManager:v4 name:@"DarwinNotifier"];
  [(UACornerActionManager *)v4 addActivityNotifier:v42];
  if (v15)
  {
    v43 = [[UASharedPasteboardClientController alloc] initWithManager:v4 name:@"PBClientController"];
    [(UACornerActionManager *)v4 setPasteboardController:v43];

    v44 = [(UACornerActionManager *)v4 pasteboardController];
    [(UACornerActionManager *)v4 addClient:v44];

    v45 = [[UAPingController alloc] initWithManager:v4 name:@"PingController"];
    [(UACornerActionManager *)v4 setPingController:v45];
  }
  if (v60)
  {
    v46 = [(UACornerActionManager *)v4 mainDispatchQ];
    dispatch_source_t v47 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v46);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001949C;
    handler[3] = &unk_1000C4DD0;
    v65 = v4;
    dispatch_source_t v66 = v47;
    v48 = v47;
    dispatch_source_set_event_handler(v48, handler);
    dispatch_source_set_cancel_handler(v48, &stru_1000C4E10);
    dispatch_resume(v48);
  }
  [(UACornerActionManager *)v4 resume];
  if ((v58 & 0x100000000) == 0) {
    notify_post("com.apple.coreservices.useractivity.reconnection");
  }

  +[NSXPCListener enableTransactions];
  v49 = +[NSRunLoop currentRunLoop];
  [v49 run];

  return 0;
}

void sub_100019238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1000193F0(uint64_t a1)
{
  id v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) doubleValue];
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "### Auto-exiting after %g seconds; likely crashed during a unit test and want to clean up.",
      (uint8_t *)&v5,
      0xCu);
  }

  exit(0);
}

void sub_100019484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001949C(uint64_t a1)
{
  vm_size_t v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received SIGTERM; terminating useractivityd.",
      v3,
      2u);
  }

  [*(id *)(a1 + 32) terminate];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_100019574(id a1)
{
  qword_1000E66E8 = objc_alloc_init(UASharedPasteboardDataManager);

  _objc_release_x1();
}

void sub_10001974C(id a1)
{
  if (confstr(65537, v4, 0x400uLL))
  {
    id v1 = +[NSString stringWithCString:v4 encoding:4];
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"shared-pasteboard/"];
    id v3 = (void *)qword_1000E66F8;
    qword_1000E66F8 = v2;
  }
}

void sub_10001AD0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001AE50(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B080(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001B7E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v12 = 0;
  [v4 removeItemAtURL:v3 error:&v12];

  id v5 = v12;
  uint64_t v6 = sub_10000BA18(@"pasteboard-server");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v14 = v5;
      int v8 = "Error deleting item: %{public}@";
      int v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int64_t v11 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    id v14 = v11;
    int v8 = "Deleted file for item: %{public}@";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

void sub_10001C004(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deleting file for item: %@", buf, 0xCu);
  }

  uint64_t v6 = +[NSFileManager defaultManager];
  id v9 = 0;
  [v6 removeItemAtURL:v3 error:&v9];

  id v7 = v9;
  if (v7)
  {
    int v8 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error deleting item: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10001C4B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v15 = 0;
  unsigned int v5 = [v4 removeItemAtURL:v3 error:&v15];

  id v6 = v15;
  id v7 = sub_10000BA18(@"pasteboard-server");
  int v8 = v7;
  if (v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v9 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138477827;
    id v17 = v9;
    os_log_type_t v10 = "Deleted copied item: %{private}@";
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    double v13 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138477827;
    id v17 = v13;
    os_log_type_t v10 = "Failed to delete item: %{private}@";
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, 0xCu);
LABEL_7:

  if (v6)
  {
    id v14 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error deleting item: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10001C958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

id sub_10001CCE8()
{
  if (qword_1000E6710 != -1) {
    dispatch_once(&qword_1000E6710, &stru_1000C4EC0);
  }
  v0 = (void *)qword_1000E6708;

  return v0;
}

void sub_10001D194(id a1)
{
  id v2 = +[NSInputStream inputStreamWithFileAtPath:@"/System/Library/CoreServices/SystemVersion.plist"];
  [v2 open];
  id v1 = +[NSPropertyListSerialization propertyListWithStream:v2 options:0 format:0 error:0];
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&qword_1000E6708, v1);
    }
  }
  [v2 close];
}

void sub_10001D4B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D5D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D6F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10001DD08(uint64_t a1)
{
  id v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Streams stalled, erroring out the paste operation.", v11, 2u);
  }

  id v3 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-132 userInfo:0];
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained receivedPasteboardInfo:0 withError:v3];

  id v6 = objc_loadWeakRetained(v4);
  [v6 completedReceivingPasteboardWithError:v3];

  id v7 = objc_loadWeakRetained(v4);
  [v7 sendCompletedWithError:v3];

  id v8 = objc_loadWeakRetained(v4);
  id v9 = [v8 streamHandler];
  [v9 stop];

  id v10 = objc_loadWeakRetained(v4);
  [v10 setState:8];
}

id sub_10001DFE8(unint64_t a1)
{
  if (a1 >= 9)
  {
    id v1 = +[NSString stringWithFormat:@"ucStreamState:%d", a1];
  }
  else
  {
    id v1 = *(&off_1000C4F78 + a1);
  }

  return v1;
}

void sub_10001E0CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001E430(unint64_t a1)
{
  if (a1 >= 0xB)
  {
    id v1 = +[NSString stringWithFormat:@"tag:%d", a1];
  }
  else
  {
    id v1 = *(&off_1000C4FC0 + a1);
  }

  return v1;
}

void sub_10001E838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F034(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001FAC0(uint64_t a1)
{
  id v2 = +[UASharedPasteboardDataManager sharedInstance];
  [v2 releaseLockForItem:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 40) uuidItemMap];
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  [v3 setObject:0 forKeyedSubscript:v4];

  unsigned int v5 = [*(id *)(a1 + 40) uuidItemMap];
  id v6 = [v5 allValues];
  id v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) completedReceivingPasteboardWithError:0];
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);

  return [v8 removeObject:v9];
}

void sub_1000209C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000210E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)(a1 + 32);
      v6[0] = 67109378;
      v6[1] = v5;
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CODERV2] Error obtaining lock for item %d: %{public}@", (uint8_t *)v6, 0x12u);
    }
  }
}

void sub_100021CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
}

void sub_100021D48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendHeartbeat];
}

void sub_100021D88(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) state] == (id)8)
  {
    uint64_t v4 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CODERV2] Don't do anything with archives after stream is marked done", (uint8_t *)&v25, 2u);
    }
  }
  else if (a2 < 0)
  {
    v23 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = *(void **)(a1 + 40);
      int v25 = 138412290;
      unsigned int v26 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[CODERV2] Error creating archive for file: %@", (uint8_t *)&v25, 0xCu);
    }

    [*(id *)(a1 + 32) sendStopWithError:-122];
  }
  else
  {
    int v5 = +[UASharedPasteboardDataManager sharedInstance];
    id v6 = [v5 readHandleForArchiveWithUUID:*(void *)(a1 + 48)];

    __int16 v7 = [[UCFilePackager alloc] initWithFile:v6 fileSize:a2 packetSize:0x10000 options:&__NSDictionary0__struct receiver:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 48) UUIDString];
    [(UCFilePackager *)v7 setUuid:v8];

    [(UCFilePackager *)v7 setTag:8];
    uint64_t v9 = [*(id *)(a1 + 32) archiveQueue];
    objc_sync_enter(v9);
    id v10 = [*(id *)(a1 + 32) archivePackagers];
    id v11 = [*(id *)(a1 + 48) UUIDString];
    [v10 setObject:v7 forKeyedSubscript:v11];

    objc_msgSend(*(id *)(a1 + 32), "setTotalSendSize:", (char *)objc_msgSend(*(id *)(a1 + 32), "totalSendSize") + a2);
    objc_sync_exit(v9);

    os_log_type_t v12 = [*(id *)(a1 + 32) requestedArchives];
    objc_sync_enter(v12);
    double v13 = [*(id *)(a1 + 32) requestedArchives];
    id v14 = [*(id *)(a1 + 48) UUIDString];
    LODWORD(v11) = [v13 containsObject:v14];

    if (v11)
    {
      [(UCFilePackager *)v7 deliverNextPacket];
      id v15 = [*(id *)(a1 + 32) requestedArchives];
      unsigned int v16 = [*(id *)(a1 + 48) UUIDString];
      [v15 removeObject:v16];
    }
    objc_sync_exit(v12);

    id v17 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 48) UUIDString];
      int v25 = 138412290;
      unsigned int v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[CODERV2] Created packager for archive: %@", (uint8_t *)&v25, 0xCu);
    }
    if ((*(void *)(a1 + 64) & 0x8000000000000000) == 0) {
      sandbox_extension_release();
    }
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 56)];
    unint64_t v19 = [*(id *)(a1 + 32) objects];
    BOOL v20 = [v19 count] == 0;

    if (v20)
    {
      id v21 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) totalSendSize]);
        int v25 = 138412290;
        unsigned int v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[CODERV2] Done archiving all objects, total send size: %@", (uint8_t *)&v25, 0xCu);
      }
      [*(id *)(a1 + 32) sendTotalSendSize];
    }
  }
}

void sub_100022198(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022364(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000226E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022968(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000230B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerWatchdog];
}

void sub_100023608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100023924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100023A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023D88(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10002490C(id a1)
{
  qword_1000E6728 = objc_alloc_init(UACornerActionManager);

  _objc_release_x1();
}

void sub_100024F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

id sub_10002502C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineWhenSystemGoesIdleThread];
}

id sub_100025034(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfBestApplicationChangedThread];
}

id sub_10002503C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateUserActiveState:a2];
}

void sub_10002518C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000253CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100025590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1000257C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000257F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) mainDispatchQ];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1000258CC;
  v7[3] = &unk_1000C50A8;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_1000258BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000258CC(uint64_t a1)
{
  id v2 = sub_10000BA18(@"signposts");
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 + 1 >= 2 && os_signpost_enabled(v2))
  {
    BOOL v16 = *(void *)(a1 + 40) == 0;
    int v17 = 67240192;
    LODWORD(v18) = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, v4, "handoffFetchSpeculative", "success=%{public}d enableTelemetry=YES ", (uint8_t *)&v17, 8u);
  }

  BOOL v5 = *(void *)(a1 + 40) == 0;
  id v6 = sub_10000BA18(0);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      double v13 = [*(id *)(a1 + 32) uuid];
      id v14 = [v13 UUIDString];
      id v15 = [*(id *)(a1 + 32) logString];
      int v17 = 138543619;
      id v18 = v14;
      __int16 v19 = 2113;
      BOOL v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "DETERMINE: Activity %{public}@/%{private}@ had unsynchronized documents, so we asked it to update and we've heard back.", (uint8_t *)&v17, 0x16u);
    }
    return [*(id *)(a1 + 48) scheduleUpdatingAdvertisableItems];
  }
  else
  {
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) uuid];
      uint64_t v9 = [v8 UUIDString];
      uint64_t v10 = [*(id *)(a1 + 32) logString];
      uint64_t v11 = *(void *)(a1 + 40);
      int v17 = 138543875;
      id v18 = v9;
      __int16 v19 = 2113;
      BOOL v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "DETERMINE: Activity %{public}@/%{private}@ had unsynchronized documents, so we asked it to update and we've heard back with an error %{public}@.", (uint8_t *)&v17, 0x20u);
    }
    return [*(id *)(a1 + 48) scheduleUpdatingAdvertisableItems:*(double *)(a1 + 56)];
  }
}

void sub_100025B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025D88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10002670C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000269CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

id sub_100026A08(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = sub_10000BA18(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "*** SUSPENDING ADVERTISER %{public}@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 32) suspend];
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "*** RESUMING ADVERTISER %{public}@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 32) resume];
  }
}

void sub_100026DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100027220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000272A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100027414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002763C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000276E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100027820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100027B88(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CornerActionManager: Triggering all because the state of Bluetooth changed to %{BOOL}d", (uint8_t *)v7, 8u);
  }

  return [*(id *)(a1 + 32) triggerAll];
}

void sub_100027D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1000282D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);

  objc_sync_exit(v49);
  _Unwind_Resume(a1);
}

uint64_t sub_1000283B4(uint64_t a1)
{
  int v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received kMobileKeyBagLockStatusNotifyToken notification, after first unlock, so the system can start processing activities.", v4, 2u);
  }

  [*(id *)(a1 + 32) triggerUserIdleDetermination];
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

void sub_100028D9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028F10()
{
  v0 = sub_10000BA18(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "## Received com.apple.location.changed so restarting deamon", v1, 2u);
  }

  exit(0);
}

id sub_100028F74(uint64_t a1)
{
  int v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "UserActivity, received UAUserActivityManagerActivityContinuationIsEnabledChangedNotification notification, so spinning all threads.", v4, 2u);
  }

  return [*(id *)(a1 + 32) triggerAll];
}

void sub_100028FEC(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(token, &state64);
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (!state) {
    [*(id *)(a1 + 32) updateUIDeviceLockedState:state64 != 0];
  }
  objc_sync_exit(v4);
}

void sub_100029068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id sub_100029080(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state((int)[*(id *)(a1 + 32) backlightLevelToken], &state64);
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = state64 != 0;
  int v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 120)) {
      CFStringRef v3 = @"On";
    }
    else {
      CFStringRef v3 = @"Off";
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Backlight %@", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  if ([v4 isBacklightOn]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [*(id *)(a1 + 32) isMirroringActive] ^ 1;
  }
  return [v4 updateScreenDimStateState:v5];
}

void sub_1000291D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 67109120;
    LODWORD(v11) = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Mirroring active state update: %d", (uint8_t *)&v10, 8u);
  }

  unsigned int v6 = [*(id *)(a1 + 32) isMirroringActive];
  [*(id *)(a1 + 32) setIsMirroringActive:v4 != 0];
  if ((v4 != 0) != v6)
  {
    uint64_t v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ([*(id *)(a1 + 32) isMirroringActive]) {
        int v8 = "yes";
      }
      else {
        int v8 = "no";
      }
      CFStringRef v9 = "no";
      if (([*(id *)(a1 + 32) isBacklightOn] & 1) == 0
        && ![*(id *)(a1 + 32) isMirroringActive])
      {
        CFStringRef v9 = "yes";
      }
      int v10 = 136315394;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      double v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Mirroring state changed, updating isUserActive with isMirroringActive %s and screenDimState with %s", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }
}

void sub_100029374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000293A0(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) mainDispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029430;
  block[3] = &unk_1000C4D40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_100029430(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "--- Received MCEffectiveSettingsChangedNotification notification, so signalling all our queues to re-check what's allowed.", v5, 2u);
  }

  [*(id *)(a1 + 32) triggerAll];
  objc_sync_exit(v3);
}

void sub_1000294DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id sub_1000294F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineItemToAdvertiseForHandoffThread];
}

void sub_1000298FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_100029948(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v28 = a2;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v13 active] && objc_msgSend(v13, "advertising"))
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v14 = [v13 advertisingItems];
          id v15 = (char *)[v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v34;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v14);
                }
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                if (v11 >= a4) {
                  double v19 = v11;
                }
                else {
                  double v19 = a4;
                }
                if (v11 >= a3) {
                  double v20 = v11;
                }
                else {
                  double v20 = a3;
                }
                if (isKindOfClass) {
                  double v11 = v19;
                }
                else {
                  double v11 = v20;
                }
              }
              id v15 = (char *)[v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
            }
            while (v15);
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v28;
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v21);
        }
        int v25 = *(void **)(*((void *)&v29 + 1) + 8 * (void)k);
        if ([v25 active])
        {
          [v25 intervalToDelaySuspensionOfAdvertisingForItem:0];
          if (v11 < v26) {
            double v11 = v26;
          }
        }
      }
      id v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v22);
  }

  return v11;
}

void sub_100029BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_100029C58(uint64_t a1, int a2)
{
  id v4 = sub_10000BA18(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "userInactivePowerAssertion, power assertion timed out and expired, so triggering user idle determination.", buf, 2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "userInactivePowerAssertion, userInactivePowerAssertion power assertion removed.", v7, 2u);
    }
  }
  [*(id *)(a1 + 32) setUserInactivePowerAssertion:0];
  return [*(id *)(a1 + 32) scheduleUpdatingAdvertisableItems];
}

void sub_10002A0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002A11C(uint64_t a1, int a2)
{
  id v4 = sub_10000BA18(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "screenDimmedPowerAssertion, power assertion timed out and expired, so triggering user idle determination.", buf, 2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "screenDimmedPowerAssertion, screenDimmedPowerAssertion power assertion removed.", v7, 2u);
    }
  }
  [*(id *)(a1 + 32) setScreenDimmedPowerAssertion:0];
  return [*(id *)(a1 + 32) scheduleUpdatingAdvertisableItems];
}

void sub_10002A594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002A5E4(uint64_t a1, int a2)
{
  id v4 = sub_10000BA18(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, power assertion timed out and expired, so triggering user idle determination.", buf, 2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, power assertion removed.", v7, 2u);
    }
  }
  return [*(id *)(a1 + 32) setDeviceUILockedPowerAssertion:0];
}

void sub_10002A7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002ACB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002AD94(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  id v6 = [(UACornerActionManagerHandler *)v4 priority];
  if (v6 == (id)[(UACornerActionManagerHandler *)v5 priority])
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v8 = [(UACornerActionManagerHandler *)v4 priority];
    if (v8 < [(UACornerActionManagerHandler *)v5 priority]) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
  }

  return v7;
}

void sub_10002AE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002AE30(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10000F3F0;
  v16[4] = sub_10002D82C;
  id v17 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D834;
  v12[3] = &unk_1000C5300;
  id v14 = a4;
  id v15 = v16;
  id v13 = v7;
  id v9 = v14;
  id v10 = v7;
  id v11 = v8;
  [a2 enumerateLinesUsingBlock:v12];

  _Block_object_dispose(v16, 8);
}

void sub_10002AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10002AF9C(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  id v6 = [(UACornerActionManagerHandler *)v4 priority];
  if (v6 == (id)[(UACornerActionManagerHandler *)v5 priority])
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v8 = [(UACornerActionManagerHandler *)v4 priority];
    if (v8 < [(UACornerActionManagerHandler *)v5 priority]) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
  }

  return v7;
}

void sub_10002B024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,void *a29,uint64_t a30,_Unwind_Exception *exception_object,uint64_t a32,uint64_t a33,void *a34)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C5B0(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  id v6 = [(UACornerActionManagerHandler *)v4 priority];
  if (v6 == (id)[(UACornerActionManagerHandler *)v5 priority])
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v8 = [(UACornerActionManagerHandler *)v4 priority];
    if (v8 < [(UACornerActionManagerHandler *)v5 priority]) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
  }

  return v7;
}

void sub_10002C638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C64C(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  id v6 = [(UACornerActionManagerHandler *)v4 priority];
  if (v6 == (id)[(UACornerActionManagerHandler *)v5 priority])
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v8 = [(UACornerActionManagerHandler *)v4 priority];
    if (v8 < [(UACornerActionManagerHandler *)v5 priority]) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
  }

  return v7;
}

void sub_10002C6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C6E8(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  id v4 = a3;
  BOOL v5 = [(UAUserActivityInfo *)a2 uuid];
  id v6 = [v5 UUIDString];
  int64_t v7 = [(UAUserActivityInfo *)v4 uuid];
  int64_t v8 = [v7 UUIDString];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_10002C780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C7C0(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a3;
  BOOL v5 = [(UACornerActionManagerHandler *)a2 uuid];
  id v6 = [v5 UUIDString];
  int64_t v7 = [(UACornerActionManagerHandler *)v4 uuid];
  int64_t v8 = [v7 UUIDString];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_10002C858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C898(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  id v4 = a3;
  BOOL v5 = [(UACornerActionManagerHandler *)a2 uuid];
  id v6 = [v5 UUIDString];
  int64_t v7 = [(UACornerActionManagerHandler *)v4 uuid];
  int64_t v8 = [v7 UUIDString];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_10002C930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10002C970(id a1, UAClientController *a2, UAClientController *a3)
{
  id v4 = a3;
  BOOL v5 = [(UACornerActionManagerHandler *)a2 uuid];
  id v6 = [v5 UUIDString];
  int64_t v7 = [(UACornerActionManagerHandler *)v4 uuid];
  int64_t v8 = [v7 UUIDString];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_10002CA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CB68(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10002CC8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10002CD08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10002CDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002CE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002CEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002CFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002D018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10002D0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002D148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002D1BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10002D250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002D2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002D3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D7CC(id a1)
{
  id v1 = strstr("@(#)PROGRAM:useractivityd  PROJECT:UserActivity-551\n", "PROJECT:UserActivity-");
  if (v1)
  {
    strlcpy(byte_1000E6739, v1 + 21, 0x40uLL);
    int v2 = strrchr(byte_1000E6739, 10);
    if (v2) {
      char *v2 = 0;
    }
  }
}

void sub_10002D82C(uint64_t a1)
{
}

void sub_10002D834(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "appendString:");
  }
  [*(id *)(a1 + 32) appendString:v3];
  [*(id *)(a1 + 32) appendString:@"\n"];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
}

void sub_10002D8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002E770(_Unwind_Exception *a1)
{
  int64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_10002E85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E8C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002EA30(_Unwind_Exception *a1)
{
  BOOL v5 = v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002EBD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002F460(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[REMOTE GEN] Responding to type Info request", v8, 2u);
  }

  if ([*(id *)(a1 + 32) state] == (id)6)
  {
    id v3 = [*(id *)(a1 + 32) error];

    if (!v3)
    {
      id v4 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
      [*(id *)(a1 + 32) setError:v4];

      [*(id *)(a1 + 32) setPbInfo:0];
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) pbInfo];
  int64_t v7 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);
}

void sub_10002F588(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setPayloadXferTime:", +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - *(void *)(a1 + 48)));
  int64_t v7 = sub_10000BA18(@"pasteboard-server");
  int64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v73 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[REMOTE GEN] Type payload fetch error: %{public}@", buf, 0xCu);
    }

    uint64_t v9 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v70 = NSUnderlyingErrorKey;
    id v71 = v6;
    id v10 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    id v11 = +[NSError errorWithDomain:v9 code:-120 userInfo:v10];

    __int16 v12 = +[UADiagnosticManager sharedManager];
    [v12 submitRemotePasteboardBecameUnavailable:4];

    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
    id v13 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138477827;
      id v73 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Type Fetch Info: %{private}@", buf, 0xCu);
    }

    id v15 = +[UADiagnosticManager sharedManager];
    [v15 submitRemotePasteboardTypeInfoRequested:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) updateState:1];
    [*(id *)(a1 + 40) setError:v11];
  }
  else
  {
    uint64_t v54 = a1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Received type info", buf, 2u);
    }

    v55 = v5;
    id v16 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
    id v17 = [v16 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    id v53 = v16;
    [v16 finishDecoding];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v52 = v17;
    id v18 = [v17 pbinfo];
    double v19 = [v18 items];

    id obj = v19;
    id v20 = [v19 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v63;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(obj);
          }
          BOOL v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          int v25 = [v24 types];
          double v26 = [v25 allKeys];

          id v27 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v59;
            do
            {
              for (j = 0; j != v28; j = (char *)j + 1)
              {
                if (*(void *)v59 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
                long long v32 = [v24 types];
                long long v33 = [v32 objectForKeyedSubscript:v31];
                [v33 setDataFile:0];
              }
              id v28 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
            }
            while (v28);
          }
        }
        id v21 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v21);
    }

    if ((uint64_t)[v52 protocolVersion] < 1) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = (uint64_t)[v52 protocolVersion];
    }
    id v5 = v55;
    a1 = v54;
    [*(id *)(v54 + 40) setStreamProtocolVersion:v34];
    long long v35 = sub_10000BA18(@"pasteboard-server");
    id v6 = 0;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v36 = [*(id *)(v54 + 40) streamProtocolVersion];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v73) = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Setting protocol version: %d", buf, 8u);
    }

    objc_msgSend(*(id *)(v54 + 32), "setPayloadSize:", objc_msgSend(v55, "length"));
    long long v37 = [v52 pbinfo];
    [*(id *)(v54 + 40) setPbInfo:v37];

    [*(id *)(v54 + 40) updateState:3];
    if ([v52 extraDataType] == (id)2)
    {
      long long v38 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Received extra data, saving for later", buf, 2u);
      }

      [*(id *)(v54 + 40) updateState:5];
      long long v39 = +[UASharedPasteboardDataManager sharedInstance];
      long long v40 = [v39 createFileForRemotePasteboardBlob];
      v41 = [v52 extraData];
      id v57 = 0;
      [v40 writeData:v41 error:&v57];
      id v42 = v57;

      if (v42)
      {
        uint64_t v43 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v66 = NSUnderlyingErrorKey;
        id v67 = v42;
        v44 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        v45 = +[NSError errorWithDomain:v43 code:-128 userInfo:v44];

        v46 = +[UADiagnosticManager sharedManager];
        [v46 submitRemotePasteboardBecameUnavailable:4];

        objc_msgSend(*(id *)(v54 + 32), "setErrorCode:", objc_msgSend(v45, "code"));
        [*(id *)(v54 + 40) updateState:1];
        [*(id *)(v54 + 40) setError:v45];
      }
    }
    dispatch_source_t v47 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [*(id *)(v54 + 32) description];
      v49 = sub_100063FF0(v48);
      *(_DWORD *)long long buf = 138477827;
      id v73 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Type Fetch Info: %{private}@", buf, 0xCu);
    }
    v50 = +[UADiagnosticManager sharedManager];
    [v50 submitRemotePasteboardTypeInfoRequested:*(void *)(v54 + 32)];

    id v11 = v53;
  }

  dispatch_time_t v51 = [*(id *)(a1 + 40) respQueue];
  dispatch_activate(v51);
}

void sub_100030028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100030054(uint64_t a1)
{
}

void sub_10003005C(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

char *sub_1000301D4(void *a1, long long *a2)
{
  id v3 = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], v7);
  if (v3)
  {
    long long v5 = *a2;
    long long v6 = a2[1];
    id v3 = (char *)sandbox_extension_issue_file_to_process();
    if (v3)
    {
      +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v3, strlen(v3), 1, v5, v6);
      id v3 = (char *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

void sub_1000306B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000306D4(id a1)
{
  id v1 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Client Notification Connection interrupted(pboardd crash?)", v2, 2u);
  }
}

void sub_100030744(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Client Notification Connection invalidated; remote copy/paste will no longer work.",
      v4,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setClientNotificationConnection:0];
}

void sub_1000308AC(id a1)
{
  qword_1000E6788 = +[NSUUID UUID];

  _objc_release_x1();
}

void sub_100030AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030DA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030E40;
    block[3] = &unk_1000C4CF0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100030E40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
}

void sub_100030E50(id a1, NSError *a2)
{
  int v2 = a2;
  id v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    long long v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error getting client connection: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100030FE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031540(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Received pasteboard info: %@", (uint8_t *)&v6, 0xCu);
  }

  long long v5 = [v3 items];
  [*(id *)(a1 + 32) setCurrentLocalPasteboard:v5];

  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocalPasteboardSize:", objc_msgSend(v3, "dataSize"));
  [*(id *)(a1 + 32) setRemotePasteboardAvalibility:1 withDataRequester:0];
}

void sub_100031B7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (a3)
  {
    v4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031C4C;
    block[3] = &unk_1000C4CF0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v4();
  }
}

id sub_100031C4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
}

void sub_100032588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100032624(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    if (v5)
    {
      [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
      int64_t v8 = +[UADiagnosticManager sharedManager];
      [v8 submitRemotePasteboardBecameUnavailable:4];
    }
    uint64_t v9 = [*(id *)(a1 + 32) remoteGeneration];
    [v9 setReturnEarly:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v10 = +[UASharedPasteboardDataManager sharedInstance];
    [v10 cleanupArchiveDir];
  }
}

void sub_10003271C(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard Fetch Cancelled", buf, 2u);
  }

  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained pasteInfo];
  [v5 setCancelled:1];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [v6 remoteGeneration];
  [v7 updateState:6];

  int64_t v8 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [v9 coders];

  objc_sync_enter(v10);
  id v11 = objc_loadWeakRetained(v3);
  __int16 v12 = [v11 coders];
  id v13 = [v12 copy];

  objc_sync_exit(v10);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v17);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v18, "cancelReceive", (void)v21);
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v15);
  }

  double v19 = +[UASharedPasteboardDataManager sharedInstance];
  [v19 cancelAllLocks];

  id v20 = objc_loadWeakRetained(v3);
  [v20 hideProgressUI:0];
}

void sub_1000329A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000329C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) fetchProgress];
  unsigned __int8 v8 = [v7 isCancelled];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) pasteFetchStartTime]);
    id v10 = [*(id *)(a1 + 32) pasteInfo];
    [v10 setPayloadXferTime:v9];

    if (v6)
    {
      id v11 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v86 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Payload fetch error: %{public}@", buf, 0xCu);
      }

      uint64_t v12 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v83 = NSUnderlyingErrorKey;
      id v84 = v6;
      id v13 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      id v14 = +[NSError errorWithDomain:v12 code:-120 userInfo:v13];

      id v15 = [*(id *)(a1 + 32) showUITimer];
      [v15 invalidate];

      [*(id *)(a1 + 32) hideProgressUI:1];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v16 = [v5 length];
      id v17 = [*(id *)(a1 + 32) pasteInfo];
      [v17 setPayloadSize:v16];

      double v18 = (double)(unint64_t)[v5 length] * 8.0;
      double v19 = [*(id *)(a1 + 32) pasteInfo];
      unint64_t v20 = (unint64_t)(v18 / ((double)(unint64_t)[v19 payloadXferTime] / 1000000000.0));
      long long v21 = [*(id *)(a1 + 32) pasteInfo];
      [v21 setPayloadXferSpeed:v20];

      id v14 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
      long long v22 = [v14 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
      [v14 finishDecoding];
      long long v23 = [v22 error];

      if (v23)
      {
        long long v24 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v25 = [v22 error];
          *(_DWORD *)long long buf = 138543362;
          id v86 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Payload fetch error: %{public}@", buf, 0xCu);
        }
        double v26 = [*(id *)(a1 + 32) showUITimer];
        [v26 invalidate];

        [*(id *)(a1 + 32) hideProgressUI:0];
        uint64_t v27 = *(void *)(a1 + 48);
        id v28 = [v22 error];
        (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v28);
      }
      else if ([v22 extraDataType] == (id)2)
      {
        uint64_t v29 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] PBData came with stream request, was a small pboard", buf, 2u);
        }

        long long v30 = [*(id *)(a1 + 32) fetchProgress];
        [v30 setTotalUnitCount:1];

        uint64_t v31 = [*(id *)(a1 + 32) fetchProgress];
        [v31 setCompletedUnitCount:1];

        long long v32 = [*(id *)(a1 + 32) showUITimer];
        [v32 invalidate];

        [*(id *)(a1 + 32) hideProgressUI:0];
        long long v33 = +[UASharedPasteboardDataManager sharedInstance];
        uint64_t v34 = [v33 createFileForRemotePasteboardBlob];

        if (v34)
        {
          long long v35 = [v22 extraData];
          id v80 = 0;
          unsigned int v36 = [v34 writeData:v35 error:&v80];
          id v67 = v80;

          if (v36)
          {
            long long v62 = v34;
            long long v63 = v22;
            id v64 = v14;
            uint64_t v65 = a1;
            id v66 = v5;
            long long v37 = [v22 pbinfo];
            long long v38 = +[UASharedPasteboardDataManager sharedInstance];
            long long v39 = [v38 remotePasteboardBlobForReading];
            [v37 setDataFile:v39];

            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v61 = v37;
            id obj = [v37 items];
            id v70 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
            if (v70)
            {
              uint64_t v69 = *(void *)v77;
              do
              {
                uint64_t v40 = 0;
                do
                {
                  if (*(void *)v77 != v69) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v71 = v40;
                  v41 = *(void **)(*((void *)&v76 + 1) + 8 * v40);
                  long long v72 = 0u;
                  long long v73 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  id v42 = [v41 types];
                  id v43 = [v42 countByEnumeratingWithState:&v72 objects:v81 count:16];
                  if (v43)
                  {
                    id v44 = v43;
                    uint64_t v45 = *(void *)v73;
                    do
                    {
                      for (i = 0; i != v44; i = (char *)i + 1)
                      {
                        if (*(void *)v73 != v45) {
                          objc_enumerationMutation(v42);
                        }
                        uint64_t v47 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                        v48 = +[UASharedPasteboardDataManager sharedInstance];
                        v49 = [v48 remotePasteboardBlobForReading];
                        v50 = [v41 types];
                        dispatch_time_t v51 = [v50 objectForKeyedSubscript:v47];
                        [v51 setDataFile:v49];
                      }
                      id v44 = [v42 countByEnumeratingWithState:&v72 objects:v81 count:16];
                    }
                    while (v44);
                  }

                  uint64_t v40 = v71 + 1;
                }
                while ((id)(v71 + 1) != v70);
                id v70 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
              }
              while (v70);
            }

            v52 = [*(id *)(v65 + 32) pasteInfo];
            [v52 setUsedStreams:0];

            id v53 = v61;
            (*(void (**)(void))(*(void *)(v65 + 48) + 16))();
            id v6 = 0;
            id v5 = v66;
            long long v22 = v63;
            id v14 = v64;
            uint64_t v34 = v62;
            uint64_t v54 = v67;
          }
          else
          {
            long long v60 = sub_10000BA18(@"pasteboard-server");
            uint64_t v54 = v67;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v86 = v67;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "ERROR: Error writing pasteboard data blob: %@", buf, 0xCu);
            }

            id v53 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-128 userInfo:0];
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          }
        }
        else
        {
          long long v59 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error creating remote data file", buf, 2u);
          }

          uint64_t v54 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-128 userInfo:0];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      else
      {
        id v55 = [v22 extraDataType];
        v56 = *(void **)(a1 + 32);
        if (v55 == (id)1)
        {
          id v57 = [v22 extraData];
          objc_msgSend(v56, "receivePasteboardStreamData:version:withCompletion:", v57, objc_msgSend(*(id *)(a1 + 40), "streamProtocolVersion"), *(void *)(a1 + 48));
        }
        else
        {
          long long v58 = [*(id *)(a1 + 32) showUITimer];
          [v58 invalidate];

          [*(id *)(a1 + 32) hideProgressUI:0];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
    }
  }
}

void sub_1000333C0(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  int v4 = [v3 showUITimer];
  [v3 showProgressUI:v4];

  [*(id *)(a1 + 32) setStreamOpenStartTime:mach_absolute_time()];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Requesting to open streams with version: %@", buf, 0xCu);
  }
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000335B8;
  v11[3] = &unk_1000C5568;
  v11[4] = *(void *)(a1 + 32);
  objc_copyWeak(v13, &location);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(void **)(a1 + 64);
  id v12 = v9;
  v13[1] = v10;
  [v7 getContinuationStreamsWithEndpointData:v8 completionHandler:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void sub_100033588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1000335B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) fetchProgress];
  unsigned int v11 = [v10 isCancelled];

  if (v11)
  {
    sub_100033BB0(v12, v7, v8);
    goto LABEL_20;
  }
  unint64_t v13 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) streamOpenStartTime]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = [WeakRetained pasteInfo];
  [v15 setStreamOpenTime:v13];

  id v16 = sub_10000BA18(@"pasteboard-server");
  id v17 = v16;
  if (!v9)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Opened streams", buf, 2u);
    }

    long long v22 = +[UASharedPasteboardDataManager sharedInstance];
    long long v23 = [v22 createFileForRemotePasteboardBlob];

    if (!v23)
    {
      long long v33 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Could not create data file for remote pasteboard", buf, 2u);
      }

      uint64_t v34 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-128 userInfo:0];
      sub_100033BB0((uint64_t)v34, v7, v8);
      long long v35 = [*(id *)(a1 + 32) showUITimer];
      [v35 invalidate];

      [*(id *)(a1 + 32) hideProgressUI:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_19;
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100033C58;
    v43[3] = &unk_1000C5518;
    id v24 = *(id *)(a1 + 40);
    v43[4] = *(void *)(a1 + 32);
    id v44 = v24;
    uint64_t v40 = objc_retainBlock(v43);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100034A80;
    v41[3] = &unk_1000C5540;
    objc_copyWeak(&v42, (id *)(a1 + 48));
    v41[4] = *(void *)(a1 + 32);
    int v25 = objc_retainBlock(v41);
    uint64_t v26 = mach_absolute_time();
    id v27 = objc_loadWeakRetained((id *)(a1 + 48));
    [v27 setStreamXferStartTime:v26];

    uint64_t v28 = *(void *)(a1 + 56);
    if (v28 == 2)
    {
      uint64_t v29 = [[UCStreamCoderV2 alloc] initWithInputStream:v7 outputStream:v8];
      unsigned int v36 = [*(id *)(a1 + 32) remoteGeneration];
      id v37 = [v36 returnEarly];

      long long v38 = [*(id *)(a1 + 32) pasteInfo];
      [v38 setIsAsyncTransfer:v37];

      long long v39 = [*(id *)(a1 + 32) fetchProgress];
      [(UCStreamCoderV2 *)v29 receivePasteboardToFile:v23 withProgress:v39 infoReceivedHandler:v40 completionHandler:v25 returnInfoEarly:v37];

      uint64_t v31 = [*(id *)(a1 + 32) coders];
      objc_sync_enter(v31);
      long long v32 = [*(id *)(a1 + 32) coders];
      [v32 addObject:v29];
    }
    else
    {
      if (v28 != 1)
      {
LABEL_18:

        objc_destroyWeak(&v42);
        uint64_t v34 = v44;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v29 = [[UAPBStreamCoderV1 alloc] initWithInputStream:v7 outputStream:v8];
      long long v30 = [*(id *)(a1 + 32) fetchProgress];
      [(UCStreamCoderV2 *)v29 receivePasteboardToFile:v23 withProgress:v30 infoReceivedHandler:v40 completionHandler:v25 returnInfoEarly:0];

      uint64_t v31 = [*(id *)(a1 + 32) coders];
      objc_sync_enter(v31);
      long long v32 = [*(id *)(a1 + 32) coders];
      [v32 addObject:v29];
    }

    objc_sync_exit(v31);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Opened streams with error: %{public}@", buf, 0xCu);
  }

  NSErrorUserInfoKey v45 = NSUnderlyingErrorKey;
  id v46 = v9;
  double v18 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  double v19 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-121 userInfo:v18];

  sub_100033BB0(v20, v7, v8);
  long long v21 = [*(id *)(a1 + 32) showUITimer];
  [v21 invalidate];

  [*(id *)(a1 + 32) hideProgressUI:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_20:
}

void sub_100033B74(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100033BB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (![v5 streamStatus]) {
    [v5 open];
  }
  if (![v4 streamStatus]) {
    [v4 open];
  }
  if ([v5 streamStatus] != (id)6) {
    [v5 close];
  }
  if ([v4 streamStatus] != (id)6) {
    [v4 close];
  }
}

void sub_100033C58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  CFURLRef v6 = a3;
  if (v6)
  {
    id v7 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      CFURLRef v123 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error receiving pboard info: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_75;
  }
  id v8 = [v5 error];

  id v9 = sub_10000BA18(@"pasteboard-server");
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFURLRef v11 = [v5 error];
      *(_DWORD *)long long buf = 138543362;
      CFURLRef v123 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Received error from remote: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    unint64_t v13 = [v5 error];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

    goto LABEL_75;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFURLRef v123 = (CFURLRef)v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Received pboard info: %@", buf, 0xCu);
  }

  id v14 = +[UASharedPasteboardDataManager sharedInstance];
  id v15 = [v14 remotePasteboardBlobForReading];
  id v16 = [v5 pbinfo];
  [v16 setDataFile:v15];

  id v17 = +[UASharedPasteboardDataManager sharedInstance];
  uint64_t v18 = [v17 sharedDataPath];

  v106 = (void *)v18;
  if (v18)
  {
    v102 = objc_alloc_init((Class)NSMutableDictionary);
    double v19 = [v5 pbinfo];
    uint64_t v20 = [v19 items];
    id v21 = [v20 count];
    long long v22 = [*(id *)(a1 + 32) pasteInfo];
    [v22 setNumberOfItems:v21];

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v97 = v5;
    long long v23 = [v5 pbinfo];
    id v24 = [v23 items];

    id obj = v24;
    id v100 = [v24 countByEnumeratingWithState:&v118 objects:v131 count:16];
    if (!v100) {
      goto LABEL_69;
    }
    uint64_t v99 = *(void *)v119;
    uint64_t v108 = a1;
    while (1)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v119 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v101 = v25;
        uint64_t v26 = *(void **)(*((void *)&v118 + 1) + 8 * v25);
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v110 = [v26 types];
        id v112 = [v110 countByEnumeratingWithState:&v114 objects:v130 count:16];
        if (v112)
        {
          uint64_t v111 = *(void *)v115;
          do
          {
            for (i = 0; i != v112; i = (char *)i + 1)
            {
              if (*(void *)v115 != v111) {
                objc_enumerationMutation(v110);
              }
              uint64_t v28 = *(void **)(*((void *)&v114 + 1) + 8 * i);
              uint64_t v29 = +[UASharedPasteboardDataManager sharedInstance];
              long long v30 = [v29 remotePasteboardBlobForReading];
              uint64_t v31 = [v26 types];
              long long v32 = [v31 objectForKeyedSubscript:v28];
              [v32 setDataFile:v30];

              if ([v28 isEqualToString:@"public.file-url"])
              {
                long long v33 = [*(id *)(a1 + 32) pasteInfo];
                [v33 setIsFileCopy:1];

                uint64_t v34 = [v26 types];
                long long v35 = [v34 objectForKeyedSubscript:v28];
                unsigned int v36 = [v35 dataFile];
                id v37 = [v26 types];
                long long v38 = [v37 objectForKeyedSubscript:v28];
                long long v39 = [v38 offset];
                objc_msgSend(v36, "seekToFileOffset:", objc_msgSend(v39, "longLongValue"));

                uint64_t v40 = [v26 types];
                v41 = [v40 objectForKeyedSubscript:v28];
                id v42 = [v41 dataFile];
                id v43 = [v26 types];
                id v44 = [v43 objectForKeyedSubscript:v28];
                NSErrorUserInfoKey v45 = objc_msgSend(v42, "readDataOfLength:", objc_msgSend(v44, "size"));

                id v46 = [v26 types];
                uint64_t v47 = [v46 objectForKeyedSubscript:v28];
                id v48 = [v47 dataFile];
                [v48 seekToFileOffset:0];

                id v49 = v45;
                CFURLRef v50 = CFURLCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)[v49 bytes], (CFIndex)objc_msgSend(v49, "length"), 0x8000100u, 0);
                dispatch_time_t v51 = sub_10000BA18(@"pasteboard-server");
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  CFURLRef v123 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "URL on pasteboard: %@", buf, 0xCu);
                }

                if (!v50
                  || ([(__CFURL *)v50 scheme], (v52 = objc_claimAutoreleasedReturnValue()) == 0)
                  || (id v53 = v52, v54 = [v52 compare:@"file" options:1], v53, v54))
                {
                  id v55 = sub_10000BA18(@"pasteboard-server");
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    CFURLRef v123 = v50;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "[PBOARD CONTROLLER] Non-file: url provide in stream, %{public}@", buf, 0xCu);
                  }
                  goto LABEL_64;
                }
                id v109 = v49;
                v56 = (__CFString *)CFURLCopyPath(v50);
                unsigned int v107 = [(__CFString *)v56 hasSuffix:@"/"];

                id v55 = [(__CFURL *)v50 lastPathComponent];
                id v57 = [v26 types];
                long long v58 = [v57 objectForKeyedSubscript:v28];
                long long v59 = [v58 uuid];
                long long v60 = [v59 UUIDString];
                long long v61 = +[NSString stringWithFormat:@"items/%@/", v60];

                long long v62 = [v106 stringByAppendingPathComponent:v61];
                if (v62 && v61)
                {
                  v105 = v61;
                  long long v63 = +[NSURL fileURLWithPath:v62];
                  id v64 = v63;
                  if (v55) {
                    CFStringRef v65 = (const __CFString *)v55;
                  }
                  else {
                    CFStringRef v65 = &stru_1000C6800;
                  }
                  CFURLRef v66 = [v63 URLByAppendingPathComponent:v65];

                  id v67 = [*(id *)(v108 + 32) remoteGeneration];
                  unsigned int v68 = [v67 returnEarly];

                  if (v68)
                  {
                    v103 = v62;
                    NSFileAttributeType v69 = NSFileTypeDirectory;
                    if (!v107) {
                      NSFileAttributeType v69 = NSFileTypeRegular;
                    }
                    id v70 = v69;
                    uint64_t v71 = sub_10000BA18(@"pasteboard-server");
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      CFURLRef v123 = v66;
                      __int16 v124 = 2112;
                      v125 = v70;
                      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Creating %@ as type %@", buf, 0x16u);
                    }

                    long long v72 = +[NSFileManager defaultManager];
                    long long v73 = [(__CFURL *)v66 path];
                    if (v107)
                    {
                      NSFileAttributeKey v128 = NSFileType;
                      NSFileAttributeType v129 = NSFileTypeDirectory;
                      long long v74 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
                      [v72 createDirectoryAtPath:v73 withIntermediateDirectories:0 attributes:v74 error:0];
                    }
                    else
                    {
                      NSFileAttributeKey v126 = NSFileType;
                      NSFileAttributeType v127 = NSFileTypeRegular;
                      long long v74 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
                      [v72 createFileAtPath:v73 contents:0 attributes:v74];
                    }

                    long long v62 = v103;
                  }
                  long long v76 = sub_10000BA18(@"pasteboard-server");
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    CFURLRef v123 = v66;
                    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] new URL for item: %@", buf, 0xCu);
                  }

                  long long v75 = v66;
                  a1 = v108;
                  if (realpath_DARWIN_EXTSN((const char *)[v75 fileSystemRepresentation], (char *)buf))
                  {
                    long long v77 = sub_10000BA18(@"pasteboard-server");
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)v113 = 0;
                      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Issuing sandbox extension", v113, 2u);
                    }

                    long long v78 = (const char *)sandbox_extension_issue_file();
                    long long v79 = sub_10000BA18(@"pasteboard-server");
                    id v80 = v79;
                    if (v78)
                    {
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)v113 = 0;
                        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Got extension", v113, 2u);
                      }

                      uint64_t v81 = +[NSData dataWithBytesNoCopy:v78 length:strlen(v78) freeWhenDone:1];
                      a1 = v108;
                      if (v81)
                      {
                        id v80 = v81;
                        v104 = v62;
                        v82 = sub_10000BA18(@"pasteboard-server");
                        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)v113 = 0;
                          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Saving sandbox extension to dict", v113, 2u);
                        }

                        NSErrorUserInfoKey v83 = [v26 types];
                        id v84 = [v83 objectForKeyedSubscript:v28];
                        v85 = [v84 uuid];
                        id v86 = [v85 UUIDString];

                        [v102 setObject:v80 forKeyedSubscript:v86];
                        a1 = v108;
                        long long v62 = v104;
                        goto LABEL_61;
                      }
                    }
                    else
                    {
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v113 = 0;
                        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error issuing extension", v113, 2u);
                      }
LABEL_61:
                    }
                  }
                  id v49 = v109;
                  long long v61 = v105;
                }
                else
                {
                  long long v75 = sub_10000BA18(@"pasteboard-server");
                  a1 = v108;
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    CFURLRef v123 = v50;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "[PBOARD CONTROLLER] Corrupt file: url in stream, %{public}@", buf, 0xCu);
                  }
                  id v49 = v109;
                }

LABEL_64:
                continue;
              }
            }
            id v112 = [v110 countByEnumeratingWithState:&v114 objects:v130 count:16];
          }
          while (v112);
        }

        uint64_t v25 = v101 + 1;
      }
      while ((id)(v101 + 1) != v100);
      id v100 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
      if (!v100)
      {
LABEL_69:

        v87 = +[UASharedPasteboardDataManager sharedInstance];
        v88 = [v87 sharedDataPath];
        id v5 = v97;
        v89 = [v97 pbinfo];
        [v89 setSharedDataPath:v88];

        v90 = [v97 pbinfo];
        v91 = v102;
        [v90 setSandboxExtensions:v102];

        v92 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          v93 = [v102 description];
          sub_100063FF0(v93);
          CFURLRef v94 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138412290;
          CFURLRef v123 = v94;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "[PBOARD CONTROLLER] Sending extensions: %@", buf, 0xCu);
        }
        uint64_t v95 = *(void *)(a1 + 40);
        v96 = [v97 pbinfo];
        (*(void (**)(uint64_t, void *, void))(v95 + 16))(v95, v96, 0);

        CFURLRef v6 = 0;
        goto LABEL_74;
      }
    }
  }
  v91 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Unable to get shared temp dir@", buf, 2u);
  }
LABEL_74:

LABEL_75:
}

void sub_100034A80(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v11 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", v9 - (void)[WeakRetained streamXferStartTime]);

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v13 = [v12 pasteInfo];
  [v13 setStreamDataXferTime:v11];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  id v15 = [v14 pasteInfo];
  [v15 setStreamDataSize:a3];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  id v17 = [v16 pasteInfo];
  [v17 setStreamDataXferSpeed:(unint64_t)((double)a3 * 8.0 / ((double)v11 / 1000000000.0))];

  unint64_t v18 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) pasteFetchStartTime]);
  double v19 = [*(id *)(a1 + 32) pasteInfo];
  [v19 setTotalTime:v18];

  if (v8 && [v8 code] != (id)-125)
  {
    id v20 = [v8 code];
    id v21 = [*(id *)(a1 + 32) pasteInfo];
    [v21 setErrorCode:v20];

    long long v22 = [v8 userInfo];
    long long v23 = [v22 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v23)
    {
      id v24 = [v23 code];
      uint64_t v25 = [*(id *)(a1 + 32) pasteInfo];
      [v25 setUnderlyingErrorCode:v24];
    }
  }
  uint64_t v26 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [*(id *)(a1 + 32) pasteInfo];
    uint64_t v28 = [v27 description];
    uint64_t v29 = sub_100063FF0(v28);
    int v36 = 138412290;
    id v37 = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Paste Fetch Info: %@", (uint8_t *)&v36, 0xCu);
  }
  long long v30 = +[UADiagnosticManager sharedManager];
  uint64_t v31 = [*(id *)(a1 + 32) pasteInfo];
  [v30 submitRemotePasteboardWasRequested:v31];

  [*(id *)(a1 + 32) setPasteInfo:0];
  long long v32 = [*(id *)(a1 + 32) showUITimer];
  [v32 invalidate];

  [*(id *)(a1 + 32) hideProgressUI:v8 != 0];
  long long v33 = [*(id *)(a1 + 32) coders];
  objc_sync_enter(v33);
  uint64_t v34 = [*(id *)(a1 + 32) coders];
  [v34 removeObject:v7];

  objc_sync_exit(v33);
  long long v35 = [*(id *)(a1 + 32) remoteGeneration];
  [v35 updateState:5];
}

void sub_100034E10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000352C0(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pboard is small enough to send via BTLE payload", (uint8_t *)&v15, 2u);
  }

  id v3 = [*(id *)(a1 + 32) pboardInfoToSend];
  [v3 setExtraDataType:2];
  id v4 = +[UASharedPasteboardDataManager sharedInstance];
  id v5 = [v4 localPasteboardBlobForReading];
  CFURLRef v6 = [v5 readDataToEndOfFile];
  [v3 setExtraData:v6];

  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v8 = [*(id *)(a1 + 32) localInfo];
  [v8 setUsedStreams:0];

  unint64_t v9 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  id v10 = [*(id *)(a1 + 32) localInfo];
  [v10 setTotalTime:v9];

  unint64_t v11 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 32) localInfo];
    int v15 = 138477827;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@", (uint8_t *)&v15, 0xCu);
  }
  unint64_t v13 = +[UADiagnosticManager sharedManager];
  id v14 = [*(id *)(a1 + 32) localInfo];
  [v13 submitDidSendLocalPasteboard:v14];

  [*(id *)(a1 + 32) setLocalInfo:0];
}

void sub_10003551C(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
    int v16 = 138412290;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Starting pboard service for paste, version: %@", (uint8_t *)&v16, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v4 UUIDString];

  if (objc_opt_class())
  {
    id v6 = [objc_alloc((Class)SFCompanionAdvertiser) initWithServiceType:v5];
    [*(id *)(a1 + 32) setPasteAdvertiser:v6];
  }
  else
  {
    [*(id *)(a1 + 32) setPasteAdvertiser:0];
  }
  id v7 = [*(id *)(a1 + 32) pasteAdvertiser];
  [v7 setSupportsStreams:1];

  id v8 = *(void **)(a1 + 32);
  unint64_t v9 = [v8 pasteAdvertiser];
  [v9 setDelegate:v8];

  id v10 = [*(id *)(a1 + 32) pasteAdvertiser];
  [v10 start];

  unint64_t v11 = [*(id *)(a1 + 32) pboardInfoToSend];
  [v11 setExtraDataType:1];
  id v12 = [*(id *)(a1 + 32) pasteAdvertiser];
  unint64_t v13 = [v12 serviceEndpointData];
  [v11 setExtraData:v13];

  [v11 setProtocolVersion:*(void *)(a1 + 48)];
  id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
  [*(id *)(a1 + 32) setSendingCoderVersion:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v15 = [*(id *)(a1 + 32) localInfo];
  [v15 setUsedStreams:1];

  [*(id *)(a1 + 32) setStreamOpenStartTime:mach_absolute_time()];
}

void sub_10003577C(uint64_t a1)
{
  int v2 = +[UASharedPasteboardDataManager sharedInstance];
  id v3 = [v2 createFileForLocalPasteboardBlob];

  if (v3)
  {
    id v4 = +[UASharedPasteboardDataManager sharedInstance];
    id v5 = [v4 fileURLForCloneItems];

    id v6 = [*(id *)(a1 + 32) clientConnection];
    id v7 = v6;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v30, 0, sizeof(v30));
    }
    sub_1000301D4(v5, v30);
    unint64_t v11 = (UASharedPasteboardInfoWrapper *)objc_claimAutoreleasedReturnValue();

    long long v22 = [*(id *)(a1 + 32) clientConnection];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100035BC8;
    v28[3] = &unk_1000C55E0;
    long long v23 = *(void **)(a1 + 40);
    v28[4] = *(void *)(a1 + 32);
    id v29 = v23;
    id v24 = [v22 remoteObjectProxyWithErrorHandler:v28];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100035EC0;
    v25[3] = &unk_1000C5608;
    v25[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 56);
    [v24 writeLocalPasteboardToFile:v3 itemDir:v5 extension:v11 withCompletion:v25];
  }
  else
  {
    id v8 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Failed to create local pasteboard data file", buf, 2u);
    }

    unint64_t v9 = [*(id *)(a1 + 32) pboardFetchSem];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) pboardFetchSem];
      dispatch_semaphore_signal(v10);
    }
    id v5 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-128 userInfo:0];
    unint64_t v11 = objc_alloc_init(UASharedPasteboardInfoWrapper);
    [(UASharedPasteboardInfoWrapper *)v11 setError:v5];
    id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    id v13 = [v5 code];
    id v14 = [*(id *)(a1 + 32) localInfo];
    [v14 setErrorCode:v13];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    int v15 = [*(id *)(a1 + 32) localInfo];
    [v15 setUsedStreams:0];

    unint64_t v16 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
    id v17 = [*(id *)(a1 + 32) localInfo];
    [v17 setTotalTime:v16];

    unint64_t v18 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [*(id *)(a1 + 32) localInfo];
      *(_DWORD *)long long buf = 138477827;
      long long v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@", buf, 0xCu);
    }
    id v20 = +[UADiagnosticManager sharedManager];
    id v21 = [*(id *)(a1 + 32) localInfo];
    [v20 submitDidSendLocalPasteboard:v21];

    [*(id *)(a1 + 32) setLocalInfo:0];
  }
}

void sub_100035BC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error getting client object proxy: %{public}@", buf, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) pboardFetchSem];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) pboardFetchSem];
    dispatch_semaphore_signal(v6);
  }
  uint64_t v7 = UAContinuityErrorDomain;
  NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
  id v22 = v3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  unint64_t v9 = +[NSError errorWithDomain:v7 code:-124 userInfo:v8];

  id v10 = objc_alloc_init(UASharedPasteboardInfoWrapper);
  [(UASharedPasteboardInfoWrapper *)v10 setError:v9];
  unint64_t v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  id v12 = [v9 code];
  id v13 = [*(id *)(a1 + 32) localInfo];
  [v13 setErrorCode:v12];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v14 = [*(id *)(a1 + 32) localInfo];
  [v14 setUsedStreams:0];

  unint64_t v15 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  unint64_t v16 = [*(id *)(a1 + 32) localInfo];
  [v16 setTotalTime:v15];

  id v17 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = [*(id *)(a1 + 32) localInfo];
    *(_DWORD *)long long buf = 138477827;
    id v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@", buf, 0xCu);
  }
  double v19 = +[UADiagnosticManager sharedManager];
  id v20 = [*(id *)(a1 + 32) localInfo];
  [v19 submitDidSendLocalPasteboard:v20];

  [*(id *)(a1 + 32) setLocalInfo:0];
}

void sub_100035EC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Received pasteboard info: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setHasFetchedLocalData:1];
  unint64_t v8 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  unint64_t v9 = [*(id *)(a1 + 32) localInfo];
  [v9 setClientWriteTime:v8];

  id v10 = [v5 dataSize];
  unint64_t v11 = [*(id *)(a1 + 32) localInfo];
  [v11 setClientWriteSize:v10];

  double v12 = (double)(uint64_t)[v5 dataSize] * 8.0;
  id v13 = [*(id *)(a1 + 32) localInfo];
  unint64_t v14 = (unint64_t)(v12 / ((double)(unint64_t)[v13 clientWriteTime] / 1000000000.0));
  unint64_t v15 = [*(id *)(a1 + 32) localInfo];
  [v15 setClientWriteSpeed:v14];

  unint64_t v16 = objc_alloc_init(UASharedPasteboardInfoWrapper);
  id v17 = v16;
  if (v6)
  {
    [(UASharedPasteboardInfoWrapper *)v16 setError:v6];
  }
  else
  {
    id v18 = objc_alloc_init((Class)UASharedPasteboardInfo);
    double v19 = [v5 items];
    [v18 setItems:v19];

    objc_msgSend(v18, "setDataSize:", objc_msgSend(v5, "dataSize"));
    [(UASharedPasteboardInfoWrapper *)v17 setPbinfo:v18];
  }
  [*(id *)(a1 + 32) setPboardInfoToSend:v17];
  id v20 = [*(id *)(a1 + 32) pboardFetchSem];

  if (v20)
  {
    NSErrorUserInfoKey v21 = [*(id *)(a1 + 32) pboardFetchSem];
    dispatch_semaphore_signal(v21);
  }
  id v22 = +[UAUserActivityDefaults sharedDefaults];
  id v23 = [v22 pasteboardEmbeddedPayloadSizeLimitInBytes];

  id v24 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = [(UASharedPasteboardInfoWrapper *)v17 pbinfo];
    id v26 = [v25 dataSize];
    *(_DWORD *)long long buf = 134218240;
    id v49 = v26;
    __int16 v50 = 2048;
    id v51 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] pbsize: %ld, payload size limit: %ld", buf, 0x16u);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v27 = [v5 items];
  id v28 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v28)
  {
    id v29 = v28;
    id v39 = v23;
    uint64_t v40 = v17;
    id v41 = v6;
    id v42 = v5;
    char v30 = 0;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v27);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "types", v39, v40, v41, v42);
        uint64_t v34 = [v33 allKeys];
        unsigned __int8 v35 = [v34 containsObject:@"public.file-url"];

        v30 |= v35;
      }
      id v29 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v29);

    id v6 = v41;
    id v5 = v42;
    id v23 = v39;
    id v17 = v40;
    if (v30) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v36 = [(UASharedPasteboardInfoWrapper *)v17 pbinfo];
  id v37 = [v36 dataSize];

  if ((uint64_t)v37 >= (uint64_t)v23)
  {
LABEL_22:
    uint64_t v38 = a1 + 48;
    goto LABEL_23;
  }
  uint64_t v38 = a1 + 40;
LABEL_23:
  (*(void (**)(void))(*(void *)v38 + 16))();
}

void sub_100036300(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Telling client pboard will be fetched", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) clientNotificationConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100036464;
  v7[3] = &unk_1000C5658;
  id v8 = *(id *)(a1 + 40);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036580;
  v5[3] = &unk_1000C4E78;
  id v6 = *(id *)(a1 + 40);
  [v4 pasteboardWillBeFetched:v5];
}

void sub_100036464(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error getting client connection for write notification: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Attempting to get local pasteboard data", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100036580(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Getting pboard written to file", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000369D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_sync_exit(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100036A14(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  unint64_t v9 = sub_10000BA18(@"pasteboard-server");
  id WeakRetained = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v41 = 138543362;
      CFStringRef v42 = v8;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Error sending types: %{public}@", (uint8_t *)&v41, 0xCu);
    }

    id v11 = [(__CFString *)v8 code];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v12 = [WeakRetained localInfo];
    [v12 setErrorCode:v11];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v41 = 138412290;
    CFStringRef v42 = @"All";
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Finished sending types: %@", (uint8_t *)&v41, 0xCu);
  }

  id v13 = (id *)(a1 + 32);
  id v14 = objc_loadWeakRetained(v13);
  unint64_t v15 = [v14 localInfo];
  [v15 setStreamDataSize:a3];

  uint64_t v16 = mach_absolute_time();
  id v17 = objc_loadWeakRetained(v13);
  unint64_t v18 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", v16 - (void)[v17 streamXferStartTime]);

  id v19 = objc_loadWeakRetained(v13);
  id v20 = [v19 localInfo];
  [v20 setStreamDataXferTime:v18];

  uint64_t v21 = mach_absolute_time();
  id v22 = objc_loadWeakRetained(v13);
  unint64_t v23 = +[UADiagnosticUtils absoluteToNSec:](UADiagnosticUtils, "absoluteToNSec:", v21 - (void)[v22 localSendStartTime]);
  id v24 = objc_loadWeakRetained(v13);
  uint64_t v25 = [v24 localInfo];
  [v25 setTotalTime:v23];

  id v26 = objc_loadWeakRetained(v13);
  id v27 = [v26 localInfo];
  [v27 setStreamDataXferSpeed:(unint64_t)((double)a3 * 8.0 / ((double)v18 / 1000000000.0))];

  id v28 = objc_loadWeakRetained(v13);
  id v29 = [v28 coders];

  objc_sync_enter(v29);
  id v30 = objc_loadWeakRetained(v13);
  uint64_t v31 = [v30 coders];
  [v31 removeObject:v7];

  objc_sync_exit(v29);
  long long v32 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = objc_loadWeakRetained(v13);
    uint64_t v34 = [v33 localInfo];
    int v41 = 138477827;
    CFStringRef v42 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Local Pasteboard Sent Info: %{private}@", (uint8_t *)&v41, 0xCu);
  }
  unsigned __int8 v35 = +[UADiagnosticManager sharedManager];
  id v36 = objc_loadWeakRetained(v13);
  id v37 = [v36 localInfo];
  [v35 submitDidSendLocalPasteboard:v37];

  id v38 = objc_loadWeakRetained(v13);
  [v38 setLocalInfo:0];

  id v39 = objc_loadWeakRetained(v13);
  uint64_t v40 = [v39 pasteAdvertiser];
  [v40 stop];
}

void sub_100036E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_sync_exit(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 96));
  _Unwind_Resume(a1);
}

void sub_100037484(id a1)
{
  id v1 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Client interrupted", v2, 2u);
  }
}

void sub_1000374F4(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Client invalidated", v10, 2u);
  }

  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained fetchProgress];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [v6 fetchProgress];
    [v7 cancel];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = objc_loadWeakRetained(v3);
    [v9 setClientConnection:v8];
  }
}

void sub_1000375DC(id a1)
{
  id v1 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] AUX interrupted", v2, 2u);
  }
}

void sub_10003764C(uint64_t a1)
{
  int v2 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] AUX invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAuxConnection:0];
}

void sub_1000376DC(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained controlConnections];

  objc_sync_enter(v4);
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Controller Connection Invalidated", buf, 2u);
  }

  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 controlConnections];
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 removeObject:v8];

  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 controlConnections];
  id v11 = [v10 count];

  if (!v11)
  {
    double v12 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No more active controllers, Re-enabling UC", v14, 2u);
    }

    id v13 = objc_loadWeakRetained(v2);
    [v13 setScreenWatcherPresent:0];
  }
  objc_sync_exit(v4);
}

void sub_100037860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037EFC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) notificationRef];
  id v4 = *(id *)(a1 + 40);
  if (v3 == v4)
  {
    CFRetain(v3);
    id v5 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Waiting for notification result", buf, 2u);
    }

    *(void *)long long buf = 0;
    CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, (CFOptionFlags *)buf);
    id v6 = [*(id *)(a1 + 32) clientq];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038034;
    block[3] = &unk_1000C5758;
    long long v8 = *(_OWORD *)(a1 + 32);
    uint64_t v9 = *(void *)buf;
    dispatch_async(v6, block);

    id v4 = *(id *)(a1 + 40);
  }
  CFRelease(v4);
}

void sub_100038034(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 256) == *(void *)(a1 + 40))
  {
    *(void *)(v2 + 256) = 0;
    long long v8 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v13 = 134217984;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Response flags: %lu", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10 == 3)
    {
      id v11 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        double v12 = "[PBOARD CONTROLLER] Paste was cancelled";
        goto LABEL_13;
      }
    }
    else
    {
      if (v10)
      {
        id v3 = sub_10000BA18(@"pasteboard-server");
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        LOWORD(v13) = 0;
        id v5 = "[PBOARD CONTROLLER] Unexpected result from user notification";
        id v6 = v3;
        uint32_t v7 = 2;
        goto LABEL_4;
      }
      id v11 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        double v12 = "[PBOARD CONTROLLER] User cancelled the paste";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 2u);
      }
    }

    id v3 = [*(id *)(a1 + 32) fetchProgress];
    [v3 cancel];
    goto LABEL_15;
  }
  id v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    int v13 = 134349056;
    uint64_t v14 = v4;
    id v5 = "[PBOARD-CONTROLLER] User notification was no longer current at the time it was cancelled or completed, so ignor"
         "ing. %{public}lu";
    id v6 = v3;
    uint32_t v7 = 12;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v13, v7);
  }
LABEL_15:

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_1000384F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100038514(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ([*(id *)(a1 + 32) notificationRef])
  {
    id v3 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Canceling the user notification", buf, 2u);
    }

    CFUserNotificationCancel((CFUserNotificationRef)[*(id *)(a1 + 32) notificationRef]);
    [*(id *)(a1 + 32) setNotificationRef:0];
  }
  else
  {
    uint64_t v4 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] No notification, must have already been canceled", v5, 2u);
    }
  }
  objc_sync_exit(v2);
}

void sub_100038620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000394D0(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stream:a1 handleEvent:a2];
}

void sub_100039C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003AAEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003AF74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10003B3EC()
{
  if (qword_1000E67A0 != -1) {
    dispatch_once(&qword_1000E67A0, &stru_1000C57F0);
  }
  v0 = (void *)qword_1000E6798;

  return v0;
}

void sub_10003B440(uint64_t a1)
{
  sub_10003B4BC();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) uuid];
  [v4 setObject:WeakRetained forKey:v3];
}

id sub_10003B4BC()
{
  if (qword_1000E67B0 != -1) {
    dispatch_once(&qword_1000E67B0, &stru_1000C5810);
  }
  v0 = (void *)qword_1000E67A8;

  return v0;
}

void sub_10003B888(uint64_t a1)
{
  sub_10003B4BC();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) uuid];
  [v3 removeObjectForKey:v2];
}

uint64_t sub_10003B8F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003B94C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003BFD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003C03C()
{
  if (qword_1000E67C0 != -1) {
    dispatch_once(&qword_1000E67C0, &stru_1000C5830);
  }
  v0 = (void *)qword_1000E67B8;

  return v0;
}

void sub_10003C090(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id obj = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(obj);
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _releaseAssertion:1];

  objc_sync_exit(obj);
}

void sub_10003C0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10003C110(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) block];
  v1[2](v1, 1);
}

void sub_10003C38C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003C3B8(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Calling block with YES because assertion timed out", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) block];
  v4[2](v4, 1);
}

id sub_10003C538(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertion:*(unsigned __int8 *)(a1 + 40)];
}

id sub_10003C5D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertion:0];
}

void sub_10003C6D4(uint64_t a1)
{
}

void sub_10003C6DC(uint64_t a1)
{
  id v2 = sub_10003B4BC();
  if ([v2 count])
  {
    uint64_t v19 = a1;
    id v3 = +[NSMutableString stringWithString:@"PowerAssertions:"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v20 = v2;
    id obj = [v2 objectEnumerator];
    id v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          long long v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v9 = [v8 timerExpiration];

          if (v9)
          {
            uint64_t v10 = [v8 timerExpiration];
            id v11 = +[NSDate date];
            [v10 timeIntervalSinceDate:v11];
            sub_100064118(v12);
            int v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            int v13 = @"-";
          }
          if ([v8 assertion]) {
            CFStringRef v14 = @"ACTIVE:";
          }
          else {
            CFStringRef v14 = &stru_1000C6800;
          }
          unint64_t v15 = [v8 name];
          [v3 appendFormat:@" %@{%@/%@}", v14, v15, v13];
        }
        id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }

    id v16 = [v3 copy];
    uint64_t v17 = *(void *)(*(void *)(v19 + 32) + 8);
    unint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    id v2 = v20;
  }
}

void sub_10003C9F8(id a1)
{
  qword_1000E6798 = (uint64_t)dispatch_queue_create("UATimedPowerAssertionsMapTableQueue", 0);

  _objc_release_x1();
}

void sub_10003CA38(id a1)
{
  qword_1000E67A8 = +[NSMapTable strongToWeakObjectsMapTable];

  _objc_release_x1();
}

void sub_10003CA78(id a1)
{
  qword_1000E67B8 = (uint64_t)dispatch_queue_create("UATimedPowerAssertionsTimerQueue", 0);

  _objc_release_x1();
}

id sub_10003CAB8(void *a1, uint64_t a2, uint64_t a3)
{
  uint32_t v7 = [a1 readDataOfLength:a3];
  id v8 = [v7 length];
  [v7 getBytes:a2 length:v8];

  return v8;
}

uint64_t sub_10003CB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = a3;
  uint64_t v7 = a3;
  do
  {
    if (*(_DWORD *)a5 == 2 && (*(unsigned char *)(a5 + 8) & 0x10) != 0)
    {
      id v8 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[UCExtractor] Found ACE Deny Delete, removing", v10, 2u);
      }

      *(_DWORD *)a5 = 0;
      --v7;
    }
    a5 += 288;
    --v6;
  }
  while (v6);
  return v7;
}

uint64_t sub_10003CC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uid_t v4 = getuid();
  uint64_t result = getgid();
  *(unsigned char *)a3 |= 3u;
  *(_DWORD *)(a3 + 4) = v4;
  *(_DWORD *)(a3 + 8) = result;
  return result;
}

void sub_10003CDE0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "destURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
  id v3 = 0);
  id v4 = [v3 path];
  id v5 = [v4 cStringUsingEncoding:4];

  [*(id *)(a1 + 32) archiveReadHandle];
  uint64_t v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)long long buf = 138412546;
    id v11 = v7;
    __int16 v12 = 2080;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[UCExtractor] Extracting archive %@ to url '%s'", buf, 0x16u);
  }
  int v8 = ParallelArchiveExtract();
  uint64_t v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v11) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[UCExtractor] Extract status: %d", buf, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003DD48(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nextPacketReady];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  intptr_t v5 = dispatch_semaphore_wait(v3, v4);

  uint64_t v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Packager] Delivery signaled", (uint8_t *)v20, 2u);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  if (v5)
  {
    int v8 = [v7 receiver];
    [v8 filePackagerError:0];
  }
  else
  {
    uint64_t v9 = [v7 queuedPackets];
    objc_sync_enter(v9);
    uint64_t v10 = [*(id *)(a1 + 32) queuedPackets];
    int v8 = [v10 firstObject];

    if (v8)
    {
      id v11 = [*(id *)(a1 + 32) queuedPackets];
      [v11 removeObjectAtIndex:0];
    }
    objc_msgSend(*(id *)(a1 + 32), "setNextPacketToDeliver:", (char *)objc_msgSend(*(id *)(a1 + 32), "nextPacketToDeliver") + 1);
    objc_sync_exit(v9);

    if (sub_100045CA4((int)[v8 packetNumber], (int)objc_msgSend(*(id *)(a1 + 32), "totalPacketCount")))
    {
      __int16 v12 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v13 = [v8 packetNumber];
        unsigned int v14 = [*(id *)(a1 + 32) totalPacketCount];
        v20[0] = 67109376;
        v20[1] = v13;
        __int16 v21 = 1024;
        unsigned int v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[Packager] Delivering packet %d/%d", (uint8_t *)v20, 0xEu);
      }
    }
    if (v8)
    {
      id v16 = *(void **)(a1 + 32);
      unint64_t v15 = (id *)(a1 + 32);
      uint64_t v17 = [v16 receiver];
      id v18 = *v15;
      uint64_t v19 = [v8 packetData];
      objc_msgSend(v17, "packager:gotData:forPacket:", v18, v19, objc_msgSend(v8, "packetNumber"));

      [*v15 checkShouldFetch];
    }
  }
}

void sub_10003DFC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003E0D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003E0E8(uint64_t a1)
{
  if (sub_100045CA4(*(_DWORD *)(a1 + 40), (int)[*(id *)(a1 + 32) totalPacketCount]))
  {
    id v2 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      unsigned int v4 = [*(id *)(a1 + 32) totalPacketCount];
      v11[0] = 67109376;
      v11[1] = v3;
      __int16 v12 = 1024;
      unsigned int v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Packager] Reading packet data %d/%d", (uint8_t *)v11, 0xEu);
    }
  }
  intptr_t v5 = objc_alloc_init(UCFilePackagerPacket);
  [(UCFilePackagerPacket *)v5 setPacketNumber:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) file];
  uint64_t v7 = objc_msgSend(v6, "readDataOfLength:", objc_msgSend(*(id *)(a1 + 32), "packetSize"));
  [(UCFilePackagerPacket *)v5 setPacketData:v7];

  int v8 = [*(id *)(a1 + 32) queuedPackets];
  objc_sync_enter(v8);
  uint64_t v9 = [*(id *)(a1 + 32) queuedPackets];
  [v9 addObject:v5];

  objc_sync_exit(v8);
  uint64_t v10 = [*(id *)(a1 + 32) nextPacketReady];
  dispatch_semaphore_signal(v10);

  [*(id *)(a1 + 32) checkShouldFetch];
}

void sub_10003E290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003E350(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003E870(_Unwind_Exception *a1)
{
  int v8 = v7;

  _Unwind_Resume(a1);
}

void sub_10003EA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)UAActivityReplay;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10003EC10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003EDAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003EEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EED8(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2
    && [v2 count]
    && (+[NSJSONSerialization dataWithJSONObject:a1[4] options:0 error:0], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  }
  else
  {
    id v8 = 0;
    uint64_t v3 = &stru_1000C6800;
  }
  intptr_t v5 = (void *)a1[5];
  unsigned int v4 = (void *)a1[6];
  if (v4)
  {
    sub_100003070(v4);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = @"-";
  }
  uint64_t v7 = +[NSString stringWithFormat:@"BROADCAST $%@ %@\n", v6, v3];
  [v5 sendResponse:v7];

  if (v4) {
}
  }

void sub_10003EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10003F4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003F5D8(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v4 = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF$"];
  if (a2 && ![v3 scanString:@"[" intoString:0])
  {
    id v6 = 0;
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  id v10 = 0;
  unsigned int v5 = [v3 scanCharactersFromSet:v4 intoString:&v10];
  id v6 = v10;
  if (!v5 || a2 && ![v3 scanString:@"]" intoString:0]) {
    goto LABEL_8;
  }
  uint64_t v7 = sub_10000F6D0(v6);
LABEL_9:
  id v8 = v7;

  return v8;
}

void sub_10003F6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000408BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

id sub_100040D2C(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF-"];
  id v6 = 0;
  unsigned __int8 v3 = [v1 scanCharactersFromSet:v2 intoString:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {

    id v4 = 0;
  }

  return v4;
}

void sub_100040DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040DE4(void *a1)
{
  id v1 = a1;
  if ([v1 scanString:@"\"" intoString:0])
  {
    id v11 = 0;
    unsigned int v2 = [v1 scanUpToString:@"\"" intoString:&v11];
    id v3 = v11;
    if (!v2 || ([v1 scanString:@"\"" intoString:0] & 1) == 0)
    {
      unsigned __int8 v4 = [v1 scanString:@"\"" intoString:0];
      goto LABEL_9;
    }
  }
  else if ([v1 scanString:@"'" intoString:0])
  {
    id v10 = 0;
    unsigned int v5 = [v1 scanUpToString:@"'" intoString:&v10];
    id v3 = v10;
    if (!v5 || ([v1 scanString:@"'" intoString:0] & 1) == 0)
    {
      unsigned __int8 v4 = [v1 scanString:@"'" intoString:0];
LABEL_9:
      if (v4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = +[NSCharacterSet whitespaceCharacterSet];
    id v9 = 0;
    unsigned __int8 v8 = [v1 scanUpToCharactersFromSet:v7 intoString:&v9];
    id v3 = v9;

    if ((v8 & 1) == 0)
    {
LABEL_10:

      id v3 = 0;
    }
  }
LABEL_11:

  return v3;
}

void sub_100040F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040F94(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [*(id *)(a1 + 32) queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _DWORD v11[2] = sub_100041098;
  v11[3] = &unk_1000C5880;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void sub_100041084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041098(uint64_t a1)
{
  unsigned int v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = sub_10000F05C(*(void **)(a1 + 32), 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138478083;
    id v12 = v3;
    __int16 v13 = 2113;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "REPLAY: PULLPAYLOAD request, got encodedData %{private}@ from creating application for advertisementPayload %{private}@, so returning that to paired client over the network.", buf, 0x16u);
  }
  BOOL v5 = *(void *)(a1 + 48) == 0;
  id v6 = *(void **)(a1 + 56);
  id v7 = [*(id *)(a1 + 40) advertisementPayload];
  sub_100003070(v7);
  if (v5) {
    unsigned __int8 v8 = {;
  }
    id v9 = sub_100003070(*(void **)(a1 + 32));
    +[NSString stringWithFormat:@"RETURNPAYLOAD $%@ [$%@]\n", v8, v9];
  }
  else {
    unsigned __int8 v8 = {;
  }
    id v9 = +[NSNull null];
    +[NSString stringWithFormat:@"RETURNPAYLOADERROR $%@ %@\n", v8, v9];
  id v10 = };
  [v6 sendResponse:v10];
}

void sub_100041248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000413A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000413B8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    int v5 = 1;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v5 &= objc_msgSend(*(id *)(a1 + 40), "processCommand:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000414DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000415E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_100041914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041F68(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pairedScanner];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) peer];
  [v3 receiveAdvertisement:v5 options:v4 fromPeer:v6];
}

void sub_1000420AC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pairedScanner];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) pairedScanner];
    uint64_t v5 = [v4 peer];
    id v6 = +[NSSet setWithObject:v5];

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-50 userInfo:0];
    id v7 = *(void (**)(void))(v8 + 16);
  }
  v7();
}

void sub_10004228C(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) pairedScanner];
  uint64_t v5 = [v4 peer];
  unsigned int v6 = [v3 isEqual:v5];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 40) pairedScanner];
    long long v9 = [v8 peer];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0);
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-50 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void sub_10004243C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000425BC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004269C;
  v8[3] = &unk_1000C5920;
  id v9 = *(id *)(a1 + 64);
  [v3 activityAdvertiser:v4 activityPayloadForAdvertisementPayload:v5 command:v6 requestedByDevice:v7 withCompletionHandler:v8];
}

uint64_t sub_10004269C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000428DC(uint64_t a1)
{
  id v3 = [objc_alloc((Class)SFActivityAdvertisement) initWithAdvertisementVersion:1 advertisementPayload:*(void *)(a1 + 32) options:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 56) sendFoundDevice])
  {
    [*(id *)(a1 + 56) setSendFoundDevice:0];
    uint64_t v4 = [*(id *)(a1 + 56) delegate];
    uint64_t v5 = *(void **)(a1 + 56);
    uint64_t v6 = [v5 peer];
    [v4 activityScanner:v5 foundDeviceWithDevice:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 56) delegate];
  [v7 activityScanner:*(void *)(a1 + 56) receivedAdvertisement:v3];
}

void sub_100042AC4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pairedAdvertiser];
  uint64_t v4 = [*(id *)(a1 + 32) peer];
  [v3 payloadRequestFromPeer:v4 advertisementPayload:*(void *)(a1 + 40) command:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_100042C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042E78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100042F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100042F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_100042FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004316C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  sub_100043D1C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100043694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, _OWORD *a7, mach_port_name_t *a8, vm_address_t *a9, _DWORD *a10, void *a11)
{
  unsigned int v17 = a1;
  uint64_t v45 = a2;
  id v18 = +[UASimulatorController simulatorControllerForCommandPort:a1];
  pid_t pidp = 0;
  long long v19 = a7[1];
  *(_OWORD *)atoken.val = *a7;
  *(_OWORD *)&atoken.val[4] = v19;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  uint64_t v20 = pidp;
  __int16 v21 = sub_10000BA18(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 134218496;
    *(void *)&atoken.val[1] = a6;
    LOWORD(atoken.val[3]) = 1024;
    *(unsigned int *)((char *)&atoken.val[3] + 2) = v17;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "SIMULATOR: RegisterWithParentWithVersion simulatorVersion=%llu, serverPort=%x pid=%d", (uint8_t *)&atoken, 0x18u);
  }

  if (!v18)
  {
    uint64_t v24 = 5;
    goto LABEL_24;
  }
  unsigned int v22 = sub_10000BA18(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 68289282;
    atoken.val[1] = 16;
    LOWORD(atoken.val[2]) = 2098;
    *(void *)((char *)&atoken.val[2] + 2) = &v45;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = a3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SIMULATOR: Creating UASimulator to be parent simulator in OSX, uuid=%{public,posix:uuid}.16P port=%x", (uint8_t *)&atoken, 0x18u);
  }

  long long v23 = +[UASimulator simulatorWithController:v18 pairedPort:a3 childSimPid:v20 childVersion:a6];
  if (a6 != 1 && a6 != 2)
  {
    id v30 = sub_10000BA18(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      atoken.val[0] = 134217984;
      *(void *)&atoken.val[1] = a6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SIMULATOR: Failed to create simulator; simulated useractivityd client version %ld is unknown.",
        (uint8_t *)&atoken,
        0xCu);
    }
    uint64_t v24 = 5;
    goto LABEL_20;
  }
  uint64_t v25 = objc_opt_class();
  id v26 = sub_100012DE4(v25, a4, a5, 0);
  [v23 setPeeredDevice:v26];

  if (v23)
  {
    [v18 addSimulator:v23];
    id v27 = [v18 dispatchQ];
    dispatch_source_t v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)v20, 0x80000000uLL, v27);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100043C0C;
    handler[3] = &unk_1000C59C0;
    int v44 = v20;
    id v29 = v23;
    id v41 = v29;
    id v42 = v18;
    id v30 = v28;
    long long v43 = v30;
    dispatch_source_set_event_handler(v30, handler);
    dispatch_resume(v30);
    mach_port_name_t v31 = [v29 commandPort];
    *a8 = v31;
    mach_port_insert_right(mach_task_self_, v31, v31, 0x14u);
    id v32 = +[SFPeerDevice peerForSelf];
    if (v32
      && (id v33 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1],
          [v33 encodeObject:v32 forKey:NSKeyedArchiveRootObjectKey],
          [v33 encodedData],
          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
          v33,
          (id v35 = v34) != 0))
    {
      id v36 = v35;
      if (vm_allocate(mach_task_self_, a9, (vm_size_t)[v35 length], 1))
      {
        id v37 = v36;
      }
      else
      {
        *a10 = [v36 length];
        id v39 = (void *)*a9;
        id v37 = v36;
        memcpy(v39, [v37 bytes], (size_t)objc_msgSend(v37, "length"));
      }
    }
    else
    {
      id v37 = 0;
      *a9 = 0;
      *a10 = 0;
    }

    [v29 resume];
    uint64_t v24 = 0;
LABEL_20:

    goto LABEL_22;
  }
  uint64_t v24 = 5;
LABEL_22:
  if (a11) {
    *a11 = 2;
  }
LABEL_24:

  return v24;
}

void sub_100043B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043C0C(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 56);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Detected death of child simulator, pid=%d, so terminating the UASimulator and removing it.", (uint8_t *)v4, 8u);
  }

  [*(id *)(a1 + 32) terminate];
  [*(id *)(a1 + 40) removeSimulator:*(void *)(a1 + 32)];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

uint64_t sub_100043CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _OWORD *a6, mach_port_name_t *a7, vm_address_t *a8, _DWORD *a9)
{
  uint64_t v12 = 0;
  long long v9 = a6[1];
  v11[0] = *a6;
  v11[1] = v9;
  return sub_100043694(a1, a2, a3, a4, a5, 1, v11, a7, a8, a9, &v12);
}

uint64_t sub_100043D1C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 12))
  {
    if (*(void *)a1)
    {
      vm_size_t v2 = *(unsigned int *)(a1 + 8);
      if (v2) {
        vm_deallocate(mach_task_self_, *(void *)a1, v2);
      }
    }
  }
  return a1;
}

void sub_100043F04(id a1)
{
  qword_1000E67D8 = objc_alloc_init(UAUserActivityDefaults);

  _objc_release_x1();
}

void sub_100043FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000441D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000444A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000444F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000445A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000445F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000446F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000447E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000448D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000449C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100045638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100045770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000457A4(id a1)
{
  int out_token = 0;
  if (!notify_register_check("com.apple.system.lowpowermode", &out_token)) {
    dword_1000E67F0 = out_token;
  }
}

char *sub_100045B7C(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, v1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if ((unint64_t)[(__CFData *)Data length] > 0xFFFFFFFE)
    {
      int v3 = 0;
    }
    else
    {
      int v3 = (char *)malloc_type_malloc((size_t)[(__CFData *)Data length] + 200, 0x7A065B7EuLL);
      *(_DWORD *)int v3 = 1;
      *((_DWORD *)v3 + 1) = [(__CFData *)Data length];
      bzero(v3 + 8, 0x40uLL);
      bzero(v3 + 72, 0x40uLL);
      bzero(v3 + 136, 0x40uLL);
      strlcpy(v3 + 136, "UAUserActivity", 0x40uLL);
      memcpy(v3 + 200, [(__CFData *)Data bytes], *((unsigned int *)v3 + 1));
    }
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

void sub_100045C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100045CA4(int a1, int a2)
{
  return a1 == 1
      || (int)((double)(a1 - 1) / (double)a2 * 10.0) % 10 != (int)((double)a1 / (double)a2 * 10.0) % 10
      || a1 == a2;
}

id sub_100045D18()
{
  if (qword_1000E6808 != -1) {
    dispatch_once(&qword_1000E6808, &stru_1000C5A20);
  }
  v0 = (void *)qword_1000E6800;

  return v0;
}

void sub_100045D6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.useractivity", "biome-69594900");
  vm_size_t v2 = (void *)qword_1000E6800;
  qword_1000E6800 = (uint64_t)v1;

  int v3 = qword_1000E6800;
  if (os_log_type_enabled((os_log_t)qword_1000E6800, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "- UAUserActivity\tv1.0", v4, 2u);
  }
}

void sub_100045DF0(id a1)
{
  qword_1000E6810 = objc_alloc_init(UADiagnosticManager);

  _objc_release_x1();
}

id UActivityCreationXPCServiceName()
{
  return sub_100046640("_UAUSERACTIVITYCREATION", @"com.apple.coreservices.lsuseractivitymanager.xpc");
}

id sub_100046640(const char *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = getenv(a1);
  if (v4)
  {
    id v5 = +[NSString stringWithCString:v4 encoding:4];
    uint64_t v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Using service name %{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

id UABestAppSuggestionManagerServiceName()
{
  return sub_100046640("_UAUSERACTIVITYBESTAPP", @"com.apple.coreservices.lsbestappsuggestionmanager.xpc");
}

id UASharedPasteboardManagerServiceName()
{
  return sub_100046640("_UAUSERACTIVITYPASTEBOARD", @"com.apple.coreservices.uasharedpasteboardmanager.xpc");
}

id UASharedPasteboardAUXServiceName()
{
  return sub_100046640("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardaux.xpc");
}

id UASharedPasteboardControllServiceName()
{
  return sub_100046640("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardcontroll.xpc");
}

void sub_1000467A0(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UAUserActivityClientProtocol];
  vm_size_t v2 = (void *)qword_1000E6820;
  qword_1000E6820 = v1;

  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(id)qword_1000E6820 setClasses:v13 forSelector:"doUpdateUserActivityInfo:makeCurrent:completionHandler:" argumentIndex:0 ofReply:0];
  [(id)qword_1000E6820 setClasses:v13 forSelector:"doFetchUserActivityInfoWithUUID:completionHandler:" argumentIndex:0 ofReply:1];
  [(id)qword_1000E6820 setClasses:v13 forSelector:"doPinUserActivityInfo:completionHandler:" argumentIndex:0 ofReply:0];
  __int16 v10 = (void *)qword_1000E6820;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  [v10 setClasses:v12 forSelector:"doGetUserActivityProxiesWithOptions:completionHandler:" argumentIndex:0 ofReply:1];
}

void sub_100046978(id a1)
{
  qword_1000E6830 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UAUserActivityClientResponseProtocol];

  _objc_release_x1();
}

id sub_1000469C0()
{
  if (qword_1000E6848 != -1) {
    dispatch_once(&qword_1000E6848, &stru_1000C5AA0);
  }
  v0 = (void *)qword_1000E6840;

  return v0;
}

void sub_100046A14(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UABestAppSuggestionManagerProtocol];
  vm_size_t v2 = (void *)qword_1000E6840;
  qword_1000E6840 = v1;

  uint64_t v3 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)qword_1000E6840 setClasses:v4 forSelector:"doDetermineBestAppSuggestionWithCompletionHandler:" argumentIndex:0 ofReply:1];
}

id sub_100046AD4()
{
  if (qword_1000E6858 != -1) {
    dispatch_once(&qword_1000E6858, &stru_1000C5AC0);
  }
  v0 = (void *)qword_1000E6850;

  return v0;
}

void sub_100046B28(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UABestAppSuggestionManagerResponseProtocol];
  vm_size_t v2 = (void *)qword_1000E6850;
  qword_1000E6850 = v1;

  uint64_t v3 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)qword_1000E6850 setClasses:v4 forSelector:"notifyBestAppsChanged:when:confidence:" argumentIndex:0 ofReply:0];
}

id sub_100046BE8()
{
  if (qword_1000E6868 != -1) {
    dispatch_once(&qword_1000E6868, &stru_1000C5AE0);
  }
  v0 = (void *)qword_1000E6860;

  return v0;
}

void sub_100046C3C(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UASharedPasteboardManagerProtocol];
  vm_size_t v2 = (void *)qword_1000E6860;
  qword_1000E6860 = v1;

  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v12, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)qword_1000E6860 setClasses:v14 forSelector:"localPasteboardTypesDidChange:forGeneration:" argumentIndex:0 ofReply:0];
  [(id)qword_1000E6860 setClasses:v14 forSelector:"fetchRemotePasteboardTypesForProcess:withCompletion:" argumentIndex:0 ofReply:1];
  [(id)qword_1000E6860 setClasses:v14 forSelector:"fetchRemotePasteboardForProcess:withCompletion:" argumentIndex:0 ofReply:1];
}

id sub_100046E00()
{
  if (qword_1000E6878 != -1) {
    dispatch_once(&qword_1000E6878, &stru_1000C5B00);
  }
  v0 = (void *)qword_1000E6870;

  return v0;
}

void sub_100046E54(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UASharedPasteboardManagerResponseProtocol];
  vm_size_t v2 = (void *)qword_1000E6870;
  qword_1000E6870 = v1;

  uint64_t v13 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  [(id)qword_1000E6870 setClasses:v14 forSelector:"writeLocalPasteboardToFile:itemDir:withCompletion:" argumentIndex:0 ofReply:1];
  [(id)qword_1000E6870 setClasses:v14 forSelector:"writeLocalPasteboardToFile:itemDir:extension:withCompletion:" argumentIndex:0 ofReply:1];
}

id sub_100047000()
{
  if (qword_1000E6888 != -1) {
    dispatch_once(&qword_1000E6888, &stru_1000C5B20);
  }
  v0 = (void *)qword_1000E6880;

  return v0;
}

void sub_100047054(id a1)
{
  qword_1000E6880 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UASharedPasteboardAUXProtocol];

  _objc_release_x1();
}

id sub_10004709C()
{
  if (qword_1000E6898 != -1) {
    dispatch_once(&qword_1000E6898, &stru_1000C5B40);
  }
  v0 = (void *)qword_1000E6890;

  return v0;
}

void sub_1000470F0(id a1)
{
  qword_1000E6890 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UASharedPasteboardControllProtocol];

  _objc_release_x1();
}

void sub_1000475CC(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v8 = +[NSKeyedArchiver archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [v5 UUIDString];
    uint64_t v7 = [*(id *)(a1 + 32) activityType];
    [v4 log:5, @"ITEM:%@ %@ [0x%@]\n", v6, v7, v8 format];
  }
}

int64_t sub_100047F78(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  if (!sub_10000AA28((uint64_t)[(UAUserActivityInfo *)v4 type])
    && sub_10000AA28((uint64_t)[(UAUserActivityInfo *)v5 type])
    || ([(UAUserActivityInfo *)v5 dynamicActivityType],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v7 = (void *)v6,
        [(UAUserActivityInfo *)v4 dynamicActivityType],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    int64_t v12 = 1;
  }
  else
  {
    uint64_t v9 = [(UAUserActivityInfo *)v5 when];
    uint64_t v10 = [(UAUserActivityInfo *)v4 when];
    BOOL v11 = sub_100063D74(v9, v10);

    if (v11) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = -1;
    }
  }

  return v12;
}

void sub_100048454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000488D8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [v1 mainDisplayLayoutMonitor];
  uint64_t v2 = [v3 currentLayout];
  [v1 updateMainScreenLayout:v2];
}

void sub_100048940(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) manager];
  uint64_t v6 = [v5 mainDispatchQ];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100048A08;
  v9[3] = &unk_1000C5BB0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v7;
  id v8 = v4;
  dispatch_async(v6, v9);
}

id sub_100048A08(uint64_t a1)
{
  return [*(id *)(a1 + 40) updateCarPlayScreenLayout:*(void *)(a1 + 32)];
}

void sub_100048A14(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [v1 carPlayDisplayLayoutMonitor];
  uint64_t v2 = [v3 currentLayout];
  [v1 updateCarPlayScreenLayout:v2];
}

void sub_100048F44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000490F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000491B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004925C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000492FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000497FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_100049D44(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastFrontTime];
  uint64_t v6 = [v4 lastFrontTime];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10004A420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id obj)
{
}

int64_t sub_10004A484(id a1, UAUserActivityClientProcess *a2, UAUserActivityClientProcess *a3)
{
  id v4 = a3;
  uint64_t v5 = [(UAUserActivityClientProcess *)a2 auditToken];
  unsigned int v6 = [v5 pid];
  id v7 = [(UAUserActivityClientProcess *)v4 auditToken];

  int64_t v8 = (int)(v6 - [v7 pid]);
  return v8;
}

id sub_10004A4FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void sub_10004A948(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    id v12 = [v5 length];
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v8 > 0.0)
  {
    unsigned int v9 = vcvtpd_s64_f64(v8);
    id v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Adding %d delay for testing", (uint8_t *)&v11, 8u);
    }

    sleep(v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004AD14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    id v12 = [v5 length];
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v8 > 0.0)
  {
    unsigned int v9 = vcvtpd_s64_f64(v8);
    id v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Adding %d delay for testing", (uint8_t *)&v11, 8u);
    }

    sleep(v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004B0E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    id v12 = [v5 length];
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v8 > 0.0)
  {
    unsigned int v9 = vcvtpd_s64_f64(v8);
    id v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Adding %d delay for testing", (uint8_t *)&v11, 8u);
    }

    sleep(v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004B3C4(id a1)
{
  qword_1000E68A0 = objc_alloc_init(UABluetoothStatus);

  _objc_release_x1();
}

id sub_10004B4B4()
{
  if (qword_1000E68B8 != -1) {
    dispatch_once(&qword_1000E68B8, &stru_1000C5D28);
  }
  v0 = (void *)qword_1000E68B0;

  return v0;
}

void sub_10004B508(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = sub_10004B4B4();
  int v4 = BTSessionAttachWithQueue();

  id v5 = *v2;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67240192;
      int v12 = v4;
      id v7 = "BLUETOOTH: Failed to attach to BTSession, result=%{public}d";
      double v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, 8u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
    id v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v12 = v10;
      id v7 = "BLUETOOTH: Attached to BTSession, setting attached to %{BOOL}d.";
      double v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
  objc_sync_exit(v5);
}

void sub_10004B68C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004B6AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleSessionEvent:a1 event:a2 result:a3];
}

void sub_10004B7A0()
{
  int v0 = BTSessionDetachWithQueue();
  uint64_t v1 = sub_10000BA18(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67240192;
    v2[1] = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "BLUETOOTH: Detached from BTSession, result=%{public}d, setting attached to NO.", (uint8_t *)v2, 8u);
  }
}

void sub_10004BA0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BB2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BC2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BC44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_retainBlock(v6);
    int v9 = *(unsigned __int8 *)(a1 + 32);
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2050;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "BLUETOOTH: Letting callback %{public}@/%{public}p know that the power status is now %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }
  (*((void (**)(id, id, void))v6 + 2))(v6, v5, *(unsigned __int8 *)(a1 + 32));
}

void sub_10004C190(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004C1BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleLocalDeviceCallback:a1 event:a2 result:a3];
}

void sub_10004C354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004C470(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004C5C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) processCallbacks];
}

void sub_10004C5DC(id a1)
{
  qword_1000E68B0 = (uint64_t)dispatch_queue_create("bluetoothStatusQ", 0);

  _objc_release_x1();
}

void sub_10004C9B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004CF20(void *a1)
{
  id v1 = a1;
  int v15 = 0;
  if ((unint64_t)[v1 length] < 4 || (unint64_t)objc_msgSend(v1, "length") > 0x7FFFFFFE)
  {
    id v8 = 0;
  }
  else
  {
    id v2 = v1;
    int v15 = *(_DWORD *)[v2 bytes];
    id v3 = v2;
    id v4 = objc_msgSend(v3, "length", (char *)objc_msgSend(v3, "bytes") + 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    strm.avail_in = v4 - 4;
    __chkstk_darwin(v4, v5, v6, v7);
    strm.next_out = v13;
    strm.avail_out = 2048;
    id v8 = 0;
    if (!BZ2_bzDecompressInit(&strm, 0, 0))
    {
      id v8 = +[NSMutableData data];
      [v8 appendBytes:&v15 length:4];
      while (1)
      {
        int v9 = BZ2_bzDecompress(&strm);
        if (v9 < 0) {
          break;
        }
        int v10 = v9;
        [v8 appendBytes:v13 length:2048 - strm.avail_out];
        strm.next_out = v13;
        strm.avail_out = 2048;
        if (v10 == 4) {
          goto LABEL_10;
        }
      }

      id v8 = 0;
LABEL_10:
      if (BZ2_bzDecompressEnd(&strm))
      {

        id v8 = 0;
      }
    }
  }
  id v11 = [v8 copy];

  return v11;
}

id sub_10004D0F0(void *a1, _DWORD *a2)
{
  id v3 = a1;
  id v4 = (char *)[v3 bytes];
  uint64_t v5 = *a2;
  int v6 = v5 + 4;
  if (v5 + 4 <= (unint64_t)[v3 length])
  {
    int v8 = *(_DWORD *)&v4[v5];
    uint64_t v9 = *(void *)&v8 & 0xFFFFFFLL;
    if ((v8 & 0xFFFFFF) != 0 && (unint64_t)[v3 length] >= (v9 + v6))
    {
      uint64_t v7 = +[NSData dataWithBytes:&v4[v6] length:v9];
      v6 += v9;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    int v6 = v5;
  }
  *a2 = v6;

  return v7;
}

void sub_10004D4B4(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = a1;
    unsigned int v5 = [v3 length] & 0xFFFFFF | 0x1000000;
    [v4 appendBytes:&v5 length:4];
    [v4 appendData:v3];
  }
  else
  {
    int v6 = 0;
    id v4 = a1;
    [v4 appendBytes:&v6 length:4];
  }
}

id sub_10004D544(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 5)
  {
    id v3 = v2;
    int v4 = *(_DWORD *)[v3 bytes];
    id v5 = +[NSMutableData data];
    LODWORD(strm.next_in) = v4 | 0x100;
    [v5 appendBytes:&strm length:4];
    memset(&strm.avail_in, 0, 72);
    id v6 = v3;
    id v7 = objc_msgSend(v6, "length", (char *)objc_msgSend(v6, "bytes") + 4);
    strm.avail_in = v7 - 4;
    __chkstk_darwin(v7, v8, v9, v10);
    strm.next_out = v25;
    strm.avail_out = 2048;
    if (BZ2_bzCompressInit(&strm, 1, 0, 200)) {
      goto LABEL_11;
    }
    while (1)
    {
      strm.next_out = v25;
      strm.avail_out = 2048;
      int v12 = BZ2_bzCompress(&strm, 2 * (strm.avail_in == 0));
      if (v12 < 0) {
        break;
      }
      int v11 = v12;
      [v5 appendBytes:v25 length:2048 - strm.avail_out];
      if (v11 == 4) {
        goto LABEL_8;
      }
    }

    id v5 = 0;
LABEL_8:
    int v13 = BZ2_bzCompressEnd(&strm);
    __int16 v14 = sub_10000BA18(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [v5 length];
      id v16 = [v6 length];
      unint64_t v17 = 100 * (void)[v5 length];
      unint64_t v18 = (unint64_t)[v6 length];
      *(_DWORD *)long long buf = 134218496;
      id v28 = v15;
      __int16 v29 = 2048;
      id v30 = v16;
      __int16 v31 = 2048;
      unint64_t v32 = v17 / v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "-- Compressed data to %ld bytes (from %ld bytes) in data,(%ld%%)", buf, 0x20u);
    }

    if (v13)
    {
LABEL_11:

      id v5 = 0;
    }
    else if (v5)
    {
      id v21 = [v5 length];
      if (v21 < [v6 length])
      {
        unsigned int v22 = sub_10000BA18(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          long long v23 = [v6 length];
          uint64_t v24 = [v5 length];
          *(_DWORD *)long long buf = 134217984;
          id v28 = (id)(v23 - v24);
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Using compressed data, because it is %ld bytes smaller than the uncompressed data.", buf, 0xCu);
        }

        id v5 = v5;
        long long v19 = v5;
        goto LABEL_13;
      }
    }
    long long v19 = 0;
LABEL_13:

    goto LABEL_15;
  }
  long long v19 = 0;
LABEL_15:

  return v19;
}

id sub_10004DDE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCleanupFunc];
}

void sub_10004DE38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004E174(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 description];
    id v7 = sub_100063FF0(v6);
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, ".scanForTypes=%{public}@", (uint8_t *)&v14, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v4 containsObject:off_1000E5C68];
    unsigned int v9 = [v4 containsObject:off_1000E5C70];
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10 | v8;
    unsigned int v12 = [v4 containsObject:off_1000E5C78];
    uint64_t v13 = 4;
    if (!v12) {
      uint64_t v13 = 0;
    }
    [v3 scanForTypes:v11 | v13];
  }
}

void sub_10004E344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004E3B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004E494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004E638(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004E760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004EDA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) foundDevice:*(void *)(a1 + 40)];
}

void sub_10004EFC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004F178(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uniqueID];
    id v4 = *(void **)(*(void *)(a1 + 40) + 88);
    id v5 = [*(id *)(a1 + 32) uniqueID];
    *(_DWORD *)long long buf = 138412802;
    unint64_t v17 = v3;
    __int16 v18 = 2112;
    long long v19 = v4;
    __int16 v20 = 1024;
    unsigned int v21 = [v4 containsObject:v5];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "lostDevice timer firing deviceIdentifier=%@; _recentlyLostDeviceIDs is %@, will remove is %d",
      buf,
      0x1Cu);
  }
  id v6 = *(void **)(*(void *)(a1 + 40) + 88);
  id v7 = [*(id *)(a1 + 32) uniqueID];
  LODWORD(v6) = [v6 containsObject:v7];

  if (v6)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 88);
    unsigned int v9 = [*(id *)(a1 + 32) uniqueID];
    [v8 removeObject:v9];

    uint64_t v10 = [*(id *)(a1 + 40) manager];
    uint64_t v11 = [v10 mainDispatchQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004F374;
    block[3] = &unk_1000C5BB0;
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v13.i64[0];
    int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
    dispatch_async(v11, block);
  }
}

id sub_10004F374(uint64_t a1)
{
  return [*(id *)(a1 + 32) lostDevice:*(void *)(a1 + 40)];
}

void sub_10004F640(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004FC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_10004FD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    id v5 = *(id *)(a1 + 32);
    MRMediaRemoteGetNowPlayingClientForOrigin();
  }
}

void sub_10004FE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = a3;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to determine nowPlaying client, error=%{public}@ for item %{public}@", (uint8_t *)&v11, 0x16u);
    }
LABEL_9:

    return;
  }
  if (a2)
  {
    uint64_t BundleIdentifier = MRNowPlayingClientGetBundleIdentifier();
    if (BundleIdentifier)
    {
      uint64_t v8 = BundleIdentifier;
      id v5 = *(id *)(a1 + 40);
      objc_sync_enter(v5);
      unsigned int v9 = sub_10000BA18(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138543618;
        uint64_t v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "NowPlaying item is %{public}@ for item %{public}@", (uint8_t *)&v11, 0x16u);
      }

      [*(id *)(a1 + 32) setBundleIdentifier:v8];
      [*(id *)(a1 + 40) _addItem:*(void *)(a1 + 32) scheduleUpdates:*(unsigned __int8 *)(a1 + 48)];
      objc_sync_exit(v5);
      goto LABEL_9;
    }
  }
}

void sub_10004FF80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100050030(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000504E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000507D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100050B3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveAdvertisement:*(void *)(a1 + 40) scanner:*(void *)(a1 + 48)];
}

void sub_100052C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id obj)
{
}

void sub_100052C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = [[UAPingUserActivityInfo alloc] initFromPing:*(void *)(a1 + 32)];
    objc_initWeak(&location, v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100052DDC;
    v8[3] = &unk_1000C5DC8;
    void v8[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v9, &location);
    [v4 setWasContinuedBlock:v8];
    id v5 = [*(id *)(a1 + 40) manager];
    uint64_t v6 = [v5 pingController];
    id v7 = [v6 client];
    [v7 pushItem:v4];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void sub_100052DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100052DDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PING: Pong was sent, error=%{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) manager];
  uint64_t v6 = [v5 pingController];
  id v7 = [v6 client];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 removeItem:WeakRetained];
}

void sub_100052EF0(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    id v4 = [v3 UUIDString];
    id v5 = [*(id *)(a1 + 32) statusString];
    int v6 = 138543619;
    id v7 = v4;
    __int16 v8 = 2113;
    int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "*** Completed a pre-emptive fetch of the payload for item %{public}@/%{private}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1000532D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
}

void sub_10005332C(void *a1, void *a2)
{
  --*(void *)(*(void *)(a1[6] + 8) + 24);
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addNewItemsFromPayloads:v4 device:a1[4] scanner:a1[5] force:*(void *)(*(void *)(a1[6] + 8) + 24) == 0];
}

void sub_1000535A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000535CC(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addNewItemsFromPayloads:v4 device:*(void *)(a1 + 32) scanner:*(void *)(a1 + 40) force:1];
}

void sub_100053B2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100054A28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100055820(__SecTask *a1, const __CFString *a2)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a1, a2, 0);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFNumberRef v4 = (const __CFNumber *)CFGetTypeID(v2);
  if (v4 == (const __CFNumber *)CFBooleanGetTypeID())
  {
    uint64_t Value = CFBooleanGetValue(v3);
  }
  else if (v4 == (const __CFNumber *)CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
    uint64_t Value = valuePtr != 0;
  }
  else
  {
    uint64_t Value = 0;
  }
  CFRelease(v3);
  return Value;
}

uint64_t sub_1000558C4()
{
  if (qword_1000E68D8 != -1) {
    dispatch_once(&qword_1000E68D8, &stru_1000C5E70);
  }
  return qword_1000E68D0;
}

void sub_100055908(id a1)
{
  kern_return_t v1;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];

  task_info_outCnt = 8;
  id v1 = task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt);
  if (!v1) {
    operator new();
  }
  syslog(3, "failed to get audit token for current process: %llx", v1);
}

void sub_100056964(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    int v6 = [v3 teamID];
    if (v6) {
      [v5 addObject:v6];
    }
    id v7 = [v3 entitlementValueForKey:@"useractivity-team-identifier" ofClass:objc_opt_class()];
    if (v7)
    {
      __int16 v8 = sub_10000BA18(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [v3 bundleIdentifier];
        int v20 = 138543618;
        unsigned int v21 = v7;
        __int16 v22 = 2114;
        long long v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " including entitledTeam: %{public}@ for bundle %{public}@", (uint8_t *)&v20, 0x16u);
      }
      [v5 addObject:v7];
    }
    id v10 = [v3 entitlementValueForKey:@"com.apple.developer.team-identifier" ofClass:objc_opt_class()];
    if (v10)
    {
      int v11 = sub_10000BA18(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v3 bundleIdentifier];
        int v20 = 138543618;
        unsigned int v21 = v10;
        __int16 v22 = 2114;
        long long v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, " including developerTeamID: %{public}@ for bundle %{public}@", (uint8_t *)&v20, 0x16u);
      }
      [v5 addObject:v10];
    }
    __int16 v13 = [v3 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
    uint64_t v14 = v13;
    if (v13)
    {
      if ((unint64_t)[v13 length] >= 0xB)
      {
        id v15 = [v14 rangeOfString:@"."];
        if (v16 == 1 && v15 == (id)10)
        {
          unint64_t v17 = sub_10000BA18(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            __int16 v18 = [v14 substringToIndex:10];
            int v20 = 138543618;
            unsigned int v21 = v18;
            __int16 v22 = 2114;
            long long v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, " including teamID: %{public}@ from applicationIdentifier %{public}@", (uint8_t *)&v20, 0x16u);
          }
          long long v19 = [v14 substringToIndex:10];
          [v5 addObject:v19];
        }
      }
    }
    if ([v5 containsObject:@"0000000000"])
    {
      [v5 removeObject:@"0000000000"];
      [v5 addObject:&stru_1000C6800];
    }
  }
}

void sub_100057FF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100058038(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000BA18(@"signposts");
  __int16 v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 32);
  if (v9 + 1 >= 2 && os_signpost_enabled(v7))
  {
    if (v5) {
      BOOL v43 = v6 == 0;
    }
    else {
      BOOL v43 = 0;
    }
    int v44 = v43;
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v118) = v44;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "sharingFetch", "success=%{public}d enableTelemetry=YES ", buf, 8u);
  }

  id v10 = +[UAUserActivityDefaults sharedDefaults];
  [v10 debugAdditionalPayloadReceiveTimeInterval];
  double v12 = v11;

  if (v12 > 0.0)
  {
    __int16 v13 = sub_10000BA18(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v118 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "*** DELAYING payload receive by an additional %f seconds for DEBUGAdditionalPayloadReceiveTimeInterval", buf, 0xCu);
    }

    usleep((v12 * 1000000.0));
    uint64_t v14 = sub_10000BA18(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v118 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "*** FINISHED DELAYING payload receive by an additional %f seconds for DEBUGAdditionalPayloadReceiveTimeInterval", buf, 0xCu);
    }
  }
  kdebug_trace();
  double v15 = sub_100064548() - *(double *)(a1 + 40);
  double v16 = 0.0;
  if (v15 > 0.0) {
    double v16 = (double)(unint64_t)[v5 length] / v15;
  }
  unint64_t v17 = sub_10000BA18(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [*(id *)(a1 + 32) uuid];
    long long v19 = [v18 UUIDString];
    int v20 = [*(id *)(a1 + 32) advertisementPayload];
    id v21 = [v5 length];
    __int16 v22 = sub_10000F05C(v5, 40);
    *(_DWORD *)long long buf = 138544899;
    double v118 = *(double *)&v19;
    __int16 v119 = 2114;
    id v120 = v20;
    __int16 v121 = 2048;
    id v122 = v21;
    __int16 v123 = 2113;
    uint64_t v124 = (uint64_t)v22;
    __int16 v125 = 2048;
    double v126 = v15;
    __int16 v127 = 2048;
    uint64_t v128 = (uint64_t)v16;
    __int16 v129 = 2114;
    id v130 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PAYLOAD:GOT payload for item %{public}@/%{public}@, dataSize=%ld/%{private}@ speed=%g/%{bitrate}ld error=%{public}@", buf, 0x48u);
  }
  if (v5)
  {
    id v23 = [v5 length];
    uint64_t v24 = [*(id *)(a1 + 32) wasContinuedInfo];
    [v24 setPayloadSize:v23];

    uint64_t v25 = [*(id *)(a1 + 32) wasContinuedInfo];
    [v25 setTransferSpeed:v16];

    id v26 = [*(id *)(a1 + 32) wasContinuedInfo];
    [v26 setTransferDuration:v15];
  }
  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    id v26 = [*(id *)(a1 + 32) wasContinuedInfo];
    [v26 setError:v6];
  }

LABEL_17:
  id v27 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = [*(id *)(a1 + 32) wasContinuedInfo];
    *(_DWORD *)long long buf = 138477827;
    double v118 = *(double *)&v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Updated wasContinuedInfo with payload fetch results: %{private}@", buf, 0xCu);
  }
  __int16 v29 = [*(id *)(a1 + 32) payloadRequestedCompletions];
  [*(id *)(a1 + 32) setPayloadRequestedCompletions:0];
  id v30 = *(id *)(a1 + 32);
  objc_sync_enter(v30);
  [*(id *)(a1 + 32) setPayloadRequested:0];
  if (!v6)
  {
    id v35 = [[UserActivityToBTLEPayload alloc] initWithData:v5];
    id v36 = v35;
    if (!v35)
    {
      id v6 = 0;
      goto LABEL_75;
    }
    id v37 = [(UserActivityToBTLEPayload *)v35 error];
    BOOL v38 = v37 == 0;

    if (!v38)
    {
      id v6 = [(UserActivityToBTLEPayload *)v36 error];
      [*(id *)(a1 + 32) setPayloadAvailable:0];
      id v39 = sub_10000BA18(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = [*(id *)(a1 + 32) uuid];
        id v41 = [v40 UUIDString];
        id v42 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138543875;
        double v118 = *(double *)&v41;
        __int16 v119 = 2113;
        id v120 = v42;
        __int16 v121 = 2114;
        id v122 = v6;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Payload for item %{public}@/%{private}@ was received with error %{public}@\n", buf, 0x20u);
      }
LABEL_73:

      goto LABEL_74;
    }
    uint64_t v45 = [*(id *)(a1 + 32) activityType];
    if (v45)
    {
      long long v46 = [*(id *)(a1 + 32) activityType];
      unsigned __int8 v47 = [v46 isEqual:@"com.apple.GameController"];
    }
    else
    {
      unsigned __int8 v47 = 0;
    }

    id v48 = [*(id *)(a1 + 32) activityType];
    if (!v48
      || ([*(id *)(a1 + 32) activityType],
          id v49 = objc_claimAutoreleasedReturnValue(),
          unsigned int v50 = [v49 isEqual:@"NSUserActivityTypeBrowsingWeb"],
          v49,
          v48,
          !v50))
    {
      if (v47) {
        goto LABEL_49;
      }
      long long v60 = [*(id *)(a1 + 32) teamIDs];
      if (!v60) {
        goto LABEL_49;
      }
      long long v61 = [*(id *)(a1 + 32) teamIDs];
      long long v62 = [(UserActivityToBTLEPayload *)v36 teamID];
      unsigned __int8 v63 = [v61 containsObject:v62];

      if (v63)
      {
LABEL_49:
        id v64 = [*(id *)(a1 + 32) activityType];
        if (!v64) {
          goto LABEL_63;
        }
        CFStringRef v65 = [*(id *)(a1 + 32) activityType];
        CFURLRef v66 = [(UserActivityToBTLEPayload *)v36 activityType];
        unsigned __int8 v67 = [v65 isEqual:v66];

        if (v67) {
          goto LABEL_63;
        }
        unsigned int v68 = sub_10000BA18(0);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          NSFileAttributeType v69 = [*(id *)(a1 + 32) uuid];
          id v70 = [v69 UUIDString];
          uint64_t v71 = [(UserActivityToBTLEPayload *)v36 activityType];
          long long v72 = [*(id *)(a1 + 32) activityType];
          *(_DWORD *)long long buf = 138544131;
          double v118 = *(double *)&v70;
          __int16 v119 = 2113;
          id v120 = v71;
          __int16 v121 = 2113;
          id v122 = v72;
          __int16 v123 = 2048;
          uint64_t v124 = -111;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "*** Mismatch for activity %{public}@ between activityType from received activity, %{private}@, and activityType associated with application targeted, %{private}@, so refusing to pass along activity to this target, error #%ld.", buf, 0x2Au);
        }
      }
      else
      {
        unsigned int v68 = sub_10000BA18(0);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          uint64_t v111 = [*(id *)(a1 + 32) uuid];
          id v73 = [v111 UUIDString];
          long long v74 = [(UserActivityToBTLEPayload *)v36 teamID];
          long long v75 = [*(id *)(a1 + 32) teamIDs];
          long long v76 = [v75 description];
          long long v77 = sub_100063FF0(v76);
          *(_DWORD *)long long buf = 138544131;
          double v118 = *(double *)&v73;
          __int16 v119 = 2113;
          id v120 = v74;
          __int16 v121 = 2113;
          id v122 = v77;
          __int16 v123 = 2048;
          uint64_t v124 = -111;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "*** Mismatch for activity %{public}@  between teamID from received activity, %{private}@, and teamID associated with application targeted, %{private}@, so refusing to pass along activity to this target.  Error #%ld, UAContinuityUserActivityFailedValidation", buf, 0x2Au);
        }
      }

      id v6 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-111 userInfo:0];
LABEL_74:

      goto LABEL_75;
    }
    id v51 = [(UserActivityToBTLEPayload *)v36 teamID];
    if (v51)
    {
      v52 = [*(id *)(a1 + 32) teamIDs];
      if (v52)
      {
        id v53 = [*(id *)(a1 + 32) teamIDs];
        id v54 = [(UserActivityToBTLEPayload *)v36 teamID];
        unsigned __int8 v109 = [v53 containsObject:v54];

        if ((v109 & 1) == 0)
        {
          id v55 = sub_10000BA18(0);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = [*(id *)(a1 + 32) uuid];
            id v110 = [v56 UUIDString];
            uint64_t v108 = [(UserActivityToBTLEPayload *)v36 teamID];
            id v57 = [*(id *)(a1 + 32) teamIDs];
            long long v58 = [v57 description];
            long long v59 = sub_100063FF0(v58);
            *(_DWORD *)long long buf = 138543875;
            double v118 = *(double *)&v110;
            __int16 v119 = 2113;
            id v120 = v108;
            __int16 v121 = 2113;
            id v122 = v59;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "*** For activity %{public}@ of type NSUserActivityTypeBrowsingWeb, being reecived, since the teamID from received activity, %{private}@, and teamID associated with application targeted, %{private}@, do not match, setting the userInfoPayload to nil so we don't deliver an un-expected payload type to the target.", buf, 0x20u);
          }
LABEL_62:

          [(UserActivityToBTLEPayload *)v36 setUserInfoPayload:0];
          [(UserActivityToBTLEPayload *)v36 setStreamsData:0];
          goto LABEL_63;
        }
      }
      else
      {
      }
    }
    long long v78 = [*(id *)(a1 + 32) teamIDs];
    if (v78)
    {
    }
    else
    {
      long long v79 = [(UserActivityToBTLEPayload *)v36 teamID];
      BOOL v80 = v79 == 0;

      if (!v80)
      {
        id v55 = sub_10000BA18(0);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = [*(id *)(a1 + 32) uuid];
          id v82 = [v81 UUIDString];
          NSErrorUserInfoKey v83 = [(UserActivityToBTLEPayload *)v36 teamID];
          *(_DWORD *)long long buf = 138543619;
          double v118 = *(double *)&v82;
          __int16 v119 = 2113;
          id v120 = v83;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "*** For activity %{public}@ of type NSUserActivityTypeBrowsingWeb, being received, since the teamID from received activity, %{private}@, and the target application has no teamID, setting the userInfoPayload to nil so we don't deliver an un-expected payload type to the target.", buf, 0x16u);
        }
        goto LABEL_62;
      }
    }
LABEL_63:
    id v84 = sub_10000BA18(0);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      v85 = [*(id *)(a1 + 32) uuid];
      id v86 = [v85 UUIDString];
      v87 = [(UserActivityToBTLEPayload *)v36 userInfoPayload];
      v88 = sub_100003070(v87);
      *(_DWORD *)long long buf = 138543619;
      double v118 = *(double *)&v86;
      __int16 v119 = 2113;
      id v120 = v88;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Updating payload for item %{public}@ to %{private}@\n", buf, 0x16u);
    }
    v89 = [(UserActivityToBTLEPayload *)v36 title];
    [*(id *)(a1 + 32) setTitle:v89];

    v90 = *(void **)(a1 + 32);
    v91 = [(UserActivityToBTLEPayload *)v36 userInfoPayload];
    [v90 setPayload:v91 identifier:UAUserActivityUserInfoPayload];

    v92 = *(void **)(a1 + 32);
    v93 = [(UserActivityToBTLEPayload *)v36 streamsData];
    [v92 setPayload:v93 identifier:UAUserActivityStreamsPayload];

    CFURLRef v94 = [(UserActivityToBTLEPayload *)v36 webpageURL];
    [*(id *)(a1 + 32) setWebpageURL:v94];

    [*(id *)(a1 + 32) setPayloadAvailable:1];
    uint64_t v95 = [(UserActivityToBTLEPayload *)v36 additionalItems];
    v96 = [v95 objectForKey:@"persistentID"];
    [*(id *)(a1 + 32) setPersistentIdentifier:v96];

    v97 = [(UserActivityToBTLEPayload *)v36 additionalItems];
    id v39 = [v97 objectForKey:@"targetContentID"];

    if (v39)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v98 = sub_10000BA18(0);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138739971;
          double v118 = *(double *)&v39;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "- Extracted targetContentIdentifie=%{sensitive}@ from additionalItems payload", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setTargetContentIdentifier:v39];
      }
    }
    uint64_t v99 = [(UserActivityToBTLEPayload *)v36 streamsData];

    if (v99)
    {
      id v100 = [*(id *)(a1 + 32) wasContinuedInfo];
      [v100 setSupportsContinuityStreams:1];
    }
    uint64_t v101 = [*(id *)(a1 + 32) manager];
    [v101 scheduleBestAppDetermination];

    [*(id *)(a1 + 32) setPayloadAvailable:1];
    id v6 = 0;
    goto LABEL_73;
  }
  __int16 v31 = sub_10000BA18(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    unint64_t v32 = [*(id *)(a1 + 32) uuid];
    id v33 = [v32 UUIDString];
    uint64_t v34 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138543875;
    double v118 = *(double *)&v33;
    __int16 v119 = 2113;
    id v120 = v34;
    __int16 v121 = 2112;
    id v122 = v6;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to fetch payload from sharingd for item %{public}@/%{private}@, with error %@\n", buf, 0x20u);
  }
  [*(id *)(a1 + 32) setPayloadAvailable:0];
LABEL_75:
  v102 = sub_10000BA18(0);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    id v103 = [v29 count];
    *(_DWORD *)long long buf = 134218242;
    double v118 = *(double *)&v103;
    __int16 v119 = 2114;
    id v120 = v6;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "-- Calling %ld completionHandlers with payloadRequest information: error=%{public}@", buf, 0x16u);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v104 = v29;
  id v105 = [v104 countByEnumeratingWithState:&v112 objects:v116 count:16];
  if (v105)
  {
    uint64_t v106 = *(void *)v113;
    do
    {
      for (i = 0; i != v105; i = (char *)i + 1)
      {
        if (*(void *)v113 != v106) {
          objc_enumerationMutation(v104);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v112 + 1) + 8 * i) + 16))();
      }
      id v105 = [v104 countByEnumeratingWithState:&v112 objects:v116 count:16];
    }
    while (v105);
  }

  objc_sync_exit(v30);
}

void sub_100058FFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100059284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005C1A0(uint64_t a1)
{
}

id sub_10005C1A8(uint64_t a1)
{
  CFBooleanRef v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    id v4 = [WeakRetained bundleIdentifier];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    id v6 = [v5 auditToken];
    int v12 = 138478083;
    __int16 v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = (int)[v6 pid];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "--- invalidation on connection to client %{private}@ pid=%ld", (uint8_t *)&v12, 0x16u);
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v7 invalidate];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  os_signpost_id_t v9 = [v8 controller];
  id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v9 removeClientActivityClient:v10];

  return objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), 0);
}

void sub_10005C340(uint64_t a1)
{
  CFBooleanRef v2 = [*(id *)(a1 + 32) bundleIdentifier];

  if (!v2)
  {
    id v3 = sub_10000BA18(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      signed int v4 = [*(id *)(*(void *)(a1 + 32) + 88) pid];
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to fetch bundleIdentifier for process with pid %ld after 10 seconds", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_10005C634(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005C6C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005CAEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005CB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005D26C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005D290(uint64_t a1, void *a2)
{
  id v3 = a2;
  signed int v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) UUIDString];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Got error on connection back to client for %{public}@, error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
  objc_sync_exit(v6);

  [*(id *)(a1 + 40) dispatchPendingTasksForUUID:*(void *)(a1 + 32) error:v3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) invalidate];
}

void sub_10005D3C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005D3E0(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  __int16 v9 = sub_10000BA18(0);
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v11 = [*(id *)(a1 + 32) UUIDString];
      int v18 = 138543618;
      long long v19 = v11;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "FAILED: Calling back to client to ask it to save activity %{public}@ with error %{public}@.", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [*(id *)(a1 + 32) UUIDString];
    if (a3) {
      __int16 v13 = "YES";
    }
    else {
      __int16 v13 = "NO";
    }
    __int16 v14 = [v7 logString];
    int v18 = 138543875;
    long long v19 = v12;
    __int16 v20 = 2082;
    id v21 = v13;
    __int16 v22 = 2113;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returned from back to client to ask it to save activity %{public}@, clean=%{public}s updatedInfo=%{private}@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v15 = *(void **)(a1 + 40);
  if (v15)
  {
    [v15 update:v7];
    id v10 = [*(id *)(a1 + 48) manager];
    [v10 scheduleUpdatingAdvertisableItems];
LABEL_11:
  }
  id v16 = *(id *)(a1 + 48);
  objc_sync_enter(v16);
  if (a3) {
    [*(id *)(*(void *)(a1 + 48) + 120) removeObject:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(a1 + 48) + 48) removeObject:*(void *)(a1 + 32)];
  objc_sync_exit(v16);

  [*(id *)(a1 + 48) dispatchPendingTasksForUUID:*(void *)(a1 + 32) error:v8];
  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, char *))(v17 + 16))(v17, v8);
  }
  [*(id *)(a1 + 56) invalidate];
}

void sub_10005D630(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005D7E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  signed int v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_10005DB50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005DB80(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 uuid];
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = [v8 block];
    v7[2](v7, *(void *)(a1 + 40));

    [*(id *)(a1 + 48) addIndex:a3];
  }
}

void sub_10005FF20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0, a2);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

void sub_10005FFBC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [*(id *)(a1 + 32) UUIDString];
    __int16 v29 = [*(id *)(a1 + 40) logString];
    unsigned int v6 = [*(id *)(a1 + 40) payloadForIdentifier:UAUserActivityUserInfoPayload];
    id v7 = sub_10000F05C(v6, 32);
    uint64_t v8 = UAUserActivityStreamsPayload;
    __int16 v9 = [*(id *)(a1 + 40) payloadForIdentifier:UAUserActivityStreamsPayload];
    if (v9)
    {
      id v28 = [*(id *)(a1 + 40) payloadForIdentifier:v8];
      uint64_t v2 = sub_10000F05C(v28, 16);
      +[NSString stringWithFormat:@"stream=%@ ", v2];
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = &stru_1000C6800;
    }
    double v11 = [*(id *)(a1 + 40) webpageURL];
    *(_DWORD *)long long buf = 138544643;
    CFStringRef v12 = @"YES";
    id v32 = v30;
    if (!v11) {
      CFStringRef v12 = &stru_1000C6800;
    }
    __int16 v33 = 2113;
    uint64_t v34 = v29;
    __int16 v35 = 2113;
    id v36 = v7;
    __int16 v37 = 2113;
    BOOL v38 = v10;
    __int16 v39 = 2113;
    CFStringRef v40 = v12;
    __int16 v41 = 2114;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-- activity with uuid %{public}@, completed fetching payload, %{private}@ %{private}@ %{private}@%{private}@, for it. error=%{public}@", buf, 0x3Eu);

    if (v9)
    {
    }
  }

  if (v4)
  {
    __int16 v13 = [v4 domain];
    uint64_t v14 = UAContinuityErrorDomain;
    if ([v13 isEqual:UAContinuityErrorDomain])
    {
      id v15 = v4;
    }
    else
    {
      id v21 = +[NSDictionary dictionaryWithObject:v4 forKey:NSUnderlyingErrorKey];
      id v15 = +[NSError errorWithDomain:v14 code:-105 userInfo:v21];
    }
    __int16 v22 = sub_10000BA18(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = [*(id *)(a1 + 32) UUIDString];
      *(_DWORD *)long long buf = 138543618;
      id v32 = v4;
      __int16 v33 = 2114;
      uint64_t v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, " -- Received error %{public}@ trying to fetch payload for item uuid %{public}@", buf, 0x16u);
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v15);
  }
  else
  {
    id v16 = sub_10000BA18(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [*(id *)(a1 + 40) uuid];
      int v18 = [v17 UUIDString];
      long long v19 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138543619;
      id v32 = v18;
      __int16 v33 = 2113;
      uint64_t v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, " -- Sending userActivityInfo back to client, %{public}@/%{private}@", buf, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 48);
    id v15 = [*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v15, 0);
  }

  uint64_t v24 = sub_10000BA18(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = [*(id *)(a1 + 40) uuid];
    id v26 = [v25 UUIDString];
    id v27 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543619;
    id v32 = v26;
    __int16 v33 = 2113;
    uint64_t v34 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, " -- Removing cornerActionItem payload %{public}@/%{private}@ because a client fetched it.", buf, 0x16u);
  }
  [*(id *)(a1 + 40) clearPayload];
}

void sub_100060434(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 scheduleUpdatingAdvertisableItems];
  }
}

void sub_10006221C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100062230(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 48);
  switch(v5)
  {
    case 1:
      unsigned int v6 = *(void **)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) inputStream];

      if (v6 == v7)
      {
        id v82 = [*(id *)(a1 + 40) peerName];

        if (!v82)
        {
          NSErrorUserInfoKey v83 = [*(id *)(a1 + 32) propertyForKey:@"__kCFStreamPropertyPeerAddress"];
          id v84 = v83;
          if (v83)
          {
            id v85 = v83;
            if (!getnameinfo((const sockaddr *)[v85 bytes], (socklen_t)objc_msgSend(v85, "length"), (char *)buf, 0x1000u, 0, 0, 2))
            {
              id v86 = +[NSString stringWithCString:buf encoding:4];
              [*(id *)(a1 + 40) setPeerName:v86];
            }
          }
        }
        v87 = [*(id *)(a1 + 40) peerName];
        [*(id *)(a1 + 40) setName:v87];
      }
      else
      {
        uint64_t v8 = *(void **)(a1 + 32);
        __int16 v9 = [*(id *)(a1 + 40) outputStream];

        if (v8 == v9)
        {
          id v10 = sub_10000BA18(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            double v11 = [*(id *)(a1 + 40) peerName];
            CFStringRef v12 = [*(id *)(a1 + 40) peerUUID];
            __int16 v13 = [v12 UUIDString];
            uint64_t v14 = [*(id *)(a1 + 40) uuid];
            id v15 = [v14 UUIDString];
            *(_DWORD *)long long buf = 138478339;
            uint64_t v106 = v11;
            __int16 v107 = 2114;
            id v108 = v13;
            __int16 v109 = 2114;
            id v110 = v15;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "NETWORK: Sending initial packet to paired client %{private}@/%{public}@ from controllerUUID=%{public}@.", buf, 0x20u);
          }
          id v16 = *(void **)(a1 + 40);
          uint64_t v17 = [v16 manager];
          int v18 = [v17 uuid];
          long long v19 = [v18 UUIDString];
          uint64_t v20 = +[NSString stringWithFormat:@"HANDOFF v%g %@\n", 0x4081380000000000, v19];
          [v16 sendResponse:v20];

          id v21 = +[SFPeerDevice peerForSelf];
          if (v21)
          {
            id v22 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
            [v22 encodeObject:v21 forKey:NSKeyedArchiveRootObjectKey];
            id v23 = *(void **)(a1 + 40);
            uint64_t v24 = [v22 encodedData];
            uint64_t v25 = sub_100003070(v24);
            id v26 = +[NSString stringWithFormat:@"PEERINFO SF[$%@]\n", v25];
            [v23 sendResponse:v26];
          }
        }
      }
      break;
    case 2:
      uint64_t v27 = (uint64_t)[*(id *)(a1 + 32) read:buf maxLength:1024];
      if (v27 >= 1)
      {
        id v28 = [*(id *)(a1 + 40) readBuffer];
        [v28 appendBytes:buf length:v27];
      }
      __int16 v29 = sub_10000BA18(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        id v30 = *(void **)(a1 + 32);
        __int16 v31 = [*(id *)(a1 + 40) readBuffer];
        id v32 = [v31 length];
        __int16 v33 = [*(id *)(a1 + 40) readBuffer];
        uint64_t v34 = sub_100003070(v33);
        __int16 v35 = [*(id *)(a1 + 40) uuid];
        id v36 = [v35 UUIDString];
        *(_DWORD *)long long buf = 138478595;
        uint64_t v106 = v30;
        __int16 v107 = 2048;
        id v108 = v32;
        __int16 v109 = 2113;
        id v110 = v34;
        __int16 v111 = 2114;
        long long v112 = v36;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "NETWORK: stream=%{private}@ have %ld/%{private}@ controllerUUID=%{public}@", buf, 0x2Au);
      }
      id v37 = [*(id *)(a1 + 40) readBuffer];
      v102 = (char *)[v37 bytes];

      BOOL v38 = [*(id *)(a1 + 40) readBuffer];
      BOOL v39 = [v38 length] == 0;

      if (v39)
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = 0;
        unint64_t v41 = 0;
        do
        {
          id v42 = [*(id *)(a1 + 40) readBuffer];
          BOOL v43 = v41 < (unint64_t)[v42 length];

          if (v43)
          {
            uint64_t v44 = 0;
            uint64_t v45 = &v102[v41];
            do
            {
              unsigned int v46 = v45[v44];
              BOOL v47 = v46 > 0xD;
              int v48 = (1 << v46) & 0x2401;
              BOOL v49 = v47 || v48 == 0;
              if (v49 || v44 < 2)
              {
                id v50 = 0;
              }
              else
              {
                id v50 = [objc_alloc((Class)NSString) initWithBytes:v45 length:v44 encoding:4];
                uint64_t v40 = v41 + v44 + 1;
              }
              id v51 = [*(id *)(a1 + 40) readBuffer];
              BOOL v53 = v41 + v44 + 1 < (unint64_t)[v51 length] && v50 == 0;

              ++v44;
            }
            while (v53);
            v41 += v44;
            if (v50)
            {
              id v54 = [*(id *)(a1 + 40) queue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100062D1C;
              block[3] = &unk_1000C5BB0;
              void block[4] = *(void *)(a1 + 40);
              id v104 = v50;
              id v55 = v50;
              dispatch_async(v54, block);
            }
          }
          v56 = [*(id *)(a1 + 40) readBuffer];
          BOOL v57 = v41 < (unint64_t)[v56 length];
        }
        while (v57);
      }
      id v88 = objc_alloc((Class)NSMutableData);
      v89 = [*(id *)(a1 + 40) readBuffer];
      id v90 = objc_msgSend(v88, "initWithBytes:length:", &v102[v40], (char *)objc_msgSend(v89, "length") - v40);
      [*(id *)(a1 + 40) setReadBuffer:v90];

      v91 = [*(id *)(a1 + 40) readBuffer];
      BOOL v92 = [v91 length] == 0;

      if (!v92)
      {
        v93 = sub_10000BA18(0);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          uint64_t v95 = *(void **)(a1 + 40);
          CFURLRef v94 = (id *)(a1 + 40);
          v96 = *(v94 - 1);
          v97 = [v95 readBuffer];
          id v98 = [v97 length];
          uint64_t v99 = [*v94 readBuffer];
          id v100 = sub_100003070(v99);
          *(_DWORD *)long long buf = 138478339;
          uint64_t v106 = v96;
          __int16 v107 = 2048;
          id v108 = v98;
          __int16 v109 = 2113;
          id v110 = v100;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "NETWORK: stream=%{private}@ Remaining data, %ld/%{private}@", buf, 0x20u);
        }
      }
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      id v58 = *(id *)(a1 + 40);
      objc_sync_enter(v58);
      long long v59 = [*(id *)(a1 + 40) writeBuffer];
      [v59 length];
      while (1)
      {

        long long v60 = [*(id *)(a1 + 40) writeBuffer];
        id v61 = [v60 length];

        if (!v61) {
          break;
        }
        long long v62 = [*(id *)(a1 + 40) outputStream];
        id v63 = [*(id *)(a1 + 40) writeBuffer];
        id v64 = [v63 bytes];
        CFStringRef v65 = [*(id *)(a1 + 40) writeBuffer];
        CFURLRef v66 = objc_msgSend(v62, "write:maxLength:", v64, objc_msgSend(v65, "length"));

        if (!v66) {
          break;
        }
        long long v59 = [*(id *)(a1 + 40) writeBuffer];
        unsigned __int8 v67 = [v59 length];
        if (v66 >= v67)
        {
          NSFileAttributeType v69 = 0;
        }
        else
        {
          id v1 = [*(id *)(a1 + 40) writeBuffer];
          id v68 = [v1 bytes];
          uint64_t v2 = [*(id *)(a1 + 40) writeBuffer];
          id v3 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v66[(void)v68], (unsigned char *)[v2 length] - v66);
          NSFileAttributeType v69 = v3;
        }
        [*(id *)(a1 + 40) setWriteBuffer:v69];
        if (v66 < v67)
        {
        }
      }
      objc_sync_exit(v58);

      break;
    case 8:
      id v70 = sub_10000BA18(0);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = *(void **)(a1 + 32);
        long long v72 = [v71 streamError];
        *(_DWORD *)long long buf = 138478083;
        uint64_t v106 = v71;
        __int16 v107 = 2114;
        id v108 = v72;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "NETWORK: stream=%{private}@ error=%{public}@", buf, 0x16u);
      }
      goto LABEL_48;
    default:
      if (v5 == 16)
      {
LABEL_48:
        id v73 = sub_10000BA18(0);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          long long v74 = *(void **)(a1 + 32);
          *(_DWORD *)long long buf = 138477827;
          uint64_t v106 = v74;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "NETWORK: stream=%{private}@ END ENCOUNTERED", buf, 0xCu);
        }

        long long v75 = [*(id *)(a1 + 40) readBuffer];
        BOOL v76 = [v75 length] == 0;

        if (!v76)
        {
          id v77 = [*(id *)(a1 + 40) readBuffer];
          id v78 = [v77 bytes];

          id v79 = objc_alloc((Class)NSString);
          BOOL v80 = [*(id *)(a1 + 40) readBuffer];
          id v81 = objc_msgSend(v79, "initWithBytes:length:encoding:", v78, objc_msgSend(v80, "length"), 4);

          [*(id *)(a1 + 40) processCommand:v81];
        }
        [*(id *)(a1 + 40) terminate];
      }
      break;
  }
}

void sub_100062CD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100062D1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) processCommand:*(void *)(a1 + 40)];
}

void sub_100063738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000639BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputStream];
  [v2 close];

  id v3 = [*(id *)(a1 + 32) outputStream];
  [v3 close];
}

BOOL sub_100063C78(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4) {
      BOOL v6 = [v3 compare:v4] == (id)-1;
    }
    else {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_100063CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100063CFC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSDate date];
  BOOL v3 = sub_100063C78(v1, v2);

  return v3;
}

void sub_100063D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100063D74(void *a1, void *a2)
{
  return !sub_100063C78(a1, a2);
}

BOOL sub_100063D90(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSDate date];
  BOOL v3 = !sub_100063C78(v1, v2);

  return v3;
}

void sub_100063DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_100063E08(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (char *)[v3 length];
    if ((uint64_t)v5 <= a2)
    {
      uint64_t v8 = v4;
    }
    else
    {
      BOOL v6 = objc_msgSend(v4, "substringWithRange:", 0, a2 >> 1);
      id v7 = objc_msgSend(v4, "substringWithRange:", &v5[-(a2 >> 1)], a2 >> 1);
      uint64_t v8 = +[NSString stringWithFormat:@"%@..(%ld)..%@", v6, &v5[-a2], v7];
    }
  }
  else
  {
    uint64_t v8 = &stru_1000C6800;
  }

  return v8;
}

void sub_100063EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100063F24(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0x41)
  {
    id v3 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", [v2 bytes], 64, 0);
    id v4 = [v3 description];
  }
  else
  {
    id v4 = [v2 description];
  }

  return v4;
}

void sub_100063FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100063FF0(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if ([v1 containsString:@"\n"])
  {
    id v3 = [v1 mutableCopy];
    do
      id v4 = objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1000C6800, 0, 0, objc_msgSend(v3, "length"));
    while ((char *)objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" ", 0, 0, objc_msgSend(v3, "length"))+ (void)v4);
    id v2 = [v3 copy];
  }

  return v2;
}

void sub_1000640F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_100064118(double a1)
{
  if (a1 >= 1.0e98)
  {
    id v1 = @"forever";
    goto LABEL_14;
  }
  if (a1 <= 0.0)
  {
    id v1 = @"now";
    goto LABEL_14;
  }
  if (a1 < 300.0)
  {
    +[NSString stringWithFormat:@"%ld seconds", (uint64_t)a1];
LABEL_13:
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a1 < 3600.0)
  {
    +[NSString stringWithFormat:@"roughly %ld minutes", (uint64_t)a1 / 60];
    goto LABEL_13;
  }
  if (a1 < 86400.0)
  {
    +[NSString stringWithFormat:@"roughly %ld hours", (uint64_t)a1 / 3600];
    goto LABEL_13;
  }
  if (a1 < 7776000.0)
  {
    +[NSString stringWithFormat:@"roughly %ld days", 3600 * ((uint64_t)a1 / 24)];
    goto LABEL_13;
  }
  id v1 = @"a long time";
LABEL_14:

  return v1;
}

__CFString *sub_100064288(unint64_t a1)
{
  if (a1 == -1)
  {
    id v4 = @"forever";
    goto LABEL_9;
  }
  if (!a1 || (v2 = dispatch_time(0, 0), v2 > a1) || (double v3 = ((double)a1 - (double)v2) / 1000000000.0, v3 <= 0.0))
  {
    id v4 = @"now";
    goto LABEL_9;
  }
  if (v3 < 10.0)
  {
    +[NSString stringWithFormat:@"%2.1g seconds", *(void *)&v3];
LABEL_20:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v3 < 30.0)
  {
    +[NSString stringWithFormat:@"%2ld seconds", (uint64_t)v3];
    goto LABEL_20;
  }
  if (v3 < 300.0)
  {
    +[NSString stringWithFormat:@"%3ld seconds", (uint64_t)v3];
    goto LABEL_20;
  }
  if (v3 < 3600.0)
  {
    +[NSString stringWithFormat:@"roughly %2ld minutes", (uint64_t)v3 / 60];
    goto LABEL_20;
  }
  if (v3 < 86400.0)
  {
    +[NSString stringWithFormat:@"roughly %2ld hours", (uint64_t)(v3 / 60.0) / 24];
    goto LABEL_20;
  }
  BOOL v6 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  id v4 = +[NSString stringWithFormat:@"%@", v6];

LABEL_9:

  return v4;
}

void sub_100064468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_100064478(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0xA && ((0x217u >> v1))
  {
    dispatch_time_t v2 = off_1000C5FD0[v1];
  }
  else
  {
    +[NSString stringWithFormat:@"UASuggestedActionType=%ld", a1];
    dispatch_time_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id sub_1000644EC(void *a1)
{
  uint64_t v1 = [a1 description];
  dispatch_time_t v2 = sub_100063FF0(v1);

  return v2;
}

void sub_100064538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_100064548()
{
  uint64_t v0 = mach_absolute_time();
  if (!v0) {
    return NAN;
  }
  unint64_t v1 = v0;
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info)) {
    return NAN;
  }
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  double result = (double)v1 * (double)v2 / (double)v3 / 1000000000.0;
  double v5 = fabs(result);
  if (result < 0.0 || v5 == INFINITY) {
    return NAN;
  }
  return result;
}

id sub_1000645CC(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1
    && ([v1 appState],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isInstalled],
        v3,
        v2,
        v4))
  {
    double v5 = [v2 activityTypes];
    BOOL v6 = v5;
    if (v5) {
      id v7 = [v5 containsObject:@"NSUserActivityTypeBrowsingWeb"];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100064668(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id sub_1000646A0()
{
  id v0 = objc_alloc((Class)LSClaimBinding);
  id v1 = +[NSURL URLWithString:@"https:"];
  id v9 = 0;
  id v2 = [v0 initWithURL:v1 error:&v9];
  id v3 = v9;

  if (v2)
  {
    unsigned int v4 = [v2 bundleRecord];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v6 = [v2 bundleRecord];
      id v7 = [v6 compatibilityObject];

      if (v7)
      {
        if (sub_1000645CC(v7)) {
          goto LABEL_7;
        }
      }
    }
  }
  id v7 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.mobilesafari"];
LABEL_7:

  return v7;
}

void sub_1000647D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006480C(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_20;
  }
  id v2 = +[NSMutableString stringWithString:@"{"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [v1 allKeys];
  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    uint64_t v6 = _LSUserActivityContainsFileProviderURLKey;
    uint64_t v16 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
    uint64_t v14 = UAUserActivityItemIsNotActiveKey;
    uint64_t v15 = _UAUserActivityContainsCloudDocsKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v8 isEqual:v6])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"fileProvider:%@", v9];
        }
        else if ([v8 isEqual:v16])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"unsyncronizedCloudDocs:%@", v9];
        }
        else if ([v8 isEqual:v15])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"cloudDocs:%@", v9];
        }
        else if ([v8 isEqual:v14])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"inactive:%@", v9];
        }
        else
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          id v10 = [v9 description];
          double v11 = sub_100063FF0(v10);
          [v2 appendFormat:@"%@=%@", v8, v11];
        }
      }
      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [v2 appendFormat:@"}"];
  if (v2)
  {
    id v12 = [v2 copy];
  }
  else
  {
LABEL_20:
    id v12 = 0;
  }

  return v12;
}

void sub_100064AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100064B90(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [objc_alloc((Class)NSData) initWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  uint64_t v6 = +[UASharedPasteboardDataManager sharedInstance];
  [v6 writeArchiveData:v5 forItem:*a1];

  return a3;
}

BOOL sub_100064C0C(void *a1, const char *a2)
{
  return strncmp((const char *)[a1 cStringUsingEncoding:4], a2, (int)objc_msgSend(a1, "length")) == 0;
}

void sub_100064DF8(uint64_t a1)
{
  id v3 = +[UASharedPasteboardDataManager sharedInstance];
  id v4 = [*(id *)(a1 + 32) uuid];
  [v3 createTmpArchiveFileWithUUID:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  id v14 = 0;
  id v14 = [*(id *)(a1 + 32) uuid];
  *((void *)&v15 + 1) = sub_100064B90;
  *((void *)&v16 + 1) = &v14;
  LODWORD(v15) = 0;
  [*(id *)(a1 + 32) setWriter:ParallelArchiveWriterCreate()];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "baseURL", 0, 0, 0, 0, 0xFFFFFFFFLL, 0, 0, sub_100064C0C, 0);
  id v6 = [v5 path];
  __int16 v13 = (const char *)[v6 cStringUsingEncoding:4];

  [*(id *)(a1 + 32) leaf];
  if (!realpath_DARWIN_EXTSN(v13, v19))
  {
    id v7 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v18) = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Dir invalid: %d", buf, 8u);
    }
  }
  [*(id *)(a1 + 32) writer];
  uint64_t v9 = ParallelArchiveWriteDirContents();
  id v10 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Archiver] Created archive of size: %lld", buf, 0xCu);
  }

  [*(id *)(a1 + 32) writer];
  ParallelArchiveWriterDestroy();
  [*(id *)(a1 + 32) setWriter:0];
  double v11 = +[UASharedPasteboardDataManager sharedInstance];
  id v12 = [*(id *)(a1 + 32) uuid];
  [v11 finishWritingArchiveForUUID:v12];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000650B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1000655E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100065604(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id, id, id))(v8 + 16))(v8, v9, [v9 totalBytesReceived], v7);
}

void sub_100065900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000668F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006692C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  (*(void (**)(uint64_t, id, uint64_t, id))(v4 + 16))(v4, WeakRetained, a2, v6);
}

uint64_t sub_1000671C4(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 9) {
    uint64_t v3 = *((unsigned __int8 *)[v2 bytes] + 7);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_10006721C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10006722C(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1
    && [v1 length]
    && (id v3 = v2,
        uint64_t v4 = (char *)[v3 bytes],
        uint64_t v5 = (uint64_t)[v3 length],
        v5 >= 1))
  {
    id v6 = v4 - 1;
    do
    {
      BOOL v7 = v6[v5] == 0;
      if (v6[v5]) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = (unint64_t)v5 > 1;
      }
      --v5;
    }
    while (v8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void sub_1000672B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000673E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100067BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10006806C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000682B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006837C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100068470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006855C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006866C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006881C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000688BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100013338((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_10006A2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

id sub_10006A380(uint64_t a1)
{
  return [*(id *)(a1 + 32) _periodicIdleUpdate];
}

void sub_10006A388(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  [*(id *)(a1 + 32) setUserIsCurrent:a2];
  if (v2) {
    +[NSDate date];
  }
  else {
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:-8.0];
  }
  objc_msgSend(*(id *)(a1 + 32), "setLastUserActiveTime:");
}

void sub_10006A418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006A4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A5A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006A738(_Unwind_Exception *a1)
{
  BOOL v7 = v5;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006A794(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) setPreventIdleSleepAssertion:0];
  objc_sync_exit(obj);
}

void sub_10006A7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10006AA24(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10006BDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10006C34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10006C9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CAA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10006CB4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10006CBEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10006CD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006CD60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshPairedSFPeerDevices];
}

id sub_10006CD68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshPairedSFPeerDevices];
}

void sub_10006CF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  objc_sync_exit(v17);

  _Unwind_Resume(a1);
}

void sub_10006CFEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 allObjects];
    [v4 addObjectsFromArray:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10006D064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006D48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

BOOL sub_10006D4EC(void *a1, void *a2, unsigned int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    BOOL v7 = [v5 productName];
    if ([v7 isEqual:v6])
    {
      BOOL v8 = [v5 productBuildVersion];
      BOOL v9 = (uint64_t)[v8 integerValue] >= a3;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void sub_10006D590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006D5BC(void *a1)
{
  id v13 = a1;
  id v1 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"{(");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = v13;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v7 = [v6 uniqueID];
        BOOL v8 = [v6 name];
        BOOL v9 = [v6 modelIdentifier];
        id v10 = [v6 productBuildVersion];
        [v1 appendFormat:@"%@/%@/%@/%@ ", v7, v8, v9, v10];
      }
      id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  [v1 appendString:@"}"]);
  id v11 = [v1 copy];

  return v11;
}

void sub_10006D77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10006D85C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10006DA40(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10006DB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10006E1B8(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  uint64_t v4 = a3;
  id v5 = [(UAUserActivityInfo *)a2 when];
  id v6 = [(UAUserActivityInfo *)v4 when];
  id v7 = [v5 compare:v6];

  return (int64_t)v7;
}

void sub_10006E228(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10006EC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006EEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

uint64_t sub_10006EEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

uint64_t sub_10006EEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

void sub_100070750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_100070E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10000BA18(@"signposts");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 32);
  if (v6 + 1 >= 2 && os_signpost_enabled(v4))
  {
    int v13 = 67109120;
    LODWORD(v14) = v3 == 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "handoffFetch", "success=%d enableTelemetry=YES ", (uint8_t *)&v13, 8u);
  }

  id v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [*(id *)(a1 + 32) uuid];
    id v9 = [v8 UUIDString];
    id v10 = [*(id *)(a1 + 32) uuid];
    id v11 = [v10 UUIDString];
    id v12 = [*(id *)(a1 + 32) logString];
    int v13 = 138543875;
    id v14 = v9;
    __int16 v15 = 2114;
    long long v16 = v11;
    __int16 v17 = 2113;
    uint64_t v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "-- received data from advertiseableItem delegate callback to client, uuid=%{public}@ activity=%{public}@/%{private}@", (uint8_t *)&v13, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100070FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007126C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007143C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071464(uint64_t a1)
{
  [*(id *)(a1 + 32) scheduleAdvertisementUpdate];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = [*(id *)(a1 + 32) sfActivityAdvertisers];
  id v4 = [v3 count];

  if ((unint64_t)v4 > 1)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  }
  else
  {
    id v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) count];
      sub_10006D5BC(*(void **)(a1 + 40));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v8 = [*(id *)(a1 + 32) pairedDevices];
      int v9 = 134218498;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2048;
      id v14 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adopting paired devices, PAIRED DEVICES CHANGED: Now is %ld/%@  (was %ld devices)", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 32) setPairedDevices:*(void *)(a1 + 40)];
  }
  objc_sync_exit(v2);
}

void sub_1000715DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000716B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007174C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000717F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007190C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_100071A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100071BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100072470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_10007266C(uint64_t a1, void *a2, void *a3)
{
  __int16 v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 appendFormat:@" No AppleID, %@", v5];
  }
  else
  {
    CFStringRef v7 = @"?";
    if (v11) {
      CFStringRef v7 = v11;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v8 + 66)) {
      int v9 = "";
    }
    else {
      int v9 = "(no handoff)";
    }
    if (*(unsigned char *)(v8 + 67)) {
      id v10 = "";
    }
    else {
      id v10 = "(no pasteboard)";
    }
    [v6 appendFormat:@" AppleID:%@, devices%s%s:", v7, v9, v10];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100072750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100072768(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v2;
    id obj = v2;
    id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v19;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v7 validKey])
          {
            uint64_t v8 = *(void **)(a1 + 32);
            int v9 = [v7 name];
            id v10 = [v7 modelIdentifier];
            __int16 v11 = [v7 productName];
            id v12 = sub_100072A34(v11);
            __int16 v13 = [v7 productBuildVersion];
            [v8 appendFormat:@"%@/%@-%@-%@:+%ld, ", v9, v10, v12, v13, objc_msgSend(v7, "keyCounter")];
          }
          else
          {
            id v14 = *(void **)(a1 + 40);
            int v9 = [v7 name];
            id v10 = [v7 modelIdentifier];
            __int16 v11 = [v7 productName];
            id v12 = sub_100072A34(v11);
            __int16 v13 = [v7 productBuildVersion];
            [v14 appendFormat:@"[%@/%@-%@-%@], ", v9, v10, v12, v13];
          }
        }
        id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v4);
    }

    id v3 = v15;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100072990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

__CFString *sub_100072A34(void *a1)
{
  id v1 = a1;
  if ([v1 isEqual:@"iPhone OS"])
  {
    id v2 = @"iOS";
  }
  else if ([v1 isEqual:@"Mac OS X"])
  {
    id v2 = @"macOS";
  }
  else if ([v1 isEqual:@"Watch OS"])
  {
    id v2 = @"watchOS";
  }
  else if ([v1 isEqual:@"TVOS"])
  {
    id v2 = @"tvOS";
  }
  else
  {
    id v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_100072AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000730B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007310C(uint64_t a1, void *a2)
{
  id v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000E6900);
  id v3 = (void *)qword_1000E68F8;
  if (v7 && !qword_1000E68F8)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    uint64_t v5 = (void *)qword_1000E68F8;
    qword_1000E68F8 = v4;

    id v3 = (void *)qword_1000E68F8;
  }
  id v6 = +[NSNumber numberWithUnsignedInt:a1];
  [v3 setObject:v7 forKeyedSubscript:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000E6900);
}

void sub_1000731D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000731F0(uint64_t a1)
{
  id v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [*(id *)(a1 + 32) commandPort];
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Received message from another simulator on port %ld, so dispatching.", (uint8_t *)&v5, 0xCu);
  }

  dispatch_mig_server();
}

void sub_1000732D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000732F0(uint64_t a1)
{
  id v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [*(id *)(a1 + 32) commandPort];
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Tearing down dispatch_source_t for messages from simulator port %ld", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) terminate];
  sub_10007310C((uint64_t)[*(id *)(a1 + 32) commandPort], *(void **)(a1 + 32));
}

void sub_1000733D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000735D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10007361C(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Received notification that parent simulator started up, so forcing a reconnect to re-establish state.", v4, 2u);
  }

  return [*(id *)(a1 + 32) reconnectToParentSimulator];
}

void sub_100073720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)UASimulator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100073C54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100073CE4(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 48);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Detected death of parent simulator port %ld.", buf, 0xCu);
  }

  mach_port_mod_refs(mach_task_self_, *(_DWORD *)(a1 + 48), 0, -1);
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = 0;
  objc_sync_exit(v4);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  uint64_t v6 = [*(id *)(a1 + 32) controller];
  id v7 = [v6 dispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073E9C;
  block[3] = &unk_1000C4D40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v5, v7, block);
}

void sub_100073E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100073E9C(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIMULATOR: *** Attempting to reconnect / relaunch parent simulator.", v4, 2u);
  }

  return [*(id *)(a1 + 32) reconnectToParentSimulator];
}

void sub_100073F14(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Cancelling parent simulator port death source, port %ld", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10007402C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100074198(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100074334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000744C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000746A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100074928(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = sub_100074ABC(a1);
  if (v5)
  {
    id v6 = objc_alloc((Class)NSKeyedUnarchiver);
    id v7 = +[NSData dataWithBytes:a2 length:a3];
    id v8 = [v6 initForReadingFromData:v7 error:0];

    int v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    if (v9)
    {
      uint64_t v10 = [v5 dispatchQ];
      __int16 v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_100074B54;
      long long v16 = &unk_1000C4DD0;
      id v17 = v9;
      id v18 = v5;
      dispatch_sync(v10, &v13);
    }
    objc_msgSend(v8, "finishDecoding", v13, v14, v15, v16);

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 5;
  }

  return v11;
}

void sub_100074A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100074ABC(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000E6900);
  id v2 = (void *)qword_1000E68F8;
  if (qword_1000E68F8)
  {
    uint64_t v3 = +[NSNumber numberWithUnsignedInt:a1];
    id v2 = [v2 objectForKeyedSubscript:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000E6900);

  return v2;
}

void sub_100074B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100074B54(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138477827;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "SIMULATOR: Changing peer device info to %{private}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setPeeredDevice:*(void *)(a1 + 32)];
}

uint64_t sub_100074C08(uint64_t a1)
{
  return 0;
}

uint64_t sub_100074C2C(uint64_t a1)
{
  return 5;
}

uint64_t sub_100074C50(uint64_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5, void *a6, uint64_t a7, void *a8, _DWORD *a9)
{
  uint64_t v14 = sub_100074ABC(a1);
  id v15 = v14;
  if (v14)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_10000F42C;
    __int16 v29 = sub_100074E10;
    id v30 = 0;
    long long v16 = [v14 dispatchQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074E18;
    block[3] = &unk_1000C61F0;
    id v17 = v15;
    int v24 = a3;
    id v22 = v17;
    id v23 = &v25;
    dispatch_sync(v16, block);

    *a6 = 0;
    sub_1000752BC((void *)v26[5], a4, a5);
    id v18 = [v17 ourDevice];
    sub_1000752BC(v18, a8, a9);

    _Block_object_dispose(&v25, 8);
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 5;
  }

  return v19;
}

void sub_100074DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100074E10(uint64_t a1)
{
}

void sub_100074E18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) advertiser];
  uint64_t v3 = [v2 advertisingItems];
  int v4 = [v3 firstObject];

  int v5 = [*(id *)(a1 + 32) advertiser];
  unsigned int v6 = [v5 suspended];

  if (v6)
  {
    id v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "SIMULATOR: Because advertising is suspended, returning 'no advertised item' information to paired simulator.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
  }
  else if (v4)
  {
    if (*(_DWORD *)(a1 + 48))
    {
      int v9 = sub_10000BA18(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v4 uuid];
        uint64_t v11 = [v10 UUIDString];
        *(_DWORD *)long long buf = 138543362;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SIMULATOR: Requesting payload for item %{public}@", buf, 0xCu);
      }
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      uint64_t v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      long long v21 = sub_100075190;
      id v22 = &unk_1000C6110;
      id v23 = v4;
      dispatch_semaphore_t v24 = v12;
      __int16 v13 = v12;
      [v23 requestPayloadWithCompletionHandler:&v19];
    }
    id v14 = objc_msgSend(v4, "copy", v19, v20, v21, v22);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActive:1];
    id v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v17 = [v4 uuid];
      id v18 = [v17 UUIDString];
      *(_DWORD *)long long buf = 138543362;
      id v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SIMULATOR: Sending information on item %{public}@ to paired simulator", buf, 0xCu);
    }
  }
  else
  {
    id v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "SIMULATOR: Returning 'no advertised item' information to paired simulator.";
      goto LABEL_13;
    }
  }
}

void sub_1000750FC(_Unwind_Exception *a1)
{
  int v4 = v2;

  _Unwind_Resume(a1);
}

void sub_100075190(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [*(id *)(a1 + 32) uuid];
    unsigned int v6 = [v5 UUIDString];
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SIMULATOR: Retrieved payload for item %{public}@, error=%{public}@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007528C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000752BC(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  if (v5)
  {
    id v8 = v5;
    id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v6 encodeObject:v8 forKey:NSKeyedArchiveRootObjectKey];
    int v7 = [v6 encodedData];
    sub_10007667C(v7, a2, a3);

    id v5 = v8;
  }
  else
  {
    *a2 = 0;
    *a3 = 0;
  }
}

void sub_10007536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100075398(uint64_t a1)
{
  id v1 = sub_100074ABC(a1);
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 controller];
    int v4 = [v3 dispatchQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075488;
    block[3] = &unk_1000C4D40;
    id v8 = v2;
    dispatch_async(v4, block);

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 5;
  }

  return v5;
}

void sub_10007546C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100075488(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "SIMULATOR: Asking receiver to fetch the advertisement.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) receiver];
  unsigned int v4 = [v3 fetchAdvertisedItems:0];

  if (v4)
  {
    uint64_t v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_semaphore_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SIMULATOR: Telling manager to determine the bestApp again", v12, 2u);
    }

    id v6 = [*(id *)(a1 + 32) controller];
    int v7 = [v6 manager];
    [v7 scheduleBestAppDetermination];

    if ([*(id *)(a1 + 32) activitiesShouldCrossover])
    {
      id v8 = sub_10000BA18(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SIMULATOR: Also telling advertisers to determine the item to advertise, because activitiesShouldCrossover=YES", v11, 2u);
      }

      __int16 v9 = [*(id *)(a1 + 32) controller];
      id v10 = [v9 manager];
      [v10 scheduleUpdatingAdvertisableItems];
    }
  }
}

void sub_100075610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100075638(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v6 = sub_100074ABC(a1);
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = sub_100012DE4(v7, a3, a4, 0);
    if (v8)
    {
      __int16 v9 = [UASimulatorSuggestedItem alloc];
      id v10 = [v6 peeredDevice];
      uint64_t v11 = [(UASimulatorSuggestedItem *)v9 initWithUserActivityInfo:v8 peerDevice:v10 simulator:v6];

      dispatch_semaphore_t v12 = sub_10000BA18(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = [(UASimulatorSuggestedItem *)v11 uuid];
        id v14 = [v13 UUIDString];
        *(_DWORD *)long long buf = 138543619;
        dispatch_semaphore_t v24 = v14;
        __int16 v25 = 2113;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SIMULATOR: Setting received item to %{public}@/%{private}@", buf, 0x16u);
      }
      uint64_t v15 = [v6 controller];
      long long v16 = [v15 dispatchQ];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      _DWORD v20[2] = sub_1000758C0;
      v20[3] = &unk_1000C4DD0;
      id v21 = v6;
      id v22 = v11;
      id v17 = v11;
      dispatch_async(v16, v20);

      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = 5;
    }
  }
  else
  {
    uint64_t v18 = 5;
  }

  return v18;
}

void sub_100075858(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1000758C0(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) receiver];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = +[NSArray arrayWithObject:v2];
  }
  else
  {
    id v3 = 0;
  }
  [v4 doSetReceivedItems:v3];
  if (v2) {
}
  }

void sub_100075950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100075974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x2020000000;
  int v57 = 5;
  id v42 = sub_100074ABC(a1);
  if (v42)
  {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a2];
    long long v53 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    __int16 v13 = [v42 advertiser];
    uint64_t v40 = a6;
    uint64_t v41 = a7;
    id v14 = [v13 advertisingItems];

    id v15 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v19 = [v18 uuid];
          unsigned int v20 = [v12 isEqual:v19];

          if (v20)
          {
            id v21 = sub_10000BA18(0);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              id v22 = [v18 uuid];
              id v23 = [v22 UUIDString];
              *(_DWORD *)long long buf = 138543619;
              long long v59 = v23;
              __int16 v60 = 2113;
              id v61 = v18;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "SIMULATOR: Found item to send; %{public}@/%{private}@.  Fetching payload.",
                buf,
                0x16u);
            }
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100075F3C;
            v43[3] = &unk_1000C6218;
            uint64_t v46 = a4;
            uint64_t v47 = a5;
            uint64_t v48 = v40;
            uint64_t v49 = v41;
            v43[4] = v18;
            uint64_t v45 = &v54;
            dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
            uint64_t v44 = v24;
            [v18 requestPayloadWithCompletionHandler:v43];
            __int16 v25 = sub_10000BA18(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v26 = [v18 uuid];
              uint64_t v27 = [v26 UUIDString];
              *(_DWORD *)long long buf = 138543362;
              long long v59 = v27;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "SIMULATOR: Waiting for payload fetch to complete for item %{public}@", buf, 0xCu);
            }
            dispatch_time_t v28 = dispatch_time(0, 15000000000);
            dispatch_semaphore_wait(v24, v28);
            __int16 v29 = sub_10000BA18(0);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              id v30 = [v18 uuid];
              __int16 v31 = [v30 UUIDString];
              *(_DWORD *)long long buf = 138543362;
              long long v59 = v31;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "SIMULATOR: Finished wait for payload fetch to complete for item %{public}@", buf, 0xCu);
            }
            goto LABEL_18;
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    if (*((_DWORD *)v55 + 6))
    {
      id v32 = sub_10000BA18(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = [v12 UUIDString];
        uint64_t v34 = [v42 advertiser];
        __int16 v35 = [v34 advertisingItems];
        id v36 = [v35 description];
        id v37 = sub_100063FF0(v36);
        *(_DWORD *)long long buf = 138543619;
        long long v59 = v33;
        __int16 v60 = 2113;
        id v61 = v37;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Failed to find activity matching uuid %{public}@, items=%{private}@", buf, 0x16u);
      }
    }
  }
  uint64_t v38 = *((unsigned int *)v55 + 6);

  _Block_object_dispose(&v54, 8);
  return v38;
}

void sub_100075E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100075F3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) webpageURL];
  sub_1000752BC(v2, *(void **)(a1 + 56), *(_DWORD **)(a1 + 64));

  uint64_t v3 = UAUserActivityUserInfoPayload;
  id v4 = [*(id *)(a1 + 32) payloadForIdentifier:UAUserActivityUserInfoPayload];
  uint64_t v5 = *(vm_address_t **)(a1 + 72);
  id v6 = *(_DWORD **)(a1 + 80);
  id v7 = v4;
  id v8 = v7;
  if (v7)
  {
    if (!vm_allocate(mach_task_self_, v5, (vm_size_t)[v7 length], 1))
    {
      _DWORD *v6 = [v8 length];
      __int16 v9 = (void *)*v5;
      id v10 = v8;
      memcpy(v9, [v10 bytes], (size_t)objc_msgSend(v10, "length"));
    }
  }
  else
  {
    vm_address_t *v5 = 0;
    _DWORD *v6 = 0;
  }

  uint64_t v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 32) uuid];
    __int16 v13 = [v12 UUIDString];
    id v14 = *(void **)(a1 + 32);
    id v15 = [v14 payloadForIdentifier:v3];
    uint64_t v16 = sub_10000F05C(v15, 32);
    int v18 = 138543875;
    uint64_t v19 = v13;
    __int16 v20 = 2113;
    id v21 = v14;
    __int16 v22 = 2113;
    id v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SIMULATOR: Got payload for item %{public}@/%{private}@.  Returning this info:%{private}@", (uint8_t *)&v18, 0x20u);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007613C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100076188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 5;
  id v8 = sub_100074ABC(a1);
  if (v8)
  {
    uint64_t v31 = a4;
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a2];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = [v8 advertiser];
    uint64_t v11 = [v10 advertisingItems];

    id v12 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v15 uuid];
          unsigned int v17 = [v9 isEqual:v16];

          if (v17)
          {
            int v18 = sub_10000BA18(0);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = [v15 uuid];
              __int16 v20 = [v19 UUIDString];
              *(_DWORD *)long long buf = 138543619;
              uint64_t v46 = v20;
              __int16 v47 = 2113;
              uint64_t v48 = v15;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "SIMULATOR: Found item ; %{public}@/%{private}@.  Calling its wasContinued.",
                buf,
                0x16u);
            }
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100076624;
            v32[3] = &unk_1000C6240;
            uint64_t v35 = v31;
            uint64_t v36 = a5;
            uint64_t v34 = &v41;
            id v21 = dispatch_semaphore_create(0);
            __int16 v33 = v21;
            [v15 wasResumedOnAnotherDeviceWithCompletionHandler:v32];
            __int16 v22 = sub_10000BA18(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              id v23 = [v15 uuid];
              dispatch_semaphore_t v24 = [v23 UUIDString];
              *(_DWORD *)long long buf = 138543362;
              uint64_t v46 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SIMULATOR: Waiting for payload fetch to complete for item %{public}@", buf, 0xCu);
            }
            dispatch_time_t v25 = dispatch_time(0, 15000000000);
            dispatch_semaphore_wait(v21, v25);
            id v26 = sub_10000BA18(0);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              uint64_t v27 = [v15 uuid];
              dispatch_time_t v28 = [v27 UUIDString];
              *(_DWORD *)long long buf = 138543362;
              uint64_t v46 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "SIMULATOR: Finished wait for payload fetch to complete for item %{public}@", buf, 0xCu);
            }
            goto LABEL_18;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  uint64_t v29 = *((unsigned int *)v42 + 6);

  _Block_object_dispose(&v41, 8);
  return v29;
}

void sub_100076558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100076624(uint64_t a1, void *a2)
{
  sub_1000752BC(a2, *(void **)(a1 + 48), *(_DWORD **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

uint64_t sub_100076674()
{
  return 5;
}

void sub_10007667C(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  sub_100076734(&v9, [v5 length], 0);
  id v6 = (void *)v9;
  id v7 = v5;
  id v8 = [v7 bytes];
  memcpy(v6, v8, __n);
  *a2 = v9;
  *a3 = __n;
  sub_100013338((uint64_t)&v9);
}

void sub_100076714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100013338((uint64_t)&a9);

  _Unwind_Resume(a1);
}

vm_address_t *sub_100076734(vm_address_t *address, unsigned int a2, char a3)
{
  *address = 0;
  *((_DWORD *)address + 2) = a2;
  *((unsigned char *)address + 12) = a3;
  if (vm_allocate(mach_task_self_, address, a2, 1))
  {
    *address = 0;
    *((_DWORD *)address + 2) = 0;
  }
  return address;
}

void sub_100076A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076BE4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

os_state_data_s *__cdecl sub_100076C1C(id a1, os_state_hints_s *a2)
{
  uint64_t v3 = +[ActivityManagerDebuggingManager actionStrs:100 maximumInternal:0 clear:3600.0];
  id v4 = [v3 componentsJoinedByString:@"\n"];
  id v5 = sub_100045B7C(v4);

  return (os_state_data_s *)v5;
}

void sub_100076C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100076D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100077058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100077394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  id v12 = v11;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100077754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100078A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100078D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078D6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!*(void *)(a1 + 40) || (v4 = [v3 type] == *(id *)(a1 + 40), id v3 = v7, v4))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 uuid];
    [v5 addObject:v6];
  }
}

void sub_100078DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100078EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100078FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100079044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000790E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100079308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007932C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) statusString];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void sub_10007938C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000793A0(uint64_t a1)
{
  uint64_t v1 = +[NSMutableString string];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = [*(id *)(a1 + 32) manager];
  id v3 = [v2 clients];

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v7 = [v6 recentEligibleItemsInOrder:99999.0];
        if (v7)
        {
          id v8 = [v6 uuid];
          vm_address_t v9 = [v8 UUIDString];
          id v10 = [v6 name];
          [v1 appendFormat:@"Client: %@ %@\n", v9, v10];

          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = v7;
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v11);
                }
                id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) statusString];
                [v1 appendFormat:@" - %@\n", v15];
              }
              id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }
        }
      }
      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10007961C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007978C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007984C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100079914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100079F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10007A0D4(void *a1)
{
  [*(id *)(a1[4] + 24) setTitle:a1[5]];
  [*(id *)(a1[4] + 24) setPayload:a1[6] identifier:UAUserActivityUserInfoPayload];
  [*(id *)(a1[4] + 24) setPayload:0 identifier:UAUserActivityStreamsPayload];
  id v2 = +[NSURL URLWithString:a1[7]];
  [*(id *)(a1[4] + 24) setWebpageURL:v2];

  id v3 = *(void **)(a1[4] + 24);

  return [v3 setPayloadAvailable:1];
}

void sub_10007A180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A190(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v2 uuid];
    LODWORD(v3) = [v3 isEqual:v4];

    if (v3)
    {
      id v5 = sub_10000BA18(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [*(id *)(*(void *)(a1 + 32) + 24) uuid];
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Removing injected fake BTLE item %@", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = a1 + 32;
      [*(id *)(v8 + 16) setDebugCornerItem:0];
      vm_address_t v9 = *(void **)(*(void *)v7 + 24);
      *(void *)(*(void *)v7 + 24) = 0;
    }
  }
}

void sub_10007A2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A5BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(a1 + 32) UUIDString];
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Finished call prepareToResumeActivityWithUUID for activityUUID %{public}@, error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10007A6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10007A9A0(uint64_t a1)
{
  id v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) UUIDString];
    int v5 = 138543362;
    int v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Finished call didResumeUserActivityWithUUID for activityUUID %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10007AA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007AB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007AC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007ACF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10007ADB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007B038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007B208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10007B484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007B534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007B5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007B65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007B880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10007BCC0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableString stringWithString:@"{"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) UUIDString];
        [v2 appendFormat:@"%@ ", v7];
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [v2 appendString:@"}"];

  return v2;
}

void sub_10007BE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10007BE6C(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) UUIDString];
        [v2 appendFormat:@"%@ ", v7];
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [v2 appendString:@""]);

  return v2;
}

void sub_10007BFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_10007C018(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t v7 = @"(nil)";
    goto LABEL_15;
  }
  [v1 timeIntervalSinceNow];
  double v4 = fabs(v3);
  if (v4 < 15.0)
  {
    uint64_t v5 = "from now";
    if (v3 <= 0.0) {
      uint64_t v5 = "ago";
    }
    uint64_t v6 = +[NSString stringWithFormat:@"%.1f seconds %s", *(void *)&v4, v5];
    goto LABEL_14;
  }
  if (v4 < 200.0)
  {
    CFStringRef v8 = @"%ld seconds %s";
LABEL_11:
    long long v9 = "from now";
    if (v3 <= 0.0) {
      long long v9 = "ago";
    }
    uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, (uint64_t)v4, v9);
    goto LABEL_14;
  }
  if (v4 < 3600.0)
  {
    CFStringRef v8 = @"%ld minutes %s";
    double v4 = v4 / 60.0;
    goto LABEL_11;
  }
  if (v4 >= 43200.0)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@", v2];
LABEL_14:
    uint64_t v7 = (__CFString *)v6;
    goto LABEL_15;
  }
  long long v11 = +[NSCalendar currentCalendar];
  long long v12 = [v11 components:96 fromDate:v2];

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"at %2.2ld:%2.2ld", [v12 hour], objc_msgSend(v12, "minute"));
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:

  return v7;
}

void sub_10007C1E0(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

__CFString *sub_10007C214(unint64_t a1)
{
  if (a1 == -1)
  {
    double v4 = @"forever";
  }
  else
  {
    dispatch_time_t v2 = dispatch_time(0, 0);
    if (v2 <= a1) {
      double v3 = sub_10007C43C(a1 - v2);
    }
    else {
      double v3 = -sub_10007C43C(v2 - a1);
    }
    uint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:v3];
    sub_10007C018(v5);
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void sub_10007C2B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10007C2C0(double a1)
{
  double v1 = fabs(a1);
  if (v1 >= 15.0)
  {
    if (v1 >= 200.0)
    {
      if (v1 >= 3600.0)
      {
        double v2 = v1 / 3600.0;
        if (v2 >= 24.0)
        {
          if (v2 >= 504.0) {
            +[NSString stringWithFormat:@"%5ld days", (uint64_t)v2 / 24, v5];
          }
          else {
            +[NSString stringWithFormat:@"%2ld days, %ld hours", (uint64_t)v2 / 24, (uint64_t)v2 % 24];
          }
        }
        else
        {
          +[NSString stringWithFormat:@"%2.3f hours", *(void *)&v2, v5];
        }
      }
      else
      {
        +[NSString stringWithFormat:@"%2ld minutes", (uint64_t)(v1 / 60.0), v5];
      }
    }
    else
    {
      +[NSString stringWithFormat:@"%ld seconds", (uint64_t)v1, v5];
    }
  }
  else
  {
    +[NSString stringWithFormat:@"%4.1f seconds", *(void *)&v1, v5];
  double v3 = };

  return v3;
}

void sub_10007C3FC(id a1)
{
  uint64_t v1 = +[NSMutableArray array];
  qword_1000E6910 = v1;

  _objc_release_x1(v1);
}

double sub_10007C43C(int64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  dispatch_time_t v3 = dispatch_time(0, 0);
  if (!a1) {
    return 0.0;
  }
  dispatch_time_t v4 = v2 - v3;
  dispatch_time_t v5 = dispatch_time(0, a1);
  double v6 = 0.0;
  do
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v8;
      dispatch_time_t v10 = dispatch_time(v7, 1000000000 * v8);
      uint64_t v8 = 2 * v9;
    }
    while (v10 < v5);
    double v6 = v6 + (double)(v9 >> 1);
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  }
  while (v5 > v11 && v5 - v11 > v4);
  return v6;
}

uint64_t sub_10007C678(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 16777472;
  int v7 = a3;
  NDR_record_t v8 = NDR_record;
  int v9 = a3;
  *(void *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100090CD0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t sub_10007C704(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 16777472;
  int v11 = a3;
  uint64_t v12 = a4;
  int v13 = 16777472;
  int v14 = a5;
  NDR_record_t v15 = NDR_record;
  int v16 = a3;
  int v17 = a5;
  uint64_t v6 = 2147483667;
  int v7 = a1;
  long long v8 = xmmword_100090CE0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 1, 0x4Cu, 0, 0, 0, 0);
}

uint64_t sub_10007C798(mach_port_t a1, int a2, void *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  memset(v26, 0, sizeof(v26));
  long long v25 = 0u;
  long long v24 = 0u;
  msg.msgh_size = 0;
  *(NDR_record_t *)long long v23 = NDR_record;
  *(_DWORD *)&v23[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x3EB00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v16 = mach_msg(&msg, 3, 0x24u, 0x64u, reply_port, 0, 0);
  uint64_t v17 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v16)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (msg.msgh_id == 1103)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996;
          if (*(_DWORD *)v23 == 2 && msg.msgh_size == 92 && !msg.msgh_remote_port && BYTE3(v24) == 1 && BYTE3(v25) == 1)
          {
            int v18 = DWORD1(v24);
            if (DWORD1(v24) == LODWORD(v26[0]))
            {
              int v19 = DWORD1(v25);
              if (DWORD1(v25) == DWORD1(v26[1]))
              {
                uint64_t v17 = 0;
                *a3 = *(void *)&v23[4];
                *a4 = v18;
                uint64_t v20 = *(void *)((char *)v26 + 12);
                *a5 = *(void *)((char *)v26 + 4);
                *a6 = v20;
                *a7 = *((void *)&v24 + 1);
                *a8 = v19;
                return v17;
              }
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v17 = 4294966996;
          if (*(_DWORD *)&v23[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v17 = 4294966996;
            }
            else {
              uint64_t v17 = *(unsigned int *)&v23[8];
            }
          }
        }
        else
        {
          uint64_t v17 = 4294966996;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v17;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v17;
}

uint64_t sub_10007C9D0(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x3EC00000000;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint64_t sub_10007CA3C(int a1, _OWORD *a2, mach_msg_timeout_t a3, void *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  memset(&msg_4[16], 0, 32);
  long long v22 = 0u;
  long long v21 = 0u;
  *(_OWORD *)msg_4 = 0u;
  *(NDR_record_t *)&msg_4[20] = NDR_record;
  *(_OWORD *)&msg_4[28] = *a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x3ED00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)&msg, 275, 0x30u, 0x54u, reply_port, a3, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  else
  {
    if (!v14)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 1105)
      {
        if (msg < 0)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&msg_4[20] == 2
            && *(_DWORD *)msg_4 == 76
            && !*(_DWORD *)&msg_4[4]
            && msg_4[35] == 1
            && BYTE3(v21) == 1)
          {
            int v16 = *(_DWORD *)&msg_4[36];
            if (*(_DWORD *)&msg_4[36] == v22)
            {
              int v17 = DWORD1(v21);
              if (DWORD1(v21) == DWORD1(v22))
              {
                uint64_t v15 = 0;
                *a4 = *(void *)&msg_4[24];
                *a5 = v16;
                *a6 = *(void *)&msg_4[40];
                *a7 = v17;
                return v15;
              }
            }
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&msg_4[28])
          {
            if (*(_DWORD *)&msg_4[4]) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = *(unsigned int *)&msg_4[28];
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v15;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  return v15;
}

uint64_t sub_10007CC58(int a1, _OWORD *a2, mach_msg_timeout_t a3, void *a4, _DWORD *a5)
{
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(NDR_record_t *)&msg_4[20] = NDR_record;
  *(_OWORD *)&msg_4[28] = *a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x3EE00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&msg, 275, 0x30u, 0x40u, reply_port, a3, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  else
  {
    if (!v10)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 1106)
      {
        if (msg < 0)
        {
          uint64_t v11 = 4294966996;
          if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
          {
            int v12 = *(_DWORD *)&msg_4[36];
            if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
            {
              uint64_t v11 = 0;
              *a4 = *(void *)&msg_4[24];
              *a5 = v12;
              return v11;
            }
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          uint64_t v11 = 4294966996;
          if (*(_DWORD *)&msg_4[28])
          {
            if (*(_DWORD *)&msg_4[4]) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = *(unsigned int *)&msg_4[28];
            }
          }
        }
        else
        {
          uint64_t v11 = 4294966996;
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  return v11;
}

uint64_t sub_10007CE38(int a1, mach_msg_timeout_t a2, void *a3, _DWORD *a4)
{
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int msg_8 = a1;
  mach_port_t msg_12 = reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x3EF00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t reply_port = msg_12;
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&msg, 275, 0x18u, 0x40u, reply_port, a2, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg_12);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 1107)
      {
        if (msg < 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
          {
            int v11 = *(_DWORD *)&msg_16[24];
            if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
            {
              uint64_t v10 = 0;
              *a3 = *(void *)&msg_16[12];
              *a4 = v11;
              return v10;
            }
          }
        }
        else if (msg_4 == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg_16[16])
          {
            if (msg_8) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg_16[16];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v10;
    }
    mig_dealloc_reply_port(msg_12);
  }
  return v10;
}

uint64_t sub_10007D000(int a1, long long *a2, int a3, uint64_t a4, int a5, uint64_t a6, _DWORD *a7, void *a8, _DWORD *a9, void *a10)
{
  memset(&msg[4], 0, 32);
  *(_DWORD *)&msg[24] = 2;
  *(_DWORD *)&unsigned char msg[28] = a3;
  int v19 = 1310720;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  NDR_record_t v23 = NDR_record;
  long long v24 = *a2;
  int v25 = a5;
  uint64_t v26 = a6;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)int msg = -2147478253;
  *(void *)&msg[16] = 0x3F000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)msg, 3, 0x5Cu, 0x54u, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v14)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1108)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&msg[24] == 2
            && *(_DWORD *)&msg[4] == 76
            && !*(_DWORD *)&msg[8]
            && HIWORD(v19) << 16 == 1114112
            && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0;
              *a7 = *(_DWORD *)&msg[28];
              *a8 = v20;
              *a9 = v16;
              *a10 = *(void *)((char *)&v24 + 4);
              return v15;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v15;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v15;
}

uint64_t (*sub_10007D21C(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 1009) >= 0xFFFFFFF7) {
    return off_1000C6378[5 * (v1 - 1000) + 5];
  }
  else {
    return 0;
  }
}

void sub_10007D250(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (unsigned int v3 = *(_DWORD *)(a1 + 40), v3 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        *(_DWORD *)(a2 + 32) = sub_100074928(*(unsigned int *)(a1 + 12), *(void *)(a1 + 28), v3);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v4 = -309;
    }
    else
    {
      int v4 = -300;
    }
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10007D330(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(unsigned char *)(a1 + 39) == 1
      && *(unsigned char *)(a1 + 55) == 1
      && (int v3 = *(_DWORD *)(a1 + 40), v3 == *(_DWORD *)(a1 + 68))
      && *(_DWORD *)(a1 + 56) == *(_DWORD *)(a1 + 72))
    {
      if (!*(_DWORD *)(a1 + 76) && *(_DWORD *)(a1 + 80) > 0x1Fu)
      {
        uint64_t v5 = *(unsigned int *)(a1 + 12);
        uint64_t v6 = *(void *)(a1 + 28);
        long long v7 = *(_OWORD *)(a1 + 112);
        v8[0] = *(_OWORD *)(a1 + 96);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_100075638(v5, (uint64_t)v8, v6, v3);
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v4 = -309;
    }
    else
    {
      int v4 = -300;
    }
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10007D444(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 68) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 16777472;
  *(_DWORD *)(a2 + 88) = 0;
  uint64_t v4 = *(unsigned int *)(result + 12);
  int v5 = *(_DWORD *)(result + 32);
  long long v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  double result = sub_100074C50(v4, (uint64_t)v7, v5, (void *)(a2 + 28), (_DWORD *)(a2 + 68), (void *)(a2 + 72), a2 + 80, (void *)(a2 + 44), (_DWORD *)(a2 + 88));
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 68);
    *(_DWORD *)(a2 + 56) = *(_DWORD *)(a2 + 88);
    *(NDR_record_t *)(a2 + 60) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 92;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10007D550(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
  }
  else
  {
    if (!result[6] && result[7] > 0x1Fu)
    {
      double result = (_DWORD *)sub_100075398(result[3]);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10007D5E4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 68) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 16777472;
  *(_DWORD *)(a2 + 72) = 0;
  uint64_t v4 = *(unsigned int *)(result + 12);
  long long v5 = *(_OWORD *)(result + 84);
  v7[0] = *(_OWORD *)(result + 68);
  v7[1] = v5;
  double result = sub_100075974(v4, result + 32, (uint64_t)v7, a2 + 28, a2 + 68, a2 + 44, a2 + 72);
  if (!result)
  {
    int v6 = *(_DWORD *)(a2 + 72);
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 68);
    *(_DWORD *)(a2 + 56) = v6;
    *(NDR_record_t *)(a2 + 60) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 76;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10007D6E0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v4 = *(unsigned int *)(result + 12);
  long long v5 = *(_OWORD *)(result + 84);
  v6[0] = *(_OWORD *)(result + 68);
  v6[1] = v5;
  double result = sub_100076188(v4, result + 32, (uint64_t)v6, a2 + 28, a2 + 52);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10007D7C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  double result = (_DWORD *)sub_100076674();
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10007D8A8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 92)
  {
    int v4 = -304;
    goto LABEL_11;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(unsigned char *)(a1 + 51) != 1
    || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a1 + 80))
  {
    int v4 = -300;
    goto LABEL_11;
  }
  if (*(_DWORD *)(a1 + 92) || *(_DWORD *)(a1 + 96) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 64) = 0;
  *(void *)(a2 + 32) = 0x14000000000000;
  *(_DWORD *)(a2 + 48) = 16777472;
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  uint64_t v6 = *(unsigned int *)(a1 + 28);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 52);
  uint64_t v9 = *(void *)(a1 + 84);
  long long v10 = *(_OWORD *)(a1 + 128);
  v12[0] = *(_OWORD *)(a1 + 112);
  v12[1] = v10;
  int v11 = sub_100043694(v5, a1 + 64, v6, v7, v8, v9, v12, (mach_port_name_t *)(a2 + 28), (vm_address_t *)(a2 + 40), (_DWORD *)(a2 + 64), (void *)(a2 + 68));
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (!v11)
  {
    *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 64);
    *(NDR_record_t *)(a2 + 56) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 76;
    *(_DWORD *)(a2 + 24) = 2;
    return;
  }
  *(_DWORD *)(a2 + 32) = v11;
LABEL_12:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10007DA1C(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 1009) >= 0xFFFFFFF7
    && (uint64_t v5 = (void (*)(void))off_1000C6378[5 * (v4 - 1000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_10007DAA8()
{
}

void sub_10007DAD4()
{
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BRGetCloudEnabledStatus()
{
  return _BRGetCloudEnabledStatus();
}

uint64_t BRHandoffDidReceiveApplicationContinuity()
{
  return _BRHandoffDidReceiveApplicationContinuity();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return _BTLocalDeviceGetModulePower();
}

uint64_t BTLocalDeviceMaskCallbacks()
{
  return _BTLocalDeviceMaskCallbacks();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return _BTLocalDeviceRemoveCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  return _BZ2_bzCompress(strm, action);
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  return _BZ2_bzCompressEnd(strm);
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  return _BZ2_bzCompressInit(strm, blockSize100k, verbosity, workFactor);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return _BZ2_bzDecompress(strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return _BZ2_bzDecompressEnd(strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return _BZ2_bzDecompressInit(strm, verbosity, small);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return _CFReadStreamSetClient(stream, streamEvents, clientCB, clientContext);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return _CFURLCreateWithBytes(allocator, URLBytes, length, encoding, baseURL);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPMCopyUserActivityLevelDescription()
{
  return _IOPMCopyUserActivityLevelDescription();
}

uint64_t IOPMScheduleUserActivityLevelNotificationWithTimeout()
{
  return _IOPMScheduleUserActivityLevelNotificationWithTimeout();
}

uint64_t IOPMSetUserActivityIdleTimeout()
{
  return _IOPMSetUserActivityIdleTimeout();
}

uint64_t IOPMUnregisterNotification()
{
  return _IOPMUnregisterNotification();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return _MRMediaRemoteGetActiveOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return _MRMediaRemoteGetNowPlayingClientForOrigin();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return _MRNowPlayingClientGetBundleIdentifier();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t ParallelArchiveExtract()
{
  return _ParallelArchiveExtract();
}

uint64_t ParallelArchiveWriteDirContents()
{
  return _ParallelArchiveWriteDirContents();
}

uint64_t ParallelArchiveWriterCreate()
{
  return _ParallelArchiveWriterCreate();
}

uint64_t ParallelArchiveWriterDestroy()
{
  return _ParallelArchiveWriterDestroy();
}

uint64_t SBSDisplayLayoutRoleIsDefined()
{
  return _SBSDisplayLayoutRoleIsDefined();
}

uint64_t SBSEventObserverStopObservingAllEvents()
{
  return _SBSEventObserverStopObservingAllEvents();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t UAResumableActivitiesManagerServiceName()
{
  return _UAResumableActivitiesManagerServiceName();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSAdvertisementBytesKind()
{
  return __LSAdvertisementBytesKind();
}

uint64_t _LSCompareHashedBytesFromAdvertisingStrings()
{
  return __LSCompareHashedBytesFromAdvertisingStrings();
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return __LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
}

uint64_t _LSCopyUserActivityDomainNamesForBundleID()
{
  return __LSCopyUserActivityDomainNamesForBundleID();
}

uint64_t _LSCreateDatabaseLookupStringFromHashedBytesForAdvertising()
{
  return __LSCreateDatabaseLookupStringFromHashedBytesForAdvertising();
}

uint64_t _LSCreateHashedBytesForAdvertisingFromString()
{
  return __LSCreateHashedBytesForAdvertisingFromString();
}

uint64_t _LSGetResumableActivitiesAdministrativeProtocolInterface()
{
  return __LSGetResumableActivitiesAdministrativeProtocolInterface();
}

uint64_t _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface()
{
  return __LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface();
}

uint64_t _UACopyPackedDataForObject()
{
  return __UACopyPackedDataForObject();
}

uint64_t _UACopyUnpackedObjectFromData()
{
  return __UACopyUnpackedObjectFromData();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

uint64_t bootstrap_look_up2()
{
  return _bootstrap_look_up2();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

gid_t getgid(void)
{
  return _getgid();
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

pid_t getpid(void)
{
  return _getpid();
}

int getrusage(int a1, rusage *a2)
{
  return _getrusage(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return _notify_resume(token);
}

uint32_t notify_suspend(int token)
{
  return _notify_suspend(token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_trace_get_mode()
{
  return _os_trace_get_mode();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

int uname(utsname *a1)
{
  return _uname(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__UABundle(void *a1, const char *a2, ...)
{
  return [a1 _UABundle];
}

id objc_msgSend__publish(void *a1, const char *a2, ...)
{
  return [a1 _publish];
}

id objc_msgSend__refreshPairedSFPeerDevices(void *a1, const char *a2, ...)
{
  return [a1 _refreshPairedSFPeerDevices];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend__unpublish(void *a1, const char *a2, ...)
{
  return [a1 _unpublish];
}

id objc_msgSend__updatePairedDeviceCapabilities(void *a1, const char *a2, ...)
{
  return [a1 _updatePairedDeviceCapabilities];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return [a1 active];
}

id objc_msgSend_activeAdvertiseableItemsUUIDs(void *a1, const char *a2, ...)
{
  return [a1 activeAdvertiseableItemsUUIDs];
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return [a1 activeDevices];
}

id objc_msgSend_activitiesShouldCrossover(void *a1, const char *a2, ...)
{
  return [a1 activitiesShouldCrossover];
}

id objc_msgSend_activityAdvertisingAllowed(void *a1, const char *a2, ...)
{
  return [a1 activityAdvertisingAllowed];
}

id objc_msgSend_activityBTLESharingEnabled(void *a1, const char *a2, ...)
{
  return [a1 activityBTLESharingEnabled];
}

id objc_msgSend_activityPayloadWarningSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 activityPayloadWarningSizeInBytes];
}

id objc_msgSend_activityReceivingAllowed(void *a1, const char *a2, ...)
{
  return [a1 activityReceivingAllowed];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_activityTypes(void *a1, const char *a2, ...)
{
  return [a1 activityTypes];
}

id objc_msgSend_activityUUID(void *a1, const char *a2, ...)
{
  return [a1 activityUUID];
}

id objc_msgSend_additionalItems(void *a1, const char *a2, ...)
{
  return [a1 additionalItems];
}

id objc_msgSend_additionalUserActivityAdvertisableItems(void *a1, const char *a2, ...)
{
  return [a1 additionalUserActivityAdvertisableItems];
}

id objc_msgSend_advertisableItems(void *a1, const char *a2, ...)
{
  return [a1 advertisableItems];
}

id objc_msgSend_advertiseTypes(void *a1, const char *a2, ...)
{
  return [a1 advertiseTypes];
}

id objc_msgSend_advertiseableItems(void *a1, const char *a2, ...)
{
  return [a1 advertiseableItems];
}

id objc_msgSend_advertisedItem(void *a1, const char *a2, ...)
{
  return [a1 advertisedItem];
}

id objc_msgSend_advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities(void *a1, const char *a2, ...)
{
  return [a1 advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities];
}

id objc_msgSend_advertisementKind(void *a1, const char *a2, ...)
{
  return [a1 advertisementKind];
}

id objc_msgSend_advertisementPayload(void *a1, const char *a2, ...)
{
  return [a1 advertisementPayload];
}

id objc_msgSend_advertisementTimes(void *a1, const char *a2, ...)
{
  return [a1 advertisementTimes];
}

id objc_msgSend_advertisementVersion(void *a1, const char *a2, ...)
{
  return [a1 advertisementVersion];
}

id objc_msgSend_advertiser(void *a1, const char *a2, ...)
{
  return [a1 advertiser];
}

id objc_msgSend_advertisers(void *a1, const char *a2, ...)
{
  return [a1 advertisers];
}

id objc_msgSend_advertising(void *a1, const char *a2, ...)
{
  return [a1 advertising];
}

id objc_msgSend_advertisingItems(void *a1, const char *a2, ...)
{
  return [a1 advertisingItems];
}

id objc_msgSend_advertisingSuspended(void *a1, const char *a2, ...)
{
  return [a1 advertisingSuspended];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowedToAccessAnyItem(void *a1, const char *a2, ...)
{
  return [a1 allowedToAccessAnyItem];
}

id objc_msgSend_allowedToGetCurrentActivityInfo(void *a1, const char *a2, ...)
{
  return [a1 allowedToGetCurrentActivityInfo];
}

id objc_msgSend_allowedToMatchUserActivities(void *a1, const char *a2, ...)
{
  return [a1 allowedToMatchUserActivities];
}

id objc_msgSend_allowedToUseEligibleEvenWhenInBackground(void *a1, const char *a2, ...)
{
  return [a1 allowedToUseEligibleEvenWhenInBackground];
}

id objc_msgSend_allowedToUseLSAlwaysEligible(void *a1, const char *a2, ...)
{
  return [a1 allowedToUseLSAlwaysEligible];
}

id objc_msgSend_allowedToUseLSAlwaysPick(void *a1, const char *a2, ...)
{
  return [a1 allowedToUseLSAlwaysPick];
}

id objc_msgSend_allowedToUseUAAlwaysAdvertise(void *a1, const char *a2, ...)
{
  return [a1 allowedToUseUAAlwaysAdvertise];
}

id objc_msgSend_alwaysEligible(void *a1, const char *a2, ...)
{
  return [a1 alwaysEligible];
}

id objc_msgSend_alwaysPick(void *a1, const char *a2, ...)
{
  return [a1 alwaysPick];
}

id objc_msgSend_alwaysPickValue(void *a1, const char *a2, ...)
{
  return [a1 alwaysPickValue];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 appStateMonitor];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_archivePackagers(void *a1, const char *a2, ...)
{
  return [a1 archivePackagers];
}

id objc_msgSend_archiveQueue(void *a1, const char *a2, ...)
{
  return [a1 archiveQueue];
}

id objc_msgSend_archiveReadHandle(void *a1, const char *a2, ...)
{
  return [a1 archiveReadHandle];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asid(void *a1, const char *a2, ...)
{
  return [a1 asid];
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return [a1 assertion];
}

id objc_msgSend_assertionForRead(void *a1, const char *a2, ...)
{
  return [a1 assertionForRead];
}

id objc_msgSend_assertionForWrite(void *a1, const char *a2, ...)
{
  return [a1 assertionForWrite];
}

id objc_msgSend_attachToBluetoothSession(void *a1, const char *a2, ...)
{
  return [a1 attachToBluetoothSession];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_auditTokenValue(void *a1, const char *a2, ...)
{
  return [a1 auditTokenValue];
}

id objc_msgSend_auxlistener(void *a1, const char *a2, ...)
{
  return [a1 auxlistener];
}

id objc_msgSend_backlightLevelToken(void *a1, const char *a2, ...)
{
  return [a1 backlightLevelToken];
}

id objc_msgSend_backupTimer(void *a1, const char *a2, ...)
{
  return [a1 backupTimer];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_beginTimeForNonActiveAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 beginTimeForNonActiveAdvertisement];
}

id objc_msgSend_bestAppSuggestionSupressionIntervalForUnchangingItem(void *a1, const char *a2, ...)
{
  return [a1 bestAppSuggestionSupressionIntervalForUnchangingItem];
}

id objc_msgSend_bestAppsListener(void *a1, const char *a2, ...)
{
  return [a1 bestAppsListener];
}

id objc_msgSend_bestCornerItem(void *a1, const char *a2, ...)
{
  return [a1 bestCornerItem];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_bluetoothStatus(void *a1, const char *a2, ...)
{
  return [a1 bluetoothStatus];
}

id objc_msgSend_bluetoothStatusCallbackIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bluetoothStatusCallbackIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootstrapName(void *a1, const char *a2, ...)
{
  return [a1 bootstrapName];
}

id objc_msgSend_browserLookup(void *a1, const char *a2, ...)
{
  return [a1 browserLookup];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleRecord(void *a1, const char *a2, ...)
{
  return [a1 bundleRecord];
}

id objc_msgSend_byteIndex(void *a1, const char *a2, ...)
{
  return [a1 byteIndex];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesRead(void *a1, const char *a2, ...)
{
  return [a1 bytesRead];
}

id objc_msgSend_bytesReceived(void *a1, const char *a2, ...)
{
  return [a1 bytesReceived];
}

id objc_msgSend_calculateTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 calculateTimeRemaining];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllLocks(void *a1, const char *a2, ...)
{
  return [a1 cancelAllLocks];
}

id objc_msgSend_cancelReceive(void *a1, const char *a2, ...)
{
  return [a1 cancelReceive];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_carPlayDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 carPlayDisplayLayoutMonitor];
}

id objc_msgSend_carPlayScreenBundleIdentifiersInOrder(void *a1, const char *a2, ...)
{
  return [a1 carPlayScreenBundleIdentifiersInOrder];
}

id objc_msgSend_changeAdvertisementThreadSpinCount(void *a1, const char *a2, ...)
{
  return [a1 changeAdvertisementThreadSpinCount];
}

id objc_msgSend_checkShouldFetch(void *a1, const char *a2, ...)
{
  return [a1 checkShouldFetch];
}

id objc_msgSend_cleanupArchiveDir(void *a1, const char *a2, ...)
{
  return [a1 cleanupArchiveDir];
}

id objc_msgSend_cleanupCloneDir(void *a1, const char *a2, ...)
{
  return [a1 cleanupCloneDir];
}

id objc_msgSend_cleanupItemsDir(void *a1, const char *a2, ...)
{
  return [a1 cleanupItemsDir];
}

id objc_msgSend_clearLocalPasteboardInformation(void *a1, const char *a2, ...)
{
  return [a1 clearLocalPasteboardInformation];
}

id objc_msgSend_clearPayload(void *a1, const char *a2, ...)
{
  return [a1 clearPayload];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return [a1 clientConnection];
}

id objc_msgSend_clientIsSandboxed(void *a1, const char *a2, ...)
{
  return [a1 clientIsSandboxed];
}

id objc_msgSend_clientNotificationConnection(void *a1, const char *a2, ...)
{
  return [a1 clientNotificationConnection];
}

id objc_msgSend_clientWriteSize(void *a1, const char *a2, ...)
{
  return [a1 clientWriteSize];
}

id objc_msgSend_clientWriteSpeed(void *a1, const char *a2, ...)
{
  return [a1 clientWriteSpeed];
}

id objc_msgSend_clientWriteTime(void *a1, const char *a2, ...)
{
  return [a1 clientWriteTime];
}

id objc_msgSend_clientq(void *a1, const char *a2, ...)
{
  return [a1 clientq];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_clipboardSharingEnabled(void *a1, const char *a2, ...)
{
  return [a1 clipboardSharingEnabled];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_coders(void *a1, const char *a2, ...)
{
  return [a1 coders];
}

id objc_msgSend_commandPort(void *a1, const char *a2, ...)
{
  return [a1 commandPort];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_configurationForCarDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForCarDisplayMonitor];
}

id objc_msgSend_configurationForContinuityDisplay(void *a1, const char *a2, ...)
{
  return [a1 configurationForContinuityDisplay];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_containsPasteboard(void *a1, const char *a2, ...)
{
  return [a1 containsPasteboard];
}

id objc_msgSend_controlConnections(void *a1, const char *a2, ...)
{
  return [a1 controlConnections];
}

id objc_msgSend_controlListener(void *a1, const char *a2, ...)
{
  return [a1 controlListener];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires];
}

id objc_msgSend_cornerActionItemDefaults(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItemDefaults];
}

id objc_msgSend_cornerActionItemMaximumTimeForBTLEItemToLive(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItemMaximumTimeForBTLEItemToLive];
}

id objc_msgSend_cornerActionItemSupressionInterval(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItemSupressionInterval];
}

id objc_msgSend_cornerActionItemTimeout(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItemTimeout];
}

id objc_msgSend_cornerActionItems(void *a1, const char *a2, ...)
{
  return [a1 cornerActionItems];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFileForLocalPasteboardBlob(void *a1, const char *a2, ...)
{
  return [a1 createFileForLocalPasteboardBlob];
}

id objc_msgSend_createFileForRemotePasteboardBlob(void *a1, const char *a2, ...)
{
  return [a1 createFileForRemotePasteboardBlob];
}

id objc_msgSend_createSharedDataDirectory(void *a1, const char *a2, ...)
{
  return [a1 createSharedDataDirectory];
}

id objc_msgSend_creator(void *a1, const char *a2, ...)
{
  return [a1 creator];
}

id objc_msgSend_currentAdvertisableActivity(void *a1, const char *a2, ...)
{
  return [a1 currentAdvertisableActivity];
}

id objc_msgSend_currentAdvertisedBytes(void *a1, const char *a2, ...)
{
  return [a1 currentAdvertisedBytes];
}

id objc_msgSend_currentAdvertisedItem(void *a1, const char *a2, ...)
{
  return [a1 currentAdvertisedItem];
}

id objc_msgSend_currentAdvertisedItemOtherAdvertisedItems(void *a1, const char *a2, ...)
{
  return [a1 currentAdvertisedItemOtherAdvertisedItems];
}

id objc_msgSend_currentAdvertisementPayload(void *a1, const char *a2, ...)
{
  return [a1 currentAdvertisementPayload];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentLocalBlobPath(void *a1, const char *a2, ...)
{
  return [a1 currentLocalBlobPath];
}

id objc_msgSend_currentLocalGeneration(void *a1, const char *a2, ...)
{
  return [a1 currentLocalGeneration];
}

id objc_msgSend_currentLocalPasteboard(void *a1, const char *a2, ...)
{
  return [a1 currentLocalPasteboard];
}

id objc_msgSend_currentLocalPasteboardSize(void *a1, const char *a2, ...)
{
  return [a1 currentLocalPasteboardSize];
}

id objc_msgSend_currentLocalTypes(void *a1, const char *a2, ...)
{
  return [a1 currentLocalTypes];
}

id objc_msgSend_currentPasteboardActivityInfo(void *a1, const char *a2, ...)
{
  return [a1 currentPasteboardActivityInfo];
}

id objc_msgSend_currentPerfTime(void *a1, const char *a2, ...)
{
  return [a1 currentPerfTime];
}

id objc_msgSend_currentProgress(void *a1, const char *a2, ...)
{
  return [a1 currentProgress];
}

id objc_msgSend_currentRemoteBlobPath(void *a1, const char *a2, ...)
{
  return [a1 currentRemoteBlobPath];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSendData(void *a1, const char *a2, ...)
{
  return [a1 currentSendData];
}

id objc_msgSend_currentUntil(void *a1, const char *a2, ...)
{
  return [a1 currentUntil];
}

id objc_msgSend_currentUntilDate(void *a1, const char *a2, ...)
{
  return [a1 currentUntilDate];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataFile(void *a1, const char *a2, ...)
{
  return [a1 dataFile];
}

id objc_msgSend_dataForMoreAppSuggestions(void *a1, const char *a2, ...)
{
  return [a1 dataForMoreAppSuggestions];
}

id objc_msgSend_dataRequester(void *a1, const char *a2, ...)
{
  return [a1 dataRequester];
}

id objc_msgSend_dataSent(void *a1, const char *a2, ...)
{
  return [a1 dataSent];
}

id objc_msgSend_dataSize(void *a1, const char *a2, ...)
{
  return [a1 dataSize];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugAdditionalPayloadReceiveTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 debugAdditionalPayloadReceiveTimeInterval];
}

id objc_msgSend_debugCornerItem(void *a1, const char *a2, ...)
{
  return [a1 debugCornerItem];
}

id objc_msgSend_debugCrossoverAllActivities(void *a1, const char *a2, ...)
{
  return [a1 debugCrossoverAllActivities];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugEnablePinging(void *a1, const char *a2, ...)
{
  return [a1 debugEnablePinging];
}

id objc_msgSend_debugEnablePrefetch(void *a1, const char *a2, ...)
{
  return [a1 debugEnablePrefetch];
}

id objc_msgSend_debugForceNewPayloadEncoder(void *a1, const char *a2, ...)
{
  return [a1 debugForceNewPayloadEncoder];
}

id objc_msgSend_debugForceOldPayloadEncoder(void *a1, const char *a2, ...)
{
  return [a1 debugForceOldPayloadEncoder];
}

id objc_msgSend_debugManager(void *a1, const char *a2, ...)
{
  return [a1 debugManager];
}

id objc_msgSend_debugType(void *a1, const char *a2, ...)
{
  return [a1 debugType];
}

id objc_msgSend_debugValidateSampleResponseMaximumActivityPayloadSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 debugValidateSampleResponseMaximumActivityPayloadSizeInBytes];
}

id objc_msgSend_debugValidateSampleResponseMinimumActivityPayloadSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes];
}

id objc_msgSend_debuggingInfo(void *a1, const char *a2, ...)
{
  return [a1 debuggingInfo];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deliverNextPacket(void *a1, const char *a2, ...)
{
  return [a1 deliverNextPacket];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destURL(void *a1, const char *a2, ...)
{
  return [a1 destURL];
}

id objc_msgSend_detachFromBluetoothSession(void *a1, const char *a2, ...)
{
  return [a1 detachFromBluetoothSession];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return [a1 deviceColor];
}

id objc_msgSend_deviceLockDelayBeforeRemovingHandoffAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 deviceLockDelayBeforeRemovingHandoffAdvertisement];
}

id objc_msgSend_deviceLockDelayBeforeRemovingPasteboardAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 deviceLockDelayBeforeRemovingPasteboardAdvertisement];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_deviceUILocked(void *a1, const char *a2, ...)
{
  return [a1 deviceUILocked];
}

id objc_msgSend_deviceUILockedPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 deviceUILockedPowerAssertion];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dirtyUUIDs(void *a1, const char *a2, ...)
{
  return [a1 dirtyUUIDs];
}

id objc_msgSend_disableAdminEntitlmentChecking(void *a1, const char *a2, ...)
{
  return [a1 disableAdminEntitlmentChecking];
}

id objc_msgSend_disableEntitlementsCheck(void *a1, const char *a2, ...)
{
  return [a1 disableEntitlementsCheck];
}

id objc_msgSend_dispatchQ(void *a1, const char *a2, ...)
{
  return [a1 dispatchQ];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dontHideUIBefore(void *a1, const char *a2, ...)
{
  return [a1 dontHideUIBefore];
}

id objc_msgSend_dontPrefetchBefore(void *a1, const char *a2, ...)
{
  return [a1 dontPrefetchBefore];
}

id objc_msgSend_dontSendActivityTitle(void *a1, const char *a2, ...)
{
  return [a1 dontSendActivityTitle];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dynamicActivityType(void *a1, const char *a2, ...)
{
  return [a1 dynamicActivityType];
}

id objc_msgSend_dynamicUserActivitiesString(void *a1, const char *a2, ...)
{
  return [a1 dynamicUserActivitiesString];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_egid(void *a1, const char *a2, ...)
{
  return [a1 egid];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_eligibleAdvertiseableItemsInOrder(void *a1, const char *a2, ...)
{
  return [a1 eligibleAdvertiseableItemsInOrder];
}

id objc_msgSend_eligibleForHandoff(void *a1, const char *a2, ...)
{
  return [a1 eligibleForHandoff];
}

id objc_msgSend_eligibleForPublicIndexing(void *a1, const char *a2, ...)
{
  return [a1 eligibleForPublicIndexing];
}

id objc_msgSend_eligibleForSearch(void *a1, const char *a2, ...)
{
  return [a1 eligibleForSearch];
}

id objc_msgSend_eligibleInBackground(void *a1, const char *a2, ...)
{
  return [a1 eligibleInBackground];
}

id objc_msgSend_eligibleToAdvertise(void *a1, const char *a2, ...)
{
  return [a1 eligibleToAdvertise];
}

id objc_msgSend_eligibleToAlwaysAdvertise(void *a1, const char *a2, ...)
{
  return [a1 eligibleToAlwaysAdvertise];
}

id objc_msgSend_enableAutomaticRendevousPairing(void *a1, const char *a2, ...)
{
  return [a1 enableAutomaticRendevousPairing];
}

id objc_msgSend_enableNetworkControlListener(void *a1, const char *a2, ...)
{
  return [a1 enableNetworkControlListener];
}

id objc_msgSend_enableSharingFramework(void *a1, const char *a2, ...)
{
  return [a1 enableSharingFramework];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_enclosureColor(void *a1, const char *a2, ...)
{
  return [a1 enclosureColor];
}

id objc_msgSend_encodeAsData(void *a1, const char *a2, ...)
{
  return [a1 encodeAsData];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encodedUserInfoError(void *a1, const char *a2, ...)
{
  return [a1 encodedUserInfoError];
}

id objc_msgSend_epochStart(void *a1, const char *a2, ...)
{
  return [a1 epochStart];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return [a1 euid];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_eventPayload(void *a1, const char *a2, ...)
{
  return [a1 eventPayload];
}

id objc_msgSend_executingGroup(void *a1, const char *a2, ...)
{
  return [a1 executingGroup];
}

id objc_msgSend_expectedLength(void *a1, const char *a2, ...)
{
  return [a1 expectedLength];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_extraData(void *a1, const char *a2, ...)
{
  return [a1 extraData];
}

id objc_msgSend_extraDataType(void *a1, const char *a2, ...)
{
  return [a1 extraDataType];
}

id objc_msgSend_fetchMoreAppSuggestions(void *a1, const char *a2, ...)
{
  return [a1 fetchMoreAppSuggestions];
}

id objc_msgSend_fetchProgress(void *a1, const char *a2, ...)
{
  return [a1 fetchProgress];
}

id objc_msgSend_fetchQ(void *a1, const char *a2, ...)
{
  return [a1 fetchQ];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return [a1 file];
}

id objc_msgSend_filePackager(void *a1, const char *a2, ...)
{
  return [a1 filePackager];
}

id objc_msgSend_fileRecvHandler(void *a1, const char *a2, ...)
{
  return [a1 fileRecvHandler];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLForCloneItems(void *a1, const char *a2, ...)
{
  return [a1 fileURLForCloneItems];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstTime(void *a1, const char *a2, ...)
{
  return [a1 firstTime];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_frontBundleID(void *a1, const char *a2, ...)
{
  return [a1 frontBundleID];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return [a1 generation];
}

id objc_msgSend_handleBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 handleBytesAvailable];
}

id objc_msgSend_handleMessageRead(void *a1, const char *a2, ...)
{
  return [a1 handleMessageRead];
}

id objc_msgSend_handleOpenCompleted(void *a1, const char *a2, ...)
{
  return [a1 handleOpenCompleted];
}

id objc_msgSend_handleSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 handleSpaceAvailable];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return [a1 handlers];
}

id objc_msgSend_handoffPayloadRequestTimout(void *a1, const char *a2, ...)
{
  return [a1 handoffPayloadRequestTimout];
}

id objc_msgSend_hardSupressUntil(void *a1, const char *a2, ...)
{
  return [a1 hardSupressUntil];
}

id objc_msgSend_hasBeenUsedAtLeastOnce(void *a1, const char *a2, ...)
{
  return [a1 hasBeenUsedAtLeastOnce];
}

id objc_msgSend_hasFetchedLocalData(void *a1, const char *a2, ...)
{
  return [a1 hasFetchedLocalData];
}

id objc_msgSend_hasFired(void *a1, const char *a2, ...)
{
  return [a1 hasFired];
}

id objc_msgSend_hasKeyboardFocus(void *a1, const char *a2, ...)
{
  return [a1 hasKeyboardFocus];
}

id objc_msgSend_hasSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasSpaceAvailable];
}

id objc_msgSend_haveBestAppChangeNotificationClients(void *a1, const char *a2, ...)
{
  return [a1 haveBestAppChangeNotificationClients];
}

id objc_msgSend_heartBeatTrigger(void *a1, const char *a2, ...)
{
  return [a1 heartBeatTrigger];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLockScreenUntil(void *a1, const char *a2, ...)
{
  return [a1 ignoreLockScreenUntil];
}

id objc_msgSend_ignoreLostDevice(void *a1, const char *a2, ...)
{
  return [a1 ignoreLostDevice];
}

id objc_msgSend_inData(void *a1, const char *a2, ...)
{
  return [a1 inData];
}

id objc_msgSend_inMessage(void *a1, const char *a2, ...)
{
  return [a1 inMessage];
}

id objc_msgSend_inMessageLength(void *a1, const char *a2, ...)
{
  return [a1 inMessageLength];
}

id objc_msgSend_inMessageTag(void *a1, const char *a2, ...)
{
  return [a1 inMessageTag];
}

id objc_msgSend_inStream(void *a1, const char *a2, ...)
{
  return [a1 inStream];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_infoRecvHandler(void *a1, const char *a2, ...)
{
  return [a1 infoRecvHandler];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputState(void *a1, const char *a2, ...)
{
  return [a1 inputState];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionType(void *a1, const char *a2, ...)
{
  return [a1 interactionType];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_intervalToAskClientWithUnsynchronizedDocumentsToUpdate(void *a1, const char *a2, ...)
{
  return [a1 intervalToAskClientWithUnsynchronizedDocumentsToUpdate];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActivityContinuationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isActivityContinuationAllowed];
}

id objc_msgSend_isAsyncTransfer(void *a1, const char *a2, ...)
{
  return [a1 isAsyncTransfer];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isBacklightOn(void *a1, const char *a2, ...)
{
  return [a1 isBacklightOn];
}

id objc_msgSend_isBatterySaverModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBatterySaverModeEnabled];
}

id objc_msgSend_isBluetoothEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothEnabled];
}

id objc_msgSend_isBrowserFallback(void *a1, const char *a2, ...)
{
  return [a1 isBrowserFallback];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCurrent(void *a1, const char *a2, ...)
{
  return [a1 isCurrent];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return [a1 isDirty];
}

id objc_msgSend_isFileCopy(void *a1, const char *a2, ...)
{
  return [a1 isFileCopy];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isMirroringActive(void *a1, const char *a2, ...)
{
  return [a1 isMirroringActive];
}

id objc_msgSend_isPayloadAvailable(void *a1, const char *a2, ...)
{
  return [a1 isPayloadAvailable];
}

id objc_msgSend_isPayloadRequested(void *a1, const char *a2, ...)
{
  return [a1 isPayloadRequested];
}

id objc_msgSend_isSandboxed(void *a1, const char *a2, ...)
{
  return [a1 isSandboxed];
}

id objc_msgSend_isScreenWatcherPresent(void *a1, const char *a2, ...)
{
  return [a1 isScreenWatcherPresent];
}

id objc_msgSend_isSendMode(void *a1, const char *a2, ...)
{
  return [a1 isSendMode];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_isSharingModeBlockingReceiving(void *a1, const char *a2, ...)
{
  return [a1 isSharingModeBlockingReceiving];
}

id objc_msgSend_isUIVisible(void *a1, const char *a2, ...)
{
  return [a1 isUIVisible];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_itemUUID(void *a1, const char *a2, ...)
{
  return [a1 itemUUID];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_itemsBeingAdvertised(void *a1, const char *a2, ...)
{
  return [a1 itemsBeingAdvertised];
}

id objc_msgSend_itemsLockedSem(void *a1, const char *a2, ...)
{
  return [a1 itemsLockedSem];
}

id objc_msgSend_keyCounter(void *a1, const char *a2, ...)
{
  return [a1 keyCounter];
}

id objc_msgSend_lastActiveItemRemovalDelay(void *a1, const char *a2, ...)
{
  return [a1 lastActiveItemRemovalDelay];
}

id objc_msgSend_lastAdvertisedGeneration(void *a1, const char *a2, ...)
{
  return [a1 lastAdvertisedGeneration];
}

id objc_msgSend_lastAdvertisementPayload(void *a1, const char *a2, ...)
{
  return [a1 lastAdvertisementPayload];
}

id objc_msgSend_lastAdvertismentTime(void *a1, const char *a2, ...)
{
  return [a1 lastAdvertismentTime];
}

id objc_msgSend_lastFrontTime(void *a1, const char *a2, ...)
{
  return [a1 lastFrontTime];
}

id objc_msgSend_lastInterestingTime(void *a1, const char *a2, ...)
{
  return [a1 lastInterestingTime];
}

id objc_msgSend_lastItemStr(void *a1, const char *a2, ...)
{
  return [a1 lastItemStr];
}

id objc_msgSend_lastItemUUIDs(void *a1, const char *a2, ...)
{
  return [a1 lastItemUUIDs];
}

id objc_msgSend_lastItemWhens(void *a1, const char *a2, ...)
{
  return [a1 lastItemWhens];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSeenPasteboardDevice(void *a1, const char *a2, ...)
{
  return [a1 lastSeenPasteboardDevice];
}

id objc_msgSend_lastSeenPasteboardVersionBit(void *a1, const char *a2, ...)
{
  return [a1 lastSeenPasteboardVersionBit];
}

id objc_msgSend_lastTimePayloadWasRequestedForAdvertisedItem(void *a1, const char *a2, ...)
{
  return [a1 lastTimePayloadWasRequestedForAdvertisedItem];
}

id objc_msgSend_lastUUID(void *a1, const char *a2, ...)
{
  return [a1 lastUUID];
}

id objc_msgSend_lastUserActiveTime(void *a1, const char *a2, ...)
{
  return [a1 lastUserActiveTime];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_layoutUpdateScheduler(void *a1, const char *a2, ...)
{
  return [a1 layoutUpdateScheduler];
}

id objc_msgSend_leaf(void *a1, const char *a2, ...)
{
  return [a1 leaf];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_listeningService(void *a1, const char *a2, ...)
{
  return [a1 listeningService];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_localInfo(void *a1, const char *a2, ...)
{
  return [a1 localInfo];
}

id objc_msgSend_localPBStatus(void *a1, const char *a2, ...)
{
  return [a1 localPBStatus];
}

id objc_msgSend_localPasteboardAvalibilityClearedTimeout(void *a1, const char *a2, ...)
{
  return [a1 localPasteboardAvalibilityClearedTimeout];
}

id objc_msgSend_localPasteboardAvalibilityTimeout(void *a1, const char *a2, ...)
{
  return [a1 localPasteboardAvalibilityTimeout];
}

id objc_msgSend_localPasteboardBlobForReading(void *a1, const char *a2, ...)
{
  return [a1 localPasteboardBlobForReading];
}

id objc_msgSend_localPasteboardRefection(void *a1, const char *a2, ...)
{
  return [a1 localPasteboardRefection];
}

id objc_msgSend_localReceiver(void *a1, const char *a2, ...)
{
  return [a1 localReceiver];
}

id objc_msgSend_localReflection(void *a1, const char *a2, ...)
{
  return [a1 localReflection];
}

id objc_msgSend_localSendStartTime(void *a1, const char *a2, ...)
{
  return [a1 localSendStartTime];
}

id objc_msgSend_localTimeout(void *a1, const char *a2, ...)
{
  return [a1 localTimeout];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_lockTokens(void *a1, const char *a2, ...)
{
  return [a1 lockTokens];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_logFileDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 logFileDirectoryPath];
}

id objc_msgSend_logFilePath(void *a1, const char *a2, ...)
{
  return [a1 logFilePath];
}

id objc_msgSend_logString(void *a1, const char *a2, ...)
{
  return [a1 logString];
}

id objc_msgSend_loggingAdvertiserEnabled(void *a1, const char *a2, ...)
{
  return [a1 loggingAdvertiserEnabled];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainDispatchQ(void *a1, const char *a2, ...)
{
  return [a1 mainDispatchQ];
}

id objc_msgSend_mainDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 mainDisplayLayoutMonitor];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreenBundleIdentifiersInOrder(void *a1, const char *a2, ...)
{
  return [a1 mainScreenBundleIdentifiersInOrder];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_maximumActivityPayloadSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 maximumActivityPayloadSizeInBytes];
}

id objc_msgSend_maximumAdvertisementsPerTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 maximumAdvertisementsPerTimeInterval];
}

id objc_msgSend_maximumAdvertisementsTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 maximumAdvertisementsTimeInterval];
}

id objc_msgSend_maximumTimeoutToWaitForClientProcessToUpdateActivityInformation(void *a1, const char *a2, ...)
{
  return [a1 maximumTimeoutToWaitForClientProcessToUpdateActivityInformation];
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return [a1 messageQueue];
}

id objc_msgSend_minimumIntervalBetweenAdvertisements(void *a1, const char *a2, ...)
{
  return [a1 minimumIntervalBetweenAdvertisements];
}

id objc_msgSend_minimumTimeForAnAdvertisementToLive(void *a1, const char *a2, ...)
{
  return [a1 minimumTimeForAnAdvertisementToLive];
}

id objc_msgSend_minimumTimeToLiveAfterRemovingAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 minimumTimeToLiveAfterRemovingAdvertisement];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mockAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 mockAdvertiser];
}

id objc_msgSend_mockScanner(void *a1, const char *a2, ...)
{
  return [a1 mockScanner];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_mostRecentAdvertisedBytesTime(void *a1, const char *a2, ...)
{
  return [a1 mostRecentAdvertisedBytesTime];
}

id objc_msgSend_moveAdvertisementToNonActive(void *a1, const char *a2, ...)
{
  return [a1 moveAdvertisementToNonActive];
}

id objc_msgSend_multiHandoffEnabled(void *a1, const char *a2, ...)
{
  return [a1 multiHandoffEnabled];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needToCallBlock(void *a1, const char *a2, ...)
{
  return [a1 needToCallBlock];
}

id objc_msgSend_networkConnectionHandler(void *a1, const char *a2, ...)
{
  return [a1 networkConnectionHandler];
}

id objc_msgSend_networkControlListenerPort(void *a1, const char *a2, ...)
{
  return [a1 networkControlListenerPort];
}

id objc_msgSend_nextPacketNumber(void *a1, const char *a2, ...)
{
  return [a1 nextPacketNumber];
}

id objc_msgSend_nextPacketReady(void *a1, const char *a2, ...)
{
  return [a1 nextPacketReady];
}

id objc_msgSend_nextPacketToDeliver(void *a1, const char *a2, ...)
{
  return [a1 nextPacketToDeliver];
}

id objc_msgSend_nextRunTimeString(void *a1, const char *a2, ...)
{
  return [a1 nextRunTimeString];
}

id objc_msgSend_nextScheduleBestAppDeterminationScheduler(void *a1, const char *a2, ...)
{
  return [a1 nextScheduleBestAppDeterminationScheduler];
}

id objc_msgSend_nextScheduleUpdate(void *a1, const char *a2, ...)
{
  return [a1 nextScheduleUpdate];
}

id objc_msgSend_nextTime(void *a1, const char *a2, ...)
{
  return [a1 nextTime];
}

id objc_msgSend_nextTimer(void *a1, const char *a2, ...)
{
  return [a1 nextTimer];
}

id objc_msgSend_nextUpdateAdvertisedItemsScheduler(void *a1, const char *a2, ...)
{
  return [a1 nextUpdateAdvertisedItemsScheduler];
}

id objc_msgSend_nextUserIdleDeterminationScheduler(void *a1, const char *a2, ...)
{
  return [a1 nextUserIdleDeterminationScheduler];
}

id objc_msgSend_notificationRef(void *a1, const char *a2, ...)
{
  return [a1 notificationRef];
}

id objc_msgSend_notifier(void *a1, const char *a2, ...)
{
  return [a1 notifier];
}

id objc_msgSend_notifiers(void *a1, const char *a2, ...)
{
  return [a1 notifiers];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfItems];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return [a1 objects];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_okToSuspendAdvertising(void *a1, const char *a2, ...)
{
  return [a1 okToSuspendAdvertising];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_optionBits(void *a1, const char *a2, ...)
{
  return [a1 optionBits];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_ourDevice(void *a1, const char *a2, ...)
{
  return [a1 ourDevice];
}

id objc_msgSend_outMessage(void *a1, const char *a2, ...)
{
  return [a1 outMessage];
}

id objc_msgSend_outMessageTag(void *a1, const char *a2, ...)
{
  return [a1 outMessageTag];
}

id objc_msgSend_outStream(void *a1, const char *a2, ...)
{
  return [a1 outStream];
}

id objc_msgSend_outputFile(void *a1, const char *a2, ...)
{
  return [a1 outputFile];
}

id objc_msgSend_outputMode(void *a1, const char *a2, ...)
{
  return [a1 outputMode];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_outputStreamData(void *a1, const char *a2, ...)
{
  return [a1 outputStreamData];
}

id objc_msgSend_packetData(void *a1, const char *a2, ...)
{
  return [a1 packetData];
}

id objc_msgSend_packetNumber(void *a1, const char *a2, ...)
{
  return [a1 packetNumber];
}

id objc_msgSend_packetPreLoadCount(void *a1, const char *a2, ...)
{
  return [a1 packetPreLoadCount];
}

id objc_msgSend_packetSize(void *a1, const char *a2, ...)
{
  return [a1 packetSize];
}

id objc_msgSend_pairedAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 pairedAdvertiser];
}

id objc_msgSend_pairedClientPort(void *a1, const char *a2, ...)
{
  return [a1 pairedClientPort];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairedPeer(void *a1, const char *a2, ...)
{
  return [a1 pairedPeer];
}

id objc_msgSend_pairedScanner(void *a1, const char *a2, ...)
{
  return [a1 pairedScanner];
}

id objc_msgSend_pasteAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 pasteAdvertiser];
}

id objc_msgSend_pasteFetchStartTime(void *a1, const char *a2, ...)
{
  return [a1 pasteFetchStartTime];
}

id objc_msgSend_pasteInfo(void *a1, const char *a2, ...)
{
  return [a1 pasteInfo];
}

id objc_msgSend_pasteboardAvailible(void *a1, const char *a2, ...)
{
  return [a1 pasteboardAvailible];
}

id objc_msgSend_pasteboardBitValue(void *a1, const char *a2, ...)
{
  return [a1 pasteboardBitValue];
}

id objc_msgSend_pasteboardController(void *a1, const char *a2, ...)
{
  return [a1 pasteboardController];
}

id objc_msgSend_pasteboardEmbeddedPayloadSizeLimitInBytes(void *a1, const char *a2, ...)
{
  return [a1 pasteboardEmbeddedPayloadSizeLimitInBytes];
}

id objc_msgSend_pasteboardHideUIDelay(void *a1, const char *a2, ...)
{
  return [a1 pasteboardHideUIDelay];
}

id objc_msgSend_pasteboardPasteRequestTimeout(void *a1, const char *a2, ...)
{
  return [a1 pasteboardPasteRequestTimeout];
}

id objc_msgSend_pasteboardShowUIDelay(void *a1, const char *a2, ...)
{
  return [a1 pasteboardShowUIDelay];
}

id objc_msgSend_pasteboardStreamWatchdogTimeout(void *a1, const char *a2, ...)
{
  return [a1 pasteboardStreamWatchdogTimeout];
}

id objc_msgSend_pasteboardTypeRequestTimeout(void *a1, const char *a2, ...)
{
  return [a1 pasteboardTypeRequestTimeout];
}

id objc_msgSend_pasteboardTypes(void *a1, const char *a2, ...)
{
  return [a1 pasteboardTypes];
}

id objc_msgSend_pasteboardUIMinimumDurration(void *a1, const char *a2, ...)
{
  return [a1 pasteboardUIMinimumDurration];
}

id objc_msgSend_pasteboardUITimeRemainingDelay(void *a1, const char *a2, ...)
{
  return [a1 pasteboardUITimeRemainingDelay];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payloadBytes(void *a1, const char *a2, ...)
{
  return [a1 payloadBytes];
}

id objc_msgSend_payloadFetchResponseDelay(void *a1, const char *a2, ...)
{
  return [a1 payloadFetchResponseDelay];
}

id objc_msgSend_payloadRequested(void *a1, const char *a2, ...)
{
  return [a1 payloadRequested];
}

id objc_msgSend_payloadRequestedCompletions(void *a1, const char *a2, ...)
{
  return [a1 payloadRequestedCompletions];
}

id objc_msgSend_payloadSize(void *a1, const char *a2, ...)
{
  return [a1 payloadSize];
}

id objc_msgSend_payloadXferSpeed(void *a1, const char *a2, ...)
{
  return [a1 payloadXferSpeed];
}

id objc_msgSend_payloadXferTime(void *a1, const char *a2, ...)
{
  return [a1 payloadXferTime];
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return [a1 payloads];
}

id objc_msgSend_pbInfo(void *a1, const char *a2, ...)
{
  return [a1 pbInfo];
}

id objc_msgSend_pbinfo(void *a1, const char *a2, ...)
{
  return [a1 pbinfo];
}

id objc_msgSend_pboardBitToAdvertise(void *a1, const char *a2, ...)
{
  return [a1 pboardBitToAdvertise];
}

id objc_msgSend_pboardFetchSem(void *a1, const char *a2, ...)
{
  return [a1 pboardFetchSem];
}

id objc_msgSend_pboardInfoToSend(void *a1, const char *a2, ...)
{
  return [a1 pboardInfoToSend];
}

id objc_msgSend_pbwrapper(void *a1, const char *a2, ...)
{
  return [a1 pbwrapper];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_peerDevice(void *a1, const char *a2, ...)
{
  return [a1 peerDevice];
}

id objc_msgSend_peerForSelf(void *a1, const char *a2, ...)
{
  return [a1 peerForSelf];
}

id objc_msgSend_peerName(void *a1, const char *a2, ...)
{
  return [a1 peerName];
}

id objc_msgSend_peerUUID(void *a1, const char *a2, ...)
{
  return [a1 peerUUID];
}

id objc_msgSend_peeredDevice(void *a1, const char *a2, ...)
{
  return [a1 peeredDevice];
}

id objc_msgSend_pendingUpdateTasks(void *a1, const char *a2, ...)
{
  return [a1 pendingUpdateTasks];
}

id objc_msgSend_perfSummaryString(void *a1, const char *a2, ...)
{
  return [a1 perfSummaryString];
}

id objc_msgSend_periodicCleanup(void *a1, const char *a2, ...)
{
  return [a1 periodicCleanup];
}

id objc_msgSend_periodicUpdate(void *a1, const char *a2, ...)
{
  return [a1 periodicUpdate];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pidVersion(void *a1, const char *a2, ...)
{
  return [a1 pidVersion];
}

id objc_msgSend_pingController(void *a1, const char *a2, ...)
{
  return [a1 pingController];
}

id objc_msgSend_pinnedUserActivityInfoItem(void *a1, const char *a2, ...)
{
  return [a1 pinnedUserActivityInfoItem];
}

id objc_msgSend_poke(void *a1, const char *a2, ...)
{
  return [a1 poke];
}

id objc_msgSend_pongCount(void *a1, const char *a2, ...)
{
  return [a1 pongCount];
}

id objc_msgSend_pongItems(void *a1, const char *a2, ...)
{
  return [a1 pongItems];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_possibleItems(void *a1, const char *a2, ...)
{
  return [a1 possibleItems];
}

id objc_msgSend_poweredOn(void *a1, const char *a2, ...)
{
  return [a1 poweredOn];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preventIdleSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 preventIdleSleepAssertion];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processHeader(void *a1, const char *a2, ...)
{
  return [a1 processHeader];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processReceivedData(void *a1, const char *a2, ...)
{
  return [a1 processReceivedData];
}

id objc_msgSend_processWasRemoved(void *a1, const char *a2, ...)
{
  return [a1 processWasRemoved];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_provenance(void *a1, const char *a2, ...)
{
  return [a1 provenance];
}

id objc_msgSend_providerRequests(void *a1, const char *a2, ...)
{
  return [a1 providerRequests];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return [a1 providers];
}

id objc_msgSend_proxiedBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 proxiedBundleIdentifier];
}

id objc_msgSend_proxiedClients(void *a1, const char *a2, ...)
{
  return [a1 proxiedClients];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queuedPackets(void *a1, const char *a2, ...)
{
  return [a1 queuedPackets];
}

id objc_msgSend_readBuffer(void *a1, const char *a2, ...)
{
  return [a1 readBuffer];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued(void *a1, const char *a2, ...)
{
  return [a1 receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued];
}

id objc_msgSend_receivedData(void *a1, const char *a2, ...)
{
  return [a1 receivedData];
}

id objc_msgSend_receivedDelem(void *a1, const char *a2, ...)
{
  return [a1 receivedDelem];
}

id objc_msgSend_receivedInfo(void *a1, const char *a2, ...)
{
  return [a1 receivedInfo];
}

id objc_msgSend_receivedItems(void *a1, const char *a2, ...)
{
  return [a1 receivedItems];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return [a1 receiver];
}

id objc_msgSend_receivers(void *a1, const char *a2, ...)
{
  return [a1 receivers];
}

id objc_msgSend_receiving(void *a1, const char *a2, ...)
{
  return [a1 receiving];
}

id objc_msgSend_receivingDataFile(void *a1, const char *a2, ...)
{
  return [a1 receivingDataFile];
}

id objc_msgSend_receivingSuspended(void *a1, const char *a2, ...)
{
  return [a1 receivingSuspended];
}

id objc_msgSend_reconnectToParentSimulator(void *a1, const char *a2, ...)
{
  return [a1 reconnectToParentSimulator];
}

id objc_msgSend_recvHandler(void *a1, const char *a2, ...)
{
  return [a1 recvHandler];
}

id objc_msgSend_recvRap(void *a1, const char *a2, ...)
{
  return [a1 recvRap];
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return [a1 referrerURL];
}

id objc_msgSend_releaseAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseAssertion];
}

id objc_msgSend_remoteDeviceType(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceType];
}

id objc_msgSend_remoteGeneration(void *a1, const char *a2, ...)
{
  return [a1 remoteGeneration];
}

id objc_msgSend_remoteHasFiles(void *a1, const char *a2, ...)
{
  return [a1 remoteHasFiles];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remotePasteboardAvailableTimeout(void *a1, const char *a2, ...)
{
  return [a1 remotePasteboardAvailableTimeout];
}

id objc_msgSend_remotePasteboardBlobForReading(void *a1, const char *a2, ...)
{
  return [a1 remotePasteboardBlobForReading];
}

id objc_msgSend_remotePboardTimer(void *a1, const char *a2, ...)
{
  return [a1 remotePboardTimer];
}

id objc_msgSend_removeAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 removeAdvertisement];
}

id objc_msgSend_removeAfter(void *a1, const char *a2, ...)
{
  return [a1 removeAfter];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeIOPowerManagerUserIdleNotifications(void *a1, const char *a2, ...)
{
  return [a1 removeIOPowerManagerUserIdleNotifications];
}

id objc_msgSend_rendevousPairingType(void *a1, const char *a2, ...)
{
  return [a1 rendevousPairingType];
}

id objc_msgSend_replayManager(void *a1, const char *a2, ...)
{
  return [a1 replayManager];
}

id objc_msgSend_reportedActivityType(void *a1, const char *a2, ...)
{
  return [a1 reportedActivityType];
}

id objc_msgSend_requestedArchives(void *a1, const char *a2, ...)
{
  return [a1 requestedArchives];
}

id objc_msgSend_requiresBoosted(void *a1, const char *a2, ...)
{
  return [a1 requiresBoosted];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return [a1 resignCurrent];
}

id objc_msgSend_respQueue(void *a1, const char *a2, ...)
{
  return [a1 respQueue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeListeningForBluetooth(void *a1, const char *a2, ...)
{
  return [a1 resumeListeningForBluetooth];
}

id objc_msgSend_returnEarly(void *a1, const char *a2, ...)
{
  return [a1 returnEarly];
}

id objc_msgSend_returnInfoEarly(void *a1, const char *a2, ...)
{
  return [a1 returnInfoEarly];
}

id objc_msgSend_rgid(void *a1, const char *a2, ...)
{
  return [a1 rgid];
}

id objc_msgSend_ruid(void *a1, const char *a2, ...)
{
  return [a1 ruid];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runCount(void *a1, const char *a2, ...)
{
  return [a1 runCount];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return [a1 scanLocation];
}

id objc_msgSend_scanner(void *a1, const char *a2, ...)
{
  return [a1 scanner];
}

id objc_msgSend_scanningForTypes(void *a1, const char *a2, ...)
{
  return [a1 scanningForTypes];
}

id objc_msgSend_scheduleAdvertisementUpdate(void *a1, const char *a2, ...)
{
  return [a1 scheduleAdvertisementUpdate];
}

id objc_msgSend_scheduleBestAppDetermination(void *a1, const char *a2, ...)
{
  return [a1 scheduleBestAppDetermination];
}

id objc_msgSend_scheduleIOPowerManagerUserIdleNotifications(void *a1, const char *a2, ...)
{
  return [a1 scheduleIOPowerManagerUserIdleNotifications];
}

id objc_msgSend_scheduleUpdatingAdvertisableItems(void *a1, const char *a2, ...)
{
  return [a1 scheduleUpdatingAdvertisableItems];
}

id objc_msgSend_scheduledForSubmission(void *a1, const char *a2, ...)
{
  return [a1 scheduledForSubmission];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return [a1 scheduler];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenDimDelayBeforeRemovingAdvertisements(void *a1, const char *a2, ...)
{
  return [a1 screenDimDelayBeforeRemovingAdvertisements];
}

id objc_msgSend_screenDimDelayBeforeRemovingPasteboardAdvertisement(void *a1, const char *a2, ...)
{
  return [a1 screenDimDelayBeforeRemovingPasteboardAdvertisement];
}

id objc_msgSend_screenDimmed(void *a1, const char *a2, ...)
{
  return [a1 screenDimmed];
}

id objc_msgSend_screenDimmedPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 screenDimmedPowerAssertion];
}

id objc_msgSend_sendErrorHandler(void *a1, const char *a2, ...)
{
  return [a1 sendErrorHandler];
}

id objc_msgSend_sendEvent(void *a1, const char *a2, ...)
{
  return [a1 sendEvent];
}

id objc_msgSend_sendFileArchiveRequest(void *a1, const char *a2, ...)
{
  return [a1 sendFileArchiveRequest];
}

id objc_msgSend_sendFoundDevice(void *a1, const char *a2, ...)
{
  return [a1 sendFoundDevice];
}

id objc_msgSend_sendHeartbeat(void *a1, const char *a2, ...)
{
  return [a1 sendHeartbeat];
}

id objc_msgSend_sendPasteboardDataRequest(void *a1, const char *a2, ...)
{
  return [a1 sendPasteboardDataRequest];
}

id objc_msgSend_sendPasteboardDataResponse(void *a1, const char *a2, ...)
{
  return [a1 sendPasteboardDataResponse];
}

id objc_msgSend_sendPasteboardInfoRequest(void *a1, const char *a2, ...)
{
  return [a1 sendPasteboardInfoRequest];
}

id objc_msgSend_sendPasteboardInfoResponse(void *a1, const char *a2, ...)
{
  return [a1 sendPasteboardInfoResponse];
}

id objc_msgSend_sendRap(void *a1, const char *a2, ...)
{
  return [a1 sendRap];
}

id objc_msgSend_sendTotalSendSize(void *a1, const char *a2, ...)
{
  return [a1 sendTotalSendSize];
}

id objc_msgSend_sendingCoderVersion(void *a1, const char *a2, ...)
{
  return [a1 sendingCoderVersion];
}

id objc_msgSend_sendingDataFile(void *a1, const char *a2, ...)
{
  return [a1 sendingDataFile];
}

id objc_msgSend_sendingInfo(void *a1, const char *a2, ...)
{
  return [a1 sendingInfo];
}

id objc_msgSend_serviceEndpointData(void *a1, const char *a2, ...)
{
  return [a1 serviceEndpointData];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sfActivityAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 sfActivityAdvertiser];
}

id objc_msgSend_sfActivityAdvertisers(void *a1, const char *a2, ...)
{
  return [a1 sfActivityAdvertisers];
}

id objc_msgSend_sfActivityScanner(void *a1, const char *a2, ...)
{
  return [a1 sfActivityScanner];
}

id objc_msgSend_sfActivityScanners(void *a1, const char *a2, ...)
{
  return [a1 sfActivityScanners];
}

id objc_msgSend_sharedAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 sharedAdvertiser];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDataPath(void *a1, const char *a2, ...)
{
  return [a1 sharedDataPath];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharingAdvertiser(void *a1, const char *a2, ...)
{
  return [a1 sharingAdvertiser];
}

id objc_msgSend_sharingReceiver(void *a1, const char *a2, ...)
{
  return [a1 sharingReceiver];
}

id objc_msgSend_shouldAdvertiseAutoPullActivityList(void *a1, const char *a2, ...)
{
  return [a1 shouldAdvertiseAutoPullActivityList];
}

id objc_msgSend_shouldAdvertiseHandoff(void *a1, const char *a2, ...)
{
  return [a1 shouldAdvertiseHandoff];
}

id objc_msgSend_shouldAdvertisePasteboard(void *a1, const char *a2, ...)
{
  return [a1 shouldAdvertisePasteboard];
}

id objc_msgSend_shouldIgnoreBluetoothDisabled(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreBluetoothDisabled];
}

id objc_msgSend_shouldStop(void *a1, const char *a2, ...)
{
  return [a1 shouldStop];
}

id objc_msgSend_shouldTryWrite(void *a1, const char *a2, ...)
{
  return [a1 shouldTryWrite];
}

id objc_msgSend_showUITimer(void *a1, const char *a2, ...)
{
  return [a1 showUITimer];
}

id objc_msgSend_shutdownStream(void *a1, const char *a2, ...)
{
  return [a1 shutdownStream];
}

id objc_msgSend_simulator(void *a1, const char *a2, ...)
{
  return [a1 simulator];
}

id objc_msgSend_simulators(void *a1, const char *a2, ...)
{
  return [a1 simulators];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateAsString(void *a1, const char *a2, ...)
{
  return [a1 stateAsString];
}

id objc_msgSend_statusString(void *a1, const char *a2, ...)
{
  return [a1 statusString];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_str(void *a1, const char *a2, ...)
{
  return [a1 str];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_streamDataSize(void *a1, const char *a2, ...)
{
  return [a1 streamDataSize];
}

id objc_msgSend_streamDataXferSpeed(void *a1, const char *a2, ...)
{
  return [a1 streamDataXferSpeed];
}

id objc_msgSend_streamDataXferTime(void *a1, const char *a2, ...)
{
  return [a1 streamDataXferTime];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_streamHandler(void *a1, const char *a2, ...)
{
  return [a1 streamHandler];
}

id objc_msgSend_streamOpenDelay(void *a1, const char *a2, ...)
{
  return [a1 streamOpenDelay];
}

id objc_msgSend_streamOpenStartTime(void *a1, const char *a2, ...)
{
  return [a1 streamOpenStartTime];
}

id objc_msgSend_streamOpenTime(void *a1, const char *a2, ...)
{
  return [a1 streamOpenTime];
}

id objc_msgSend_streamProtocolVersion(void *a1, const char *a2, ...)
{
  return [a1 streamProtocolVersion];
}

id objc_msgSend_streamStartTime(void *a1, const char *a2, ...)
{
  return [a1 streamStartTime];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return [a1 streamStatus];
}

id objc_msgSend_streamXferStartTime(void *a1, const char *a2, ...)
{
  return [a1 streamXferStartTime];
}

id objc_msgSend_streamsData(void *a1, const char *a2, ...)
{
  return [a1 streamsData];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringForInteraction(void *a1, const char *a2, ...)
{
  return [a1 stringForInteraction];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_submitLocalPasteboardInfoWasCleared(void *a1, const char *a2, ...)
{
  return [a1 submitLocalPasteboardInfoWasCleared];
}

id objc_msgSend_submitRemotePasteboardBecameAvailable(void *a1, const char *a2, ...)
{
  return [a1 submitRemotePasteboardBecameAvailable];
}

id objc_msgSend_suggestedActionType(void *a1, const char *a2, ...)
{
  return [a1 suggestedActionType];
}

id objc_msgSend_supportsContinuityStreams(void *a1, const char *a2, ...)
{
  return [a1 supportsContinuityStreams];
}

id objc_msgSend_supressUntil(void *a1, const char *a2, ...)
{
  return [a1 supressUntil];
}

id objc_msgSend_supressedUntil(void *a1, const char *a2, ...)
{
  return [a1 supressedUntil];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_suspendListeningForBluetooth(void *a1, const char *a2, ...)
{
  return [a1 suspendListeningForBluetooth];
}

id objc_msgSend_suspended(void *a1, const char *a2, ...)
{
  return [a1 suspended];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeFile(void *a1, const char *a2, ...)
{
  return [a1 synchronizeFile];
}

id objc_msgSend_systemHasSuspendedAdvertisements(void *a1, const char *a2, ...)
{
  return [a1 systemHasSuspendedAdvertisements];
}

id objc_msgSend_systemPreferenceChangedToken(void *a1, const char *a2, ...)
{
  return [a1 systemPreferenceChangedToken];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_targetContentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetContentIdentifier];
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return [a1 teamID];
}

id objc_msgSend_teamIDs(void *a1, const char *a2, ...)
{
  return [a1 teamIDs];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminated(void *a1, const char *a2, ...)
{
  return [a1 terminated];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timerExpiration(void *a1, const char *a2, ...)
{
  return [a1 timerExpiration];
}

id objc_msgSend_timerSource(void *a1, const char *a2, ...)
{
  return [a1 timerSource];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_tmpArchiveWriteFiles(void *a1, const char *a2, ...)
{
  return [a1 tmpArchiveWriteFiles];
}

id objc_msgSend_totalBytesReceived(void *a1, const char *a2, ...)
{
  return [a1 totalBytesReceived];
}

id objc_msgSend_totalBytesSent(void *a1, const char *a2, ...)
{
  return [a1 totalBytesSent];
}

id objc_msgSend_totalPacketCount(void *a1, const char *a2, ...)
{
  return [a1 totalPacketCount];
}

id objc_msgSend_totalSendSize(void *a1, const char *a2, ...)
{
  return [a1 totalSendSize];
}

id objc_msgSend_totalTime(void *a1, const char *a2, ...)
{
  return [a1 totalTime];
}

id objc_msgSend_transferDuration(void *a1, const char *a2, ...)
{
  return [a1 transferDuration];
}

id objc_msgSend_transferSpeed(void *a1, const char *a2, ...)
{
  return [a1 transferSpeed];
}

id objc_msgSend_triggerAll(void *a1, const char *a2, ...)
{
  return [a1 triggerAll];
}

id objc_msgSend_triggerUserIdleDetermination(void *a1, const char *a2, ...)
{
  return [a1 triggerUserIdleDetermination];
}

id objc_msgSend_tryStop(void *a1, const char *a2, ...)
{
  return [a1 tryStop];
}

id objc_msgSend_tryWriteMessage(void *a1, const char *a2, ...)
{
  return [a1 tryWriteMessage];
}

id objc_msgSend_tryWriteRawData(void *a1, const char *a2, ...)
{
  return [a1 tryWriteRawData];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_types(void *a1, const char *a2, ...)
{
  return [a1 types];
}

id objc_msgSend_uaAdvertisableItemsInOrder(void *a1, const char *a2, ...)
{
  return [a1 uaAdvertisableItemsInOrder];
}

id objc_msgSend_uaBundle(void *a1, const char *a2, ...)
{
  return [a1 uaBundle];
}

id objc_msgSend_uiLockStatusToken(void *a1, const char *a2, ...)
{
  return [a1 uiLockStatusToken];
}

id objc_msgSend_underlyingErrorCode(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrorCode];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uniqueIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifiers];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usedStreams(void *a1, const char *a2, ...)
{
  return [a1 usedStreams];
}

id objc_msgSend_userActive(void *a1, const char *a2, ...)
{
  return [a1 userActive];
}

id objc_msgSend_userActivityClients(void *a1, const char *a2, ...)
{
  return [a1 userActivityClients];
}

id objc_msgSend_userActivityNotificationRef(void *a1, const char *a2, ...)
{
  return [a1 userActivityNotificationRef];
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}

id objc_msgSend_userIdleInterval(void *a1, const char *a2, ...)
{
  return [a1 userIdleInterval];
}

id objc_msgSend_userIdleRemovalDelay(void *a1, const char *a2, ...)
{
  return [a1 userIdleRemovalDelay];
}

id objc_msgSend_userIdleTracker(void *a1, const char *a2, ...)
{
  return [a1 userIdleTracker];
}

id objc_msgSend_userInactivePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 userInactivePowerAssertion];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInfoPayload(void *a1, const char *a2, ...)
{
  return [a1 userInfoPayload];
}

id objc_msgSend_userIsCurrent(void *a1, const char *a2, ...)
{
  return [a1 userIsCurrent];
}

id objc_msgSend_userIsCurrentIdleTracker(void *a1, const char *a2, ...)
{
  return [a1 userIsCurrentIdleTracker];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidItemMap(void *a1, const char *a2, ...)
{
  return [a1 uuidItemMap];
}

id objc_msgSend_validKey(void *a1, const char *a2, ...)
{
  return [a1 validKey];
}

id objc_msgSend_validUntil(void *a1, const char *a2, ...)
{
  return [a1 validUntil];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_waitUntilComplete(void *a1, const char *a2, ...)
{
  return [a1 waitUntilComplete];
}

id objc_msgSend_wantsBestAppChangedNotifications(void *a1, const char *a2, ...)
{
  return [a1 wantsBestAppChangedNotifications];
}

id objc_msgSend_wasContinuedInfo(void *a1, const char *a2, ...)
{
  return [a1 wasContinuedInfo];
}

id objc_msgSend_wasResumed(void *a1, const char *a2, ...)
{
  return [a1 wasResumed];
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return [a1 watchdog];
}

id objc_msgSend_weAreAdvertisingAnItem(void *a1, const char *a2, ...)
{
  return [a1 weAreAdvertisingAnItem];
}

id objc_msgSend_weAreAdvertisingAtLeastOneItem(void *a1, const char *a2, ...)
{
  return [a1 weAreAdvertisingAtLeastOneItem];
}

id objc_msgSend_webToNative(void *a1, const char *a2, ...)
{
  return [a1 webToNative];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_when(void *a1, const char *a2, ...)
{
  return [a1 when];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_writeBuffer(void *a1, const char *a2, ...)
{
  return [a1 writeBuffer];
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}

id objc_msgSend_xpclistener(void *a1, const char *a2, ...)
{
  return [a1 xpclistener];
}
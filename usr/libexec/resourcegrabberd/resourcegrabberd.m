uint64_t sub_1000051C4(void *a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  NRGPBIcon *v12;
  uint64_t result;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      v12 = objc_alloc_init(NRGPBIcon);
      [a1 addIcons:v12];
      if (!PBReaderPlaceMark() || (sub_100006268((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else
    {
      result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_1000059D8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v8 = v7 + 1;
        if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
        v6 |= (unint64_t)(v9 & 0x7F) << v4;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          uint64_t v11 = OBJC_IVAR___PBDataReader__error;
          int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      uint64_t v11 = OBJC_IVAR___PBDataReader__error;
      int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v12 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v14 = v6 >> 3;
      if ((v6 >> 3) == 3)
      {
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 <= 0xFFFFFFFFFFFFFFFBLL && v17 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v16 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + v11) = 1;
          int v16 = 0;
        }
        v19 = &OBJC_IVAR___NRGPBAppViewListImageRequest__height;
        goto LABEL_37;
      }
      if (v14 == 2) {
        break;
      }
      if (v14 == 1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 <= 0xFFFFFFFFFFFFFFFBLL && v15 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v16 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + v11) = 1;
          int v16 = 0;
        }
        v19 = &OBJC_IVAR___NRGPBAppViewListImageRequest__scale;
LABEL_37:
        *(_DWORD *)(a1 + *v19) = v16;
        goto LABEL_38;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_38:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
    if (v18 <= 0xFFFFFFFFFFFFFFFBLL && v18 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
    {
      int v16 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 4;
    }
    else
    {
      *(unsigned char *)(a2 + v11) = 1;
      int v16 = 0;
    }
    v19 = &OBJC_IVAR___NRGPBAppViewListImageRequest__width;
    goto LABEL_37;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100006268(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
        goto LABEL_30;
      case 2u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        while (2)
        {
          unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
            v17 |= (unint64_t)(v19 & 0x7F) << v15;
            if (v19 < 0)
            {
              v15 += 7;
              BOOL v9 = v16++ >= 9;
              if (v9)
              {
                LODWORD(v17) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 24) = v17;
        continue;
      case 3u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
        goto LABEL_30;
      case 4u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
LABEL_30:
        v20 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
      v23 |= (unint64_t)(v25 & 0x7F) << v21;
      if ((v25 & 0x80) == 0) {
        goto LABEL_43;
      }
      v21 += 7;
      BOOL v9 = v22++ >= 9;
      if (v9)
      {
        uint64_t v23 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v23 = 0;
    }
LABEL_45:
    *(unsigned char *)(a1 + 40) = v23 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_100006D24(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_21:
        unint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100007884(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100007AD8(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(*(void *)(a1 + 32) + 8) == -1;
  v3 = nrg_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      *(_DWORD *)buf = 138412290;
      id v11 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "starting icon version tracker for delegate %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    unint64_t v6 = (const char *)[ACXApplicationsUpdatedDarwinNotification UTF8String];
    unint64_t v7 = (int *)(*(void *)(a1 + 32) + 8);
    id v8 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007CBC;
    handler[3] = &unk_1000205B8;
    handler[4] = *(void *)(a1 + 32);
    notify_register_dispatch(v6, v7, (dispatch_queue_t)&_dispatch_main_q, handler);

    if ([*(id *)(*(void *)(a1 + 32) + 16) count]) {
      [*(id *)(a1 + 32) _appConduitUpdated];
    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "icon version tracker already running, not restarting", buf, 2u);
    }
  }
}

void sub_100007CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_100007CBC(uint64_t a1)
{
  BOOL v2 = nrg_daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = ACXApplicationsUpdatedDarwinNotification;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ received", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) _appConduitUpdated];
}

uint64_t sub_100007E34(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 8);
  if (result != -1)
  {
    uint64_t result = notify_cancel(result);
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
  }
  return result;
}

uint64_t sub_100007F34(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 32) _readActiveIconVersions];

  return _objc_release_x1();
}

uint64_t sub_100008040(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  v3 = (void *)a1[6];
  if (v3 && ([v3 isEqualToString:v2] & 1) == 0)
  {
    *(unsigned char *)(a1[4] + 28) = 1;
    [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
  }

  return _objc_release_x1();
}

unsigned char *sub_100008134(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[28])
  {
    uint64_t result = [result _writeActiveIconVersions];
    *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  }
  return result;
}

id sub_1000081D8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  id result = [*(id *)(a1 + 32) _removeActiveIconVersions];
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  return result;
}

uint64_t sub_1000083CC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001496C();
    }
    goto LABEL_4;
  }
  if ([v5 applicationType] == (id)2
    || [v5 applicationType] == (id)1)
  {
    id v8 = nrg_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000148F8();
    }

    BOOL v9 = *(void **)(a1 + 32);
    int v10 = [v5 bundleIdentifier];
    [v9 addObject:v10];

    if (![*(id *)(a1 + 40) _appVersionChanged:v5]) {
      goto LABEL_14;
    }
    id v11 = *(void **)(a1 + 48);
    uint64_t v12 = [v5 bundleIdentifier];
    [v11 addObject:v12];
  }
  else
  {
    uint64_t v12 = nrg_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ignoring non-user or system application %@", buf, 0xCu);
    }
  }

LABEL_14:
  if (v5) {
    goto LABEL_15;
  }
  id v14 = [*(id *)(a1 + 48) count];
  id WeakRetained = nrg_daemon_log();
  BOOL v16 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      uint64_t v17 = *(NSObject **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "detected out of date icons %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = [*(id *)(a1 + 48) copy];
    [WeakRetained iconVersionTracker:v18 detectedOutOfDateIcons:v19];
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "no icons need updating", buf, 2u);
  }

  unint64_t v7 = [*(id *)(a1 + 40) _noLongerTrackedBundleIDs:*(void *)(a1 + 32)];
  if ([v7 count])
  {
    v20 = nrg_daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "detected icons that should no longer be tracked %@", buf, 0xCu);
    }

    char v21 = *(void **)(a1 + 40);
    unint64_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100008744;
    v27 = &unk_100020658;
    unint64_t v7 = v7;
    uint64_t v22 = *(void *)(a1 + 40);
    v28 = v7;
    uint64_t v29 = v22;
    [v21 _withLock:&v24];
    [*(id *)(a1 + 40) commit:v24, v25, v26, v27];
    id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [v23 iconVersionTracker:*(void *)(a1 + 40) detectedUnusedIcons:v7];
  }
LABEL_4:

LABEL_15:
  return 1;
}

id sub_100008744(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000087B8;
  v3[3] = &unk_100020630;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

id sub_1000087B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:a2];
}

void sub_1000088B0(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 16) allKeys];
  [v1 addObjectsFromArray:v2];
}

void sub_100008B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008BBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008BCC(uint64_t a1)
{
}

void sub_100008BD4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100008F24(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = nrg_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014A80();
    }

    objc_end_catch();
    JUMPOUT(0x100008ED8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009134(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = nrg_daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014AE8();
    }

    objc_end_catch();
    JUMPOUT(0x10000909CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000093C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start()
{
  if (qword_1000288C8 != -1) {
    dispatch_once(&qword_1000288C8, &stru_1000206E8);
  }
  v1 = [NRGSync alloc];
  id v2 = +[NRGCompanionDaemon sharedInstance];
  uint64_t v3 = [(NRGSync *)v1 initWithDelegate:v2];

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = +[NRGCompanionDaemon sharedInstance];
  [v5 start];

  id v6 = +[NSRunLoop mainRunLoop];
  [v6 run];

  return 0;
}

void sub_1000094C4(id a1)
{
  unint64_t v24 = &off_100021518;
  uint64_t v25 = &stru_100020708;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v2 = (void *)qword_1000288B8;
  qword_1000288B8 = v1;

  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)qword_1000288C0;
  qword_1000288C0 = v3;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)qword_1000288B8;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [(id)qword_1000288B8 objectForKeyedSubscript:v10, v17];
        id v12 = [v10 intValue];
        id v13 = v11;
        id v14 = nrg_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          char v15 = +[NSNumber numberWithInt:v12];
          *(_DWORD *)buf = v17;
          v27 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setting up signal handler for %@", buf, 0xCu);
        }
        signal((int)v12, (void (__cdecl *)(int))1);
        BOOL v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, (int)v12, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v16, v13);

        dispatch_resume(v16);
        [(id)qword_1000288C0 setObject:v16 forKeyedSubscript:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

void sub_100009720(id a1)
{
  uint64_t v1 = nrg_daemon_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exiting on SIGTERM", v2, 2u);
  }

  exit(0);
}

id sub_100009854(uint64_t a1, void *a2)
{
  return [a2 _progressChanged];
}

id sub_10000985C(uint64_t a1, void *a2)
{
  return [a2 _prelaunchCompleted];
}

uint64_t sub_100009CAC(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      id v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000A1BC(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = nrg_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100014D48((uint64_t)v2, v3);
  }
}

id sub_10000A720(uint64_t a1)
{
  if (qword_1000288D8 != -1) {
    dispatch_once(&qword_1000288D8, &stru_100020780);
  }
  id v2 = (void *)qword_1000288D0;
  uint64_t v3 = +[NSNumber numberWithInt:a1];
  char v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 integerValue];

  return v5;
}

void sub_10000A7B8(id a1)
{
  v3[0] = &off_100021530;
  v3[1] = &off_100021560;
  v4[0] = &off_100021548;
  v4[1] = &off_100021578;
  v3[2] = &off_100021590;
  v3[3] = &off_1000215C0;
  v4[2] = &off_1000215A8;
  v4[3] = &off_1000215D8;
  v3[4] = &off_1000215F0;
  void v3[5] = &off_100021620;
  v4[4] = &off_100021608;
  v4[5] = &off_100021638;
  v3[6] = &off_100021650;
  v3[7] = &off_100021680;
  v4[6] = &off_100021668;
  v4[7] = &off_100021698;
  v3[8] = &off_1000216B0;
  v3[9] = &off_1000216E0;
  v4[8] = &off_1000216C8;
  v4[9] = &off_1000216F8;
  v3[10] = &off_100021710;
  v3[11] = &off_100021740;
  v4[10] = &off_100021728;
  v4[11] = &off_100021758;
  v3[12] = &off_100021770;
  v3[13] = &off_1000217A0;
  v4[12] = &off_100021788;
  v4[13] = &off_1000217B8;
  v3[14] = &off_1000217D0;
  v3[15] = &off_100021800;
  v4[14] = &off_1000217E8;
  v4[15] = &off_100021818;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
  id v2 = (void *)qword_1000288D0;
  qword_1000288D0 = v1;
}

id sub_10000A974(uint64_t a1)
{
  if (qword_1000288E8 != -1) {
    dispatch_once(&qword_1000288E8, &stru_1000207A0);
  }
  id v2 = (void *)qword_1000288E0;
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:a1];
  char v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 integerValue];

  return v5;
}

void sub_10000AA0C(id a1)
{
  v3[0] = &off_100021548;
  v3[1] = &off_100021578;
  v4[0] = &off_100021530;
  v4[1] = &off_100021560;
  v3[2] = &off_1000215A8;
  v3[3] = &off_1000215D8;
  v4[2] = &off_100021590;
  v4[3] = &off_1000215C0;
  v3[4] = &off_100021608;
  void v3[5] = &off_100021638;
  v4[4] = &off_1000215F0;
  v4[5] = &off_100021620;
  v3[6] = &off_100021668;
  v3[7] = &off_100021698;
  v4[6] = &off_100021650;
  v4[7] = &off_100021680;
  v3[8] = &off_1000216C8;
  v3[9] = &off_1000216F8;
  v4[8] = &off_1000216B0;
  v4[9] = &off_1000216E0;
  v3[10] = &off_100021728;
  v3[11] = &off_100021758;
  v4[10] = &off_100021710;
  v4[11] = &off_100021740;
  v3[12] = &off_100021788;
  v3[13] = &off_1000217B8;
  v4[12] = &off_100021770;
  v4[13] = &off_1000217A0;
  v3[14] = &off_1000217E8;
  v3[15] = &off_100021818;
  v4[14] = &off_1000217D0;
  v4[15] = &off_100021800;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
  id v2 = (void *)qword_1000288E0;
  qword_1000288E0 = v1;
}

id sub_10000AE10(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerNotifyGizmoBuildChange];
}

id sub_10000AE84(uint64_t a1)
{
  uint64_t v2 = NRGGetActivePairedDevice();
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  id v5 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AF18;
  v7[3] = &unk_1000207C8;
  v7[4] = v5;
  return [v5 loadGizmoBuild:v7];
}

id sub_10000AF18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  uint64_t v4 = NRDevicePropertySystemBuildVersion;
  uint64_t v10 = NRDevicePropertySystemBuildVersion;
  id v5 = +[NSArray arrayWithObjects:&v10 count:1];
  [v3 addPropertyObserver:v2 forPropertyChanges:v5];

  if ([*(id *)(*(void *)(a1 + 32) + 56) syncRestriction])
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));
    unint64_t v6 = nrg_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not checking if we should do sync because inital sync is not done yet", v9, 2u);
    }
  }
  else
  {
    unint64_t v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Paired device exists and there are no syncRestrictions", v9, 2u);
    }

    [*(id *)(a1 + 32) device:*(void *)(*(void *)(a1 + 32) + 48) propertyDidChange:v4 fromValue:0];
    unint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 devicePaired];
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) setDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
}

void sub_10000B2E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nrg_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing %@", buf, 0xCu);
  }

  id v5 = +[NSFileManager defaultManager];
  [v5 removeItemAtPath:v3 error:0];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(NSObject **)(v6 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B420;
  block[3] = &unk_1000205E0;
  block[4] = v6;
  dispatch_async(v7, block);
}

id sub_10000B420(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncIcons:0];
}

void sub_10000B4B8(uint64_t a1, void *a2)
{
  id v3 = [a2 stringByAppendingPathComponent:@"com.apple.private.nanoresourcegrabber"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000B58C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  id v5 = [v3 stringByAppendingPathComponent:@"gizmoBuild.plist"];

  uint64_t v6 = [*(id *)(a1 + 32) gizmoBuild];
  unint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:0 error:0];

  if (v7)
  {
    id v12 = 0;
    [v7 writeToFile:v5 options:268435457 error:&v12];
    id v8 = v12;
    uint64_t v9 = nrg_framework_log();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100014EEC();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) gizmoBuild];
      *(_DWORD *)buf = 138412802;
      id v14 = v11;
      __int16 v15 = 2112;
      BOOL v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "saveGizmoBuild: wrote %@ %@ to %@", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v7 = nrg_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014EA8(v7);
    }
  }
}

void sub_10000B820(uint64_t a1, void *a2)
{
  id v3 = [a2 stringByAppendingPathComponent:@"gizmoBuild.plist"];
  uint64_t v4 = +[NSData dataWithContentsOfFile:v3];
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  [*(id *)(a1 + 32) setGizmoBuild:v5];

  uint64_t v6 = nrg_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [*(id *)(a1 + 32) gizmoBuild];
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "loadGizmoBuild: gizmoBuild = %@ %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) gizmoBuild];
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v9 != 0);
  }
}

void sub_10000B9A0(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = nrg_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014F54();
    }

    [*(id *)(v2 + 32) setGizmoBuild:0];
    objc_end_catch();
    JUMPOUT(0x10000B934);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000BDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BE1C(uint64_t a1)
{
}

void sub_10000BE24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v6 = v5;

  unint64_t v7 = nrg_daemon_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = +[NSNumber numberWithDouble:v6];
    int v15 = 138543618;
    BOOL v16 = v8;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sync completed in %{public}@ seconds, error = %{public}@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  __int16 v12 = [WeakRetained pairedDevice];
  id v13 = [v12 valueForProperty:NRDevicePropertySystemBuildVersion];
  [WeakRetained setGizmoBuild:v13];

  [WeakRetained saveGizmoBuild];
  id v14 = [WeakRetained delegate];
  [v14 devicePaired];
}

void sub_10000C224(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nrg_daemon_log();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014FBC();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "full sync request sent", v6, 2u);
    }

    [*(id *)(a1 + 32) syncDidCompleteSending];
  }
}

void sub_10000C2D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nrg_daemon_log();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100015024();
    }

    [*(id *)(a1 + 32) syncDidFailWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "full sync operation completed successfully", v7, 2u);
    }

    [*(id *)(a1 + 32) syncDidComplete];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t sub_10000C600(uint64_t a1)
{
  qword_1000288F0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000C8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_10000C924(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleResourceResponse:v3];
}

void sub_10000C980(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleFullSyncResponse:v3];
}

void sub_10000C9DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = nrg_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "appViewListImageResponseHandler received protobuf %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [NRGPBAppViewListImageResponse alloc];
  unint64_t v7 = [v3 data];
  uint64_t v8 = [(NRGPBAppViewListImageResponse *)v6 initWithData:v7];

  [WeakRetained _appViewListImageHandleResponse:v8 error:0];
}

void sub_10000CD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CD24(void *a1)
{
  id v2 = [*(id *)(a1[4] + 128) operationCount];
  id v3 = nrg_daemon_log();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001508C((uint64_t)a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "no full sync requests pending, adding request operation %@", buf, 0xCu);
    }

    __int16 v12 = *(void **)(a1[4] + 128);
    uint64_t v14 = a1[5];
    id v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v12 addOperations:v13 waitUntilFinished:0];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_10000D5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10000D620(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000D64C(uint64_t a1)
{
}

void sub_10000D654(void *a1)
{
  if ([*(id *)(a1[4] + 96) isValid]) {
    [*(id *)(a1[4] + 96) invalidate];
  }
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  if ([*(id *)(a1[4] + 88) isEqualToString:a1[5]])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v4 = objc_retainBlock(*(id *)(a1[4] + 80));
    uint64_t v5 = *(void *)(a1[7] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = a1[4];
    uint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = 0;

    uint64_t v9 = a1[4];
    uint64_t v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = 0;
  }
  else
  {
    uint64_t v11 = nrg_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[5];
      uint64_t v13 = *(void *)(a1[4] + 88);
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Asked to handle full sync with mismatched identifer %{public}@ expected %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

void sub_10000DB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose((const void *)(v32 - 144), 8);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_10000DB90(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fullSyncResponseHandler];

  if (v2)
  {
    id v3 = nrg_daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015164(v3);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t sub_10000DBFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DC0C(uint64_t a1)
{
}

void sub_10000DC14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = nrg_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fullSyncIdentifier = %@, error = %@", (uint8_t *)&v7, 0x16u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_5;
    }
    if (!v3)
    {
      id v3 = [*(id *)(a1 + 32) requestUnsuccessfulError];
    }
  }
  [WeakRetained handleFullSyncResponseForIdentifier:error:];
LABEL_5:
}

void sub_10000DD44(uint64_t a1)
{
  uint64_t v2 = nrg_daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fullSyncIdentifier = %@", buf, 0xCu);
  }

  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v4;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  int v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  __int16 v9 = +[NSString stringWithFormat:@"%@_fullSync", v8];

  id v10 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v9 serviceIdentifier:*(void *)(a1 + 32) target:"fullSyncRequestTimedOut:" selector:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) userInfo:540.0];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 96);
  *(void *)(v11 + 96) = v10;

  [*(id *)(*(void *)(a1 + 32) + 96) setMinimumEarlyFireProportion:1.0];
  [*(id *)(*(void *)(a1 + 32) + 96) scheduleInQueue:&_dispatch_main_q];
}

id sub_10000E1DC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 intValue];

  return [v2 addIconVariants:v3];
}

id sub_10000E21C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addBundleIDs:a2];
}

void sub_10000E228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrg_daemon_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100015210();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "full sync request sent %@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_10000E304(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = nrg_daemon_log();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015278();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sync operation completed successfully", v5, 2u);
  }
}

id sub_10000E438(uint64_t a1, uint64_t a2)
{
  return +[NRGResourceCache invalidateBundleID:a2 withPairedDeviceStorePath:*(void *)(a1 + 32)];
}

void sub_10000E808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E830(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E840(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000152E0();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _appViewListImageHandleResponse:0 error:v6];
  }
}

void sub_10000E9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E9BC(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = [*(id *)(a1 + 40) copy];
  if (v2)
  {
    id v4 = objc_retainBlock(v3);
    [v2 addObject:v4];
  }
  else
  {
    uint64_t v5 = +[NSMutableArray arrayWithObject:v3];
    uint64_t v6 = *(void *)(a1 + 32);
    id v4 = *(id *)(v6 + 104);
    *(void *)(v6 + 104) = v5;
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 104) count];
  int v7 = nrg_daemon_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    int v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "appViewListImageResponseHandlers count %d", buf, 8u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    __int16 v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = +[NSString stringWithFormat:@"%@_appListImage", v10];

    id v12 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v11 serviceIdentifier:*(void *)(a1 + 32) target:"_appViewListImageRequestTimedOut:" selector:0 userInfo:31.0];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 112);
    *(void *)(v13 + 112) = v12;

    [*(id *)(*(void *)(a1 + 32) + 112) setMinimumEarlyFireProportion:0.0];
    [*(id *)(*(void *)(a1 + 32) + 112) scheduleInQueue:&_dispatch_main_q];
  }
}

void sub_10000EFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EFF8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 112) isValid]) {
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  id v4 = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = 0;
}

uint64_t sub_10000F090(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10000F5FC(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    int v11 = v6 & 7;
    if (v10 || v11 == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      long long v19 = PBReaderReadString();
      if (v19) {
        [a1 addBundleIDs:v19];
      }
    }
    else if ((v6 >> 3) == 1)
    {
      if (v11 == 2)
      {
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length)
             && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
        {
          char v14 = 0;
          unsigned int v15 = 0;
          uint64_t v16 = 0;
          while (1)
          {
            unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v9 = v15++ >= 9;
              if (!v9) {
                continue;
              }
            }
            goto LABEL_31;
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_31:
          PBRepeatedInt32Add();
        }
        PBReaderRecallMark();
      }
      else
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        while (1)
        {
          unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
          v22 |= (unint64_t)(v24 & 0x7F) << v20;
          if (v24 < 0)
          {
            v20 += 7;
            BOOL v9 = v21++ >= 9;
            if (!v9) {
              continue;
            }
          }
          goto LABEL_46;
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_46:
        PBRepeatedInt32Add();
      }
    }
    else if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      return 0;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100010104(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_1000106B0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        char v14 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v13;

        continue;
      case 2u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        while (2)
        {
          uint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v19 = v18 + 1;
          if (v18 == -1 || v19 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19;
            v17 |= (unint64_t)(v20 & 0x7F) << v15;
            if (v20 < 0)
            {
              v15 += 7;
              BOOL v10 = v16++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_41:
        uint64_t v29 = 24;
        goto LABEL_46;
      case 4u:
        *(unsigned char *)(a1 + 28) |= 2u;
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v23 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v23 = 0;
        }
        *(_DWORD *)(a1 + 20) = v23;
        continue;
      case 5u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      uint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v27 = v26 + 1;
      if (v26 == -1 || v27 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27;
      v17 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_43;
      }
      v24 += 7;
      BOOL v10 = v25++ >= 9;
      if (v10)
      {
        LODWORD(v17) = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v17) = 0;
    }
LABEL_45:
    uint64_t v29 = 16;
LABEL_46:
    *(_DWORD *)(a1 + v29) = v17;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100011328(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];

  return _objc_release_x1();
}

uint64_t sub_100011408(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];

  return _objc_release_x1();
}

uint64_t sub_1000114E8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];

  return _objc_release_x1();
}

void sub_1000116D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000116FC(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) iconVariants];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 32) + 56) addIconVariants:[*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) intValue]];
        unint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100011814(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = nrg_daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "requestHandler called with %@ %@", (uint8_t *)&v9, 0x16u);
  }

  [WeakRetained requestSent:v5 error:v6];
}

void sub_100011908(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v14 = nrg_daemon_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "responseHandler (strongSelf = %@) called with %@ %@", (uint8_t *)&v15, 0x20u);
  }

  if (v10) {
    [WeakRetained handleFullSyncResponse:v9 url:v10 iconVersionTracker:v11];
  }
  else {
    [WeakRetained requestComplete:v9 error:v12];
  }
}

void sub_100011CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011CE4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = nrg_daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v6 = [v3 bundleID];
    uint64_t v7 = (int)[v3 iconVariant];
    long long v8 = [v3 iconData];
    int v15 = 134218754;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    id v22 = [v8 length];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "icon %ld is %@ (%ld) length %ld", (uint8_t *)&v15, 0x2Au);
  }
  id v9 = (void *)a1[4];
  id v10 = [v3 version];
  id v11 = [v3 bundleID];
  [v9 setVersion:v10 forBundleID:v11];

  id v12 = [v3 iconData];
  id v13 = [v3 iconVariant];
  char v14 = [v3 bundleID];
  +[NRGResourceCache setIcon:v12 forIconVariant:v13 inBundleID:v14 withPairedDeviceStorePath:a1[5]];

  ++*(void *)(*(void *)(a1[6] + 8) + 24);
}

void sub_100012004(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

void sub_100012270(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

uint64_t sub_100012854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012864(uint64_t a1)
{
}

uint64_t sub_10001286C(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  return _objc_release_x1();
}

id sub_100012980(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

id sub_100012A2C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100012BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *sub_100012BF0(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"];
  id v4 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_OPERATION"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 integerValue] == (id)3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained purgeCache];
  }
  return &__NSDictionary0__struct;
}

void sub_100014308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014334(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v5)
  {
    if (!v3)
    {
      id v6 = nrg_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000158E8(a1 + 64, a1, v6);
      }

      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [*(id *)(*(void *)(a1 + 40) + 64) removeObjectForKey:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v4) {
    +[NRGResourceCache setIcon:v4 forIconVariant:*(unsigned int *)(a1 + 72) inBundleID:*(void *)(a1 + 32) withPairedDeviceStorePath:*(void *)(a1 + 48)];
  }
}

void sub_1000146D0()
{
  __assert_rtn("-[NRGPBIcon writeTo:]", "NRGPBIcon.m", 129, "nil != self->_bundleID");
}

void sub_1000146FC()
{
  __assert_rtn("-[NRGPBIcon writeTo:]", "NRGPBIcon.m", 138, "nil != self->_iconData");
}

void sub_100014728(void *a1, uint64_t a2, NSObject *a3)
{
  CFStringRef v3 = @"writing";
  if (a2) {
    CFStringRef v3 = @"reading";
  }
  *(_DWORD *)id v4 = 138412546;
  *(void *)&v4[4] = *a1;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = v3;
  sub_100007884((void *)&_mh_execute_header, a2, a3, "could not open %@ for %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void sub_1000147BC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)CFStringRef v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 48);
  sub_100007884((void *)&_mh_execute_header, a2, a3, "could not write %@ to %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100014838(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "checksums don't match", v1, 2u);
}

void sub_10001487C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)CFStringRef v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100007884((void *)&_mh_execute_header, a2, a3, "could not remove %@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1000148F8()
{
  sub_1000093B8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "found user or system application %@", v1, 0xCu);
}

void sub_10001496C()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "encountered error while enumerating installed application on paired device %@", v2, v3, v4, v5, v6);
}

void sub_1000149D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to build the url for the icon version file, is device paired?", v1, 2u);
}

void sub_100014A18()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not read icon versions from %@ %@");
}

void sub_100014A80()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "failed to load icon versions from %@", v2, v3, v4, v5, v6);
}

void sub_100014AE8()
{
  sub_1000093B8();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not create data for icon versions %@ %@");
}

void sub_100014B60()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not write icon version dictionary to property list file %@ %@");
}

void sub_100014BC8()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "could not create icon version data %@", v2, v3, v4, v5, v6);
}

void sub_100014C30()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not remove icon versions file %@ %@");
}

void sub_100014C98()
{
  __assert_rtn("-[NRGPBDataHeader writeTo:]", "NRGPBDataHeader.m", 72, "nil != self->_checksumData");
}

void sub_100014CC4()
{
}

void sub_100014CF0()
{
}

void sub_100014D1C()
{
}

void sub_100014D48(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Resource request protobuf send error %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014DC0(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  int v6 = *(_DWORD *)(a1 + 12);
  unsigned int v7 = [a2 hasResource];
  long long v8 = [a2 resource];
  int v9 = 138413058;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  __int16 v13 = 1024;
  unsigned int v14 = v7;
  __int16 v15 = 2048;
  id v16 = [v8 length];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "bad checksum received for %@ (%d) hasResource %{BOOL}u response.resource.length %lu", (uint8_t *)&v9, 0x22u);
}

void sub_100014EA8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "saveGizmoBuild: NSKeyedArchiver fail", v1, 2u);
}

void sub_100014EEC()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "saveGizmoBuild: writeToFile fail %@", v2, v3, v4, v5, v6);
}

void sub_100014F54()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "loadGizmoBuild: failed to load gizmo build from %@", v2, v3, v4, v5, v6);
}

void sub_100014FBC()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "full sync request failed to send, error = %{public}@", v2, v3, v4, v5, v6);
}

void sub_100015024()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "full sync failed to complete -- error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001508C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000150FC()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "############ Resource request for IDS ID %{public}@ not found", v2, v3, v4, v5, v6);
}

void sub_100015164(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "full sync requested while previous one still in flight", v1, 2u);
}

void sub_1000151A8()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "%@ timeout fired", v2, v3, v4, v5, v6);
}

void sub_100015210()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "sync request failed to send, error = %{public}@", v2, v3, v4, v5, v6);
}

void sub_100015278()
{
  sub_1000093B8();
  sub_1000093C4((void *)&_mh_execute_header, v0, v1, "sync failed to complete -- error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000152E0()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "appViewListImageRequest %@ error %@");
}

void sub_100015348()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "no handler for app view list image response %@ error %@");
}

void sub_1000153B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no icons found in %@", (uint8_t *)&v2, 0xCu);
}

void sub_100015428()
{
  sub_1000124EC();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "full sync request %{public}@ failed to send with error %{public}@");
}

void sub_100015490()
{
  sub_1000124EC();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "cannot complete full sync request %{public}@  -- error %{public}@");
}

void sub_1000154F8()
{
}

void sub_100015524(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001559C()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not handle request of type %@ %@");
}

void sub_100015604()
{
  sub_1000093A0();
  sub_100007884((void *)&_mh_execute_header, v0, v1, "could not handle response of type %@ %@");
}

void sub_10001566C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 data];
  int v6 = 134349314;
  id v7 = [v5 length];
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "############ IDS Request Failed to Send: %{public}ld bytes, identifier %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100015720(void *a1, uint64_t a2, NSObject *a3)
{
  int v6 = [a1 data];
  id v7 = [v6 length];
  __int16 v8 = [a1 context];
  uint64_t v9 = [v8 outgoingResponseIdentifier];
  int v10 = 134349570;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  __int16 v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "############ IDS Response Failed to Send: %{public}ld bytes, identifier %{public}@ (for %{public}@)", (uint8_t *)&v10, 0x20u);
}

void sub_100015810(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001587C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000158E8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 32);
  sub_100007884((void *)&_mh_execute_header, a2, a3, "############ Resource request failed with IDS ID %{public}@ for %@, removing", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CacheDeleteRegisterCallback()
{
  return _CacheDeleteRegisterCallback();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t NRGGetActivePairedDevice()
{
  return _NRGGetActivePairedDevice();
}

uint64_t NRGGetActivePairedDeviceStorePath()
{
  return _NRGGetActivePairedDeviceStorePath();
}

uint64_t NRGWaitForActivePairedDeviceStorePath()
{
  return _NRGWaitForActivePairedDeviceStorePath();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedInt32Add()
{
  return _PBRepeatedInt32Add();
}

uint64_t PBRepeatedInt32Clear()
{
  return _PBRepeatedInt32Clear();
}

uint64_t PBRepeatedInt32Copy()
{
  return _PBRepeatedInt32Copy();
}

uint64_t PBRepeatedInt32Hash()
{
  return _PBRepeatedInt32Hash();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return _PBRepeatedInt32IsEqual();
}

uint64_t PBRepeatedInt32NSArray()
{
  return _PBRepeatedInt32NSArray();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nrg_daemon_log()
{
  return _nrg_daemon_log();
}

uint64_t nrg_framework_log()
{
  return _nrg_framework_log();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__activeVersionHistoryURL(void *a1, const char *a2, ...)
{
  return [a1 _activeVersionHistoryURL];
}

id objc_msgSend__appConduitUpdated(void *a1, const char *a2, ...)
{
  return [a1 _appConduitUpdated];
}

id objc_msgSend__prelaunchCompleted(void *a1, const char *a2, ...)
{
  return [a1 _prelaunchCompleted];
}

id objc_msgSend__readActiveIconVersions(void *a1, const char *a2, ...)
{
  return [a1 _readActiveIconVersions];
}

id objc_msgSend__removeActiveIconVersions(void *a1, const char *a2, ...)
{
  return [a1 _removeActiveIconVersions];
}

id objc_msgSend__writeActiveIconVersions(void *a1, const char *a2, ...)
{
  return [a1 _writeActiveIconVersions];
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return [a1 abort];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDsCount(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsCount];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleShortVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDirPathForPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 cacheDirPathForPairedDevice];
}

id objc_msgSend_checksumData(void *a1, const char *a2, ...)
{
  return [a1 checksumData];
}

id objc_msgSend_clearBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 clearBundleIDs];
}

id objc_msgSend_clearIconVariants(void *a1, const char *a2, ...)
{
  return [a1 clearIconVariants];
}

id objc_msgSend_clearIcons(void *a1, const char *a2, ...)
{
  return [a1 clearIcons];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_devicePaired(void *a1, const char *a2, ...)
{
  return [a1 devicePaired];
}

id objc_msgSend_deviceSwitched(void *a1, const char *a2, ...)
{
  return [a1 deviceSwitched];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fullSyncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fullSyncIdentifier];
}

id objc_msgSend_fullSyncResponseHandler(void *a1, const char *a2, ...)
{
  return [a1 fullSyncResponseHandler];
}

id objc_msgSend_genericSendError(void *a1, const char *a2, ...)
{
  return [a1 genericSendError];
}

id objc_msgSend_gizmoBuild(void *a1, const char *a2, ...)
{
  return [a1 gizmoBuild];
}

id objc_msgSend_hasImageData(void *a1, const char *a2, ...)
{
  return [a1 hasImageData];
}

id objc_msgSend_hasResource(void *a1, const char *a2, ...)
{
  return [a1 hasResource];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_iconVariant(void *a1, const char *a2, ...)
{
  return [a1 iconVariant];
}

id objc_msgSend_iconVariants(void *a1, const char *a2, ...)
{
  return [a1 iconVariants];
}

id objc_msgSend_iconVariantsCount(void *a1, const char *a2, ...)
{
  return [a1 iconVariantsCount];
}

id objc_msgSend_iconsCount(void *a1, const char *a2, ...)
{
  return [a1 iconsCount];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initIDS(void *a1, const char *a2, ...)
{
  return [a1 initIDS];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateTimer];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextMessage(void *a1, const char *a2, ...)
{
  return [a1 nextMessage];
}

id objc_msgSend_nrgIconVariants(void *a1, const char *a2, ...)
{
  return [a1 nrgIconVariants];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return [a1 operationCount];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_pairedSyncInProgress(void *a1, const char *a2, ...)
{
  return [a1 pairedSyncInProgress];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_protobufRequestHandlers(void *a1, const char *a2, ...)
{
  return [a1 protobufRequestHandlers];
}

id objc_msgSend_protobufResponseHandlers(void *a1, const char *a2, ...)
{
  return [a1 protobufResponseHandlers];
}

id objc_msgSend_purgeCache(void *a1, const char *a2, ...)
{
  return [a1 purgeCache];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_readIcon(void *a1, const char *a2, ...)
{
  return [a1 readIcon];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestExecuting(void *a1, const char *a2, ...)
{
  return [a1 requestExecuting];
}

id objc_msgSend_requestFinished(void *a1, const char *a2, ...)
{
  return [a1 requestFinished];
}

id objc_msgSend_requestTypeCode(void *a1, const char *a2, ...)
{
  return [a1 requestTypeCode];
}

id objc_msgSend_requestUnsuccessfulError(void *a1, const char *a2, ...)
{
  return [a1 requestUnsuccessfulError];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resource(void *a1, const char *a2, ...)
{
  return [a1 resource];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_saveGizmoBuild(void *a1, const char *a2, ...)
{
  return [a1 saveGizmoBuild];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldReset(void *a1, const char *a2, ...)
{
  return [a1 shouldReset];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncDidCompleteSending(void *a1, const char *a2, ...)
{
  return [a1 syncDidCompleteSending];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_xpcClients(void *a1, const char *a2, ...)
{
  return [a1 xpcClients];
}
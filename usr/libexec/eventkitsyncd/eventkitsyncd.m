uint64_t sub_100003D98(unsigned char *a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NEKPBItemOccurrence *v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0;
        v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      v16 = objc_alloc_init(NEKPBItemOccurrence);
      [a1 addItems:v16];
      if (!PBReaderPlaceMark() || (sub_100060C80((uint64_t)v16, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else
    {
      if (v13 == 2)
      {
        a1[32] |= 1u;
        v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 <= 0xFFFFFFFFFFFFFFF7 && v17 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          v15 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          v15 = 0;
        }
        v19 = 8;
      }
      else
      {
        if (v13 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        a1[32] |= 2u;
        v14 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v14 <= 0xFFFFFFFFFFFFFFF7 && v14 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          v15 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v14);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v14 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          v15 = 0;
        }
        v19 = 16;
      }
      *(void *)&a1[v19] = v15;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100005450(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1000C6B20 != -1) {
      dispatch_once(&qword_1000C6B20, &stru_1000A8B00);
    }
    v2 = [(id)qword_1000C6B28 cachedCopy:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_10000616C(id a1)
{
  qword_1000C6B28 = [[NDTObjectCache alloc] initWithCapacity:200];

  _objc_release_x1();
}

uint64_t sub_1000069C0(uint64_t result)
{
  if (!result) {
    sub_10006C120();
  }
  dword_1000C6458 = result;
  return result;
}

uint64_t sub_1000069E4(uint64_t result)
{
  if (!result) {
    sub_10006C14C();
  }
  dword_1000C645C = result;
  return result;
}

uint64_t sub_100006A08()
{
  return dword_1000C6458;
}

uint64_t sub_100006A14()
{
  return dword_1000C645C;
}

NSObject *sub_100006A20(const char *a1)
{
  return sub_100006A2C(a1, (dispatch_qos_class_t)dword_1000C6458);
}

NSObject *sub_100006A2C(const char *a1, dispatch_qos_class_t a2)
{
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, a2, 0);

  v6 = dispatch_queue_attr_make_initially_inactive(v5);

  v7 = dispatch_queue_create(a1, v6);
  dispatch_set_qos_class_fallback();
  dispatch_activate(v7);

  return v7;
}

NSObject *sub_100006AD0(const char *a1)
{
  return sub_100006A2C(a1, (dispatch_qos_class_t)dword_1000C645C);
}

dispatch_queue_global_t sub_100006ADC()
{
  return dispatch_get_global_queue(dword_1000C6458, 0);
}

dispatch_queue_global_t sub_100006AEC()
{
  return dispatch_get_global_queue(dword_1000C645C, 0);
}

void sub_100007318(id a1)
{
  qword_1000C6B38 = objc_alloc_init(NEKEnvironment);

  _objc_release_x1();
}

uint64_t sub_1000083B8(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_30;
        }
        v14 += 7;
        BOOL v9 = v15++ >= 9;
        if (v9)
        {
          uint64_t v16 = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v16 = 0;
      }
LABEL_32:
      *(unsigned char *)(a1 + 16) = v16 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      v13 = *(void **)(a1 + 8);
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

void sub_10000951C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100009530(uint64_t a1)
{
  v2 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095E0;
  block[3] = &unk_1000A8B48;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void sub_1000095E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _databaseChangedExternally];
}

uint64_t sub_100009620(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

id sub_1000097A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) databaseChangedExternally];
}

id sub_1000099EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeSql:*(void *)(a1 + 40)];
}

id sub_100009B90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parseSql:*(void *)(a1 + 40) andRun:*(void *)(a1 + 48)];
}

uint64_t sub_100009EC8(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "BEGIN", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"begin(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_100009FBC(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "COMMIT", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"commit(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_10000A0B0(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "ROLLBACK", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"rollback(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_10000A1DC(uint64_t a1)
{
  uint64_t result = sqlite3_changes((sqlite3 *)[*(id *)(a1 + 32) db]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

uint64_t sub_10000A65C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = objc_alloc_init(NEKPBSourceID);
        objc_storeStrong((id *)(a1 + 32), v12);
        if PBReaderPlaceMark() && (sub_1000083B8((uint64_t)v12, a2)) {
          goto LABEL_26;
        }
        goto LABEL_54;
      case 2u:
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 16;
        goto LABEL_42;
      case 3u:
        uint64_t v12 = objc_alloc_init(NEKPBCalendarAttributes);
        objc_storeStrong((id *)(a1 + 8), v12);
        if PBReaderPlaceMark() && (sub_10000D87C((uint64_t)v12, a2))
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_54:

        return 0;
      case 4u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v9 = v17++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_46:
        BOOL v27 = v18 != 0;
        uint64_t v28 = 41;
        goto LABEL_51;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v23 |= (unint64_t)(v25 & 0x7F) << v21;
            if (v25 < 0)
            {
              v21 += 7;
              BOOL v9 = v22++ >= 9;
              if (v9)
              {
                uint64_t v23 = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0;
        }
LABEL_50:
        BOOL v27 = v23 != 0;
        uint64_t v28 = 40;
LABEL_51:
        *(unsigned char *)(a1 + v28) = v27;
        goto LABEL_52;
      case 6u:
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 24;
LABEL_42:
        v26 = *(void **)(a1 + v15);
        *(void *)(a1 + v15) = v14;

        goto LABEL_52;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_52;
    }
  }
}

void sub_10000B314(id a1)
{
  qword_1000C6B48 = (uint64_t)os_log_create("com.apple.eventkitsyncd", "NEKServicesServer");

  _objc_release_x1();
}

void sub_10000B658(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_10000B670(uint64_t a1)
{
  v2 = +[NEKServicesServer log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "interrupted: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B720(uint64_t a1)
{
  v2 = +[NEKServicesServer log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_10000BA04(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ([v1 sourceType])
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v5 = +[SYDevice targetableDevice];
      unint64_t v6 = [v5 systemBuildVersion];

      BOOL v3 = [v6 compare:@"14S" options:64 range:0] != (id)-1;
    }
    uint64_t v4 = v3 & ~[v2 isDelegate];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

NSPredicate *sub_10000BAB0()
{
  return +[NSPredicate predicateWithBlock:&stru_1000A8C68];
}

BOOL sub_10000BAC4(id a1, id a2, NSDictionary *a3)
{
  return sub_10000BA04(a2);
}

uint64_t sub_10000BACC(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 eventStore];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 defaultLocalCalendar];
      unint64_t v6 = v5;
      if (v5
        && ([v5 calendarIdentifier],
            unint64_t v7 = objc_claimAutoreleasedReturnValue(),
            [v2 calendarIdentifier],
            char v8 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v9 = [v7 isEqualToString:v8],
            v8,
            v7,
            (v9 & 1) != 0))
      {
        uint64_t v10 = 0;
      }
      else
      {
        v11 = [v2 source];
        uint64_t v12 = v11;
        if (v11) {
          BOOL v13 = [v11 sourceType] != (id)5;
        }
        else {
          BOOL v13 = 1;
        }
        unsigned int v14 = [v12 isDelegate];

        uint64_t v10 = v13 & ~v14;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t sub_10000BBD8(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = [a1 source];
  v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 sourceType] != (id)5;
    uint64_t v4 = v3 & ~[v2 isDelegate];
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t sub_10000BC3C(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = [a1 calendar];
  v2 = v1;
  if (v1) {
    uint64_t v3 = sub_10000BBD8(v1);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL sub_10000BC90()
{
  v0 = +[SYDevice targetableDevice];
  id v1 = [v0 systemBuildVersion];

  BOOL v2 = [v1 compare:@"17R" options:64 range:0] == (id)-1;
  return v2;
}

uint64_t sub_10000BCFC(void *a1)
{
  unint64_t v1 = (unint64_t)[a1 type];
  unint64_t v2 = v1;
  if (v1 <= 4 && ((1 << v1) & 0x1A) != 0) {
    return 1;
  }
  LODWORD(result) = sub_10000BC90();
  if (v2 == 2) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000BD50(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 account];
  unint64_t v3 = (unint64_t)[v2 type];
  BOOL v4 = v3 > 4 || ((1 << v3) & 0x1A) == 0;
  if (!v4 || (v6 = v3, v7 = sub_10000BC90(), uint64_t v5 = 0, v6 == 2) && v7)
  {
    if (([v1 isGroup] & 1) != 0
      || ([v1 daIsEventOnlyContainer] & 1) != 0)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [v1 daIsNotificationsCollection] ^ 1;
    }
  }

  return v5;
}

uint64_t sub_10000BDFC(void *a1)
{
  id v1 = [a1 list];
  uint64_t v2 = sub_10000BD50(v1);

  return v2;
}

id sub_10000BFB8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleResetSyncTask:a2];
}

uint64_t sub_10000D87C(uint64_t a1, uint64_t a2)
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
        uint64_t v13 = 256;
        goto LABEL_201;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 240;
        goto LABEL_201;
      case 3u:
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        *(_DWORD *)(a1 + 284) |= 0x40000u;
        while (2)
        {
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v9 = v15++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_205;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_205:
        BOOL v123 = v16 != 0;
        uint64_t v124 = 277;
        goto LABEL_291;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 284) |= 0x400u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if (v23 < 0)
            {
              v19 += 7;
              BOOL v9 = v20++ >= 9;
              if (v9)
              {
                uint64_t v21 = 0;
                goto LABEL_209;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v21 = 0;
        }
LABEL_209:
        BOOL v123 = v21 != 0;
        uint64_t v124 = 269;
        goto LABEL_291;
      case 5u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(_DWORD *)(a1 + 284) |= 0x4000u;
        while (2)
        {
          unint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v27 == -1 || v27 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v9 = v25++ >= 9;
              if (v9)
              {
                uint64_t v26 = 0;
                goto LABEL_213;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v26 = 0;
        }
LABEL_213:
        BOOL v123 = v26 != 0;
        uint64_t v124 = 273;
        goto LABEL_291;
      case 6u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(_DWORD *)(a1 + 284) |= 0x8000u;
        while (2)
        {
          unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v9 = v30++ >= 9;
              if (v9)
              {
                uint64_t v31 = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v31 = 0;
        }
LABEL_217:
        BOOL v123 = v31 != 0;
        uint64_t v124 = 274;
        goto LABEL_291;
      case 7u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_DWORD *)(a1 + 284) |= 0x10000u;
        while (2)
        {
          unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1 || v37 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v9 = v35++ >= 9;
              if (v9)
              {
                uint64_t v36 = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v36 = 0;
        }
LABEL_221:
        BOOL v123 = v36 != 0;
        uint64_t v124 = 275;
        goto LABEL_291;
      case 8u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(_DWORD *)(a1 + 284) |= 0x100000u;
        while (2)
        {
          unint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v42 == -1 || v42 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
            v41 |= (unint64_t)(v43 & 0x7F) << v39;
            if (v43 < 0)
            {
              v39 += 7;
              BOOL v9 = v40++ >= 9;
              if (v9)
              {
                uint64_t v41 = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v41 = 0;
        }
LABEL_225:
        BOOL v123 = v41 != 0;
        uint64_t v124 = 279;
        goto LABEL_291;
      case 9u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(_DWORD *)(a1 + 284) |= 0x200000u;
        while (2)
        {
          unint64_t v47 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v47 == -1 || v47 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v47);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
            v46 |= (unint64_t)(v48 & 0x7F) << v44;
            if (v48 < 0)
            {
              v44 += 7;
              BOOL v9 = v45++ >= 9;
              if (v9)
              {
                uint64_t v46 = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v46 = 0;
        }
LABEL_229:
        BOOL v123 = v46 != 0;
        uint64_t v124 = 280;
        goto LABEL_291;
      case 0xAu:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v51 = 0;
        *(_DWORD *)(a1 + 284) |= 0x800u;
        while (2)
        {
          unint64_t v52 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v52 == -1 || v52 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v52);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
            v51 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v9 = v50++ >= 9;
              if (v9)
              {
                uint64_t v51 = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v51 = 0;
        }
LABEL_233:
        BOOL v123 = v51 != 0;
        uint64_t v124 = 270;
        goto LABEL_291;
      case 0xBu:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v56 = 0;
        *(_DWORD *)(a1 + 284) |= 0x200u;
        while (2)
        {
          unint64_t v57 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v57 == -1 || v57 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v57);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
            v56 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v9 = v55++ >= 9;
              if (v9)
              {
                uint64_t v56 = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v56 = 0;
        }
LABEL_237:
        BOOL v123 = v56 != 0;
        uint64_t v124 = 268;
        goto LABEL_291;
      case 0xCu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v61 = 0;
        *(_DWORD *)(a1 + 284) |= 0x1000u;
        while (2)
        {
          unint64_t v62 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v62 == -1 || v62 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v62);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v62 + 1;
            v61 |= (unint64_t)(v63 & 0x7F) << v59;
            if (v63 < 0)
            {
              v59 += 7;
              BOOL v9 = v60++ >= 9;
              if (v9)
              {
                uint64_t v61 = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v61 = 0;
        }
LABEL_241:
        BOOL v123 = v61 != 0;
        uint64_t v124 = 271;
        goto LABEL_291;
      case 0xDu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v66 = 0;
        *(_DWORD *)(a1 + 284) |= 0x2000u;
        while (2)
        {
          unint64_t v67 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v67 == -1 || v67 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v67);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v67 + 1;
            v66 |= (unint64_t)(v68 & 0x7F) << v64;
            if (v68 < 0)
            {
              v64 += 7;
              BOOL v9 = v65++ >= 9;
              if (v9)
              {
                uint64_t v66 = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v66 = 0;
        }
LABEL_245:
        BOOL v123 = v66 != 0;
        uint64_t v124 = 272;
        goto LABEL_291;
      case 0xEu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v71 = 0;
        *(_DWORD *)(a1 + 284) |= 0x80000u;
        while (2)
        {
          unint64_t v72 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v72 == -1 || v72 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v73 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v72);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v72 + 1;
            v71 |= (unint64_t)(v73 & 0x7F) << v69;
            if (v73 < 0)
            {
              v69 += 7;
              BOOL v9 = v70++ >= 9;
              if (v9)
              {
                uint64_t v71 = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v71 = 0;
        }
LABEL_249:
        BOOL v123 = v71 != 0;
        uint64_t v124 = 278;
        goto LABEL_291;
      case 0xFu:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v76 = 0;
        *(_DWORD *)(a1 + 284) |= 0x100u;
        while (2)
        {
          unint64_t v77 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v77 == -1 || v77 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v77);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v77 + 1;
            v76 |= (unint64_t)(v78 & 0x7F) << v74;
            if (v78 < 0)
            {
              v74 += 7;
              BOOL v9 = v75++ >= 9;
              if (v9)
              {
                uint64_t v76 = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v76 = 0;
        }
LABEL_253:
        BOOL v123 = v76 != 0;
        uint64_t v124 = 267;
        goto LABEL_291;
      case 0x10u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 248;
        goto LABEL_201;
      case 0x11u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 48;
        goto LABEL_201;
      case 0x12u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 224;
        goto LABEL_201;
      case 0x13u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 40;
        goto LABEL_201;
      case 0x14u:
        char v79 = 0;
        unsigned int v80 = 0;
        uint64_t v81 = 0;
        *(_DWORD *)(a1 + 284) |= 0x10u;
        while (2)
        {
          unint64_t v82 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v82 == -1 || v82 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v82);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v82 + 1;
            v81 |= (unint64_t)(v83 & 0x7F) << v79;
            if (v83 < 0)
            {
              v79 += 7;
              BOOL v9 = v80++ >= 9;
              if (v9)
              {
                LODWORD(v81) = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v81) = 0;
        }
LABEL_257:
        *(_DWORD *)(a1 + 56) = v81;
        continue;
      case 0x15u:
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v86 = 0;
        *(_DWORD *)(a1 + 284) |= 4u;
        while (2)
        {
          unint64_t v87 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v87 == -1 || v87 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v88 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v87);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v87 + 1;
            v86 |= (unint64_t)(v88 & 0x7F) << v84;
            if (v88 < 0)
            {
              v84 += 7;
              BOOL v9 = v85++ >= 9;
              if (v9)
              {
                uint64_t v86 = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v86 = 0;
        }
LABEL_261:
        uint64_t v125 = 24;
        goto LABEL_286;
      case 0x16u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 208;
        goto LABEL_201;
      case 0x17u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 200;
        goto LABEL_201;
      case 0x18u:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v86 = 0;
        *(_DWORD *)(a1 + 284) |= 2u;
        while (2)
        {
          unint64_t v91 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v91 == -1 || v91 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v92 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v91);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v91 + 1;
            v86 |= (unint64_t)(v92 & 0x7F) << v89;
            if (v92 < 0)
            {
              v89 += 7;
              BOOL v9 = v90++ >= 9;
              if (v9)
              {
                uint64_t v86 = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v86 = 0;
        }
LABEL_265:
        uint64_t v125 = 16;
        goto LABEL_286;
      case 0x19u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 144;
        goto LABEL_201;
      case 0x1Au:
        char v93 = 0;
        unsigned int v94 = 0;
        uint64_t v95 = 0;
        *(_DWORD *)(a1 + 284) |= 0x20u;
        while (2)
        {
          unint64_t v96 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v96 == -1 || v96 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v97 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v96);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v96 + 1;
            v95 |= (unint64_t)(v97 & 0x7F) << v93;
            if (v97 < 0)
            {
              v93 += 7;
              BOOL v9 = v94++ >= 9;
              if (v9)
              {
                uint64_t v95 = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v95 = 0;
        }
LABEL_269:
        BOOL v123 = v95 != 0;
        uint64_t v124 = 264;
        goto LABEL_291;
      case 0x1Bu:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v100 = 0;
        *(_DWORD *)(a1 + 284) |= 0x40u;
        while (2)
        {
          unint64_t v101 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v101 == -1 || v101 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v102 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v101);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v101 + 1;
            v100 |= (unint64_t)(v102 & 0x7F) << v98;
            if (v102 < 0)
            {
              v98 += 7;
              BOOL v9 = v99++ >= 9;
              if (v9)
              {
                uint64_t v100 = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v100 = 0;
        }
LABEL_273:
        BOOL v123 = v100 != 0;
        uint64_t v124 = 265;
        goto LABEL_291;
      case 0x1Cu:
        char v103 = 0;
        unsigned int v104 = 0;
        uint64_t v105 = 0;
        *(_DWORD *)(a1 + 284) |= 0x20000u;
        while (2)
        {
          unint64_t v106 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v106 == -1 || v106 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v107 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v106);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v106 + 1;
            v105 |= (unint64_t)(v107 & 0x7F) << v103;
            if (v107 < 0)
            {
              v103 += 7;
              BOOL v9 = v104++ >= 9;
              if (v9)
              {
                uint64_t v105 = 0;
                goto LABEL_277;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v105 = 0;
        }
LABEL_277:
        BOOL v123 = v105 != 0;
        uint64_t v124 = 276;
        goto LABEL_291;
      case 0x1Du:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 64;
        goto LABEL_201;
      case 0x1Eu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 72;
        goto LABEL_201;
      case 0x1Fu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 232;
        goto LABEL_201;
      case 0x20u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 80;
        goto LABEL_201;
      case 0x21u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 88;
        goto LABEL_201;
      case 0x22u:
        char v108 = 0;
        unsigned int v109 = 0;
        uint64_t v86 = 0;
        *(_DWORD *)(a1 + 284) |= 8u;
        while (2)
        {
          unint64_t v110 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v110 == -1 || v110 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v111 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v110);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v110 + 1;
            v86 |= (unint64_t)(v111 & 0x7F) << v108;
            if (v111 < 0)
            {
              v108 += 7;
              BOOL v9 = v109++ >= 9;
              if (v9)
              {
                uint64_t v86 = 0;
                goto LABEL_281;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v86 = 0;
        }
LABEL_281:
        uint64_t v125 = 32;
        goto LABEL_286;
      case 0x23u:
        char v112 = 0;
        unsigned int v113 = 0;
        uint64_t v86 = 0;
        *(_DWORD *)(a1 + 284) |= 1u;
        while (2)
        {
          unint64_t v114 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v114 == -1 || v114 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v114);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v114 + 1;
            v86 |= (unint64_t)(v115 & 0x7F) << v112;
            if (v115 < 0)
            {
              v112 += 7;
              BOOL v9 = v113++ >= 9;
              if (v9)
              {
                uint64_t v86 = 0;
                goto LABEL_285;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v86 = 0;
        }
LABEL_285:
        uint64_t v125 = 8;
LABEL_286:
        *(void *)(a1 + v125) = v86;
        continue;
      case 0x24u:
        char v116 = 0;
        unsigned int v117 = 0;
        uint64_t v118 = 0;
        *(_DWORD *)(a1 + 284) |= 0x80u;
        break;
      case 0x25u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 96;
        goto LABEL_201;
      case 0x27u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 216;
        goto LABEL_201;
      case 0x28u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 152;
        goto LABEL_201;
      case 0x29u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 168;
        goto LABEL_201;
      case 0x2Au:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 176;
        goto LABEL_201;
      case 0x2Bu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 160;
        goto LABEL_201;
      case 0x2Cu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 184;
        goto LABEL_201;
      case 0x2Du:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 192;
        goto LABEL_201;
      case 0x2Eu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 112;
        goto LABEL_201;
      case 0x2Fu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 120;
        goto LABEL_201;
      case 0x30u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 104;
        goto LABEL_201;
      case 0x31u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 128;
        goto LABEL_201;
      case 0x32u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 136;
LABEL_201:
        v122 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v119 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v119 == -1 || v119 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v120 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v119);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v119 + 1;
      v118 |= (unint64_t)(v120 & 0x7F) << v116;
      if ((v120 & 0x80) == 0) {
        goto LABEL_288;
      }
      v116 += 7;
      BOOL v9 = v117++ >= 9;
      if (v9)
      {
        uint64_t v118 = 0;
        goto LABEL_290;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_288:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v118 = 0;
    }
LABEL_290:
    BOOL v123 = v118 != 0;
    uint64_t v124 = 266;
LABEL_291:
    *(unsigned char *)(a1 + v124) = v123;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100012380(void *a1)
{
  return [*(id *)(a1[4] + 24) setString:a1[5] forKey:a1[6]];
}

uint64_t sub_1000124D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000124E4(uint64_t a1)
{
}

uint64_t sub_1000124EC(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 24) getStringForKey:a1[5] default:a1[6]];

  return _objc_release_x1();
}

id sub_1000125E8(void *a1)
{
  return [*(id *)(a1[4] + 24) setInteger:a1[6] forKey:a1[5]];
}

id sub_1000126D4(void *a1)
{
  id result = [*(id *)(a1[4] + 24) getIntegerForKey:a1[5] default:a1[7]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

id sub_1000127F0(void *a1)
{
  id result = [*(id *)(a1[4] + 24) compareAndSwapIntegerValue:a1[7] expectedExistingValue:a1[8] forKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_1000128D4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setDouble:*(void *)(a1 + 40) forKey:*(double *)(a1 + 48)];
}

id sub_1000129C0(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) getDoubleForKey:*(void *)(a1 + 40) default:*(double *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t sub_100012B0C(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) getDataForKey:a1[5] default:0];

  return _objc_release_x1();
}

id sub_100012C24(void *a1)
{
  return [*(id *)(a1[4] + 24) setData:a1[5] forKey:a1[6]];
}

id sub_100012CD0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) deleteValueForKey:*(void *)(a1 + 40)];
}

void sub_100013F98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [*(id *)(a1 + 32) data];

  char v4 = *(void **)(a1 + 32);
  if (v3)
  {
    unsigned int v5 = [v4 data];
    unint64_t v6 = [*(id *)(a1 + 32) msgType];
    uint64_t v22 = 0;
    unint64_t v7 = (id *)&v22;
    uint64_t v8 = [WeakRetained _rawSendData:v5 type:v6 responseIdentifier:0 error:&v22];
  }
  else
  {
    unsigned int v5 = [v4 path];
    unint64_t v6 = [*(id *)(a1 + 32) msgType];
    uint64_t v21 = 0;
    unint64_t v7 = (id *)&v21;
    uint64_t v8 = [WeakRetained _rawSendFile:v5 type:v6 responseIdentifier:0 error:&v21];
  }
  BOOL v9 = (void *)v8;
  id v10 = *v7;

  if (v9)
  {
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      id v12 = [v11 copy];
      id v13 = objc_retainBlock(v12);
      [*((id *)WeakRetained + 1) setObject:v13 forKeyedSubscript:v9];

      dispatch_time_t v14 = dispatch_time(0, 600000000000);
      unsigned int v15 = *((void *)WeakRetained + 3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100014210;
      block[3] = &unk_1000A8D60;
      void block[4] = WeakRetained;
      id v19 = v9;
      id v20 = *(id *)(a1 + 40);
      dispatch_after(v14, v15, block);
    }
  }
  else
  {
    uint64_t v16 = *(NSObject **)(*((void *)WeakRetained + 6) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No identifier returned. Error: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, id, void *))(v17 + 16))(v17, v10, v9);
  }
}

id sub_100014210(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100014330(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) data];

  uint64_t v3 = *(void **)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  if (v2)
  {
    unsigned int v5 = [v3 data];
    unint64_t v6 = [*(id *)(a1 + 32) msgType];
    unint64_t v7 = [*(id *)(a1 + 48) responseIdentifier];
    uint64_t v14 = 0;
    uint64_t v8 = (id *)&v14;
    uint64_t v9 = [v4 _rawSendData:v5 type:v6 responseIdentifier:v7 error:&v14];
  }
  else
  {
    unsigned int v5 = [v3 path];
    unint64_t v6 = [*(id *)(a1 + 32) msgType];
    unint64_t v7 = [*(id *)(a1 + 48) responseIdentifier];
    uint64_t v13 = 0;
    uint64_t v8 = (id *)&v13;
    uint64_t v9 = [v4 _rawSendFile:v5 type:v6 responseIdentifier:v7 error:&v13];
  }
  id v10 = (void *)v9;
  id v11 = *v8;

  uint64_t v12 = *(void *)(a1 + 64);
  if (v12) {
    (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v11, v10);
  }
}

uint64_t sub_100014760(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_100014778(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_100014BC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_100014BDC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_100015568(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_1000C6B58;
  qword_1000C6B58 = (uint64_t)v1;

  [(id)qword_1000C6B58 setDateFormat:@"yyyyMMdd/HHmm"];
  id v3 = +[NSTimeZone systemTimeZone];
  [(id)qword_1000C6B58 setTimeZone:v3];
}

void sub_100015B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015B48(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 fetchInteger];
  }

  return 0;
}

id sub_100015C54(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindInteger:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

id sub_100015D7C(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = a2;
  [v4 bindInteger:v3];
  [v4 bindInteger:a1[6]];
  [v4 bindString:a1[4]];
  id v5 = [v4 step];

  return v5;
}

void sub_100015EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015EE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    [v3 fetchDouble];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }

  return 0;
}

id sub_100015FF8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindDouble:*(double *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

void sub_100016198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000161B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000161C0(uint64_t a1)
{
}

uint64_t sub_1000161C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    uint64_t v4 = [v3 fetchString];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 0;
}

id sub_100016300(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindString:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

void sub_1000164A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000164B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    uint64_t v4 = [v3 fetchBlob];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 0;
}

id sub_1000165F0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindBlob:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

id sub_1000166F8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 bindString:v2];
  id v4 = [v3 step];

  return v4;
}

BOOL sub_1000169F8(uint64_t a1, uint64_t a2)
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
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 16;
LABEL_21:
        uint64_t v14 = *(void **)(a1 + v13);
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
    uint64_t v12 = PBReaderReadString();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

__CFString *sub_10001750C(void *a1)
{
  id v1 = a1;
  if (qword_1000C6B70 != -1) {
    dispatch_once(&qword_1000C6B70, &stru_1000A8FA8);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6B78);
  if (qword_1000C6B80 != -1) {
    dispatch_once(&qword_1000C6B80, &stru_1000A8FC8);
  }
  id v2 = (id)qword_1000C6B88;
  id v3 = [v2 objectForKey:v1];
  if (!v3)
  {
    uint64_t v4 = [(id)qword_1000C6B68 stringFromDate:v1];
    if (v4)
    {
      id v3 = (__CFString *)v4;
      [v2 setObject:v4 forKey:v1];
    }
    else
    {
      id v3 = @"00000000/0000";
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6B78);

  return v3;
}

void sub_100017618(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_1000C6B68;
  qword_1000C6B68 = v1;

  [(id)qword_1000C6B68 setDateFormat:@"yyyyMMdd/HHmm"];
  id v3 = +[NSTimeZone systemTimeZone];
  [(id)qword_1000C6B68 setTimeZone:v3];
}

void sub_10001769C(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  id v2 = (void *)qword_1000C6B88;
  qword_1000C6B88 = (uint64_t)v1;

  id v3 = (void *)qword_1000C6B88;

  [v3 setCountLimit:25];
}

uint64_t sub_1000176EC()
{
  if (qword_1000C6B98 != -1) {
    dispatch_once(&qword_1000C6B98, &stru_1000A8FE8);
  }
  return byte_1000C6B90;
}

void sub_100017730(id a1)
{
  id v1 = +[NSFileManager defaultManager];
  byte_1000C6B90 = [v1 fileExistsAtPath:@"/System/Library/LaunchDaemons/com.apple.SpringBoard.plist"] ^ 1;
}

id sub_100017E7C(uint64_t a1)
{
  v9[0] = @"onlyOnPhone";
  id v2 = [*(id *)(a1 + 32) phoneOnlyOccurrences];
  id v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  v10[0] = v3;
  v9[1] = @"onlyOnWatch";
  uint64_t v4 = [*(id *)(a1 + 32) watchOnlyOccurrences];
  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
  v10[1] = v5;
  v9[2] = @"total";
  unint64_t v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) totalDrift]);
  v10[2] = v6;
  unint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id sub_100018068(uint64_t a1)
{
  v8[0] = @"sources";
  id v2 = [*(id *)(a1 + 32) duplicatedSources];
  id v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  v8[1] = @"calendars";
  v9[0] = v3;
  uint64_t v4 = [*(id *)(a1 + 32) duplicatedCalendars];
  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
  v9[1] = v5;
  unint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void sub_1000181A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100019140(id *a1)
{
  id v2 = a1 + 4;
  id v3 = [a1[4] attributes];
  unsigned int v4 = [v3 isLocalStore];

  if (v4)
  {
    uint64_t v5 = [a1[5] localSource];
LABEL_5:
    id v8 = (id)v5;
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  unint64_t v6 = [*v2 attributes];
  unsigned int v7 = [v6 isBirthdayStore];

  if (v7)
  {
    uint64_t v5 = [a1[5] localBirthdayCalendarSource];
    goto LABEL_5;
  }
  char v28 = [a1[4] attributes];
  uint64_t v9 = [v28 accountPersistentID];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  char v29 = [a1[5] eventSources];
  id v8 = [v29 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v8)
  {
    uint64_t v30 = *(void *)v60;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v60 != v30) {
          objc_enumerationMutation(v29);
        }
        unint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        char v33 = [v32 sourceIdentifier];
        unsigned int v34 = [v33 isEqualToString:v9];

        if (v34)
        {
          id v8 = v32;
          goto LABEL_34;
        }
      }
      id v8 = [v29 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_34:

  unsigned int v40 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = *v2;
    unint64_t v42 = v40;
    char v43 = [v41 attributes];
    char v44 = [v43 accountPersistentID];
    *(_DWORD *)buf = 138543618;
    id v64 = v44;
    __int16 v65 = 2048;
    id v66 = v8;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Fetched source via ID %{public}@ and got source:%p", buf, 0x16u);
  }
LABEL_6:
  if (([v8 allowsEvents] & 1) == 0)
  {
    if ([v8 allowsTasks])
    {
      uint64_t v10 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NOT zapping source though I really feel like I should.", buf, 2u);
      }
    }
  }
  id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *v2;
    *(_DWORD *)buf = 138543618;
    id v64 = v12;
    __int16 v65 = 2048;
    id v66 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Create or update source: %{public}@, source:%p", buf, 0x16u);
  }
  if (!v8)
  {
    uint64_t v17 = [*v2 attributes];
    unsigned __int8 v18 = [v17 allowsEvents];

    if (v18)
    {
      id v19 = [*v2 attributes];
      unsigned __int8 v20 = [v19 isLocalStore];

      uint64_t v21 = *(NSObject **)(qword_1000C6CA8 + 8);
      if ((v20 & 1) == 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Creating non-local source", buf, 2u);
        }
        id v8 = [a1[6] _createSourceForWrapper:a1[4] store:a1[5]];
        id v48 = a1[5];
        id v57 = 0;
        [v48 saveSource:v8 commit:1 error:&v57];
        id v15 = v57;
        char v49 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (!v15)
        {
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v55 = v49;
            uint64_t v56 = [v8 sourceIdentifier];
            *(_DWORD *)buf = 138543362;
            id v64 = v56;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "New source (%{public}@) saved successfully.", buf, 0xCu);
          }
          id v15 = 0;
LABEL_46:
          if (!v8) {
            goto LABEL_50;
          }
          goto LABEL_47;
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_10006CC78();
        }
LABEL_44:
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
          sub_10006CBE0();
        }
        goto LABEL_46;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10006CB70((uint64_t)v2, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      unsigned int v35 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = *v2;
        unint64_t v37 = v35;
        char v38 = [v36 attributes];
        char v39 = [v38 accountPersistentID];
        *(_DWORD *)buf = 138543362;
        id v64 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No need to create source since the source [%{public}@] doesn't exist in database and the source wrapper has allowsEvents=NO", buf, 0xCu);
      }
    }
    id v15 = 0;
    id v8 = 0;
    goto LABEL_50;
  }
  if ([a1[6] _updateSource:v8 withSourceWrapper:a1[4] store:a1[5]])
  {
    id v14 = a1[5];
    id v58 = 0;
    [v14 saveSource:v8 commit:1 error:&v58];
    id v15 = v58;
    uint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10006CD10();
      }
      goto LABEL_44;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = v16;
      uint64_t v46 = [v8 sourceIdentifier];
      *(_DWORD *)buf = 138543362;
      id v64 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Updated source (%{public}@) saved successfully.", buf, 0xCu);
    }
  }
  id v15 = 0;
LABEL_47:
  unsigned int v50 = [v8 objectID];
  unsigned __int8 v51 = [v50 isTemporary];

  if ((v51 & 1) == 0 && v9)
  {
    unint64_t v52 = [a1[6] environment];
    char v53 = [v52 recordMap];
    char v54 = [v8 objectID];
    [v53 setIdentifier:v9 masterRowID:-1 summary:0 location:0 startTime:v54 forRecordID:0.0];
  }
LABEL_50:
}

uint64_t sub_100019984(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019994(uint64_t a1)
{
}

void sub_10001999C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributes];

  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    unsigned int v4 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Update calendar: %{public}@", buf, 0xCu);
      }
      if ([*(id *)(a1 + 40) _updateCalendar:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withCalendarWrapper:*(void *)(a1 + 32)])
      {
        id v8 = *(void **)(a1 + 48);
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v15 = 0;
        [v8 saveCalendar:v9 commit:1 error:&v15];
        id v10 = v15;
        if (v10)
        {
          id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_10006CDEC(a1, (uint64_t)v10, v11);
          }
        }
      }
    }
    else
    {
      if (v5)
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Create calendar: %{public}@", buf, 0xCu);
      }
      id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10006CDA8(v14);
      }
    }
  }
  else
  {
    id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sent calendarWrapper with no attributes, updating defaults.", buf, 2u);
    }
    [*(id *)(a1 + 40) _checkAndSetDefaultCalendar:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) calendarWrapper:*(void *)(a1 + 32) store:*(void *)(a1 + 48)];
  }
}

id sub_100019D0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUpdateWithICSWrappers:*(void *)(a1 + 40) store:*(void *)(a1 + 48) session:*(void *)(a1 + 56)];
}

id sub_100019E0C(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteSourceWithIdentifier:*(void *)(a1 + 40) store:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _deleteCalendarWithIdentifier:*(void *)(a1 + 40) store:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _deleteEventWithIdentifier:*(void *)(a1 + 40) calendarIdentifier:0 store:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _deleteReminderWithIdentifier:v3 calendarIdentifier:0 store:v4];
}

void sub_10001C1C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [*(id *)(a1 + 32) entityTypeForCalendarItemWithIdentifier:v3];
  if (v5)
  {
    int v6 = (int)v5;
    if (v5 == (id)1)
    {
      unsigned int v7 = [*(id *)(a1 + 40) environment];
      unsigned __int8 v8 = [v7 isReminderKitEnabled];

      if (v8)
      {
        uint64_t v9 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136446466;
          id v12 = "-[NEKEventStore _processUpdateFromWatch:calendar:store:]_block_invoke";
          __int16 v13 = 2114;
          id v14 = v3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", (uint8_t *)&v11, 0x16u);
        }
      }
      else
      {
        [*(id *)(a1 + 40) handleCalendarTaskWithUniqueIdentifierFromGizmo:v3 calendar:*(void *)(a1 + 48) wrapper:*(void *)(a1 + 32)];
      }
    }
    else
    {
      id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10006D36C(v6, v10);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) handleCalendarEventWithUniqueIdentifierFromGizmo:v3 calendar:*(void *)(a1 + 48) wrapper:*(void *)(a1 + 32) detachedEventMap:*(void *)(a1 + 56)];
  }
}

void sub_10001D77C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) containsObject:v3])
  {
    id v6 = [*(id *)(a1 + 48) entityTypeForCalendarItemWithIdentifier:v3];
    unsigned int v7 = [*(id *)(a1 + 56) calendarItemsWithUniqueIdentifier:v3 inCalendar:*(void *)(a1 + 64)];
    if (![v7 count])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006D4F8();
      }
      goto LABEL_22;
    }
    if ([v7 count] != (id)1)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006D5F8();
      }
      goto LABEL_22;
    }
    unsigned __int8 v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = v8;
    if (v6 == (id)1)
    {
      id v12 = [*(id *)(a1 + 72) environment];
      unsigned __int8 v13 = [v12 isReminderKitEnabled];

      if (v13)
      {
        id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          unsigned __int8 v20 = "-[NEKEventStore _deleteCalendarItemsInICSWrapperFromOldCalendar:store:]_block_invoke";
          __int16 v21 = 2114;
          uint64_t v22 = v3;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", buf, 0x16u);
        }
        id v10 = 0;
        goto LABEL_21;
      }
      id v15 = *(void **)(a1 + 56);
      id v17 = 0;
      [v15 removeReminder:v9 commit:0 error:&v17];
      id v10 = v17;
      if (!v10)
      {
LABEL_21:
        [*(id *)(a1 + 72) _removeIdentifierForDeletedEntity:v9];

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      id v10 = 0;
      if (v6) {
        goto LABEL_21;
      }
      int v11 = *(void **)(a1 + 56);
      id v18 = 0;
      [v11 removeEvent:v8 span:objc_msgSend(v8, "isMasterOrDetachedOccurrence") error:&v18];
      id v10 = v18;
      [*(id *)(a1 + 72) _deleteDetachedCalendarItemsFromOldCalendar:v9 deletedEvents:*(void *)(a1 + 32)];
      if (!v10) {
        goto LABEL_21;
      }
    }
    uint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006D560(v16);
    }
    goto LABEL_21;
  }
  uint64_t v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v20 = v3;
    __int16 v21 = 2114;
    uint64_t v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping deletion for event with identifier %{public}@ in calendar with identifier %{public}@, we already detected and deleted it as part of a recurring master's detached events", buf, 0x16u);
  }
LABEL_23:
}

void sub_10001DB68(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] eventStore];
  id v5 = [a1[5] entityTypeForCalendarItemWithIdentifier:v3];
  uint64_t v26 = v3;
  uint64_t v27 = (void *)v4;
  id v6 = (void *)v4;
  id v7 = v5;
  [v6 calendarItemsWithUniqueIdentifier:v3 inCalendar:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    id v28 = v7;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        unsigned __int8 v13 = [a1[4] objectID];
        id v14 = [v12 calendar];
        id v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 objectID];
          id v17 = (void *)v16;
          BOOL v18 = v13 != 0;
          if (v13 && v16)
          {
            if (([v13 isEqual:v16] & 1) == 0) {
              goto LABEL_20;
            }
            goto LABEL_34;
          }
          if (!v13 && v16) {
            goto LABEL_20;
          }
        }
        else
        {
          id v17 = 0;
          BOOL v18 = v13 != 0;
        }
        if (v18 && v17 == 0)
        {
          id v17 = 0;
LABEL_20:
          if (v7 != (id)1)
          {
            if (!v7)
            {
              uint64_t v31 = 0;
              unsigned __int8 v20 = (id *)&v31;
              [v27 removeEvent:v12 span:0 error:&v31];
              goto LABEL_29;
            }
            id v24 = 0;
LABEL_33:
            [a1[6] _removeIdentifierForDeletedEntity:v12];

            goto LABEL_34;
          }
          __int16 v21 = [a1[6] environment];
          unsigned __int8 v22 = [v21 isReminderKitEnabled];

          if (v22)
          {
            uint64_t v23 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              char v39 = "-[NEKEventStore _deleteCalendarItemsMovedToCalendar:inICSWrapper:]_block_invoke";
              __int16 v40 = 2114;
              id v41 = v26;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", buf, 0x16u);
            }
            id v24 = 0;
          }
          else
          {
            uint64_t v30 = 0;
            unsigned __int8 v20 = (id *)&v30;
            [v27 removeReminder:v12 commit:0 error:&v30];
            id v7 = v28;
LABEL_29:
            id v24 = *v20;
            if (!v24) {
              goto LABEL_33;
            }
            uint64_t v25 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10006D660(&v36, v25, v12, &v37);
            }
          }
          id v7 = v28;
          goto LABEL_33;
        }
LABEL_34:
      }
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v9);
  }
}

void sub_10001F274(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[9] objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 doubleValue];
    double v6 = v5;

    +[NSDate timeIntervalSinceReferenceDate];
    if (v6 > 0.0 && v6 < v7)
    {
      id v9 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleteing suppression cache entry for %@", (uint8_t *)&v11, 0xCu);
      }
      [v3[9] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
}

void sub_10001F4A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v5 = [*(id *)(a1 + 32) fetch:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [v5 owner];
    double v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectID];
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = [*(id *)(a1 + 40) updates];
        int v11 = [v7 objectID];
        unsigned __int8 v12 = [v10 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          unsigned __int8 v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = v13;
            id v15 = [v7 objectID];
            int v19 = 138543362;
            unsigned __int8 v20 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Surreptitiously adding event to changeset: %{public}@ due to attendee change", (uint8_t *)&v19, 0xCu);
          }
          uint64_t v16 = [*(id *)(a1 + 40) updates];
          id v17 = [v16 mutableCopy];

          BOOL v18 = [v7 objectID];
          [v17 addObject:v18];

          [*(id *)(a1 + 40) setUpdates:v17];
        }
      }
    }
  }
}

void sub_10001FE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10001FE5C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  double v7 = [*(id *)(a1 + 32) publicObjectWithObjectID:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 isHidden])
    {
      id v9 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = v9;
        int v11 = [v8 calendarIdentifier];
        int v28 = 138543362;
        char v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Skipping hidden calendar: %{public}@", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      unsigned __int8 v12 = [*(id *)(a1 + 40) wrapperForCalEntity:v8];
      if (v12)
      {
        if ([v8 isEqual:*(void *)(a1 + 48)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          [v12 setIsDefaultTaskCalendar:1];
          unsigned __int8 v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = *(void **)(a1 + 48);
            id v15 = v13;
            uint64_t v16 = sub_10002D3E0([v14 title]);
            id v17 = [*(id *)(a1 + 48) calendarIdentifier];
            int v28 = 138543618;
            char v29 = v16;
            __int16 v30 = 2114;
            uint64_t v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Marking default task calendar in wrapper to calendar with name %{public}@, identifier %{public}@", (uint8_t *)&v28, 0x16u);
          }
        }
        if ([v8 isEqual:*(void *)(a1 + 56)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
          [v12 setIsDefaultEventCalendar:1];
          BOOL v18 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = *(void **)(a1 + 56);
            unsigned __int8 v20 = v18;
            __int16 v21 = sub_10002D3E0([v19 title]);
            unsigned __int8 v22 = [*(id *)(a1 + 56) calendarIdentifier];
            int v28 = 138543618;
            char v29 = v21;
            __int16 v30 = 2114;
            uint64_t v31 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Marking default event calendar in wrapper to calendar with name %{public}@, identifier %{public}@", (uint8_t *)&v28, 0x16u);
          }
        }
        uint64_t v23 = [*(id *)(a1 + 40) recordMap];
        id v24 = [v23 identifierForRecordID:v6];

        uint64_t v25 = [v8 eks_compoundIdentifier];
        if (([v24 isEqualToString:v25] & 1) == 0)
        {
          uint64_t v26 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 138543618;
            char v29 = v24;
            __int16 v30 = 2114;
            uint64_t v31 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CalendarID remap detected: %{public}@ => %{public}@", (uint8_t *)&v28, 0x16u);
          }
          [v12 setOldCalendarIdentifier:v24];
        }
        if (([*(id *)(a1 + 64) push:v12] & 1) == 0) {
          *a4 = 1;
        }
      }
      else
      {
        uint64_t v27 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10006D7A4(v27);
        }
      }
    }
  }
}

void sub_100020490(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) fetch:v6];
  if (v8)
  {
    id v9 = objc_opt_new();
    uint64_t v10 = [v8 eventStore];
    if ([v6 entityType] == (id)2)
    {
      id v11 = v8;
      if ([v11 invitationStatus]
        && [*(id *)(a1 + 40) eventInFuture:v11 inStore:v10])
      {
        unsigned __int8 v12 = [v11 uniqueId];
        if (v12)
        {
          [v9 addObject:v12];
        }
        else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
        {
          sub_10006D8A4();
        }

        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    if (((sub_1000176EC() & 1) != 0
       || (v13 | [*(id *)(a1 + 40) eventInWindow:v8 inStore:v10]) == 1)
      && sub_10000BC3C(v8)
      && [*(id *)(a1 + 48) shouldSendEntity:v8])
    {
      id v14 = *(void **)(a1 + 56);
      id v15 = +[NEKICSWrapper wrapperForCalendarItem:v8 needsInvite:v9 eventStore:0];
      LOBYTE(v14) = [v14 push:v15];

      if (v14) {
        [*(id *)(a1 + 48) updateRowMappingForEntity:v8];
      }
      else {
        *a4 = 1;
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006D83C();
  }
}

void sub_1000206B4(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v8 = [a1[4] fetch:v6];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 eventStore];
    if (([a1[5] hasRowMappingForEntity:v9] & 1) == 0 && (sub_1000176EC() & 1) == 0)
    {
      if ([v6 entityType] == (id)2)
      {
        id v11 = v9;
        if (([a1[6] eventInWindow:v11 inStore:v10] & 1) == 0
          && (![v11 invitationStatus]
           || ([a1[6] eventInFuture:v11 inStore:v10] & 1) == 0))
        {

          goto LABEL_29;
        }
      }
      else if ([v6 entityType] == (id)3)
      {
        unsigned __int8 v12 = [a1[5] environment];
        unsigned int v13 = [v12 isReminderKitEnabled];

        if (v13)
        {
          id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            long long v34 = "-[NEKEventStore ICSWrappersForChangeSet:pipe:]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder", buf, 0xCu);
          }
          goto LABEL_29;
        }
        if (![a1[6] eventInWindow:v9 inStore:v10]) {
          goto LABEL_29;
        }
      }
    }
    if ([a1[5] shouldSendEntity:v9])
    {
      id v15 = [a1[5] recordMap];
      uint64_t v16 = [v15 identifierForRecordID:v6];

      id v17 = [v9 eks_compoundIdentifier];
      BOOL v18 = v17;
      if (v17)
      {
        if (v16)
        {
          if (([v17 isEqualToString:v16] & 1) == 0)
          {
            int v19 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              long long v34 = v16;
              __int16 v35 = 2114;
              int v36 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CalendarItem remap detected: %{public}@ => %{public}@", buf, 0x16u);
            }
          }
        }
      }
      unsigned __int8 v20 = [a1[5] wrapperForCalEntity:v9];
      if (v20)
      {
        if (v16)
        {
          long long v32 = v10;
          __int16 v21 = [v16 componentsSeparatedByString:@"::"];
          if ([v21 count] == (id)2)
          {
            unsigned __int8 v22 = [v21 objectAtIndexedSubscript:0];
            [v20 setOldIdentifier:v22];

            uint64_t v23 = [v18 componentsSeparatedByString:@"::"];

            id v24 = [v23 objectAtIndexedSubscript:0];
            [v20 setNuevoIdentifier:v24];

            __int16 v21 = v23;
          }

          uint64_t v10 = v32;
        }
        if (([a1[7] push:v20] & 1) == 0) {
          *a4 = 1;
        }
      }

      goto LABEL_39;
    }
LABEL_29:
    if (os_variant_has_internal_diagnostics())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v25;
          [v9 eks_debugDesc];
          uint64_t v27 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          long long v34 = v27;
          int v28 = "Decided not to send event %@";
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
        }
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        __int16 v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (isKindOfClass)
        {
          if (v31)
          {
            uint64_t v26 = v30;
            [v9 eks_debugDesc];
            uint64_t v27 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            long long v34 = v27;
            int v28 = "Decided not to send reminder %@";
            goto LABEL_38;
          }
        }
        else if (v31)
        {
          uint64_t v26 = v30;
          uint64_t v27 = [v6 stringRepresentation];
          *(_DWORD *)buf = 138543362;
          long long v34 = v27;
          int v28 = "Decided not to send %{public}@";
          goto LABEL_38;
        }
      }
    }
LABEL_39:
  }
}

void sub_100022EA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100022EC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100022F00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100022F20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_100022F80()
{
  return v0;
}

void sub_100022F8C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

void sub_100022FAC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_100022FCC()
{
  return v0;
}

void sub_1000245E8(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    double v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Notification requested for drift or duplicates with error: %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = +[NEKEnvironment instance];
  uint64_t v5 = [v4 tinyStore];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setDoubleValue:@"diagnosticNotificationRequested" forKey:@"diagnosticNotificationRequested"];
}

void sub_100024D48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Notification didReceiveNotificationResponse to open URL [%@] with error: %@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) requestResetSync];
}

uint64_t sub_100025FB4(uint64_t a1, uint64_t a2)
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
        *(unsigned char *)(a1 + 44) |= 8u;
        unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v13 <= 0xFFFFFFFFFFFFFFF7 && v13 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v35 = 32;
        goto LABEL_64;
      case 2u:
        *(unsigned char *)(a1 + 44) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v35 = 8;
LABEL_64:
        *(void *)(a1 + v35) = v14;
        continue;
      case 3u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v21 = v20 + 1;
          if (v20 == -1 || v21 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if (v22 < 0)
            {
              v17 += 7;
              BOOL v10 = v18++ >= 9;
              if (v10)
              {
                uint64_t v19 = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_50:
        uint64_t v34 = 16;
        goto LABEL_55;
      case 4u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 4u;
        while (2)
        {
          uint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
            v19 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v10 = v24++ >= 9;
              if (v10)
              {
                uint64_t v19 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_54:
        uint64_t v34 = 24;
LABEL_55:
        *(void *)(a1 + v34) = v19;
        continue;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 44) |= 0x10u;
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
      uint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v32 = v31 + 1;
      if (v31 == -1 || v32 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32;
      v30 |= (unint64_t)(v33 & 0x7F) << v28;
      if ((v33 & 0x80) == 0) {
        goto LABEL_57;
      }
      v28 += 7;
      BOOL v10 = v29++ >= 9;
      if (v10)
      {
        uint64_t v30 = 0;
        goto LABEL_59;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_57:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v30 = 0;
    }
LABEL_59:
    *(unsigned char *)(a1 + 40) = v30 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000273C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1000273F4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v10 = [*(id *)(a1 + 32) isEqualToString:v8];

  if (v10)
  {
    [*((id *)WeakRetained + 2) synchronizeUserDefaultsDomain:@"com.apple.mobilecal" keys:v7];
    int v11 = *((void *)WeakRetained + 1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Synced prefs for keys %{public}@", (uint8_t *)&v12, 0xCu);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_1000276BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(int *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  [v4 bindInteger:v3];
  [v4 bindInteger:*(int *)(*(void *)(a1 + 32) + 4)];
  [v4 bindInteger:*(int *)(*(void *)(a1 + 32) + 12)];
  [v4 bindInteger:**(int **)(a1 + 32)];
  [v4 step];

  return 0;
}

uint64_t sub_1000278E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindInteger:*(int *)(a1 + 40)];
  if ([v3 step] == 100)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = [v3 fetchInteger];
    *(_DWORD *)(*(void *)(a1 + 32) + 4) = [v3 fetchInteger];
    unsigned int v4 = [v3 fetchInteger];
    unsigned int v5 = *(_DWORD **)(a1 + 32);
  }
  else
  {
    unsigned int v4 = 0;
    unsigned int v5 = *(_DWORD **)(a1 + 32);
    v5[1] = 0;
    v5[2] = 0;
  }
  v5[3] = v4;

  return 0;
}

uint64_t sub_1000279E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(int *)(a1 + 32);
  id v3 = a2;
  [v3 bindInteger:v2];
  [v3 step];

  return 0;
}

void sub_100027B24(id a1)
{
  id v1 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_1000C6BB0 = (uint64_t)v1;
  if (v1)
  {
    uint64_t v2 = (uint64_t (*)())dlsym(v1, "WriteStackshotReport");
    if (v2) {
      id v3 = v2;
    }
    else {
      id v3 = sub_100027BC0;
    }
    off_1000C6BA0 = v3;
    unsigned int v4 = (uint64_t (*)())dlsym((void *)qword_1000C6BB0, "SimulateCrash");
    if (v4) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = sub_100027BC0;
    }
  }
  else
  {
    unsigned int v5 = sub_100027BC0;
    off_1000C6BA0 = sub_100027BC0;
  }
  off_1000C6BA8 = v5;
}

uint64_t sub_100027BC0()
{
  return 1;
}

void sub_100027C1C(id a1)
{
  qword_1000C6BC8 = (uint64_t)os_log_create("com.apple.eventkitsyncd", "NEKServicesClient");

  _objc_release_x1();
}

id sub_1000283CC(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 _recvSetReminderKitReminderCompletedEndpoint:a2];
  }
  else {
    return [v3 _recvSetEventKitReminderCompletedEndpoint:a2];
  }
}

id sub_1000283E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recvSetParticipantStatusEndpoint:a2];
}

id sub_1000283F0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 _recvSetReminderKitAlarmSnoozeEndpoint:a2];
  }
  else {
    return [v3 _recvSetEventKitAlarmSnoozeEndpoint:a2];
  }
}

id sub_100028408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recvDeleteEventEndpoint:a2];
}

id sub_100028BB4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v33 = a3;
  id v34 = a4;
  char v9 = [v7 calendarsForEntityType:1];
  unsigned int v10 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        unint64_t v16 = [v15 title:v33];
        unsigned int v17 = [v16 isEqualToString:v8];

        if (v17) {
          [v10 addObject:v15];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v12);
  }

  unsigned int v18 = [v7 predicateForRemindersInCalendars:v10];
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  char v43 = sub_10002A934;
  char v44 = sub_10002A944;
  id v45 = 0;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002A94C;
  v35[3] = &unk_1000A93A8;
  id v20 = v33;
  id v36 = v20;
  id v21 = v34;
  id v37 = v21;
  char v39 = &v40;
  char v22 = v19;
  char v38 = v22;
  id v23 = [v7 fetchRemindersMatchingPredicate:v18 completion:v35];
  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v24 = v41[5];
  uint64_t v25 = *(id *)(qword_1000C6CA8 + 8);
  unint64_t v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_10002D3E0(v8);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      char v28 = [v41[5] eks_debugDesc];
      *(_DWORD *)buf = 138543618;
      id v51 = v27;
      __int16 v52 = 2114;
      char v53 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found reminder %{public}@:%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    sub_10002D3E0(v8);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = sub_10002D3E0(v20);
    sub_10006DFA0(v29, v30, buf, v26);
  }

  id v31 = (id)v41[5];
  _Block_object_dispose(&v40, 8);

  return v31;
}

void sub_100028F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028FB0(void *a1)
{
  id v5 = a1;
  id v1 = [v5 startDateComponents];

  if (!v1)
  {
    id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v3 = +[NSDate date];
    unsigned int v4 = [v2 components:126 fromDate:v3];
    [v5 setStartDateComponents:v4];
  }
}

void sub_100029920(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 title];
  unsigned int v4 = [*(id *)(a1 + 32) deleteEvent];
  id v5 = [v4 eventTitle];
  unsigned int v6 = [v3 isEqual:v5];

  if (v6)
  {
    id v7 = [v13 startDate];
    [v7 timeIntervalSince1970];
    double v9 = v8;
    unsigned int v10 = [*(id *)(a1 + 32) deleteEvent];
    [v10 eventStart];
    double v12 = v11;

    if (v9 == v12) {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
}

uint64_t sub_10002A934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002A944(uint64_t a1)
{
}

void sub_10002A94C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v11 = [v10 title];
        if (v11)
        {
          double v12 = (void *)v11;
          id v13 = [v10 title];
          unsigned int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

          if (v14) {
            [v4 addObject:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  if ((unint64_t)[v4 count] >= 2 && *(void *)(a1 + 40))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      id obj = v15;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          uint64_t v21 = [v20 externalID];
          if (v21)
          {
            char v22 = (void *)v21;
            id v23 = [v20 externalID];
            unsigned int v24 = [v23 isEqualToString:*(void *)(a1 + 40)];

            if (v24)
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v20);
              id v15 = obj;
              goto LABEL_26;
            }
          }
        }
        id v15 = obj;
        id v17 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    goto LABEL_26;
  }
  if ([v4 count] == (id)1)
  {
    uint64_t v25 = [v4 objectAtIndexedSubscript:0];
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(id *)(v26 + 40);
    *(void *)(v26 + 40) = v25;
LABEL_26:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10002ABE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10002AC18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10002AC44()
{
  return v0;
}

uint64_t sub_10002AC50()
{
  return v0;
}

void sub_10002BC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,int a22,__int16 a23,uint64_t a24)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002BD54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)WeakRetained[3];
  WeakRetained[3] = v2;

  unsigned int v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Post prefs observer init", v5, 2u);
  }
}

void sub_10002BDF0(uint64_t a1)
{
  [*(id *)(a1 + 32) _blockUntilUnlock];
  id v1 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "_blockUntilUnlock returned", v2, 2u);
  }
}

void sub_10002C12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C160(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  unsigned int v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning XPC transaction for com.apple.notifyd.matching notification named %{public}@", buf, 0xCu);
  }
  id v5 = (void *)os_transaction_create();
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained[2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C30C;
  block[3] = &unk_1000A9418;
  objc_copyWeak(&v14, v6);
  id v12 = v3;
  id v13 = v5;
  id v9 = v5;
  id v10 = v3;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
}

void sub_10002C30C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(a1 + 32) isEqualToString:@"_CalDatabaseChangedNotification"])
  {
    [WeakRetained _databaseChangedExternally];
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.reminderkit.storeChanged"])
  {
    if (qword_1000C6BD0 != -1) {
      dispatch_once(&qword_1000C6BD0, &stru_1000A93F0);
    }
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"IDS"])
  {
    id v3 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launched from IDS", buf, 2u);
    }
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"EventKitSyncTesting"])
  {
    unsigned int v4 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggering full sync for testing notification %{public}@", buf, 0xCu);
    }
    [WeakRetained _triggerFullSync];
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.eventkitsync.force"])
  {
    id v6 = [WeakRetained environment];
    id v7 = [v6 syncController];
    [v7 clearRetryState];
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.eventkitsync.zapversion"])
  {
    id v6 = [WeakRetained environment];
    id v7 = [v6 syncController];
    [v7 clearRemoteBuildVersion];
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.datamigrator.migrationDidFinish"])
  {
    id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Thinking about a migration sync.", buf, 2u);
    }
    [WeakRetained _triggerMigrationSync];
  }
  else
  {
    if ((sub_1000176EC() & 1) == 0
      && [*(id *)(a1 + 32) isEqualToString:@"SignificantTimeChangeNotification"])
    {
      uint64_t v11 = [NEKSyncWindow alloc];
      id v12 = [WeakRetained environment];
      id v13 = [v12 tinyStore];
      id v6 = [(NEKSyncWindow *)v11 initForFullSync:0 tinyStore:v13];

      LODWORD(v13) = [v6 shouldSyncBasedOnTime:CFAbsoluteTimeGetCurrent()];
      id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SignificantTimeChange incremental sync", buf, 2u);
        }
        [WeakRetained _triggerNightlySync];
      }
      else if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SignificantTimeChange ignored", buf, 2u);
      }
      goto LABEL_18;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"CalDefaultCalendarChangedNotification"])
    {
      id v6 = +[NSNotificationCenter defaultCenter];
      [v6 postNotificationName:@"NEKDefaultCalendarChanged" object:WeakRetained];
      goto LABEL_18;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.eventkitsync.analytics.flush"])
    {
      id v6 = [WeakRetained environment];
      id v7 = [v6 analytics];
      [v7 flush];
      goto LABEL_17;
    }
    id v16 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling pref observer for notification: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = WeakRetained[4];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002C88C;
    v19[3] = &unk_1000A8BB8;
    v19[4] = WeakRetained;
    id v20 = *(id *)(a1 + 32);
    dispatch_async(v18, v19);
  }
LABEL_19:
  uint64_t v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ending XPC transaction for com.apple.notifyd.matching notification named %{public}@", buf, 0xCu);
  }
}

void sub_10002C824(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:REMStoreDidChangeNotification object:0];
}

id sub_10002C88C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) handleDarwinNotificationOfName:*(void *)(a1 + 40)];
}

void sub_10002C898(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_get_state(v3) == 2)
  {
    uint64_t v5 = *(NSObject **)(qword_1000C6CB8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Analytics activity", v9, 2u);
    }
    id v6 = [WeakRetained environment];
    id v7 = [v6 analytics];
    [v7 flush];

    if (!xpc_activity_set_state(v3, 5))
    {
      uint64_t v8 = *(NSObject **)(qword_1000C6CB8 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10006E24C(v8);
      }
    }
  }
}

void sub_10002CB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002CB4C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] rebroadcastAllObservedNotifications];
  uint64_t v2 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Prefs synced.", v3, 2u);
  }
}

void sub_10002CD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002CD74(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] rebroadcastAllObservedNotifications];
  uint64_t v2 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Prefs synced.", v3, 2u);
  }
}

void -[NEKDaemon _blockUntilUnlock](NEKDaemon *self, SEL a2)
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  int out_token = 0;
  unsigned int v4 = dispatch_get_global_queue(0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002D214;
  handler[3] = &unk_1000A9468;
  uint64_t v5 = v3;
  uint64_t v18 = v5;
  uint32_t v6 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v4, handler);

  if (v6)
  {
    id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006E290(v7);
    }
  }
  else
  {
    if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1) {
      dispatch_semaphore_signal(v5);
    }
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    notify_cancel(out_token);
  }
  uint64_t v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Protected data available.", v16, 2u);
  }
  uint64_t v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating sync controller", v16, 2u);
  }
  id v10 = [NEKSyncController alloc];
  uint64_t v11 = [(NEKDaemon *)self environment];
  id v12 = [(NEKSyncController *)v10 initWithEnvironment:v11];

  id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Assigning sync controller", v16, 2u);
  }
  id v14 = [(NEKDaemon *)self environment];
  [v14 setSyncController:v12];

  BOOL v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting sync controller", v16, 2u);
  }
  [(NEKSyncController *)v12 start];
}

intptr_t sub_10002D214(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFString *sub_10002D3E0(void *a1)
{
  if (byte_1000C6BD8)
  {
    if (a1)
    {
      id v1 = a1;
      CFTypeID v2 = CFGetTypeID(v1);
      if (v2 == CFNumberGetTypeID())
      {
        if (qword_1000C6BE8 != -1) {
          dispatch_once(&qword_1000C6BE8, &stru_1000A9488);
        }
        StringWithNumber = (void *)CFNumberFormatterCreateStringWithNumber(0, (CFNumberFormatterRef)qword_1000C6BE0, (CFNumberRef)v1);
      }
      else
      {
        StringWithNumber = [v1 description];
      }
      uint64_t v5 = StringWithNumber;
      if (StringWithNumber)
      {
        sub_10002D514(StringWithNumber);
        unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned int v4 = @"[VOID]";
      }
    }
    else
    {
      unsigned int v4 = 0;
    }
  }
  else
  {
    unsigned int v4 = a1;
  }

  return v4;
}

void sub_10002D4E4(id a1)
{
  CFLocaleRef System = CFLocaleGetSystem();
  qword_1000C6BE0 = (uint64_t)CFNumberFormatterCreate(0, System, kCFNumberFormatterNoStyle);
}

__CFString *sub_10002D514(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (+[NDTLog obfuscate])
    {
      CFTypeID v2 = (const char *)[v1 UTF8String];
      uInt v3 = strlen(v2);
      unsigned int v4 = +[NSString stringWithFormat:@">%08x<", crc32(0, (const Bytef *)v2, v3)];
    }
    else
    {
      unsigned int v4 = (__CFString *)v1;
    }
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = @"(nil)";
  }

  return v5;
}

void *sub_10002F820(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F8F0;
  v7[3] = &unk_1000A94B0;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v4 = v3;
  uint64_t v5 = objc_retainBlock(v7);

  return v5;
}

void sub_10002F8F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 entityType] == (id)6)
  {
    uint64_t v4 = [*(id *)(a1 + 32) identifierInRowMappingForRecordIDRef:v3];
    uint64_t v5 = [*(id *)(a1 + 40) ekEventStore];
    uint64_t v6 = [v5 publicObjectWithObjectID:v3];

    if (v6
      || ([*(id *)(a1 + 40) ekEventStore],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 sourceWithExternalID:v4],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v7,
          v4 | v6))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10006E628((uint64_t)v3, v8);
      }
    }
  }
}

void *sub_10002FA14(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FAD0;
  v7[3] = &unk_1000A9500;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = objc_retainBlock(v7);

  return v5;
}

void sub_10002FAD0(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 entityName];
  id v4 = +[REMAccount cdEntityName];
  unsigned int v5 = [v3 isEqualToString:v4];

  uint64_t v6 = v14;
  if (v5)
  {
    id v7 = [v14 uuid];
    id v8 = [v7 UUIDString];

    id v9 = +[REMAccount localAccountID];
    unsigned int v10 = [v14 isEqual:v9];

    uint64_t v11 = [*(id *)(a1 + 32) ekEventStore];
    id v12 = v11;
    if (v10) {
      [v11 localSource];
    }
    else {
    id v13 = [v11 sourceWithExternalID:v8];
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v6 = v14;
  }
}

void sub_10002FC10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Source with ID %{public}@ (%@) updated. Going to send wrapper for this source.", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 32) addObject:v6];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006E6A0((uint64_t)v5, v7);
  }
}

void sub_10002FD28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138543618;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EKSource %{public}@ (%@) is still available due to one of the event/reminder dataclass still enabled. Treating this as an update to send wrapper for dataclass updates.", (uint8_t *)&v11, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = v6;
  }
  else
  {
    if (v8)
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleted source/account %{public}@ is not available anymore. Going to send delete wrapper for this source", (uint8_t *)&v11, 0xCu);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = v5;
  }
  [v9 addObject:v10];
}

id sub_1000300B4()
{
  if (qword_1000C6BF0 != -1) {
    dispatch_once(&qword_1000C6BF0, &stru_1000A9598);
  }
  uint64_t v0 = (void *)qword_1000C6BF8;

  return v0;
}

void sub_100030E48(id a1)
{
  qword_1000C6BF8 = (uint64_t)os_log_create("com.apple.eventkitsync", "syncWindow");

  _objc_release_x1();
}

void sub_10003126C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100031284(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 step] == 100) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 fetchInteger];
  }

  return 0;
}

void sub_100031564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100031588(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100031598(uint64_t a1)
{
}

uint64_t sub_1000315A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindInteger:[*(id *)(a1 + 32) entityType]];
  [v3 bindInteger:[*(id *)(a1 + 32) rowID]];
  [v3 bindInteger:[*(id *)(a1 + 32) databaseID]];
  if ([v3 step] == 100)
  {
    uint64_t v4 = [v3 fetchString];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 0;
}

id sub_10003181C(void *a1)
{
  id v1 = a1;
  if (v1) {
    CFTypeID v2 = v1;
  }
  else {
    CFTypeID v2 = &stru_1000AB888;
  }
  id v3 = [(__CFString *)v2 dataUsingEncoding:4];
  CC_SHA256([v3 bytes], (CC_LONG)[v3 length], md);
  uint64_t v4 = +[NSData dataWithBytes:md length:32];
  uint64_t v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

id sub_10003190C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 bindInteger:[v3 entityType]];
  [v4 bindInteger:[*(id *)(a1 + 32) rowID]];
  [v4 bindInteger:[*(id *)(a1 + 32) databaseID]];
  [v4 bindString:*(void *)(a1 + 40)];
  [v4 bindInteger:time(0)];
  [v4 bindInteger:*(void *)(a1 + 64)];
  [v4 bindString:*(void *)(a1 + 48)];
  [v4 bindString:*(void *)(a1 + 56)];
  [v4 bindDouble:*(double *)(a1 + 72)];
  id v5 = [v4 step];

  return v5;
}

void sub_100031BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100031BF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindInteger:[*(id *)(a1 + 32) entityType]];
  [v3 bindInteger:[*(id *)(a1 + 32) rowID]];
  [v3 bindInteger:[*(id *)(a1 + 32) databaseID]];
  if ([v3 step] == 100)
  {
    id v4 = [v3 fetchString];
    id v5 = [v3 fetchString];
    [v3 fetchDouble];
    double v7 = v6;
    BOOL v8 = ![v4 isEqual:*(void *)(a1 + 40)]
      || ![v5 isEqual:*(void *)(a1 + 48)]
      || v7 != *(double *)(a1 + 64);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  }
  return 0;
}

uint64_t sub_100031DA4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 bindInteger:[v3 entityType]];
  [v4 bindInteger:[*(id *)(a1 + 32) rowID]];
  [v4 bindInteger:[*(id *)(a1 + 32) databaseID]];
  [v4 step];

  return 0;
}

uint64_t sub_100031F58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 step] == 100)
  {
    *(void *)&long long v4 = 67110146;
    long long v13 = v4;
    do
    {
      id v5 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        double v6 = v5;
        unsigned int v7 = [v3 fetchInteger];
        unsigned int v8 = [v3 fetchInteger];
        unsigned int v9 = [v3 fetchInteger];
        id v10 = [v3 fetchString];
        unsigned int v11 = [v3 fetchInteger];
        *(_DWORD *)buf = v13;
        unsigned int v15 = v7;
        __int16 v16 = 1024;
        unsigned int v17 = v8;
        __int16 v18 = 1024;
        unsigned int v19 = v9;
        __int16 v20 = 2114;
        uint64_t v21 = v10;
        __int16 v22 = 1024;
        unsigned int v23 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "eT:%d eR:%d eD:%d id:%{public}@ m:%d", buf, 0x24u);
      }
    }
    while ([v3 step:v13] == 100);
  }

  return 0;
}

void sub_100032190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000321A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 step] == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 fetchInteger];
  }

  return 0;
}

uint64_t sub_100032444(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
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
        if (v10) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = (v6 & 7) == 4;
        }
        if (!v11)
        {
          switch((v6 >> 3))
          {
            case 1u:
              char v12 = 0;
              unsigned int v13 = 0;
              uint64_t v14 = 0;
              *(unsigned char *)(a1 + 36) |= 1u;
              break;
            case 2u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 8;
              goto LABEL_30;
            case 3u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 24;
              goto LABEL_30;
            case 4u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 16;
LABEL_30:
              __int16 v20 = *(void **)(a1 + v19);
              *(void *)(a1 + v19) = v18;

              goto LABEL_35;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_35:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
          }
          while (1)
          {
            unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
            v14 |= (unint64_t)(v16 & 0x7F) << v12;
            if ((v16 & 0x80) == 0) {
              goto LABEL_32;
            }
            v12 += 7;
            BOOL v9 = v13++ >= 9;
            if (v9)
            {
              uint64_t v14 = 0;
              goto LABEL_34;
            }
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v14 = 0;
          }
LABEL_34:
          *(unsigned char *)(a1 + 32) = v14 != 0;
          goto LABEL_35;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100032FC0(id a1)
{
  qword_1000C6C08 = [[NDTObjectCache alloc] initWithCapacity:50];

  _objc_release_x1();
}

uint64_t sub_100033B48(uint64_t a1, uint64_t a2)
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
        uint64_t v13 = 64;
        goto LABEL_62;
      case 2u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(_WORD *)(a1 + 88) |= 1u;
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
                goto LABEL_129;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_129:
        uint64_t v85 = 40;
        goto LABEL_134;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v17 = 0;
        *(_WORD *)(a1 + 88) |= 2u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v17 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              BOOL v9 = v21++ >= 9;
              if (v9)
              {
                LODWORD(v17) = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_133:
        uint64_t v85 = 72;
LABEL_134:
        *(_DWORD *)(a1 + v85) = v17;
        continue;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(_WORD *)(a1 + 88) |= 0x40u;
        while (2)
        {
          unint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v27 == -1 || v27 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v9 = v25++ >= 9;
              if (v9)
              {
                uint64_t v26 = 0;
                goto LABEL_138;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v26 = 0;
        }
LABEL_138:
        BOOL v86 = v26 != 0;
        uint64_t v87 = 80;
        goto LABEL_183;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(_WORD *)(a1 + 88) |= 0x80u;
        while (2)
        {
          unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v9 = v30++ >= 9;
              if (v9)
              {
                uint64_t v31 = 0;
                goto LABEL_142;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v31 = 0;
        }
LABEL_142:
        BOOL v86 = v31 != 0;
        uint64_t v87 = 81;
        goto LABEL_183;
      case 6u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 88) |= 0x2000u;
        while (2)
        {
          unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1 || v37 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v9 = v35++ >= 9;
              if (v9)
              {
                uint64_t v36 = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v36 = 0;
        }
LABEL_146:
        BOOL v86 = v36 != 0;
        uint64_t v87 = 87;
        goto LABEL_183;
      case 7u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 16;
        goto LABEL_62;
      case 8u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 48;
        goto LABEL_62;
      case 9u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 56;
        goto LABEL_62;
      case 0xAu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 24;
        goto LABEL_62;
      case 0xBu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
        goto LABEL_62;
      case 0xCu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
LABEL_62:
        char v39 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      case 0xDu:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v42 = 0;
        *(_WORD *)(a1 + 88) |= 0x1000u;
        while (2)
        {
          unint64_t v43 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v43 == -1 || v43 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v43);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v43 + 1;
            v42 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v9 = v41++ >= 9;
              if (v9)
              {
                uint64_t v42 = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v42 = 0;
        }
LABEL_150:
        BOOL v86 = v42 != 0;
        uint64_t v87 = 86;
        goto LABEL_183;
      case 0xEu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(_WORD *)(a1 + 88) |= 0x10u;
        while (2)
        {
          unint64_t v48 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v48 == -1 || v48 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v48 + 1;
            v47 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v9 = v46++ >= 9;
              if (v9)
              {
                uint64_t v47 = 0;
                goto LABEL_154;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v47 = 0;
        }
LABEL_154:
        BOOL v86 = v47 != 0;
        uint64_t v87 = 78;
        goto LABEL_183;
      case 0xFu:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v52 = 0;
        *(_WORD *)(a1 + 88) |= 8u;
        while (2)
        {
          unint64_t v53 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v53 == -1 || v53 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v53);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v53 + 1;
            v52 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v9 = v51++ >= 9;
              if (v9)
              {
                uint64_t v52 = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v52 = 0;
        }
LABEL_158:
        BOOL v86 = v52 != 0;
        uint64_t v87 = 77;
        goto LABEL_183;
      case 0x10u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v57 = 0;
        *(_WORD *)(a1 + 88) |= 4u;
        while (2)
        {
          unint64_t v58 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v58 == -1 || v58 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v58);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v58 + 1;
            v57 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              BOOL v9 = v56++ >= 9;
              if (v9)
              {
                uint64_t v57 = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v57 = 0;
        }
LABEL_162:
        BOOL v86 = v57 != 0;
        uint64_t v87 = 76;
        goto LABEL_183;
      case 0x11u:
        char v60 = 0;
        unsigned int v61 = 0;
        uint64_t v62 = 0;
        *(_WORD *)(a1 + 88) |= 0x200u;
        while (2)
        {
          unint64_t v63 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v63 == -1 || v63 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v63);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v63 + 1;
            v62 |= (unint64_t)(v64 & 0x7F) << v60;
            if (v64 < 0)
            {
              v60 += 7;
              BOOL v9 = v61++ >= 9;
              if (v9)
              {
                uint64_t v62 = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v62 = 0;
        }
LABEL_166:
        BOOL v86 = v62 != 0;
        uint64_t v87 = 83;
        goto LABEL_183;
      case 0x12u:
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v67 = 0;
        *(_WORD *)(a1 + 88) |= 0x400u;
        while (2)
        {
          unint64_t v68 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v68 == -1 || v68 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v68);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v68 + 1;
            v67 |= (unint64_t)(v69 & 0x7F) << v65;
            if (v69 < 0)
            {
              v65 += 7;
              BOOL v9 = v66++ >= 9;
              if (v9)
              {
                uint64_t v67 = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v67 = 0;
        }
LABEL_170:
        BOOL v86 = v67 != 0;
        uint64_t v87 = 84;
        goto LABEL_183;
      case 0x13u:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v72 = 0;
        *(_WORD *)(a1 + 88) |= 0x800u;
        while (2)
        {
          unint64_t v73 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v73 == -1 || v73 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v73);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v73 + 1;
            v72 |= (unint64_t)(v74 & 0x7F) << v70;
            if (v74 < 0)
            {
              v70 += 7;
              BOOL v9 = v71++ >= 9;
              if (v9)
              {
                uint64_t v72 = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v72 = 0;
        }
LABEL_174:
        BOOL v86 = v72 != 0;
        uint64_t v87 = 85;
        goto LABEL_183;
      case 0x14u:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v77 = 0;
        *(_WORD *)(a1 + 88) |= 0x100u;
        while (2)
        {
          unint64_t v78 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v78 == -1 || v78 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v78);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v78 + 1;
            v77 |= (unint64_t)(v79 & 0x7F) << v75;
            if (v79 < 0)
            {
              v75 += 7;
              BOOL v9 = v76++ >= 9;
              if (v9)
              {
                uint64_t v77 = 0;
                goto LABEL_178;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v77 = 0;
        }
LABEL_178:
        BOOL v86 = v77 != 0;
        uint64_t v87 = 82;
        goto LABEL_183;
      case 0x15u:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        *(_WORD *)(a1 + 88) |= 0x20u;
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
      unint64_t v83 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v83 == -1 || v83 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v84 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v83);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v83 + 1;
      v82 |= (unint64_t)(v84 & 0x7F) << v80;
      if ((v84 & 0x80) == 0) {
        goto LABEL_180;
      }
      v80 += 7;
      BOOL v9 = v81++ >= 9;
      if (v9)
      {
        uint64_t v82 = 0;
        goto LABEL_182;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_180:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v82 = 0;
    }
LABEL_182:
    BOOL v86 = v82 != 0;
    uint64_t v87 = 79;
LABEL_183:
    *(unsigned char *)(a1 + v87) = v86;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100035FBC(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  CFTypeID v2 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 24))
  {
    double v3 = 1.0 - (WeakRetained[5] - CFAbsoluteTimeGetCurrent()) / WeakRetained[4];
    if (v3 <= 1.0)
    {
      if (v3 - v2[6] >= 0.02)
      {
        char v4 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 134217984;
          double v7 = v3 * 100.0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lying about progress: %0.2f%%", (uint8_t *)&v6, 0xCu);
        }
        unsigned int v5 = [v2 session];
        [v5 reportProgress:v3];

        v2[6] = v3;
      }
    }
    else
    {
      [v2 _doneForRealNotifyingPairedSync:1];
    }
  }
}

CFAbsoluteTime sub_100036104(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = *(void *)(a1 + 32);
  CFAbsoluteTime result = Current + *(double *)(v3 + 32);
  *(CFAbsoluteTime *)(v3 + 40) = result;
  return result;
}

uint64_t sub_1000361AC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 1;
  return result;
}

uint64_t sub_100036230(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

id sub_1000362B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doneForRealNotifyingPairedSync:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t sub_1000369A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) start];
  [v3 bindDouble:];
  [*(id *)(a1 + 32) end];
  [v3 bindDouble:];
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:100];
  while ([v3 step] == 100)
  {
    unsigned int v5 = [v3 fetchString];
    int v6 = [v3 fetchString];
    [v3 fetchDouble];
    double v8 = v7;
    BOOL v9 = objc_alloc_init(NEKPBItemOccurrence);
    [(NEKPBItemOccurrence *)v9 setUuid:v5];
    [(NEKPBItemOccurrence *)v9 setCalendar:v6];
    [(NEKPBItemOccurrence *)v9 setDate:v8];
    [v4 addObject:v9];
  }
  [*(id *)(a1 + 32) setItems:v4];

  return 0;
}

void sub_100036E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036E40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036E50(uint64_t a1)
{
}

uint64_t sub_100036E58(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a3 UUIDString];

  return _objc_release_x1();
}

void sub_100036FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100036FBC(uint64_t a1, void *a2)
{
}

uint64_t sub_10003720C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4) {
    return qword_10009BA68[a1 - 1];
  }
  id v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10006E940(a1, v3);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

id sub_100037288(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = v1;
  if (!v1)
  {
LABEL_9:
    int v6 = 0;
    goto LABEL_13;
  }
  unsigned int v3 = [v1 hasSuffix:@".plist"];
  if (![v2 hasPrefix:@"/System/Library/PrivateFrameworks/CDDataAccess.framework"]
    || !v3)
  {
    if ([v2 hasPrefix:@"/System/Library/PrivateFrameworks/CDDataAccess.framework"])
    {
      if (!v3) {
        goto LABEL_7;
      }
    }
    else if (([v2 hasPrefix:@"/System/Library/PrivateFrameworks/ExchangeSync.framework"] & v3 & 1) == 0)
    {
LABEL_7:
      unsigned int v5 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10006E9B8((uint64_t)v2, v5);
      }
      goto LABEL_9;
    }
    CFStringRef v4 = @"/System/Library/PrivateFrameworks/ExchangeSync.framework";
    goto LABEL_12;
  }
  CFStringRef v4 = @"/System/Library/PrivateFrameworks/CDDataAccess.framework";
LABEL_12:
  int v6 = [v2 stringByReplacingOccurrencesOfString:v4 withString:@"/System/Library/PrivateFrameworks/DataAccess.framework"];
LABEL_13:

  return v6;
}

id sub_100037660(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10003773C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAccount:*(void *)(a1 + 40)];
}

uint64_t sub_100038D0C(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

void sub_100039858(id a1)
{
  qword_1000C6C18 = objc_alloc_init(NEKCapabilities);

  _objc_release_x1();
}

BOOL sub_10003A070(void *a1, uint64_t a2)
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
        uint64_t v12 = objc_alloc_init(NEKPBDuplicateSource);
        [a1 addSources:v12];
        if (!PBReaderPlaceMark() || !sub_1000169F8((uint64_t)v12, a2)) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = objc_alloc_init(NEKPBDuplicateCalendar);
    [a1 addCalendars:v12];
    if (!PBReaderPlaceMark() || !sub_10004EC18((uint64_t)v12, a2))
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10003AF08(uint64_t a1, void *a2, int a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003AFBC;
  v6[3] = &unk_1000A9738;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  int v9 = a3;
  [a2 enumerateObjectsUsingBlock:v6];
}

void sub_10003AFBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  id v6 = v3;
  unsigned int v5 = [v3 entityName];
  LODWORD(v4) = [v4 isEqualToString:v5];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10003B24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10003B268(id a1, EKObjectID *a2)
{
  return [(EKObjectID *)a2 entityType] == (id)1;
}

BOOL sub_10003B28C(id a1, EKObjectID *a2)
{
  CFTypeID v2 = a2;
  BOOL v3 = [(EKObjectID *)v2 entityType] == (id)101
    || [(EKObjectID *)v2 entityType] == (id)2
    || [(EKObjectID *)v2 entityType] == (id)3;

  return v3;
}

BOOL sub_10003B2EC(id a1, EKObjectID *a2)
{
  return [(EKObjectID *)a2 entityType] == (id)6;
}

BOOL sub_10003B310(id a1, EKObjectID *a2)
{
  return [(EKObjectID *)a2 entityType] == (id)7;
}

void sub_10003B334(void *a1, void *a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  char v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
        {
          id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Terminating enumeration early", (uint8_t *)v9, 2u);
          }
          goto LABEL_14;
        }
        if ((*(unsigned int (**)(void))(a1[4] + 16))()) {
          (*(void (**)(void))(a1[5] + 16))();
        }
      }
      unsigned int v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

void sub_10003BA3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 date];
  char v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  unsigned int v5 = [*(id *)(a1 + 32) stringFromDate:v4];
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [v3 uuid];
  id v8 = +[NSString stringWithFormat:@"%@ | %@", v5, v7];
  [v6 addObject:v8];

  int v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = v9;
    long long v11 = [v3 uuid];
    [v3 date];
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Analytics detected missing calendar item on watch, identifier: %{public}@, timestamp: %9.0f", buf, 0x16u);
  }
}

int64_t sub_10003BD74(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_10003BFB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10003C268(uint64_t a1)
{
  id WeakRetained = (sqlite3_stmt **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFTypeID v2 = WeakRetained;
    sqlite3_finalize(WeakRetained[3]);
    sqlite3_finalize(v2[4]);
    sqlite3_finalize(v2[6]);
    sqlite3_finalize(v2[5]);
    sqlite3_close(v2[2]);
    id WeakRetained = v2;
  }
}

BOOL sub_10003C54C(uint64_t a1, sqlite3_stmt **ppStmt, char *zSql)
{
  int v4 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 32), zSql, -1, ppStmt, 0);
  if (v4)
  {
    unsigned int v5 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006ED8C((uint64_t)zSql, v5);
    }
  }
  return v4 == 0;
}

void sub_10003C7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003C818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003C828(uint64_t a1)
{
}

uint64_t sub_10003C830(uint64_t a1)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 64), 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) == 100)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_double(*(sqlite3_stmt **)(a1 + 64), 0);
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_double(*(sqlite3_stmt **)(a1 + 64), 1);
    CFTypeID v2 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 64), 2);
    if (v2)
    {
      uint64_t v3 = +[NSString stringWithUTF8String:v2];
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      unsigned int v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 64));
  uint64_t v6 = *(sqlite3_stmt **)(a1 + 64);

  return sqlite3_clear_bindings(v6);
}

void sub_10003CA78(uint64_t a1)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 1, *(const char **)(a1 + 48), -1, 0);
  sqlite3_bind_double(*(sqlite3_stmt **)(a1 + 40), 2, *(double *)(a1 + 56));
  sqlite3_bind_double(*(sqlite3_stmt **)(a1 + 40), 3, *(double *)(a1 + 64));
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 4, *(const char **)(a1 + 72), -1, 0);
  sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  CFTypeID v2 = *(void **)(a1 + 72);
  if (v2)
  {
    free(v2);
  }
}

uint64_t sub_10003CBF8(uint64_t a1)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 1, *(const char **)(a1 + 48), -1, 0);
  sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
  CFTypeID v2 = *(sqlite3_stmt **)(a1 + 40);

  return sqlite3_clear_bindings(v2);
}

uint64_t sub_10003CD0C(uint64_t a1)
{
  sqlite3_bind_double(*(sqlite3_stmt **)(a1 + 40), 1, *(double *)(a1 + 48));
  sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
  CFTypeID v2 = *(sqlite3_stmt **)(a1 + 40);

  return sqlite3_clear_bindings(v2);
}

void sub_10003D75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D774(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003D784(uint64_t a1)
{
}

uint64_t sub_10003D78C(uint64_t a1, void *a2)
{
  return 1;
}

void sub_10003F30C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

id sub_10003F32C(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) entityTypeForCalendarItemWithIdentifier:a2];
  uint64_t v4 = 1;
  if (result) {
    uint64_t v4 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v4;
  return result;
}

void sub_1000405CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000405E8(uint64_t a1)
{
  CFTypeID v2 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Locking session idle queue.", v3, 2u);
  }
  dispatch_suspend(*(dispatch_object_t *)(a1 + 32));
}

id sub_10004109C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) setNeedsFullSync];
  **(_WORD **)(a1 + 40) = 0;
  return result;
}

id sub_1000410CC()
{
  if (qword_1000C6C28 != -1) {
    dispatch_once(&qword_1000C6C28, &stru_1000A9A68);
  }
  uint64_t v0 = (void *)qword_1000C6C30;

  return v0;
}

void sub_10004273C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v36 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100042778()
{
  if (qword_1000C6C38 != -1) {
    dispatch_once(&qword_1000C6C38, &stru_1000A9A88);
  }
  uint64_t v0 = (void *)qword_1000C6C40;

  return v0;
}

id sub_1000427CC(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000427F8(uint64_t a1)
{
}

void sub_100042800(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = &stru_1000A99E0;
}

id sub_10004285C(uint64_t a1)
{
  return [*(id *)(a1 + 32) bumpFaultsAndScheduleRetry];
}

void sub_100042868(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _retrySession:*(void *)(a1 + 32)];
}

id sub_1000428B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) bumpFaultsAndScheduleRetry];
}

void sub_1000428C0(id a1)
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006F3D0();
  }
}

void sub_100043190(id a1)
{
  qword_1000C6C30 = (uint64_t)os_log_create("com.apple.eventkitsync", "sessionTimeout");

  _objc_release_x1();
}

void sub_1000431D4(id a1)
{
  qword_1000C6C40 = (uint64_t)os_log_create("com.apple.eventkitsync", "sessionPerf");

  _objc_release_x1();
}

uint64_t sub_100043664(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = objc_alloc_init(NEKPBSourceWrapper);
        objc_storeStrong((id *)(a1 + 72), v13);
        if PBReaderPlaceMark() && (sub_10006BD5C((uint64_t)v13, a2)) {
          goto LABEL_49;
        }
        goto LABEL_55;
      case 2u:
        uint64_t v13 = objc_alloc_init(NEKPBCalendarWrapper);
        objc_storeStrong((id *)(a1 + 8), v13);
        if (!PBReaderPlaceMark() || (sub_10000A65C((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 3u:
        uint64_t v13 = objc_alloc_init(NEKPBICSWrapper);
        objc_storeStrong((id *)(a1 + 32), v13);
        if (!PBReaderPlaceMark() || (sub_10005E510((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 4u:
        uint64_t v13 = objc_alloc_init(NEKPBDeletionWrapper);
        objc_storeStrong((id *)(a1 + 24), v13);
        if (!PBReaderPlaceMark() || (sub_10006A8E0((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 5u:
        uint64_t v13 = objc_alloc_init(NEKPBValidationWrapper);
        objc_storeStrong((id *)(a1 + 80), v13);
        if (!PBReaderPlaceMark() || (sub_100025FB4((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 0xAu:
        uint64_t v13 = objc_alloc_init(NEKPBSetReminderComplete);
        objc_storeStrong((id *)(a1 + 64), v13);
        if (!PBReaderPlaceMark() || (sub_100032444((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 0xBu:
        uint64_t v13 = objc_alloc_init(NEKPBSetParticipantStatus);
        objc_storeStrong((id *)(a1 + 56), v13);
        if (!PBReaderPlaceMark() || (sub_10006B374((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 0xCu:
        uint64_t v13 = objc_alloc_init(NEKPBSetAlarmSnooze);
        objc_storeStrong((id *)(a1 + 48), v13);
        if (!PBReaderPlaceMark() || (sub_100052214((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
      case 0xDu:
        uint64_t v13 = objc_alloc_init(NEKPBDeleteEvent);
        objc_storeStrong((id *)(a1 + 16), v13);
        if PBReaderPlaceMark() && (sub_1000670EC((uint64_t)v13, a2))
        {
LABEL_49:
          PBReaderRecallMark();

LABEL_50:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_55:

        return 0;
      case 0x14u:
        *(unsigned char *)(a1 + 88) |= 1u;
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 <= 0xFFFFFFFFFFFFFFFBLL
          && (unint64_t v16 = v15 + 4, v15 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)))
        {
          int v17 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16;
        }
        else
        {
          int v17 = 0;
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        }
        *(_DWORD *)(a1 + 40) = v17;
        goto LABEL_50;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_50;
    }
  }
}

NEKPBCalendarWrapper *sub_100044940(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_alloc_init(NEKPBCalendarWrapper);
  id v3 = [v1 storeIdentifier];
  char v4 = objc_alloc_init(NEKPBSourceID);
  if ([v3 isLocalStore])
  {
    [(NEKPBSourceID *)v4 setIsLocalStore:1];
  }
  else
  {
    unsigned int v5 = [v3 persistentID];

    if (v5)
    {
      unint64_t v6 = [v3 persistentID];
      [(NEKPBSourceID *)v4 setPersistentID:v6];
    }
  }

  [(NEKPBCalendarWrapper *)v2 setSourceIdentifier:v4];
  uint64_t v7 = [v1 calendarIdentifier];
  [(NEKPBCalendarWrapper *)v2 setCalendarIdentifier:v7];

  unint64_t v8 = [v1 attributes];
  if (v8)
  {
    char v9 = objc_alloc_init(NEKPBCalendarAttributes);
    uint64_t v10 = [v8 UUID];
    [(NEKPBCalendarAttributes *)v9 setUUID:v10];

    int v11 = [v8 title];
    [(NEKPBCalendarAttributes *)v9 setTitle:v11];

    -[NEKPBCalendarAttributes setIsReadonly:](v9, "setIsReadonly:", [v8 isReadonly]);
    -[NEKPBCalendarAttributes setIsHidden:](v9, "setIsHidden:", [v8 isHidden]);
    -[NEKPBCalendarAttributes setIsImmutable:](v9, "setIsImmutable:", [v8 isImmutable]);
    -[NEKPBCalendarAttributes setIsInbox:](v9, "setIsInbox:", [v8 isInbox]);
    -[NEKPBCalendarAttributes setIsNotificationsCollection:](v9, "setIsNotificationsCollection:", [v8 isNotificationsCollection]);
    -[NEKPBCalendarAttributes setIsSharingInvitation:](v9, "setIsSharingInvitation:", [v8 isSharingInvitation]);
    -[NEKPBCalendarAttributes setIsSubscribed:](v9, "setIsSubscribed:", [v8 isSubscribed]);
    -[NEKPBCalendarAttributes setIsHolidayCalendar:](v9, "setIsHolidayCalendar:", [v8 isHolidyCalendar]);
    -[NEKPBCalendarAttributes setIsFamilyCalendar:](v9, "setIsFamilyCalendar:", [v8 isFamilyCalendar]);
    -[NEKPBCalendarAttributes setIsIgnoringEventAlerts:](v9, "setIsIgnoringEventAlerts:", [v8 isIgnoringEventAlerts]);
    -[NEKPBCalendarAttributes setIsIgnoringSharedCalendarNotifications:](v9, "setIsIgnoringSharedCalendarNotifications:", [v8 isIgnoringSharedCalendarNotifications]);
    -[NEKPBCalendarAttributes setIsSchedulingProhibited:](v9, "setIsSchedulingProhibited:", [v8 isSchedulingProhibited]);
    -[NEKPBCalendarAttributes setIsDefaultCalendarForStore:](v9, "setIsDefaultCalendarForStore:", [v8 isDefaultCalendarForStore]);
    uint64_t v12 = [v8 digest];
    [(NEKPBCalendarAttributes *)v9 setDigest:v12];

    uint64_t v13 = [v8 symbolicColorName];
    [(NEKPBCalendarAttributes *)v9 setSymbolicColorName:v13];

    uint64_t v14 = [v8 colorString];
    [(NEKPBCalendarAttributes *)v9 setColorString:v14];

    -[NEKPBCalendarAttributes setDisplayOrder:](v9, "setDisplayOrder:", [v8 displayOrder]);
    -[NEKPBCalendarAttributes setSharingStatus:](v9, "setSharingStatus:", [v8 sharingStatus]);
    unint64_t v15 = [v8 sharedOwnerName];
    [(NEKPBCalendarAttributes *)v9 setSharedOwnerName:v15];

    unint64_t v16 = [v8 sharedOwnerAddress];
    [(NEKPBCalendarAttributes *)v9 setSharedOwnerAddress:v16];

    -[NEKPBCalendarAttributes setSharingInvitationResponse:](v9, "setSharingInvitationResponse:", [v8 sharingInvitationResponse]);
    int v17 = [v8 publishedURL];
    uint64_t v18 = [v17 absoluteString];
    [(NEKPBCalendarAttributes *)v9 setPublishedURLString:v18];

    -[NEKPBCalendarAttributes setCanBePublished:](v9, "setCanBePublished:", [v8 canBePublished]);
    -[NEKPBCalendarAttributes setCanBeShared:](v9, "setCanBeShared:", [v8 canBeShared]);
    -[NEKPBCalendarAttributes setIsPublished:](v9, "setIsPublished:", [v8 isPublished]);
    uint64_t v19 = [v8 externalID];
    [(NEKPBCalendarAttributes *)v9 setExternalID:v19];

    char v20 = [v8 externalIdentificationTag];
    [(NEKPBCalendarAttributes *)v9 setExternalIdentificationTag:v20];

    unsigned int v21 = [v8 syncToken];
    [(NEKPBCalendarAttributes *)v9 setSyncToken:v21];

    unint64_t v22 = [v8 externalModificationTag];
    [(NEKPBCalendarAttributes *)v9 setExternalModificationTag:v22];

    char v23 = [v8 externalRepresentation];
    [(NEKPBCalendarAttributes *)v9 setExternalRepresentation:v23];

    -[NEKPBCalendarAttributes setSupportedEntityTypes:](v9, "setSupportedEntityTypes:", [v8 supportedEntityTypes]);
    -[NEKPBCalendarAttributes setInvitationStatus:](v9, "setInvitationStatus:", [v8 invitationStatus]);
    -[NEKPBCalendarAttributes setHasBeenAlerted:](v9, "setHasBeenAlerted:", [v8 hasBeenAlerted]);
    char v24 = [v8 notes];
    [(NEKPBCalendarAttributes *)v9 setNotes:v24];

    unsigned int v25 = [v8 subCalAccountID];
    [(NEKPBCalendarAttributes *)v9 setSubCalAccountID:v25];

    uint64_t v26 = [v8 pushKey];
    [(NEKPBCalendarAttributes *)v9 setPushKey:v26];

    unint64_t v27 = [v8 selfIdentityDisplayName];
    [(NEKPBCalendarAttributes *)v9 setSelfIdentityDisplayName:v27];

    char v28 = [v8 selfIdentityEmail];
    [(NEKPBCalendarAttributes *)v9 setSelfIdentityEmail:v28];

    char v29 = [v8 selfIdentityAddress];
    unsigned int v30 = [v29 absoluteString];
    [(NEKPBCalendarAttributes *)v9 setSelfIdentityAddressString:v30];

    uint64_t v31 = [v8 selfIdentityFirstName];
    [(NEKPBCalendarAttributes *)v9 setSelfIdentityFirstName:v31];

    unint64_t v32 = [v8 selfIdentityLastName];
    [(NEKPBCalendarAttributes *)v9 setSelfIdentityLastName:v32];

    char v33 = [v8 ownerIdentityDisplayName];
    [(NEKPBCalendarAttributes *)v9 setOwnerIdentityDisplayName:v33];

    char v34 = [v8 ownerIdentityEmail];
    [(NEKPBCalendarAttributes *)v9 setOwnerIdentityEmail:v34];

    unsigned int v35 = [v8 ownerIdentityAddress];
    uint64_t v36 = [v35 absoluteString];
    [(NEKPBCalendarAttributes *)v9 setOwnerIdentityAddressString:v36];

    unint64_t v37 = [v8 ownerIdentityFirstName];
    [(NEKPBCalendarAttributes *)v9 setOwnerIdentityFirstName:v37];

    char v38 = [v8 ownerIdentityLastName];
    [(NEKPBCalendarAttributes *)v9 setOwnerIdentityLastName:v38];

    [(NEKPBCalendarWrapper *)v2 setAttributes:v9];
  }
  -[NEKPBCalendarWrapper setIsDefaultTaskCalendar:](v2, "setIsDefaultTaskCalendar:", [v1 isDefaultTaskCalendar]);
  -[NEKPBCalendarWrapper setIsDefaultEventCalendar:](v2, "setIsDefaultEventCalendar:", [v1 isDefaultEventCalendar]);
  char v39 = [v1 oldCalendarIdentifier];

  if (v39)
  {
    char v40 = [v1 oldCalendarIdentifier];
    [(NEKPBCalendarWrapper *)v2 setOldCalendarIdentifier:v40];
  }

  return v2;
}

NEKCalendarWrapper *sub_10004500C(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = [v1 sourceIdentifier];
  id v3 = [NEKSourceID alloc];
  char v4 = [v2 persistentID];
  unsigned int v5 = -[NEKSourceID initWithPersistentID:isLocalStore:](v3, "initWithPersistentID:isLocalStore:", v4, [v2 isLocalStore]);

  unint64_t v6 = [v1 attributes];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(NEKCalendarAttributes);
    unint64_t v8 = [v6 uUID];
    [(NEKCalendarAttributes *)v7 setUUID:v8];

    char v9 = [v6 title];
    [(NEKCalendarAttributes *)v7 setTitle:v9];

    -[NEKCalendarAttributes setIsReadonly:](v7, "setIsReadonly:", [v6 isReadonly]);
    -[NEKCalendarAttributes setIsHidden:](v7, "setIsHidden:", [v6 isHidden]);
    -[NEKCalendarAttributes setIsImmutable:](v7, "setIsImmutable:", [v6 isImmutable]);
    -[NEKCalendarAttributes setIsInbox:](v7, "setIsInbox:", [v6 isInbox]);
    -[NEKCalendarAttributes setIsNotificationsCollection:](v7, "setIsNotificationsCollection:", [v6 isNotificationsCollection]);
    -[NEKCalendarAttributes setIsSharingInvitation:](v7, "setIsSharingInvitation:", [v6 isSharingInvitation]);
    -[NEKCalendarAttributes setIsSubscribed:](v7, "setIsSubscribed:", [v6 isSubscribed]);
    -[NEKCalendarAttributes setIsHolidyCalendar:](v7, "setIsHolidyCalendar:", [v6 isHolidayCalendar]);
    -[NEKCalendarAttributes setIsFamilyCalendar:](v7, "setIsFamilyCalendar:", [v6 isFamilyCalendar]);
    -[NEKCalendarAttributes setIsIgnoringEventAlerts:](v7, "setIsIgnoringEventAlerts:", [v6 isIgnoringEventAlerts]);
    -[NEKCalendarAttributes setIsIgnoringSharedCalendarNotifications:](v7, "setIsIgnoringSharedCalendarNotifications:", [v6 isIgnoringSharedCalendarNotifications]);
    -[NEKCalendarAttributes setIsSchedulingProhibited:](v7, "setIsSchedulingProhibited:", [v6 isSchedulingProhibited]);
    -[NEKCalendarAttributes setIsDefaultCalendarForStore:](v7, "setIsDefaultCalendarForStore:", [v6 isDefaultCalendarForStore]);
    uint64_t v10 = [v6 digest];
    [(NEKCalendarAttributes *)v7 setDigest:v10];

    int v11 = [v6 symbolicColorName];
    [(NEKCalendarAttributes *)v7 setSymbolicColorName:v11];

    uint64_t v12 = [v6 colorString];
    [(NEKCalendarAttributes *)v7 setColorString:v12];

    -[NEKCalendarAttributes setDisplayOrder:](v7, "setDisplayOrder:", [v6 displayOrder]);
    -[NEKCalendarAttributes setSharingStatus:](v7, "setSharingStatus:", [v6 sharingStatus]);
    uint64_t v13 = [v6 sharedOwnerName];
    [(NEKCalendarAttributes *)v7 setSharedOwnerName:v13];

    uint64_t v14 = [v6 sharedOwnerAddress];
    [(NEKCalendarAttributes *)v7 setSharedOwnerAddress:v14];

    -[NEKCalendarAttributes setSharingInvitationResponse:](v7, "setSharingInvitationResponse:", [v6 sharingInvitationResponse]);
    unint64_t v15 = [v6 publishedURLString];
    unint64_t v16 = +[NSURL URLWithString:v15];
    [(NEKCalendarAttributes *)v7 setPublishedURL:v16];

    -[NEKCalendarAttributes setCanBePublished:](v7, "setCanBePublished:", [v6 canBePublished]);
    -[NEKCalendarAttributes setCanBeShared:](v7, "setCanBeShared:", [v6 canBeShared]);
    -[NEKCalendarAttributes setIsPublished:](v7, "setIsPublished:", [v6 isPublished]);
    int v17 = [v6 externalID];
    [(NEKCalendarAttributes *)v7 setExternalID:v17];

    uint64_t v18 = [v6 externalIdentificationTag];
    [(NEKCalendarAttributes *)v7 setExternalIdentificationTag:v18];

    uint64_t v19 = [v6 syncToken];
    [(NEKCalendarAttributes *)v7 setSyncToken:v19];

    char v20 = [v6 externalModificationTag];
    [(NEKCalendarAttributes *)v7 setExternalModificationTag:v20];

    unsigned int v21 = [v6 externalRepresentation];
    [(NEKCalendarAttributes *)v7 setExternalRepresentation:v21];

    -[NEKCalendarAttributes setSupportedEntityTypes:](v7, "setSupportedEntityTypes:", [v6 supportedEntityTypes]);
    -[NEKCalendarAttributes setInvitationStatus:](v7, "setInvitationStatus:", [v6 invitationStatus]);
    -[NEKCalendarAttributes setHasBeenAlerted:](v7, "setHasBeenAlerted:", [v6 hasBeenAlerted]);
    unint64_t v22 = [v6 notes];
    [(NEKCalendarAttributes *)v7 setNotes:v22];

    char v23 = [v6 subCalAccountID];
    [(NEKCalendarAttributes *)v7 setSubCalAccountID:v23];

    char v24 = [v6 pushKey];
    [(NEKCalendarAttributes *)v7 setPushKey:v24];

    unsigned int v25 = [v6 selfIdentityDisplayName];
    [(NEKCalendarAttributes *)v7 setSelfIdentityDisplayName:v25];

    uint64_t v26 = [v6 selfIdentityEmail];
    [(NEKCalendarAttributes *)v7 setSelfIdentityEmail:v26];

    unint64_t v27 = [v6 ownerIdentityDisplayName];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityDisplayName:v27];

    char v28 = [v6 selfIdentityAddressString];
    char v29 = +[NSURL URLWithString:v28];
    [(NEKCalendarAttributes *)v7 setSelfIdentityAddress:v29];

    unsigned int v30 = [v6 selfIdentityFirstName];
    [(NEKCalendarAttributes *)v7 setSelfIdentityFirstName:v30];

    uint64_t v31 = [v6 selfIdentityLastName];
    [(NEKCalendarAttributes *)v7 setSelfIdentityLastName:v31];

    unint64_t v32 = [v6 ownerIdentityDisplayName];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityDisplayName:v32];

    char v33 = [v6 ownerIdentityEmail];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityEmail:v33];

    char v34 = [v6 ownerIdentityAddressString];
    unsigned int v35 = +[NSURL URLWithString:v34];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityAddress:v35];

    uint64_t v36 = [v6 ownerIdentityFirstName];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityFirstName:v36];

    unint64_t v37 = [v6 ownerIdentityLastName];
    [(NEKCalendarAttributes *)v7 setOwnerIdentityLastName:v37];
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v38 = [NEKCalendarWrapper alloc];
  char v39 = [v1 calendarIdentifier];
  char v40 = [(NEKCalendarWrapper *)v38 initWithSourceIdentifier:v5 attributes:v7 calendarIdentifier:v39];

  -[NEKCalendarWrapper setIsDefaultTaskCalendar:](v40, "setIsDefaultTaskCalendar:", [v1 isDefaultTaskCalendar]);
  -[NEKCalendarWrapper setIsDefaultEventCalendar:](v40, "setIsDefaultEventCalendar:", [v1 isDefaultEventCalendar]);

  return v40;
}

NEKPBICSWrapper *sub_1000456BC(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_alloc_init(NEKPBICSWrapper);
  id v3 = [v1 calendarIdentifier];
  char v4 = objc_alloc_init(NEKPBCalendarIdentifier);
  -[NEKPBCalendarIdentifier setIsDefaultLocalCalendar:](v4, "setIsDefaultLocalCalendar:", [v3 isDefaultLocalCalendar]);
  unsigned int v5 = [v3 identifier];
  [(NEKPBCalendarIdentifier *)v4 setIdentifier:v5];

  [(NEKPBICSWrapper *)v2 setCalendarIdentifier:v4];
  unint64_t v6 = [v1 syncId];
  [(NEKPBICSWrapper *)v2 setSyncID:v6];

  -[NEKPBICSWrapper setCalendarItemCount:](v2, "setCalendarItemCount:", [v1 calendarItemCount]);
  -[NEKPBICSWrapper setDisplayOrder:](v2, "setDisplayOrder:", [v1 displayOrder]);
  if ([v1 isTaskCompleted])
  {
    [v1 taskCompletionDate];
    -[NEKPBICSWrapper setTaskCompletionDate:](v2, "setTaskCompletionDate:");
  }
  uint64_t v7 = [v1 lzfseICSData];
  if (v7)
  {
  }
  else
  {
    unint64_t v8 = [v1 ICSData];

    if (!v8) {
      goto LABEL_14;
    }
  }
  char v9 = [v1 lzfseICSData];

  if (v9)
  {
    uint64_t v10 = [v1 lzfseICSData];
    [(NEKPBICSWrapper *)v2 setLzfseICSData:v10];
  }
  else
  {
    uint64_t v10 = [v1 ICSData];
    [(NEKPBICSWrapper *)v2 setICSData:v10];
  }

  int v11 = [v1 oldCalendarIdentifier];

  if (v11)
  {
    uint64_t v12 = [v1 oldCalendarIdentifier];
    [(NEKPBICSWrapper *)v2 setOldCalendarIdentifier:v12];
  }
  uint64_t v13 = [v1 oldIdentifier];

  if (v13)
  {
    uint64_t v14 = [v1 oldIdentifier];
    [(NEKPBICSWrapper *)v2 setOldIdentifier:v14];

    unint64_t v15 = [v1 nuevoIdentifier];
    [(NEKPBICSWrapper *)v2 setNuevoIdentifier:v15];
  }
  LOBYTE(v8) = 1;
LABEL_14:
  id v16 = v1;
  +[NSMutableDictionary dictionary];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100046850;
  v25[3] = &unk_1000A9B30;
  id v26 = v16;
  char v28 = (char)v8;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = v17;
  id v18 = v16;
  [v18 enumerateCalendarItemIdentifiersUsingBlock:v25];
  uint64_t v19 = v27;
  id v20 = v17;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100045A0C;
  v23[3] = &unk_1000A9AE0;
  unsigned int v21 = v2;
  char v24 = v21;
  [v20 enumerateKeysAndObjectsUsingBlock:v23];

  return v21;
}

void sub_100045A0C(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addMetadataKeys:a2];
  [*(id *)(a1 + 32) addMetadataValues:v6];
}

NEKICSWrapper *sub_100045A78(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = [v1 calendarIdentifier];
  id v3 = [v2 isDefaultLocalCalendar];
  char v4 = [v2 identifier];
  unsigned int v5 = [[NEKCalendarID alloc] initWithIdentifier:v4 isDefaultLocalCalendar:v3];

  id v6 = objc_alloc_init(NEKICSWrapper);
  [(NEKICSWrapper *)v6 setCalendarIdentifier:v5];
  -[NEKICSWrapper setCalendarItemCount:](v6, "setCalendarItemCount:", [v1 calendarItemCount]);
  uint64_t v7 = [v1 syncID];
  [(NEKICSWrapper *)v6 setSyncId:v7];

  if ([v1 hasTaskCompletionDate])
  {
    [(NEKICSWrapper *)v6 setTaskCompleted:1];
    [v1 taskCompletionDate];
    -[NEKICSWrapper setTaskCompletionDate:](v6, "setTaskCompletionDate:");
  }
  -[NEKICSWrapper setDisplayOrder:](v6, "setDisplayOrder:", [v1 displayOrder]);
  if (([v1 hasICSData] & 1) != 0 || objc_msgSend(v1, "hasLzfseICSData"))
  {
    unint64_t v8 = [v1 iCSData];
    [(NEKICSWrapper *)v6 setICSData:v8];

    char v9 = [v1 lzfseICSData];
    [(NEKICSWrapper *)v6 setLzfseICSData:v9];

    if ([v1 hasOldCalendarIdentifier])
    {
      uint64_t v10 = [v1 oldCalendarIdentifier];
      [(NEKICSWrapper *)v6 setOldCalendarIdentifier:v10];
    }
    if ([v1 hasOldIdentifier])
    {
      int v11 = [v1 oldIdentifier];

      if (v11)
      {
        uint64_t v12 = [v1 oldIdentifier];
        [(NEKICSWrapper *)v6 setOldIdentifier:v12];

        uint64_t v13 = [v1 nuevoIdentifier];
        [(NEKICSWrapper *)v6 setNuevoIdentifier:v13];
      }
    }
    char v14 = 1;
  }
  else
  {
    char v14 = 0;
  }
  unint64_t v15 = [v1 metadataKeys];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100045D24;
  v21[3] = &unk_1000A9B08;
  id v22 = v1;
  char v24 = v14;
  id v16 = v6;
  char v23 = v16;
  id v17 = v1;
  [v15 enumerateObjectsUsingBlock:v21];

  id v18 = v23;
  uint64_t v19 = v16;

  return v19;
}

void sub_100045D24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) metadataValues];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];

  int v8 = *(unsigned __int8 *)(a1 + 48);
  id v9 = v7;
  id v10 = v5;
  int v11 = objc_alloc_init(NEKICSWrapperMetadata);
  [(NEKICSWrapperMetadata *)v11 setIdentifier:v10];
  -[NEKICSWrapperMetadata setEntityType:](v11, "setEntityType:", (int)[v9 entityType]);
  if (v8)
  {
    uint64_t v12 = [v9 selfAttendeeEmail];
    [(NEKICSWrapperMetadata *)v11 setSelfAttendeeEmail:v12];

    uint64_t v13 = [v9 selfAttendeeUUID];
    [(NEKICSWrapperMetadata *)v11 setSelfAttendeeUUID:v13];

    char v14 = [v9 selfOrganizerEmail];
    [(NEKICSWrapperMetadata *)v11 setSelfOrganizerEmail:v14];

    unint64_t v15 = [v9 selfOrganizerUUID];
    [(NEKICSWrapperMetadata *)v11 setSelfOrganizerUUID:v15];

    id v16 = [v9 externalID];
    [(NEKICSWrapperMetadata *)v11 setExternalID:v16];

    -[NEKICSWrapperMetadata setInvitationStatus:](v11, "setInvitationStatus:", [v9 invitationStatus]);
    if ([v9 hasProperInvitationStatus])
    {
      -[NEKICSWrapperMetadata setProperInvitationStatus:](v11, "setProperInvitationStatus:", [v9 properInvitationStatus]);
      [(NEKICSWrapperMetadata *)v11 setHasProperInvitationStatus:1];
    }
    -[NEKICSWrapperMetadata setLocationPredictionState:](v11, "setLocationPredictionState:", [v9 locationPredictionState]);
    if ([v9 invitationChangedPropertyFlagDate]
      && [v9 hasInvitationChangedPropertyFlagDate])
    {
      [(NEKICSWrapperMetadata *)v11 setDateChanged:1];
    }
    if ([v9 invitationChangedPropertyFlagTime]
      && [v9 hasInvitationChangedPropertyFlagTime])
    {
      [(NEKICSWrapperMetadata *)v11 setTimeChanged:1];
    }
    if ([v9 invitationChangedPropertyFlagTitle]
      && [v9 hasInvitationChangedPropertyFlagTitle])
    {
      [(NEKICSWrapperMetadata *)v11 setTitleChanged:1];
    }
    if ([v9 invitationChangedPropertyFlagLocation]
      && [v9 hasInvitationChangedPropertyFlagLocation])
    {
      [(NEKICSWrapperMetadata *)v11 setLocationChanged:1];
    }
    if ([v9 invitationChangedPropertyFlagAttendeeComment]
      && [v9 hasInvitationChangedPropertyFlagAttendeeComment])
    {
      [(NEKICSWrapperMetadata *)v11 setAttendeeComment:1];
    }
    if ([v9 invitationChangedPropertyFlagAttendeeStatus]
      && [v9 hasInvitationChangedPropertyFlagAttendeeStatus])
    {
      [(NEKICSWrapperMetadata *)v11 setAttendeeStatusFlag:1];
    }
    [v9 startDate];
    id v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [(NEKICSWrapperMetadata *)v11 setStartDate:v17];
  }
  else
  {
    unsigned int v18 = [v9 attendeeStatus];
    uint64_t v19 = CalAttendeeStatusToEKParticipantStatus();
    id v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543874;
      id v22 = v10;
      __int16 v23 = 1024;
      unsigned int v24 = v18;
      __int16 v25 = 1024;
      int v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "For %{public}@ setting attendee status to (wire %d, ek %d)", (uint8_t *)&v21, 0x18u);
    }
    [(NEKICSWrapperMetadata *)v11 setAttendeeStatus:v19];
  }

  [*(id *)(a1 + 40) setMetadata:v11 forCalendarItemIdentifier:v10];
}

NEKPBSourceWrapper *sub_1000460B8(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_alloc_init(NEKPBSourceWrapper);
  id v3 = [v1 attributes];

  char v4 = objc_alloc_init(NEKPBSourceAttributes);
  id v5 = [v3 name];
  [(NEKPBSourceAttributes *)v4 setName:v5];

  id v6 = [v3 defaultAlarmOffset];

  if (v6)
  {
    uint64_t v7 = [v3 defaultAlarmOffset];
    -[NEKPBSourceAttributes setDefaultAlarmOffset:](v4, "setDefaultAlarmOffset:", [v7 intValue]);
  }
  -[NEKPBSourceAttributes setType:](v4, "setType:", [v3 type]);
  -[NEKPBSourceAttributes setIsEnabled:](v4, "setIsEnabled:", [v3 isEnabled]);
  -[NEKPBSourceAttributes setIsFacebook:](v4, "setIsFacebook:", [v3 isFacebook]);
  -[NEKPBSourceAttributes setUsesSelfAttendee:](v4, "setUsesSelfAttendee:", [v3 usesSelfAttendee]);
  int v8 = [v3 constraintsDescriptionPath];
  [(NEKPBSourceAttributes *)v4 setConstraintsDescriptionPath:v8];

  id v9 = [v3 externalID];
  [(NEKPBSourceAttributes *)v4 setExternalID:v9];

  id v10 = [v3 externalModificationTag];
  [(NEKPBSourceAttributes *)v4 setExternalModificationTag:v10];

  int v11 = [v3 creatorBundleID];
  [(NEKPBSourceAttributes *)v4 setCreatorBundleID:v11];

  uint64_t v12 = [v3 creatorCodeSigningIdentity];
  [(NEKPBSourceAttributes *)v4 setCreatorCodeSigningIdentity:v12];

  uint64_t v13 = [v3 accountPersistentID];
  [(NEKPBSourceAttributes *)v4 setAccountPersistentID:v13];

  -[NEKPBSourceAttributes setSupportsSharedCalendars:](v4, "setSupportsSharedCalendars:", [v3 supportsSharedCalendars]);
  -[NEKPBSourceAttributes setAllowsTasks:](v4, "setAllowsTasks:", [v3 allowsTasks]);
  -[NEKPBSourceAttributes setAllowsEvents:](v4, "setAllowsEvents:", [v3 allowsEvents]);
  -[NEKPBSourceAttributes setAllowsCalendarAddDeleteModify:](v4, "setAllowsCalendarAddDeleteModify:", [v3 allowsCalendarAddDeleteModify]);
  -[NEKPBSourceAttributes setOnlyCreatorCanModify:](v4, "setOnlyCreatorCanModify:", [v3 onlyCreatorCanModify]);
  -[NEKPBSourceAttributes setSnoozeAlarmRequiresDetach:](v4, "setSnoozeAlarmRequiresDetach:", [v3 snoozeAlarmRequiresDetach]);
  -[NEKPBSourceAttributes setSupportsAlarmAcknowledgedDate:](v4, "setSupportsAlarmAcknowledgedDate:", [v3 supportsAlarmAcknowledgedDate]);
  -[NEKPBSourceAttributes setIsLocalStore:](v4, "setIsLocalStore:", [v3 isLocalStore]);
  -[NEKPBSourceAttributes setIsBirthdayStore:](v4, "setIsBirthdayStore:", [v3 isBirthdayStore]);
  [(NEKPBSourceWrapper *)v2 setAttributes:v4];

  return v2;
}

NEKSourceWrapper *sub_100046364(void *a1)
{
  id v1 = [a1 attributes];
  CFTypeID v2 = objc_alloc_init(NEKSourceAttributes);
  id v3 = [v1 name];
  [(NEKSourceAttributes *)v2 setName:v3];

  if ([v1 hasDefaultAlarmOffset])
  {
    char v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v1 defaultAlarmOffset]);
    [(NEKSourceAttributes *)v2 setDefaultAlarmOffset:v4];
  }
  -[NEKSourceAttributes setType:](v2, "setType:", [v1 type]);
  -[NEKSourceAttributes setIsEnabled:](v2, "setIsEnabled:", [v1 isEnabled]);
  -[NEKSourceAttributes setIsFacebook:](v2, "setIsFacebook:", [v1 isFacebook]);
  -[NEKSourceAttributes setUsesSelfAttendee:](v2, "setUsesSelfAttendee:", [v1 usesSelfAttendee]);
  id v5 = [v1 constraintsDescriptionPath];
  [(NEKSourceAttributes *)v2 setConstraintsDescriptionPath:v5];

  id v6 = [v1 externalID];
  [(NEKSourceAttributes *)v2 setExternalID:v6];

  uint64_t v7 = [v1 externalModificationTag];
  [(NEKSourceAttributes *)v2 setExternalModificationTag:v7];

  int v8 = [v1 creatorBundleID];
  [(NEKSourceAttributes *)v2 setCreatorBundleID:v8];

  id v9 = [v1 creatorCodeSigningIdentity];
  [(NEKSourceAttributes *)v2 setCreatorCodeSigningIdentity:v9];

  id v10 = [v1 accountPersistentID];
  [(NEKSourceAttributes *)v2 setAccountPersistentID:v10];

  -[NEKSourceAttributes setSupportsSharedCalendars:](v2, "setSupportsSharedCalendars:", [v1 supportsSharedCalendars]);
  -[NEKSourceAttributes setAllowsTasks:](v2, "setAllowsTasks:", [v1 allowsTasks]);
  -[NEKSourceAttributes setAllowsEvents:](v2, "setAllowsEvents:", [v1 allowsEvents]);
  -[NEKSourceAttributes setAllowsCalendarAddDeleteModify:](v2, "setAllowsCalendarAddDeleteModify:", [v1 allowsCalendarAddDeleteModify]);
  -[NEKSourceAttributes setOnlyCreatorCanModify:](v2, "setOnlyCreatorCanModify:", [v1 onlyCreatorCanModify]);
  -[NEKSourceAttributes setSnoozeAlarmRequiresDetach:](v2, "setSnoozeAlarmRequiresDetach:", [v1 snoozeAlarmRequiresDetach]);
  -[NEKSourceAttributes setSupportsAlarmAcknowledgedDate:](v2, "setSupportsAlarmAcknowledgedDate:", [v1 supportsAlarmAcknowledgedDate]);
  -[NEKSourceAttributes setIsLocalStore:](v2, "setIsLocalStore:", [v1 isLocalStore]);
  -[NEKSourceAttributes setIsBirthdayStore:](v2, "setIsBirthdayStore:", [v1 isBirthdayStore]);

  int v11 = [[NEKSourceWrapper alloc] initWithAttributes:v2];

  return v11;
}

NEKPBDeletionWrapper *sub_1000465FC(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_alloc_init(NEKPBDeletionWrapper);
  id v3 = [v1 objectIdentifier];
  [(NEKPBDeletionWrapper *)v2 setSyncId:v3];

  -[NEKPBDeletionWrapper setType:](v2, "setType:", [v1 type]);
  char v4 = [v1 calendarIdentifier];

  [(NEKPBDeletionWrapper *)v2 setCalendarIdentifier:v4];

  return v2;
}

NEKDeletionWrapper *sub_1000466A8(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = [NEKDeletionWrapper alloc];
  id v3 = [v1 syncId];
  unsigned int v4 = [v1 hasCalendarIdentifier];
  if (v4)
  {
    id v5 = [v1 calendarIdentifier];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = -[NEKDeletionWrapper initWithIdentifier:calendarIdentifier:type:](v2, "initWithIdentifier:calendarIdentifier:type:", v3, v5, [v1 type]);
  if (v4) {

  }
  return v6;
}

NEKPBValidationWrapper *sub_100046768(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_alloc_init(NEKPBValidationWrapper);
  id v3 = [v1 start];
  [v3 timeIntervalSinceReferenceDate];
  -[NEKPBValidationWrapper setStartDate:](v2, "setStartDate:");

  unsigned int v4 = [v1 end];
  [v4 timeIntervalSinceReferenceDate];
  -[NEKPBValidationWrapper setEndDate:](v2, "setEndDate:");

  -[NEKPBValidationWrapper setMasterCount:](v2, "setMasterCount:", [v1 masterCount]);
  -[NEKPBValidationWrapper setOccurrenceCount:](v2, "setOccurrenceCount:", [v1 occurrenceCount]);
  id v5 = [v1 showAlert];

  [(NEKPBValidationWrapper *)v2 setShowAlert:v5];

  return v2;
}

id sub_100046840(uint64_t a1)
{
  return +[NEKValidationWrapper validationWrapperForPb:a1];
}

void sub_100046850(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = objc_alloc_init(NEKPBICSWrapperMetadata);
  -[NEKPBICSWrapperMetadata setEntityType:](v4, "setEntityType:", [*(id *)(a1 + 32) objectTypeForCalendarItemWithIdentifier:v3]);
  id v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = [v5 selfAttendeeEmailForIdentifier:v3];
    [(NEKPBICSWrapperMetadata *)v4 setSelfAttendeeEmail:v6];

    uint64_t v7 = [*(id *)(a1 + 32) selfAttendeeUUIDForIdentifier:v3];
    [(NEKPBICSWrapperMetadata *)v4 setSelfAttendeeUUID:v7];

    int v8 = [*(id *)(a1 + 32) selfOrganizerEmailForIdentifier:v3];
    [(NEKPBICSWrapperMetadata *)v4 setSelfOrganizerEmail:v8];

    id v9 = [*(id *)(a1 + 32) selfOrganizerUUIDForIdentifier:v3];
    [(NEKPBICSWrapperMetadata *)v4 setSelfOrganizerUUID:v9];

    id v10 = [*(id *)(a1 + 32) externalIDForIdentifier:v3];
    [(NEKPBICSWrapperMetadata *)v4 setExternalID:v10];

    int v11 = [*(id *)(a1 + 32) invitationStatusForIdentifier:v3];
    uint64_t v12 = v11;
    if (v11) {
      -[NEKPBICSWrapperMetadata setInvitationStatus:](v4, "setInvitationStatus:", [v11 unsignedIntegerValue]);
    }
    uint64_t v13 = [*(id *)(a1 + 32) properInvitationStatusForIdentifier:v3];
    char v14 = v13;
    if (v13) {
      -[NEKPBICSWrapperMetadata setProperInvitationStatus:](v4, "setProperInvitationStatus:", [v13 unsignedIntegerValue]);
    }
    unint64_t v15 = [*(id *)(a1 + 32) locationPredictionStateForIdentifier:v3];
    id v16 = v15;
    if (v15) {
      -[NEKPBICSWrapperMetadata setLocationPredictionState:](v4, "setLocationPredictionState:", [v15 unsignedIntegerValue]);
    }
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagDate:](v4, "setInvitationChangedPropertyFlagDate:", [*(id *)(a1 + 32) dateChangedForIdentifier:v3]);
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagTime:](v4, "setInvitationChangedPropertyFlagTime:", [*(id *)(a1 + 32) timeChangedForIdentifier:v3]);
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagTitle:](v4, "setInvitationChangedPropertyFlagTitle:", [*(id *)(a1 + 32) titleChangedForIdentifier:v3]);
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagLocation:](v4, "setInvitationChangedPropertyFlagLocation:", [*(id *)(a1 + 32) locationChangedForIdentifier:v3]);
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagAttendeeComment:](v4, "setInvitationChangedPropertyFlagAttendeeComment:", [*(id *)(a1 + 32) attendeeCommentForIdentifier:v3]);
    -[NEKPBICSWrapperMetadata setInvitationChangedPropertyFlagAttendeeStatus:](v4, "setInvitationChangedPropertyFlagAttendeeStatus:", [*(id *)(a1 + 32) attendeeStatusFlagForIdentifier:v3]);
    id v17 = [*(id *)(a1 + 32) startDateForIdentifier:v3];
    [v17 timeIntervalSinceReferenceDate];
    -[NEKPBICSWrapperMetadata setStartDate:](v4, "setStartDate:");
  }
  else
  {
    unsigned int v18 = [v5 attendeeStatusForIdentifier:v3];
    uint64_t v19 = EKParticipantStatusToCalAttendeeStatus();
    id v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543874;
      id v22 = v3;
      __int16 v23 = 1024;
      unsigned int v24 = v18;
      __int16 v25 = 1024;
      int v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "For %{public}@ we are sending attendee stats (ek %d, wire %d)", (uint8_t *)&v21, 0x18u);
    }
    [(NEKPBICSWrapperMetadata *)v4 setAttendeeStatus:v19];
  }
  [*(id *)(a1 + 40) setObject:v4 forKey:v3];
}

uint64_t sub_10004768C(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_30;
        }
        v14 += 7;
        BOOL v9 = v15++ >= 9;
        if (v9)
        {
          uint64_t v16 = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v16 = 0;
      }
LABEL_32:
      *(unsigned char *)(a1 + 16) = v16 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
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

uint64_t sub_100048144(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) nekEventStore];
  if ([v4 shouldSendEntity:v3]) {
    uint64_t v5 = sub_10000BC3C(v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t sub_1000481B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) nekReminderStore];
  if ([v4 shouldSendReminder:v3]) {
    uint64_t v5 = sub_10000BDFC(v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_10004821C(uint64_t a1)
{
  return [*(id *)(a1 + 32) endMappingEntities];
}

void sub_100048224(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reminderChangeObserver];
  [v2 saveChangeTrackingStateMap:*(void *)(a1 + 40)];
}

void sub_100048278(uint64_t a1)
{
  [*(id *)(a1 + 32) purgeRecordMap];
  [*(id *)(a1 + 32) startMappingEntities];
  id v2 = [*(id *)(a1 + 40) eventChangeObserver];
  if (([v2 allSourcesInto:*(void *)(a1 + 48)] & 1) == 0) {
    goto LABEL_15;
  }
  id v3 = [*(id *)(a1 + 40) reminderChangeObserver];
  if (([v3 allCloudKitAccountsInto:*(void *)(a1 + 48)] & 1) == 0)
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  char v4 = [*(id *)(a1 + 40) eventChangeObserver];
  if (([v4 allCalendarsInto:*(void *)(a1 + 48)] & 1) == 0)
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v5 = [*(id *)(a1 + 40) reminderChangeObserver];
  if (![v5 allListsInto:*(void *)(a1 + 48)])
  {
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v6 = [*(id *)(a1 + 40) eventChangeObserver];
  if (![v6 allEventsInto:*(void *)(a1 + 48) filter:*(void *)(a1 + 64) window:*(void *)(a1 + 56)])
  {
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v7 = [*(id *)(a1 + 40) eventChangeObserver];
  if (![v7 allRemindersInto:*(void *)(a1 + 48) filter:*(void *)(a1 + 64) window:*(void *)(a1 + 56)])
  {

    goto LABEL_11;
  }
  char v8 = [*(id *)(a1 + 40) reminderChangeObserver];
  unsigned int v13 = [v8 allRemindersInto:*(void *)(a1 + 48) filter:*(void *)(a1 + 72) window:*(void *)(a1 + 56)];

  if (v13)
  {
    BOOL v9 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      unsigned int v15 = "-[NEKResultsFetcher fetchEverythingIntoPipe:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: All things pushed successfully", buf, 0xCu);
    }
  }
LABEL_16:
  [*(id *)(a1 + 48) finish];
  int v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(const char **)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    unsigned int v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "fetchEverythingIntoPipe:PipeAfter: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = [*(id *)(a1 + 40) terminateSemaphore];
  dispatch_semaphore_signal(v12);
}

id sub_1000488B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    unint64_t v6 = [v5 originalItem];

    char v4 = v5;
    if (v6)
    {
      char v4 = [v5 originalItem];
    }
  }
  unint64_t v7 = [*(id *)(a1 + 32) nekEventStore];
  if ([v7 hasRowMappingForEntity:v4])
  {
    id v8 = 0;
  }
  else
  {
    BOOL v9 = [*(id *)(a1 + 32) nekEventStore];
    id v8 = [v9 shouldSendEntity:v3];
  }
  return v8;
}

uint64_t sub_10004899C(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) nekReminderStore];
  if ([v4 shouldSendReminder:v3]) {
    uint64_t v5 = sub_10000BDFC(v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_100048A08(uint64_t a1)
{
  [*(id *)(a1 + 32) endMappingEntities];
  id v2 = *(void **)(a1 + 32);

  return [v2 sweepSeenMap];
}

void sub_100048A44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventChangeObserver];
  if (([v2 allSourcesInto:*(void *)(a1 + 40)] & 1) == 0) {
    goto LABEL_13;
  }
  id v3 = [*(id *)(a1 + 32) eventChangeObserver];
  if (([v3 allCalendarsInto:*(void *)(a1 + 40)] & 1) == 0)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  char v4 = [*(id *)(a1 + 32) reminderChangeObserver];
  if (([v4 allListsInto:*(void *)(a1 + 40)] & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v5 = [*(id *)(a1 + 32) eventChangeObserver];
  if (![v5 allEventsInto:*(void *)(a1 + 40) filter:*(void *)(a1 + 56) window:*(void *)(a1 + 48)])
  {
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v6 = [*(id *)(a1 + 32) eventChangeObserver];
  if (![v6 allRemindersInto:*(void *)(a1 + 40) filter:*(void *)(a1 + 56) window:*(void *)(a1 + 48)])
  {

    goto LABEL_10;
  }
  unint64_t v7 = [*(id *)(a1 + 32) reminderChangeObserver];
  unsigned int v8 = [v7 allRemindersInto:*(void *)(a1 + 40) filter:*(void *)(a1 + 64) window:*(void *)(a1 + 48)];

  if (v8)
  {
    BOOL v9 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446210;
      char v14 = "-[NEKResultsFetcher fetchNightlyIntoPipe:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: All nightly things pushed successfully", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_14:
  [*(id *)(a1 + 40) finish];
  int v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(const char **)(a1 + 40);
    int v13 = 138543362;
    char v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "fetchNightlyIntoPipe:PipeAfter: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v12 = [*(id *)(a1 + 32) terminateSemaphore];
  dispatch_semaphore_signal(v12);
}

void sub_100049138(uint64_t a1)
{
  [*(id *)(a1 + 32) addAttendeeEvents:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) storeWrappersForSourceAggregator:*(void *)(a1 + 48) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) calendarWrappersForChangeSet:*(void *)(a1 + 40) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) deletionWrappersForChangeSet:*(void *)(a1 + 40) skipSourceDeletions:1 pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) deletionWrappersForSourceAggregator:*(void *)(a1 + 48) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) ICSWrappersForChangeSet:*(void *)(a1 + 40) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) storeWrapperForCloudKitAccount:*(void *)(a1 + 72) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) listWrappersForChangeSet:*(void *)(a1 + 72) pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) remindersWrappersForChangeSet:*(void *)(a1 + 72) skipAccountDeletions:1 pipe:*(void *)(a1 + 56)];
  [*(id *)(a1 + 56) finish];
  id v2 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "fetchChangesIntoPipe:PipeAfter: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  char v4 = [*(id *)(a1 + 80) terminateSemaphore];
  dispatch_semaphore_signal(v4);
}

uint64_t sub_10004A018(uint64_t a1, uint64_t a2)
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
        uint64_t v14 = 64;
        goto LABEL_81;
      case 2u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 104) |= 4u;
        while (2)
        {
          uint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v20 = v19 + 1;
          if (v19 == -1 || v20 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20;
            v18 |= (unint64_t)(v21 & 0x7F) << v16;
            if (v21 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_109:
        uint64_t v81 = 24;
        goto LABEL_151;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 104) |= 2u;
        while (2)
        {
          uint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25;
            v18 |= (unint64_t)(v26 & 0x7F) << v22;
            if (v26 < 0)
            {
              v22 += 7;
              BOOL v10 = v23++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_113;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_113:
        uint64_t v81 = 16;
        goto LABEL_151;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 104) |= 0x100u;
        while (2)
        {
          uint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v10 = v28++ >= 9;
              if (v10)
              {
                uint64_t v29 = 0;
                goto LABEL_117;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v29 = 0;
        }
LABEL_117:
        BOOL v82 = v29 != 0;
        uint64_t v83 = 98;
        goto LABEL_138;
      case 5u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        *(_WORD *)(a1 + 104) |= 0x400u;
        while (2)
        {
          uint64_t v36 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v36);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v10 = v34++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_121;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_121:
        BOOL v82 = v35 != 0;
        uint64_t v83 = 100;
        goto LABEL_138;
      case 6u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(_WORD *)(a1 + 104) |= 0x800u;
        while (2)
        {
          uint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v43;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v10 = v40++ >= 9;
              if (v10)
              {
                uint64_t v41 = 0;
                goto LABEL_125;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v41 = 0;
        }
LABEL_125:
        BOOL v82 = v41 != 0;
        uint64_t v83 = 101;
        goto LABEL_138;
      case 7u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(_WORD *)(a1 + 104) |= 0x200u;
        while (2)
        {
          uint64_t v48 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49;
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v10 = v46++ >= 9;
              if (v10)
              {
                uint64_t v47 = 0;
                goto LABEL_129;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v47 = 0;
        }
LABEL_129:
        BOOL v82 = v47 != 0;
        uint64_t v83 = 99;
        goto LABEL_138;
      case 8u:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v53 = 0;
        *(_WORD *)(a1 + 104) |= 0x40u;
        while (2)
        {
          uint64_t v54 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v55 = v54 + 1;
          if (v54 == -1 || v55 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v54);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v55;
            v53 |= (unint64_t)(v56 & 0x7F) << v51;
            if (v56 < 0)
            {
              v51 += 7;
              BOOL v10 = v52++ >= 9;
              if (v10)
              {
                uint64_t v53 = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v53 = 0;
        }
LABEL_133:
        BOOL v82 = v53 != 0;
        uint64_t v83 = 96;
        goto LABEL_138;
      case 9u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0;
        *(_WORD *)(a1 + 104) |= 0x80u;
        while (2)
        {
          uint64_t v60 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v61 = v60 + 1;
          if (v60 == -1 || v61 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v60);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v61;
            v59 |= (unint64_t)(v62 & 0x7F) << v57;
            if (v62 < 0)
            {
              v57 += 7;
              BOOL v10 = v58++ >= 9;
              if (v10)
              {
                uint64_t v59 = 0;
                goto LABEL_137;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v59 = 0;
        }
LABEL_137:
        BOOL v82 = v59 != 0;
        uint64_t v83 = 97;
LABEL_138:
        *(unsigned char *)(a1 + v83) = v82;
        continue;
      case 0xAu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 72;
        goto LABEL_81;
      case 0xBu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 80;
        goto LABEL_81;
      case 0xCu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
        goto LABEL_81;
      case 0xDu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
LABEL_81:
        unint64_t v63 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 0xEu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 104) |= 1u;
        while (2)
        {
          uint64_t v66 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v66);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v67;
            v18 |= (unint64_t)(v68 & 0x7F) << v64;
            if (v68 < 0)
            {
              v64 += 7;
              BOOL v10 = v65++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_142;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_142:
        uint64_t v81 = 8;
        goto LABEL_151;
      case 0xFu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 104) |= 8u;
        while (2)
        {
          uint64_t v71 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v72 = v71 + 1;
          if (v71 == -1 || v72 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v73 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v71);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v72;
            v18 |= (unint64_t)(v73 & 0x7F) << v69;
            if (v73 < 0)
            {
              v69 += 7;
              BOOL v10 = v70++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_146:
        uint64_t v81 = 32;
        goto LABEL_151;
      case 0x10u:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 104) |= 0x10u;
        break;
      case 0x11u:
        *(_WORD *)(a1 + 104) |= 0x20u;
        unint64_t v79 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v80 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v79);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v79 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v80 = 0;
        }
        *(void *)(a1 + 48) = v80;
        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      uint64_t v76 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v77 = v76 + 1;
      if (v76 == -1 || v77 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v78 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v76);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v77;
      v18 |= (unint64_t)(v78 & 0x7F) << v74;
      if ((v78 & 0x80) == 0) {
        goto LABEL_148;
      }
      v74 += 7;
      BOOL v10 = v75++ >= 9;
      if (v10)
      {
        uint64_t v18 = 0;
        goto LABEL_150;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_148:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v18 = 0;
    }
LABEL_150:
    uint64_t v81 = 40;
LABEL_151:
    *(void *)(a1 + v81) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_10004C2BC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10004C398(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateList:*(void *)(a1 + 40)];
}

BOOL sub_10004EC18(uint64_t a1, uint64_t a2)
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
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 16;
LABEL_21:
        uint64_t v14 = *(void **)(a1 + v13);
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
    uint64_t v12 = PBReaderReadString();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10004F630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004F66C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
      if ((uint64_t)[*(id *)(a1 + 32) objectDelayUs] >= 1) {
        usleep((useconds_t)[*(id *)(a1 + 32) objectDelayUs]);
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v4 = 1;
    }
    else
    {
      unsigned int v5 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Change exceeded batch size. Will catch next batch.", v7, 2u);
      }
      [(id)objc_opt_class() oops];
      uint64_t v4 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  return v4;
}

void sub_100050500(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  qword_1000C6C48 = (info.numer << 8) / info.denom;
}

void sub_10005074C(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&qword_1000C69D8 = (double)v1 / (double)v2;
  }
}

uint64_t sub_1000518F0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    if ([v5 isEqual:v6])
    {
LABEL_3:
      uint64_t v8 = 1;
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_3;
  }
  char v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  uint64_t v8 = 0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_calendarPropertyIsEqualToAttributeProperty: Calendar and attributes property %{public}@ are different: (calendar) %{public}@ != (attributes) %{public}@", (uint8_t *)&v11, 0x20u);
    uint64_t v8 = 0;
  }
LABEL_7:

  return v8;
}

uint64_t sub_100052214(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
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
        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = (v6 & 7) == 4;
        }
        if (!v12)
        {
          switch((v6 >> 3))
          {
            case 1u:
              *(unsigned char *)(a1 + 64) |= 1u;
              unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v13 <= 0xFFFFFFFFFFFFFFF7 && v13 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                uint64_t v14 = 0;
              }
              *(void *)(a1 + 8) = v14;
              goto LABEL_30;
            case 2u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 24;
              goto LABEL_29;
            case 3u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 48;
              goto LABEL_29;
            case 4u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 32;
              goto LABEL_29;
            case 5u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 16;
              goto LABEL_29;
            case 6u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 40;
              goto LABEL_29;
            case 7u:
              uint64_t v16 = PBReaderReadString();
              uint64_t v17 = 56;
LABEL_29:
              uint64_t v18 = *(void **)(a1 + v17);
              *(void *)(a1 + v17) = v16;

              goto LABEL_30;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_30:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_1000536D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveEventStore:*(void *)(a1 + 40)];
}

void sub_100053D70(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) freshEventStoreFor:@"removeAllItems(reminders)"];
  [*(id *)(a1 + 32) removeDeletableLists:v2];
  [*(id *)(a1 + 32) _saveEventStore:v2];
  [*(id *)(a1 + 32) removeDeletableAccounts:v2];
  [*(id *)(a1 + 32) _saveEventStore:v2];
  id v3 = [*(id *)(a1 + 32) changeObserver];
  char v4 = [v3 changeStateMap];
  unsigned int v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received reset sync. Resetting change tracking state map to %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [v3 saveChangeTrackingStateMap:v4];
}

BOOL sub_10005407C(id a1, REMAccount *a2, NSDictionary *a3)
{
  id v3 = a2;
  BOOL v4 = [(REMAccount *)v3 type] == (id)3 || [(REMAccount *)v3 type] == (id)4;

  return v4;
}

BOOL sub_100054764(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

void sub_100054A24(id *a1)
{
  unint64_t v2 = a1 + 4;
  id v3 = [a1[4] attributes];
  unsigned int v4 = [v3 isLocalStore];

  if (v4)
  {
    unsigned int v5 = [a1[5] eks_localAccount];
    int v6 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [*v2 attributes];
  int v6 = [v7 accountPersistentID];

  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  if (!v8 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
    sub_10006FA2C();
  }
  char v9 = +[REMAccount objectIDWithUUID:v8];
  id v10 = a1[5];
  id v39 = 0;
  unsigned int v5 = [v10 fetchAccountWithObjectID:v9 error:&v39];
  id v11 = v39;
  BOOL v12 = v11;
  if (!v5)
  {
    unint64_t v13 = [v11 domain];
    if ([v13 isEqualToString:REMErrorDomain])
    {
      id v14 = [v12 code];

      if (v14 == (id)-3000) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006F9C4();
    }
  }
LABEL_13:

LABEL_14:
  __int16 v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = *v2;
    *(_DWORD *)buf = 138543362;
    id v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Reminders: Create or update account: %{public}@", buf, 0xCu);
  }
  if (v5)
  {
    if ([a1[6] _updateAccount:v5 withSourceWrapper:a1[4] store:a1[5]])
    {
      unsigned int v18 = [a1[6] _saveEventStore:a1[5]];
      uint64_t v19 = *(void **)(qword_1000C6CA8 + 8);
      if (v18)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v20 = v19;
          char v21 = [v5 objectID];
          *(_DWORD *)buf = 138543362;
          id v41 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reminders: Account (%{public}@) saved successfully.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_10006F930(v19, v5);
      }
    }
  }
  else
  {
    char v22 = [*v2 attributes];
    unsigned __int8 v23 = [v22 allowsTasks];

    if (v23)
    {
      uint64_t v24 = [*v2 attributes];
      unsigned __int8 v25 = [v24 isLocalStore];

      char v26 = *(NSObject **)(qword_1000C6CA8 + 8);
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v27) {
          sub_10006CB70((uint64_t)v2, v26, v28, v29, v30, v31, v32, v33);
        }
      }
      else if (v27)
      {
        sub_10006F8C0((uint64_t)v2, v26, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      unsigned int v34 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = *v2;
        uint64_t v36 = v34;
        unint64_t v37 = [v35 attributes];
        char v38 = [v37 accountPersistentID];
        *(_DWORD *)buf = 138543362;
        id v41 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Reminders: No need to create account since the account [%{public}@] doesn't exist in database and the source wrapper has allowsTasks=NO", buf, 0xCu);
      }
    }
  }
}

void sub_100054F34(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) calendarIdentifier];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:v2];
  if (!v3 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
    sub_10006FBD8();
  }
  unsigned int v4 = +[REMList objectIDWithUUID:v3];
  unsigned int v5 = *(void **)(a1 + 40);
  id v22 = 0;
  int v6 = [v5 fetchListWithObjectID:v4 error:&v22];
  id v7 = v22;
  id v8 = v7;
  if (v6)
  {
    char v9 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Update list: %{public}@", buf, 0xCu);
    }
    if ([*(id *)(a1 + 48) _updateList:v6 withCalendarWrapper:*(void *)(a1 + 32)])
    {
      unsigned int v12 = [*(id *)(a1 + 48) _saveEventStore:*(void *)(a1 + 40)];
      unint64_t v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v2;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "List (%{public}@) saved successfully.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_10006FB70();
      }
    }
    goto LABEL_30;
  }
  id v14 = [v7 domain];
  if (([v14 isEqualToString:REMErrorDomain] & 1) == 0)
  {

LABEL_15:
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006FB08();
    }
    goto LABEL_17;
  }
  id v15 = [v8 code];

  if (v15 != (id)-3000) {
    goto LABEL_15;
  }
LABEL_17:
  id v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Create list: %{public}@", buf, 0xCu);
  }
  unsigned int v18 = [*(id *)(a1 + 48) _createListForWrapper:*(void *)(a1 + 32) store:*(void *)(a1 + 40)];
  if (v18)
  {
    unsigned int v20 = [*(id *)(a1 + 48) _saveEventStore:*(void *)(a1 + 40)];
    char v21 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v20)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v2;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "New list (%{public}@) saved successfully.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006FAA0();
    }
    [*(id *)(a1 + 48) _checkAndSetDefaultList:0 calendarWrapper:*(void *)(a1 + 32) store:*(void *)(a1 + 40)];
  }

LABEL_30:
}

id sub_100055400(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUpdateWithICSWrappers:*(void *)(a1 + 40) store:*(void *)(a1 + 48) session:*(void *)(a1 + 56)];
}

id sub_100055500(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAccountWithIdentifier:*(void *)(a1 + 40) store:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _deleteListWithIdentifier:*(void *)(a1 + 40) store:*(void *)(a1 + 48)];
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _deleteReminderWithIdentifier:v3 store:v4];
}

void sub_100056E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [*(id *)(a1 + 32) entityTypeForCalendarItemWithIdentifier:v3];
  if (v5 == (id)1)
  {
    [*(id *)(a1 + 40) handleReminderWithUniqueIdentifierFromGizmo:v3 saveRequest:*(void *)(a1 + 48) list:*(void *)(a1 + 56) wrapper:*(void *)(a1 + 32)];
  }
  else
  {
    int v6 = (int)v5;
    id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006D36C(v6, v7);
    }
  }
}

void sub_100056F24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v8 = [v6 objectAtIndexedSubscript:a3];
  char v9 = [v8 objectIdentifier];
  id v10 = [v5 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 48) updateReminder:v10];
    unsigned int v12 = *(void **)(a1 + 48);
    id v22 = 0;
    [v12 updateReminderChangeItem:v11 fromICSData:v7 isNew:1 withOptions:0 error:&v22];

    id v13 = v22;
    unsigned __int8 v23 = v11;
    id v14 = +[NSArray arrayWithObjects:&v23 count:1];
  }
  else
  {
    id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(a1 + 40);
      uint64_t v17 = v15;
      unsigned int v18 = [v16 objectAtIndexedSubscript:a3];
      uint64_t v19 = [v18 objectIdentifier];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Reminder for identifier %{public}@ not found (%@)", buf, 0x16u);
    }
    unsigned int v20 = *(void **)(a1 + 48);
    char v21 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
    id v11 = [v20 updateList:v21];

    id v14 = [*(id *)(a1 + 48) importRemindersFromICSData:v7 insertIntoListChangeItem:v11 error:0];

    id v13 = 0;
  }

  if (v14)
  {
    [*(id *)(a1 + 64) addObject:v14];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006FE70();
  }
}

void sub_100057328(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] store];
  id v5 = [a1[5] entityTypeForCalendarItemWithIdentifier:v3];
  if (v5 == (id)1)
  {
    id v18 = 0;
    int v6 = [v4 fetchReminderWithDACalendarItemUniqueIdentifier:v3 inList:0 error:&v18];
    id v7 = v18;
    if (!v6)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006FEB0();
      }
      goto LABEL_20;
    }
    id v8 = [a1[4] objectID];
    char v9 = [v6 list];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectID];
      unsigned int v12 = (void *)v11;
      BOOL v13 = v8 != 0;
      if (v8 && v11)
      {
        if ([v8 isEqual:v11]) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      if (!v8 && v11)
      {
LABEL_18:
        id v16 = [a1[6] updateReminder:v6];
        [v16 removeFromList];
        uint64_t v17 = [a1[6] updateList:a1[4]];
        [v17 addReminderChangeItem:v16];

LABEL_19:
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      unsigned int v12 = 0;
      BOOL v13 = v8 != 0;
    }
    if (!v13 || v12) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v14 = (uint64_t)v5;
  id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10006FF18((uint64_t)v3, v14, v15);
  }
LABEL_21:
}

void sub_1000578B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000578D0(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000578FC(uint64_t a1)
{
}

void sub_100057904(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
      uint64_t v8 = *(void *)(a1 + 56);
      char v9 = [v11 objectForKeyedSubscript:v7];
      id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6];
      (*(void (**)(uint64_t, void *, void *, id, unsigned __int8 *))(v8 + 16))(v8, v7, v9, [v10 intValue], a2);

      LODWORD(v8) = *a2;
      if (v8) {
        break;
      }
      ++v6;
    }
    while (v6 < (unint64_t)[*(id *)(a1 + 32) count]);
  }
  [*(id *)(a1 + 32) removeAllObjects];
  [*(id *)(a1 + 40) removeAllObjects];
}

id sub_100057A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  id v5 = *(void **)(a1 + 40);
  unint64_t v6 = +[NSNumber numberWithUnsignedInt:a3];
  [v5 addObject:v6];

  id result = [*(id *)(a1 + 32) count];
  if ((unint64_t)result >= 0xA)
  {
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16);
    return (id)v8();
  }
  return result;
}

id sub_100057BD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = 0;
  id v5 = [v4 fetchAccountsWithObjectIDs:v3 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006FF90();
    }
    id v5 = +[NSDictionary dictionary];
  }
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    char v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    *(_DWORD *)buf = 138543618;
    BOOL v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetched account batch: %{public}@ %{public}@", buf, 0x16u);
  }

  return v5;
}

id sub_100057E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = 0;
  id v5 = [v4 fetchListsWithObjectIDs:v3 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006FFF8();
    }
    id v5 = +[NSDictionary dictionary];
  }
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    char v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    *(_DWORD *)buf = 138543618;
    BOOL v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetched list batch: %{public}@ %{public}@", buf, 0x16u);
  }

  return v5;
}

id sub_1000580E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = 0;
  id v5 = [v4 fetchRemindersWithObjectIDs:v3 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100070060();
    }
    id v5 = +[NSDictionary dictionary];
  }
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    char v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    *(_DWORD *)buf = 138543618;
    BOOL v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetched reminder batch: %{public}@ %{public}@", buf, 0x16u);
  }

  return v5;
}

void sub_1000583C0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a3;
  if ([v7 type] == (id)2)
  {
    uint64_t v8 = [[NEKSourceWrapper alloc] initWithAccount:v7];
    char v9 = *(void **)(qword_1000C6CA8 + 8);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = [v7 remObjectID];
        int v12 = 138543362;
        BOOL v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending source wrapper for CloudKit account %{public}@", (uint8_t *)&v12, 0xCu);
      }
      if (([*(id *)(a1 + 32) push:v8] & 1) == 0) {
        *a5 = 1;
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_1000700C8(v9, v7);
    }
  }
}

void sub_1000587F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005881C(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  id v9 = a3;
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) wrapperForList:v9];
    if (v10)
    {
      id v11 = [v9 remObjectID];
      int v12 = [*(id *)(a1 + 40) remObjectID];
      unsigned int v13 = [v11 isEqual:v12];

      if (v13)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        [v10 setIsDefaultTaskCalendar:1];
        __int16 v14 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *(void **)(a1 + 40);
          id v16 = v14;
          uint64_t v17 = [v15 name];
          id v18 = sub_10002D3E0(v17);
          uint64_t v19 = [*(id *)(a1 + 40) objectID];
          int v21 = 138543618;
          id v22 = v18;
          __int16 v23 = 2114;
          uint64_t v24 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Marking default list in wrapper to list with name %{public}@, identifier %{public}@", (uint8_t *)&v21, 0x16u);
        }
      }
      if (([*(id *)(a1 + 48) push:v10] & 1) == 0) {
        *a5 = 1;
      }
    }
    else
    {
      unsigned int v20 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000701C4(v20, v9);
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10007015C();
  }
}

void sub_100058D70(id *a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  id v9 = a3;
  if (v9)
  {
    if (((sub_1000176EC() & 1) != 0 || [a1[4] reminderInWindow:v9])
      && sub_10000BDFC(v9)
      && [a1[5] shouldSendReminder:v9])
    {
      id v11 = [a1[5] wrapperForReminder:v9 oldListIdentifier:0];
      if (([a1[6] push:v11] & 1) == 0) {
        *a5 = 1;
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100070258();
  }
}

void sub_100058E7C(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  id v9 = a3;
  if (v9)
  {
    if (((sub_1000176EC() & 1) != 0 || [*(id *)(a1 + 32) reminderInWindow:v9])
      && [*(id *)(a1 + 40) shouldSendReminder:v9])
    {
      id v11 = *(void **)(a1 + 48);
      int v12 = [v9 objectID];
      unsigned int v13 = [v11 objectForKeyedSubscript:v12];

      __int16 v14 = [*(id *)(a1 + 40) wrapperForReminder:v9 oldListIdentifier:v13];
      if (v14 && ([*(id *)(a1 + 56) push:v14] & 1) == 0) {
        *a5 = 1;
      }
    }
    else if (os_variant_has_internal_diagnostics())
    {
      id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        uint64_t v17 = [v9 eks_debugDesc];
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Decided not to send reminder %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100070258();
  }
}

void sub_10005A35C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_10005A378(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10005A81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10005A830(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained notifyForDatabaseUpdatesIfNeeded];
}

void sub_10005C0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005C108(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = [a3 objectForKey:kCalDatabaseChangesAffectingNext24HoursKey];
  uint64_t v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = *(void **)(a1 + 32);
    uint64_t v19 = v9;
    unsigned int v20 = [v18 description];
    int v21 = [v7 description];
    int v22 = 138413058;
    __int16 v23 = v20;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 2112;
    uint64_t v27 = v21;
    __int16 v28 = 1024;
    BOOL v29 = v8 != 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Changes since token %@, success = %{BOOL}d, currentSequenceToken = %@, affectingNext24hrs = %{BOOL}d", (uint8_t *)&v22, 0x22u);

    if (!a2) {
      goto LABEL_5;
    }
  }
  else if (!a2)
  {
    goto LABEL_5;
  }
  if (!v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_5:
  if (a2)
  {
    if (v7) {
      [*(id *)(a1 + 40) setLastSequenceToken:v7];
    }
  }
  else
  {
    uint64_t v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100070674(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void sub_10005C5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak((id *)(v27 - 120));
  _Unwind_Resume(a1);
}

void *sub_10005C600(void *result)
{
  if (atomic_exchange((atomic_uchar *volatile)(*(void *)(result[4] + 8) + 24), 0)) {
    return +[NDTCrashSynthesizer writeStackshot:@"Fetching changes took a long time"];
  }
  return result;
}

void sub_10005C62C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v52 = a4;
  id v11 = a5;
  id v12 = a6;
  atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), 0);
  kdebug_trace();
  int64_t v13 = +[NDTPerf wallTime];
  uint64_t v14 = *(void *)(a1 + 80);
  [*(id *)(a1 + 32) setTruncated:a2];
  uint64_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *(_DWORD *)(a1 + 88);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)unint64_t v61 = v16;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = a3;
    __int16 v62 = 1024;
    int v63 = a3 - v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Previous sequence number: %d, current sequence number: %d, delta: %d", buf, 0x14u);
  }
  char v51 = a3;
  uint64_t v17 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)unint64_t v61 = (double)(unint64_t)(v13 - v14) / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetch duration: %.2f", buf, 0xCu);
  }
  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  sub_10005CE0C(@"Inserts:", v52, v18);
  sub_10005CE0C(@"Updates:", v11, v18);
  sub_10005CE0C(@"Deletes:", v12, v18);
  uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)unint64_t v61 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Aggregate changelog: %{public}@", buf, 0xCu);
  }
  unsigned int v20 = [*(id *)(a1 + 32) truncated];
  int v21 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Change log truncated", buf, 2u);
    }
    goto LABEL_51;
  }
  if (v22)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Fetching default calendars", buf, 2u);
  }
  unint64_t v49 = [*(id *)(a1 + 40) previousDefaultTaskCalendar];
  char v50 = [*(id *)(a1 + 40) previousDefaultEventCalendar];
  uint64_t v23 = [*(id *)(a1 + 48) defaultCalendarForNewReminders];
  uint64_t v24 = [*(id *)(a1 + 48) defaultCalendarForNewEvents];
  int v25 = [*(id *)(a1 + 40) environment];
  unsigned int v26 = [v25 isReminderKitEnabled];

  if (v26)
  {
    uint64_t v27 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)unint64_t v61 = "-[NEKEventChangeObserver _fetchChangesInto:from:inside:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for getting default task calendar", buf, 0xCu);
    }
    __int16 v28 = (void *)v23;
  }
  else
  {
    if (!v23) {
      goto LABEL_18;
    }
    __int16 v28 = [(id)v23 calendarIdentifier];
    if (!v49 || ([v49 isEqualToString:v28] & 1) == 0)
    {
      unint64_t v37 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Changed default task calendar", buf, 2u);
      }
      goto LABEL_17;
    }

    uint64_t v31 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Unchanged default task calendar", buf, 2u);
    }
  }
  uint64_t v23 = 0;
LABEL_17:

LABEL_18:
  if (v24)
  {
    BOOL v29 = [(id)v24 calendarIdentifier];
    if (v50 && ([v50 isEqualToString:v29] & 1) != 0)
    {

      uint64_t v30 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Unchanged default events calendar", buf, 2u);
      }
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v32 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Changed default event calendar", buf, 2u);
      }
    }
  }
  uint64_t v33 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Done fetching default calendars", buf, 2u);
  }
  if (v23 | v24)
  {
    if (v11)
    {
      id v34 = [v11 mutableCopy];
      if (v23)
      {
        id v35 = [(id)v23 objectID];
        [v34 addObject:v35];
      }
      if (v24)
      {
        uint64_t v36 = [(id)v24 objectID];
        [v34 addObject:v36];
      }
    }
    else
    {
      char v38 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1000706AC(v38, v39, v40, v41, v42, v43, v44, v45);
      }
      id v34 = 0;
    }
  }
  else
  {
    id v34 = v11;
  }
  [*(id *)(a1 + 32) setInserts:v52];
  [*(id *)(a1 + 32) setUpdates:v34];
  [*(id *)(a1 + 32) setDeletes:v12];
  [*(id *)(a1 + 32) setChangeNumber:v51];
  [*(id *)(a1 + 32) setTruncated:0];
  [*(id *)(a1 + 32) setHasChangesInNext24hrs:*(unsigned __int8 *)(a1 + 92)];
  if ([*(id *)(a1 + 32) isEmpty])
  {
    unsigned int v46 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "EventKit: Change set is empty.", buf, 2u);
    }
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10005CFB8;
  v53[3] = &unk_1000A9EE0;
  objc_copyWeak(v59, (id *)(a1 + 72));
  id v54 = *(id *)(a1 + 48);
  v59[1] = v51;
  id v55 = v12;
  id v56 = *(id *)(a1 + 56);
  id v47 = (id)v23;
  id v57 = v47;
  id v48 = (id)v24;
  id v58 = v48;
  [*(id *)(a1 + 32) setCompletion:v53];

  objc_destroyWeak(v59);
  id v11 = v34;
LABEL_51:
}

void sub_10005CDF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10005CE0C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005DA08;
  v20[3] = &unk_1000A9F30;
  id v8 = v5;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  uint64_t v10 = objc_retainBlock(v20);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        ((void (*)(void *, void))v10[2])(v10, *(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v13);
  }
}

void sub_10005CFB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [*(id *)(a1 + 32) markChangedObjectIDsConsumedUpToToken:*(void *)(a1 + 80)];
  [WeakRetained setLastSequenceNumber:*(unsigned int *)(a1 + 80)];
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) removeIdentifiersForDeletedRecordIDs:];
  }
  unint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    id v3 = [v2 calendarIdentifier];
    [WeakRetained setPreviousDefaultTaskCalendar:v3];
  }
  uint64_t v4 = *(void **)(a1 + 64);
  if (v4)
  {
    id v5 = [v4 calendarIdentifier];
    [WeakRetained setPreviousDefaultEventCalendar:v5];
  }
}

void sub_10005DA08(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [a2 entityName];
  id v8 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  if (v5)
  {
    id v6 = v5;
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v5 integerValue] + 1);
    id v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &off_1000AF260;
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
}

uint64_t sub_10005E510(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 40;
        goto LABEL_48;
      case 2u:
        long long v16 = objc_alloc_init(NEKPBCalendarIdentifier);
        objc_storeStrong((id *)(a1 + 24), v16);
        if (!PBReaderPlaceMark() || (sub_10004768C((uint64_t)v16, a2) & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_35;
      case 3u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 104) |= 4u;
        while (2)
        {
          uint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v21 = v20 + 1;
          if (v20 == -1 || v21 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if (v22 < 0)
            {
              v17 += 7;
              BOOL v10 = v18++ >= 9;
              if (v10)
              {
                LODWORD(v19) = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v19) = 0;
        }
LABEL_54:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_49;
      case 4u:
        PBReaderReadString();
        long long v16 = (NEKPBCalendarIdentifier *)objc_claimAutoreleasedReturnValue();
        if (v16) {
          [(id)a1 addMetadataKeys:v16];
        }
        goto LABEL_36;
      case 5u:
        long long v16 = objc_alloc_init(NEKPBICSWrapperMetadata);
        [(id)a1 addMetadataValues:v16];
        if PBReaderPlaceMark() && (sub_10004A018((uint64_t)v16, a2))
        {
LABEL_35:
          PBReaderRecallMark();
LABEL_36:

LABEL_49:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_60:

        return 0;
      case 6u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 96;
        goto LABEL_48;
      case 7u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 80;
        goto LABEL_48;
      case 8u:
        *(unsigned char *)(a1 + 104) |= 2u;
        unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v24 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v24 = 0;
        }
        *(void *)(a1 + 16) = v24;
        goto LABEL_49;
      case 9u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
        goto LABEL_48;
      case 0xAu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 72;
        goto LABEL_48;
      case 0xBu:
        *(unsigned char *)(a1 + 104) |= 1u;
        unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v25 <= 0xFFFFFFFFFFFFFFF7
          && (unint64_t v26 = v25 + 8, v25 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)))
        {
          uint64_t v27 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
        }
        else
        {
          uint64_t v27 = 0;
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        }
        *(void *)(a1 + 8) = v27;
        goto LABEL_49;
      case 0xCu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 48;
LABEL_48:
        __int16 v28 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_49;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_49;
    }
  }
}

BOOL sub_10005FCE4(uint64_t a1, uint64_t a2)
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
        id v12 = objc_alloc_init(NEKPBDuplicateCheck);
        objc_storeStrong((id *)(a1 + 8), v12);
        if (!PBReaderPlaceMark() || !sub_10003A070(v12, a2)) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    id v12 = objc_alloc_init(NEKPBOccurrenceCache);
    objc_storeStrong((id *)(a1 + 16), v12);
    if (!PBReaderPlaceMark() || (sub_100003D98(v12, a2) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100060C80(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
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
        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = (v6 & 7) == 4;
        }
        if (!v12)
        {
          switch((v6 >> 3))
          {
            case 1u:
              uint64_t v13 = PBReaderReadString();
              uint64_t v14 = 32;
              goto LABEL_26;
            case 2u:
              uint64_t v13 = PBReaderReadString();
              uint64_t v14 = 24;
              goto LABEL_26;
            case 3u:
              uint64_t v13 = PBReaderReadString();
              uint64_t v14 = 16;
LABEL_26:
              unsigned int v18 = *(void **)(a1 + v14);
              *(void *)(a1 + v14) = v13;

              goto LABEL_29;
            case 4u:
              *(unsigned char *)(a1 + 40) |= 1u;
              unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v15 <= 0xFFFFFFFFFFFFFFF7 && v15 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                uint64_t v16 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                uint64_t v16 = 0;
              }
              *(void *)(a1 + 8) = v16;
              goto LABEL_29;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_29:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_1000614D4(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = [v1 sourceIdentifier];
LABEL_9:
      uint64_t v3 = (void *)v2;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = [v1 calendarIdentifier];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v2 = [v1 uniqueId];
      goto LABEL_9;
    }
  }
  uint64_t v3 = 0;
LABEL_11:

  return v3;
}

void sub_1000617FC(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      unsigned int v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5));
        unsigned int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_100061ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100061EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained notifyForDatabaseUpdatesIfNeeded];
}

void sub_10006295C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100062980(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) reminderInWindow:v8])
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      long long v6 = *(void **)(a1 + 40);
      long long v7 = +[NEKICSWrapper wrapperForReminder:v8 oldListIdentifier:0 store:*(void *)(a1 + 48)];
      LOBYTE(v6) = [v6 push:v7];

      if ((v6 & 1) == 0)
      {
        *a3 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
  }
}

void sub_10006314C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak((id *)(v28 - 96));
  _Unwind_Resume(a1);
}

uint64_t sub_100063188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100063198(uint64_t a1)
{
}

void sub_1000631A0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v65 = a3;
  id v67 = a4;
  id v66 = a5;
  id v64 = a6;
  id v70 = a7;
  id v62 = a8;
  kdebug_trace();
  uint64_t v68 = a1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a7);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a8);
  [*(id *)(a1 + 32) setTruncated:a2];
  unint64_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v93 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Previous sequence number: %@", buf, 0xCu);
  }
  char v17 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v93 = v65;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Current sequence number: %@", buf, 0xCu);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "truncated", v62))
  {
    unsigned int v18 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Change log truncated", buf, 2u);
    }
  }
  else
  {
    uint64_t v19 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v67 count]);
    uint64_t v20 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v66 count]);
    char v69 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v64 count]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id obj = v67;
    id v21 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v86;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v86 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = [*(id *)(*((void *)&v85 + 1) + 8 * i) changedObjectID];
          [v19 addObject:v24];
        }
        id v21 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v21);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v82 = 0u;
    long long v81 = 0u;
    id v25 = v66;
    id v26 = [v25 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v82;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v82 != v27) {
            objc_enumerationMutation(v25);
          }
          BOOL v29 = [*(id *)(*((void *)&v81 + 1) + 8 * (void)j) changedObjectID];
          [v20 addObject:v29];
        }
        id v26 = [v25 countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v26);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v71 = v25;
    id v30 = [v71 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v78;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v78 != v31) {
            objc_enumerationMutation(v71);
          }
          uint64_t v33 = *(void **)(*((void *)&v77 + 1) + 8 * (void)k);
          id v34 = [v33 updatedProperties];
          unsigned int v35 = [v34 containsObject:@"markedForDeletion"];

          if (v35)
          {
            uint64_t v36 = [v33 changedObjectID];
            unint64_t v37 = [v70 allKeys];
            unsigned int v38 = [v37 containsObject:v36];

            if (v38)
            {
              uint64_t v39 = *(NSObject **)(qword_1000C6CA8 + 8);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v93 = v36;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Found marked as delete reminder %{public}@", buf, 0xCu);
              }
              [v69 addObject:v36];
            }
            else
            {
              uint64_t v40 = [v36 entityName];
              uint64_t v41 = +[REMList cdEntityName];
              unsigned int v42 = [v40 isEqualToString:v41];

              if (v42)
              {
                uint64_t v43 = +[REMStore eks_storeForSyncing];
                uint64_t v44 = [v43 fetchListWithObjectID:v36 error:0];
                BOOL v45 = v44 == 0;

                if (v45)
                {
                  unsigned int v46 = *(NSObject **)(qword_1000C6CA8 + 8);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v93 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Found marked as delete list %{public}@", buf, 0xCu);
                  }
                  [v69 addObject:v36];
                }
              }
              else
              {
                id v47 = *(NSObject **)(qword_1000C6CA8 + 8);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v93 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Unhandled object with markedForDeletion update %{public}@", buf, 0xCu);
                }
              }
            }
          }
        }
        id v30 = [v71 countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v30);
    }

    id v48 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Fetching default list", buf, 2u);
    }
    unint64_t v49 = [*(id *)(v68 + 48) previousDefaultReminderListID];
    char v50 = [*(id *)(v68 + 56) freshEventStoreFor:@"_fetchChangesInto(Reminders)"];
    char v51 = [v50 fetchDefaultListWithError:0];

    if (v51)
    {
      id v52 = [v51 objectID];
      if (v49 && ([v49 isEqual:v52] & 1) != 0)
      {

        uint64_t v53 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Unchanged default list", buf, 2u);
        }
        char v51 = 0;
      }
      else
      {
        id v54 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Changed default list", buf, 2u);
        }
      }
    }
    id v55 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "fetchChangesInto: Done fetching default list", buf, 2u);
    }
    if (v51)
    {
      if (v71)
      {
        id v56 = [v51 objectID];
        [v20 addObject:v56];
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_1000709A4();
      }
    }
    id v57 = [v19 array];
    [*(id *)(v68 + 32) setInserts:v57];

    id v58 = [v20 array];
    [*(id *)(v68 + 32) setUpdates:v58];

    uint64_t v59 = [v69 array];
    [*(id *)(v68 + 32) setDeletes:v59];

    [*(id *)(v68 + 32) setTruncated:0];
    if ([*(id *)(v68 + 32) isEmpty])
    {
      uint64_t v60 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "ReminderKit: Change set is empty.", buf, 2u);
      }
    }
    else
    {
      sub_100063C94((uint64_t)"ReminderKit: Inserts: ", obj);
      sub_100063C94((uint64_t)"ReminderKit: Updates: ", v71);
      sub_100063C94((uint64_t)"ReminderKit: Deletes: ", v64);
    }
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000640D8;
    v73[3] = &unk_1000A9418;
    objc_copyWeak(&v76, (id *)(v68 + 88));
    id v74 = v65;
    id v61 = v51;
    id v75 = v61;
    [*(id *)(v68 + 32) setCompletion:v73];

    objc_destroyWeak(&v76);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v68 + 64));
}

void sub_100063C78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100063C94(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (!v2)
  {
    unint64_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "--empty--", buf, 2u);
    }
    goto LABEL_23;
  }
  uint64_t v4 = (uint64_t)[v2 count];
  if (v4 < 4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    do
    {
      long long v7 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        long long v9 = [v3 objectAtIndexedSubscript:v5];
        int v10 = [v3 objectAtIndexedSubscript:v5 + 1];
        int v11 = [v3 objectAtIndexedSubscript:v5 + 2];
        [v3 objectAtIndexedSubscript:v5 + 3];
        v13 = BOOL v12 = v3;
        *(_DWORD *)buf = 136447234;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        BOOL v29 = v9;
        __int16 v30 = 2114;
        uint64_t v31 = v10;
        __int16 v32 = 2114;
        uint64_t v33 = v11;
        __int16 v34 = 2114;
        unsigned int v35 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s%{public}@, %{public}@, %{public}@, %{public}@", buf, 0x34u);

        id v3 = v12;
      }
      v5 += 4;
      uint64_t v4 = v6 - 4;
      BOOL v14 = v6 <= 7;
      v6 -= 4;
    }
    while (!v14);
  }
  switch(v4)
  {
    case 3:
      uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        break;
      }
      char v17 = v19;
      uint64_t v20 = [v3 objectAtIndexedSubscript:v5];
      id v21 = [v3 objectAtIndexedSubscript:v5 | 1];
      uint64_t v22 = [v3 objectAtIndexedSubscript:v5 | 2];
      *(_DWORD *)buf = 136446978;
      uint64_t v27 = a1;
      __int16 v28 = 2114;
      BOOL v29 = v20;
      __int16 v30 = 2114;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s%{public}@, %{public}@, %{public}@", buf, 0x2Au);

LABEL_21:
      goto LABEL_22;
    case 2:
      unint64_t v23 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        break;
      }
      char v17 = v23;
      uint64_t v20 = [v3 objectAtIndexedSubscript:v5];
      uint64_t v24 = [v3 objectAtIndexedSubscript:v5 | 1];
      *(_DWORD *)buf = 136446722;
      uint64_t v27 = a1;
      __int16 v28 = 2114;
      BOOL v29 = v20;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s%{public}@, %{public}@", buf, 0x20u);

      goto LABEL_21;
    case 1:
      uint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        char v17 = v16;
        unsigned int v18 = [v3 objectAtIndexedSubscript:v5];
        *(_DWORD *)buf = 136446466;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        BOOL v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s%{public}@", buf, 0x16u);

LABEL_22:
      }
      break;
  }
LABEL_23:
}

void sub_1000640D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained saveChangeTrackingStateMap:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = [v2 objectID];
    [WeakRetained setPreviousDefaultReminderListID:v3];
  }
}

void sub_100064BC0(uint64_t a1)
{
  id v2 = +[REMChangeTracking internalTransactionAuthorKeysToExclude];
  id v5 = [v2 mutableCopy];

  [v5 addObject:*(void *)(*(void *)(a1 + 32) + 8)];
  id v3 = [v5 copy];
  uint64_t v4 = (void *)qword_1000C6C68;
  qword_1000C6C68 = (uint64_t)v3;
}

BOOL sub_100064DBC(id a1, REMAccount *a2, id a3)
{
  return sub_10000BCFC(a2);
}

BOOL sub_100064EC4(id a1, NSArray *a2)
{
  return 1;
}

NEKReminderChangeTrackingState *sub_100064ECC(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) transactionAuthorsToExclude];
  long long v7 = [v4 provideChangeTrackingForAccountID:v3 clientName:v5 transactionAuthorKeysToExclude:v6];

  id v8 = [NEKReminderChangeTrackingState alloc];
  long long v9 = +[_REMChangeUniversalToken universalToken];
  int v10 = [(NEKReminderChangeTrackingState *)v8 initWithChangeTracking:v7 lastChangeToken:v9];

  return v10;
}

BOOL sub_100065070(id a1, NSArray *a2)
{
  return 1;
}

NEKReminderChangeTrackingState *sub_100065078(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) transactionAuthorsToExclude];
  long long v7 = [v4 provideChangeTrackingForAccountID:v3 clientName:v5 transactionAuthorKeysToExclude:v6];

  id v8 = [v7 currentChangeTokenWithError:0];
  if (!v8)
  {
    id v8 = +[_REMChangeUniversalToken universalToken];
  }
  long long v9 = [[NEKReminderChangeTrackingState alloc] initWithChangeTracking:v7 lastChangeToken:v8];

  return v9;
}

uint64_t sub_1000652A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectID];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  int v11 = +[NSMutableSet set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v12 = [[*(id *)(a1 + 32) allKeys];
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
        if (([v4 containsObject:v17] & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  id v18 = [v11 copy];
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void **)(v19 + 32);
  *(void *)(v19 + 32) = v18;

  return 1;
}

NEKReminderChangeTrackingState *sub_1000654C0(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) transactionAuthorsToExclude];
  id v7 = [v4 provideChangeTrackingForAccountID:v3 clientName:v5 transactionAuthorKeysToExclude:v6];

  uint64_t v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
  if (!v8)
  {
    uint64_t v8 = +[_REMChangeUniversalToken universalToken];
  }
  long long v9 = [[NEKReminderChangeTrackingState alloc] initWithChangeTracking:v7 lastChangeToken:v8];

  return v9;
}

void sub_100065B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100065B94(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 changeTracking];
  char v103 = v6;
  uint64_t v8 = [v6 lastChangeToken];
  id v132 = 0;
  long long v9 = [v7 fetchHistoryAfterToken:v8 error:&v132];
  id v110 = v132;

  char v97 = v9;
  if (!v9)
  {
    long long v78 = *(NSObject **)(qword_1000C6CA8 + 8);
    id v24 = v110;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v137 = v5;
      __int16 v138 = 2114;
      v139 = v103;
      __int16 v140 = 2112;
      id v141 = v110;
      _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Error fetching changes for account %{public}@ with state %{public}@, assuming changes are truncated: %@", buf, 0x20u);
    }
    uint64_t v79 = a1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_80;
  }
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_1000669E4;
  v130[3] = &unk_1000AA0C0;
  id v92 = v5;
  id v10 = v5;
  id v131 = v10;
  uint64_t v11 = +[NSPredicate predicateWithBlock:v130];
  BOOL v12 = [v9 inserts];
  unint64_t v96 = [v12 filteredArrayUsingPredicate:v11];

  id v13 = [v9 updates];
  id v14 = [v13 filteredArrayUsingPredicate:v11];

  uint64_t v15 = [v9 deletes];
  unint64_t v91 = (void *)v11;
  uint64_t v95 = [v15 filteredArrayUsingPredicate:v11];

  uint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  id v93 = v10;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v106 = v16;
    uint64_t v100 = [v103 lastChangeToken];
    char v108 = [v9 inserts];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v108 count]);
    id obja = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v9 updates];
    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);
    uint64_t v19 = [v9 deletes];
    uint64_t v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
    id v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v96 count]);
    long long v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
    long long v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v95 count]);
    *(_DWORD *)buf = 138545154;
    id v137 = v93;
    __int16 v138 = 2114;
    v139 = v100;
    __int16 v140 = 2114;
    id v141 = obja;
    __int16 v142 = 2114;
    v143 = v18;
    __int16 v144 = 2114;
    v145 = v20;
    __int16 v146 = 2114;
    v147 = v21;
    __int16 v148 = 2114;
    v149 = v22;
    __int16 v150 = 2114;
    v151 = v23;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Filtered change set summary for account %{public}@ since token %{public}@: before: i=%{public}@ u=%{public}@ d=%{public}@; after: i=%{public}@ u=%{public}@ d=%{public}@",
      buf,
      0x52u);
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id obj = v14;
  id v109 = [obj countByEnumeratingWithState:&v126 objects:v135 count:16];
  if (!v109)
  {
    id v24 = v110;
    goto LABEL_67;
  }
  uint64_t v107 = *(void *)v127;
  id v24 = v110;
  do
  {
    long long v25 = 0;
    do
    {
      if (*(void *)v127 != v107) {
        objc_enumerationMutation(obj);
      }
      long long v26 = *(void **)(*((void *)&v126 + 1) + 8 * (void)v25);
      long long v27 = [v26 changedObjectID];
      long long v28 = [v26 updatedProperties];
      if ([v28 containsObject:@"markedForDeletion"])
      {
        char v111 = v26;
        unsigned int v113 = v25;
        long long v29 = [v27 entityName];
        __int16 v30 = +[REMReminder cdEntityName];
        unsigned int v31 = [v29 isEqualToString:v30];

        if (v31)
        {
          __int16 v32 = [v103 changeTracking];
          uint64_t v33 = objc_opt_class();
          id v125 = v24;
          long long v26 = v111;
          __int16 v34 = [v32 fetchAuxiliaryChangeInfosOfType:v33 withChangeObject:v111 error:&v125];
          id v101 = v125;

          unsigned int v35 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v36 = v35;
            unint64_t v37 = [v34 auxiliaryChangeInfos];
            *(_DWORD *)buf = 138412546;
            id v137 = v37;
            __int16 v138 = 2114;
            v139 = v27;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Fetched auxiliary delete change info %@ for object ID %{public}@", buf, 0x16u);
          }
          long long v25 = v113;
          if (v34)
          {
            long long v124 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            long long v121 = 0u;
            unsigned int v38 = [v34 auxiliaryChangeInfos];
            id v39 = [v38 countByEnumeratingWithState:&v121 objects:v134 count:16];
            if (v39)
            {
              id v40 = v39;
              char v98 = v34;
              uint64_t v41 = *(void *)v122;
              while (2)
              {
                for (i = 0; i != v40; i = (char *)i + 1)
                {
                  if (*(void *)v122 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v43 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                  uint64_t v44 = [v43 reminderIdentifier];
                  BOOL v45 = [v27 uuid];
                  unsigned int v46 = [v45 UUIDString];
                  unsigned int v47 = [v44 isEqualToString:v46];

                  if (v47)
                  {
                    char v50 = [v43 oldListIdentifier];
                    char v51 = *(NSObject **)(qword_1000C6CA8 + 8);
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      id v137 = v50;
                      __int16 v138 = 2114;
                      v139 = v27;
                      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Old list ID %{public}@ for deleted reminder %{public}@", buf, 0x16u);
                    }
                    [*(id *)(a1 + 32) setObject:v50 forKeyedSubscript:v27];

                    int v48 = 1;
                    goto LABEL_28;
                  }
                }
                id v40 = [v38 countByEnumeratingWithState:&v121 objects:v134 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
              int v48 = 0;
LABEL_28:
              long long v26 = v111;
              long long v25 = v113;
              __int16 v34 = v98;
            }
            else
            {
              int v48 = 0;
            }
          }
          else
          {
            id v52 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v24 = v101;
              id v137 = v101;
              _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Error fetching auxiliary change info %@", buf, 0xCu);
              int v48 = 0;
              goto LABEL_34;
            }
            int v48 = 0;
          }
          id v24 = v101;
LABEL_34:

          BOOL v49 = v48 != 0;
          goto LABEL_35;
        }
        BOOL v49 = 0;
        long long v26 = v111;
        long long v25 = v113;
      }
      else
      {

        BOOL v49 = 0;
      }
LABEL_35:
      uint64_t v53 = [v26 updatedProperties];
      unsigned int v54 = [v53 containsObject:@"list"];
      if (!v49 && v54)
      {
        id v55 = v24;
        id v56 = [v27 entityName];
        id v57 = +[REMReminder cdEntityName];
        unsigned int v58 = [v56 isEqualToString:v57];

        if (!v58)
        {
          id v24 = v55;
          goto LABEL_58;
        }
        uint64_t v59 = [v103 changeTracking];
        uint64_t v60 = objc_opt_class();
        id v120 = v55;
        uint64_t v53 = [v59 fetchAuxiliaryChangeInfosOfType:v60 withChangeObject:v26 error:&v120];
        id v24 = v120;

        id v61 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          id v62 = v61;
          int v63 = [v53 auxiliaryChangeInfos];
          *(_DWORD *)buf = 138412546;
          id v137 = v63;
          __int16 v138 = 2114;
          v139 = v27;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Fetched auxiliary move change info %@ for object ID %{public}@", buf, 0x16u);
        }
        if (v53)
        {
          id v112 = v24;
          unint64_t v114 = v25;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          char v102 = v53;
          id v64 = [v53 auxiliaryChangeInfos];
          id v65 = [v64 countByEnumeratingWithState:&v116 objects:v133 count:16];
          if (v65)
          {
            id v66 = v65;
            uint64_t v67 = *(void *)v117;
            while (2)
            {
              for (j = 0; j != v66; j = (char *)j + 1)
              {
                if (*(void *)v117 != v67) {
                  objc_enumerationMutation(v64);
                }
                char v69 = *(void **)(*((void *)&v116 + 1) + 8 * (void)j);
                id v70 = [v69 reminderIdentifier];
                id v71 = [v27 uuid];
                unint64_t v72 = [v71 UUIDString];
                unsigned int v73 = [v70 isEqualToString:v72];

                if (v73)
                {
                  id v74 = [v69 oldListIdentifier];
                  id v75 = *(NSObject **)(qword_1000C6CA8 + 8);
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v137 = v74;
                    __int16 v138 = 2114;
                    v139 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Old list ID %{public}@ for moved reminder %{public}@", buf, 0x16u);
                  }
                  [*(id *)(a1 + 32) setObject:v74 forKeyedSubscript:v27];

                  goto LABEL_54;
                }
              }
              id v66 = [v64 countByEnumeratingWithState:&v116 objects:v133 count:16];
              if (v66) {
                continue;
              }
              break;
            }
          }

LABEL_54:
          id v24 = v112;
          long long v25 = v114;
          uint64_t v53 = v102;
        }
        else
        {
          id v76 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v137 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Error fetching auxiliary change info %@", buf, 0xCu);
          }
        }
      }

LABEL_58:
      long long v25 = (char *)v25 + 1;
    }
    while (v25 != v109);
    id v77 = [obj countByEnumeratingWithState:&v126 objects:v135 count:16];
    id v109 = v77;
  }
  while (v77);
LABEL_67:

  [*(id *)(a1 + 40) addObjectsFromArray:v96];
  [*(id *)(a1 + 48) addObjectsFromArray:obj];
  [*(id *)(a1 + 56) addObjectsFromArray:v95];
  uint64_t v80 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v80 + 24)) {
    goto LABEL_70;
  }
  if ([v97 isTruncated])
  {
    uint64_t v80 = *(void *)(*(void *)(a1 + 72) + 8);
LABEL_70:
    *(unsigned char *)(v80 + 24) = 1;
  }
  else
  {
    long long v88 = [v97 error];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v88 != 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    long long v81 = [v103 changeTracking];
    id v115 = v24;
    long long v82 = [v81 currentChangeTokenWithError:&v115];
    id v83 = v115;

    long long v84 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      char v89 = v84;
      unsigned int v90 = [v103 lastChangeToken];
      *(_DWORD *)buf = 138543874;
      id v137 = v93;
      __int16 v138 = 2114;
      v139 = v90;
      __int16 v140 = 2114;
      id v141 = v82;
      _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Resetting to current change token for account %{public}@ because change history is truncated (lastChangeToken=%{public}@, latestChangeToken=%{public}@).", buf, 0x20u);
    }
    id v24 = v83;
  }
  else
  {
    long long v82 = [v97 lastChangeTokenForAccountID:v93];
    long long v85 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      long long v86 = v85;
      long long v87 = [v103 lastChangeToken];
      *(_DWORD *)buf = 138543874;
      id v137 = v93;
      __int16 v138 = 2114;
      v139 = v87;
      __int16 v140 = 2114;
      id v141 = v82;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Forward to latest change token for account %{public}@ (lastChangeToken=%{public}@, latestChangeToken=%{public}@).", buf, 0x20u);
    }
  }
  id v5 = v92;
  if (v82) {
    [*(id *)(a1 + 64) setChangeToken:v82 forAccountID:v93];
  }

  uint64_t v79 = a1;
LABEL_80:
  if (*(unsigned char *)(*(void *)(*(void *)(v79 + 72) + 8) + 24)) {
    *a4 = 1;
  }
}

id sub_1000669E4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 transaction];
  uint64_t v4 = [v3 accountID];
  id v5 = [v2 isEqual:v4];

  return v5;
}

void sub_100066CC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 lastChangeToken];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t sub_1000670EC(uint64_t a1, uint64_t a2)
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
        uint64_t v14 = 32;
        goto LABEL_28;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 40;
        goto LABEL_28;
      case 3u:
        *(unsigned char *)(a1 + 64) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        *(void *)(a1 + 8) = v17;
        continue;
      case 4u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
        goto LABEL_28;
      case 5u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 24;
        goto LABEL_28;
      case 6u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
LABEL_28:
        id v18 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 7u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 64) |= 2u;
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
      uint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v23 = v22 + 1;
      if (v22 == -1 || v23 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23;
      v21 |= (unint64_t)(v24 & 0x7F) << v19;
      if ((v24 & 0x80) == 0) {
        goto LABEL_39;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v21) = 0;
        goto LABEL_41;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v21) = 0;
    }
LABEL_41:
    *(_DWORD *)(a1 + 48) = v21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000681A8(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v4 = [v6 objectID];
  if (v4)
  {
    unsigned int v5 = [*(id *)(a1 + 32) identifierForRecordID:v4];

    if (!v5) {
      [*(id *)(a1 + 40) _deleteEventById:v4];
    }
  }
}

void sub_1000688E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100068994(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = sub_100069224();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6C78);
  char v19 = v3;
  id v18 = +[NSString stringWithFormat:@"%@<%p>", v3, v4];
  [v5 setObject:v4 forKey:];
  id v6 = [v5 keyEnumerator];
  uint64_t v7 = [v6 allObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v5 objectForKey:v14];

        if (v15)
        {
          unint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EKa: Live EKEventStore: %{public}@", buf, 0xCu);
          }
          ++v11;
        }
        else
        {
          [v5 removeObjectForKey:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }

  uint64_t v17 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EKa: Total stores: %d", buf, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6C78);
}

id sub_100069224()
{
  if (qword_1000C6C80 != -1) {
    dispatch_once(&qword_1000C6C80, &stru_1000AA130);
  }
  uint64_t v0 = (void *)qword_1000C6C88;

  return v0;
}

void sub_100069278(id a1)
{
  qword_1000C6C88 = (uint64_t)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:5 capacity:20];

  _objc_release_x1();
}

void start()
{
  uint64_t v0 = dispatch_get_global_queue(33, 0);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  id v2 = (void *)qword_1000C6C90;
  qword_1000C6C90 = (uint64_t)v1;

  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0, v0);
  id v4 = (void *)qword_1000C6C98;
  qword_1000C6C98 = (uint64_t)v3;

  unsigned int v5 = dispatch_get_global_queue(17, 0);
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v5);
  uint64_t v7 = (void *)qword_1000C6CA0;
  qword_1000C6CA0 = (uint64_t)v6;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000C6C90, &stru_1000AA150);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000C6C98, &stru_1000AA170);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000C6CA0, &stru_1000AA190);
  dispatch_activate((dispatch_object_t)qword_1000C6C90);
  dispatch_activate((dispatch_object_t)qword_1000C6C98);
  dispatch_activate((dispatch_object_t)qword_1000C6CA0);
  signal(30, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  sub_1000069C0(21);
  sub_1000069E4(21);
  id v9 = +[NEKEnvironment instance];
  id v10 = [[NEKDaemon alloc] initWithEnvironment:v9];
  [v9 setDaemon:v10];

  dispatch_main();
}

void sub_10006944C(id a1)
{
  dispatch_source_t v1 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM, Bye bye.", v2, 2u);
  }
  exit(0);
}

void sub_1000694BC(id a1)
{
  dispatch_source_t v1 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGQUIT, Bye bye.", v2, 2u);
  }
  xpc_transaction_exit_clean();
}

void sub_100069538(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, (os_log_type_t)0x90u)) {
    sub_100070E9C();
  }
}

void sub_100069828(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10006984C(uint64_t a1, void *a2)
{
  dispatch_source_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t state = xpc_activity_get_state(v3);
  dispatch_source_t v6 = [WeakRetained log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [WeakRetained activityIdentifier];
    if (state <= 5) {
      id v8 = (&off_1000AA1D8)[state];
    }
    else {
      id v8 = "OUT_OF_BOUNDS";
    }
    int v20 = 136315394;
    id v21 = v7;
    __int16 v22 = 2080;
    long long v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checkin activity state for %s: %s", (uint8_t *)&v20, 0x16u);
  }

  if (state == 2)
  {
    uint64_t v12 = +[NSDate date];
    uint64_t v13 = [WeakRetained estimatedFireDate];

    if (v13)
    {
      uint64_t v14 = [WeakRetained estimatedFireDate];
      [v12 timeIntervalSinceDate:v14];
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0;
    }
    uint64_t v17 = [WeakRetained log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [WeakRetained activityIdentifier];
      int v20 = 136315394;
      id v21 = v18;
      __int16 v22 = 2048;
      long long v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Running %s (late by: %.02f)", (uint8_t *)&v20, 0x16u);
    }

    [WeakRetained setEstimatedFireDate:0];
    [WeakRetained _setState:4];
    char v19 = +[NSDate date];
    [WeakRetained setLastFired:v19];

    [WeakRetained _startDeferralPolling];
    [*(id *)(a1 + 32) activityRun:WeakRetained];
  }
  else if (state)
  {
    uint64_t v12 = [WeakRetained log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100070EE4(WeakRetained, state, v12);
    }
  }
  else
  {
    id v9 = [WeakRetained activityCondition];
    [v9 lock];

    [WeakRetained _setActivity:v3];
    id v10 = [WeakRetained activityCondition];
    [v10 broadcast];

    int v11 = [WeakRetained activityCondition];
    [v11 unlock];

    uint64_t v12 = [WeakRetained _currentCriteria];
    if (v12) {
      xpc_activity_set_criteria(v3, v12);
    }
    [WeakRetained setWaitingForCheckin:0];
  }
}

void sub_10006A470(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(WeakRetained + 2);
  if (v1) {
    char v2 = objc_opt_respondsToSelector();
  }
  else {
    char v2 = 0;
  }
  dispatch_source_t v3 = [WeakRetained activity];
  BOOL should_defer = xpc_activity_should_defer(v3);

  if (should_defer && (v2 & 1) != 0) {
    [v1 activityDefer:WeakRetained];
  }
}

uint64_t sub_10006A8E0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
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
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v13 = PBReaderReadString();
      uint64_t v14 = 8;
    }
    else
    {
      if (v12 == 2)
      {
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
          v18 |= (unint64_t)(v20 & 0x7F) << v16;
          if ((v20 & 0x80) == 0) {
            goto LABEL_33;
          }
          v16 += 7;
          BOOL v9 = v17++ >= 9;
          if (v9)
          {
            LODWORD(v18) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 24) = v18;
        continue;
      }
      if (v12 != 1)
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
      }
      uint64_t v13 = PBReaderReadString();
      uint64_t v14 = 16;
    }
    uint64_t v15 = *(void **)(a1 + v14);
    *(void *)(a1 + v14) = v13;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10006B374(uint64_t a1, uint64_t a2)
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
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_38;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_40;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_38:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_40:
        uint64_t v25 = 20;
        goto LABEL_45;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        break;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 8;
        goto LABEL_36;
      case 4u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
LABEL_36:
        char v24 = *(void **)(a1 + v23);
        *(void *)(a1 + v23) = v22;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
      v14 |= (unint64_t)(v21 & 0x7F) << v18;
      if ((v21 & 0x80) == 0) {
        goto LABEL_42;
      }
      v18 += 7;
      BOOL v9 = v19++ >= 9;
      if (v9)
      {
        LODWORD(v14) = 0;
        goto LABEL_44;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v14) = 0;
    }
LABEL_44:
    uint64_t v25 = 16;
LABEL_45:
    *(_DWORD *)(a1 + v25) = v14;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10006BD5C(uint64_t a1, uint64_t a2)
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
      char v12 = objc_alloc_init(NEKPBSourceAttributes);
      objc_storeStrong((id *)(a1 + 8), v12);
      if (!PBReaderPlaceMark() || (sub_100033B48((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
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

void sub_10006C120()
{
  __assert_rtn("NDTSetDefaultPriority", "NDTQueueFactory.m", 17, "qos != QOS_CLASS_UNSPECIFIED");
}

void sub_10006C14C()
{
  __assert_rtn("NDTSetElevatedPriority", "NDTQueueFactory.m", 22, "qos != QOS_CLASS_UNSPECIFIED");
}

void sub_10006C178(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Error fetching local account: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006C1F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Error fetching lists in local account: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006C268(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  id v4 = [objc_alloc((Class)NSString) initWithData:a2 encoding:4];
  unsigned int v5 = sub_10002D3E0(v4);
  int v6 = 138543362;
  unint64_t v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Adding ICS to wrapper to send: %{public}@", (uint8_t *)&v6, 0xCu);
}

void sub_10006C338(uint8_t *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  char v8 = [a3 remObjectID];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Reminder %{public}@ does not have daCalendarItemUniqueIdentifier. Falling back to use REMObjectID.", a1, 0xCu);
}

void sub_10006C3BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching account. Account's persistent ID: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

void sub_10006C434(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[NEKSourceID(Reminder) accountForStore:identifier:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10006C4C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  int v6 = [a2 identifier];
  int v7 = 138412546;
  char v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Task failed to submit request: %@ with error: %@", (uint8_t *)&v7, 0x16u);
}

void sub_10006C580()
{
  sub_100015844();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Validation faulting on second failure: Local: %@ Remote: %@", v1, 0x16u);
}

void sub_10006C5F8()
{
  sub_100015844();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Validation failure. Local: %@ Remote: %@", v1, 0x16u);
}

void sub_10006C670(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Called with nil recordID or nil event store", v1, 2u);
}

void sub_10006C6B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write data to disk: %@, path = %@", (uint8_t *)&v3, 0x16u);
}

void sub_10006C73C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to serialize report data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006C7B4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 duplicatedSources];
  [v4 count];
  __int16 v5 = [a2 duplicatedCalendars];
  [v5 count];
  sub_100018188();
  sub_1000181A0((void *)&_mh_execute_header, v6, v7, "Detected duplication, sources = %ld, calendars = %ld", v8, v9, v10, v11, v12);
}

void sub_10006C870(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 watchOnlyOccurrences];
  [v4 count];
  __int16 v5 = [a2 phoneOnlyOccurrences];
  [v5 count];
  sub_100018188();
  sub_1000181A0((void *)&_mh_execute_header, v6, v7, "Detected drift, watchOnly = %ld, phoneOnly = %ld", v8, v9, v10, v11, v12);
}

void sub_10006C92C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error saving EventKit database: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006C994()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "_shouldSendEvent: Got a nil identifier for event: %p", v2, v3, v4, v5, v6);
}

void sub_10006C9FC()
{
  sub_100022F74();
  id v2 = v1;
  uint64_t v3 = [[(id)sub_100022F80() eks_debugDesc]];
  sub_100022EE8();
  sub_100022F00((void *)&_mh_execute_header, v4, v5, "No calendar for event with summary %{public}@ identifier %{public}@, event won't be tracked for sending duplicates, but we'll soldier on and likely fail somewhere later down the line.", v6, v7, v8, v9, v10);
}

void sub_10006CA94()
{
  sub_100022F74();
  id v2 = v1;
  uint64_t v3 = [[(id)sub_100022F80() eks_debugDesc]];
  sub_100022EE8();
  sub_100022F00((void *)&_mh_execute_header, v4, v5, "Calendar identifier is nil for event %{public}@ identifier %{public}@. This is probably very bad.", v6, v7, v8, v9, v10);
}

void sub_10006CB2C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Identifier is nil after much fiddling. Perhaps the master identifier is to blame?", v1, 2u);
}

void sub_10006CB70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CBE0()
{
  sub_100022F74();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100022F80() sourceIdentifier];
  sub_100022EE8();
  sub_100022F00((void *)&_mh_execute_header, v4, v5, "Error saving new/updated source (%{public}@): %{public}@", v6, v7, v8, v9, v10);
}

void sub_10006CC78()
{
  sub_100022F74();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100022F80() sourceIdentifier];
  sub_100022EE8();
  sub_100022F00((void *)&_mh_execute_header, v4, v5, "Saving after creating a source (%{public}@) failed: %{public}@", v6, v7, v8, v9, v10);
}

void sub_10006CD10()
{
  sub_100022F74();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100022F80() sourceIdentifier];
  sub_100022EE8();
  sub_100022F00((void *)&_mh_execute_header, v4, v5, "Saving after updating a source (%{public}@) failed: %{public}@", v6, v7, v8, v9, v10);
}

void sub_10006CDA8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "I'm refusing to create this calendar because I am a phone.", v1, 2u);
}

void sub_10006CDEC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 56);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100022F20((void *)&_mh_execute_header, a2, a3, "Error saving updated calendar (%{public}@): %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006CE68()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error saving database while setting event invitation status: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006CED0()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to save event with identifier %{public}@. Error =  %{public}@");
}

void sub_10006CF38()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Can't get row id for master with identifier %{public}@ to set attendee status for recurring series", v2, v3, v4, v5, v6);
}

void sub_10006CFA0()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to commit after saving recurring event series with master identifier %{public}@. Error =  %{public}@");
}

void sub_10006D008()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Couldn't get master event for recurring event sequence with identifier %{public}@, but we'll check for detached events in case those are still around", v2, v3, v4, v5, v6);
}

void sub_10006D070(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 calendarIdentifier];
  sub_100022F58();
  sub_100022FAC((void *)&_mh_execute_header, v6, v7, "%{public}s: No calendar item with identifier %{public}@ in calendar with identifier %{public}@", v8, v9, v10, v11, 2u);
}

void sub_10006D11C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Found event with identifer %{public}@ but in the wrong calendar.", v2, v3, v4, v5, v6);
}

void sub_10006D184(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 calendarIdentifier];
  sub_100022F58();
  sub_100022FAC((void *)&_mh_execute_header, v6, v7, "%{public}s: No calendar item with identifier %{public}@ in calendar with identifier %{public}@", v8, v9, v10, v11, 2u);
}

void sub_10006D230(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 calendarIdentifier];
  *a1 = 138543362;
  *a4 = v8;
  sub_100022F8C((void *)&_mh_execute_header, v9, v10, "performUpdateWithICSWrappers: Calendar %{public}@ does not exist!");
}

void sub_10006D2A4(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = [a3 ICSData];
  id v10 = [v8 initWithData:v9 encoding:4];
  uint64_t v11 = sub_10002D3E0(v10);
  *(_DWORD *)a1 = 138543362;
  *a4 = v11;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "recv: %{public}@", a1, 0xCu);
}

void sub_10006D36C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot find object of type %d to update.", (uint8_t *)v2, 8u);
}

void sub_10006D3E4()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error deleting event for identifier remap: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D44C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Critical error, received compressed and uncompressed data.", v1, 2u);
}

void sub_10006D490()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "No calendar for calendar identifier %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D4F8()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Found no matches for potential deletion of calendar item %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D560(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100022FCC() objectID];
  sub_100022EDC();
  sub_100022EC4((void *)&_mh_execute_header, v1, v4, "Error deleting item: %{public}@", v5);
}

void sub_10006D5F8()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Found multiple matches for potential deletion of calendar item %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D660(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 objectID];
  *a1 = 138543362;
  *a4 = v8;
  sub_100022F8C((void *)&_mh_execute_header, v9, v10, "Error deleting item: %{public}@");
}

void sub_10006D6D4()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error saving event in applySidePropertiesToEntity: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D73C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "updateSelfAttendeeForCalendarItem save error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D7A4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_100022FCC();
  uint64_t v4 = sub_10002D3E0(v3);
  sub_100022EDC();
  sub_100022EC4((void *)&_mh_execute_header, v1, v5, "Could not create calendar wrapper for entity: %{public}@", v6);
}

void sub_10006D83C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "publicObjectWithObjectID returned nil, objectID: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006D8A4()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Event %{public}@ returned a unique id of nil.", v2, v3, v4, v5, v6);
}

void sub_10006D90C(void *a1)
{
  id v2 = a1;
  sub_100022FCC();
  objc_opt_class();
  sub_100022EDC();
  id v4 = v3;
  sub_100022EC4((void *)&_mh_execute_header, v1, v5, "Attempt to create wrapper for unknown type: %{public}@", v6);
}

void sub_10006D9A4()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete source; no source exists for %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10006DA0C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error deleting source with identifier %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006DA74()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete; no calendar exists for %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10006DADC()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Error deleting calendar with identifier %{public}@, error: %{public}@");
}

void sub_10006DB44()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error deleting event %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006DBAC()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Deleting event %{public}@ failed as we were not handed an event by the store.", v2, v3, v4, v5, v6);
}

void sub_10006DC14()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Failure to delete reminder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006DC7C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100022FCC() storeIdentifier];
  sub_100022EDC();
  sub_100022EC4((void *)&_mh_execute_header, v1, v4, "Source not found with sourceID: %@", v5);
}

void sub_10006DD14(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 actionIdentifier];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Notification didReceiveNotificationResponse for unknown actionIdentifier: %@", (uint8_t *)&v5, 0xCu);
}

void sub_10006DDBC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "diagnosticDictionary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006DE34()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Incoming message missing required body.", v2, v3, v4, v5, v6);
}

void sub_10006DE68(void *a1)
{
  id v3 = a1;
  uint64_t v4 = [(id)sub_10002AC44() calendarName];
  sub_10002D3E0(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)sub_10002AC50() reminderTitle];
  uint8_t v6 = sub_10002D3E0(v5);
  sub_10002AC00();
  sub_10002AC18((void *)&_mh_execute_header, v7, v8, "Cannot finder reminder '%{public}@:%{public}@'", v9, v10, v11, v12, v13);
}

void sub_10006DF38()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Failure to save reminder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006DFA0(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find reminder %{public}@:%{public}@", buf, 0x16u);
}

void sub_10006E014(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 deleteEvent];
  uint64_t v7 = [v6 eventIdentifier];
  sub_100022EDC();
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failure to delete event %@: %{public}@", v8, 0x16u);
}

void sub_10006E0E0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "I have %d candidate events so I'm not sure what to delete.", (uint8_t *)v4, 8u);
}

void sub_10006E17C()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "No reminder alarm found", v2, v3, v4, v5, v6);
}

void sub_10006E1B0()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Failure to save event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006E218()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "No event alarm found", v2, v3, v4, v5, v6);
}

void sub_10006E24C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set done state", v1, 2u);
}

void sub_10006E290(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not register notification. Continuing anyway.", v1, 2u);
}

void sub_10006E2D4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectID];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Cannot determine calendar identifier for reminder %{public}@. Deletion wrapper will be sent but the remote device may not be able to delete the reminder", (uint8_t *)&v5, 0xCu);
}

void sub_10006E37C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectID];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Attempting to send source wrapper for CloudKit reminders account %{public}@ with allowsEvents=YES but the other side does not support CloudKit. This is not expected but is handled by sending a source wrapper with allowsEvents=YES and allowsTasks=NO.", (uint8_t *)&v5, 0xCu);
}

void sub_10006E424(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch account with identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006E49C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[NEKSourceAttributes(Event) initWithSource:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10006E528(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error committing store after preemptive deletion of calendars: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006E5A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping deletion of event calendar as we are on the phone.", v1, 2u);
}

void sub_10006E5E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping deletion of task calendar as we are on the phone.", v1, 2u);
}

void sub_10006E628(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sorry. Unable to determine identifier or resolve EKSource object for EKObjectID %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006E6A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Source with ID %{public}@ does not exist. This is unexpected for update/insert. Skipping.", (uint8_t *)&v2, 0xCu);
}

void sub_10006E718(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Asked for incremental sync window when there was no/incomplete previous sync window data", v1, 2u);
}

void sub_10006E75C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  v4[0] = 67109376;
  v4[1] = [a2 entityType];
  __int16 v5 = 1024;
  unsigned int v6 = [a2 rowID];
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Attempt to save a nil identifier: %d/%d", (uint8_t *)v4, 0xEu);
}

void sub_10006E818(uint64_t a1, void *a2, void *a3)
{
  __int16 v5 = a2;
  int v6 = 138544130;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  unsigned int v9 = [a3 entityType];
  __int16 v10 = 1024;
  unsigned int v11 = [a3 rowID];
  __int16 v12 = 1024;
  unsigned int v13 = [a3 databaseID];
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "set id:%{public}@ %d/%d/%d", (uint8_t *)&v6, 0x1Eu);
}

void sub_10006E8FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pairingStorePath is nil. Pairing state will not be saved correctly.", v1, 2u);
}

void sub_10006E940(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown account type %ld", (uint8_t *)&v2, 0xCu);
}

void sub_10006E9B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unexpected constraint plist path from ReminderKit account: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006EA30(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating account. Source's persistent ID: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

void sub_10006EAA8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[NEKSourceAttributes(Reminder) createAccountWithSaveRequest:withAttributes:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10006EB34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412802;
  CFStringRef v3 = @"NO";
  __int16 v4 = 2112;
  CFStringRef v5 = @"YES";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "UNSUPPORTED: Source's 'allowsEvents' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", (uint8_t *)&v2, 0x20u);
}

void sub_10006EBD4(void *a1, void *a2)
{
  id v3 = a1;
  __int16 v4 = [a2 phoneOnlyOccurrences];
  sub_10003BFB0((void *)&_mh_execute_header, v5, v6, "NEKDriftResults | phoneOnlyOccurrences: %@", v7, v8, v9, v10, 2u);
}

void sub_10006EC6C(void *a1, void *a2)
{
  id v3 = a1;
  __int16 v4 = [a2 watchOnlyOccurrences];
  sub_10003BFB0((void *)&_mh_execute_header, v5, v6, "NEKDriftResults | watchOnlyOccurrences: %@", v7, v8, v9, v10, 2u);
}

void sub_10006ED04(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Sqlite create failed, path: %s, error: (%d)", (uint8_t *)&v3, 0x12u);
}

void sub_10006ED8C(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sqlite statement prepare failed for \"%{public}s\"", (uint8_t *)&v2, 0xCu);
}

void sub_10006EE04()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "NEKSqueeze failed to compress", v2, v3, v4, v5, v6);
}

void sub_10006EE38()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "NEKSqueeze failed to initialize", v2, v3, v4, v5, v6);
}

void sub_10006EE6C()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "NEKFluff failed to uncompress", v2, v3, v4, v5, v6);
}

void sub_10006EEA0()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "NEKFluff failed to initialize", v2, v3, v4, v5, v6);
}

void sub_10006EED4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to resume SYService: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006EF4C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 attributes];
  uint64_t v5 = sub_10002D3E0([v4 title]);
  unsigned int v11 = [a2 calendarIdentifier];
  sub_100043218();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x16u);
}

void sub_10006F02C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 attributes];
  uint64_t v5 = sub_10002D3E0([v4 title]);
  unsigned int v11 = [a2 calendarIdentifier];
  sub_100043218();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x1Cu);
}

void sub_10006F124(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_100043218();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0xCu);
}

void sub_10006F1C8(void *a1)
{
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "passed weird class: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10006F270()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Session start call not balanced. This is a fatal condition.", v2, v3, v4, v5, v6);
}

void sub_10006F2A4()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Delta sync fired but it really wants to be a reset sync.", v2, v3, v4, v5, v6);
}

void sub_10006F2D8()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Fatal: sessionEnd call not balanced.", v2, v3, v4, v5, v6);
}

void sub_10006F30C()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Session is nil during sessionEnded.", v2, v3, v4, v5, v6);
}

void sub_10006F340(char a1, NSObject *a2)
{
  CFStringRef v2 = &stru_1000AB888;
  if (a1) {
    CFStringRef v2 = @" (FAKE)";
  }
  int v3 = 138543362;
  CFStringRef v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "There was a sync error%{public}@.", (uint8_t *)&v3, 0xCu);
}

void sub_10006F3D0()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Looks like I didn't schedule  retry. That's bad.", v2, v3, v4, v5, v6);
}

void sub_10006F404(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Default local list does not exist", v1, 2u);
}

void sub_10006F448(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Cannot find list for identifier %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_10006F4F0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[NEKCalendarID(Reminder) listInStore:withNEKCalendarID:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10006F57C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[NEKCalendarAttributes(Reminder) createListInAccount:withSaveRequest:withAttributes:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10006F608(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = [a2 title];
  uint64_t v5 = [a2 calendarIdentifier];
  int v6 = 138412546;
  os_log_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Calendar \"%@\"/%{public}@ supports no entity types.", (uint8_t *)&v6, 0x16u);
}

void sub_10006F6D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create wrapper object", v1, 2u);
}

void sub_10006F71C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SYChangeWithData - unrecognized type: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10006F794(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Transport number gap detected. Might be a problem, might not.", v1, 2u);
}

void sub_10006F7D8()
{
  sub_10002AC38();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Purge deleted object is not supported on this platform. Ignoring.", v1, 2u);
}

void sub_10006F818()
{
  sub_10002AC38();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Can't create save request for nil store. Using a fresh REMStore to avoid crashing, but this won't be correct.", v1, 2u);
}

void sub_10006F858()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error fetching accounts: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006F8C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006F930(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 objectID];
  sub_100022EDC();
  sub_10005A378((void *)&_mh_execute_header, v5, v6, "Reminders: Saving after updating an account (%{public}@) failed", v7, v8, v9, v10, v11);
}

void sub_10006F9C4()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error fetching account with ID: [%{public}@]", v2, v3, v4, v5, v6);
}

void sub_10006FA2C()
{
  sub_10005A348();
  sub_10005A35C((void *)&_mh_execute_header, v0, v1, "Unable to create UUID for %s %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10006FAA0()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error saving new list (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_10006FB08()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error fetching list with ID: [%{public}@]", v2, v3, v4, v5, v6);
}

void sub_10006FB70()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error saving updated list (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_10006FBD8()
{
  sub_10005A348();
  sub_10005A35C((void *)&_mh_execute_header, v0, v1, "Unable to create UUID for %s %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10006FC4C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Unknown deletion wrapper: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10006FCB4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint8_t v6 = [a3 calendarIdentifier];
  int v7 = 136446722;
  uint64_t v8 = "-[NEKReminderStore handleReminderWithUniqueIdentifierFromGizmo:saveRequest:list:wrapper:]";
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s: No calendar item with identifier %{public}@ in calendar with identifier %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_10006FD84()
{
  sub_100015844();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to batch fetch reminders with calendar item unique ID %{public}@. error=%@");
}

void sub_10006FDEC(uint8_t *a1, void *a2, void *a3, void *a4)
{
  int v7 = a2;
  uint64_t v8 = [a3 calendarIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "List %{public}@ does not exist. Skip processing this wrapper.", a1, 0xCu);
}

void sub_10006FE70()
{
  sub_10002AC38();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "No ReminderChangeItem was created. ICS importing failed?", v1, 2u);
}

void sub_10006FEB0()
{
  sub_100015844();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Found no matches for potential deletion of moved reminder %{public}@ with error %@");
}

void sub_10006FF18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  sub_100022F20((void *)&_mh_execute_header, a2, a3, "Unexpected wrapper type %lu for identitifer %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006FF90()
{
  sub_100015844();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to batch fetch account %{public}@ %@");
}

void sub_10006FFF8()
{
  sub_100015844();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to batch fetch list %{public}@ %@");
}

void sub_100070060()
{
  sub_100015844();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "Failed to batch fetch reminder %{public}@ %@");
}

void sub_1000700C8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 remObjectID];
  sub_100022EDC();
  sub_10005A378((void *)&_mh_execute_header, v5, v6, "Failed to create source wrapper for CloudKit account %{public}@", v7, v8, v9, v10, v11);
}

void sub_10007015C()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Failed to fetch list %{public}@. Unable to create wrapper.", v2, v3, v4, v5, v6);
}

void sub_1000701C4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = sub_10002D3E0(a2);
  sub_100022EDC();
  sub_10005A378((void *)&_mh_execute_header, v5, v6, "Could not create calendar wrapper for entity: %{public}@", v7, v8, v9, v10, v11);
}

void sub_100070258()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Failed to fetch reminder %{public}@. Unable to create wrapper.", v2, v3, v4, v5, v6);
}

void sub_1000702C0()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete; no account exists for identifier %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100070328()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete; account with identifier %{public}@ is a local internal account (this is unexpected)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100070390()
{
  sub_10005A348();
  sub_10005A35C((void *)&_mh_execute_header, v0, v1, "Unable to create UUID for %s %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100070404()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete; no list exists for identifier %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10007046C()
{
  sub_10005A348();
  sub_10005A35C((void *)&_mh_execute_header, v0, v1, "Unable to create UUID for %s %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000704E0()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Cannot delete; no reminder exists for identifier %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100070548()
{
  sub_10002AC38();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to fetch an account for reminders. This is very bad.", v1, 2u);
}

void sub_100070588()
{
  sub_100022EDC();
  sub_100022EA8((void *)&_mh_execute_header, v0, v1, "Error removing reminder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000705F0(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 sourceIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create source wrapper for %{public}@", a1, 0xCu);
}

void sub_100070674(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000706AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000706E4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  sub_10005A378((void *)&_mh_execute_header, v5, v6, "Failed to unarchive sequence token from data: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_10007077C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000707B4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  sub_10005A378((void *)&_mh_execute_header, v5, v6, "Failed to archive sequence token from object: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_10007084C(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 remObjectID];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create source wrapper for CloudKit account %{public}@", a1, 0xCu);
}

void sub_1000708D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007093C()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Timed out trying to fetch changes from database.", v2, v3, v4, v5, v6);
}

void sub_100070970()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Reminder fetchChanges: Timeout out waiting for database to respond.", v2, v3, v4, v5, v6);
}

void sub_1000709A4()
{
  sub_10002AC38();
  sub_10002ABE4((void *)&_mh_execute_header, v0, v1, "Updates is NULL. This shouldn't happen.", v2, v3, v4, v5, v6);
}

void sub_1000709D8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[NEKReminderChangeObserver previousDefaultReminderListID]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to create UUID for %s %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_100070A64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070AD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070B3C()
{
  sub_10002AC38();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Tracking more than one store is not supported. Behavior is undefined.", v1, 2u);
}

void sub_100070B7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PURGE: Error saving database after purging unwanted elements.", v1, 2u);
}

void sub_100070BC0(void *a1, void *a2)
{
  id v3 = a1;
  [a2 rowID];
  sub_1000688E8((void *)&_mh_execute_header, v4, v5, "PURGE: Failure to fetch stale source, rowid: %d", v6, v7, v8, v9, 0);
}

void sub_100070C4C()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "PURGE: Failure deleting stale source %{public}@, %{public}@");
}

void sub_100070CB4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 rowID];
  sub_1000688E8((void *)&_mh_execute_header, v4, v5, "PURGE: Failure to fetch stale calendar, rowid: %d", v6, v7, v8, v9, 0);
}

void sub_100070D40()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "PURGE: Failure deleting stale calendar %{public}@, %{public}@");
}

void sub_100070DA8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 rowID];
  sub_1000688E8((void *)&_mh_execute_header, v4, v5, "PURGE: Failure to fetch stale event, rowid: %d", v6, v7, v8, v9, 0);
}

void sub_100070E34()
{
  sub_100022F40();
  sub_100022F20((void *)&_mh_execute_header, v0, v1, "PURGE: Failure deleting stale event %{public}@, %{public}@");
}

void sub_100070E9C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, (os_log_type_t)0x90u, "Manually triggered state dump", v0, 2u);
}

void sub_100070EE4(void *a1, int a2, NSObject *a3)
{
  int v5 = 136315394;
  id v6 = [a1 activityIdentifier];
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Received an odd state in checkin for %s: %d.", (uint8_t *)&v5, 0x12u);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return _CFLocaleGetSystem();
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return _CFNumberFormatterCreate(allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number)
{
  return _CFNumberFormatterCreateStringWithNumber(allocator, formatter, number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

uint64_t CalAttendeeStatusToEKParticipantStatus()
{
  return _CalAttendeeStatusToEKParticipantStatus();
}

uint64_t EKParticipantStatusToCalAttendeeStatus()
{
  return _EKParticipantStatusToCalAttendeeStatus();
}

uint64_t EKSSClientXPCInterface()
{
  return _EKSSClientXPCInterface();
}

uint64_t EKSSDiagnosticsDirectory()
{
  return _EKSSDiagnosticsDirectory();
}

uint64_t EKSSServiceXPCInterface()
{
  return _EKSSServiceXPCInterface();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return _PBDataWriterWriteFixed32Field();
}

uint64_t PBDataWriterWriteFixed64Field()
{
  return _PBDataWriterWriteFixed64Field();
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

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void abort(void)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int close(int a1)
{
  return _close(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

uint64_t ct_green_tea_logger_create()
{
  return _ct_green_tea_logger_create();
}

uint64_t ct_green_tea_logger_destroy()
{
  return _ct_green_tea_logger_destroy();
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

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

long double scalbn(long double __x, int __y)
{
  return _scalbn(__x, __y);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return _sqlite3_bind_parameter_count(a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_ICSData(void *a1, const char *a2, ...)
{
  return [a1 ICSData];
}

id objc_msgSend_NEKFluff(void *a1, const char *a2, ...)
{
  return [a1 NEKFluff];
}

id objc_msgSend_NEKSqueeze(void *a1, const char *a2, ...)
{
  return [a1 NEKSqueeze];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
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

id objc_msgSend__activityComplete(void *a1, const char *a2, ...)
{
  return [a1 _activityComplete];
}

id objc_msgSend__blockUntilUnlock(void *a1, const char *a2, ...)
{
  return [a1 _blockUntilUnlock];
}

id objc_msgSend__bootstrap(void *a1, const char *a2, ...)
{
  return [a1 _bootstrap];
}

id objc_msgSend__bump(void *a1, const char *a2, ...)
{
  return [a1 _bump];
}

id objc_msgSend__checkIn(void *a1, const char *a2, ...)
{
  return [a1 _checkIn];
}

id objc_msgSend__clearToDeltaSync(void *a1, const char *a2, ...)
{
  return [a1 _clearToDeltaSync];
}

id objc_msgSend__commitPendingRecordMapChanges(void *a1, const char *a2, ...)
{
  return [a1 _commitPendingRecordMapChanges];
}

id objc_msgSend__countEvents(void *a1, const char *a2, ...)
{
  return [a1 _countEvents];
}

id objc_msgSend__createDb(void *a1, const char *a2, ...)
{
  return [a1 _createDb];
}

id objc_msgSend__createParentDirectory(void *a1, const char *a2, ...)
{
  return [a1 _createParentDirectory];
}

id objc_msgSend__currentCriteria(void *a1, const char *a2, ...)
{
  return [a1 _currentCriteria];
}

id objc_msgSend__currentHour(void *a1, const char *a2, ...)
{
  return [a1 _currentHour];
}

id objc_msgSend__databaseChangedExternally(void *a1, const char *a2, ...)
{
  return [a1 _databaseChangedExternally];
}

id objc_msgSend__deletableSources(void *a1, const char *a2, ...)
{
  return [a1 _deletableSources];
}

id objc_msgSend__disableMutation(void *a1, const char *a2, ...)
{
  return [a1 _disableMutation];
}

id objc_msgSend__enableDisableLogging(void *a1, const char *a2, ...)
{
  return [a1 _enableDisableLogging];
}

id objc_msgSend__eventCalendarKey(void *a1, const char *a2, ...)
{
  return [a1 _eventCalendarKey];
}

id objc_msgSend__faultCount(void *a1, const char *a2, ...)
{
  return [a1 _faultCount];
}

id objc_msgSend__fullSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 _fullSessionTimeout];
}

id objc_msgSend__getTestWindowEnd(void *a1, const char *a2, ...)
{
  return [a1 _getTestWindowEnd];
}

id objc_msgSend__getTestWindowStart(void *a1, const char *a2, ...)
{
  return [a1 _getTestWindowStart];
}

id objc_msgSend__getWindowEnd(void *a1, const char *a2, ...)
{
  return [a1 _getWindowEnd];
}

id objc_msgSend__getWindowStart(void *a1, const char *a2, ...)
{
  return [a1 _getWindowStart];
}

id objc_msgSend__loadLastSyncWindow(void *a1, const char *a2, ...)
{
  return [a1 _loadLastSyncWindow];
}

id objc_msgSend__masterEventsToSync(void *a1, const char *a2, ...)
{
  return [a1 _masterEventsToSync];
}

id objc_msgSend__newPath(void *a1, const char *a2, ...)
{
  return [a1 _newPath];
}

id objc_msgSend__openDatabase(void *a1, const char *a2, ...)
{
  return [a1 _openDatabase];
}

id objc_msgSend__prepDatabase(void *a1, const char *a2, ...)
{
  return [a1 _prepDatabase];
}

id objc_msgSend__prepareStatements(void *a1, const char *a2, ...)
{
  return [a1 _prepareStatements];
}

id objc_msgSend__recreatePath(void *a1, const char *a2, ...)
{
  return [a1 _recreatePath];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForNotifications];
}

id objc_msgSend__reminderListKey(void *a1, const char *a2, ...)
{
  return [a1 _reminderListKey];
}

id objc_msgSend__schemaVersion(void *a1, const char *a2, ...)
{
  return [a1 _schemaVersion];
}

id objc_msgSend__sendChangesIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 _sendChangesIfAvailable];
}

id objc_msgSend__sequenceKey(void *a1, const char *a2, ...)
{
  return [a1 _sequenceKey];
}

id objc_msgSend__sequenceTokenKey(void *a1, const char *a2, ...)
{
  return [a1 _sequenceTokenKey];
}

id objc_msgSend__setWindowToNow(void *a1, const char *a2, ...)
{
  return [a1 _setWindowToNow];
}

id objc_msgSend__shouldFakeFailure(void *a1, const char *a2, ...)
{
  return [a1 _shouldFakeFailure];
}

id objc_msgSend__spanNowTime(void *a1, const char *a2, ...)
{
  return [a1 _spanNowTime];
}

id objc_msgSend__startDeferralPolling(void *a1, const char *a2, ...)
{
  return [a1 _startDeferralPolling];
}

id objc_msgSend__stopDeferralPolling(void *a1, const char *a2, ...)
{
  return [a1 _stopDeferralPolling];
}

id objc_msgSend__syncReport(void *a1, const char *a2, ...)
{
  return [a1 _syncReport];
}

id objc_msgSend__tapToRadarUrl(void *a1, const char *a2, ...)
{
  return [a1 _tapToRadarUrl];
}

id objc_msgSend__taskCalendarKey(void *a1, const char *a2, ...)
{
  return [a1 _taskCalendarKey];
}

id objc_msgSend__triggerFullSync(void *a1, const char *a2, ...)
{
  return [a1 _triggerFullSync];
}

id objc_msgSend__triggerMigrationSync(void *a1, const char *a2, ...)
{
  return [a1 _triggerMigrationSync];
}

id objc_msgSend__triggerNightlySync(void *a1, const char *a2, ...)
{
  return [a1 _triggerNightlySync];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accesses(void *a1, const char *a2, ...)
{
  return [a1 accesses];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountPersistentID(void *a1, const char *a2, ...)
{
  return [a1 accountPersistentID];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityCondition(void *a1, const char *a2, ...)
{
  return [a1 activityCondition];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activityIdentifier];
}

id objc_msgSend_alarmIdentifier(void *a1, const char *a2, ...)
{
  return [a1 alarmIdentifier];
}

id objc_msgSend_alarms(void *a1, const char *a2, ...)
{
  return [a1 alarms];
}

id objc_msgSend_alertInviteeDeclines(void *a1, const char *a2, ...)
{
  return [a1 alertInviteeDeclines];
}

id objc_msgSend_allCalendars(void *a1, const char *a2, ...)
{
  return [a1 allCalendars];
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

id objc_msgSend_allowEvents(void *a1, const char *a2, ...)
{
  return [a1 allowEvents];
}

id objc_msgSend_allowReminders(void *a1, const char *a2, ...)
{
  return [a1 allowReminders];
}

id objc_msgSend_allowedEntityTypes(void *a1, const char *a2, ...)
{
  return [a1 allowedEntityTypes];
}

id objc_msgSend_allowsCalendarAddDeleteModify(void *a1, const char *a2, ...)
{
  return [a1 allowsCalendarAddDeleteModify];
}

id objc_msgSend_allowsEvents(void *a1, const char *a2, ...)
{
  return [a1 allowsEvents];
}

id objc_msgSend_allowsScheduling(void *a1, const char *a2, ...)
{
  return [a1 allowsScheduling];
}

id objc_msgSend_allowsTasks(void *a1, const char *a2, ...)
{
  return [a1 allowsTasks];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return [a1 analytics];
}

id objc_msgSend_applyRebroadcastAlertInviteeDeclines(void *a1, const char *a2, ...)
{
  return [a1 applyRebroadcastAlertInviteeDeclines];
}

id objc_msgSend_applyRebroadcastShowDeclinedEvents(void *a1, const char *a2, ...)
{
  return [a1 applyRebroadcastShowDeclinedEvents];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_attendeeComment(void *a1, const char *a2, ...)
{
  return [a1 attendeeComment];
}

id objc_msgSend_attendeeStatus(void *a1, const char *a2, ...)
{
  return [a1 attendeeStatus];
}

id objc_msgSend_attendeeStatusFlag(void *a1, const char *a2, ...)
{
  return [a1 attendeeStatusFlag];
}

id objc_msgSend_attendees(void *a1, const char *a2, ...)
{
  return [a1 attendees];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_auxiliaryChangeInfos(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryChangeInfos];
}

id objc_msgSend_backgroundThread(void *a1, const char *a2, ...)
{
  return [a1 backgroundThread];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginObservingChanges(void *a1, const char *a2, ...)
{
  return [a1 beginObservingChanges];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_bumpFaultsAndScheduleRetry(void *a1, const char *a2, ...)
{
  return [a1 bumpFaultsAndScheduleRetry];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarIdentifier];
}

id objc_msgSend_calendarItemCount(void *a1, const char *a2, ...)
{
  return [a1 calendarItemCount];
}

id objc_msgSend_calendarItemExternalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarItemExternalIdentifier];
}

id objc_msgSend_calendarName(void *a1, const char *a2, ...)
{
  return [a1 calendarName];
}

id objc_msgSend_calendarTitle(void *a1, const char *a2, ...)
{
  return [a1 calendarTitle];
}

id objc_msgSend_calendarUpdateTimeNs(void *a1, const char *a2, ...)
{
  return [a1 calendarUpdateTimeNs];
}

id objc_msgSend_calendarWrapper(void *a1, const char *a2, ...)
{
  return [a1 calendarWrapper];
}

id objc_msgSend_calendars(void *a1, const char *a2, ...)
{
  return [a1 calendars];
}

id objc_msgSend_calendarsCount(void *a1, const char *a2, ...)
{
  return [a1 calendarsCount];
}

id objc_msgSend_canBePublished(void *a1, const char *a2, ...)
{
  return [a1 canBePublished];
}

id objc_msgSend_canBeShared(void *a1, const char *a2, ...)
{
  return [a1 canBeShared];
}

id objc_msgSend_canUseDataTransfer(void *a1, const char *a2, ...)
{
  return [a1 canUseDataTransfer];
}

id objc_msgSend_canUseLzfse(void *a1, const char *a2, ...)
{
  return [a1 canUseLzfse];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_cdEntityName(void *a1, const char *a2, ...)
{
  return [a1 cdEntityName];
}

id objc_msgSend_changeObserver(void *a1, const char *a2, ...)
{
  return [a1 changeObserver];
}

id objc_msgSend_changeSetForEvent(void *a1, const char *a2, ...)
{
  return [a1 changeSetForEvent];
}

id objc_msgSend_changeSetForReminder(void *a1, const char *a2, ...)
{
  return [a1 changeSetForReminder];
}

id objc_msgSend_changeStateMap(void *a1, const char *a2, ...)
{
  return [a1 changeStateMap];
}

id objc_msgSend_changeSupplier(void *a1, const char *a2, ...)
{
  return [a1 changeSupplier];
}

id objc_msgSend_changeTracking(void *a1, const char *a2, ...)
{
  return [a1 changeTracking];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return [a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_changesAffectNext24hrs(void *a1, const char *a2, ...)
{
  return [a1 changesAffectNext24hrs];
}

id objc_msgSend_clearCalendars(void *a1, const char *a2, ...)
{
  return [a1 clearCalendars];
}

id objc_msgSend_clearItems(void *a1, const char *a2, ...)
{
  return [a1 clearItems];
}

id objc_msgSend_clearMetadataKeys(void *a1, const char *a2, ...)
{
  return [a1 clearMetadataKeys];
}

id objc_msgSend_clearMetadataValues(void *a1, const char *a2, ...)
{
  return [a1 clearMetadataValues];
}

id objc_msgSend_clearRemoteBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 clearRemoteBuildVersion];
}

id objc_msgSend_clearRetryState(void *a1, const char *a2, ...)
{
  return [a1 clearRetryState];
}

id objc_msgSend_clearSources(void *a1, const char *a2, ...)
{
  return [a1 clearSources];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorString(void *a1, const char *a2, ...)
{
  return [a1 colorString];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_completeAndFireNever(void *a1, const char *a2, ...)
{
  return [a1 completeAndFireNever];
}

id objc_msgSend_completeAndFireOnConnection(void *a1, const char *a2, ...)
{
  return [a1 completeAndFireOnConnection];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionDate(void *a1, const char *a2, ...)
{
  return [a1 completionDate];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_constraintsDescriptionPath(void *a1, const char *a2, ...)
{
  return [a1 constraintsDescriptionPath];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpuTime(void *a1, const char *a2, ...)
{
  return [a1 cpuTime];
}

id objc_msgSend_cpuTimeMs(void *a1, const char *a2, ...)
{
  return [a1 cpuTimeMs];
}

id objc_msgSend_createTables(void *a1, const char *a2, ...)
{
  return [a1 createTables];
}

id objc_msgSend_creatorBundleID(void *a1, const char *a2, ...)
{
  return [a1 creatorBundleID];
}

id objc_msgSend_creatorCodeSigningIdentity(void *a1, const char *a2, ...)
{
  return [a1 creatorCodeSigningIdentity];
}

id objc_msgSend_criteriaDelay(void *a1, const char *a2, ...)
{
  return [a1 criteriaDelay];
}

id objc_msgSend_criteriaOnConnection(void *a1, const char *a2, ...)
{
  return [a1 criteriaOnConnection];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return [a1 currentVersion];
}

id objc_msgSend_daCalendarItemUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 daCalendarItemUniqueIdentifier];
}

id objc_msgSend_daConstraintsDescriptionPath(void *a1, const char *a2, ...)
{
  return [a1 daConstraintsDescriptionPath];
}

id objc_msgSend_daDisplayOrder(void *a1, const char *a2, ...)
{
  return [a1 daDisplayOrder];
}

id objc_msgSend_daExternalIdentificationTag(void *a1, const char *a2, ...)
{
  return [a1 daExternalIdentificationTag];
}

id objc_msgSend_daHexString(void *a1, const char *a2, ...)
{
  return [a1 daHexString];
}

id objc_msgSend_daIsEventOnlyContainer(void *a1, const char *a2, ...)
{
  return [a1 daIsEventOnlyContainer];
}

id objc_msgSend_daIsImmutable(void *a1, const char *a2, ...)
{
  return [a1 daIsImmutable];
}

id objc_msgSend_daIsNotificationsCollection(void *a1, const char *a2, ...)
{
  return [a1 daIsNotificationsCollection];
}

id objc_msgSend_daIsReadOnly(void *a1, const char *a2, ...)
{
  return [a1 daIsReadOnly];
}

id objc_msgSend_daPushKey(void *a1, const char *a2, ...)
{
  return [a1 daPushKey];
}

id objc_msgSend_daSupportsSharedCalendars(void *a1, const char *a2, ...)
{
  return [a1 daSupportsSharedCalendars];
}

id objc_msgSend_daSymbolicColorName(void *a1, const char *a2, ...)
{
  return [a1 daSymbolicColorName];
}

id objc_msgSend_daSyncToken(void *a1, const char *a2, ...)
{
  return [a1 daSyncToken];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_databaseDidChange(void *a1, const char *a2, ...)
{
  return [a1 databaseDidChange];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return [a1 databaseID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateChanged(void *a1, const char *a2, ...)
{
  return [a1 dateChanged];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_dbFileManager(void *a1, const char *a2, ...)
{
  return [a1 dbFileManager];
}

id objc_msgSend_dbFilename(void *a1, const char *a2, ...)
{
  return [a1 dbFilename];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultAlarmOffset(void *a1, const char *a2, ...)
{
  return [a1 defaultAlarmOffset];
}

id objc_msgSend_defaultCalendarForNewEvents(void *a1, const char *a2, ...)
{
  return [a1 defaultCalendarForNewEvents];
}

id objc_msgSend_defaultCalendarForNewReminders(void *a1, const char *a2, ...)
{
  return [a1 defaultCalendarForNewReminders];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultLocalCalendar(void *a1, const char *a2, ...)
{
  return [a1 defaultLocalCalendar];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_degenerateChange(void *a1, const char *a2, ...)
{
  return [a1 degenerateChange];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteEvent(void *a1, const char *a2, ...)
{
  return [a1 deleteEvent];
}

id objc_msgSend_deletedAccountIDsFromLoadedMap(void *a1, const char *a2, ...)
{
  return [a1 deletedAccountIDsFromLoadedMap];
}

id objc_msgSend_deletedSourcesIDs(void *a1, const char *a2, ...)
{
  return [a1 deletedSourcesIDs];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return [a1 deletes];
}

id objc_msgSend_deletionMap(void *a1, const char *a2, ...)
{
  return [a1 deletionMap];
}

id objc_msgSend_deletionWrapper(void *a1, const char *a2, ...)
{
  return [a1 deletionWrapper];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detachedItems(void *a1, const char *a2, ...)
{
  return [a1 detachedItems];
}

id objc_msgSend_dict(void *a1, const char *a2, ...)
{
  return [a1 dict];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_dirtyMemory(void *a1, const char *a2, ...)
{
  return [a1 dirtyMemory];
}

id objc_msgSend_displayOrder(void *a1, const char *a2, ...)
{
  return [a1 displayOrder];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dueDateComponents(void *a1, const char *a2, ...)
{
  return [a1 dueDateComponents];
}

id objc_msgSend_dumpToLog(void *a1, const char *a2, ...)
{
  return [a1 dumpToLog];
}

id objc_msgSend_duplicateCheck(void *a1, const char *a2, ...)
{
  return [a1 duplicateCheck];
}

id objc_msgSend_duplicatedCalendars(void *a1, const char *a2, ...)
{
  return [a1 duplicatedCalendars];
}

id objc_msgSend_duplicatedSources(void *a1, const char *a2, ...)
{
  return [a1 duplicatedSources];
}

id objc_msgSend_ekColor(void *a1, const char *a2, ...)
{
  return [a1 ekColor];
}

id objc_msgSend_ekEventStore(void *a1, const char *a2, ...)
{
  return [a1 ekEventStore];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endMappingEntities(void *a1, const char *a2, ...)
{
  return [a1 endMappingEntities];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return [a1 entityName];
}

id objc_msgSend_entityType(void *a1, const char *a2, ...)
{
  return [a1 entityType];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_estimatedFireDate(void *a1, const char *a2, ...)
{
  return [a1 estimatedFireDate];
}

id objc_msgSend_eventChangeObserver(void *a1, const char *a2, ...)
{
  return [a1 eventChangeObserver];
}

id objc_msgSend_eventDatabaseController(void *a1, const char *a2, ...)
{
  return [a1 eventDatabaseController];
}

id objc_msgSend_eventIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventIdentifier];
}

id objc_msgSend_eventSources(void *a1, const char *a2, ...)
{
  return [a1 eventSources];
}

id objc_msgSend_eventStart(void *a1, const char *a2, ...)
{
  return [a1 eventStart];
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return [a1 eventStore];
}

id objc_msgSend_eventStoreIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventStoreIdentifier];
}

id objc_msgSend_eventTitle(void *a1, const char *a2, ...)
{
  return [a1 eventTitle];
}

id objc_msgSend_eventUpdateTimeNs(void *a1, const char *a2, ...)
{
  return [a1 eventUpdateTimeNs];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_externalIDTag(void *a1, const char *a2, ...)
{
  return [a1 externalIDTag];
}

id objc_msgSend_externalId(void *a1, const char *a2, ...)
{
  return [a1 externalId];
}

id objc_msgSend_externalIdentificationTag(void *a1, const char *a2, ...)
{
  return [a1 externalIdentificationTag];
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifier];
}

id objc_msgSend_externalModificationTag(void *a1, const char *a2, ...)
{
  return [a1 externalModificationTag];
}

id objc_msgSend_externalRepresentation(void *a1, const char *a2, ...)
{
  return [a1 externalRepresentation];
}

id objc_msgSend_failTimeout(void *a1, const char *a2, ...)
{
  return [a1 failTimeout];
}

id objc_msgSend_failureScaling(void *a1, const char *a2, ...)
{
  return [a1 failureScaling];
}

id objc_msgSend_fetchBlob(void *a1, const char *a2, ...)
{
  return [a1 fetchBlob];
}

id objc_msgSend_fetchDouble(void *a1, const char *a2, ...)
{
  return [a1 fetchDouble];
}

id objc_msgSend_fetchEventChangeSet(void *a1, const char *a2, ...)
{
  return [a1 fetchEventChangeSet];
}

id objc_msgSend_fetchInteger(void *a1, const char *a2, ...)
{
  return [a1 fetchInteger];
}

id objc_msgSend_fetchReminderChangeSet(void *a1, const char *a2, ...)
{
  return [a1 fetchReminderChangeSet];
}

id objc_msgSend_fetchString(void *a1, const char *a2, ...)
{
  return [a1 fetchString];
}

id objc_msgSend_fetcher(void *a1, const char *a2, ...)
{
  return [a1 fetcher];
}

id objc_msgSend_fifo(void *a1, const char *a2, ...)
{
  return [a1 fifo];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_firstFoundTimestamp(void *a1, const char *a2, ...)
{
  return [a1 firstFoundTimestamp];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstTimeEver(void *a1, const char *a2, ...)
{
  return [a1 firstTimeEver];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_formattedFirstFoundDate(void *a1, const char *a2, ...)
{
  return [a1 formattedFirstFoundDate];
}

id objc_msgSend_formattedLastDiagnosticDate(void *a1, const char *a2, ...)
{
  return [a1 formattedLastDiagnosticDate];
}

id objc_msgSend_fullSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 fullSessionTimeout];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getFailureProbablity(void *a1, const char *a2, ...)
{
  return [a1 getFailureProbablity];
}

id objc_msgSend_getFixedRetryInternal(void *a1, const char *a2, ...)
{
  return [a1 getFixedRetryInternal];
}

id objc_msgSend_getMaximumSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 getMaximumSessionTimeout];
}

id objc_msgSend_getMinimumSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 getMinimumSessionTimeout];
}

id objc_msgSend_hasBeenAlerted(void *a1, const char *a2, ...)
{
  return [a1 hasBeenAlerted];
}

id objc_msgSend_hasCalendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasCalendarIdentifier];
}

id objc_msgSend_hasCalendarName(void *a1, const char *a2, ...)
{
  return [a1 hasCalendarName];
}

id objc_msgSend_hasChangeTrackingTokens(void *a1, const char *a2, ...)
{
  return [a1 hasChangeTrackingTokens];
}

id objc_msgSend_hasChangesInNext24hrs(void *a1, const char *a2, ...)
{
  return [a1 hasChangesInNext24hrs];
}

id objc_msgSend_hasDefaultAlarmOffset(void *a1, const char *a2, ...)
{
  return [a1 hasDefaultAlarmOffset];
}

id objc_msgSend_hasDeleteEvent(void *a1, const char *a2, ...)
{
  return [a1 hasDeleteEvent];
}

id objc_msgSend_hasDrift(void *a1, const char *a2, ...)
{
  return [a1 hasDrift];
}

id objc_msgSend_hasDuplicates(void *a1, const char *a2, ...)
{
  return [a1 hasDuplicates];
}

id objc_msgSend_hasICSData(void *a1, const char *a2, ...)
{
  return [a1 hasICSData];
}

id objc_msgSend_hasInvitationChangedPropertyFlagAttendeeComment(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagAttendeeComment];
}

id objc_msgSend_hasInvitationChangedPropertyFlagAttendeeStatus(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagAttendeeStatus];
}

id objc_msgSend_hasInvitationChangedPropertyFlagDate(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagDate];
}

id objc_msgSend_hasInvitationChangedPropertyFlagLocation(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagLocation];
}

id objc_msgSend_hasInvitationChangedPropertyFlagTime(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagTime];
}

id objc_msgSend_hasInvitationChangedPropertyFlagTitle(void *a1, const char *a2, ...)
{
  return [a1 hasInvitationChangedPropertyFlagTitle];
}

id objc_msgSend_hasItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasItemIdentifier];
}

id objc_msgSend_hasLzfseICSData(void *a1, const char *a2, ...)
{
  return [a1 hasLzfseICSData];
}

id objc_msgSend_hasOldCalendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasOldCalendarIdentifier];
}

id objc_msgSend_hasOldIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasOldIdentifier];
}

id objc_msgSend_hasProperInvitationStatus(void *a1, const char *a2, ...)
{
  return [a1 hasProperInvitationStatus];
}

id objc_msgSend_hasRecurrenceRules(void *a1, const char *a2, ...)
{
  return [a1 hasRecurrenceRules];
}

id objc_msgSend_hasReminderTitle(void *a1, const char *a2, ...)
{
  return [a1 hasReminderTitle];
}

id objc_msgSend_hasSetAlarmSnooze(void *a1, const char *a2, ...)
{
  return [a1 hasSetAlarmSnooze];
}

id objc_msgSend_hasSetParticipantStatus(void *a1, const char *a2, ...)
{
  return [a1 hasSetParticipantStatus];
}

id objc_msgSend_hasSetReminderComplete(void *a1, const char *a2, ...)
{
  return [a1 hasSetReminderComplete];
}

id objc_msgSend_hasStoreIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasStoreIdentifier];
}

id objc_msgSend_hasTaskCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 hasTaskCompletionDate];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hitRatio(void *a1, const char *a2, ...)
{
  return [a1 hitRatio];
}

id objc_msgSend_hits(void *a1, const char *a2, ...)
{
  return [a1 hits];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_iCSData(void *a1, const char *a2, ...)
{
  return [a1 iCSData];
}

id objc_msgSend_iCSWrapper(void *a1, const char *a2, ...)
{
  return [a1 iCSWrapper];
}

id objc_msgSend_icsDisplayOrder(void *a1, const char *a2, ...)
{
  return [a1 icsDisplayOrder];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsOptions(void *a1, const char *a2, ...)
{
  return [a1 idsOptions];
}

id objc_msgSend_inactive(void *a1, const char *a2, ...)
{
  return [a1 inactive];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_insertedOrUpdatedSources(void *a1, const char *a2, ...)
{
  return [a1 insertedOrUpdatedSources];
}

id objc_msgSend_inserts(void *a1, const char *a2, ...)
{
  return [a1 inserts];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return [a1 instance];
}

id objc_msgSend_instanceName(void *a1, const char *a2, ...)
{
  return [a1 instanceName];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalTransactionAuthorKeysToExclude(void *a1, const char *a2, ...)
{
  return [a1 internalTransactionAuthorKeysToExclude];
}

id objc_msgSend_invitationChangedPropertyFlagAttendeeComment(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagAttendeeComment];
}

id objc_msgSend_invitationChangedPropertyFlagAttendeeStatus(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagAttendeeStatus];
}

id objc_msgSend_invitationChangedPropertyFlagDate(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagDate];
}

id objc_msgSend_invitationChangedPropertyFlagLocation(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagLocation];
}

id objc_msgSend_invitationChangedPropertyFlagTime(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagTime];
}

id objc_msgSend_invitationChangedPropertyFlagTitle(void *a1, const char *a2, ...)
{
  return [a1 invitationChangedPropertyFlagTitle];
}

id objc_msgSend_invitationStatus(void *a1, const char *a2, ...)
{
  return [a1 invitationStatus];
}

id objc_msgSend_isBirthdayStore(void *a1, const char *a2, ...)
{
  return [a1 isBirthdayStore];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isCompleted(void *a1, const char *a2, ...)
{
  return [a1 isCompleted];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isCurrentlySyncing(void *a1, const char *a2, ...)
{
  return [a1 isCurrentlySyncing];
}

id objc_msgSend_isDefaultCalendarForStore(void *a1, const char *a2, ...)
{
  return [a1 isDefaultCalendarForStore];
}

id objc_msgSend_isDefaultEventCalendar(void *a1, const char *a2, ...)
{
  return [a1 isDefaultEventCalendar];
}

id objc_msgSend_isDefaultLocalCalendar(void *a1, const char *a2, ...)
{
  return [a1 isDefaultLocalCalendar];
}

id objc_msgSend_isDefaultSchedulingCalendar(void *a1, const char *a2, ...)
{
  return [a1 isDefaultSchedulingCalendar];
}

id objc_msgSend_isDefaultTaskCalendar(void *a1, const char *a2, ...)
{
  return [a1 isDefaultTaskCalendar];
}

id objc_msgSend_isDeferrable(void *a1, const char *a2, ...)
{
  return [a1 isDeferrable];
}

id objc_msgSend_isDelegate(void *a1, const char *a2, ...)
{
  return [a1 isDelegate];
}

id objc_msgSend_isDetached(void *a1, const char *a2, ...)
{
  return [a1 isDetached];
}

id objc_msgSend_isEffectivelyEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEffectivelyEmpty];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFacebook(void *a1, const char *a2, ...)
{
  return [a1 isFacebook];
}

id objc_msgSend_isFacebookSource(void *a1, const char *a2, ...)
{
  return [a1 isFacebookSource];
}

id objc_msgSend_isFamilyCalendar(void *a1, const char *a2, ...)
{
  return [a1 isFamilyCalendar];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return [a1 isGroup];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isHolidayCalendar(void *a1, const char *a2, ...)
{
  return [a1 isHolidayCalendar];
}

id objc_msgSend_isHolidyCalendar(void *a1, const char *a2, ...)
{
  return [a1 isHolidyCalendar];
}

id objc_msgSend_isIgnoringEventAlerts(void *a1, const char *a2, ...)
{
  return [a1 isIgnoringEventAlerts];
}

id objc_msgSend_isIgnoringSharedCalendarNotifications(void *a1, const char *a2, ...)
{
  return [a1 isIgnoringSharedCalendarNotifications];
}

id objc_msgSend_isImmutable(void *a1, const char *a2, ...)
{
  return [a1 isImmutable];
}

id objc_msgSend_isImmutableRaw(void *a1, const char *a2, ...)
{
  return [a1 isImmutableRaw];
}

id objc_msgSend_isInbox(void *a1, const char *a2, ...)
{
  return [a1 isInbox];
}

id objc_msgSend_isLocalStore(void *a1, const char *a2, ...)
{
  return [a1 isLocalStore];
}

id objc_msgSend_isMasterOrDetachedOccurrence(void *a1, const char *a2, ...)
{
  return [a1 isMasterOrDetachedOccurrence];
}

id objc_msgSend_isNotificationsCollection(void *a1, const char *a2, ...)
{
  return [a1 isNotificationsCollection];
}

id objc_msgSend_isPhantom(void *a1, const char *a2, ...)
{
  return [a1 isPhantom];
}

id objc_msgSend_isPublished(void *a1, const char *a2, ...)
{
  return [a1 isPublished];
}

id objc_msgSend_isReadonly(void *a1, const char *a2, ...)
{
  return [a1 isReadonly];
}

id objc_msgSend_isReminderKitEnabled(void *a1, const char *a2, ...)
{
  return [a1 isReminderKitEnabled];
}

id objc_msgSend_isReminderWithLocation(void *a1, const char *a2, ...)
{
  return [a1 isReminderWithLocation];
}

id objc_msgSend_isResetSync(void *a1, const char *a2, ...)
{
  return [a1 isResetSync];
}

id objc_msgSend_isSchedulingProhibited(void *a1, const char *a2, ...)
{
  return [a1 isSchedulingProhibited];
}

id objc_msgSend_isSending(void *a1, const char *a2, ...)
{
  return [a1 isSending];
}

id objc_msgSend_isSharingInvitation(void *a1, const char *a2, ...)
{
  return [a1 isSharingInvitation];
}

id objc_msgSend_isSubscribed(void *a1, const char *a2, ...)
{
  return [a1 isSubscribed];
}

id objc_msgSend_isSubscribedHolidayCalendar(void *a1, const char *a2, ...)
{
  return [a1 isSubscribedHolidayCalendar];
}

id objc_msgSend_isTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 isTaskCompleted];
}

id objc_msgSend_isTemporary(void *a1, const char *a2, ...)
{
  return [a1 isTemporary];
}

id objc_msgSend_isTruncated(void *a1, const char *a2, ...)
{
  return [a1 isTruncated];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_itemsCount(void *a1, const char *a2, ...)
{
  return [a1 itemsCount];
}

id objc_msgSend_join(void *a1, const char *a2, ...)
{
  return [a1 join];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastChangeToken(void *a1, const char *a2, ...)
{
  return [a1 lastChangeToken];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 lastSequenceNumber];
}

id objc_msgSend_lastSequenceToken(void *a1, const char *a2, ...)
{
  return [a1 lastSequenceToken];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_list(void *a1, const char *a2, ...)
{
  return [a1 list];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localAccountID(void *a1, const char *a2, ...)
{
  return [a1 localAccountID];
}

id objc_msgSend_localBirthdayCalendarSource(void *a1, const char *a2, ...)
{
  return [a1 localBirthdayCalendarSource];
}

id objc_msgSend_localSource(void *a1, const char *a2, ...)
{
  return [a1 localSource];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationChanged(void *a1, const char *a2, ...)
{
  return [a1 locationChanged];
}

id objc_msgSend_locationPredictionState(void *a1, const char *a2, ...)
{
  return [a1 locationPredictionState];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lzfseICSData(void *a1, const char *a2, ...)
{
  return [a1 lzfseICSData];
}

id objc_msgSend_markAsAffectingNext24hrs(void *a1, const char *a2, ...)
{
  return [a1 markAsAffectingNext24hrs];
}

id objc_msgSend_markAsDeferrable(void *a1, const char *a2, ...)
{
  return [a1 markAsDeferrable];
}

id objc_msgSend_markAsNotEffectivelyEmpty(void *a1, const char *a2, ...)
{
  return [a1 markAsNotEffectivelyEmpty];
}

id objc_msgSend_markAsTruncated(void *a1, const char *a2, ...)
{
  return [a1 markAsTruncated];
}

id objc_msgSend_masterCount(void *a1, const char *a2, ...)
{
  return [a1 masterCount];
}

id objc_msgSend_maxDeltaRetries(void *a1, const char *a2, ...)
{
  return [a1 maxDeltaRetries];
}

id objc_msgSend_maxTimeout(void *a1, const char *a2, ...)
{
  return [a1 maxTimeout];
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return [a1 mean];
}

id objc_msgSend_metadataKeys(void *a1, const char *a2, ...)
{
  return [a1 metadataKeys];
}

id objc_msgSend_metadataKeysCount(void *a1, const char *a2, ...)
{
  return [a1 metadataKeysCount];
}

id objc_msgSend_metadataValues(void *a1, const char *a2, ...)
{
  return [a1 metadataValues];
}

id objc_msgSend_metadataValuesCount(void *a1, const char *a2, ...)
{
  return [a1 metadataValuesCount];
}

id objc_msgSend_migratePrefsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 migratePrefsIfNecessary];
}

id objc_msgSend_minTimeout(void *a1, const char *a2, ...)
{
  return [a1 minTimeout];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_moveMap(void *a1, const char *a2, ...)
{
  return [a1 moveMap];
}

id objc_msgSend_msgType(void *a1, const char *a2, ...)
{
  return [a1 msgType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nekEventStore(void *a1, const char *a2, ...)
{
  return [a1 nekEventStore];
}

id objc_msgSend_nekReminderStore(void *a1, const char *a2, ...)
{
  return [a1 nekReminderStore];
}

id objc_msgSend_nextTimeout(void *a1, const char *a2, ...)
{
  return [a1 nextTimeout];
}

id objc_msgSend_notes(void *a1, const char *a2, ...)
{
  return [a1 notes];
}

id objc_msgSend_notifyForDatabaseUpdatesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 notifyForDatabaseUpdatesIfNeeded];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nuevoIdentifier(void *a1, const char *a2, ...)
{
  return [a1 nuevoIdentifier];
}

id objc_msgSend_obfuscate(void *a1, const char *a2, ...)
{
  return [a1 obfuscate];
}

id objc_msgSend_objectDelayUs(void *a1, const char *a2, ...)
{
  return [a1 objectDelayUs];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_objectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 objectIdentifier];
}

id objc_msgSend_occurrenceCache(void *a1, const char *a2, ...)
{
  return [a1 occurrenceCache];
}

id objc_msgSend_occurrenceCount(void *a1, const char *a2, ...)
{
  return [a1 occurrenceCount];
}

id objc_msgSend_okToPerformDeltaSync(void *a1, const char *a2, ...)
{
  return [a1 okToPerformDeltaSync];
}

id objc_msgSend_oldCalendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 oldCalendarIdentifier];
}

id objc_msgSend_oldIdentifier(void *a1, const char *a2, ...)
{
  return [a1 oldIdentifier];
}

id objc_msgSend_oldListIdentifier(void *a1, const char *a2, ...)
{
  return [a1 oldListIdentifier];
}

id objc_msgSend_onlyCreatorCanModify(void *a1, const char *a2, ...)
{
  return [a1 onlyCreatorCanModify];
}

id objc_msgSend_oops(void *a1, const char *a2, ...)
{
  return [a1 oops];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_organizer(void *a1, const char *a2, ...)
{
  return [a1 organizer];
}

id objc_msgSend_originalGUID(void *a1, const char *a2, ...)
{
  return [a1 originalGUID];
}

id objc_msgSend_originalItem(void *a1, const char *a2, ...)
{
  return [a1 originalItem];
}

id objc_msgSend_originalStartDate(void *a1, const char *a2, ...)
{
  return [a1 originalStartDate];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return [a1 owner];
}

id objc_msgSend_ownerIdentityAddress(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityAddress];
}

id objc_msgSend_ownerIdentityAddressString(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityAddressString];
}

id objc_msgSend_ownerIdentityDisplayName(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityDisplayName];
}

id objc_msgSend_ownerIdentityEmail(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityEmail];
}

id objc_msgSend_ownerIdentityFirstName(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityFirstName];
}

id objc_msgSend_ownerIdentityLastName(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentityLastName];
}

id objc_msgSend_packetNumber(void *a1, const char *a2, ...)
{
  return [a1 packetNumber];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_pairingStorePath(void *a1, const char *a2, ...)
{
  return [a1 pairingStorePath];
}

id objc_msgSend_parsed(void *a1, const char *a2, ...)
{
  return [a1 parsed];
}

id objc_msgSend_participantStatus(void *a1, const char *a2, ...)
{
  return [a1 participantStatus];
}

id objc_msgSend_participationStatus(void *a1, const char *a2, ...)
{
  return [a1 participationStatus];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_perMessageTimeout(void *a1, const char *a2, ...)
{
  return [a1 perMessageTimeout];
}

id objc_msgSend_perfomanceTracker(void *a1, const char *a2, ...)
{
  return [a1 perfomanceTracker];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_persistentObject(void *a1, const char *a2, ...)
{
  return [a1 persistentObject];
}

id objc_msgSend_phoneOnlyOccurrences(void *a1, const char *a2, ...)
{
  return [a1 phoneOnlyOccurrences];
}

id objc_msgSend_prepDatabasesForResetSync(void *a1, const char *a2, ...)
{
  return [a1 prepDatabasesForResetSync];
}

id objc_msgSend_previousDefaultEventCalendar(void *a1, const char *a2, ...)
{
  return [a1 previousDefaultEventCalendar];
}

id objc_msgSend_previousDefaultReminderListID(void *a1, const char *a2, ...)
{
  return [a1 previousDefaultReminderListID];
}

id objc_msgSend_previousDefaultTaskCalendar(void *a1, const char *a2, ...)
{
  return [a1 previousDefaultTaskCalendar];
}

id objc_msgSend_progressLiar(void *a1, const char *a2, ...)
{
  return [a1 progressLiar];
}

id objc_msgSend_properInvitationStatus(void *a1, const char *a2, ...)
{
  return [a1 properInvitationStatus];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_publishURL(void *a1, const char *a2, ...)
{
  return [a1 publishURL];
}

id objc_msgSend_publishedURL(void *a1, const char *a2, ...)
{
  return [a1 publishedURL];
}

id objc_msgSend_publishedURLString(void *a1, const char *a2, ...)
{
  return [a1 publishedURLString];
}

id objc_msgSend_purgeRecordMap(void *a1, const char *a2, ...)
{
  return [a1 purgeRecordMap];
}

id objc_msgSend_pushKey(void *a1, const char *a2, ...)
{
  return [a1 pushKey];
}

id objc_msgSend_readOnly(void *a1, const char *a2, ...)
{
  return [a1 readOnly];
}

id objc_msgSend_rebroadcastAlertInviteeDeclinesChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 rebroadcastAlertInviteeDeclinesChangeNotification];
}

id objc_msgSend_rebroadcastAllObservedNotifications(void *a1, const char *a2, ...)
{
  return [a1 rebroadcastAllObservedNotifications];
}

id objc_msgSend_rebroadcastShowDeclinedChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 rebroadcastShowDeclinedChangeNotification];
}

id objc_msgSend_receivedReunionSyncNotificationString(void *a1, const char *a2, ...)
{
  return [a1 receivedReunionSyncNotificationString];
}

id objc_msgSend_receivedStartSyncNotificationString(void *a1, const char *a2, ...)
{
  return [a1 receivedStartSyncNotificationString];
}

id objc_msgSend_recordMap(void *a1, const char *a2, ...)
{
  return [a1 recordMap];
}

id objc_msgSend_recurrenceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 recurrenceIdentifier];
}

id objc_msgSend_remObjectID(void *a1, const char *a2, ...)
{
  return [a1 remObjectID];
}

id objc_msgSend_reminderChangeObserver(void *a1, const char *a2, ...)
{
  return [a1 reminderChangeObserver];
}

id objc_msgSend_reminderDatabaseController(void *a1, const char *a2, ...)
{
  return [a1 reminderDatabaseController];
}

id objc_msgSend_reminderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reminderIdentifier];
}

id objc_msgSend_reminderStore(void *a1, const char *a2, ...)
{
  return [a1 reminderStore];
}

id objc_msgSend_reminderTitle(void *a1, const char *a2, ...)
{
  return [a1 reminderTitle];
}

id objc_msgSend_reminderUpdateTimeNs(void *a1, const char *a2, ...)
{
  return [a1 reminderUpdateTimeNs];
}

id objc_msgSend_removeAllItems(void *a1, const char *a2, ...)
{
  return [a1 removeAllItems];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllRecords(void *a1, const char *a2, ...)
{
  return [a1 removeAllRecords];
}

id objc_msgSend_removeFromList(void *a1, const char *a2, ...)
{
  return [a1 removeFromList];
}

id objc_msgSend_removeFromParent(void *a1, const char *a2, ...)
{
  return [a1 removeFromParent];
}

id objc_msgSend_removeFromStore(void *a1, const char *a2, ...)
{
  return [a1 removeFromStore];
}

id objc_msgSend_requestResetSync(void *a1, const char *a2, ...)
{
  return [a1 requestResetSync];
}

id objc_msgSend_resetBindCursor(void *a1, const char *a2, ...)
{
  return [a1 resetBindCursor];
}

id objc_msgSend_resetFetchCursor(void *a1, const char *a2, ...)
{
  return [a1 resetFetchCursor];
}

id objc_msgSend_resetLocalCalendarCache(void *a1, const char *a2, ...)
{
  return [a1 resetLocalCalendarCache];
}

id objc_msgSend_responseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 responseIdentifier];
}

id objc_msgSend_restartTrackingChanges(void *a1, const char *a2, ...)
{
  return [a1 restartTrackingChanges];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return [a1 rollback];
}

id objc_msgSend_rowID(void *a1, const char *a2, ...)
{
  return [a1 rowID];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_saveRequests(void *a1, const char *a2, ...)
{
  return [a1 saveRequests];
}

id objc_msgSend_saveRequestsNeedPurgeDeletedObjectsAfterSave(void *a1, const char *a2, ...)
{
  return [a1 saveRequestsNeedPurgeDeletedObjectsAfterSave];
}

id objc_msgSend_scheduleDeferredRetry(void *a1, const char *a2, ...)
{
  return [a1 scheduleDeferredRetry];
}

id objc_msgSend_scheduleRetry(void *a1, const char *a2, ...)
{
  return [a1 scheduleRetry];
}

id objc_msgSend_sealCompletions(void *a1, const char *a2, ...)
{
  return [a1 sealCompletions];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_seenMap(void *a1, const char *a2, ...)
{
  return [a1 seenMap];
}

id objc_msgSend_selfAttendee(void *a1, const char *a2, ...)
{
  return [a1 selfAttendee];
}

id objc_msgSend_selfAttendeeEmail(void *a1, const char *a2, ...)
{
  return [a1 selfAttendeeEmail];
}

id objc_msgSend_selfAttendeeUUID(void *a1, const char *a2, ...)
{
  return [a1 selfAttendeeUUID];
}

id objc_msgSend_selfIdentityAddress(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityAddress];
}

id objc_msgSend_selfIdentityAddressString(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityAddressString];
}

id objc_msgSend_selfIdentityDisplayName(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityDisplayName];
}

id objc_msgSend_selfIdentityEmail(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityEmail];
}

id objc_msgSend_selfIdentityFirstName(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityFirstName];
}

id objc_msgSend_selfIdentityLastName(void *a1, const char *a2, ...)
{
  return [a1 selfIdentityLastName];
}

id objc_msgSend_selfOrganizerEmail(void *a1, const char *a2, ...)
{
  return [a1 selfOrganizerEmail];
}

id objc_msgSend_selfOrganizerUUID(void *a1, const char *a2, ...)
{
  return [a1 selfOrganizerUUID];
}

id objc_msgSend_sendDiagnosticNotificaton(void *a1, const char *a2, ...)
{
  return [a1 sendDiagnosticNotificaton];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setAlarmSnooze(void *a1, const char *a2, ...)
{
  return [a1 setAlarmSnooze];
}

id objc_msgSend_setHasChangesAvailable(void *a1, const char *a2, ...)
{
  return [a1 setHasChangesAvailable];
}

id objc_msgSend_setNeedsFullSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsFullSync];
}

id objc_msgSend_setNeedsMigrationSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsMigrationSync];
}

id objc_msgSend_setNeedsNightlySync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsNightlySync];
}

id objc_msgSend_setNeedsResetSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSync];
}

id objc_msgSend_setNeedsReunionSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsReunionSync];
}

id objc_msgSend_setParticipantStatus(void *a1, const char *a2, ...)
{
  return [a1 setParticipantStatus];
}

id objc_msgSend_setReminderComplete(void *a1, const char *a2, ...)
{
  return [a1 setReminderComplete];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedOwnerAddress(void *a1, const char *a2, ...)
{
  return [a1 sharedOwnerAddress];
}

id objc_msgSend_sharedOwnerName(void *a1, const char *a2, ...)
{
  return [a1 sharedOwnerName];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharingInvitationResponse(void *a1, const char *a2, ...)
{
  return [a1 sharingInvitationResponse];
}

id objc_msgSend_sharingStatus(void *a1, const char *a2, ...)
{
  return [a1 sharingStatus];
}

id objc_msgSend_showAlert(void *a1, const char *a2, ...)
{
  return [a1 showAlert];
}

id objc_msgSend_showDeclinedEvents(void *a1, const char *a2, ...)
{
  return [a1 showDeclinedEvents];
}

id objc_msgSend_sigmaSpan(void *a1, const char *a2, ...)
{
  return [a1 sigmaSpan];
}

id objc_msgSend_snoozeAlarmRequiresDetach(void *a1, const char *a2, ...)
{
  return [a1 snoozeAlarmRequiresDetach];
}

id objc_msgSend_snoozeAmount(void *a1, const char *a2, ...)
{
  return [a1 snoozeAmount];
}

id objc_msgSend_someStore(void *a1, const char *a2, ...)
{
  return [a1 someStore];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return [a1 sources];
}

id objc_msgSend_sourcesCount(void *a1, const char *a2, ...)
{
  return [a1 sourcesCount];
}

id objc_msgSend_span(void *a1, const char *a2, ...)
{
  return [a1 span];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startDateComponents(void *a1, const char *a2, ...)
{
  return [a1 startDateComponents];
}

id objc_msgSend_startDateMap(void *a1, const char *a2, ...)
{
  return [a1 startDateMap];
}

id objc_msgSend_startMappingEntities(void *a1, const char *a2, ...)
{
  return [a1 startMappingEntities];
}

id objc_msgSend_statsTracker(void *a1, const char *a2, ...)
{
  return [a1 statsTracker];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stddev(void *a1, const char *a2, ...)
{
  return [a1 stddev];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_stopObservingChanges(void *a1, const char *a2, ...)
{
  return [a1 stopObservingChanges];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeDidChangeNotificationName(void *a1, const char *a2, ...)
{
  return [a1 storeDidChangeNotificationName];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeIdentifier];
}

id objc_msgSend_storeUpdateTimeNs(void *a1, const char *a2, ...)
{
  return [a1 storeUpdateTimeNs];
}

id objc_msgSend_storeWrapper(void *a1, const char *a2, ...)
{
  return [a1 storeWrapper];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return [a1 stringRepresentation];
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return [a1 structuredLocation];
}

id objc_msgSend_subCalAccountID(void *a1, const char *a2, ...)
{
  return [a1 subCalAccountID];
}

id objc_msgSend_subcalAccountID(void *a1, const char *a2, ...)
{
  return [a1 subcalAccountID];
}

id objc_msgSend_supportedEntityTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedEntityTypes];
}

id objc_msgSend_supportsAlarmAcknowledgedDate(void *a1, const char *a2, ...)
{
  return [a1 supportsAlarmAcknowledgedDate];
}

id objc_msgSend_supportsSharedCalendars(void *a1, const char *a2, ...)
{
  return [a1 supportsSharedCalendars];
}

id objc_msgSend_sweep(void *a1, const char *a2, ...)
{
  return [a1 sweep];
}

id objc_msgSend_symbolicColorName(void *a1, const char *a2, ...)
{
  return [a1 symbolicColorName];
}

id objc_msgSend_syncController(void *a1, const char *a2, ...)
{
  return [a1 syncController];
}

id objc_msgSend_syncCoordinator(void *a1, const char *a2, ...)
{
  return [a1 syncCoordinator];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncID(void *a1, const char *a2, ...)
{
  return [a1 syncID];
}

id objc_msgSend_syncId(void *a1, const char *a2, ...)
{
  return [a1 syncId];
}

id objc_msgSend_syncReport(void *a1, const char *a2, ...)
{
  return [a1 syncReport];
}

id objc_msgSend_syncReportFilePath(void *a1, const char *a2, ...)
{
  return [a1 syncReportFilePath];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncToken(void *a1, const char *a2, ...)
{
  return [a1 syncToken];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 systemBuildVersion];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetIsConnected(void *a1, const char *a2, ...)
{
  return [a1 targetIsConnected];
}

id objc_msgSend_targetableDevice(void *a1, const char *a2, ...)
{
  return [a1 targetableDevice];
}

id objc_msgSend_taskCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 taskCompletionDate];
}

id objc_msgSend_taskCutoff(void *a1, const char *a2, ...)
{
  return [a1 taskCutoff];
}

id objc_msgSend_taskCutoffDate(void *a1, const char *a2, ...)
{
  return [a1 taskCutoffDate];
}

id objc_msgSend_terminateIfNotFinished(void *a1, const char *a2, ...)
{
  return [a1 terminateIfNotFinished];
}

id objc_msgSend_terminateSemaphore(void *a1, const char *a2, ...)
{
  return [a1 terminateSemaphore];
}

id objc_msgSend_terminated(void *a1, const char *a2, ...)
{
  return [a1 terminated];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeChanged(void *a1, const char *a2, ...)
{
  return [a1 timeChanged];
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

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_tinyStore(void *a1, const char *a2, ...)
{
  return [a1 tinyStore];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleChanged(void *a1, const char *a2, ...)
{
  return [a1 titleChanged];
}

id objc_msgSend_totalDrift(void *a1, const char *a2, ...)
{
  return [a1 totalDrift];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_transactionAuthorsToExclude(void *a1, const char *a2, ...)
{
  return [a1 transactionAuthorsToExclude];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_truncated(void *a1, const char *a2, ...)
{
  return [a1 truncated];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uUID(void *a1, const char *a2, ...)
{
  return [a1 uUID];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_universalToken(void *a1, const char *a2, ...)
{
  return [a1 universalToken];
}

id objc_msgSend_unlocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 unlocalizedTitle];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateFailure(void *a1, const char *a2, ...)
{
  return [a1 updateFailure];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return [a1 updatedProperties];
}

id objc_msgSend_updates(void *a1, const char *a2, ...)
{
  return [a1 updates];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_usesSelfAttendee(void *a1, const char *a2, ...)
{
  return [a1 usesSelfAttendee];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_validationEnabled(void *a1, const char *a2, ...)
{
  return [a1 validationEnabled];
}

id objc_msgSend_validationWrapper(void *a1, const char *a2, ...)
{
  return [a1 validationWrapper];
}

id objc_msgSend_validationWrapperForRightNow(void *a1, const char *a2, ...)
{
  return [a1 validationWrapperForRightNow];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_variance(void *a1, const char *a2, ...)
{
  return [a1 variance];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_wallTime(void *a1, const char *a2, ...)
{
  return [a1 wallTime];
}

id objc_msgSend_watchOnlyOccurrences(void *a1, const char *a2, ...)
{
  return [a1 watchOnlyOccurrences];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}
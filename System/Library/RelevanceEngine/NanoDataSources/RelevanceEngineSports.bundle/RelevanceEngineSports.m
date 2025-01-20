id RESiriSportsLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = qword_83B0;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_83B0, &stru_4180);
  }
  v3 = [(id)qword_83A8 localizedStringForKey:v2 value:&stru_4208 table:@"Sports"];

  return v3;
}

void sub_2B5C(id a1)
{
  qword_83A8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id RESiriSportsLocalizedDataSourceName()
{
  return RESiriSportsLocalizedString(@"SPORTS_NAME");
}

id RESiriSportsContentForGame(void *a1)
{
  id v1 = a1;
  v2 = (char *)[v1 teamOrder];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 == (unsigned char *)&dword_0 + 2)
    {
      v4 = [v1 homeTeam];
      v3 = [v1 awayTeam];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      v4 = 0;
      v3 = 0;
    }
  }
  else
  {
    v3 = [v1 homeTeam];
    v4 = [v1 awayTeam];
    int v5 = 0;
  }
  v6 = [v3 name];
  v7 = [v4 name];
  id v8 = [v1 fetchedDate];
  if (!v8) {
    goto LABEL_43;
  }
  v9 = [v1 startDate];
  if (!v9 || ![v6 length])
  {

    goto LABEL_14;
  }
  id v10 = [v7 length];

  if (!v10)
  {
LABEL_14:
    id v8 = 0;
    goto LABEL_43;
  }
  v30 = [v1 fetchedDate];
  id v8 = objc_alloc_init((Class)REContent);
  [v8 setStyle:5];
  v11 = +[CLKDevice currentDevice];
  [v11 screenScale];
  double v13 = v12;

  v14 = [v3 logoData];
  v29 = +[REImage imageWithData:v14 scale:v13];

  v15 = [v4 logoData];
  v28 = +[REImage imageWithData:v15 scale:v13];

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_3230;
  v49 = sub_3240;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_3230;
  v43 = sub_3240;
  id v44 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_3248;
  v35[3] = &unk_41A8;
  id v16 = v1;
  id v36 = v16;
  v37 = &v45;
  v38 = &v39;
  v26 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_3308;
  v31[3] = &unk_41A8;
  id v17 = v16;
  id v32 = v17;
  v33 = &v45;
  v34 = &v39;
  v27 = objc_retainBlock(v31);
  v18 = [v17 periodDescription];
  v19 = [v17 startDate];
  switch((unint64_t)[v17 status])
  {
    case 0uLL:
      ((void (*)(void))v27[2])();
      goto LABEL_12;
    case 1uLL:
      ((void (*)(void))v27[2])();
      uint64_t v20 = 1;
      goto LABEL_42;
    case 2uLL:
      ((void (*)(void))v26[2])();
      if ([v18 length])
      {
        uint64_t v20 = 2;
        goto LABEL_42;
      }
      uint64_t v21 = RESiriSportsLocalizedString(@"GAME_LIVE");
      uint64_t v20 = 2;
      goto LABEL_41;
    case 3uLL:
      ((void (*)(void))v26[2])();
      if ([v18 length])
      {
        uint64_t v20 = 5;
        goto LABEL_42;
      }
      uint64_t v21 = RESiriSportsLocalizedString(@"GAME_FINAL");
      uint64_t v20 = 5;
      goto LABEL_41;
    case 4uLL:
      ((void (*)(void))v26[2])();
      if (v5) {
        uint64_t v20 = 7;
      }
      else {
        uint64_t v20 = 6;
      }
      if (![v18 length]) {
        goto LABEL_29;
      }
      goto LABEL_42;
    case 5uLL:
      ((void (*)(void))v26[2])();
      if (v5) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = 7;
      }
      if ([v18 length]) {
        goto LABEL_42;
      }
LABEL_29:
      uint64_t v21 = RESiriSportsLocalizedString(@"GAME_FINAL");
      goto LABEL_41;
    case 6uLL:
      ((void (*)(void))v27[2])();
      if ([v18 length]) {
        goto LABEL_33;
      }
      v22 = @"GAME_CANCELLED";
      goto LABEL_39;
    case 7uLL:
      ((void (*)(void))v27[2])();
      if ([v18 length])
      {
LABEL_33:
        uint64_t v20 = 4;
        goto LABEL_42;
      }
      v22 = @"GAME_POSTPONED";
LABEL_39:
      uint64_t v21 = RESiriSportsLocalizedString(v22);
      uint64_t v20 = 4;
      goto LABEL_41;
    case 8uLL:
      ((void (*)(void))v27[2])();
      if ([v18 length])
      {
        uint64_t v20 = 3;
      }
      else
      {
        uint64_t v21 = RESiriSportsLocalizedString(@"GAME_DELAYED");
        uint64_t v20 = 3;
LABEL_41:

        v18 = (void *)v21;
      }
LABEL_42:
      id v23 = objc_alloc((Class)REAccessoryMatchup);
      id v24 = [v23 initWithHomeTeamImage:v29 homeTeamName:v6 homeTeamDetail:v46[5] awayTeamImage:v28 awayTeamName:v7 awayTeamDetail:v40[5] progress:v18 startDate:v19 status:v20 dateFetched:v30];
      [v8 setMatchupAccessory:v24];

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v45, 8);

      break;
    default:
LABEL_12:
      uint64_t v20 = 0;
      goto LABEL_42;
  }
LABEL_43:

  return v8;
}

void sub_31DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3240(uint64_t a1)
{
}

char *sub_3248(uint64_t a1)
{
  result = (char *)[*(id *)(a1 + 32) teamOrder];
  if ((unint64_t)result >= 2)
  {
    if (result != (unsigned char *)&dword_0 + 2) {
      return result;
    }
    uint64_t v8 = [*(id *)(a1 + 32) homeScore];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v6 = [*(id *)(a1 + 32) awayScore];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) homeScore];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [*(id *)(a1 + 32) awayScore];
    uint64_t v7 = *(void *)(a1 + 48);
  }
  *(void *)(*(void *)(v7 + 8) + 40) = v6;

  return (char *)_objc_release_x1();
}

char *sub_3308(uint64_t a1)
{
  result = (char *)[*(id *)(a1 + 32) teamOrder];
  if ((unint64_t)result >= 2)
  {
    if (result != (unsigned char *)&dword_0 + 2) {
      return result;
    }
    uint64_t v8 = [*(id *)(a1 + 32) homeRecord];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v6 = [*(id *)(a1 + 32) awayRecord];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) homeRecord];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [*(id *)(a1 + 32) awayRecord];
    uint64_t v7 = *(void *)(a1 + 48);
  }
  *(void *)(*(void *)(v7 + 8) + 40) = v6;

  return (char *)_objc_release_x1();
}

double RESiriSportsLogoMaxPixelSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_83C0);
  id WeakRetained = objc_loadWeakRetained(&qword_83C8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_83C8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_83C8, v1);
    qword_83D0 = (uint64_t)[v1 version];

    sub_34B4(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_83D0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_83C0);
  double v9 = *(double *)&qword_83B8;

  return v9;
}

void sub_34B4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:3];
  [v7 setRoundingBehavior:1];
  [v7 scaledValue:0 withOverride:39.0 forSizeClass:34.0];
  double v4 = v3;
  [v2 screenScale];
  double v6 = v5;

  *(double *)&qword_83B8 = v4 * v6;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_awayRecord(void *a1, const char *a2, ...)
{
  return [a1 awayRecord];
}

id objc_msgSend_awayScore(void *a1, const char *a2, ...)
{
  return [a1 awayScore];
}

id objc_msgSend_awayTeam(void *a1, const char *a2, ...)
{
  return [a1 awayTeam];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_fetchedDate(void *a1, const char *a2, ...)
{
  return [a1 fetchedDate];
}

id objc_msgSend_homeRecord(void *a1, const char *a2, ...)
{
  return [a1 homeRecord];
}

id objc_msgSend_homeScore(void *a1, const char *a2, ...)
{
  return [a1 homeScore];
}

id objc_msgSend_homeTeam(void *a1, const char *a2, ...)
{
  return [a1 homeTeam];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logoData(void *a1, const char *a2, ...)
{
  return [a1 logoData];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_periodDescription(void *a1, const char *a2, ...)
{
  return [a1 periodDescription];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_teamOrder(void *a1, const char *a2, ...)
{
  return [a1 teamOrder];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}
void sub_100004FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

double *sub_100004FB8(double *result)
{
  v1 = result;
  double v2 = result[5];
  uint64_t v3 = *((void *)result + 4);
  if (*((unsigned char *)result + 48) || v2 > *(double *)(v3 + 96) + 5.0)
  {
    *(double *)(v3 + 96) = v2;
    result = (double *)[*(id *)(*((void *)result + 4) + 184) count];
    if (result)
    {
      uint64_t v4 = *((void *)v1 + 4);
      v5 = *(void **)(v4 + 240);
      if (v5)
      {
        uint64_t v6 = *(void *)(v4 + 264);
        uint64_t v7 = *(void *)(v4 + 224);
        id v8 = [*(id *)(v4 + 184) copy];
        [v5 _updateDBEntriesForTasksInSession:v6 taskInfos:v7 updates:v8];

        uint64_t v4 = *((void *)v1 + 4);
      }
      v9 = *(void **)(v4 + 184);
      return (double *)[v9 removeAllObjects];
    }
  }
  else
  {
    *(unsigned char *)(v3 + 104) = 1;
  }
  return result;
}

void sub_10000508C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000529C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000052B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessPredicate predicateMatchingBundleIdentifiers:*(void *)(*(void *)(a1 + 32) + 48)];
  uint64_t v6 = v4;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 setPredicates:v5];
}

void sub_100005370(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100005418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005438(void *a1)
{
  double v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    id v3 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
    [v3 removeObjectForKey:a1[6]];

    uint64_t v4 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
    id v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = a1[5];
      uint64_t v7 = *(void **)(a1[4] + 40);
      [v7 removeObjectForKey:v6];
    }
  }
}

void sub_1000054E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_100005884(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    double v2 = [*(id *)(a1 + 32) getBackgroundSettingsAppList];
    id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v3)
    {
      uint64_t v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v4 = &__kCFBooleanTrue;
    }
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    if (v3) {

    }
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) monitoredBundleIDsUpdated];
    id v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [*(id *)(*(void *)(a1 + 32) + 48) count];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started monitoring app %@, now %lu total %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void sub_1000059E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005F5C(void *a1)
{
  double v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    id v3 = +[NSMutableArray array];
    [*(id *)(a1[4] + 24) setObject:v3 forKeyedSubscript:a1[5]];
  }
  uint64_t v4 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  [v4 addObject:a1[6]];

  id v5 = (id)qword_1000CB148;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[5];
    id v7 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:v6];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    id v11 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added observer for app %@, now %lu observers", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10000609C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000060C8(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:a1[5]];
    id v11 = +[RBSProcessHandle handleForPredicate:v5 error:0];

    uint64_t v6 = [v11 currentState];
    id v7 = [v6 endowmentNamespaces];
    uint64_t v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 containsObject:@"com.apple.frontboard.visibility"]);
    uint64_t v9 = *(void *)(a1[6] + 8);
    __int16 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1[4] + 32) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
  }
}

void sub_100006204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006304(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C610;
  block[3] = &unk_1000B60C0;
  block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void sub_1000064C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000665C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10000689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  v22 = v18;

  _Unwind_Resume(a1);
}

void sub_1000068D4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isSpringBoardApp]);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_100006964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100006C74(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identity];
  uint64_t v3 = [v2 embeddedApplicationIdentifier];

  if (v3
    || ([*(id *)(a1 + 32) bundle],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 identifier],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    id v5 = [*(id *)(a1 + 40) previousState];
    id v6 = [v5 endowmentNamespaces];
    unsigned int v7 = [v6 containsObject:@"com.apple.frontboard.visibility"];

    uint64_t v8 = [*(id *)(a1 + 40) state];
    id v9 = [v8 endowmentNamespaces];
    id v10 = [v9 containsObject:@"com.apple.frontboard.visibility"];

    if (((v7 ^ 1 | v10) & 1) == 0)
    {
      id v11 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];

      id v12 = qword_1000CB148;
      BOOL v13 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          v72 = v3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Application %@ no longer foreground", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = [v14 countByEnumeratingWithState:&v63 objects:v70 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v64;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v64 != v16) {
                objc_enumerationMutation(v14);
              }
              [*(id *)(*((void *)&v63 + 1) + 8 * i) applicationNoLongerInForeground:v3];
            }
            id v15 = [v14 countByEnumeratingWithState:&v63 objects:v70 count:16];
          }
          while (v15);
        }
      }
      else if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v72 = v3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Application %@ no longer foreground, and no observers", buf, 0xCu);
      }
    }
    if (v10)
    {
      v18 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
      BOOL v19 = v18 == 0;

      v20 = qword_1000CB148;
      BOOL v21 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
      if (!v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          v72 = v3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Application %@ entered foreground", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        id v23 = [v22 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v60;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v60 != v24) {
                objc_enumerationMutation(v22);
              }
              [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) applicationEnteredForeground:v3];
            }
            id v23 = [v22 countByEnumeratingWithState:&v59 objects:v69 count:16];
          }
          while (v23);
        }

        goto LABEL_62;
      }
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        v72 = v3;
        v46 = "Application %@ entered foreground, and no observers";
LABEL_61:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
      }
    }
    else
    {
      v26 = [*(id *)(a1 + 40) state];
      BOOL v27 = [v26 taskState] == 3;

      if (v27)
      {
        v28 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
        BOOL v29 = v28 == 0;

        v20 = qword_1000CB148;
        BOOL v30 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
        if (!v29)
        {
          if (v30)
          {
            *(_DWORD *)buf = 138412290;
            v72 = v3;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Application %@ was suspended", buf, 0xCu);
          }
          [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          id v32 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v56;
            do
            {
              for (k = 0; k != v32; k = (char *)k + 1)
              {
                if (*(void *)v56 != v33) {
                  objc_enumerationMutation(v31);
                }
                [*(id *)(*((void *)&v55 + 1) + 8 * (void)k) applicationWasSuspended:v3 pid:[*(id *)(a1 + 32) pid]];
              }
              id v32 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
            }
            while (v32);
          }

          goto LABEL_62;
        }
        if (v30)
        {
          *(_DWORD *)buf = 138412290;
          v72 = v3;
          v46 = "Application %@ was suspended, and no observers";
          goto LABEL_61;
        }
      }
      else
      {
        v35 = [*(id *)(a1 + 40) exitEvent];
        v36 = [v35 context];
        v37 = [v36 status];
        BOOL v38 = [v37 code] == (id)3735943697;

        if (v38)
        {
          v39 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
          BOOL v40 = v39 == 0;

          v20 = qword_1000CB148;
          BOOL v41 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
          if (!v40)
          {
            if (v41)
            {
              *(_DWORD *)buf = 138412290;
              v72 = v3;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Application %@ was quit in the app switcher", buf, 0xCu);
            }
            [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v42 = (id)objc_claimAutoreleasedReturnValue();
            id v43 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
            if (v43)
            {
              uint64_t v44 = *(void *)v52;
              do
              {
                for (m = 0; m != v43; m = (char *)m + 1)
                {
                  if (*(void *)v52 != v44) {
                    objc_enumerationMutation(v42);
                  }
                  [*(id *)(*((void *)&v51 + 1) + 8 * (void)m) applicationWasQuitFromAppSwitcher:v3 (void)v51];
                }
                id v43 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
              }
              while (v43);
            }

            goto LABEL_62;
          }
          if (v41)
          {
            *(_DWORD *)buf = 138412290;
            v72 = v3;
            v46 = "Application %@ was quit in the app switcher, and no observers";
            goto LABEL_61;
          }
        }
      }
    }
LABEL_62:
    v50 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10, (void)v51);
    [*(id *)(*(void *)(a1 + 48) + 32) setObject:v50 forKeyedSubscript:v3];

    return;
  }
  v47 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    v48 = *(void **)(a1 + 32);
    uint64_t v49 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v72 = v48;
    __int16 v73 = 2112;
    uint64_t v74 = v49;
    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Cannot find bundle ID for process %@ state update %@", buf, 0x16u);
  }
}

void sub_1000073DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007528(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 *(SEL *)(a1 + 40):*(void *)(a1 + 32):(void)v8];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_100007658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007688(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 64))
  {
    id v3 = +[NDSpringBoard sharedSpringBoard];
    unsigned int v4 = [v3 applicationIsForeground:*(void *)(*(void *)(a1 + 32) + 24)];

    if (!v4)
    {
      long long v9 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Capturing boost activity from %@ unnecessary", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_10;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 40))
  {
LABEL_10:
    long long v8 = +[NSProcessInfo processInfo];
    [v8 endActivity:*(void *)(a1 + 40)];
    goto LABEL_11;
  }
  uint64_t v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(v2 + 24);
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Capturing boost activity from %@", (uint8_t *)&v11, 0xCu);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v7 = *(id *)(a1 + 40);
  long long v8 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v7;
LABEL_11:
}

void sub_100007808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000079E4(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100007B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100007C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000089A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10000947C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000A510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ABE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ADBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_10000BD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000BE38(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    unsigned int v4 = [a1 valueForEntitlement:v3];
    if (objc_opt_respondsToSelector()) {
      id v5 = [v4 BOOLValue];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_10000BEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C040(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000C104(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000C1B4(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

id sub_10000C1E0(void *a1)
{
  if (a1)
  {
    v1 = (const char *)[a1 UTF8String];
    CC_LONG v2 = strlen(v1);
    CC_SHA1(v1, v2, md);
    id v3 = +[NSMutableString stringWithCapacity:40];
    for (uint64_t i = 0; i != 20; ++i)
      [v3 appendFormat:@"%02x", md[i]];
    id v5 = [v3 uppercaseString];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_10000C2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C5DC(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

id sub_10000C610(void *a1)
{
  [*(id *)(a1[4] + 16) addEntriesFromDictionary:a1[5]];
  CC_LONG v2 = *(void **)(a1[4] + 24);
  uint64_t v3 = a1[6];

  return [v2 addEntriesFromDictionary:v3];
}

unsigned char *sub_10000C668(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[104]) {
    return _[result storeTaskInfoUpdates:1];
  }
  return result;
}

void sub_10000C680(id a1, id a2, id a3, BOOL *a4)
{
}

id sub_10000C688(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_1000B5350];
}

void sub_10000C69C(id a1, NSString *a2, NDSessionManager *a3, BOOL *a4)
{
}

void sub_10000C6A4(id a1)
{
}

id sub_10000C6B0(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueue_resetRequestDelay];
  CC_LONG v2 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v2 _onqueue_resetRequestDelay];
}

id sub_10000C6F8(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueue_resetRequestDelay];
  CC_LONG v2 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v2 _onqueue_resetRequestDelay];
}

id sub_10000C740(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_1000B5E70];
}

id sub_10000C754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[*(id *)(a1 + 32) handleStateUpdate:a4 forProcess:a3];
}

void sub_10000D4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000F590(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    CC_LONG v2 = [(id)result domain];
    if ([v2 isEqualToString:NSURLErrorDomain])
    {

      goto LABEL_5;
    }
    uint64_t v3 = [v1 domain];
    unsigned int v4 = [v3 isEqualToString:kCFErrorDomainCFNetwork];

    if (v4)
    {
LABEL_5:
      id v5 = [v1 code];
      if ((unint64_t)v5 + 1019 <= 0x14)
      {
        if (((1 << (v5 - 5)) & 0xC501) != 0) {
          return 1;
        }
        if (v5 == (id)-1001)
        {
          uint64_t v16 = [v1 userInfo];
          v17 = [v16 objectForKeyedSubscript:_kCFStreamErrorCodeKey];
          id v18 = [v17 integerValue];

          if ((unint64_t)v18 + 2106 >= 4) {
            return 1;
          }
          return (((_BYTE)v18 + 58) & 0xF) == 2;
        }
        if (v5 == (id)-999)
        {
          long long v9 = [v1 userInfo];
          uint64_t v10 = [v9 objectForKeyedSubscript:NSURLErrorBackgroundTaskCancelledReasonKey];
          id v11 = [v10 integerValue];

          return v11 == (id)2;
        }
      }
      return 0;
    }
    uint64_t v6 = [v1 domain];
    unsigned int v7 = [v6 isEqualToString:@"_nsurlsessiondErrorDomain"];

    if (v7)
    {
      unint64_t v8 = (unint64_t)[v1 code];
      if (v8 < 0xA) {
        return (0x3F9u >> v8) & 1;
      }
      return 0;
    }
    BOOL v13 = [v1 domain];
    unsigned int v14 = [v13 isEqualToString:AVFoundationErrorDomain];

    if (!v14) {
      return 0;
    }
    id v15 = [v1 code];
    result = 1;
    if (((unint64_t)v15 + 11829 > 0xA || ((1 << (v15 + 53)) & 0x483) == 0)
      && v15 != (id)-11900)
    {
      return 0;
    }
  }
  return result;
}

void sub_10000F7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000F7D4(void *a1)
{
  CC_LONG v2 = [a1 domain];
  unsigned int v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

  return v3 && (char *)[a1 code] - 6 < (char *)4;
}

void sub_10000F83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000F84C(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    CC_LONG v2 = [(id)result domain];
    unsigned __int8 v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

    if (v3)
    {
      return 1;
    }
    else
    {
      unsigned int v4 = [v1 domain];
      unsigned int v5 = [v4 isEqualToString:NSURLErrorDomain];

      return v5 && [v1 code] == (id)-997;
    }
  }
  return result;
}

void sub_10000F8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F8FC(void *a1)
{
  v1 = [a1 domain];
  id v2 = [v1 isEqualToString:@"_nsurlsessiondErrorDomain"];

  return v2;
}

void sub_10000F93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_10000F94C(void *a1)
{
  id v2 = [a1 domain];
  unsigned int v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

  if (v3 && (unint64_t v4 = (unint64_t)[a1 code], v4 < 6)) {
    return off_1000B4F48[v4];
  }
  else {
    return 0;
  }
}

void sub_10000F9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F9CC(void *a1, id a2, void *a3)
{
  id v12 = a3;
  if (a1)
  {
    BOOL v7 = a2 == (id)300 || a2 == (id)400 || a2 == (id)600;
    if (v12 && v7)
    {
      unsigned int v8 = [v12 isForeground];
      if (a2 == (id)300) {
        char v9 = 1;
      }
      else {
        char v9 = v8;
      }
      uint64_t v10 = 350;
      if (v8) {
        uint64_t v10 = (uint64_t)a2;
      }
      uint64_t v11 = 650;
      if (a2 != (id)600) {
        uint64_t v11 = (uint64_t)a2;
      }
      if (a2 == (id)400) {
        uint64_t v11 = 450;
      }
      if (v9) {
        a2 = (id)v10;
      }
      else {
        a2 = (id)v11;
      }
    }
    if (a2 != [a1 _priorityValue]) {
      [a1 set_priority:a2];
    }
  }
}

void sub_10000FA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000FAA8(void *a1)
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 _metrics];
  id v2 = [v1 _daemon_currentTransactionMetrics];
  unsigned int v3 = [v2 _daemon_connectionMetrics];

  if (v3)
  {
    [v3 _daemon_establishTime];
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_10000FB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000FB54(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  if (qword_1000CB030 != -1) {
    dispatch_once(&qword_1000CB030, &stru_1000B4F28);
  }
  unsigned int v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    unsigned int v5 = [v2 stringByDeletingLastPathComponent];
    uint64_t v6 = [v2 lastPathComponent];
    BOOL v7 = [v6 stringByAppendingString:@"_unsafe"];
    unsigned int v8 = [v5 stringByAppendingPathComponent:v7];

    id v9 = v2;
    uint64_t v10 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation];
    id v11 = v8;
    id v12 = (const std::__fs::filesystem::path *)[v11 fileSystemRepresentation];
    rename(v10, v12, v13);
    if (v14)
    {
      id v15 = (id)qword_1000CB148;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v29 = *__error();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v34 = v29;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v9;
        *(_WORD *)&v34[14] = 2112;
        *(void *)&v34[16] = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error %d renaming item at %@ to %@. Won't try to unarchive.", buf, 0x1Cu);
      }

      uint64_t v16 = 0;
      id v17 = 0;
      +[NDFileUtilities removeItemAtPath:v9];
    }
    else
    {
      uint64_t v19 = qword_1000CB028;
      v20 = +[NSData dataWithContentsOfFile:v11];
      id v32 = 0;
      uint64_t v16 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v20 error:&v32];
      id v17 = v32;

      if (v16)
      {
        id v21 = v11;
        id v22 = (const std::__fs::filesystem::path *)[v21 fileSystemRepresentation];
        id v23 = v9;
        uint64_t v24 = (const std::__fs::filesystem::path *)[v23 fileSystemRepresentation];
        rename(v22, v24, v25);
        if (v26)
        {
          BOOL v27 = (id)qword_1000CB148;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            int v30 = *__error();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v34 = v30;
            *(_WORD *)&v34[4] = 2112;
            *(void *)&v34[6] = v21;
            *(_WORD *)&v34[14] = 2112;
            *(void *)&v34[16] = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error %d renaming item at %@ to %@", buf, 0x1Cu);
          }
        }
      }
      else
      {
        v28 = (id)qword_1000CB148;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          unsigned int v31 = [v17 code];
          *(_DWORD *)buf = 138412802;
          *(void *)v34 = v11;
          *(_WORD *)&v34[8] = 2112;
          *(void *)&v34[10] = v17;
          *(_WORD *)&v34[18] = 1024;
          *(_DWORD *)&v34[20] = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failure trying to unarchive file at %@ error: %@ [%d]", buf, 0x1Cu);
        }

        uint64_t v16 = 0;
        +[NDFileUtilities removeItemAtPath:v11];
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

void sub_10000FF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FFB4(id a1)
{
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v14, v13, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  id v12 = (void *)qword_1000CB028;
  qword_1000CB028 = v11;

  id v15 = sub_10006655C();
  [qword_1000CB028 unionSet:];
  [(id)qword_1000CB028 addObject:objc_opt_class()];
  [(id)qword_1000CB028 addObject:objc_opt_class()];
}

void sub_100010170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_100010184(void *a1)
{
  uint64_t v1 = 0;
  if (a1)
  {
    if (&_CHSIsWidgetExtensionPoint)
    {
      uint64_t v3 = [a1 extensionPointRecord];
      uint64_t v1 = [v3 identifier];

      if (v1)
      {
        uint64_t v4 = [a1 extensionPointRecord];
        uint64_t v5 = [v4 identifier];
        uint64_t v1 = (void *)CHSIsWidgetExtensionPoint();
      }
    }
  }
  return v1;
}

void sub_100010214(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t start(int a1, uint64_t a2)
{
  os_log_t v4 = os_log_create("com.apple.nsurlsessiond", "background");
  uint64_t v5 = (void *)qword_1000CB148;
  qword_1000CB148 = (uint64_t)v4;

  bzero(buf, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v24 = (id)qword_1000CB148;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = *__error();
      int v30 = 67109120;
      int v31 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to set directory suffix: %{darwin.errno}d", (uint8_t *)&v30, 8u);
    }

    exit(1);
  }
  if (!confstr(65537, (char *)buf, 0x400uLL))
  {
    int v26 = (id)qword_1000CB148;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = *__error();
      int v30 = 67109120;
      int v31 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)&v30, 8u);
    }

    exit(1);
  }
  uint64_t v6 = realpath_DARWIN_EXTSN((const char *)buf, 0);
  if (!v6)
  {
    v28 = (id)qword_1000CB148;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = *__error();
      int v30 = 67109120;
      int v31 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "failed to resolve temporary directory: %{darwin.errno}d", (uint8_t *)&v30, 8u);
    }

    exit(1);
  }
  free(v6);
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  uint64_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);

  dispatch_source_set_event_handler(v8, &stru_1000B4F78);
  dispatch_resume(v8);
  uint64_t v10 = +[Daemon sharedDaemon];
  if (a1 >= 2)
  {
    uint64_t v11 = a1 - 1;
    id v12 = (const char **)(a2 + 8);
    do
    {
      uint64_t v13 = *v12;
      if (!strcmp(*v12, "--privileged"))
      {
        [v10 setPrivileged:1];
      }
      else if (!strcmp(v13, "--postlogoutsync"))
      {
        [v10 setInSyncBubble:1];
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  os_log_t v14 = os_log_create("com.apple.nsurlsessiond", "proxy");
  id v15 = (void *)qword_1000CB110;
  qword_1000CB110 = (uint64_t)v14;

  if (([v10 isInSyncBubble] & 1) == 0)
  {
    uint64_t v16 = +[PDURLSessionProxyServerService sharedService];
    [v16 start];
  }
  int v17 = CacheDeleteRegisterInfoCallbacks();
  id v18 = qword_1000CB148;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CacheDelete callback registration failed!", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CacheDelete callback registration succeeded.", buf, 2u);
  }
  [v10 start];
  uint64_t v19 = dispatch_get_global_queue(9, 0);
  dispatch_async(v19, &stru_1000B4F98);

  [v10 restoreState];
  [v10 setupArchiveTimer];
  id v20 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nsurlsessiond"];
  [v20 setDelegate:v10];
  id v21 = [v10 queue];
  [v20 _setQueue:v21];

  [v20 resume];
  if (([v10 isInSyncBubble] & 1) == 0 && qword_1000CB0A8 != -1) {
    dispatch_once(&qword_1000CB0A8, &stru_1000B58E0);
  }

  id v22 = +[NSRunLoop currentRunLoop];
  [v22 run];

  return 1;
}

void sub_1000106F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001077C(id a1)
{
  uint64_t v2 = +[Daemon sharedDaemon];
  unsigned __int8 v3 = [v2 isInSyncBubble];

  if ((v3 & 1) == 0)
  {
    os_log_t v4 = sub_100023D7C();
    uint64_t v5 = v4;
    if (v4) {
      sub_100023DEC(v4);
    }
    uint64_t v6 = +[NDFileUtilities defaultDownloadDirectoryContainer];
    if (v6)
    {
      uint64_t v7 = +[NSFileManager defaultManager];
      v11[0] = NSURLIsDirectoryKey;
      v11[1] = NSURLIsSymbolicLinkKey;
      v11[2] = NSURLIsVolumeKey;
      uint64_t v8 = +[NSArray arrayWithObjects:v11 count:3];
      uint64_t v9 = [v7 enumeratorAtURL:v6 includingPropertiesForKeys:v8 options:5 errorHandler:&stru_1000B5168];

      while (1)
      {

        uint64_t v7 = [v9 nextObject];
        if (!v7) {
          break;
        }
        sub_100023DEC(v7);
      }
    }
  }
}

void sub_100010910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010974(id a1)
{
  uint64_t v1 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "SIGTERM received, shutting down.", v2, 2u);
  }
  exit(0);
}

void sub_10001128C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000114DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001185C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1000120E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = [[*(id *)(a1 + 32) _onqueue_sourceApplicationForMessage:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) _onqueue_priorityForMessage:*(void *)(a1 + 40) ofType:*(unsigned __int16 *)(a1 + 56) isReply:1];
  id v6 = [*(id *)(a1 + 32) _onqueue_IDSTimoutForMessage:*(void *)(a1 + 40)];
  BOOL v7 = v5 == (id)300;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 80);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012228;
  v12[3] = &unk_1000B5010;
  v12[4] = v8;
  id v13 = v3;
  __int16 v17 = *(_WORD *)(a1 + 56);
  id v14 = *(id *)(a1 + 48);
  id v15 = v4;
  BOOL v18 = v7;
  id v16 = v6;
  id v10 = v4;
  id v11 = v3;
  dispatch_async(v9, v12);
}

void sub_100012208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012228(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 72);
  id v4 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  [v1 _onqueue_sendMessage:v2 ofType:v3 responseIdentifier:0 forSourceApplication:v4 withUrgency:v5 withIDSMessageTimeout:v6 withReply:v7];
}

void sub_1000122A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000123D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v10) {

  }
  _Unwind_Resume(a1);
}

void sub_100012548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000127B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_sendMessage:*(void *)(a1 + 40) ofType:*(unsigned __int16 *)(a1 + 56) responseIdentifier:0 forSourceApplication:0 withUrgency:0 withIDSMessageTimeout:[*(id *)(a1 + 32) _onqueue_IDSTimoutForMessage:*(void *)(a1 + 40)] withReply:*(void *)(a1 + 48)];
}

void sub_1000130A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  if (!v17)
  {

    __int16 v17 = 0;
  }

  _Unwind_Resume(a1);
}

void sub_1000131E8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    uint64_t v3 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(unsigned __int16 *)(a1 + 48);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Timed out waiting for reply for message, identifier = %{public}@, type = %u", (uint8_t *)&v7, 0x12u);
    }
    id v4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:0];
    [*(id *)(a1 + 32) _onqueue_messageWithIdentifier:*(void *)(a1 + 40) didSendWithSuccess:0 error:v4];
  }
}

void sub_1000132F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000139DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001401C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014040(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueue_sendStartupMessage];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _onqueue_remoteDeviceStartedUp];
}

void sub_1000140F0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.nsurlsessionproxy"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 8) addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v5 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyService setting preferInfraWiFi to NO", v7, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setPreferInfraWiFi:0];
  [*(id *)(a1 + 32) _onqueue_sendStartupMessage];
  [*(id *)(a1 + 32) _onqueue_updateDeviceState];
  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:"devicesDidUnpair:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
}

void sub_1000141E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100014B94(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = (id)v2;
  id v4 = [[*(id *)(*(void *)(a1 + 40) + 96) objectForKeyedSubscript:];

  if (v3 == v4) {
    [*(id *)(*(void *)(a1 + 40) + 96) removeObjectForKey:v5];
  }
}

void sub_100014C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000153C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015674(id a1, NSString *a2, PDURLSessionProxyServer *a3, BOOL *a4)
{
}

void sub_1000156E0(id a1, NSString *a2, PDURLSessionProxyServer *a3, BOOL *a4)
{
}

void sub_100015758(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 120);
  BOOL v3 = v2 == 1;
  BOOL v4 = v2 < 1;
  uint64_t v5 = v2 - 1;
  if (!v4)
  {
    *(void *)(v1 + 120) = v5;
    if (v3)
    {
      int v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[16];
      if (!v8)
      {
        __int16 v9 = [v7 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000158B8;
        v14[3] = &unk_1000B6380;
        v14[4] = *(void *)(a1 + 32);
        uint64_t v10 = sub_10004253C(v9, v14);
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(v11 + 128);
        *(void *)(v11 + 128) = v10;

        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 128));
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 128);
      }
      if (qword_1000CB090 != -1) {
        dispatch_once(&qword_1000CB090, &stru_1000B5800);
      }
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)((double)dword_1000CA6C0 * 1000000000.0));
      if (v8) {
        dispatch_source_set_timer(v8, v13, 0x1DCD64FFC4653600uLL, 0);
      }
    }
  }
}

void sub_1000158B8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

void *sub_100015978(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 120);
  *(void *)(v1 + 120) = v2 + 1;
  if (!v2)
  {
    BOOL v3 = result;
    uint64_t v4 = result[4];
    uint64_t v5 = *(NSObject **)(v4 + 128);
    if (v5)
    {
      dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD64FFC4653600uLL, 0);
      uint64_t v4 = v3[4];
    }
    int v6 = *(void **)(v4 + 136);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = v3[4];
      __int16 v9 = *(void **)(v8 + 136);
      *(void *)(v8 + 136) = v7;

      int v6 = *(void **)(v3[4] + 136);
    }
    return _[v6 acquire];
  }
  return result;
}

void sub_100015BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_100015C90(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 26))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 26) = 0;
    BOOL v3 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v2[4];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating...", (uint8_t *)&v5, 0xCu);
    }
    return [(id)v2[4] _updateState];
  }
  return result;
}

void *sub_100015DC0(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 26))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 26) = 1;
    BOOL v3 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v2[4];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Acquiring...", (uint8_t *)&v5, 0xCu);
    }
    return [(id)v2[4] _updateState];
  }
  return result;
}

void sub_100015FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10001602C(void *a1)
{
}

void sub_100016130(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 104);
  BOOL v3 = v2 == 1;
  BOOL v4 = v2 < 1;
  uint64_t v5 = v2 - 1;
  if (!v4)
  {
    *(void *)(v1 + 104) = v5;
    if (v3)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[14];
      if (v8)
      {
        dispatch_time_t v9 = dispatch_time(0, 60000000000);
      }
      else
      {
        uint64_t v10 = [v7 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100016270;
        v14[3] = &unk_1000B6380;
        v14[4] = *(void *)(a1 + 32);
        uint64_t v11 = sub_10004253C(v10, v14);
        uint64_t v12 = *(void *)(a1 + 32);
        dispatch_time_t v13 = *(void **)(v12 + 112);
        *(void *)(v12 + 112) = v11;

        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 112));
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 112);
        dispatch_time_t v9 = dispatch_time(0, 60000000000);
        if (!v8) {
          return;
        }
      }
      dispatch_source_set_timer(v8, v9, 0x1DCD64FFC4653600uLL, 0);
    }
  }
}

id sub_100016270(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PDURLSessionProxyServerService;
  return [super _onqueue_setPrefersInfraWiFi:0];
}

void *sub_100016320(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 104);
  *(void *)(v1 + 104) = v2 + 1;
  if (!v2)
  {
    BOOL v3 = result;
    BOOL v4 = (void *)result[4];
    uint64_t v5 = v4[14];
    if (v5)
    {
      dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD64FFC4653600uLL, 0);
      BOOL v4 = (void *)v3[4];
    }
    v6.receiver = v4;
    v6.super_class = (Class)PDURLSessionProxyServerService;
    return [super _onqueue_setPrefersInfraWiFi:1];
  }
  return result;
}

id sub_100016434(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PDURLSessionProxyServerService;
  return [super start];
}

void sub_10001656C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165D0(id a1)
{
  uint64_t v1 = objc_alloc_init(PDURLSessionProxyServerService);
  objc_super v2 = (void *)qword_1000CB038;
  qword_1000CB038 = (uint64_t)v1;
}

id sub_1000167C8(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginSqliteTransaction];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _onqueue_deleteEntryForTask:objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v5), "unsignedIntValue", (void)v7) forSession:*(void *)(a1 + 48) sessionUUID:*(void *)(a1 + 56)];
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 32) _commitSqliteTransaction];
}

void sub_1000168E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100016A70(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginSqliteTransaction];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v5 = [*(id *)(a1 + 40) objectForKey:v4];
        objc_super v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v7 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v16;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v7);
              }
              unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) unsignedIntValue];
              [*(id *)(a1 + 32) _updateDBEntryForTask:v6 updateType:v11 sessionUUID:*(void *)(a1 + 56)];
              if (v11 == 13) {
                [*(id *)(a1 + 48) removeObjectForKey:v4];
              }
            }
            id v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v8);
        }
      }
      id v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v2);
  }

  return [*(id *)(a1 + 32) _commitSqliteTransaction];
}

void sub_100016C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100016F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016F38(uint64_t a1)
{
  id v2 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v21 = 138412290;
    v22[0] = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "_getAllSessionIDsForBundle for bundleID %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(unsigned char *)(v3 + 24))
  {
    unsigned int v11 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v21, 2u);
    }
    return;
  }
  id v7 = *(sqlite3_stmt **)(v3 + 192);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 192);
  objc_super v6 = v7;
  if (v7) {
    goto LABEL_6;
  }
  if (!sqlite3_prepare_v2(v4, "SELECT DISTINCT session_id FROM session_tasks WHERE bundle_id = ?", -1, v5, 0))
  {
    objc_super v6 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192);
LABEL_6:
    if (sqlite3_bind_text(v6, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0))
    {
      id v8 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v21 = 138412290;
        v22[0] = v9;
        long long v10 = "Failed to bind bundleID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v21, 0xCu);
        return;
      }
    }
    else
    {
      dispatch_time_t v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192);
      if (v13)
      {
        int v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          long long v15 = sqlite3_column_text(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 192), 0);
          if (v15)
          {
            long long v16 = *(void **)(a1 + 48);
            long long v17 = +[NSString stringWithUTF8String:v15];
            [v16 addObject:v17];
          }
          dispatch_time_t v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192);
          ++v14;
        }
        long long v18 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          int v21 = 67109378;
          LODWORD(v22[0]) = v14;
          WORD2(v22[0]) = 2112;
          *(void *)((char *)v22 + 6) = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "_getAllSessionIDsForBundle entries: %d for bundle: %@", (uint8_t *)&v21, 0x12u);
        }
        sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 192));
      }
    }
    return;
  }
  id v8 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v21 = 138412290;
    v22[0] = v12;
    long long v10 = "Failed to init the _getAllSessionsStmt statement for session_tasks for bundle: %@";
    goto LABEL_14;
  }
}

void sub_1000171F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

sqlite3 *sub_10001730C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(sqlite3_stmt **)(v2 + 48);
  if (v3)
  {
    sqlite3_finalize(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(sqlite3_stmt **)(v2 + 56);
  if (v4)
  {
    sqlite3_finalize(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(sqlite3_stmt **)(v2 + 64);
  if (v5)
  {
    sqlite3_finalize(v5);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v6 = *(sqlite3_stmt **)(v2 + 80);
  if (v6)
  {
    sqlite3_finalize(v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v7 = *(sqlite3_stmt **)(v2 + 88);
  if (v7)
  {
    sqlite3_finalize(v7);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v8 = *(sqlite3_stmt **)(v2 + 72);
  if (v8)
  {
    sqlite3_finalize(v8);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(sqlite3_stmt **)(v2 + 96);
  if (v9)
  {
    sqlite3_finalize(v9);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v10 = *(sqlite3_stmt **)(v2 + 104);
  if (v10)
  {
    sqlite3_finalize(v10);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  unsigned int v11 = *(sqlite3_stmt **)(v2 + 112);
  if (v11)
  {
    sqlite3_finalize(v11);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v12 = *(sqlite3_stmt **)(v2 + 120);
  if (v12)
  {
    sqlite3_finalize(v12);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  dispatch_time_t v13 = *(sqlite3_stmt **)(v2 + 128);
  if (v13)
  {
    sqlite3_finalize(v13);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v14 = *(sqlite3_stmt **)(v2 + 136);
  if (v14)
  {
    sqlite3_finalize(v14);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v15 = *(sqlite3_stmt **)(v2 + 152);
  if (v15)
  {
    sqlite3_finalize(v15);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v16 = *(sqlite3_stmt **)(v2 + 160);
  if (v16)
  {
    sqlite3_finalize(v16);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v17 = *(sqlite3_stmt **)(v2 + 168);
  if (v17)
  {
    sqlite3_finalize(v17);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v18 = *(sqlite3_stmt **)(v2 + 176);
  if (v18)
  {
    sqlite3_finalize(v18);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v19 = *(sqlite3_stmt **)(v2 + 184);
  if (v19)
  {
    sqlite3_finalize(v19);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v20 = *(sqlite3_stmt **)(v2 + 144);
  if (v20)
  {
    sqlite3_finalize(v20);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v21 = *(sqlite3_stmt **)(v2 + 192);
  if (v21)
  {
    sqlite3_finalize(v21);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  result = *(sqlite3 **)(v2 + 40);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 24) = 0;
  return result;
}

id sub_100017578(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_garbageCollect];
}

id sub_100017644(uint64_t a1)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_onqueue_deleteAllTaskEntriesForSession:sessionUUID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_100017754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017768(uint64_t a1)
{
  uint64_t v2 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138412290;
    v21[0] = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "_getAllTasksFromDBForSession: %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(unsigned char *)(v3 + 24))
  {
    unsigned int v11 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v20, 2u);
    }
    return;
  }
  id v7 = *(sqlite3_stmt **)(v3 + 56);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 56);
  objc_super v6 = v7;
  if (v7) {
    goto LABEL_6;
  }
  if (!sqlite3_prepare_v2(v4, "SELECT * from session_tasks WHERE session_id = ? LIMIT 512", -1, v5, 0))
  {
    objc_super v6 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56);
LABEL_6:
    if (sqlite3_bind_text(v6, 1, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0))
    {
      id v8 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v20 = 138412290;
        v21[0] = v9;
        long long v10 = "Failed to bind sessionID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v20, 0xCu);
        return;
      }
    }
    else
    {
      dispatch_time_t v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56);
      if (v13)
      {
        int v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          long long v16 = [*(id *)(a1 + 40) _onqueue_convertSqlRowToTaskInfoEntry:*(void *)(*(void *)(a1 + 40) + 56)];
          if (v16) {
            [*(id *)(a1 + 56) addObject:v16];
          }

          dispatch_time_t v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56);
          ++v14;
        }
        long long v17 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v20 = 67109378;
          LODWORD(v21[0]) = v14;
          WORD2(v21[0]) = 2112;
          *(void *)((char *)v21 + 6) = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_getAllTasksFromDB entries: %d for session: %@", (uint8_t *)&v20, 0x12u);
        }
        sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 56));
      }
    }
    return;
  }
  id v8 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v20 = 138412290;
    v21[0] = v12;
    long long v10 = "Failed to init the _selectEntriesStmt statement for session_tasks for session: %@";
    goto LABEL_14;
  }
}

void sub_100017A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100017FD0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _onqueue_initDB];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000184F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000189E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001963C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ED0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_100020080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_100020348(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  unsigned int v11 = (void *)qword_1000CB048;
  qword_1000CB048 = v10;
}

void sub_10002086C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000210A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022564(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) willDownloadVariants:*(void *)(a1 + 40)];
}

void sub_1000225B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022644(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) countOfBytesWritten];
  [*(id *)(a1 + 32) setCountOfBytesWritten:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCountOfBytesExpectedToWrite:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:*(void *)(a1 + 32) totalBytesWritten:v2 - (void)v3 totalBytesExpectedToWrite:objc_msgSend(*(id *)(a1 + 32), "countOfBytesWritten") countOfBytesExpectedToWrite:objc_msgSend(*(id *)(a1 + 32), "countOfBytesExpectedToWrite")];
}

void sub_1000226F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002279C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) propertyList];
    [WeakRetained NDAVAssetDownloadSessionWrapper:v2 didResolveMediaSelectionPropertyList:v3];
  }
}

void sub_100022824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022928(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) propertyList];
  [WeakRetained NDAVAssetDownloadSessionWrapper:v2 didFinishDownloadForMediaSelectionPropertyList:v3];
}

void sub_100022998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022AA8(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v2;
  v11[2] = *(_OWORD *)(a1 + 88);
  id v3 = +[NSValue valueWithCMTimeRange:v11];
  long long v4 = *(_OWORD *)(a1 + 120);
  v10[0] = *(_OWORD *)(a1 + 104);
  v10[1] = v4;
  v10[2] = *(_OWORD *)(a1 + 136);
  uint64_t v5 = +[NSValue valueWithCMTimeRange:v10];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 48) propertyList];
  [WeakRetained NDAVAssetDownloadSessionWrapper:v8 didLoadTimeRange:v3 totalTimeRangesLoaded:v7 timeRangeExpectedToLoad:v5 forMediaSelectionPropertyList:v9];
}

void sub_100022B84(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100022C98(uint64_t a1)
{
  [*(id *)(a1 + 32) disavowSession];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

void sub_100022CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022DC4(uint64_t a1)
{
  [*(id *)(a1 + 32) disavowSession];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) didCompleteWithError:0];
}

void sub_100022E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100022F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023148(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100023390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100023D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_100023D7C()
{
  v0 = NSTemporaryDirectory();
  uint64_t v1 = +[NSURL fileURLWithPath:v0 isDirectory:1];

  return v1;
}

void sub_100023DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023DEC(void *a1)
{
  id v14 = a1;
  uint64_t v1 = +[NSFileManager defaultManager];
  NSURLResourceKey v17 = NSURLIsDirectoryKey;
  long long v2 = +[NSArray arrayWithObjects:&v17 count:1];
  id v3 = [v1 enumeratorAtURL:v14 includingPropertiesForKeys:v2 options:5 errorHandler:&stru_1000B51E8];

  while (1)
  {
    long long v4 = [v3 nextObject];
    if (!v4) {
      break;
    }
    id v16 = 0;
    unsigned int v6 = [v4 getResourceValue:&v16 forKey:NSURLIsDirectoryKey error:0];
    id v7 = v16;
    uint64_t v8 = v7;
    if (v6 && [v7 BOOLValue])
    {
      if (+[NDFileUtilities itemShouldBePurged:v4])
      {
        uint64_t v9 = +[NSFileManager defaultManager];
        [v9 removeItemAtURL:v4 error:0];
      }
      else
      {
        id v15 = 0;
        unsigned int v10 = [v4 getResourceValue:&v15 forKey:NSURLNameKey error:0];
        id v11 = v15;
        uint64_t v9 = v11;
        if (v10
          && [v11 hasPrefix:@"CFNetworkDownload_"]
          && [v9 hasSuffix:@".tmp"])
        {
          uint64_t v12 = +[NDFileUtilities fetchStreamingZipModificationDate:v4];
          BOOL v13 = v12 == 0;

          if (v13) {
            +[NDFileUtilities updateStreamingZipModificationDate:v4];
          }
        }
      }
    }
  }
}

void sub_100024014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_100024084(id a1, NSURL *a2, NSError *a3)
{
  long long v4 = a2;
  uint64_t v5 = a3;
  unsigned int v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteFixUpDirectoriesOnStartup enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

BOOL sub_100024158(id a1, NSURL *a2, NSError *a3)
{
  long long v4 = a2;
  uint64_t v5 = a3;
  unsigned int v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteFixUpDirectoriesInContainer enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_10002422C(id a1, int a2, __CFDictionary *a3)
{
  int v31 = a3;
  long long v4 = [(__CFDictionary *)v31 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v33 = [(__CFDictionary *)v31 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT", v4];
  id v34 = v4;
  uint64_t v5 = (uint64_t)[v33 longLongValue];
  id v32 = sub_1000247EC(v34, a2);
  [v32 keysSortedByValueUsingComparator:&stru_1000B5268];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v6)
  {
    uint64_t v36 = 0;
    uint64_t v38 = *(void *)v42;
LABEL_3:
    id v37 = v6;
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v42 != v38) {
        objc_enumerationMutation(obj);
      }
      int v8 = *(void **)(*((void *)&v41 + 1) + 8 * v7);
      id v10 = sub_100024C28(v8);
      id v40 = 0;
      unsigned int v11 = [v8 getResourceValue:&v40 forKey:NSURLIsDirectoryKey error:0];
      id v12 = v40;
      BOOL v13 = v12;
      if (v11 && [v12 BOOLValue])
      {
        id v14 = +[NSUUID UUID];
        id v39 = 0;
        unsigned int v15 = [v8 getResourceValue:&v39 forKey:NSURLParentDirectoryURLKey error:0];
        id v16 = v39;
        if (v15)
        {
          NSURLResourceKey v17 = [v14 UUIDString];
          uint64_t v18 = +[NSURL fileURLWithPath:v17 isDirectory:1 relativeToURL:v16];

          +[NDFileUtilities markItemAsPurged:v8];
          uint64_t v19 = +[NSFileManager defaultManager];
          unsigned int v20 = [v19 moveItemAtURL:v8 toURL:v18 error:0];

          id v21 = v20 ? v18 : 0;
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = v8;
      }
      if (v21)
      {
        long long v22 = +[NSFileManager defaultManager];
        unsigned int v23 = [v22 removeItemAtURL:v21 error:0];

        if (v23)
        {
          v36 += (uint64_t)v10;
          v5 -= (uint64_t)v10;
          uint64_t v24 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v21;
            __int16 v49 = 2048;
            id v50 = v10;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "CacheDelete request - Purged %@ [%zu bytes]", buf, 0x16u);
          }
        }
      }

      if (v5 < 1) {
        break;
      }
      if (v37 == (id)++v7)
      {
        id v6 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v36 = 0;
  }

  int v25 = +[NSNumber numberWithLongLong:v36];

  int v26 = (id)qword_1000CB148;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v25 longLongValue];
    id v28 = [v33 longLongValue];
    *(_DWORD *)long long v51 = 134218498;
    id v52 = v27;
    __int16 v53 = 2112;
    id v54 = v34;
    __int16 v55 = 2048;
    id v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Purged %lld bytes on volume %@.  CacheDelete requested %lld.", v51, 0x20u);
  }

  v45[0] = @"CACHE_DELETE_AMOUNT";
  v45[1] = @"CACHE_DELETE_VOLUME";
  v46[0] = v25;
  v46[1] = v34;
  int v29 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

  return v29;
}

void sub_1000246E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_1000247EC(void *a1, int a2)
{
  id v24 = a1;
  id v28 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  int v26 = +[NSDate dateWithTimeIntervalSinceNow:dbl_100091B80[a2 > 2]];
  id v25 = +[NSMutableDictionary dictionary];
  id v27 = sub_100023D7C();
  if (v27 && sub_100024D70(v27, v28))
  {
    id v3 = sub_100024E80(v27, v26);
    if (v3) {
      [v25 addEntriesFromDictionary:v3];
    }
  }
  long long v4 = +[NDFileUtilities defaultDownloadDirectoryContainer];
  uint64_t v5 = v4;
  if (v4)
  {
    unsigned int v23 = v4;
    unsigned int v6 = sub_100024D70(v4, v28);
    uint64_t v5 = v23;
    if (v6)
    {
      uint64_t v7 = +[NSFileManager defaultManager];
      v32[0] = NSURLIsDirectoryKey;
      v32[1] = NSURLIsSymbolicLinkKey;
      v32[2] = NSURLIsVolumeKey;
      int v8 = +[NSArray arrayWithObjects:v32 count:3];
      uint64_t v9 = [v7 enumeratorAtURL:v23 includingPropertiesForKeys:v8 options:5 errorHandler:&stru_1000B5208];

      uint64_t v10 = 0;
      while (1)
      {

        uint64_t v7 = [v9 nextObject];
        if (!v7)
        {
LABEL_22:

          uint64_t v5 = v23;
          break;
        }
        id v31 = 0;
        unsigned int v12 = [v7 getResourceValue:&v31 forKey:NSURLIsDirectoryKey error:0];
        id v13 = v31;
        id v14 = v13;
        if (v12 && [v13 BOOLValue])
        {
          id v30 = 0;
          unsigned int v15 = [v7 getResourceValue:&v30 forKey:NSURLIsVolumeKey error:0];
          id v16 = v30;
          NSURLResourceKey v17 = v16;
          if (v15 && ([v16 BOOLValue] & 1) == 0)
          {
            id v29 = 0;
            unsigned int v18 = [v7 getResourceValue:&v29 forKey:NSURLIsSymbolicLinkKey error:0];
            id v19 = v29;
            unsigned int v20 = v19;
            if (v18 && ([v19 BOOLValue] & 1) == 0)
            {
              id v21 = sub_100024E80(v7, v26);
              if (v21)
              {
                [v25 addEntriesFromDictionary:v21];
                v10 += (uint64_t)[v21 count];
              }
            }
            goto LABEL_21;
          }
        }
        else
        {
          NSURLResourceKey v17 = 0;
        }
        unsigned int v20 = 0;
LABEL_21:

        if ((unint64_t)++v10 > 0x2710) {
          goto LABEL_22;
        }
      }
    }
  }

  return v25;
}

void sub_100024B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

id sub_100024C28(void *a1)
{
  id v1 = a1;
  id v11 = 0;
  unsigned int v2 = [v1 getResourceValue:&v11 forKey:NSURLIsDirectoryKey error:0];
  id v3 = v11;
  long long v4 = v3;
  if (v2 && [v3 BOOLValue])
  {
    if ([v1 fileSystemRepresentation])
    {
      uint64_t v5 = 0;
      if (dirstat_np()) {
        id v6 = 0;
      }
      else {
        id v6 = v10[1];
      }
    }
    else
    {
      id v6 = 0;
      uint64_t v5 = 0;
    }
  }
  else
  {
    v10[0] = 0;
    unsigned int v7 = [v1 getResourceValue:v10 forKey:NSURLFileAllocatedSizeKey error:0];
    id v8 = v10[0];
    uint64_t v5 = v8;
    if (v7) {
      id v6 = [v8 longLongValue];
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

void sub_100024D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100024D68(id a1, NSDate *a2, NSDate *a3)
{
  return [(NSDate *)a2 compare:a3];
}

id sub_100024D70(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v11 = 0;
    unsigned int v5 = [v3 getResourceValue:&v11 forKey:NSURLVolumeIdentifierKey error:0];
    id v6 = v11;
    if (v5)
    {
      id v10 = 0;
      id v7 = [v4 getResourceValue:&v10 forKey:NSURLVolumeIdentifierKey error:0];
      id v8 = v10;
      if (v7) {
        id v7 = [v6 isEqual:v8];
      }
    }
    else
    {
      id v8 = 0;
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100024E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100024E80(void *a1, void *a2)
{
  id v24 = a1;
  id v26 = a2;
  id v3 = +[NSFileManager defaultManager];
  v31[0] = NSURLFileAllocatedSizeKey;
  v31[1] = NSURLIsDirectoryKey;
  v31[2] = NSURLIsRegularFileKey;
  v31[3] = NSURLAttributeModificationDateKey;
  v31[4] = NSURLNameKey;
  id v4 = +[NSArray arrayWithObjects:v31 count:5];
  unsigned int v5 = [v3 enumeratorAtURL:v24 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_1000B5228];

  id v25 = +[NSMutableDictionary dictionary];
  for (uint64_t i = 10000; ; --i)
  {
    id v7 = [v5 nextObject];
    if (!v7) {
      break;
    }
    id v9 = v7;
    id v30 = 0;
    unsigned int v10 = [v9 getResourceValue:&v30 forKey:NSURLIsRegularFileKey error:0];
    id v11 = v30;
    unsigned int v12 = v11;
    if (v10 && ([v11 BOOLValue] & 1) != 0)
    {
      int v13 = 1;
    }
    else
    {
      id v29 = 0;
      unsigned int v14 = [v9 getResourceValue:&v29 forKey:NSURLIsDirectoryKey error:0];
      id v15 = v29;

      if (!v14 || ![v15 BOOLValue])
      {
        unsigned int v20 = 0;
        goto LABEL_17;
      }
      int v13 = 0;
      unsigned int v12 = v15;
    }
    id v28 = 0;
    unsigned int v16 = [v9 getResourceValue:&v28 forKey:NSURLNameKey error:0];
    id v17 = v28;
    unsigned int v18 = v17;
    if (v16
      && [v17 hasPrefix:@"CFNetworkDownload_"]
      && [v18 hasSuffix:@".tmp"])
    {
      if (v13)
      {
        id v27 = 0;
        [v9 getResourceValue:&v27 forKey:NSURLAttributeModificationDateKey error:0];
        id v19 = v27;
      }
      else
      {
        id v19 = +[NDFileUtilities fetchStreamingZipModificationDate:v9];
      }
      unsigned int v20 = v19;
    }
    else
    {
      unsigned int v20 = 0;
    }

    id v15 = v12;
LABEL_17:

    if (v20)
    {
      id v21 = [v20 earlierDate:v26];
      BOOL v22 = v21 == v20;

      if (v22) {
        [v25 setObject:v20 forKey:v9];
      }
    }

    if (!i) {
      goto LABEL_25;
    }
  }
  id v9 = 0;
LABEL_25:

  return v25;
}

void sub_1000251AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_100025238(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  unsigned int v5 = a3;
  id v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeletePurgableItemsForVolume enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

BOOL sub_10002530C(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  unsigned int v5 = a3;
  id v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteGetPurgableItemsInContainer enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_1000253E0(id a1, int a2, __CFDictionary *a3)
{
  id v4 = a3;
  unsigned int v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  sub_1000247EC(v5, a2);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = 0;
  id v8 = [v6 countByEnumeratingWithState:&v19 objects:buf count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        id v13 = sub_100024C28(v11);
        v7 += (uint64_t)v13;
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:buf count:16];
    }
    while (v8);
  }

  unsigned int v14 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v7, (void)v19);

  id v15 = (id)qword_1000CB148;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v14 longLongValue];
    *(_DWORD *)buf = 134218242;
    id v26 = v16;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Informing CacheDelete purgable bytes %lld on %@", buf, 0x16u);
  }

  v23[0] = @"CACHE_DELETE_AMOUNT";
  v23[1] = @"CACHE_DELETE_VOLUME";
  v24[0] = v14;
  v24[1] = v5;
  id v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v17;
}

void sub_1000255EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000258BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_1000B5330];
}

void sub_1000258D0(id a1, id a2, id a3, BOOL *a4)
{
}

id sub_10002594C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_1000B5310];
}

void sub_100025960(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100025B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100025CB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) obliterationCompletion];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) obliterationCompletion];
    [*(id *)(a1 + 32) setObliterationCompletion:0];
    v4[2]();
  }
}

void sub_100025D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100025E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025E70(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100025EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000260C8(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_100026210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000264F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100026654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000266F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40))
  {
    id v3 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 24);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending boost activity from %@", (uint8_t *)&v8, 0xCu);
    }
    unsigned int v5 = +[NSProcessInfo processInfo];
    [v5 endActivity:*(void *)(*(void *)(a1 + 32) + 40)];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void sub_1000267DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002707C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_10002723C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100027298(uint64_t a1)
{
  uint64_t v2 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggering periodic update to powerlog for client %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_1000B52A8];
}

void sub_100027354(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100027418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 280);
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) when attempting to communicate with HTTP Authenticator for Client %@", (uint8_t *)&v8, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100027D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027D7C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (id)qword_1000CB148;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [*(id *)(a1 + 32) uuid];
    id v11 = [*(id *)(a1 + 40) _loggableDescription];
    int v12 = 138544386;
    id v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received auth headers for response, continueLoad: %d authHeaders %@ newRequest %@", (uint8_t *)&v12, 0x30u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100027ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000282C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    dup((int)[v3 fileDescriptor]);
    [v4 closeFile];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000283AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000285BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000287A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002895C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100029070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) taskKind] == (id)2)
  {
    [*(id *)(a1 + 32) setShouldCancelOnDisconnect:1];
    id v7 = *(void **)(a1 + 40);
    id v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    [v7 queueUpdatesForTask:v8 updateType:10 highPriority:0];
  }
  id v16 = v5;
  uint64_t v9 = [*(id *)(a1 + 48) HTTPBodyStream];
  __int16 v10 = v9;
  if (v9 && ![v9 streamStatus])
  {
    [v10 open];
    [v10 close];
  }
  id v11 = v16;
  if (v6)
  {
    id v11 = [v16 mutableCopy];
    int v12 = [*(id *)(a1 + 40) inputStreamWithFileHandle:v6 taskIdentifier:*(void *)(a1 + 72)];
    [v11 setHTTPBodyStream:v12];
  }
  uint64_t v13 = *(void *)(a1 + 56);
  __int16 v14 = *(void **)(a1 + 40);
  uint64_t v15 = [*(id *)(a1 + 48) URL];
  [v14 errorIfBlockedTracker:v13 url:v15];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100029200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000295A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A04C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) during didReciveData delegate", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002A164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002A648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A764(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with didReceiveResponse outstanding, responding with a cancel disposition", (uint8_t *)&v8, 0x20u);
  }
  int v7 = [*(id *)(a1 + 40) error:NSURLErrorDomain code:-997];
  [*(id *)(a1 + 40) cancel_with_error:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002A8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A8E8(uint64_t a1, int a2)
{
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client responded to didReceiveResponse with disposition %d", (uint8_t *)&v8, 0x1Cu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002A9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002B5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10002B834(uint64_t *a1)
{
  if (![(id)a1[4] taskKind])
  {
    uint64_t v2 = (void *)a1[5];
    if (v2)
    {
      id v3 = [v2 userInfo];
      id v4 = [v3 objectForKey:NSURLSessionDownloadTaskResumeData];

      if (!v4)
      {
        id v5 = (void *)a1[6];
        uint64_t v6 = a1[4];
        [v5 removeDownloadFileForTaskInfo:v6];
      }
    }
  }
}

void sub_10002B8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002B8D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002BB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BEE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v7 = 138543874;
    int v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with new body stream request outstanding, providing no body", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002C000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C030(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) inputStreamWithFileHandle:v3 taskIdentifier:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002C0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002C1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002C96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_10002CBFC(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setCurrentRequest:];
  id v3 = *(void **)(a1 + 40);
  id v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v3 queueUpdatesForTask:v4 updateType:8 highPriority:0];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002CC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002CCBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v7 = 138543874;
    int v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with redirection outstanding, following redirect", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10002CDD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CE04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v6 = [v3 URL];
  LODWORD(v4) = [v4 errorIfBlockedTracker:v5 url:v6];

  uint64_t v7 = 56;
  if (v4) {
    uint64_t v7 = 48;
  }
  (*(void (**)(void))(*(void *)(a1 + v7) + 16))();
}

void sub_10002CEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D9A8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002D9D0(void *a1)
{
  uint64_t v1 = [a1 protectionSpace];
  uint64_t v2 = [v1 authenticationMethod];
  if (([v2 isEqualToString:NSURLAuthenticationMethodNTLM] & 1) != 0
    || ([v2 isEqualToString:NSURLAuthenticationMethodNegotiate] & 1) != 0
    || ([v2 isEqualToString:NSURLAuthenticationMethodClientCertificate] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = (uint64_t)[v2 isEqualToString:NSURLAuthenticationMethodServerTrust];
  }

  return v3;
}

void sub_10002DA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DC74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002E3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002E6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002E7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002E9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002ECCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002F698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FE78(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000300E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10003014C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received resume data", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100030258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030288(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) uuid];
    uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received resume data", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100030394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000306A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100030AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100030BB0(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 user];
  uint64_t v7 = [v5 password];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    __int16 v9 = [v19 host];
    __int16 v10 = +[NSString stringWithFormat:@"%@%@%@", @"__com.apple.CFNetwork.prefix__", v9, *(void *)(*(void *)(a1 + 32) + 280)];

    id v11 = objc_alloc((Class)NSURLProtectionSpace);
    id v12 = [v19 port];
    int v13 = [v19 protocol];
    __int16 v14 = [v19 realm];
    uint64_t v15 = [v19 authenticationMethod];
    id v16 = [v11 initWithHost:v10 port:v12 protocol:v13 realm:v14 authenticationMethod:v15];

    int v17 = +[NSURLCredential credentialWithUser:v6 password:v8 persistence:2];
    __int16 v18 = +[NSURLCredentialStorage sharedCredentialStorage];
    [v18 setDefaultCredential:v17 forProtectionSpace:v16];
  }
}

void sub_100030D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1000311E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000312B0(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 user];
  uint64_t v7 = [v5 password];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    __int16 v9 = [v19 host];
    __int16 v10 = +[NSString stringWithFormat:@"%@%@%@", @"__com.apple.CFNetwork.prefix__", v9, *(void *)(*(void *)(a1 + 32) + 280)];

    id v11 = objc_alloc((Class)NSURLProtectionSpace);
    id v12 = [v19 port];
    int v13 = [v19 protocol];
    __int16 v14 = [v19 realm];
    uint64_t v15 = [v19 authenticationMethod];
    id v16 = [v11 initWithHost:v10 port:v12 protocol:v13 realm:v14 authenticationMethod:v15];

    int v17 = +[NSURLCredential credentialWithUser:v6 password:v8 persistence:2];
    __int16 v18 = +[NSURLCredentialStorage sharedCredentialStorage];
    [v18 setDefaultCredential:v17 forProtectionSpace:v16];
  }
}

void sub_100031464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1000318E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100031CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100032060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000325A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100032CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100032D64(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpClient:*(void *)(a1 + 40)];
}

void sub_100032F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000330E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000333D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000335A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033EA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = [v2 objectForKeyedSubscript:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 224);
  id v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  [*(id *)(a1 + 32) enqueueTaskWithIdentifier:*(void *)(a1 + 40)];
  if (![v6 state] && !objc_msgSend(v6, "suspendCount") && !*(unsigned char *)(a1 + 48))
  {
    [v7 startResourceTimer];
    [*(id *)(a1 + 32) taskShouldResume:*(void *)(a1 + 40)];
  }
}

void sub_100033F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100034020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100034090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000341B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000343E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000346D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034734(uint64_t a1)
{
  uint64_t v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    id v4 = [*(id *)(a1 + 40) _loggableDescription];
    *(_DWORD *)buf = 138543618;
    id v21 = v3;
    __int16 v22 = 2114;
    unsigned int v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resuming", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 40) personaUniqueString];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    id v7 = +[UMUserManager sharedManager];
    id v8 = [v7 currentPersona];
    __int16 v9 = [*(id *)(a1 + 40) personaUniqueString];
    id v10 = [v8 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v9];
  }
  id v11 = [*(id *)(a1 + 48) _backgroundPublishingURL];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    [*(id *)(a1 + 48) progress];
  }
  int v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100034A00;
  v17[3] = &unk_1000B54B8;
  v17[4] = v13;
  uint64_t v19 = v14;
  id v18 = *(id *)(a1 + 40);
  [v13 handleEarliestBeginDateForTaskWithIdentifier:v14 completionHandler:v17];
  if (([*(id *)(a1 + 40) hasStarted] & 1) == 0
    && ([*(id *)(a1 + 40) isDiscretionary] & 1) == 0)
  {
    [*(id *)(a1 + 40) setStartedUserInitiated:1];
  }
  [*(id *)(a1 + 40) setHasStarted:1];
  uint64_t v15 = *(void **)(a1 + 32);
  id v16 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v15 queueUpdatesForTask:v16 updateType:14 highPriority:1];
}

void sub_10003498C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034A00(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034AB4;
  v4[3] = &unk_1000B53C8;
  v4[4] = v2;
  uint64_t v6 = v3;
  char v7 = a2;
  id v5 = *(id *)(a1 + 40);
  [v2 handleWillBeginDelayedRequestForTaskWithIdentifier:v3 completionHandler:v4];
}

void sub_100034AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034AB4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = [*(id *)(a1 + 32) requestWithAdjustedWindowForTaskInfo:*(void *)(a1 + 40)];
    [v4 updateCurrentRequest:v5];
  }
  uint64_t v6 = (id)qword_1000CB148;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [*(id *)(a1 + 32) uuid];
    id v8 = [*(id *)(a1 + 40) _loggableDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v7;
    __int16 v21 = 2114;
    __int16 v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will begin", buf, 0x16u);
  }
  __int16 v9 = *(void **)(*(void *)(a1 + 32) + 64);
  id v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    unsigned int v12 = [*(id *)(a1 + 40) isDiscretionary];
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v13 + 142)) {
      uint64_t v14 = v12 | 2;
    }
    else {
      uint64_t v14 = v12;
    }
    if (*(unsigned char *)(v13 + 146) || [*(id *)(v13 + 32) canBeSuspended]) {
      v14 |= 4uLL;
    }
    id v11 = -[NDTaskMonitor initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:]([NDTaskMonitor alloc], "initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:", v4, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 280), *(void *)(*(void *)(a1 + 32) + 296), *(void *)(*(void *)(a1 + 32) + 216), [*(id *)(a1 + 40) basePriority], v14, *(void *)(*(void *)(a1 + 32) + 200));
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 64);
    id v16 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v15 setObject:v11 forKeyedSubscript:v16];
  }
  [(NDTaskMonitor *)v11 taskWillResume];
  sub_10005CD1C(0, *(void **)(*(void *)(a1 + 32) + 280), *(void **)(*(void *)(a1 + 32) + 272), *(void **)(*(void *)(a1 + 32) + 288), *(void **)(*(void *)(a1 + 32) + 296), v4, *(void **)(a1 + 40), 0);
  int v17 = *(void **)(a1 + 32);
  id v18 = [v4 currentRequest_URL];
  LOBYTE(v17) = [v17 errorIfBlockedTracker:v4 url:v18];

  if ((v17 & 1) == 0) {
    [v4 resume];
  }
}

void sub_100034D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035444(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 56);
  char v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (a2 == 1 && v5)
  {
    __int16 v9 = (id)qword_1000CB148;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) uuid];
      id v11 = [v8 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v26 = v10;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ using new request from delayed request callback", buf, 0x16u);
    }
    [v8 updateCurrentRequest:v5];
    [*(id *)(a1 + 40) setCurrentRequest:v5];
    unsigned int v12 = *(void **)(a1 + 32);
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) identifier]);
    [v12 queueUpdatesForTask:v13 updateType:8 highPriority:0];
  }
  else
  {
    uint64_t v13 = (id)qword_1000CB148;
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (a2 == 2)
    {
      if (v14)
      {
        uint64_t v15 = [*(id *)(a1 + 32) uuid];
        id v16 = [v8 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        id v26 = v15;
        __int16 v27 = 2114;
        id v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will be canceled due to delayed request callback", buf, 0x16u);
      }
      uint64_t v13 = [v8 error:NSURLErrorDomain code:-999];
      [v8 cancel_with_error:v13];
    }
    else if (v14)
    {
      int v17 = [*(id *)(a1 + 32) uuid];
      id v18 = [v8 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ continuing load from delayed request callback", buf, 0x16u);
    }
  }

  [*(id *)(a1 + 40) setRespondedToWillBeginDelayedRequestCallback:1];
  uint64_t v19 = *(void **)(a1 + 32);
  __int16 v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) identifier]);
  [v19 queueUpdatesForTask:v20 updateType:9 highPriority:0];

  __int16 v21 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  LODWORD(v20) = [*(id *)(a1 + 40) qos];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035864;
  block[3] = &unk_1000B5EC0;
  id v24 = *(id *)(a1 + 48);
  dispatch_block_t v22 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)v20, 0, block);
  dispatch_async(v21, v22);
}

void sub_1000357E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100035864(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100035C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035CF8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) resumedAndWaitingForEarliestBeginDate];
  uint64_t v3 = (id)qword_1000CB148;
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) uuid];
      uint64_t v6 = [*(id *)(a1 + 32) _loggableDescription];
      int v17 = 138543618;
      id v18 = v5;
      __int16 v19 = 2114;
      __int16 v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ can now begin - earliest begin date satisfied", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) setResumedAndWaitingForEarliestBeginDate:0];
    char v7 = *(void **)(*(void *)(a1 + 40) + 56);
    id v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    __int16 v9 = [v7 objectForKeyedSubscript:v8];
    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 40) + 224);
      id v11 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
      unsigned int v12 = [v10 objectForKeyedSubscript:v11];
      LOBYTE(v10) = v12 == 0;

      if ((v10 & 1) == 0)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        return;
      }
    }
    else
    {
    }
    uint64_t v3 = (id)qword_1000CB148;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 40) uuid];
      id v16 = [*(id *)(a1 + 32) _loggableDescription];
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2114;
      __int16 v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ no longer has a valid task or taskInfo, no need to begin", (uint8_t *)&v17, 0x16u);
    }
  }
  else if (v4)
  {
    uint64_t v13 = [*(id *)(a1 + 40) uuid];
    BOOL v14 = [*(id *)(a1 + 32) _loggableDescription];
    int v17 = 138543618;
    id v18 = v13;
    __int16 v19 = 2114;
    __int16 v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ ignoring stale delay begin timer", (uint8_t *)&v17, 0x16u);
  }
}

void sub_100035F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000360AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000369C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000369E4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) fillInByteCountsForTaskInfo:v5 withTaskID:v6];
  [*(id *)(a1 + 32) fillInPropertiesForTaskInfo:v5 withTaskID:v6];
}

void sub_100036A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036DD8(uint64_t a1)
{
  unsigned int v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 272);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 280);
    int v21 = 138543874;
    dispatch_block_t v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Received signal to deliver pending events for client session: <%@>.<%@>", (uint8_t *)&v21, 0x20u);
  }
  id v6 = *(void **)(a1 + 32);
  if (v6[19])
  {
    char v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) uuid];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 272);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 280);
      int v21 = 138543874;
      dispatch_block_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Delivering pending events for client session: <%@>.<%@>", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = a1 + 32;
    uint64_t v13 = (void (**)(void))objc_retainBlock(*(id *)(v12 + 152));
    BOOL v14 = *(void **)(*(void *)v11 + 152);
    *(void *)(*(void *)v11 + 152) = 0;

    v13[2](v13);
  }
  else
  {
    uint64_t v15 = (void *)v6[4];
    uint64_t v16 = v6[34];
    int v17 = [v6 uuid];
    LODWORD(v15) = [v15 isHandlingBackgroundURLSessionWithIdentifier:v16 withSessionUUID:v17];

    if (v15)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
    }
    else
    {
      id v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [*(id *)(a1 + 32) uuid];
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 280);
        int v21 = 138543618;
        dispatch_block_t v22 = v19;
        __int16 v23 = 2112;
        uint64_t v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Application %@ is not handling a background URLSession but we still received a signal to deliver pending events", (uint8_t *)&v21, 0x16u);
      }
    }
  }
}

void sub_100037040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000372FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100037350(uint64_t a1)
{
  unsigned int v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Invoking client reconnection completion block", (uint8_t *)&v5, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 208) performAllCallbacks];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100037440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100037D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100037F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000385AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000386BC(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 224);
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (*(unsigned char *)(a1 + 48)) {
    [v4 setLowThroughputTimerRetryCount:0];
  }
  if (![v4 state] && !objc_msgSend(v4, "suspendCount")) {
    [*(id *)(a1 + 32) taskShouldResume:[v4 identifier]];
  }
}

void sub_100038778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100038D24(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 downloadFileURL];

    if (v10)
    {
      uint64_t v11 = [v9 downloadFileURL];
      uint64_t v12 = +[Daemon sharedDaemon];
      if ([v12 isPrivileged])
      {
      }
      else
      {
        uint64_t v13 = [v11 path];
        BOOL v14 = [*(id *)(*(void *)(a1 + 32) + 120) path];
        unsigned __int8 v15 = [v13 hasPrefix:v14];

        if ((v15 & 1) == 0)
        {
          uint64_t v16 = (id)qword_1000CB148;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = [*(id *)(a1 + 32) uuid];
            uint64_t v18 = *(void *)(a1 + 32);
            __int16 v19 = *(void **)(v18 + 280);
            uint64_t v20 = [*(id *)(v18 + 120) path];
            int v21 = [v11 path];
            *(_DWORD *)buf = 138544130;
            id v52 = v17;
            __int16 v53 = 2112;
            id v54 = v19;
            __int16 v55 = 2112;
            id v56 = v20;
            __int16 v57 = 2112;
            id v58 = v21;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is %@. Need to fix download path", buf, 0x2Au);
          }
          dispatch_block_t v22 = *(void **)(*(void *)(a1 + 32) + 120);
          __int16 v23 = [v11 lastPathComponent];
          uint64_t v24 = [v22 URLByAppendingPathComponent:v23];
          [v9 setDownloadFileURL:v24];

          __int16 v25 = (id)qword_1000CB148;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = [*(id *)(a1 + 32) uuid];
            __int16 v27 = [v9 downloadFileURL];
            id v28 = [v27 path];
            *(_DWORD *)buf = 138543618;
            id v52 = v26;
            __int16 v53 = 2112;
            id v54 = v28;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> New download path: %@", buf, 0x16u);
          }
        }
      }
    }
    char v50 = 0;
    if ([v9 shouldCancelOnDisconnect] && (uint64_t)objc_msgSend(v9, "state") <= 2)
    {
      [v9 setState:3];
      id v29 = [v9 currentRequest];
      id v30 = [v29 URL];
      id v31 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v30];
      [v9 setError:v31];

      uint64_t v32 = (id)qword_1000CB148;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v45 = [*(id *)(a1 + 32) uuid];
        id v46 = [v9 _loggableDescription];
        v47 = [v9 error];
        id v48 = [v9 error];
        id v49 = [v48 code];
        *(_DWORD *)buf = 138544130;
        id v52 = v45;
        __int16 v53 = 2114;
        id v54 = v46;
        __int16 v55 = 2112;
        id v56 = v47;
        __int16 v57 = 2048;
        id v58 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)", buf, 0x2Au);
      }
    }
    uint64_t v33 = [*(id *)(a1 + 32) restoreTask:v9 isOutstanding:&v50];
    if (v33)
    {
      if (v50)
      {
        [*(id *)(a1 + 32) addOutstandingTaskWithIdentifier:[v9 identifier]];
        [*(id *)(a1 + 40) addObject:v9];
      }
      [*(id *)(*(void *)(a1 + 32) + 224) setObject:v9 forKeyedSubscript:v7];
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:v33 forKeyedSubscript:v7];
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKeyedSubscript:v33];
    }
    else
    {
      id v34 = (id)qword_1000CB148;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        long long v42 = [*(id *)(a1 + 32) uuid];
        long long v43 = *(void **)(*(void *)(a1 + 32) + 272);
        long long v44 = *(void **)(*(void *)(a1 + 32) + 280);
        *(_DWORD *)buf = 138544130;
        id v52 = v42;
        __int16 v53 = 2112;
        id v54 = v7;
        __int16 v55 = 2112;
        id v56 = v44;
        __int16 v57 = 2112;
        id v58 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>", buf, 0x2Au);
      }
    }
  }
  uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v36 = *(void *)(v35 + 24) + 1;
  *(void *)(v35 + 24) = v36;
  if (v36 >= 0x201)
  {
    id v37 = (id)qword_1000CB148;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      uint64_t v38 = *(void *)(a1 + 32);
      id v39 = *(void **)(v38 + 272);
      id v40 = *(void **)(v38 + 280);
      id v41 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543874;
      id v52 = v40;
      __int16 v53 = 2112;
      id v54 = v39;
      __int16 v55 = 2048;
      id v56 = v41;
      _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Too many tasks for app session <%{public}@>.<%@> (%zu > 512)", buf, 0x20u);
    }

    *a4 = 1;
  }
}

void sub_100039300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039CF8()
{
  objc_end_catch();
  JUMPOUT(0x100039E44);
}

void sub_100039D0C()
{
  JUMPOUT(0x100039E5CLL);
}

void sub_100039D1C()
{
}

void sub_100039D24()
{
  JUMPOUT(0x100039E6CLL);
}

void sub_10003A200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003A278(uint64_t a1)
{
  unsigned int v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = [*(id *)(a1 + 32) uuid];
    int v5 = [*(id *)(a1 + 40) _loggableDescription];
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ restored but never started, terminating with timeout", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 48) cancel_with_error:*(void *)(a1 + 56)];
}

void sub_10003A368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10003AD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003C368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C6CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C964(_Unwind_Exception *a1)
{
  int v5 = v3;

  _Unwind_Resume(a1);
}

void sub_10003CB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CCB0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 firstObject];
  unsigned __int8 v4 = [v3 isEqual:&off_1000B8A10];

  if ((v4 & 1) == 0)
  {
    if ((unint64_t)(*(void *)(a1 + 48) - 13) <= 1)
    {
      int v5 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v5 removeAllObjects];
    }
    int v6 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v6)
    {
      id v7 = +[NSMutableArray array];
      [*(id *)(*(void *)(a1 + 32) + 184) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    __int16 v8 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v8 addObject:v9];

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    _[v10 storeTaskInfoUpdates:v11];
  }
}

void sub_10003CDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10003D6E8(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 280);
  id v6 = [*(id *)(a1 + 40) bundleIdentifier];
  if (!objc_msgSend(v2, "isEqualToString:")
    || ([*(id *)(a1 + 32) clientIsActive] & 1) != 0
    || ([*(id *)(a1 + 32) sessionHasOutstandingTasks] & 1) != 0
    || (uint64_t v3 = *(void *)(a1 + 32), !*(unsigned char *)(v3 + 141)))
  {
  }
  else
  {
    id v4 = [*(id *)(v3 + 208) count];

    if (v4)
    {
      int v5 = *(void **)(a1 + 32);
      [v5 wakeUpClient:1];
    }
  }
}

void sub_10003D7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10003D878(uint64_t a1)
{
  unsigned int v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    uint64_t v4 = [*(id *)(a1 + 40) bundleIdentifier];
    int v5 = (void *)v4;
    int v6 = *(_DWORD *)(a1 + 48);
    if (*(void *)(*(void *)(a1 + 32) + 168)) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    int v9 = 138544130;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> notified associated application %@(%d) was suspended, XPC(%c)", (uint8_t *)&v9, 0x22u);
  }
  id result = [*(id *)(*(void *)(a1 + 32) + 168) processIdentifier];
  if (result == *(_DWORD *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 168) invalidate];
    return [*(id *)(a1 + 32) clientDidDisconnect];
  }
  return result;
}

void sub_10003D9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040B24(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleBetterNetworkEvent];
}

void sub_100040DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040DC8(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 handleDynamicStoreCallback:a1 changedKeys:a2];
}

void sub_100040FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000410AC(void *a1)
{
  unsigned int v2 = [[NDStatusMonitorClientHolder alloc] initWithClient:a1[4] identifier:a1[6]];
  if ([*(id *)(a1[5] + 16) containsObject:v2])
  {
    uint64_t v3 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Simulating network change event", v5, 2u);
    }
    [*(id *)(a1[5] + 16) removeObject:v2];
    uint64_t v4 = [(NDStatusMonitorClientHolder *)v2 client];
    [v4 statusMonitor:a1[5] callbackForIdentifier:-[NDStatusMonitorClientHolder identifier](v2, "identifier") networkChanged:0];
  }
}

void sub_100041194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004125C(void *a1)
{
  if (![*(id *)(a1[4] + 16) count])
  {
    symptom_create();
    symptom_set_qualifier();
    symptom_send();
  }
  unsigned int v2 = [[NDStatusMonitorClientHolder alloc] initWithClient:a1[5] identifier:a1[6]];
  [*(id *)(a1[4] + 16) addObject:v2];
  dispatch_time_t v3 = dispatch_time(0x8000000000000000, 1000000000 * a1[7]);
  uint64_t v4 = a1[4];
  int v5 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041390;
  block[3] = &unk_1000B63F8;
  void block[4] = v4;
  __int16 v8 = v2;
  uint64_t v9 = a1[7];
  int v6 = v2;
  dispatch_after(v3, v5, block);
}

void sub_100041380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041390(void *a1)
{
  if ([*(id *)(a1[4] + 16) containsObject:a1[5]])
  {
    unsigned int v2 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[6];
      int v7 = 134217984;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Simulating network change event since %lld seconds have passed", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = a1[4];
    uint64_t v4 = a1 + 4;
    [*(id *)(v5 + 16) removeObject:v4[1]];
    int v6 = [(id)v4[1] client];
    [v6 statusMonitor:*v4 callbackForIdentifier:[v4[1] identifier] networkChanged:0];
  }
}

void sub_100041494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)NDStatusMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100041654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000416B8(id a1)
{
  uint64_t v1 = objc_alloc_init(NDStatusMonitor);
  unsigned int v2 = (void *)qword_1000CB060;
  qword_1000CB060 = (uint64_t)v1;
}

void sub_10004184C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = objc_retainBlock(*(id *)(a1 + 56));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

  int v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will wake client %@ for session %@ if we receive a notification that it supports launch-on-demand", (uint8_t *)&v9, 0x16u);
  }
}

void sub_100041978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041A64(uint64_t a1)
{
  unsigned int v2 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to launch client %@ for session %@", (uint8_t *)&v8, 0x16u);
  }
  if (*(void *)(*(void *)(a1 + 48) + 16))
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "com.apple.nsurlsessiond-events.message-type", 1);
    xpc_dictionary_set_string(v5, kNSURLSessionLaunchOnDemandClientIdentifierKey, (const char *)[*(id *)(a1 + 32) UTF8String]);
    xpc_dictionary_set_string(v5, kNSURLSessionLaunchOnDemandSessionIdentifierKey, (const char *)[*(id *)(a1 + 40) UTF8String]);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 48) + 16), v5);
  }
  else
  {
    int v6 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Couldn't launch application %@ because we don't have an xpc connection to UserEventAgent", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_100041C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041D90(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_int64(xdict, "com.apple.nsurlsessiond-events.message-type") == 2)
  {
    uint64_t v18 = xpc_dictionary_get_value(xdict, "com.apple.nsurlsessiond-events.registered-clients");
    uint64_t v3 = _CFXPCCreateCFObjectFromXPCObject();
    uint64_t v4 = *(void *)(a1 + 32);
    xpc_object_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    int v6 = (id)qword_1000CB148;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updated Registered Launch-On-Demand Clients: %@", buf, 0xCu);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = *(id *)(*(void *)(a1 + 32) + 32);
    id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v11];
          if (v12)
          {
            [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v11];
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v13 = v12;
            id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v22;
              do
              {
                for (j = 0; j != v14; j = (char *)j + 1)
                {
                  if (*(void *)v22 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  int v17 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * (void)j)];
                  v17[2]();
                }
                id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              }
              while (v14);
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }
  }
}

void sub_100042044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1000421F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received xpc event", buf, 2u);
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_object_t v5 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDUserEventAgentConnection received connection", v6, 2u);
    }
    [*(id *)(a1 + 32) handleNewConnection:v3];
  }
}

void sub_1000422D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000423A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000423B4(id a1)
{
  uint64_t v1 = objc_alloc_init(NDUserEventAgentConnection);
  unsigned int v2 = (void *)qword_1000CB068;
  qword_1000CB068 = (uint64_t)v1;
}

void sub_1000423F0(id a1)
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enableBluetoothLinkRequirements", @"com.apple.nsurlsessiond", 0);
  byte_1000CB080 = AppBooleanValue;
  if (AppBooleanValue)
  {
    unsigned int v2 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "com.apple.nsurlsessiond enableBluetoothLinkRequirements is true - will assert bluetooth link requirements", v3, 2u);
    }
  }
}

void sub_100042478(id a1)
{
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"bluetoothLinkRequirementsOverrideTimerValue", @"com.apple.nsurlsessiond", 0);
  if (AppIntegerValue)
  {
    unsigned int v2 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      v3[0] = 67109120;
      v3[1] = AppIntegerValue;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "com.apple.nsurlsessiond bluetoothLinkRequirementsOverrideTimerValue is %d", (uint8_t *)v3, 8u);
    }
    dword_1000CA6C0 = AppIntegerValue;
  }
}

NSObject *sub_10004253C(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a1);
  dispatch_time_t v5 = dispatch_time(0, 2147483647000000000);
  dispatch_source_set_timer(v4, v5, 0x1DCD64FFC4653600uLL, 0);
  dispatch_source_set_event_handler(v4, v3);

  return v4;
}

void sub_1000425DC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v5 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding] & 1) == 0) {
    [*(id *)(a1 + 32) removeObjectForKey:v6];
  }
}

void sub_100042650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042B0C(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v12 = (void *)qword_1000CB098;
  qword_1000CB098 = v11;
}

void sub_100042CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042F50(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100042FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043080(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100043128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100043294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004338C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000436A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000437BC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100043840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000438D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000439EC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100043AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100043BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100043D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000440DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000441C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000442FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000443A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000444BC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100044648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100045034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000450B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004528C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100045414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000459A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100046710(uint64_t a1, uint64_t a2)
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
      uint64_t v17 = PBReaderReadData();
      uint64_t v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
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

void sub_100046C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100046C94()
{
  v9[1] = (id)1;
  [0 UTF8String];
  [@"systemgroup.com.apple.nsurlstoragedresources" UTF8String];
  v0 = (void *)container_system_group_path_for_identifier();
  if (v0)
  {
    uint64_t v1 = +[NSURL fileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    free(v0);
    if (v1)
    {
      uint64_t v2 = [v1 URLByAppendingPathComponent:@"Library" isDirectory:1];
      uint64_t v3 = +[NSFileManager defaultManager];
      v9[0] = 0;
      unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:v9];
      id v5 = v9[0];

      if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v5 code];
        *(_DWORD *)buf = 138412802;
        CFStringRef v11 = v2;
        __int16 v12 = 2112;
        id v13 = v5;
        __int16 v14 = 2048;
        id v15 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
      }
      id v6 = [(__CFString *)v2 URLByAppendingPathComponent:@"dafsaData.bin" isDirectory:0];

      goto LABEL_12;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = @"systemgroup.com.apple.nsurlstoragedresources";
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Error getting the system group container for Group ID %@ ", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get the system container for nsurlstoraged", buf, 2u);
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

void sub_100046F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000472C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000472F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      uint64_t v7 = a2;
      uint64_t v3 = "Asset download failed. Result  %ld";
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) queryAndFindBestAsset:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(int *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      uint64_t v3 = "Asset download completed. Asset Version downloaded is %lu";
      goto LABEL_7;
    }
  }
}

void sub_100047928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1000479EC(uint64_t a1, uint64_t a2)
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      int v6 = "Failed to purge the asset with version %@. Purge result = %ld";
      uint32_t v7 = 22;
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, v7);
    }
  }
  else if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    int v6 = "Asset version %@ purged";
    uint32_t v7 = 12;
    goto LABEL_7;
  }
}

void sub_100047C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047C8C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Catalogue fetch failed with result %ld. Fall back to the currently installed asset", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Catalogue fetch succeeded", (uint8_t *)&v7, 2u);
    }
    id v4 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.TopLevelDomainDafsa"];
    [v4 returnTypes:2];
    [v4 queryMetaDataSync];
    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = [v4 results];
    [v5 findBestAssetFrom:v6 skipDownload:*(unsigned __int8 *)(a1 + 40)];
  }
}

void sub_100047DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047F44(id a1)
{
  uint64_t v1 = objc_alloc_init(TLDMobileAssetManager);
  uint64_t v2 = (void *)qword_1000CB0B0;
  qword_1000CB0B0 = (uint64_t)v1;

  uint64_t v3 = dispatch_get_global_queue(17, 0);
  dispatch_async(v3, &stru_1000B5900);
}

void sub_100047FB0(id a1)
{
}

void sub_10004818C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      int v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 *(SEL *)(a1 + 40):*(void *)(a1 + 32):*(unsigned int *)(a1 + 48):(void)v8];
        }
        int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_1000482C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100048370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1000484D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004852C(uint64_t a1)
{
  id v2 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  [v2 launchProcessWithIdentifier:*(void *)(a1 + 32) sessionIdentifier:*(void *)(a1 + 40)];
}

void sub_100048584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100048618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000486D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000487CC(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_100048954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048B18(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_100048BCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_100048DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id sub_10004913C(uint64_t a1)
{
  id v2 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = 64800;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Application %@ has been in background for %lu seconds. Will reevaluate discretionary downloads", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setIsInTransitionalDiscretionaryPeriod:0];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)NDSpringBoardApplication;
  return [super invokeSelectorForAllObservers:@"applicationEndedTransitionalDiscretionaryBackgroundPeriod:"];
}

void sub_100049308(_Unwind_Exception *a1)
{
  id v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100049380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000493D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004952C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049550(uint64_t a1)
{
  [*(id *)(a1 + 32) currentRequestDelay];
  id v2 = *(void **)(a1 + 32);
  if (v3 == 0.0)
  {
    double v4 = 60.0;
  }
  else
  {
    [v2 currentRequestDelay];
    double v6 = v5 + v5;
    double v4 = 3600.0;
    if (v6 <= 3600.0)
    {
      [*(id *)(a1 + 32) currentRequestDelay];
      double v4 = v7 + v7;
    }
    id v2 = *(void **)(a1 + 32);
  }
  [v2 setCurrentRequestDelay:v4];
  __int16 v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[1];
    [v9 currentRequestDelay];
    int v18 = 138412546;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set request delay for %@ to %f", (uint8_t *)&v18, 0x16u);
  }

  id v13 = *(void **)(a1 + 32);
  uint64_t v12 = a1 + 32;
  [v13 setupDelayTimer];
  __int16 v14 = *(void **)v12;
  id v15 = *(NSObject **)(*(void *)v12 + 40);
  [v14 currentRequestDelay];
  dispatch_time_t v17 = dispatch_time(0x8000000000000000, (uint64_t)((v16 + v16) * 1000000000.0));
  dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_1000496B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000497B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_resetRequestDelay];
}

void sub_1000498B4(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000498F8(id a1)
{
  double v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.nsurlsessiond.NDSpringBoardApplication.request-delay-queue", v1);
  double v3 = (void *)qword_1000CB0D8;
  qword_1000CB0D8 = (uint64_t)v2;
}

void sub_100049A44(_Unwind_Exception *a1)
{
  double v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100049B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049D4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_100049E00(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_100049FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A144(_Unwind_Exception *a1)
{
  double v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004A28C(_Unwind_Exception *a1)
{
  double v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004A474(_Unwind_Exception *a1)
{
  double v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

id sub_10004A4AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_resetRequestDelay];
}

void sub_10004A528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A678(uint64_t a1)
{
  [*(id *)(a1 + 32) currentRequestDelay];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  if (v3 == 0.0)
  {
    double v4 = 60.0;
  }
  else
  {
    [v2 currentRequestDelay];
    double v6 = v5 + v5;
    double v4 = 3600.0;
    if (v6 <= 3600.0)
    {
      [*(id *)(a1 + 32) currentRequestDelay];
      double v4 = v7 + v7;
    }
    dispatch_queue_t v2 = *(void **)(a1 + 32);
  }
  [v2 setCurrentRequestDelay:v4];
  __int16 v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[1];
    [v9 currentRequestDelay];
    int v18 = 138412546;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set request delay for %@ to %f", (uint8_t *)&v18, 0x16u);
  }

  id v13 = *(void **)(a1 + 32);
  uint64_t v12 = a1 + 32;
  [v13 setupDelayTimer];
  __int16 v14 = *(void **)v12;
  id v15 = *(NSObject **)(*(void *)v12 + 40);
  [v14 currentRequestDelay];
  dispatch_time_t v17 = dispatch_time(0x8000000000000000, (uint64_t)((v16 + v16) * 1000000000.0));
  dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_10004A7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004A9BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_resetRequestDelay];
}

void sub_10004AA18(id a1)
{
  double v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.nsurlsessiond.NDExtension.request-delay-queue", v1);
  double v3 = (void *)qword_1000CB0E8;
  qword_1000CB0E8 = (uint64_t)v2;
}

void sub_10004AAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004ABE0(_Unwind_Exception *a1)
{
  double v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004AC40(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionary];
  dispatch_queue_t v2 = (void *)qword_1000CB0B8;
  qword_1000CB0B8 = v1;

  uint64_t v3 = +[NSMutableDictionary dictionary];
  double v4 = (void *)qword_1000CB0C0;
  qword_1000CB0C0 = v3;

  uint64_t v5 = +[NSMutableDictionary dictionary];
  double v6 = (void *)qword_1000CB0C8;
  qword_1000CB0C8 = v5;
}

uint64_t sub_10004C0E4(uint64_t a1, uint64_t a2)
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
      uint64_t v17 = PBReaderReadData();
      int v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
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

uint64_t sub_10004C878(uint64_t a1, uint64_t a2)
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
      uint64_t v17 = PBReaderReadData();
      int v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
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

void sub_10004D69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004D71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004D9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004DA18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  unint64_t v7 = [v5 host];
  if ([v7 hasPrefix:@"__com.apple.CFNetwork.prefix__"])
  {
    *((unsigned char *)v23 + 24) = 1;
    char v8 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004DC88;
    v19[3] = &unk_1000B59E8;
    id v20 = v7;
    uint64_t v21 = &v22;
    [v8 enumerateObjectsUsingBlock:v19];
  }
  if (*((unsigned char *)v23 + 24))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v9 = [v6 allValues];
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v14 = +[NSURLCredentialStorage sharedCredentialStorage];
          [v14 removeCredential:v13 forProtectionSpace:v5];
        }
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
      }
      while (v10);
    }
  }
  _Block_object_dispose(&v22, 8);
}

void sub_10004DC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, ...)
{
  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004DC88(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id result = [*(id *)(a1 + 32) hasSuffix:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void sub_10004DD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004DEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004E080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E218(id a1)
{
  uint64_t v1 = objc_opt_new();
  dispatch_queue_t v2 = (void *)qword_1000CB100;
  qword_1000CB100 = v1;

  if (+[NDUserSyncStakeholder EDUMode])
  {
    id v3 = +[UMUserManager sharedManager];
    [v3 registerUserSyncStakeholder:qword_1000CB100 withMachServiceName:@"com.apple.nsurlsessiond.usermanager.sync"];
  }
}

void sub_10004E2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10004F634(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 removeAllObjects];
}

void sub_10004F79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F7C0(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:forKeyedSubscript:];
  }
  id v3 = *(void **)(a1 + 48);
  if (v3 && ([v3 user], char v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v10 = [*(id *)(a1 + 48) user];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:forKeyedSubscript:];

    uint64_t v5 = *(void *)(a1 + 48);
    id v11 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v6 = [*(id *)(a1 + 48) user];
    [v11 setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    char v8 = *(void **)(*(void *)(a1 + 32) + 24);
    [v8 removeObjectForKey:v7];
  }
}

void sub_10004F910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_10004FCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004FD78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005006C;
  block[3] = &unk_1000B60C0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_sync(v5, block);
}

void sub_10004FE3C(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 48) user];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:forKeyedSubscript:];

  dispatch_queue_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    id v6 = +[NSMutableDictionary dictionary];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:forKeyedSubscript:];
  }
  uint64_t v3 = *(void *)(a1 + 48);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(a1 + 48) user];
  [v7 setObject:v3 forKeyedSubscript:v4];
}

void sub_10004FF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10004FF68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004FF78(uint64_t a1)
{
}

void sub_10004FF80(void *a1)
{
  id v6 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  dispatch_queue_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if (v2) {
    BOOL v3 = v6 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = !v3;
  if (v3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v2 objectForKeyedSubscript:v6];
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  if (v4) {
}
  }

void sub_10005004C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005006C(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  if (v2 && ([v2 user], BOOL v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    id v9 = [*(id *)(a1 + 32) user];
    [*(id *)(*(void *)(a1 + 40) + 24) setObject:forKeyedSubscript:];

    int v4 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)];

    if (!v4)
    {
      id v10 = +[NSMutableDictionary dictionary];
      [*(id *)(*(void *)(a1 + 40) + 16) setObject:forKeyedSubscript:];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v6 = [*(id *)(a1 + 32) user];
    [v11 setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(*(void *)(a1 + 40) + 24);
    [v8 removeObjectForKey:v7];
  }
}

void sub_1000501BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000501E8(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  BOOL v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining the default credential: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000503A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000503CC(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  dispatch_queue_t v2 = [*(id *)(a1 + 48) user];
  [v3 removeObjectForKey:v2];
}

void sub_100050444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005059C(void *a1)
{
  dispatch_queue_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    id v5 = +[NSMutableDictionary dictionary];
    [*(id *)(a1[4] + 16) setObject:forKeyedSubscript:];
  }
  uint64_t v3 = a1[6];
  if (v3)
  {
    id v6 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
    int v4 = [(id)a1[6] user];
    [v6 setObject:v3 forKeyedSubscript:v4];
  }
}

void sub_100050684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100050868(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005096C;
  v7[3] = &unk_1000B63D0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, v7);
}

void sub_10005090C(uint64_t a1)
{
  uint64_t v2 = +[NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10005096C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v3 addEntriesFromDictionary:v2];
}

void sub_1000509B8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining all credentials %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100050C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100050C70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050D8C;
  block[3] = &unk_1000B60C0;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_sync(v5, block);
}

void sub_100050D34(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100050D8C(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:forKeyedSubscript:];
}

void sub_100050DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050E0C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining a credential: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100052104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100052170(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = [v3 continueLoad];
  id v6 = [v7 _actualAuthHeaders];
  (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v5, v6, 0);
}

void sub_100052204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000523F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100052614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000527E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100052DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_100052EF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) currentRequest];
    id v8 = [v7 URL];
    id v9 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v8];

    [*(id *)(a1 + 32) _nsurlsessionproxy_cancelWithError:v9];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 16) _requiresSustainedDataDelivery])
  {
    id v10 = *(void **)(*(void *)(a1 + 40) + 72);
    id v11 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    char v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v14 = [*(id *)(a1 + 48) length];
    unint64_t v15 = v13 - v14;
    if (v13 == v14)
    {
      long long v16 = 0;
    }
    else
    {
      long long v16 = +[NSNumber numberWithUnsignedInteger:v15];
    }
    long long v17 = *(void **)(*(void *)(a1 + 40) + 72);
    long long v18 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v17 setObject:v16 forKeyedSubscript:v18];

    if (v13 != v14) {
    uint64_t v19 = (id)qword_1000CB110;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v28 = 138543618;
      id v29 = v20;
      __int16 v30 = 2048;
      unint64_t v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ data acknowledged, now has %lu bytes pending acknowledgement", (uint8_t *)&v28, 0x16u);
    }
    if (!(v15 >> 19))
    {
      uint64_t v21 = *(void **)(*(void *)(a1 + 40) + 80);
      uint64_t v22 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      long long v23 = [v21 objectForKeyedSubscript:v22];

      if (v23)
      {
        uint64_t v24 = (id)qword_1000CB110;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          char v25 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
          int v28 = 138543362;
          id v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ acknowledging pending data", (uint8_t *)&v28, 0xCu);
        }
        long long v26 = *(void **)(*(void *)(a1 + 40) + 80);
        long long v27 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
        [v26 setObject:0 forKeyedSubscript:v27];

        v23[2](v23);
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10005321C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100053614(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) currentRequest];
    id v8 = [v7 URL];
    id v9 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v8];

    [*(id *)(a1 + 32) _nsurlsessionproxy_cancelWithError:v9];
  }
  id v10 = v5;
  unsigned int v11 = [v10 disposition];
  char v12 = (id)qword_1000CB110;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)];
    int v14 = 138543618;
    unint64_t v15 = v13;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received response disposition: %d", (uint8_t *)&v14, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000537A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100053B28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) currentRequest];
    id v8 = [v7 URL];
    id v9 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v8];

    [*(id *)(a1 + 32) _nsurlsessionproxy_cancelWithError:v9];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v10 = v5;
    unsigned int v11 = [v10 request];
    char v12 = [v11 _actualRequest];

    uint64_t v13 = (id)qword_1000CB110;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [*(id *)(a1 + 48) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v15 = 138543618;
      __int16 v16 = v14;
      __int16 v17 = 2112;
      long long v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to redirect with request %@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (!v12) {
      [*(id *)(a1 + 32) cancel];
    }
  }
}

void sub_100053CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000545D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100054834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054C64(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _nsurlsessionproxy_clearError];
  id v6 = v5;
  if (![v6 hasRequest])
  {
    id v8 = 0;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v7 = [v6 request];
  id v8 = [v7 _actualRequest];

  if (v8)
  {
    if ([*(id *)(a1 + 40) shouldRetainInfraWiFi]) {
      [*(id *)(a1 + 40) retainInfraWiFiForTaskWithIdentifier:*(void *)(a1 + 56)];
    }
    if ([*(id *)(a1 + 40) shouldRetainBTLinkAssertion]) {
      [*(id *)(a1 + 40) retainBTLinkAssertionWithIdentifier:*(void *)(a1 + 56)];
    }
  }
  if (a3)
  {
LABEL_10:
    id v9 = [*(id *)(a1 + 32) currentRequest];
    id v10 = [v9 URL];
    unsigned int v11 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v10];

    [*(id *)(a1 + 32) _nsurlsessionproxy_cancelWithError:v11];
  }
LABEL_11:
  if ([v6 hasBodyStream])
  {
    id v24 = 0;
    id v25 = 0;
    +[NSStream getBoundStreamsWithBufferSize:0x20000 inputStream:&v25 outputStream:&v24];
    id v12 = v25;
    id v13 = v24;
    int v14 = *(void **)(*(void *)(a1 + 40) + 48);
    int v15 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v14 setObject:v13 forKeyedSubscript:v15];

    [v13 open];
    id v16 = [v8 mutableCopy];
    [v16 setHTTPBodyStream:v12];

    id v8 = v16;
  }
  else
  {
    __int16 v17 = *(void **)(*(void *)(a1 + 40) + 56);
    long long v18 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    if (v19)
    {
      id v20 = [v8 mutableCopy];
      uint64_t v21 = *(void **)(*(void *)(a1 + 40) + 56);
      uint64_t v22 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
      long long v23 = [v21 objectForKeyedSubscript:v22];
      [v20 setHTTPBodyStream:v23];

      id v8 = v20;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100054EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000551E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055260(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if ([v10 hasDisposition])
  {
    [v10 disposition];
    if ([v10 hasCredential])
    {
      id v5 = [v10 credential];
      id v6 = [v5 _actualCredential];
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (a3)
    {
      id v7 = [*(id *)(a1 + 32) currentRequest];
      id v8 = [v7 URL];
      id v9 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v8];

      [*(id *)(a1 + 32) _nsurlsessionproxy_cancelWithError:v9];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000553A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000554B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100055730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000558C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100055908(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000559FC;
  block[3] = &unk_1000B5CB8;
  id v14 = v7;
  id v15 = v6;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = *(id *)(a1 + 48);
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, block);
}

void sub_1000559FC(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (id)qword_1000CB110;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = [v3 code];
      uint64_t v5 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      id v13 = v3;
      __int16 v14 = 2048;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received error %@ [%ld] reading from streamTask %@", buf, 0x20u);
    }

    id v7 = *(void **)(a1 + 64);
    id v6 = (id *)(a1 + 64);
    [v7 closeRead];
    [*v6 closeWrite];
    [*v6 cancel];
  }
  else if ([*(id *)(a1 + 40) length])
  {
    id v8 = [*(id *)(a1 + 40) _createDispatchData];
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 64);
    tcp_connection_write();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    _tcp_connection_write_eof(v9);
  }
}

void sub_100055BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_100055C08(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v7[0] = 67109376;
      v7[1] = a2;
      __int16 v8 = 2048;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received error %d writing to tcp_connection %p", (uint8_t *)v7, 0x12u);
    }
  }
  return [*(id *)(a1 + 40) performForwardingFromStreamTask:*(void *)(a1 + 48) toTCPConnection:*(void *)(a1 + 32)];
}

void sub_100055DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100055DC4(uint64_t a1, void *a2, int a3)
{
  uint64_t v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109376;
      int v19 = a3;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received error %d reading from tcp_connection %p", buf, 0x12u);
    }
    goto LABEL_6;
  }
  if (!dispatch_data_get_size(v5))
  {
LABEL_6:
    [*(id *)(a1 + 32) closeRead];
    [*(id *)(a1 + 32) closeWrite];
    [*(id *)(a1 + 32) cancel];
    goto LABEL_7;
  }
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v9 _taskGroup];
  id v11 = [v10 _groupConfiguration];
  [v11 timeoutIntervalForRequest];
  double v13 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100055FC8;
  v15[3] = &unk_1000B5C40;
  __int16 v14 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  id v16 = v14;
  id v17 = *(id *)(a1 + 32);
  [v9 writeData:v6 timeout:v15 completionHandler:v13];

LABEL_7:
}

void sub_100055F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100055FC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 144);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056074;
  block[3] = &unk_1000B60C0;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

id sub_100056074(uint64_t a1)
{
  return [*(id *)(a1 + 32) performForwardingFromTCPConnection:*(void *)(a1 + 40) toStreamTask:*(void *)(a1 + 48)];
}

void sub_100056358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000563FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005640C(uint64_t a1)
{
}

void sub_100056414(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    id v6 = [*(id *)(a1 + 40) host];
    id v7 = [v5 streamTaskWithHostName:v6 port:[*(id *)(a1 + 40) port]];

    [v7 resume];
    uint64_t v8 = (void *)tcp_connection_create_with_connected_fd();
    tcp_connection_allow_client_socket_access();
    id v10 = v8;
    id v11 = v7;
    tcp_connection_set_event_handler();
    tcp_connection_start();
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:v11];
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:v10 forKeyedSubscript:v11];
    id v9 = objc_retainBlock(*(id *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v9 forKeyedSubscript:v11];
  }
}

void sub_1000565A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000565F8(uint64_t a1, unsigned int a2)
{
  id v4 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218240;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received tcp_connection (%p) event %lu", (uint8_t *)&v6, 0x16u);
  }
  if (a2 == 3)
  {
    [*(id *)(a1 + 48) closeRead];
    [*(id *)(a1 + 48) closeWrite];
    [*(id *)(a1 + 48) cancel];
    tcp_connection_cancel();
  }
  else if (a2 == 1)
  {
    [*(id *)(a1 + 40) performForwardingFromTCPConnection:*(void *)(a1 + 32) toStreamTask:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) performForwardingFromStreamTask:*(void *)(a1 + 48) toTCPConnection:*(void *)(a1 + 32)];
  }
}

void sub_1000568A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000568EC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) bodyData];
  if ([v3 length])
  {
    id v4 = v3;
    uint64_t v5 = (char *)[v4 bytes];
    int v6 = (char *)[v4 length];
    if (v6)
    {
      unint64_t v8 = 0;
      *(void *)&long long v7 = 138544130;
      long long v20 = v7;
      do
      {
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "streamStatus", v20) > 4) {
          break;
        }
        uint64_t v9 = (uint64_t)[*(id *)(a1 + 40) write:&v5[v8] maxLength:&v6[-v8]];
        int v10 = v9;
        if (v9 < 1)
        {
          id v11 = (id)qword_1000CB110;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            id v21 = [*(id *)(a1 + 48) descriptionForTaskWithIdentifier:*(void *)(a1 + 80)];
            id v17 = [*(id *)(a1 + 40) streamError];
            id v18 = [*(id *)(a1 + 40) streamError];
            id v19 = [v18 code];
            *(_DWORD *)buf = v20;
            id v23 = v21;
            __int16 v24 = 1024;
            int v25 = v10;
            __int16 v26 = 2112;
            id v27 = v17;
            __int16 v28 = 2048;
            id v29 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ writing to stream returned %d, error %@ [%ld]", buf, 0x26u);
          }
          [*(id *)(a1 + 40) close];
          double v12 = [*(id *)(a1 + 40) streamError];
          double v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            id v15 = [*(id *)(a1 + 56) currentRequest];
            id v16 = [v15 URL];
            id v14 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-1017 URL:v16];
          }
          [*(id *)(a1 + 56) _nsurlsessionproxy_cancelWithError:v14];
        }
        else
        {
          v8 += v9;
        }
      }
      while (v8 < (unint64_t)v6);
    }
  }
  else
  {
    [*(id *)(a1 + 40) close];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_100056B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100056DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000571C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000574A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100058130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000581C4(uint64_t a1)
{
  uint64_t v2 = +[PDURLSessionProxyServerService sharedService];
  unsigned int v3 = [v2 isConnected];

  if (v3 && [*(id *)(*(void *)(a1 + 32) + 136) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 resendPendingMessage:v5];
  }
}

void sub_100058250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000585E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005865C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100058844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005894C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100058A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100058BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100058C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100058E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100058F58(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
  long long v7 = [v5 _uniqueIdentifier];
  id v8 = [v6 initWithDataTask:v5 uniqueIdentifier:v7 bundleID:0 sessionID:*(void *)(a1 + 32)];

  [v8 setCountOfBytesSent:[v5 countOfBytesSent]];
  [v8 setCountOfBytesReceived:[v5 countOfBytesReceived]];
  [v8 setCountOfBytesExpectedToSend:[v5 countOfBytesExpectedToSend]];
  [v8 setCountOfBytesExpectedToReceive:[v5 countOfBytesExpectedToReceive]];
  [v8 set_doesSZExtractorConsumeExtractedData:[v5 _doesSZExtractorConsumeExtractedData]];
  [v8 set_hasSZExtractor:[v5 _hasSZExtractor]];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
}

void sub_100059080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000594EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059574(id a1)
{
  id v2 = +[_DASScheduler sharedScheduler];
  uint64_t v1 = +[_DASActivityGroup groupWithName:@"com.apple.nsurlsessiond.NSURLSessionProxyPool" maxConcurrent:2];
  [v2 createActivityGroup:v1];
}

void sub_1000595F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005AB80(uint64_t a1, uint64_t a2)
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
      char v13 = 0;
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      *(unsigned char *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0) {
          goto LABEL_32;
        }
        v13 += 7;
        BOOL v9 = v14++ >= 9;
        if (v9)
        {
          uint64_t v15 = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v15 = 0;
      }
LABEL_34:
      *(void *)(a1 + 8) = v15;
    }
    else if ((v6 >> 3) == 1)
    {
      double v12 = objc_alloc_init(PDURLSessionProxySessionMessage);
      objc_storeStrong((id *)(a1 + 16), v12);
      if (!PBReaderPlaceMark() || (sub_10006494C((uint64_t)v12, a2) & 1) == 0)
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

void sub_10005B10C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 98)
    && [*(id *)(v1 + 16) startedUserInitiated]
    && (sub_10000FAA8(*(void **)(*(void *)(a1 + 32) + 8)) & 1) == 0)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:9];
    [*(id *)(*(void *)(a1 + 32) + 8) cancel_with_error:];
  }
}

void sub_10005B1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005B238(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 98) && *(unsigned char *)(v2 + 100))
  {
    [(id)v2 startThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v2 + 120);
  char v4 = *(void **)(v2 + 80);
  unsigned int v5 = *(void **)(v2 + 8);

  sub_10000F9CC(v5, v3, v4);
}

void sub_10005B308(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 98))
  {
    [(id)v2 stopThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v2 + 98)) {
      goto LABEL_6;
    }
  }
  if (*(unsigned char *)(v2 + 99)) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(v2 + 97))
  {
    *(void *)(v2 + 120) = 300;
    *(unsigned char *)(*(void *)(a1 + 32) + 98) = 0;
    [*(id *)(a1 + 32) stopThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
LABEL_6:
    id v3 = *(void **)(v2 + 120);
    char v4 = *(void **)(v2 + 80);
    unsigned int v5 = *(void **)(v2 + 8);
    sub_10000F9CC(v5, v3, v4);
    return;
  }
  id v6 = [*(id *)(v2 + 8) error:@"_nsurlsessiondErrorDomain" code:6];
  [*(id *)(*(void *)(a1 + 32) + 8) cancel_with_error:];
}

void sub_10005B3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005B494(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 98))
  {
    id v3 = *(void **)(v1 + 24);
    id v4 = [*(id *)(a1 + 40) bundleIdentifier];
    LODWORD(v3) = [v3 isEqualToString:];

    if (v3)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:2];
      [*(id *)(*(void *)(a1 + 32) + 8) cancel_with_error:];
    }
  }
}

void sub_10005B54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005B5FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) bundleIdentifier];
  LODWORD(v2) = [v2 isEqualToString:];

  if (v2)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:1];
    [*(id *)(*(void *)(a1 + 32) + 8) cancel_with_error:];
  }
}

void sub_10005B6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005B74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005B888(_Unwind_Exception *exception_object)
{
}

id sub_10005B8A0(uint64_t a1)
{
  int v2 = IOPSDrawingUnlimitedPower();
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 stopThroughputMonitoring];
  }
  else
  {
    return [v3 startThroughputMonitoring];
  }
}

void sub_10005B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005BC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BD3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 72);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 48));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;
  }
  else
  {
    *(void *)(v2 + 72) = v3 + 1;
    id v4 = *(void **)(a1 + 32);
    [v4 setThroughputTimerForCurrentInterval];
  }
}

void sub_10005BFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005C2B8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, unsigned __int8 a10, unsigned __int8 a11, char a12, char a13, void *a14)
{
  id v21 = a2;
  id v74 = a3;
  id v71 = a4;
  id v72 = a5;
  id v22 = a6;
  id v70 = a9;
  id v73 = a14;
  if (!v21
    || !v74
    || !v22
    || ([v22 uniqueIdentifier], id v23 = objc_claimAutoreleasedReturnValue(),
                                               v23,
                                               !v23))
  {
    __int16 v28 = (id)qword_1000CB148;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [v22 _loggableDescription];
      __int16 v30 = [v22 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v76 = v29;
      __int16 v77 = 2112;
      id v78 = v22;
      __int16 v79 = 2112;
      id v80 = v74;
      __int16 v81 = 2112;
      id v82 = v21;
      __int16 v83 = 2112;
      v84 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ tried to log a bad event to powerlog -- taskInfo %@, sessionID %@, bundleID %@, taskInfo.uniqueIdentifier: %@", buf, 0x34u);
    }
    goto LABEL_33;
  }
  if (PLShouldLogRegisteredEvent())
  {
    v85[0] = @"state";
    v86[0] = +[NSNumber numberWithUnsignedInteger:a1];
    v85[1] = @"taskUUID";
    v68 = (void *)v86[0];
    __int16 v24 = [v22 uniqueIdentifier];
    int v25 = [v24 UUIDString];
    v86[1] = v25;
    v85[2] = @"taskKind";
    unint64_t v26 = (unint64_t)[v22 taskKind];
    if (v26 > 5) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = qword_100091BD8[v26];
    }
    unint64_t v31 = +[NSNumber numberWithUnsignedInteger:v27];
    v86[2] = v31;
    v85[3] = @"bundleID";
    uint64_t v32 = +[NSString stringWithFormat:@"%@:[%@:%@]", v21, v71, v72];
    v86[3] = v32;
    v86[4] = v74;
    v85[4] = @"sessionID";
    v85[5] = @"taskID";
    uint64_t v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 identifier]);
    v86[5] = v33;
    v69 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:6];

    id v34 = [v69 mutableCopy];
    uint64_t v35 = +[NSMutableArray arrayWithObjects:@"state", @"taskUUID", @"taskKind", @"bundleID", @"sessionID", @"taskID", 0];
    if (!a12) {
      goto LABEL_32;
    }
    unint64_t v36 = +[NSNumber numberWithLongLong:a7];
    [v34 setObject:v36 forKeyedSubscript:@"bytesSent"];

    id v37 = +[NSNumber numberWithLongLong:a8];
    [v34 setObject:v37 forKeyedSubscript:@"bytesReceived"];

    if (a13)
    {
      [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:@"willRetry"];
      uint64_t v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 retryCount]);
      [v34 setObject:v38 forKeyedSubscript:@"previousFailureCount"];
    }
    [v35 addObject:@"bytesSent"];
    [v35 addObject:@"bytesReceived"];
    if (a13)
    {
      [v35 addObject:@"willRetry"];
      [v35 addObject:@"previousFailureCount"];
    }
    if (v70)
    {
      [v34 setObject:v70 forKeyedSubscript:@"interfaceName"];
      [v35 addObject:@"interfaceName"];
    }
    id v39 = +[NSNumber numberWithBool:a10];
    [v34 setObject:v39 forKeyedSubscript:@"isDiscretionary"];

    [v35 addObject:@"isDiscretionary"];
    id v40 = +[NSNumber numberWithBool:a11];
    [v34 setObject:v40 forKeyedSubscript:@"isDataBudgetingEnabled"];

    [v35 addObject:@"isDataBudgetingEnabled"];
    if (!v73) {
      goto LABEL_32;
    }
    id v41 = [v73 domain];
    if ([v41 isEqualToString:NSURLErrorDomain])
    {
      BOOL v42 = [v73 code] == (id)-999;

      if (v42)
      {
        [v34 setObject:&off_1000B8A58 forKeyedSubscript:@"state"];
LABEL_32:
        PLLogRegisteredEvent();

        __int16 v28 = v69;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
    }
    [v34 setObject:&off_1000B8A70 forKeyedSubscript:@"state"];
    long long v43 = +[NSMutableDictionary dictionary];
    long long v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v73 code]);
    [v43 setObject:v44 forKeyedSubscript:@"errorCode"];

    uint64_t v45 = [v73 domain];
    [v43 setObject:v45 forKeyedSubscript:@"errorDomain"];

    id v46 = [v73 userInfo];
    uint64_t v47 = _kCFStreamErrorCodeKey;
    id v48 = [v46 objectForKeyedSubscript:_kCFStreamErrorCodeKey];
    LOBYTE(v45) = v48 == 0;

    if ((v45 & 1) == 0)
    {
      id v49 = [v73 userInfo];
      char v50 = [v49 objectForKeyedSubscript:v47];
      [v43 setObject:v50 forKeyedSubscript:@"errorCFStreamErrorCode"];
    }
    long long v51 = [v73 userInfo];
    uint64_t v52 = _kCFStreamErrorDomainKey;
    __int16 v53 = [v51 objectForKeyedSubscript:_kCFStreamErrorDomainKey];
    BOOL v54 = v53 == 0;

    if (!v54)
    {
      __int16 v55 = [v73 userInfo];
      id v56 = [v55 objectForKeyedSubscript:v52];
      [v43 setObject:v56 forKeyedSubscript:@"errorCFStreamErrorDomain"];
    }
    __int16 v57 = [v73 userInfo];
    id v58 = [v57 objectForKeyedSubscript:@"_NSURLErrorFailingURLSessionTaskErrorKey"];
    BOOL v59 = v58 == 0;

    if (!v59)
    {
      long long v60 = [v73 userInfo];
      long long v61 = [v60 objectForKeyedSubscript:@"_NSURLErrorFailingURLSessionTaskErrorKey"];
      [v43 setObject:v61 forKeyedSubscript:@"errorFailingURLSessionTask"];
    }
    long long v62 = [v73 userInfo];
    long long v63 = [v62 objectForKeyedSubscript:NSURLErrorFailingURLErrorKey];
    BOOL v64 = v63 == 0;

    if (!v64)
    {
      long long v65 = [v73 userInfo];
      long long v66 = [v65 objectForKeyedSubscript:NSURLErrorFailingURLErrorKey];
      [v43 setObject:v66 forKeyedSubscript:@"errorFailingURL"];
    }
    [v34 addEntriesFromDictionary:v43];
    v67 = [v43 allKeys];
    [v35 addObjectsFromArray:v67];

    goto LABEL_32;
  }
LABEL_34:
}

void sub_10005CB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10005CD1C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, char a8)
{
  id v39 = a2;
  id v38 = a3;
  id v15 = a4;
  id v37 = a5;
  id v16 = a6;
  id v36 = a7;
  id v40 = v16;
  uint64_t v35 = v15;
  char v17 = [v16 _metrics];
  uint64_t v34 = a1;
  id v18 = [v17 _daemon_currentTransactionMetrics];

  id v19 = [v18 _daemon_connectionMetrics];
  uint64_t v20 = [v40 _sourceApplicationBundleIdentifierForMobileAsset];
  id v21 = (void *)v20;
  char v33 = a8;
  if (v20) {
    id v22 = (id)v20;
  }
  else {
    id v22 = v15;
  }
  uint64_t v32 = v22;
  id v31 = [v18 _daemon_requestHeaderSize];
  id v30 = [v18 _daemon_requestBodyTransferSize];
  id v23 = [v18 _daemon_responseHeaderSize];
  id v24 = [v18 _daemon_responseBodyTransferSize];
  int v25 = [v19 _daemon_interfaceName];
  unsigned __int8 v26 = [v19 _daemon_isDiscretionary];
  unsigned __int8 v27 = [v19 _daemon_isDataBudgetingEnabled];
  id v28 = [v40 state];
  id v29 = [v40 error];
  sub_10005C2B8(v34, v39, v38, v32, v37, v36, (uint64_t)v31 + (void)v30, (uint64_t)v23 + (void)v24, v25, v26, v27, v28 == (id)3, v33, v29);
}

void sub_10005CF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,id a21)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005DCA4(uint64_t a1, uint64_t a2)
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
        *(unsigned char *)(a1 + 36) |= 2u;
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
        *(_DWORD *)(a1 + 32) = v14;
        continue;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_36;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        break;
      case 4u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
LABEL_36:
        int v25 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

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
      unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
      v22 |= (unint64_t)(v24 & 0x7F) << v20;
      if ((v24 & 0x80) == 0) {
        goto LABEL_42;
      }
      v20 += 7;
      BOOL v9 = v21++ >= 9;
      if (v9)
      {
        uint64_t v22 = 0;
        goto LABEL_44;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v22 = 0;
    }
LABEL_44:
    *(void *)(a1 + 8) = v22;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10005E4CC(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10005E788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10005E7C0(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v2);
  }
  else
  {
    unint64_t v3 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device is locked - waiting", v4, 2u);
    }
  }
}

uint64_t sub_10005E858(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10005E880(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_10005E954(uint64_t a1)
{
  [*(id *)(a1 + 32) bundleIDsForAppProxies:*(void *)(a1 + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v14;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7, v12, (void)v13];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          int v10 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = v7;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bundle %@ uninstalled. Need to obliterate", buf, 0xCu);
          }
          id v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
          [v11 obliterate];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v3);
  }
}

void sub_10005EB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EBC8(uint64_t a1)
{
  [*(id *)(a1 + 32) bundleIDsForAppProxies:*(void *)(a1 + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v14;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7, v12, (void)v13];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          int v10 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = v7;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bundle %@ re-installed. Need to adjust download paths", buf, 0xCu);
          }
          id v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
          [v11 clientApplicationWasReinstalled];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v3);
  }
}

void sub_10005ED74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005F02C(id a1)
{
}

uint64_t sub_10005F0FC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(a1 + 32) archiveState];
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) archivePath];
    +[NDFileUtilities removeItemAtPath:v2];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    long long v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10005F1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005F2F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005F300(uint64_t a1)
{
}

void sub_10005F308(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 getSessionWithIdentifier:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005F378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005F38C(uint64_t a1, int a2)
{
  long long v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = (id)qword_1000CB148;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = [v4 uuid];
      uint64_t v8 = *(void *)(a1 + 40);
      BOOL v9 = [v4 identifier];
      int v13 = 138543874;
      long long v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection interrupted", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (v6)
  {
    int v10 = [v4 uuid];
    uint64_t v11 = *(void *)(a1 + 40);
    long long v12 = [v4 identifier];
    int v13 = 138543874;
    long long v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection invalidated", (uint8_t *)&v13, 0x20u);
  }
  [v4 clientDidDisconnect];
  [*(id *)(a1 + 32) setUserInfo:0];
}

void sub_10005F530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005F568(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10005F57C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005FC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

int64_t sub_10005FD88(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 creationTime];
  BOOL v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 creationTime];
  uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v8 = [v6 compare:v7];

  return (int64_t)v8;
}

void sub_10005FE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006040C(id a1)
{
  uint64_t v1 = objc_alloc_init(Daemon);
  uint64_t v2 = (void *)qword_1000CB120;
  qword_1000CB120 = (uint64_t)v1;
}

void sub_100060C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10006110C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006111C(uint64_t a1)
{
}

void sub_100061124(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100061548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

id sub_1000616B4(uint64_t a1)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_onqueue_releaseAssertionForBundleID:sessionID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_100061814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000618BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100061AE4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = [*(id *)(a1 + 32) isValidAssertion:a3 withName:*(void *)(a1 + 40)];
  if (result)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void sub_100061C30(_Unwind_Exception *a1)
{
  if (v2) {

  }
  _Unwind_Resume(a1);
}

void sub_100061CFC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) monitoredBundleIDsUpdated];
  uint64_t v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
    int v6 = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopped monitoring app %@, now %lu total %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100061E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061EE4(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  [v2 removeObject:a1[6]];

  uint64_t v3 = (id)qword_1000CB148;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:v4];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removed observer for app %@, now %lu observers", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100061FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006207C(uint64_t a1)
{
  uint64_t v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 isAutomaticAppUpdatesAllowed];
  *(unsigned char *)(*(void *)(a1 + 32) + 68) = v3;

  uint64_t v4 = qword_1000CB148;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates are on", buf, 2u);
    }
    int v6 = [*(id *)(a1 + 32) getBackgroundSettingsAppList];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_1000621D8;
    v7[3] = &unk_1000B6058;
    v7[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates were turned off", buf, 2u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) enumerateKeysAndObjectsUsingBlock:&stru_1000B6098];
  }
}

void sub_1000621C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000621D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
  if (v7)
  {
    __int16 v8 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v5];
    unsigned __int8 v9 = [v8 isEqualToNumber:v6];

    if ((v9 & 1) == 0)
    {
      __int16 v10 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v5;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Background update setting for %@ was changed to %@", buf, 0x16u);
      }
      id v11 = [v6 BOOLValue];
      id v12 = +[NSNumber numberWithBool:v11];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v12 forKeyedSubscript:v5];

      int v13 = qword_1000CB148;
      BOOL v14 = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying observers for %@ that background update setting was turned on", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v23 != v17) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * i) applicationBackgroundUpdatesTurnedOn:v5, (void)v22];
            }
            id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v16);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying observers for %@ that background update setting was turned off", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v27;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) applicationBackgroundUpdatesTurnedOff:v5];
            }
            id v19 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v19);
        }
      }
    }
  }
}

void sub_10006250C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062590(id a1, NSString *a2, NSArray *a3, BOOL *a4)
{
  id v5 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a3;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) applicationBackgroundUpdatesTurnedOff:v5 (void)v10];
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void sub_100062698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)NDSpringBoard;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100062928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100062950(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_1000B8AC8];
  [v3 setStateDescriptor:v4];
  [v3 setEvents:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C754;
  v5[3] = &unk_1000B6008;
  id v6 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v5];
}

void sub_100062A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100062A64(uint64_t a1, void *a2)
{
  return _[a2 handleBackgroundSettingsChange];
}

void sub_100062A6C(id a1)
{
  uint64_t v1 = objc_alloc_init(NDSpringBoard);
  uint64_t v2 = (void *)qword_1000CB130;
  qword_1000CB130 = (uint64_t)v1;
}

void sub_100062C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100062D8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueue_removePendingLaunchForBundleID:sessionID:* (void *)(a1 + 40), *(void *)(a1 + 48)];
}

void sub_100063054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000631BC(uint64_t a1)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_onqueue_wakeUpExtension:forSession:withSessionUUID:wakeRequirement:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

id sub_100063268(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

id sub_10006330C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v4 addObject:v3];
  }
  return result;
}

void sub_100063428(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  [v2 removeObject:a1[6]];
}

void sub_100063480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006355C(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    id v3 = +[NSMutableArray array];
    [*(id *)(a1[4] + 24) setObject:forKeyedSubscript:];
  }
  id v4 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  [v4 addObject:a1[6]];
}

void sub_1000635FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100063730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063794(id a1)
{
  if (objc_opt_class())
  {
    uint64_t v1 = objc_alloc_init(NDChronoKitLauncher);
    id v2 = (void *)qword_1000CB138;
    qword_1000CB138 = (uint64_t)v1;
  }
}

unsigned char *sub_1000638E0(uint64_t a1)
{
  id result = *(unsigned char **)(a1 + 32);
  if (!result[65])
  {
    if (result[67]) {
      return [result startThroughputMonitoring];
    }
  }
  return result;
}

void *sub_100063970(uint64_t a1)
{
  id result = *(void **)(a1 + 32);
  if (*((unsigned char *)result + 65)
    || ([result stopThroughputMonitoring], id result = *(void **)(a1 + 32), *((unsigned char *)result + 65)))
  {
    if (!*((unsigned char *)result + 66) && *((unsigned char *)result + 64))
    {
      result[10] = 300;
      *(unsigned char *)(*(void *)(a1 + 32) + 65) = 0;
      id v3 = *(void **)(a1 + 32);
      return [v3 stopThroughputMonitoring];
    }
  }
  return result;
}

void sub_100063A9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 48);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;
  }
  else
  {
    *(void *)(v2 + 48) = v3 + 1;
    id v4 = *(void **)(a1 + 32);
    [v4 setThroughputTimerForCurrentInterval];
  }
}

void sub_100063DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006414C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000642B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006494C(uint64_t a1, uint64_t a2)
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
        uint64_t v13 = 32;
        goto LABEL_37;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 40;
        goto LABEL_37;
      case 3u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
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
                uint64_t v17 = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_41:
        uint64_t v25 = 16;
        goto LABEL_46;
      case 4u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        break;
      case 5u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 24;
LABEL_37:
        long long v24 = *(void **)(a1 + v13);
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
      unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v17 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0) {
        goto LABEL_43;
      }
      v20 += 7;
      BOOL v9 = v21++ >= 9;
      if (v9)
      {
        uint64_t v17 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v17 = 0;
    }
LABEL_45:
    uint64_t v25 = 8;
LABEL_46:
    *(void *)(a1 + v25) = v17;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100066158(uint64_t a1, uint64_t a2)
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
      uint64_t v17 = PBReaderReadData();
      unint64_t v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
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

id sub_10006655C()
{
  v0 = +[SZExtractor knownSZExtractorImplementations];
  uint64_t v1 = [v0 setByAddingObject:objc_opt_class()];

  return v1;
}

void sub_1000665C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_1000665D4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = v4;
  if (v3)
  {
    id v6 = [v4 stringByDeletingLastPathComponent];
    unint64_t v7 = realpath_DARWIN_EXTSN((const char *)[v6 fileSystemRepresentation], 0);

    if (v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      int v10 = sub_100066718;
      long long v11 = &unk_1000B61A0;
      char v12 = v7;
      [v3 auditToken];
      unint64_t v7 = (char *)(sandbox_check_by_audit_token() == 0);
      v10((uint64_t)v9);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void sub_1000666E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066718(uint64_t a1)
{
}

void sub_100066720(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v58 = [v4 objectForKeyedSubscript:@"effectiveConfig"];
  if (v58)
  {
    unsigned int v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = [v3 _loggableDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@ Updating configuration on daemon", buf, 0xCu);
    }
    [v3 _onqueue_adoptEffectiveConfiguration:v58];
  }
  BOOL v59 = [v4 objectForKeyedSubscript:@"StatusCodes"];
  if (v59)
  {
    [v3 initializeHTTPAuthenticatorWithAppleIDContext:0 statusCodes:v59];
    [v3 set_authenticatorConfiguredViaTaskProperty:1];
    id v6 = (id)qword_1000CB148;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = [v3 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized appleIDAuthenticator, status codes = %@", buf, 0x16u);
    }
  }
  char v8 = [v4 objectForKeyedSubscript:@"PublishingURL"];
  [v3 set_backgroundPublishingURL:v8];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"EarliestBeginDate"];
  id v56 = (void *)v9;
  if (v9) {
    [v3 setEarliestBeginDate:v9];
  }
  __int16 v57 = [v4 objectForKeyedSubscript:@"CountOfBytesClientExpectsToSend"];
  if (v57) {
    [v3 setCountOfBytesClientExpectsToSend:[v57 longLongValue]];
  }
  int v10 = [v4 objectForKeyedSubscript:@"CountOfBytesClientExpectsToReceive"];
  long long v11 = v10;
  if (v10) {
    [v3 setCountOfBytesClientExpectsToReceive:[v10 longLongValue]];
  }
  char v12 = [v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"];
  if (v12) {
    [v3 set_pathToDownloadTaskFile:v12];
  }
  unsigned int v13 = [v3 _DuetActivityProperties];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    id v15 = [v3 countOfBytesClientExpectsToSend];
    id v16 = [v3 countOfBytesClientExpectsToReceive];
    int64_t v17 = (int64_t)v16;
    if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown || (uint64_t)v16 > NSURLSessionTransferSizeUnknown)
    {
      unint64_t v18 = [v3 _DuetActivityProperties];
      id v19 = [v18 mutableCopy];

      if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown)
      {
        char v20 = +[NSNumber numberWithLongLong:v15];
        [v19 setObject:v20 forKeyedSubscript:kConditionalConnectionRequirementUploadBytes];
      }
      if (v17 > NSURLSessionTransferSizeUnknown)
      {
        unsigned int v21 = +[NSNumber numberWithLongLong:v17];
        [v19 setObject:v21 forKeyedSubscript:kConditionalConnectionRequirementDownloadBytes];
      }
      [v3 set_DuetActivityProperties:v19];
    }
  }
  unint64_t v22 = [v4 objectForKeyedSubscript:@"SZExtractor"];
  if (v22)
  {
    char v23 = sub_10006655C();
    long long v24 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v23 fromData:v22 error:0];

    if (v24)
    {
      unsigned __int8 v25 = [v3 _extractorPreparedForExtraction];
      long long v26 = (id)qword_1000CB148;
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (v27)
        {
          long long v28 = [v3 _loggableDescription];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - already prepared for extraction while setting additional properties", buf, 0xCu);
        }
      }
      else
      {
        if (v27)
        {
          long long v29 = [v3 _loggableDescription];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - not yet prepared for extraction while setting additional properties", buf, 0xCu);
        }
        long long v26 = dispatch_semaphore_create(0);
        id v30 = [v3 _extractor];
        BOOL v31 = v30 == 0;

        if (!v31)
        {
          uint64_t v32 = (id)qword_1000CB148;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [v3 _loggableDescription];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - terminating lingering extractor from previous download attempt", buf, 0xCu);
          }
          __int16 v34 = [v3 _extractor];
          id v35 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_1000671E8;
          v61[3] = &unk_1000B61C8;
          id v36 = v26;
          long long v62 = v36;
          [v34 terminateStreamWithError:v35 completionBlock:v61];

          dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
          [v3 set_extractor:0];
        }
        if ([v24 conformsToProtocol:&OBJC_PROTOCOL___STExtractor])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v3 set_extractor:v24];
          }
        }
        else
        {
          id v37 = (id)qword_1000CB148;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            __int16 v53 = [v3 _loggableDescription];
            BOOL v54 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v54;
            id v55 = v54;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@ Object does not support STExtractor protocol.  Dropping this object. Class=%@", buf, 0x16u);
          }
        }
      }
    }
  }
  id v38 = [v4 objectForKeyedSubscript:@"TimeoutIntervalForResource"];
  id v39 = v38;
  if (v38)
  {
    [v38 doubleValue];
    [v3 set_timeoutIntervalForResource:];
  }
  id v40 = [v4 objectForKeyedSubscript:@"DisallowCellularDueToSystemPolicy"];
  unsigned int v41 = [v40 BOOLValue];

  if (v41) {
    [v3 set_disallowCellular:1];
  }
  BOOL v42 = [v4 objectForKeyedSubscript:@"nw_activityUUID"];
  long long v43 = v42;
  if (v42)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    [v42 getUUIDBytes:buf];
    long long v44 = (void *)nw_activity_create_from_token();
    [v3 set_nw_activity:v44];

    uint64_t v45 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v60 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "[Telemetry]: Assiging taskMetrics on the daemon side", v60, 2u);
    }
  }
  id v46 = [v4 objectForKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"];
  [v3 set_sourceApplicationBundleIdentifierForMobileAsset:v46];

  uint64_t v47 = [v4 objectForKeyedSubscript:@"preconnect"];
  unsigned int v48 = [v47 isEqual:&__kCFBooleanTrue];

  if (v48) {
    [v3 set_preconnect:1];
  }
  id v49 = [v4 objectForKeyedSubscript:@"cookies"];
  if (v49)
  {
    char v50 = [v3 currentRequest];
    id v51 = [v50 mutableCopy];

    [v51 setValue:v49 forHTTPHeaderField:@"Cookie"];
    [v3 updateCurrentRequest:v51];
  }
}

void sub_100066FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

intptr_t sub_1000671E8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000672E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000673AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100067474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000676D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000677F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000678BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100067D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000690F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069598(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained errorOccurredDuringFinishedCallbackDelivery:v3];
}

void sub_1000695F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100069610(uint64_t a1)
{
  uint64_t v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client acknowledged completion", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) clientAcknowledgedTerminalCallbackForTask:*(void *)(a1 + 56)];
}

void sub_1000696F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100069708(uint64_t a1)
{
  uint64_t v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client acknowledged file download", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_1000697DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000697F4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [WeakRetained errorOccurredDuringAuthCallbackDelivery:v4 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_100069870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100069890(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v16 = 0;
    id v9 = +[SecKeyProxy createIdentityFromEndpoint:v8 error:&v16];
    id v10 = v16;
    if (v9)
    {
      long long v11 = [v7 certificates];
      uint64_t v12 = +[NSURLCredential credentialWithIdentity:certificates:persistence:](NSURLCredential, "credentialWithIdentity:certificates:persistence:", v9, v11, [v7 persistence]);

      id v7 = (id)v12;
      CFRelease(v9);
    }
    else
    {
      unsigned int v13 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to establish client cert proxy: %@", buf, 0xCu);
      }
    }
  }
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    BOOL v14 = (id)qword_1000CB148;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138544130;
      id v18 = v15;
      __int16 v19 = 1024;
      int v20 = a2;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to task challenge with disp %d, cred %@, trustProxy %@", buf, 0x26u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_100069AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100069B04(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_100069B10(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_100069B1C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBeenCalled];
  if ((result & 1) == 0)
  {
    id v3 = (id)qword_1000CB148;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 72)];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for modified request, using original proposed request", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    return [*(id *)(*(void *)(a1 + 56) + 8) removeObject:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_100069C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069C40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v9 = 138543874;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to will send request callback with request %@ handle %@", (uint8_t *)&v9, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_100069D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069DA8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [WeakRetained wakeUpClient:1];
  }
}

void sub_100069E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100069E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v4 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client responded to open file callback with handle %@", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_100069F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069F30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to deliver resolved MediaSelection", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_10006A010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006A034(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_10006A040(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to deliver downloaded HLS variants", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_10006A120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006A144(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_10006A150(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBeenCalled];
  if ((result & 1) == 0)
  {
    id v3 = (id)qword_1000CB148;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v5 = 138543362;
      int v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for delayed request disposition, continuing load", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    return [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_10006A25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A274(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    int v6 = (id)qword_1000CB148;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 1024;
      int v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to delayed request callback with disposition %d", (uint8_t *)&v8, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10006A3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A3C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v4 = (id)qword_1000CB148;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      int v6 = 138543618;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for getAuthHeadersForResponse. Error=%@", (uint8_t *)&v6, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10006A4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A50C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v9 = (id)qword_1000CB148;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)];
      CFStringRef v11 = @"NO";
      int v12 = 138544130;
      __int16 v13 = v10;
      if (a2) {
        CFStringRef v11 = @"YES";
      }
      __int16 v14 = 2112;
      CFStringRef v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to getAuthHeadersForResponse callback with continueLoad=%@, authHeaders=%@, newRequest=%@", (uint8_t *)&v12, 0x2Au);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2);
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10006A674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006B4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006B5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006BC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10006BF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10006CF80(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _URLToUse];
  v84 = [v2 scheme];

  id v3 = [*(id *)(a1 + 32) _URLToUse];
  id v4 = [v3 host];

  id v5 = [*(id *)(a1 + 32) _URLToUse];
  int v6 = [v5 port];

  __int16 v83 = v6;
  if (v6)
  {
    unsigned __int16 v7 = (unsigned __int16)[v6 unsignedIntegerValue];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) _URLToUse];
    id v9 = [v8 scheme];
    unsigned __int16 v7 = sub_10006DEAC(v9);
  }
  id v10 = v84;
  if ([v10 caseInsensitiveCompare:@"http"])
  {
    id v11 = [v10 caseInsensitiveCompare:@"https"];

    if (v11)
    {

      id v4 = @"configuration.apple.com";
      unsigned __int16 v7 = sub_10006DEAC(@"http");
    }
  }
  else
  {
  }
  int v12 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v103 = v4;
    __int16 v104 = 1024;
    LODWORD(v105) = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating tcp_connection to host: %@, port: %d", buf, 0x12u);
  }
  __int16 v13 = v4;
  if ([(__CFString *)v13 UTF8String] && (uint64_t v14 = tcp_connection_create()) != 0)
  {
    CFStringRef v15 = (__CFString *)v14;
    tcp_connection_allow_client_socket_access();
    __int16 v16 = [*(id *)(a1 + 32) _URLToUse];
    id v17 = [v16 absoluteString];
    [v17 UTF8String];
    tcp_connection_set_url();

    __int16 v18 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v103 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Created tcp_connection: %@", buf, 0xCu);
    }
    v101.receiver = *(id *)(a1 + 40);
    v101.super_class = (Class)NDAVBackgroundSession;
    [super monitoredAppBundleID];
    id v19 = objc_claimAutoreleasedReturnValue();
    [v19 UTF8String];
    tcp_connection_set_source_application_by_bundle();

    if (([*(id *)(*(void *)(a1 + 40) + 360) allowsCellularAccess] & 1) == 0) {
      tcp_connection_set_no_cellular();
    }
    if (([*(id *)(*(void *)(a1 + 40) + 360) allowsExpensiveNetworkAccess] & 1) == 0) {
      tcp_connection_set_no_expensive();
    }
    [*(id *)(a1 + 48) startLoadingMetadata];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10006DF60;
    v96[3] = &unk_1000B6448;
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    id v97 = v20;
    uint64_t v98 = v21;
    id v22 = *(id *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 64);
    id v99 = v22;
    uint64_t v100 = v23;
    id v80 = objc_retainBlock(v96);
    id v24 = *(id **)(a1 + 40);
    [v24[45] timeoutIntervalForResource];
    [v24 defaultWindowDurationForResourceTimeout:];
    double v26 = v25;
    +[NSDate timeIntervalSinceReferenceDate];
    double v28 = v27;
    [*(id *)(a1 + 32) creationTime];
    double v30 = v29;
    __int16 v81 = +[NSDate date];
    id v78 = +[NSDate dateWithTimeIntervalSinceNow:v26 - (v28 - v30)];
    uint64_t v31 = getpid();
    __int16 v79 = +[NSString stringWithFormat:@"nsurl-AV-%d-%lld", v31, ++qword_1000CB150];
    +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:");
    uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [(__CFString *)v32 setHandlerQueue:*(void *)(*(void *)(a1 + 40) + 200)];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10006E184;
    v95[3] = &unk_1000B6470;
    uint64_t v33 = *(void *)(a1 + 64);
    v95[4] = *(void *)(a1 + 40);
    v95[5] = v33;
    [(__CFString *)v32 setSuspendHandler:v95];
    [(__CFString *)v32 setRequiresNetwork:1];
    -[__CFString setRequiresPlugin:](v32, "setRequiresPlugin:", [*(id *)(*(void *)(a1 + 40) + 360) _requiresPowerPluggedIn]);
    uint64_t v34 = _DASActivityTransferSizeSmall;
    id v35 = *(void **)(*(void *)(a1 + 40) + 56);
    uint64_t v36 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    id v82 = [v35 objectForKeyedSubscript:v36];

    id v37 = [v82 _DuetActivityProperties];
    LOBYTE(v36) = v37 == 0;

    if ((v36 & 1) == 0)
    {
      id v38 = [v82 _DuetActivityProperties];
      id v39 = [v38 objectForKeyedSubscript:kConditionalConnectionRequirementDownloadBytes];

      if (v39)
      {
        id v40 = [v39 unsignedLongLongValue];
        if ((unint64_t)v40 <= 0x40000000)
        {
          if ((unint64_t)v40 <= 0x1F400000)
          {
            if ((unint64_t)v40 <= 0x6400000)
            {
              if ((unint64_t)v40 <= 0xA00000)
              {
                unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeVerySmall;
                if ((unint64_t)v40 > 0x19000) {
                  unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeSmall;
                }
              }
              else
              {
                unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeModerate;
              }
            }
            else
            {
              unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeLarge;
            }
          }
          else
          {
            unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeVeryLarge;
          }
        }
        else
        {
          unsigned int v41 = (uint64_t *)&_DASActivityTransferSizeGigantic;
        }
        uint64_t v34 = *v41;
      }
      char v50 = [v82 _DuetActivityProperties];
      id v51 = [v50 objectForKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];

      if (v51) {
        -[__CFString setPreClearedMode:](v32, "setPreClearedMode:", (int)[v51 intValue]);
      }
    }
    [(__CFString *)v32 setDownloadSize:v34];
    if (![*(id *)(*(void *)(a1 + 40) + 360) allowsCellularAccess]
      || ([*(id *)(*(void *)(a1 + 40) + 360) allowsExpensiveNetworkAccess] & 1) == 0)
    {
      [(__CFString *)v32 setRequiresInexpensiveNetworking:1];
    }
    if ([*(id *)(a1 + 32) isDiscretionary])
    {
      if ((uint64_t)objc_msgSend(*(id *)(a1 + 40), "adjustedTCPConnectionPriorityForTaskPriority:", objc_msgSend(*(id *)(a1 + 32), "basePriority")) >= 250)
      {
        if (*(unsigned char *)(*(void *)(a1 + 40) + 142)) {
          uint64_t v52 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
        }
        else {
          uint64_t v52 = (uint64_t *)&_DASSchedulingPriorityBackground;
        }
      }
      else
      {
        uint64_t v52 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
      }
    }
    else
    {
      __int16 v53 = [v81 dateByAddingTimeInterval:10.0];
      [(__CFString *)v32 setStartBefore:v53];

      uint64_t v54 = [(id *)(a1 + 40) adjustedTCPConnectionPriorityForTaskPriority:((id *)(a1 + 32)) basePriority];
      uint64_t v52 = (uint64_t *)&_DASSchedulingPriorityUserInitiated;
      if (v54 < 250) {
        uint64_t v52 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
      }
    }
    uint64_t v55 = *v52;
    if ([*(id *)(a1 + 32) isDiscretionary]
      && [*(id *)(a1 + 32) startedUserInitiated])
    {
      id v56 = *(id *)(*(void *)(a1 + 40) + 32);
      uint64_t v57 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v57 + 146))
      {
        id v58 = *(void **)(v57 + 216);
        if (v58)
        {
          id v59 = v58;

          id v56 = v59;
        }
      }
      if ([v56 isInTransitionalDiscretionaryPeriod])
      {
        long long v60 = (id)qword_1000CB148;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          long long v61 = [*(id *)(a1 + 32) _loggableDescription];
          *(_DWORD *)buf = 138543618;
          v103 = v61;
          __int16 v104 = 2112;
          v105 = v32;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ client is in transistional discretionary period - updating activity _DASActivity %@", buf, 0x16u);
        }
        [(__CFString *)v32 setDeferred:1];
      }
    }
    [(__CFString *)v32 setSchedulingPriority:v55];
    v94.receiver = *(id *)(a1 + 40);
    v94.super_class = (Class)NDAVBackgroundSession;
    long long v62 = [super monitoredAppBundleID];
    [(__CFString *)v32 setBundleId:v62];

    long long v63 = (void *)tcp_connection_copy_endpoint();
    BOOL v64 = +[NWEndpoint endpointWithCEndpoint:v63];
    long long v65 = (void *)tcp_connection_copy_parameters();
    long long v66 = +[NWParameters parametersWithCParameters:v65];
    v67 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v64, kNWEndpointKey, v66, kNWParametersKey, 0);
    [(__CFString *)v32 setUserInfo:v67];

    [*(id *)(*(void *)(a1 + 40) + 344) setObject:v32 forKeyedSubscript:*(void *)(a1 + 56)];
    v68 = (id)qword_1000CB148;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [*(id *)(a1 + 32) _loggableDescription];
      *(_DWORD *)buf = 138543618;
      v103 = v69;
      __int16 v104 = 2112;
      v105 = v32;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ submitting _DASActivity %@", buf, 0x16u);
    }
    id v70 = +[_DASScheduler sharedScheduler];
    [v70 submitActivity:v32 inGroupWithName:@"NSURLSessionBackgroundPoolName"];

    tcp_connection_set_indefinite();
    v87 = _NSConcreteStackBlock;
    uint64_t v88 = 3221225472;
    v89 = sub_10006E190;
    v90 = &unk_1000B6498;
    id v71 = *(id *)(a1 + 32);
    uint64_t v72 = *(void *)(a1 + 40);
    id v91 = v71;
    uint64_t v92 = v72;
    uint64_t v93 = *(void *)(a1 + 64);
    tcp_connection_set_event_handler();
    [*(id *)(*(void *)(a1 + 40) + 336) setObject:v15 forKeyedSubscript:*(void *)(a1 + 56)];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10006E298;
    v85[3] = &unk_1000B64C0;
    id v73 = v80;
    id v86 = v73;
    [(__CFString *)v32 setStartHandler:v85];
    id v74 = [*(id *)(a1 + 40) clientBundleID];
    v75 = [*(id *)(a1 + 40) identifier];
    v76 = [*(id *)(a1 + 40) monitoredAppBundleID];
    __int16 v77 = [*(id *)(a1 + 40) secondaryID];
    sub_10005C2B8(0, v74, v75, v76, v77, *(void **)(a1 + 32), 0, 0, 0, [*(id *)(a1 + 32) isDiscretionary], 0, 0, 0, 0);
  }
  else
  {
    BOOL v42 = (id)qword_1000CB148;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v46 = [*(id *)(a1 + 32) _loggableDescription];
      uint64_t v47 = *(void **)(a1 + 32);
      uint64_t v48 = *(void *)(*(void *)(a1 + 40) + 200);
      id v49 = [v47 _URLToUse];
      *(_DWORD *)buf = 138544642;
      v103 = v46;
      __int16 v104 = 2112;
      v105 = v13;
      __int16 v106 = 1024;
      int v107 = v7;
      __int16 v108 = 2112;
      uint64_t v109 = v48;
      __int16 v110 = 2112;
      v111 = v47;
      __int16 v112 = 2112;
      v113 = v49;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@ tcp_connection_create() returned NULL (host %@, port %d, queue %@, taskInfo %@, URL %@)", buf, 0x3Au);
    }
    long long v43 = *(void **)(a1 + 40);
    uint64_t v44 = *(void *)(a1 + 64);
    uint64_t v45 = +[NSURLError errorWithDomain:NSURLErrorDomain code:-1 userInfo:0];
    [v43 taskWithIdentifier:v44 didCompleteWithError:v45];
    CFStringRef v15 = (__CFString *)v45;
  }
}

void sub_10006DC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,void *a47)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006DEAC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 lowercaseString];
  unsigned __int8 v3 = [v2 isEqualToString:@"http"];

  if (v3)
  {
    uint64_t v4 = 80;
  }
  else
  {
    id v5 = [v1 lowercaseString];
    unsigned int v6 = [v5 isEqualToString:@"https"];

    if (v6) {
      uint64_t v4 = 443;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

void sub_10006DF3C(_Unwind_Exception *a1)
{
  unsigned __int8 v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10006DF60(uint64_t a1)
{
  [*(id *)(a1 + 32) setEstablishedConnection:0];
  uint64_t v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = [*(id *)(a1 + 32) _loggableDescription];
    *(_DWORD *)buf = 138543362;
    __int16 v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ got DASActivity startHandler for tcp_connection", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 336) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [*(id *)(a1 + 32) _loggableDescription];
      *(_DWORD *)buf = 138543362;
      __int16 v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ starting tcp_connection", buf, 0xCu);
    }
    tcp_connection_start();
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 200);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E2A8;
    block[3] = &unk_1000B63F8;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)(a1 + 56);
    dispatch_after(v7, v8, block);
  }
}

void sub_10006E154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006E184(uint64_t a1)
{
  return _[*(id *)(a1 + 32) stopAVAssetDownloadSessionWithTaskIdentifier:*(void *)(a1 + 40)];
}

void sub_10006E190(uint64_t a1, int a2)
{
  uint64_t v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) _loggableDescription];
    int v6 = 138543618;
    dispatch_time_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received tcp_connection event %d", (uint8_t *)&v6, 0x12u);
  }
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) setEstablishedConnection:1];
    [*(id *)(a1 + 40) startAVAssetDownloadSessionWithTaskIdentifier:*(void *)(a1 + 48)];
  }
}

void sub_10006E280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006E298(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10006E2A8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) establishedConnection] & 1) == 0)
  {
    id v2 = +[NSURLError errorWithDomain:NSURLErrorDomain code:-1001 userInfo:0];
    [*(id *)(a1 + 40) cancelTCPConnectionForTask:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) retryTask:*(void *)(a1 + 32) originalError:v2];
  }
}

void sub_10006E340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006E5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10006ECA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006EE50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NDAVBackgroundSession;
  return [super requeueTask:v1];
}

void sub_10006EFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006F034(void *a1)
{
  uint64_t v1 = a1[4];
  id v2 = *(NSObject **)(v1 + 200);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F0CC;
  block[3] = &unk_1000B63F8;
  uint64_t v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  void block[4] = v1;
  uint64_t v7 = v3;
  id v6 = v4;
  dispatch_async(v2, block);
}

id sub_10006F0CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) taskWithIdentifier:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 40)];
}

void sub_10006F18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006F210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006F37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006F8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100070300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_100070668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000707E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) clientBundleID];
  unsigned int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) clientBundleID];
      uint64_t v7 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      double v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client exited transitional discretionary period.  Re-evaluating task priorities for session <%@>.<%@>", buf, 0x16u);
    }
    __int16 v8 = [*(id *)(*(void *)(a1 + 40) + 224) allKeys];
    id v9 = [v8 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          CFStringRef v15 = [[*(id *)(*(void *)(a1 + 40) + 224) objectForKeyedSubscript:v14];
          if ([v15 isDiscretionary]
            && [v15 startedUserInitiated]
            && ([v15 establishedConnection] & 1) == 0)
          {
            __int16 v16 = [v15 _URLToUse];
            id v17 = +[NSURLError _web_errorWithDomain:@"_nsurlsessiondErrorDomain" code:9 URL:v16];

            [*(id *)(a1 + 40) cancelAVDownloadAndFailTaskWithIdentifier:[v14 unsignedIntegerValue] withError:v17];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

void sub_100070A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070B80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) clientBundleID];
  unsigned int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = 0;

    uint64_t v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [*(id *)(a1 + 40) clientBundleID];
      id v9 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138412546;
      double v26 = v8;
      __int16 v27 = 2112;
      double v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling AVAssetDownloads for session <%@>.<%@> since client was quit from app switcher", buf, 0x16u);
    }
    id v10 = [*(id *)(*(void *)(a1 + 40) + 224) allKeys];
    id v11 = [v10 copy];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          __int16 v16 = [*(id *)(*(void *)(a1 + 40) + 224) objectForKeyedSubscript:v15];
          id v17 = [v16 _URLToUse];
          long long v18 = +[NSURLError _web_errorWithDomain:@"_nsurlsessiondErrorDomain" code:1 URL:v17];

          [*(id *)(a1 + 40) cancelAVDownloadAndFailTaskWithIdentifier:[v15 unsignedIntegerValue] withError:v18];
        }
        id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

void sub_100070DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070F0C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 336) count])
  {
    id v2 = (id)qword_1000CB148;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bumping priority of AVAssetDownloads for %@ since it entered the foreground", buf, 0xCu);
    }
  }
  unsigned int v4 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 336);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:v9];
        BOOL v11 = v10 == 0;

        if (v11) {
          [v4 addObject:v9];
        }
        else {
          [*(id *)(a1 + 32) updatePriorityForTaskID:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 32) updatePriorityForTaskID:*(void *)(*((void *)&v16 + 1) + 8 * (void)j) priority:v16];
      }
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void sub_100071178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007124C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 336) count])
  {
    id v2 = (id)qword_1000CB148;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Lowering priority of AVAssetDownloads for %@ since it is no longer in the foreground", buf, 0xCu);
    }
  }
  unsigned int v4 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 336);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:v9];
        BOOL v11 = v10 == 0;

        if (v11) {
          [*(id *)(a1 + 32) updatePriorityForTaskID:v9];
        }
        else {
          [v4 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 32) updatePriorityForTaskID:*(void *)(*((void *)&v16 + 1) + 8 * (void)j) priority:v16];
      }
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void sub_1000714B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007180C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100071F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100071F84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 _destinationURLToUse];
  __int16 v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 URLByDeletingLastPathComponent];
    id v38 = 0;
    unsigned __int8 v10 = [v9 checkResourceIsReachableAndReturnError:&v38];
    id v11 = v38;

    if ((v10 & 1) == 0)
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 _loggableDescription];
        *(_DWORD *)buf = 138543874;
        BOOL v42 = v13;
        __int16 v43 = 2112;
        id v44 = v8;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ not restoring task due to unreachable destination folder %@ (%@)", buf, 0x20u);
      }
      [v6 setState:3];
      uint64_t v14 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-3000 failingURL:0];
      [v6 setError:v14];

      CFStringRef v15 = [PendingCallback alloc];
      id v16 = [v6 identifier];
      long long v17 = [v6 error];
      v40[0] = v17;
      long long v18 = +[NSNull null];
      v40[1] = v18;
      v40[2] = &__NSDictionary0__struct;
      long long v19 = +[NSArray arrayWithObjects:v40 count:3];
      long long v20 = [(PendingCallback *)v15 initWithCallbackType:0 taskIdentifier:v16 args:v19];

      [*(id *)(*(void *)(a1 + 32) + 208) addPendingCallback:v20 wakeRequirement:0];
    }
  }
  if ([v6 initializedWithAVAsset] && (uint64_t)objc_msgSend(v6, "state") <= 2)
  {
    long long v21 = [v6 AVAssetURL];
    long long v22 = [v6 assetOptionsPlist];
    long long v23 = +[AVURLAsset assetForNSURLSessionWithURL:v21 propertyList:v22];

    [v6 setAVURLAsset:v23];
    [v6 setAVAssetDownloadToken:[v23 downloadToken]];
    if (!v23
      || ([v23 URL],
          id v24 = objc_claimAutoreleasedReturnValue(),
          BOOL v25 = v24 == 0,
          v24,
          v25))
    {
      double v29 = (id)qword_1000CB148;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [v6 _loggableDescription];
        id v37 = [v6 AVAssetDownloadToken];
        *(_DWORD *)buf = 138543618;
        BOOL v42 = v36;
        __int16 v43 = 2048;
        id v44 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to re-instantiate AVURLAsset with token %llu", buf, 0x16u);
      }
      [v6 setState:3];
      double v30 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-1 failingURL:0];
      [v6 setError:v30];

      uint64_t v31 = [PendingCallback alloc];
      id v32 = [v6 identifier];
      uint64_t v33 = [v6 error];
      v39[0] = v33;
      uint64_t v34 = +[NSNull null];
      v39[1] = v34;
      v39[2] = &__NSDictionary0__struct;
      id v35 = +[NSArray arrayWithObjects:v39 count:3];
      double v26 = [(PendingCallback *)v31 initWithCallbackType:0 taskIdentifier:v32 args:v35];

      [*(id *)(*(void *)(a1 + 32) + 208) addPendingCallback:v26 wakeRequirement:0];
    }
    else
    {
      double v26 = (id)qword_1000CB148;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = [v6 _loggableDescription];
        id v28 = [v6 AVAssetDownloadToken];
        *(_DWORD *)buf = 138543618;
        BOOL v42 = v27;
        __int16 v43 = 2048;
        id v44 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ restored asset with token %llu from archivedInfo", buf, 0x16u);
      }
    }
  }
  if ((uint64_t)[v6 state] <= 2)
  {
    [*(id *)(a1 + 32) addOutstandingTaskWithIdentifier:[v5 unsignedIntegerValue]];
    [*(id *)(a1 + 40) addObject:v6];
  }
  [*(id *)(*(void *)(a1 + 32) + 224) setObject:v6 forKeyedSubscript:v5];
}

void sub_1000724A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100072CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100072F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007308C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000731D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007339C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000733C0(uint64_t a1)
{
  id v2 = (id)qword_1000CB148;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) clientBundleID];
    unsigned int v4 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412546;
    unsigned __int8 v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Delayed wake timer fired for session <%@>.<%@>", (uint8_t *)&v9, 0x16u);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 208) count]
    && ([*(id *)(a1 + 32) clientIsActive] & 1) == 0)
  {
    id v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) clientBundleID];
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      int v9 = 138412546;
      unsigned __int8 v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Triggering delayed wake for session <%@>.<%@>", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 32) wakeUpClient:1];
  }
  return [*(id *)(a1 + 32) cancelDelayedCompletionWakeTimer];
}

void sub_100073560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return _CFReadStreamSetProperty(stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return _CGSizeMakeWithDictionaryRepresentation(dict, size);
}

uint64_t CHSIsWidgetExtensionPoint()
{
  return _CHSIsWidgetExtensionPoint();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
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

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return _PLShouldLogRegisteredEvent();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

uint64_t SecTrustCopyInfo()
{
  return _SecTrustCopyInfo();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return _container_create_or_lookup_path_for_current_user();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

uint64_t container_user_managed_assets_relative_path()
{
  return _container_user_managed_assets_relative_path();
}

uint64_t destinationURLFragment()
{
  return _destinationURLFragment();
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return _dirname_r(a1, a2);
}

uint64_t dirstat_np()
{
  return _dirstat_np();
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dup(int a1)
{
  return _dup(a1);
}

uint64_t estimatedPropertyListSize()
{
  return _estimatedPropertyListSize();
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return _fclonefileat(a1, a2, a3, a4);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

uint64_t ne_tracker_check_is_hostname_blocked()
{
  return _ne_tracker_check_is_hostname_blocked();
}

uint64_t ne_tracker_check_tcc()
{
  return _ne_tracker_check_tcc();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_activity_create_from_token()
{
  return _nw_activity_create_from_token();
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

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t rootless_check_datavault_flag()
{
  return _rootless_check_datavault_flag();
}

uint64_t rootless_convert_to_datavault()
{
  return _rootless_convert_to_datavault();
}

uint64_t rootless_mkdir_datavault()
{
  return _rootless_mkdir_datavault();
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
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

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
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

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t symptom_create()
{
  return _symptom_create();
}

uint64_t symptom_send()
{
  return _symptom_send();
}

uint64_t symptom_set_qualifier()
{
  return _symptom_set_qualifier();
}

uint64_t tcp_connection_allow_client_socket_access()
{
  return _tcp_connection_allow_client_socket_access();
}

uint64_t tcp_connection_cancel()
{
  return _tcp_connection_cancel();
}

uint64_t tcp_connection_copy_endpoint()
{
  return _tcp_connection_copy_endpoint();
}

uint64_t tcp_connection_copy_parameters()
{
  return _tcp_connection_copy_parameters();
}

uint64_t tcp_connection_create()
{
  return _tcp_connection_create();
}

uint64_t tcp_connection_create_with_connected_fd()
{
  return _tcp_connection_create_with_connected_fd();
}

uint64_t tcp_connection_read()
{
  return _tcp_connection_read();
}

uint64_t tcp_connection_set_event_handler()
{
  return _tcp_connection_set_event_handler();
}

uint64_t tcp_connection_set_indefinite()
{
  return _tcp_connection_set_indefinite();
}

uint64_t tcp_connection_set_no_cellular()
{
  return _tcp_connection_set_no_cellular();
}

uint64_t tcp_connection_set_no_expensive()
{
  return _tcp_connection_set_no_expensive();
}

uint64_t tcp_connection_set_source_application_by_bundle()
{
  return _tcp_connection_set_source_application_by_bundle();
}

uint64_t tcp_connection_set_url()
{
  return _tcp_connection_set_url();
}

uint64_t tcp_connection_start()
{
  return _tcp_connection_start();
}

uint64_t tcp_connection_write()
{
  return _tcp_connection_write();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_is_extension()
{
  return _xpc_connection_is_extension();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
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
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_AVAssetDownloadToken(void *a1, const char *a2, ...)
{
  return _[a1 AVAssetDownloadToken];
}

id objc_msgSend_AVAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 AVAssetURL];
}

id objc_msgSend_AVURLAsset(void *a1, const char *a2, ...)
{
  return _[a1 AVURLAsset];
}

id objc_msgSend_EDUMode(void *a1, const char *a2, ...)
{
  return _[a1 EDUMode];
}

id objc_msgSend_HTTPAdditionalHeaders(void *a1, const char *a2, ...)
{
  return _[a1 HTTPAdditionalHeaders];
}

id objc_msgSend_HTTPBodyStream(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBodyStream];
}

id objc_msgSend_HTTPMaximumConnectionsPerHost(void *a1, const char *a2, ...)
{
  return _[a1 HTTPMaximumConnectionsPerHost];
}

id objc_msgSend_IDSMessageTimeout(void *a1, const char *a2, ...)
{
  return _[a1 IDSMessageTimeout];
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didFinishDownloadForMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didResolveMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didResolveMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didUpdateProgressWithLastBytesWritten_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_willDownloadVariants_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:willDownloadVariants:");
}

id objc_msgSend_TLSMaximumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 TLSMaximumSupportedProtocol];
}

id objc_msgSend_TLSMinimumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 TLSMinimumSupportedProtocol];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLAssetWithURL_options_(void *a1, const char *a2, ...)
{
  return [a1 URLAssetWithURL:options:];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathExtension:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return [a1 URLForDirectory:x0 inDomain:x1 appropriateForURL:x2 create:x3 error:x4];
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_URLSessionDidCompleteForExtensionWithBundleIdentifier_info_(void *a1, const char *a2, ...)
{
  return [a1 URLSessionDidCompleteForExtensionWithBundleIdentifier:info:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__AVAssetDownloadSessionOptions_config_asset_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend a1, "_AVAssetDownloadSessionOptions:config:asset:"];
}

id objc_msgSend__DuetActivityProperties(void *a1, const char *a2, ...)
{
  return _[a1 _DuetActivityProperties];
}

id objc_msgSend__IDSMessageTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _IDSMessageTimeout];
}

id objc_msgSend__TCPAdaptiveReadTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _TCPAdaptiveReadTimeout];
}

id objc_msgSend__TCPAdaptiveWriteTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _TCPAdaptiveWriteTimeout];
}

id objc_msgSend__TLSMaximumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 _TLSMaximumSupportedProtocolVersion];
}

id objc_msgSend__TLSMinimumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 _TLSMinimumSupportedProtocolVersion];
}

id objc_msgSend__URLToUse(void *a1, const char *a2, ...)
{
  return _[a1 _URLToUse];
}

id objc_msgSend__actualAdditionalProperties(void *a1, const char *a2, ...)
{
  return _[a1 _actualAdditionalProperties];
}

id objc_msgSend__actualAuthHeaders(void *a1, const char *a2, ...)
{
  return _[a1 _actualAuthHeaders];
}

id objc_msgSend__actualConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _actualConfiguration];
}

id objc_msgSend__actualCredential(void *a1, const char *a2, ...)
{
  return _[a1 _actualCredential];
}

id objc_msgSend__actualRequest(void *a1, const char *a2, ...)
{
  return _[a1 _actualRequest];
}

id objc_msgSend__allProtocolProperties(void *a1, const char *a2, ...)
{
  return _[a1 _allProtocolProperties];
}

id objc_msgSend__allowsHSTSWithUntrustedRootCertificate(void *a1, const char *a2, ...)
{
  return _[a1 _allowsHSTSWithUntrustedRootCertificate];
}

id objc_msgSend__allowsPowerNapScheduling(void *a1, const char *a2, ...)
{
  return _[a1 _allowsPowerNapScheduling];
}

id objc_msgSend__allowsRetryForBackgroundDataTasks(void *a1, const char *a2, ...)
{
  return _[a1 _allowsRetryForBackgroundDataTasks];
}

id objc_msgSend__allowsTLSECH(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSECH];
}

id objc_msgSend__allowsTLSFallback(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSFallback];
}

id objc_msgSend__allowsTLSFalseStart(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSFalseStart];
}

id objc_msgSend__allowsUCA(void *a1, const char *a2, ...)
{
  return _[a1 _allowsUCA];
}

id objc_msgSend__allowsVirtualInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 _allowsVirtualInterfaces];
}

id objc_msgSend__alwaysPerformDefaultTrustEvaluation(void *a1, const char *a2, ...)
{
  return _[a1 _alwaysPerformDefaultTrustEvaluation];
}

id objc_msgSend__asset(void *a1, const char *a2, ...)
{
  return _[a1 _asset];
}

id objc_msgSend__atsContext(void *a1, const char *a2, ...)
{
  return _[a1 _atsContext];
}

id objc_msgSend__authenticatorStatusCodes(void *a1, const char *a2, ...)
{
  return _[a1 _authenticatorStatusCodes];
}

id objc_msgSend__backgroundPublishingURL(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundPublishingURL];
}

id objc_msgSend__backgroundTrailers(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundTrailers];
}

id objc_msgSend__beginSqliteTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _beginSqliteTransaction];
}

id objc_msgSend__clientIsNotExplicitlyDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 _clientIsNotExplicitlyDiscretionary];
}

id objc_msgSend__commitSqliteTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _commitSqliteTransaction];
}

id objc_msgSend__companionAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _companionAppBundleIdentifier];
}

id objc_msgSend__connectionIsCellular(void *a1, const char *a2, ...)
{
  return _[a1 _connectionIsCellular];
}

id objc_msgSend__connectionPoolName(void *a1, const char *a2, ...)
{
  return _[a1 _connectionPoolName];
}

id objc_msgSend__copySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _copySocketStreamProperties];
}

id objc_msgSend__createDBSchemaForPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createDBSchemaForPath:");
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return _[a1 _createDispatchData];
}

id objc_msgSend__daemon_connectionMetrics(void *a1, const char *a2, ...)
{
  return [a1 _daemon_connectionMetrics];
}

id objc_msgSend__daemon_currentTransactionMetrics(void *a1, const char *a2, ...)
{
  return [_daemon_currentTransactionMetrics];
}

id objc_msgSend__daemon_establishTime(void *a1, const char *a2, ...)
{
  return [a1 _daemon_establishTime];
}

id objc_msgSend__daemon_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 _daemon_interfaceName];
}

id objc_msgSend__daemon_isDataBudgetingEnabled(void *a1, const char *a2, ...)
{
  return [a1 _daemon_isDataBudgetingEnabled];
}

id objc_msgSend__daemon_isDiscretionary(void *a1, const char *a2, ...)
{
  return [a1 _daemon_isDiscretionary];
}

id objc_msgSend__daemon_requestBodyTransferSize(void *a1, const char *a2, ...)
{
  return [a1 _daemon_requestBodyTransferSize];
}

id objc_msgSend__daemon_requestHeaderSize(void *a1, const char *a2, ...)
{
  return [a1 _daemon_requestHeaderSize];
}

id objc_msgSend__daemon_responseBodyTransferSize(void *a1, const char *a2, ...)
{
  return [a1 _daemon_responseBodyTransferSize];
}

id objc_msgSend__daemon_responseHeaderSize(void *a1, const char *a2, ...)
{
  return [a1 _daemon_responseHeaderSize];
}

id objc_msgSend__deleteAllTaskEntriesForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deleteAllTaskEntriesForSession:sessionUUID:")];
}

id objc_msgSend__deleteTaskEntriesWithIdentifiers_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:");
}

id objc_msgSend__destinationURLToUse(void *a1, const char *a2, ...)
{
  return _[a1 _destinationURLToUse];
}

id objc_msgSend__directoryForDownloadedFiles(void *a1, const char *a2, ...)
{
  return _[a1 _directoryForDownloadedFiles];
}

id objc_msgSend__doesSZExtractorConsumeExtractedData(void *a1, const char *a2, ...)
{
  return _[a1 _doesSZExtractorConsumeExtractedData];
}

id objc_msgSend__downloadTaskWithRequest_downloadFilePath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_downloadTaskWithRequest:downloadFilePath:");
}

id objc_msgSend__duetPreClearedMode(void *a1, const char *a2, ...)
{
  return _[a1 _duetPreClearedMode];
}

id objc_msgSend__duetPreauthorized(void *a1, const char *a2, ...)
{
  return _[a1 _duetPreauthorized];
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveConfiguration];
}

id objc_msgSend__extractor(void *a1, const char *a2, ...)
{
  return _[a1 _extractor];
}

id objc_msgSend__extractorFinishedDecoding(void *a1, const char *a2, ...)
{
  return _[a1 _extractorFinishedDecoding];
}

id objc_msgSend__extractorPreparedForExtraction(void *a1, const char *a2, ...)
{
  return _[a1 _extractorPreparedForExtraction];
}

id objc_msgSend__getAllSessionIDsForBundle_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getAllSessionIDsForBundle:");
}

id objc_msgSend__getAllTasksFromDBForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getAllTasksFromDBForSession:sessionUUID:")
}

id objc_msgSend__groupConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _groupConfiguration];
}

id objc_msgSend__hasSZExtractor(void *a1, const char *a2, ...)
{
  return _[a1 _hasSZExtractor];
}

id objc_msgSend__ignoreDidReceiveResponseDisposition(void *a1, const char *a2, ...)
{
  return _[a1 _ignoreDidReceiveResponseDisposition];
}

id objc_msgSend__infersDiscretionaryFromOriginatingClient(void *a1, const char *a2, ...)
{
  return _[a1 _infersDiscretionaryFromOriginatingClient];
}

id objc_msgSend__initDB_(void *a1, const char *a2, ...)
{
  return [a1 _initDB:];
}

id objc_msgSend__initWithActualAuthChallenge_(void *a1, const char *a2, ...)
{
  return [a1 _initWithActualAuthChallenge:];
}

id objc_msgSend__initWithActualError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithActualError:");
}

id objc_msgSend__initWithActualRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithActualRequest:");
}

id objc_msgSend__initWithActualResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithActualResponse:");
}

id objc_msgSend__isSafeDirectoryForDownloads_withToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isSafeDirectoryForDownloads:withToken:");
}

id objc_msgSend__isSafeRequestForBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 _isSafeRequestForBackgroundDownload];
}

id objc_msgSend__legacySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _legacySocketStreamProperties];
}

id objc_msgSend__loggableDescription(void *a1, const char *a2, ...)
{
  return _[a1 _loggableDescription];
}

id objc_msgSend__loggingPrivacyLevel(void *a1, const char *a2, ...)
{
  return _[a1 _loggingPrivacyLevel];
}

id objc_msgSend__maximumWatchCellularTransferSize(void *a1, const char *a2, ...)
{
  return _[a1 _maximumWatchCellularTransferSize];
}

id objc_msgSend__metrics(void *a1, const char *a2, ...)
{
  return _[a1 _metrics];
}

id objc_msgSend__multipathAlternatePort(void *a1, const char *a2, ...)
{
  return _[a1 _multipathAlternatePort];
}

id objc_msgSend__neTrackerTCCResult(void *a1, const char *a2, ...)
{
  return _[a1 _neTrackerTCCResult];
}

id objc_msgSend__nsurlsessionproxy_cancelWithError_(void *a1, const char *a2, ...)
{
  return [_nsurlsessionproxy_cancelWithError:];
}

id objc_msgSend__nsurlsessionproxy_clearError(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_clearError];
}

id objc_msgSend__nsurlsessionproxy_error(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_error];
}

id objc_msgSend__nsurlsessionproxy_isSafeRequest(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_isSafeRequest];
}

id objc_msgSend__nsurlsessionproxy_launchUUID(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_launchUUID];
}

id objc_msgSend__nsurlsessionproxy_messagePriority(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_messagePriority];
}

id objc_msgSend__nsurlsessionproxy_requiresBackgroundSession(void *a1, const char *a2, ...)
{
  return [_nsurlsessionproxy_requiresBackgroundSession];
}

id objc_msgSend__nsurlsessionproxy_secureArchivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return [_nsurlsessionproxy_secureArchivedDataWithRootObject:];
}

id objc_msgSend__nsurlsessionproxy_secureUnarchiveObjectOfClass_withData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:");
}

id objc_msgSend__nsurlsessionproxy_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_sequenceNumber];
}

id objc_msgSend__nsurlsessionproxy_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_sessionIdentifier];
}

id objc_msgSend__nsurlsessionproxy_sessionUUID(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nsurlsessionproxy_sessionUUID");
}

id objc_msgSend__nsurlsessionproxy_setLaunchUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nsurlsessionproxy_setLaunchUUID:");
}

id objc_msgSend__nsurlsessionproxy_setMessagePriority_(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_setMessagePriority:];
}

id objc_msgSend__nsurlsessionproxy_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return [_nsurlsessionproxy_setSequenceNumber:];
}

id objc_msgSend__nsurlsessionproxy_taskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _nsurlsessionproxy_taskIdentifier];
}

id objc_msgSend__obliterateAllBackgroundSessionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_obliterateAllBackgroundSessionsWithCompletionHandler:");
}

id objc_msgSend__onBehalfOfPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 _onBehalfOfPairedDevice];
}

id objc_msgSend__onqueue_IDSTimoutForMessage_(void *a1, const char *a2, ...)
{
  return [_onqueue_IDSTimoutForMessage:];
}

id objc_msgSend__onqueue_adoptEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return [_onqueue_adoptEffectiveConfiguration:];
}

id objc_msgSend__onqueue_convertSqlRowToTaskInfoEntry_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_convertSqlRowToTaskInfoEntry:");
}

id objc_msgSend__onqueue_deleteEntryForTask_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_onqueue_deleteEntryForTask:forSession:sessionUUID:];
}

id objc_msgSend__onqueue_devicesConnected(void *a1, const char *a2, ...)
{
  return [_onqueue_devicesConnected];
}

id objc_msgSend__onqueue_devicesDisconnected(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_devicesDisconnected");
}

id objc_msgSend__onqueue_handleFailedMessageSend_ofType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_handleFailedMessageSend:ofType:");
}

id objc_msgSend__onqueue_handleReceivedMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_handleReceivedMessage:ofType:withReply:");
}

id objc_msgSend__onqueue_handleReceivedReply_forIdentifier_ofType_withError_(void *a1, const char *a2, ...)
{
  return [_onqueue_handleReceivedReply:forIdentifier:ofType:withError:];
}

id objc_msgSend__onqueue_initDB(void *a1, const char *a2, ...)
{
  return [_onqueue_initDB];
}

id objc_msgSend__onqueue_insertOrUpdateAllEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:];
}

id objc_msgSend__onqueue_loggableDescriptionForMessage_(void *a1, const char *a2, ...)
{
  return [_onqueue_loggableDescriptionForMessage:];
}

id objc_msgSend__onqueue_messageWithIdentifier_didSendWithSuccess_error_(void *a1, const char *a2, ...)
{
  return [_onqueue_messageWithIdentifier:didSendWithSuccess:error:];
}

id objc_msgSend__onqueue_priorityForMessage_ofType_isReply_(void *a1, const char *a2, ...)
{
  return [_onqueue_priorityForMessage:ofType:isReply:];
}

id objc_msgSend__onqueue_remoteDeviceStartedUp(void *a1, const char *a2, ...)
{
  return [_onqueue_remoteDeviceStartedUp];
}

id objc_msgSend__onqueue_removePendingLaunchForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_removePendingLaunchForBundleID:sessionID:");
}

id objc_msgSend__onqueue_resetRequestDelay(void *a1, const char *a2, ...)
{
  return [_onqueue_resetRequestDelay];
}

id objc_msgSend__onqueue_sendMessage_ofType_responseIdentifier_forSourceApplication_withUrgency_withIDSMessageTimeout_withReply_(void *a1, const char *a2, ...)
{
  return [_onqueue_sendMessage:ofType:responseIdentifier:forSourceApplication:withUrgency:withIDSMessageTimeout:withReply:];
}

id objc_msgSend__onqueue_sendStartupMessage(void *a1, const char *a2, ...)
{
  return [_onqueue_sendStartupMessage];
}

id objc_msgSend__onqueue_sourceApplicationForMessage_(void *a1, const char *a2, ...)
{
  return [_onqueue_sourceApplicationForMessage:];
}

id objc_msgSend__onqueue_updateBytesPerSecondLimitForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateBytesPerSecondLimitForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateCurrentRequestForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateCurrentRequestForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateDeviceState(void *a1, const char *a2, ...)
{
  return [_onqueue_updateDeviceState];
}

id objc_msgSend__onqueue_updateDownloadFileURLForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_onqueue_updateDownloadFileURLForTask:sessionUUID:];
}

id objc_msgSend__onqueue_updateExpectedProgressTargetForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateExpectedProgressTargetForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateLoadingPriorityForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateLoadingPriorityForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResponseForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateResponseForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResumableUploadDataForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateResumableUploadDataForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateSetPriorityEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateSetPriorityEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateShouldCancelOnDisconnectForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:];
}

id objc_msgSend__onqueue_updateSuspendPathEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateSuspendPathEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTLSSupportedProtocolVersionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTaskDescriptionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueue_updateTaskDescriptionForTask:sessionUUID:");
}

id objc_msgSend__performsEVCertCheck(void *a1, const char *a2, ...)
{
  return _[a1 _performsEVCertCheck];
}

id objc_msgSend__pidForHAR(void *a1, const char *a2, ...)
{
  return _[a1 _pidForHAR];
}

id objc_msgSend__prefersInfraWiFi(void *a1, const char *a2, ...)
{
  return _[a1 _prefersInfraWiFi];
}

id objc_msgSend__priority(void *a1, const char *a2, ...)
{
  return _[a1 _priority];
}

id objc_msgSend__priorityValue(void *a1, const char *a2, ...)
{
  return _[a1 _priorityValue];
}

id objc_msgSend__propertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 _propertyForKey:];
}

id objc_msgSend__releasePreventIdleSleepAssertionIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 _releasePreventIdleSleepAssertionIfAppropriate];
}

id objc_msgSend__removeAllProtocolProperties(void *a1, const char *a2, ...)
{
  return _[a1 _removeAllProtocolProperties];
}

id objc_msgSend__reportsDataStalls(void *a1, const char *a2, ...)
{
  return _[a1 _reportsDataStalls];
}

id objc_msgSend__requestFromResumeData(void *a1, const char *a2, ...)
{
  return _[a1 _requestFromResumeData];
}

id objc_msgSend__requiresPowerPluggedIn(void *a1, const char *a2, ...)
{
  return _[a1 _requiresPowerPluggedIn];
}

id objc_msgSend__requiresSustainedDataDelivery(void *a1, const char *a2, ...)
{
  return _[a1 _requiresSustainedDataDelivery];
}

id objc_msgSend__respectsAllowsCellularAccessForDiscretionaryTasks(void *a1, const char *a2, ...)
{
  return _[a1 _respectsAllowsCellularAccessForDiscretionaryTasks];
}

id objc_msgSend__seenFirstResume(void *a1, const char *a2, ...)
{
  return _[a1 _seenFirstResume];
}

id objc_msgSend__sessionSendsLaunchOnDemandEvents(void *a1, const char *a2, ...)
{
  return _[a1 _sessionSendsLaunchOnDemandEvents];
}

id objc_msgSend__sessionWithConfiguration_delegate_delegateDispatchQueue_(void *a1, const char *a2, ...)
{
  return [_sessionWithConfiguration:delegate:delegateDispatchQueue:];
}

id objc_msgSend__setActualTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 _setActualTaskInfo:];
}

id objc_msgSend__setAllowsUCA_(void *a1, const char *a2, ...)
{
  return [a1 _setAllowsUCA:];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [a1 _setQueue:];
}

id objc_msgSend__setTimeWindowDelay_(void *a1, const char *a2, ...)
{
  return [a1 _setTimeWindowDelay:];
}

id objc_msgSend__setTimeWindowDuration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setTimeWindowDuration:");
}

id objc_msgSend__shouldSkipPreferredClientCertificateLookup(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSkipPreferredClientCertificateLookup];
}

id objc_msgSend__socketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _socketStreamProperties];
}

id objc_msgSend__sourceApplicationAuditTokenData(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationAuditTokenData];
}

id objc_msgSend__sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationBundleIdentifier];
}

id objc_msgSend__sourceApplicationBundleIdentifierForMobileAsset(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationBundleIdentifierForMobileAsset];
}

id objc_msgSend__sourceApplicationSecondaryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationSecondaryIdentifier];
}

id objc_msgSend__sqlBlobHelper_forColumn_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sqlBlobHelper:forColumn:");
}

id objc_msgSend__supportsAVAssetDownloads(void *a1, const char *a2, ...)
{
  return _[a1 _supportsAVAssetDownloads];
}

id objc_msgSend__taskGroup(void *a1, const char *a2, ...)
{
  return _[a1 _taskGroup];
}

id objc_msgSend__timeWindowDelay(void *a1, const char *a2, ...)
{
  return _[a1 _timeWindowDelay];
}

id objc_msgSend__timeWindowDuration(void *a1, const char *a2, ...)
{
  return _[a1 _timeWindowDuration];
}

id objc_msgSend__timingDataOptions(void *a1, const char *a2, ...)
{
  return _[a1 _timingDataOptions];
}

id objc_msgSend__tlsSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _[a1 _tlsSessionCachePrefix];
}

id objc_msgSend__tlsTrustPinningPolicyName(void *a1, const char *a2, ...)
{
  return _[a1 _tlsTrustPinningPolicyName];
}

id objc_msgSend__trailers(void *a1, const char *a2, ...)
{
  return _[a1 _trailers];
}

id objc_msgSend__uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _uniqueIdentifier];
}

id objc_msgSend__updateDBEntriesForTasksInSession_taskInfos_updates_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateDBEntriesForTasksInSession:taskInfos:updates:");
}

id objc_msgSend__updateDBEntryForTask_updateType_sessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateDBEntryForTask:updateType:sessionUUID:");
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _[a1 _updateState];
}

id objc_msgSend__updatedStreamingZipModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 _updatedStreamingZipModificationDate];
}

id objc_msgSend__useTLSSessionCacheFromSession_(void *a1, const char *a2, ...)
{
  return [a1 _useTLSSessionCacheFromSession:];
}

id objc_msgSend__web_errorWithDomain_code_URL_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_web_errorWithDomain:code:URL:");
}

id objc_msgSend__web_errorWithDomain_code_failingURL_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_web_errorWithDomain:code:failingURL:");
}

id objc_msgSend__xpcActivityBudgeted(void *a1, const char *a2, ...)
{
  return _[a1 _xpcActivityBudgeted];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 _xpcConnection];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_activityCanceled_(void *a1, const char *a2, ...)
{
  return [a1 activityCanceled:];
}

id objc_msgSend_activityCompleted_(void *a1, const char *a2, ...)
{
  return [a1 activityCompleted:];
}

id objc_msgSend_activityWithName_priority_duration_startingAfter_startingBefore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "activityWithName:priority:duration:startingAfter:startingBefore:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forApplication_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forApplication:];
}

id objc_msgSend_addObserver_forContainerID_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forContainerID:];
}

id objc_msgSend_addObserver_forExtension_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forExtension:];
}

id objc_msgSend_addObserver_forProviderID_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forProviderID:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 addOutstandingTaskWithIdentifier:];
}

id objc_msgSend_addPendingCallback_wakeRequirement_(void *a1, const char *a2, ...)
{
  return [a1 addPendingCallback:wakeRequirement:];
}

id objc_msgSend_addPendingCallbackToFront_(void *a1, const char *a2, ...)
{
  return [a1 addPendingCallbackToFront:];
}

id objc_msgSend_addTransaction(void *a1, const char *a2, ...)
{
  return _[a1 addTransaction];
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return _[a1 additionalProperties];
}

id objc_msgSend_adjustDiscretionaryStatusForTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 adjustDiscretionaryStatusForTaskInfo:];
}

id objc_msgSend_adjustedTCPConnectionPriorityForTaskPriority_(void *a1, const char *a2, ...)
{
  return [a1 adjustedTCPConnectionPriorityForTaskPriority:];
}

id objc_msgSend_allCredentials(void *a1, const char *a2, ...)
{
  return _[a1 allCredentials];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowReconnect(void *a1, const char *a2, ...)
{
  return _[a1 allowReconnect];
}

id objc_msgSend_allowedClassesForUnarchiving(void *a1, const char *a2, ...)
{
  return _[a1 allowedClassesForUnarchiving];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsCellularAccess];
}

id objc_msgSend_allowsConstrainedNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsConstrainedNetworkAccess];
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsExpensiveNetworkAccess];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_application_hasAssertionWithName_(void *a1, const char *a2, ...)
{
  return [a1 application:hasAssertionWithName:];
}

id objc_msgSend_application_isHandlingBackgroundSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return [a1 application:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:];
}

id objc_msgSend_applicationBackgroundUpdatesEnabled_(void *a1, const char *a2, ...)
{
  return [a1 applicationBackgroundUpdatesEnabled:];
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOff_(void *a1, const char *a2, ...)
{
  return [a1 applicationBackgroundUpdatesTurnedOff];
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOn_(void *a1, const char *a2, ...)
{
  return [a1 applicationBackgroundUpdatesTurnedOn];
}

id objc_msgSend_applicationEnteredForeground_(void *a1, const char *a2, ...)
{
  return [a1 applicationEnteredForeground:];
}

id objc_msgSend_applicationHasBackgroundTaskCompletion_(void *a1, const char *a2, ...)
{
  return [a1 applicationHasBackgroundTaskCompletion:];
}

id objc_msgSend_applicationIsForeground_(void *a1, const char *a2, ...)
{
  return [a1 applicationIsForeground:];
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return [a1 applicationIsInstalled:];
}

id objc_msgSend_applicationNoLongerInForeground_(void *a1, const char *a2, ...)
{
  return [a1 applicationNoLongerInForeground:];
}

id objc_msgSend_applicationWasQuitFromAppSwitcher_(void *a1, const char *a2, ...)
{
  return [a1 applicationWasQuitFromAppSwitcher:];
}

id objc_msgSend_applicationWasSuspended_pid_(void *a1, const char *a2, ...)
{
  return [a1 applicationWasSuspended:pid];
}

id objc_msgSend_applicationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationWithIdentifier:];
}

id objc_msgSend_archiveList(void *a1, const char *a2, ...)
{
  return _[a1 archiveList];
}

id objc_msgSend_archivePath(void *a1, const char *a2, ...)
{
  return _[a1 archivePath];
}

id objc_msgSend_archiveState(void *a1, const char *a2, ...)
{
  return _[a1 archiveState];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:")];
}

id objc_msgSend_args(void *a1, const char *a2, ...)
{
  return _[a1 args];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assertionNameForSessionUUID_(void *a1, const char *a2, ...)
{
  return [a1 assertionNameForSessionUUID:];
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _[a1 assertions];
}

id objc_msgSend_assetArtworkData(void *a1, const char *a2, ...)
{
  return _[a1 assetArtworkData];
}

id objc_msgSend_assetDownloadSessionWithAsset_mediaSelections_destinationURL_options_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:)
}

id objc_msgSend_assetDownloadSessionWithURL_destinationURL_options_(void *a1, const char *a2, ...)
{
  return [a1 assetDownloadSessionWithURL:x0 destinationURL:x1 options:x2];
}

id objc_msgSend_assetForNSURLSessionWithURL_propertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "assetForNSURLSessionWithURL:propertyList:");
}

id objc_msgSend_assetOptionsPlist(void *a1, const char *a2, ...)
{
  return _[a1 assetOptionsPlist];
}

id objc_msgSend_assetTitle(void *a1, const char *a2, ...)
{
  return _[a1 assetTitle];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMethod];
}

id objc_msgSend_avAssetDownloadChildDownloadSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 avAssetDownloadChildDownloadSessionIdentifier];
}

id objc_msgSend_avAssetDownloadsDirectory(void *a1, const char *a2, ...)
{
  return _[a1 avAssetDownloadsDirectory];
}

id objc_msgSend_avAssetForURL_downloadToken_(void *a1, const char *a2, ...)
{
  return [a1 avAssetForURL:x0];
}

id objc_msgSend_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didReceiveDownloadToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTask:didResolveMediaSelectionProperyList:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadToURL_(void *a1, const char *a2, ...)
{
  return [a1 backgroundAVAssetDownloadTask:willDownloadToURL:];
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadVariants_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTask:willDownloadVariants:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_backgroundDataTask_didReceiveData_withReply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundDataTask:didReceiveData:withReply:];
}

id objc_msgSend_backgroundDataTaskDidBecomeDownloadTask_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundDataTaskDidBecomeDownloadTask:");
}

id objc_msgSend_backgroundDownloadTask_didFinishDownloadingToURL_response_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundDownloadTask:didFinishDownloadingToURL:response:reply:");
}

id objc_msgSend_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes_(void *a1, const char *a2, ...)
{
  return [a1 backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:];
}

id objc_msgSend_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:")];
}

id objc_msgSend_backgroundSessionDidFinishAppWake_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundSessionDidFinishAppWake:reply:");
}

id objc_msgSend_backgroundSessionDidStartAppWake_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundSessionDidStartAppWake:reply:");
}

id objc_msgSend_backgroundTask__willSendRequestForEstablishedConnection_reply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:_willSendRequestForEstablishedConnection:reply:];
}

id objc_msgSend_backgroundTask_didCompleteWithError_taskMetrics_info_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundTask:didCompleteWithError:taskMetrics:info:reply:");
}

id objc_msgSend_backgroundTask_didReceiveChallenge_reply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:didReceiveChallenge:reply:];
}

id objc_msgSend_backgroundTask_didReceiveInformationalResponse_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:didReceiveInformationalResponse:];
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:didReceiveResponse:transactionMetrics:];
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_reply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:didReceiveResponse:transactionMetrics:reply:];
}

id objc_msgSend_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:];
}

id objc_msgSend_backgroundTask_getAuthHeadersForResponse_reply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:getAuthHeadersForResponse:reply:];
}

id objc_msgSend_backgroundTask_hasConnectionWaitingWithError_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:hasConnectionWaitingWithError:];
}

id objc_msgSend_backgroundTask_needNewBodyStream_withReply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:needNewBodyStream:withReply:];
}

id objc_msgSend_backgroundTask_willBeginDelayedRequest_reply_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTask:willBeginDelayedRequest:reply:];
}

id objc_msgSend_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "backgroundTask:willPerformHTTPRedirection:withNewRequest:reply:");
}

id objc_msgSend_backgroundTaskDidResume_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskDidResume:];
}

id objc_msgSend_backgroundTaskDidSuspend_(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskDidSuspend:];
}

id objc_msgSend_backgroundUpdatesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 backgroundUpdatesEnabled];
}

id objc_msgSend_baseMessage(void *a1, const char *a2, ...)
{
  return _[a1 baseMessage];
}

id objc_msgSend_basePriority(void *a1, const char *a2, ...)
{
  return _[a1 basePriority];
}

id objc_msgSend_basePrioritySetExplicitly(void *a1, const char *a2, ...)
{
  return _[a1 basePrioritySetExplicitly];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginActivityWithOptions_reason_(void *a1, const char *a2, ...)
{
  return [a1 beginActivityWithOptions:];
}

id objc_msgSend_bgSessionManagerInterface(void *a1, const char *a2, ...)
{
  return _[a1 bgSessionManagerInterface];
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return _[a1 bodyData];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bumpAndReturnOutgoingSequenceNumberForPriority_(void *a1, const char *a2, ...)
{
  return [a1 bumpAndReturnOutgoingSequenceNumberForPriority:];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDForPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bundleIDForPrimaryIdentifier:secondaryIdentifier:];
}

id objc_msgSend_bundleIDFromPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bundleIDFromPrimaryIdentifier:secondaryIdentifier:");
}

id objc_msgSend_bundleIDsForAppProxies_(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsForAppProxies:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleManagerPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleManagerPath:];
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesPerSecondLimit(void *a1, const char *a2, ...)
{
  return _[a1 bytesPerSecondLimit];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_canBeSuspended(void *a1, const char *a2, ...)
{
  return _[a1 canBeSuspended];
}

id objc_msgSend_canLaunchProcessWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 canLaunchProcessWithIdentifier:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAVDownloadAndFailTaskWithIdentifier_withError_(void *a1, const char *a2, ...)
{
  return [a1 cancelAVDownloadAndFailTaskWithIdentifier:withError:];
}

id objc_msgSend_cancelAndDeliverError_(void *a1, const char *a2, ...)
{
  return [a1 cancelAndDeliverError:];
}

id objc_msgSend_cancelByProducingResumeData_(void *a1, const char *a2, ...)
{
  return [a1 cancelByProducingResumeData:];
}

id objc_msgSend_cancelDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _[a1 cancelDelayedCompletionWakeTimer];
}

id objc_msgSend_cancelMonitorForTask_(void *a1, const char *a2, ...)
{
  return [a1 cancelMonitorForTask:];
}

id objc_msgSend_cancelTCPConnectionForTask_withError_(void *a1, const char *a2, ...)
{
  return [a1 cancelTCPConnectionForTask:withError:];
}

id objc_msgSend_cancelTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelTaskWithIdentifier:];
}

id objc_msgSend_cancelTasksRequiringClientConnectionAndResumeUnstartedTasks(void *a1, const char *a2, ...)
{
  return _[a1 cancelTasksRequiringClientConnectionAndResumeUnstartedTasks];
}

id objc_msgSend_cancelThroughputMonitorForWrapper_(void *a1, const char *a2, ...)
{
  return [a1 cancelThroughputMonitorForWrapper:];
}

id objc_msgSend_cancel_with_error_(void *a1, const char *a2, ...)
{
  return [a1 cancel_with_error:];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return _[a1 certificates];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 checkResourceIsReachableAndReturnError:];
}

id objc_msgSend_chronoKitExtensionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "chronoKitExtensionWithIdentifier:");
}

id objc_msgSend_cleanupSessionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 cleanupSessionWithCompletionHandler:];
}

id objc_msgSend_cleanupWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 cleanupWithCompletionHandler:];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientAcknowledgedTerminalCallbackForTask_(void *a1, const char *a2, ...)
{
  return [a1 clientAcknowledgedTerminalCallbackForTask:];
}

id objc_msgSend_clientApplicationWasReinstalled(void *a1, const char *a2, ...)
{
  return _[a1 clientApplicationWasReinstalled];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return _[a1 clientBundleID];
}

id objc_msgSend_clientDidDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 clientDidDisconnect];
}

id objc_msgSend_clientErrorForError_(void *a1, const char *a2, ...)
{
  return [a1 clientErrorForError:];
}

id objc_msgSend_clientIsActive(void *a1, const char *a2, ...)
{
  return _[a1 clientIsActive];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_closeRead(void *a1, const char *a2, ...)
{
  return _[a1 closeRead];
}

id objc_msgSend_closeWrite(void *a1, const char *a2, ...)
{
  return _[a1 closeWrite];
}

id objc_msgSend_cloudContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cloudContainerWithIdentifier:];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithClientConfiguration_discretionary_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithClientConfiguration:discretionary:];
}

id objc_msgSend_configureAdditionalPropertiesOnTask_taskInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "configureAdditionalPropertiesOnTask:taskInfo:");
}

id objc_msgSend_configureTask_withTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 configureTask:withTaskInfo:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connection_canUseSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 connection:canUseSharedContainerIdentifier:];
}

id objc_msgSend_connectionProxyDictionary(void *a1, const char *a2, ...)
{
  return _[a1 connectionProxyDictionary];
}

id objc_msgSend_containerIDForPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerIDForPrimaryIdentifier:x0 secondaryIdentifier:x1];
}

id objc_msgSend_containerIDFromPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerIDFromPrimaryIdentifier:x0 secondaryIdentifier:x1];
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return _[a1 containerURL];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_continueLoad(void *a1, const char *a2, ...)
{
  return _[a1 continueLoad];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAndSanitizeClientConfiguration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyAndSanitizeClientConfiguration:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:x0 toURL:x1 error:x2];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countOfBytesClientExpectsToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesClientExpectsToReceive];
}

id objc_msgSend_countOfBytesClientExpectsToSend(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesClientExpectsToSend];
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToReceive];
}

id objc_msgSend_countOfBytesExpectedToSend(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToSend];
}

id objc_msgSend_countOfBytesExpectedToWrite(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToWrite];
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesReceived];
}

id objc_msgSend_countOfBytesSent(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesSent];
}

id objc_msgSend_countOfBytesWritten(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesWritten];
}

id objc_msgSend_createActivityGroup_(void *a1, const char *a2, ...)
{
  return [a1 createActivityGroup:];
}

id objc_msgSend_createDaemonDirectory(void *a1, const char *a2, ...)
{
  return _[a1 createDaemonDirectory];
}

id objc_msgSend_createDataVaultDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return [a1 createDataVaultDirectoryAtPath:];
}

id objc_msgSend_createDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_createIdentityFromEndpoint_error_(void *a1, const char *a2, ...)
{
  return [a1 createIdentityFromEndpoint:x0 error:x1];
}

id objc_msgSend_createNewTaskFromInfo_(void *a1, const char *a2, ...)
{
  return [a1 createNewTaskFromInfo:];
}

id objc_msgSend_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return [a1 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:];
}

id objc_msgSend_createResumeDataForTaskInfo(void *a1, const char *a2, ...)
{
  return _[a1 createResumeDataForTaskInfo];
}

id objc_msgSend_createResumeInformation_(void *a1, const char *a2, ...)
{
  return [a1 createResumeInformation:];
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return _[a1 creationTime];
}

id objc_msgSend_credStorage_allCredentialsWithReply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "credStorage_allCredentialsWithReply:");
}

id objc_msgSend_credStorage_credentialsForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "credStorage_credentialsForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_defaultCredentialForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "credStorage_defaultCredentialForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_getInitialCredentialDictionariesWithReply_(void *a1, const char *a2, ...)
{
  return [a1 credStorage_getInitialCredentialDictionariesWithReply:];
}

id objc_msgSend_credStorage_setCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "credStorage_setCredential:forProtectionSpace:");
}

id objc_msgSend_credStorage_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return [a1 credStorage_setDefaultCredential:forProtectionSpace:];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _[a1 credential];
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return [a1 credentialForTrust:];
}

id objc_msgSend_credentialWithIdentity_certificates_persistence_(void *a1, const char *a2, ...)
{
  return [a1 credentialWithIdentity:x0 certificates:x1 persistence:x2];
}

id objc_msgSend_credentialWithUser_password_persistence_(void *a1, const char *a2, ...)
{
  return [a1 credentialWithUser:password:persistence:];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDiscretionaryStatus_withOptionalTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 currentDiscretionaryStatus:withOptionalTaskInfo:];
}

id objc_msgSend_currentIntervalDuration(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalDuration];
}

id objc_msgSend_currentIntervalEndDelta(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalEndDelta];
}

id objc_msgSend_currentIntervalThroughputThreshold(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalThroughputThreshold];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _[a1 currentPersona];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentRequestDelay(void *a1, const char *a2, ...)
{
  return _[a1 currentRequestDelay];
}

id objc_msgSend_currentRequest_URL(void *a1, const char *a2, ...)
{
  return [a1 currentRequest_URL];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentThroughputThreshold(void *a1, const char *a2, ...)
{
  return _[a1 currentThroughputThreshold];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:x0 format:x1 options:x2 error:x3];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultCredentialForProtectionSpace_(void *a1, const char *a2, ...)
{
  return [a1 defaultCredentialForProtectionSpace:x0];
}

id objc_msgSend_defaultDownloadDirectoryContainer(void *a1, const char *a2, ...)
{
  return _[a1 defaultDownloadDirectoryContainer];
}

id objc_msgSend_defaultDownloadDirectoryForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 defaultDownloadDirectoryForBundleID:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 defaultPairedDevice];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultTaskGroup(void *a1, const char *a2, ...)
{
  return _[a1 defaultTaskGroup];
}

id objc_msgSend_defaultWindowDurationForResourceTimeout_(void *a1, const char *a2, ...)
{
  return [a1 defaultWindowDurationForResourceTimeout:];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegateImplementsDidReceiveResponse(void *a1, const char *a2, ...)
{
  return _[a1 delegateImplementsDidReceiveResponse];
}

id objc_msgSend_delegateImplementsSessionAuthChallenge(void *a1, const char *a2, ...)
{
  return _[a1 delegateImplementsSessionAuthChallenge];
}

id objc_msgSend_delegateImplementsTaskAuthChallenge(void *a1, const char *a2, ...)
{
  return _[a1 delegateImplementsTaskAuthChallenge];
}

id objc_msgSend_delegateImplementsWillPerformRedirection(void *a1, const char *a2, ...)
{
  return _[a1 delegateImplementsWillPerformRedirection];
}

id objc_msgSend_delegateImplementsWillSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 delegateImplementsWillSendRequest];
}

id objc_msgSend_descriptionForRequest_(void *a1, const char *a2, ...)
{
  return [a1 descriptionForRequest:];
}

id objc_msgSend_descriptionForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 descriptionForTaskWithIdentifier:];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _[a1 destinationURL];
}

id objc_msgSend_destinationURLToUseForTask_(void *a1, const char *a2, ...)
{
  return [a1 destinationURLToUseForTask:];
}

id objc_msgSend_deviceIDForNRDevice_(void *a1, const char *a2, ...)
{
  return [a1 deviceIDForNRDevice:];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_disableTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 disableTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_disablesRetry(void *a1, const char *a2, ...)
{
  return _[a1 disablesRetry];
}

id objc_msgSend_disavowSession(void *a1, const char *a2, ...)
{
  return _[a1 disavowSession];
}

id objc_msgSend_discretionaryOverride(void *a1, const char *a2, ...)
{
  return _[a1 discretionaryOverride];
}

id objc_msgSend_disposition(void *a1, const char *a2, ...)
{
  return _[a1 disposition];
}

id objc_msgSend_doesAVAssetDownloadSessionSupportMultipleDownloads(void *a1, const char *a2, ...)
{
  return _[a1 doesAVAssetDownloadSessionSupportMultipleDownloads];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadAsset_(void *a1, const char *a2, ...)
{
  return [a1 downloadAsset:];
}

id objc_msgSend_downloadConfig(void *a1, const char *a2, ...)
{
  return _[a1 downloadConfig];
}

id objc_msgSend_downloadDirectoryToUse_(void *a1, const char *a2, ...)
{
  return [a1 downloadDirectoryToUse:];
}

id objc_msgSend_downloadFile(void *a1, const char *a2, ...)
{
  return _[a1 downloadFile];
}

id objc_msgSend_downloadFileURL(void *a1, const char *a2, ...)
{
  return _[a1 downloadFileURL];
}

id objc_msgSend_downloadSession(void *a1, const char *a2, ...)
{
  return _[a1 downloadSession];
}

id objc_msgSend_downloadTaskWithResumeData_(void *a1, const char *a2, ...)
{
  return [a1 downloadTaskWithResumeData:];
}

id objc_msgSend_downloadToken(void *a1, const char *a2, ...)
{
  return _[a1 downloadToken];
}

id objc_msgSend_drainCallback_(void *a1, const char *a2, ...)
{
  return [a1 drainCallback:];
}

id objc_msgSend_drainCallbacksForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 drainCallbacksForTaskIdentifier:];
}

id objc_msgSend_dropBoost(void *a1, const char *a2, ...)
{
  return _[a1 dropBoost];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_earliestBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 earliestBeginDate];
}

id objc_msgSend_embeddedApplicationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 embeddedApplicationIdentifier];
}

id objc_msgSend_enableSPIDelegateCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 enableSPIDelegateCallbacks];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endActivity_(void *a1, const char *a2, ...)
{
  return [a1 endActivity:];
}

id objc_msgSend_endBridgingUMTask_(void *a1, const char *a2, ...)
{
  return [a1 endBridgingUMTask:];
}

id objc_msgSend_endUMTask_(void *a1, const char *a2, ...)
{
  return [a1 endUMTask:];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _[a1 endowmentNamespaces];
}

id objc_msgSend_endpointWithCEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 endpointWithCEndpoint:];
}

id objc_msgSend_enqueueTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 enqueueTaskWithIdentifier:];
}

id objc_msgSend_ensureAVAssetDownloadSessionWrapperForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "ensureAVAssetDownloadSessionWrapperForTaskIdentifier:");
}

id objc_msgSend_ensureSessionDownloadDirectoryExists(void *a1, const char *a2, ...)
{
  return _[a1 ensureSessionDownloadDirectoryExists];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtURL:x0 includingPropertiesForKeys:x1 options:x2 errorHandler:x3];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_error_code_(void *a1, const char *a2, ...)
{
  return [a1 error:code:];
}

id objc_msgSend_errorIfBlockedTracker_url_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorIfBlockedTracker:url:");
}

id objc_msgSend_errorOccurredDuringAuthCallbackDelivery_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorOccurredDuringAuthCallbackDelivery:completionHandler:");
}

id objc_msgSend_errorOccurredDuringFinishedCallbackDelivery_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorOccurredDuringFinishedCallbackDelivery:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_establishedConnection(void *a1, const char *a2, ...)
{
  return _[a1 establishedConnection];
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return _[a1 exitEvent];
}

id objc_msgSend_expectedProgressTarget(void *a1, const char *a2, ...)
{
  return _[a1 expectedProgressTarget];
}

id objc_msgSend_expectingResumeCallback(void *a1, const char *a2, ...)
{
  return _[a1 expectingResumeCallback];
}

id objc_msgSend_explanation(void *a1, const char *a2, ...)
{
  return _[a1 explanation];
}

id objc_msgSend_extension_isHandlingBackgroundSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extension:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointRecord];
}

id objc_msgSend_fetchStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 fetchStreamingZipModificationDate:];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileProviderWithIdentifer_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fileProviderWithIdentifer:applicationIdentifier:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithFileSystemRepresentation:x0 isDirectory:x1 relativeToURL:x2];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:x0 isDirectory:x1 relativeToURL:x2];
}

id objc_msgSend_fillInByteCountsForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fillInByteCountsForTaskInfo:withTaskID:");
}

id objc_msgSend_fillInPropertiesForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return [a1 fillInPropertiesForTaskInfo:withTaskID:];
}

id objc_msgSend_finalizeTaskCompletionWithSuppressedWake_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "finalizeTaskCompletionWithSuppressedWake:");
}

id objc_msgSend_findBestAssetFrom_skipDownload_(void *a1, const char *a2, ...)
{
  return [a1 findBestAssetFrom:skipDownload:];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 finishTasksAndInvalidate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getBackgroundSettingsAppList(void *a1, const char *a2, ...)
{
  return _[a1 getBackgroundSettingsAppList];
}

id objc_msgSend_getBoundStreamsWithBufferSize_inputStream_outputStream_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getBoundStreamsWithBufferSize:inputStream:outputStream:")
}

id objc_msgSend_getClientProxy(void *a1, const char *a2, ...)
{
  return _[a1 getClientProxy];
}

id objc_msgSend_getComponentsForFullIdentifier_bundleIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getComponentsForFullIdentifier:x0 bundleIdentifier:x1 sessionIdentifier:x2];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalFileUrl];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_getSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getSessionWithIdentifier:];
}

id objc_msgSend_getSessionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return [a1 getSessionWithIdentifier:x0 forBundleID:x1];
}

id objc_msgSend_getTLSSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _[a1 getTLSSessionCachePrefix];
}

id objc_msgSend_getTasksForReconnection(void *a1, const char *a2, ...)
{
  return _[a1 getTasksForReconnection];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerURLs];
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return [a1 groupWithName:x0 maxConcurrent:x1];
}

id objc_msgSend_handleCancelTaskMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 handleCancelTaskMessage:forTaskIdentifier:];
}

id objc_msgSend_handleCompletionOfTask_identifier_taskInfo_isRecoverable_suppressWake_(void *a1, const char *a2, ...)
{
  return [a1 handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:];
}

id objc_msgSend_handleDataTaskWithRequestMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return [a1 handleDataTaskWithRequestMessage:forTaskIdentifier:withReply:];
}

id objc_msgSend_handleEarliestBeginDateForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleEarliestBeginDateForTaskWithIdentifier:completionHandler:];
}

id objc_msgSend_handleFailedMessageSend_ofType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailedMessageSend:ofType:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return [a1 handleForPredicate:error:];
}

id objc_msgSend_handleInvalidateMessage_(void *a1, const char *a2, ...)
{
  return [a1 handleInvalidateMessage:];
}

id objc_msgSend_handleMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return [a1 handleMessage:ofType:withReply:];
}

id objc_msgSend_handleNewConnection_(void *a1, const char *a2, ...)
{
  return [a1 handleNewConnection:];
}

id objc_msgSend_handleOpenSocketMessage_withReply_(void *a1, const char *a2, ...)
{
  return [a1 handleOpenSocketMessage:x0 withReply:x1];
}

id objc_msgSend_handleResumeTaskMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleResumeTaskMessage:forTaskIdentifier:withReply:");
}

id objc_msgSend_handleSchemaVersionChange(void *a1, const char *a2, ...)
{
  return _[a1 handleSchemaVersionChange];
}

id objc_msgSend_handleSetDescriptionMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleSetDescriptionMessage:forTaskIdentifier:");
}

id objc_msgSend_handleSetPriorityMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 handleSetPriorityMessage:forTaskIdentifier:];
}

id objc_msgSend_handleSuspendTaskMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 handleSuspendTaskMessage:forTaskIdentifier:];
}

id objc_msgSend_handleUploadBodyDataMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleUploadBodyDataMessage:forTaskIdentifier:withReply:");
}

id objc_msgSend_handleWillBeginDelayedRequestForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleWillBeginDelayedRequestForTaskWithIdentifier:completionHandler:");
}

id objc_msgSend_hasBackgroundTaskCompletion(void *a1, const char *a2, ...)
{
  return _[a1 hasBackgroundTaskCompletion];
}

id objc_msgSend_hasBeenCalled(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenCalled];
}

id objc_msgSend_hasBodyStream(void *a1, const char *a2, ...)
{
  return _[a1 hasBodyStream];
}

id objc_msgSend_hasConnectedClient(void *a1, const char *a2, ...)
{
  return _[a1 hasConnectedClient];
}

id objc_msgSend_hasCredential(void *a1, const char *a2, ...)
{
  return _[a1 hasCredential];
}

id objc_msgSend_hasDelegateImplementsDidReceiveResponse(void *a1, const char *a2, ...)
{
  return _[a1 hasDelegateImplementsDidReceiveResponse];
}

id objc_msgSend_hasDelegateImplementsSessionAuthChallenge(void *a1, const char *a2, ...)
{
  return _[a1 hasDelegateImplementsSessionAuthChallenge];
}

id objc_msgSend_hasDelegateImplementsTaskAuthChallenge(void *a1, const char *a2, ...)
{
  return _[a1 hasDelegateImplementsTaskAuthChallenge];
}

id objc_msgSend_hasDelegateImplementsWillPerformRedirection(void *a1, const char *a2, ...)
{
  return _[a1 hasDelegateImplementsWillPerformRedirection];
}

id objc_msgSend_hasDelegateImplementsWillSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 hasDelegateImplementsWillSendRequest];
}

id objc_msgSend_hasDisposition(void *a1, const char *a2, ...)
{
  return _[a1 hasDisposition];
}

id objc_msgSend_hasForegroundBackgroundStates(void *a1, const char *a2, ...)
{
  return _[a1 hasForegroundBackgroundStates];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasRequest(void *a1, const char *a2, ...)
{
  return _[a1 hasRequest];
}

id objc_msgSend_hasSession(void *a1, const char *a2, ...)
{
  return _[a1 hasSession];
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return _[a1 hasStarted];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hasTask(void *a1, const char *a2, ...)
{
  return _[a1 hasTask];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerData(void *a1, const char *a2, ...)
{
  return _[a1 headerData];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierIsForSpringBoardApplication_(void *a1, const char *a2, ...)
{
  return [a1 identifierIsForSpringBoardApplication:];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return _[a1 identity];
}

id objc_msgSend_idsPriority(void *a1, const char *a2, ...)
{
  return _[a1 idsPriority];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 incomingResponseIdentifier];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 initForReadingFromData:x0 error:x1];
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return [a1 initRequiringSecureCoding:];
}

id objc_msgSend_initSocketWithDevice_options_completionHandler_queue_(void *a1, const char *a2, ...)
{
  return [a1 initSocketWithDevice:options:completionHandler:queue:];
}

id objc_msgSend_initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithAVAggregateDownloadTaskNoChildTaskKindWithURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_enableSPIDelegateCallbacks_(void *a1, const char *a2, ...)
{
  return [a1 initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:x0 destinationURL:x1 assetTitle:x2 assetArtworkData:x3 options:x4 taskIdentifier:x5 uniqueIdentifier:x6 bundleID:x7 sessionID:x8 enableSPIDelegateCallbacks:x9];
}

id objc_msgSend_initWithAVAssetDownloadURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_downloadConfig_(void *a1, const char *a2, ...)
{
  return [a1 initWithAVAssetDownloadURL:x0 destinationURL:x1 assetTitle:x2 assetArtworkData:x3 options:x4 taskIdentifier:x5 uniqueIdentifier:x6 bundleID:x7 sessionID:x8 downloadConfig:x9];
}

id objc_msgSend_initWithAsset_propertyList_(void *a1, const char *a2, ...)
{
  return [a1 initWithAsset:x0 propertyList:x1];
}

id objc_msgSend_initWithBackgroundTaskInfo_taskGroup_(void *a1, const char *a2, ...)
{
  return [a1 initWithBackgroundTaskInfo:taskInfo taskGroup:taskGroup];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:error:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithCallbackType_taskIdentifier_args_(void *a1, const char *a2, ...)
{
  return [a1 initWithCallbackType:x0 taskIdentifier:x1 args:x2];
}

id objc_msgSend_initWithClient_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithClient:identifier:];
}

id objc_msgSend_initWithConfiguration_bundleID_isSpringBoardApp_downloadDirectory_options_clientProxy_delegate_workQueue_db_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:v1 bundleID:v2 isSpringBoardApp:v3 downloadDirectory:v4 options:v5 clientProxy:v6 delegate:v7 workQueue:v8 db:v9];
}

id objc_msgSend_initWithConfiguration_uuidString_options_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:x0 uuidString:x1 options:x2 delegate:x3];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithDataTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataTask:x0 uniqueIdentifier:x1 bundleID:x2 sessionID:x3];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_bundleID_isSpringBoardApp_forPersona_dataSeparatedPath_db_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:a2 bundleID:a3 isSpringBoardApp:a4 forPersona:a5 dataSeparatedPath:a6 db:a7];
}

id objc_msgSend_initWithDelegate_forBundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:forBundleID:];
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:v2 queue:v3];
}

id objc_msgSend_initWithDownloadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:x0 target:x1 attributes:x2];
}

id objc_msgSend_initWithHost_port_protocol_realm_authenticationMethod_(void *a1, const char *a2, ...)
{
  return [a1 initWithHost:x0 port:x1 protocol:x2 realm:x3 authenticationMethod:x4];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithIdentifier_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 applicationIdentifier:x1];
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyOptions:valueOptions:capacity:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMessage_type_(void *a1, const char *a2, ...)
{
  return [a1 initWithMessage:type:];
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtobufData:x0 type:x1 isResponse:x2];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithTask_taskInfo_clientBundleIdentifier_secondaryIdentifier_monitoredApplication_priority_options_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithURL_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 destinationURL:x1 options:x2 delegate:x3 queue:x4];
}

id objc_msgSend_initWithURLAsset_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLAsset:x0 destinationURL:x1 options:x2 delegate:x3 queue:x4];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithUploadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithUploadTask:x0 uniqueIdentifier:x1 bundleID:x2 sessionID:x3];
}

id objc_msgSend_initWithWrapper_monitoredApplication_priority_options_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithWrapper:a2 monitoredApplication:a3 priority:a4 options:a5 queue:a6];
}

id objc_msgSend_initializeHTTPAuthenticatorWithAppleIDContext_statusCodes_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:");
}

id objc_msgSend_initializedWithAVAsset(void *a1, const char *a2, ...)
{
  return _[a1 initializedWithAVAsset];
}

id objc_msgSend_inputStreamWithData_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithData:];
}

id objc_msgSend_inputStreamWithFileHandle_taskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithFileHandle:taskIdentifier:];
}

id objc_msgSend_installedAssetVersion(void *a1, const char *a2, ...)
{
  return _[a1 installedAssetVersion];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateReply(void *a1, const char *a2, ...)
{
  return _[a1 invalidateReply];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isCatalogFetchedWithinThePastFewDays_(void *a1, const char *a2, ...)
{
  return [a1 isCatalogFetchedWithinThePastFewDays:];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isContainerIDForeground_(void *a1, const char *a2, ...)
{
  return [a1 isContainerIDForeground:];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 isDiscretionary];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return _[a1 isForeground];
}

id objc_msgSend_isHandlingBackgroundURLSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return [a1 isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:];
}

id objc_msgSend_isInSyncBubble(void *a1, const char *a2, ...)
{
  return _[a1 isInSyncBubble];
}

id objc_msgSend_isInTransitionalDiscretionaryPeriod(void *a1, const char *a2, ...)
{
  return _[a1 isInTransitionalDiscretionaryPeriod];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 isMultiUser];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isPrivileged(void *a1, const char *a2, ...)
{
  return _[a1 isPrivileged];
}

id objc_msgSend_isResponse(void *a1, const char *a2, ...)
{
  return _[a1 isResponse];
}

id objc_msgSend_isResumable(void *a1, const char *a2, ...)
{
  return _[a1 isResumable];
}

id objc_msgSend_isSpringBoardApp(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardApp];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidAssertion_withName_(void *a1, const char *a2, ...)
{
  return [a1 isValidAssertion:withName:];
}

id objc_msgSend_itemShouldBePurged_(void *a1, const char *a2, ...)
{
  return [a1 itemShouldBePurged:];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_knownSZExtractorImplementations(void *a1, const char *a2, ...)
{
  return _[a1 knownSZExtractorImplementations];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchProcessWithIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 launchProcessWithIdentifier:sessionIdentifier:];
}

id objc_msgSend_launchUUID(void *a1, const char *a2, ...)
{
  return _[a1 launchUUID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadingPriority(void *a1, const char *a2, ...)
{
  return _[a1 loadingPriority];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowThroughputTimerRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 lowThroughputTimerRetryCount];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_makeTempUploadFile_withExtensionData_(void *a1, const char *a2, ...)
{
  return [a1 makeTempUploadFile:withExtensionData:];
}

id objc_msgSend_managerBecameEmpty_bundleID_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 managerBecameEmpty:bundleID:withCompletionHandler:];
}

id objc_msgSend_markItemAsPurged_(void *a1, const char *a2, ...)
{
  return [a1 markItemAsPurged:];
}

id objc_msgSend_mayBeDemotedToDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 mayBeDemotedToDiscretionary];
}

id objc_msgSend_maySupportWakesLater(void *a1, const char *a2, ...)
{
  return _[a1 maySupportWakesLater];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return [a1 mergeFrom:];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageLoggableDescriptionForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "messageLoggableDescriptionForTaskWithIdentifier:");
}

id objc_msgSend_messagePriorityForTaskWithIdentifier_isReply_(void *a1, const char *a2, ...)
{
  return [a1 messagePriorityForTaskWithIdentifier:isReply:];
}

id objc_msgSend_messageSubclassForMessageType_isReply_(void *a1, const char *a2, ...)
{
  return [a1 messageSubclassForMessageType:isReply:];
}

id objc_msgSend_migrateSchemaToLatestVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "migrateSchemaToLatestVersion:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_monitoredAppBundleID(void *a1, const char *a2, ...)
{
  return _[a1 monitoredAppBundleID];
}

id objc_msgSend_monitoredBundleIDsUpdated(void *a1, const char *a2, ...)
{
  return _[a1 monitoredBundleIDsUpdated];
}

id objc_msgSend_moveFileAtomically_toLocation_(void *a1, const char *a2, ...)
{
  return [a1 moveFileAtomically:toLocation:];
}

id objc_msgSend_moveInstalledAsset_withVersion_(void *a1, const char *a2, ...)
{
  return [a1 moveInstalledAsset:withVersion:];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_networkServiceType(void *a1, const char *a2, ...)
{
  return _[a1 networkServiceType];
}

id objc_msgSend_newAVAssetDownloadSessionWrapperForTaskInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "newAVAssetDownloadSessionWrapperForTaskInfo:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_nsurlsessiondLaunchdPath(void *a1, const char *a2, ...)
{
  return _[a1 nsurlsessiondLaunchdPath];
}

id objc_msgSend_nsurlsessiondPath(void *a1, const char *a2, ...)
{
  return _[a1 nsurlsessiondPath];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_obliterate(void *a1, const char *a2, ...)
{
  return _[a1 obliterate];
}

id objc_msgSend_obliterationCompletion(void *a1, const char *a2, ...)
{
  return _[a1 obliterationCompletion];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openFileAtPath_mode_withReply_(void *a1, const char *a2, ...)
{
  return [a1 openFileAtPath:x0 mode:x1 withReply:x2];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 optionsWithDictionary:];
}

id objc_msgSend_originalNetworkContentURL(void *a1, const char *a2, ...)
{
  return _[a1 originalNetworkContentURL];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _[a1 originalRequest];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingResponseIdentifier];
}

id objc_msgSend_parametersWithCParameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parametersWithCParameters:");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathToDownloadTaskFile(void *a1, const char *a2, ...)
{
  return _[a1 pathToDownloadTaskFile];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_performAllCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 performAllCallbacks];
}

id objc_msgSend_performCallback_(void *a1, const char *a2, ...)
{
  return [a1 performCallback:];
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_delay_(void *a1, const char *a2, ...)
{
  return [a1 performCallbackAfterNetworkChangedEvent:identifier:delay:];
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_numberOfPreviousRetries_(void *a1, const char *a2, ...)
{
  return [a1 performCallbackAfterNetworkChangedEvent:identifier:numberOfPreviousRetries:];
}

id objc_msgSend_performCommonSetupForTask_taskInfo_identifier_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return [a1 performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:];
}

id objc_msgSend_performForwardingFromStreamTask_toTCPConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "performForwardingFromStreamTask:toTCPConnection:");
}

id objc_msgSend_performForwardingFromTCPConnection_toStreamTask_(void *a1, const char *a2, ...)
{
  return [a1 performForwardingFromTCPConnection:toStreamTask:];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_performWake_uponNotification_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 performWake:uponNotification:sessionIdentifier:];
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return _[a1 persistence];
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return [a1 persistentDomainForName:];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 personaUniqueString];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pluginIdentifier];
}

id objc_msgSend_populateWithInitialCredentials(void *a1, const char *a2, ...)
{
  return _[a1 populateWithInitialCredentials];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingBundleIdentifier:];
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return _[a1 previousFailureCount];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_priorityForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return [a1 priorityForDiscretionaryStatus:];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_propertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return [a1 propertyForKey:inRequest:];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return _[a1 propertyList];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [a1 propertyListWithData:x0 options:x1 format:x2 error:x3];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return _[a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_providerIDForApplication_sharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "providerIDForApplication:sharedContainerIdentifier:");
}

id objc_msgSend_providerIDForBundle_sharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "providerIDForBundle:sharedContainerIdentifier:");
}

id objc_msgSend_proxyServerBecameInvalid_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "proxyServerBecameInvalid:");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return [a1 purge:];
}

id objc_msgSend_qos(void *a1, const char *a2, ...)
{
  return _[a1 qos];
}

id objc_msgSend_queryAndFindBestAsset_(void *a1, const char *a2, ...)
{
  return [a1 queryAndFindBestAsset:];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueUpdatesForTask_updateType_highPriority_(void *a1, const char *a2, ...)
{
  return [a1 queueUpdatesForTask:updateType:highPriority:];
}

id objc_msgSend_readDataOfMinLength_maxLength_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 readDataOfMinLength:x0 maxLength:x1 timeout:x2 completionHandler:x3];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return _[a1 realm];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reconnectClient_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 reconnectClient:withCompletion:];
}

id objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 registerUserSyncStakeholder:withMachServiceName:];
}

id objc_msgSend_releaseAssertionForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 releaseAssertionForBundleID:sessionID:];
}

id objc_msgSend_releaseBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _[a1 releaseBTLinkAssertion];
}

id objc_msgSend_releaseBTLinkAssertionIfNecessary_(void *a1, const char *a2, ...)
{
  return [a1 releaseBTLinkAssertionIfNecessary:];
}

id objc_msgSend_releaseInfraWiFi(void *a1, const char *a2, ...)
{
  return _[a1 releaseInfraWiFi];
}

id objc_msgSend_releaseInfraWiFiForTaskIfNecessary_(void *a1, const char *a2, ...)
{
  return [a1 releaseInfraWiFiForTaskIfNecessary:];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 releasePowerAssertion];
}

id objc_msgSend_releaseTransaction(void *a1, const char *a2, ...)
{
  return _[a1 releaseTransaction];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 removeCharactersInString:];
}

id objc_msgSend_removeCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return [a1 removeCredential:forProtectionSpace:];
}

id objc_msgSend_removeDownloadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeDownloadFileForTaskInfo:");
}

id objc_msgSend_removeItemAtPath_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeItemAtURL_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:x0 error:x1];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_forApplication_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forApplication:];
}

id objc_msgSend_removeObserver_forContainerID_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forContainerID:];
}

id objc_msgSend_removeObserver_forExtension_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forExtension:];
}

id objc_msgSend_removeObserver_forProviderID_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forProviderID:];
}

id objc_msgSend_removeOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeOutstandingTaskWithIdentifier:];
}

id objc_msgSend_removePendingLaunchForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 removePendingLaunchForBundleID:sessionID:];
}

id objc_msgSend_removePendingWakeForClient_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removePendingWakeForClient:sessionIdentifier:];
}

id objc_msgSend_removeStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 removeStreamingZipModificationDate:];
}

id objc_msgSend_removeUploadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 removeUploadFileForTaskInfo:];
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return [a1 replaceItemAtURL:x0 withItemAtURL:x1 backupItemName:x2 options:x3 resultingItemURL:&x4 error:&x5];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestDelayQueue(void *a1, const char *a2, ...)
{
  return _[a1 requestDelayQueue];
}

id objc_msgSend_requestWithAdjustedWindowForTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 requestWithAdjustedWindowForTaskInfo:];
}

id objc_msgSend_requeueTask_(void *a1, const char *a2, ...)
{
  return [a1 requeueTask:];
}

id objc_msgSend_requeueTask_skipResume_(void *a1, const char *a2, ...)
{
  return [a1 requeueTask:skipResume:];
}

id objc_msgSend_resendPendingMessage_(void *a1, const char *a2, ...)
{
  return [a1 resendPendingMessage:];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetStandardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 resetStandardUserDefaults];
}

id objc_msgSend_resourceTimeoutError(void *a1, const char *a2, ...)
{
  return _[a1 resourceTimeoutError];
}

id objc_msgSend_respondedToWillBeginDelayedRequestCallback(void *a1, const char *a2, ...)
{
  return _[a1 respondedToWillBeginDelayedRequestCallback];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_restoreCompletedTask_(void *a1, const char *a2, ...)
{
  return [a1 restoreCompletedTask:];
}

id objc_msgSend_restoreInProgressTask_(void *a1, const char *a2, ...)
{
  return [a1 restoreInProgressTask:];
}

id objc_msgSend_restoreOptionsFromArchivePath_(void *a1, const char *a2, ...)
{
  return [a1 restoreOptionsFromArchivePath:];
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return _[a1 restoreState];
}

id objc_msgSend_restoreState_(void *a1, const char *a2, ...)
{
  return [a1 restoreState:];
}

id objc_msgSend_restoreTask_isOutstanding_(void *a1, const char *a2, ...)
{
  return [a1 restoreTask:isOutstanding:];
}

id objc_msgSend_restoreTasks_(void *a1, const char *a2, ...)
{
  return [a1 restoreTasks:];
}

id objc_msgSend_restoreTasksFromArchivedInfo_(void *a1, const char *a2, ...)
{
  return [a1 restoreTasksFromArchivedInfo:];
}

id objc_msgSend_restoreTasksFromSqliteDB_(void *a1, const char *a2, ...)
{
  return [a1 restoreTasksFromSqliteDB:];
}

id objc_msgSend_restoredTaskActive_(void *a1, const char *a2, ...)
{
  return [a1 restoredTaskActive:];
}

id objc_msgSend_restoredTaskEnqueued_(void *a1, const char *a2, ...)
{
  return [a1 restoredTaskEnqueued:];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resumableUploadData(void *a1, const char *a2, ...)
{
  return _[a1 resumableUploadData];
}

id objc_msgSend_resumableUploadState(void *a1, const char *a2, ...)
{
  return _[a1 resumableUploadState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeTaskWithIdentifier_withProperties_(void *a1, const char *a2, ...)
{
  return [a1 resumeTaskWithIdentifier:withProperties:];
}

id objc_msgSend_resumedAndWaitingForEarliestBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 resumedAndWaitingForEarliestBeginDate];
}

id objc_msgSend_retainBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _[a1 retainBTLinkAssertion];
}

id objc_msgSend_retainBTLinkAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 retainBTLinkAssertionWithIdentifier:];
}

id objc_msgSend_retainInfraWiFi(void *a1, const char *a2, ...)
{
  return _[a1 retainInfraWiFi];
}

id objc_msgSend_retainInfraWiFiForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 retainInfraWiFiForTaskWithIdentifier:];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _[a1 retryCount];
}

id objc_msgSend_retryError(void *a1, const char *a2, ...)
{
  return _[a1 retryError];
}

id objc_msgSend_retryTask_originalError_(void *a1, const char *a2, ...)
{
  return [a1 retryTask:originalError:];
}

id objc_msgSend_retryTask_originalError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return [a1 retryTask:x0 originalError:x1 transactionMetrics:x2];
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return [a1 returnTypes:];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_rusWithResumeData_originalRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rusWithResumeData:originalRequest:");
}

id objc_msgSend_sanitizeTaskProperties_(void *a1, const char *a2, ...)
{
  return [a1 sanitizeTaskProperties:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondaryID(void *a1, const char *a2, ...)
{
  return _[a1 secondaryID];
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendProtobufMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return [a1 sendProtobufMessage:ofType:withReply:];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 sequenceNumber];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_serviceMinCompatibilityVersion(void *a1, const char *a2, ...)
{
  return _[a1 serviceMinCompatibilityVersion];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionCompleted_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sessionCompleted:withCompletionHandler:];
}

id objc_msgSend_sessionForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return [a1 sessionForDiscretionaryStatus:];
}

id objc_msgSend_sessionHasOutstandingTasks(void *a1, const char *a2, ...)
{
  return _[a1 sessionHasOutstandingTasks];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_sessionPath_forBundleID_(void *a1, const char *a2, ...)
{
  return [a1 sessionPath:forBundleID:];
}

id objc_msgSend_sessionSendsLaunchEvents(void *a1, const char *a2, ...)
{
  return _[a1 sessionSendsLaunchEvents];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAVAssetDownloadToken_(void *a1, const char *a2, ...)
{
  return [a1 setAVAssetDownloadToken:];
}

id objc_msgSend_setAVAssetURL_(void *a1, const char *a2, ...)
{
  return [a1 setAVAssetURL:];
}

id objc_msgSend_setAVURLAsset_(void *a1, const char *a2, ...)
{
  return [a1 setAVURLAsset:];
}

id objc_msgSend_setAdditionalProperties_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalProperties:];
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCellularAccess:];
}

id objc_msgSend_setAllowsConstrainedNetworkAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsConstrainedNetworkAccess:];
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsExpensiveNetworkAccess:];
}

id objc_msgSend_setArchiveList_(void *a1, const char *a2, ...)
{
  return [a1 setArchiveList:];
}

id objc_msgSend_setArgs_(void *a1, const char *a2, ...)
{
  return [a1 setArgs:];
}

id objc_msgSend_setAssetArtworkData_(void *a1, const char *a2, ...)
{
  return [a1 setAssetArtworkData:];
}

id objc_msgSend_setAssetOptionsPlist_(void *a1, const char *a2, ...)
{
  return [a1 setAssetOptionsPlist:];
}

id objc_msgSend_setAssetTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAssetTitle:];
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:ofItemAtPath:error:];
}

id objc_msgSend_setAvAssetDownloadChildDownloadSessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAvAssetDownloadChildDownloadSessionIdentifier:];
}

id objc_msgSend_setBasePriority_(void *a1, const char *a2, ...)
{
  return [a1 setBasePriority:];
}

id objc_msgSend_setBasePrioritySetExplicitly_(void *a1, const char *a2, ...)
{
  return [a1 setBasePrioritySetExplicitly:];
}

id objc_msgSend_setBodyData_(void *a1, const char *a2, ...)
{
  return [a1 setBodyData:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setBundleId:];
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObject:];
}

id objc_msgSend_setBytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return [a1 setBytesPerSecondLimit:];
}

id objc_msgSend_setBytesSent_(void *a1, const char *a2, ...)
{
  return [a1 setBytesSent:];
}

id objc_msgSend_setChallenge_(void *a1, const char *a2, ...)
{
  return [a1 setChallenge:];
}

id objc_msgSend_setCode_(void *a1, const char *a2, ...)
{
  return [a1 setCode:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setConnectionProxyDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionProxyDictionary:];
}

id objc_msgSend_setCountOfBytesClientExpectsToReceive_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesClientExpectsToReceive:];
}

id objc_msgSend_setCountOfBytesClientExpectsToSend_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesClientExpectsToSend:];
}

id objc_msgSend_setCountOfBytesExpectedToReceive_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesExpectedToReceive:];
}

id objc_msgSend_setCountOfBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesExpectedToSend:];
}

id objc_msgSend_setCountOfBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesExpectedToWrite:];
}

id objc_msgSend_setCountOfBytesReceived_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesReceived:];
}

id objc_msgSend_setCountOfBytesSent_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesSent:];
}

id objc_msgSend_setCountOfBytesWritten_(void *a1, const char *a2, ...)
{
  return [a1 setCountOfBytesWritten:];
}

id objc_msgSend_setCreationTime_(void *a1, const char *a2, ...)
{
  return [a1 setCreationTime:];
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return [a1 setCredential:];
}

id objc_msgSend_setCurrentRequest_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRequest:];
}

id objc_msgSend_setCurrentRequestDelay_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRequestDelay:];
}

id objc_msgSend_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultCredential:forProtectionSpace:];
}

id objc_msgSend_setDeferred_(void *a1, const char *a2, ...)
{
  return [a1 setDeferred:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:queue:];
}

id objc_msgSend_setDestinationURL_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationURL:];
}

id objc_msgSend_setDisablesRetry_(void *a1, const char *a2, ...)
{
  return [a1 setDisablesRetry:];
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionary:];
}

id objc_msgSend_setDiscretionaryOverride_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionaryOverride:];
}

id objc_msgSend_setDisposition_(void *a1, const char *a2, ...)
{
  return [a1 setDisposition:];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDomain:];
}

id objc_msgSend_setDownloadConfig_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadConfig:];
}

id objc_msgSend_setDownloadFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadFileURL:];
}

id objc_msgSend_setDownloadSession_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadSession:];
}

id objc_msgSend_setDownloadSize_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadSize:];
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return [a1 setEarliestBeginDate:];
}

id objc_msgSend_setEnableSPIDelegateCallbacks_(void *a1, const char *a2, ...)
{
  return [a1 setEnableSPIDelegateCallbacks:];
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return [a1 setEndowmentNamespaces:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setEstablishedConnection_(void *a1, const char *a2, ...)
{
  return [a1 setEstablishedConnection:];
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return [a1 setEvents:];
}

id objc_msgSend_setExpectedProgressTarget_(void *a1, const char *a2, ...)
{
  return [a1 setExpectedProgressTarget:];
}

id objc_msgSend_setExpectingResumeCallback_(void *a1, const char *a2, ...)
{
  return [a1 setExpectingResumeCallback:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setFileURL:];
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPAdditionalHeaders:];
}

id objc_msgSend_setHTTPBodyStream_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPBodyStream:];
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPCookieStorage:];
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMaximumConnectionsPerHost:];
}

id objc_msgSend_setHandlerQueue_(void *a1, const char *a2, ...)
{
  return [a1 setHandlerQueue:];
}

id objc_msgSend_setHasBeenCalled_(void *a1, const char *a2, ...)
{
  return [a1 setHasBeenCalled:];
}

id objc_msgSend_setHasStarted_(void *a1, const char *a2, ...)
{
  return [a1 setHasStarted:];
}

id objc_msgSend_setHeaderData_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderData:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdsPriority_(void *a1, const char *a2, ...)
{
  return [a1 setIdsPriority:];
}

id objc_msgSend_setInSyncBubble_(void *a1, const char *a2, ...)
{
  return [a1 setInSyncBubble:];
}

id objc_msgSend_setInitializedWithAVAsset_(void *a1, const char *a2, ...)
{
  return [a1 setInitializedWithAVAsset:];
}

id objc_msgSend_setInstalledAssetVersion_(void *a1, const char *a2, ...)
{
  return [a1 setInstalledAssetVersion:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidateReply_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidateReply:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsInTransitionalDiscretionaryPeriod_(void *a1, const char *a2, ...)
{
  return [a1 setIsInTransitionalDiscretionaryPeriod:];
}

id objc_msgSend_setLaunchUUID_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchUUID:];
}

id objc_msgSend_setLinkRequirementsForPeer_packetsPerSecond_inputBytesPerSecond_outputBytesPerSecond_(void *a1, const char *a2, ...)
{
  return [a1 setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:];
}

id objc_msgSend_setLoadingPriority_(void *a1, const char *a2, ...)
{
  return [a1 setLoadingPriority:];
}

id objc_msgSend_setLowThroughputTimerRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setLowThroughputTimerRetryCount:];
}

id objc_msgSend_setMayBeDemotedToDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 setMayBeDemotedToDiscretionary:];
}

id objc_msgSend_setNetworkServiceType_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkServiceType:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObliterationCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setObliterationCompletion:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOriginalRequest_(void *a1, const char *a2, ...)
{
  return [a1 setOriginalRequest:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return [a1 setPathToDownloadTaskFile:];
}

id objc_msgSend_setPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return [a1 setPersonaUniqueString:];
}

id objc_msgSend_setPreClearedMode_(void *a1, const char *a2, ...)
{
  return [a1 setPreClearedMode:];
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return [a1 setPredicates:];
}

id objc_msgSend_setPreferInfraWiFi_(void *a1, const char *a2, ...)
{
  return [a1 setPreferInfraWiFi:];
}

id objc_msgSend_setPriority_forTCPConnectionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:forTCPConnectionWithTaskIdentifier:];
}

id objc_msgSend_setPrivileged_(void *a1, const char *a2, ...)
{
  return [a1 setPrivileged:];
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:forKey:];
}

id objc_msgSend_setQos_(void *a1, const char *a2, ...)
{
  return [a1 setQos:];
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return [a1 setReason:];
}

id objc_msgSend_setReceivedData_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedData:];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}

id objc_msgSend_setRequiresInexpensiveNetworking_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresInexpensiveNetworking:];
}

id objc_msgSend_setRequiresNetwork_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresNetwork:];
}

id objc_msgSend_setRequiresPlugin_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresPlugin:];
}

id objc_msgSend_setResolvedMediaSelectionPlist_(void *a1, const char *a2, ...)
{
  return [a1 setResolvedMediaSelectionPlist:];
}

id objc_msgSend_setRespondedToWillBeginDelayedRequestCallback_(void *a1, const char *a2, ...)
{
  return [a1 setRespondedToWillBeginDelayedRequestCallback:];
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return [a1 setResponse:];
}

id objc_msgSend_setResumableUploadData_(void *a1, const char *a2, ...)
{
  return [a1 setResumableUploadData:];
}

id objc_msgSend_setResumableUploadState_(void *a1, const char *a2, ...)
{
  return [a1 setResumableUploadState:];
}

id objc_msgSend_setResumedAndWaitingForEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return [a1 setResumedAndWaitingForEarliestBeginDate:];
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setRetryCount:];
}

id objc_msgSend_setRetryError_(void *a1, const char *a2, ...)
{
  return [a1 setRetryError:];
}

id objc_msgSend_setSchedulingPriority_(void *a1, const char *a2, ...)
{
  return [a1 setSchedulingPriority:];
}

id objc_msgSend_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return [a1 setSequenceNumber:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setSessionID:];
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSessionIdentifier:];
}

id objc_msgSend_setSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSharedContainerIdentifier:];
}

id objc_msgSend_setShouldCancelOnDisconnect_(void *a1, const char *a2, ...)
{
  return [a1 setShouldCancelOnDisconnect:];
}

id objc_msgSend_setShouldUseExtendedBackgroundIdleMode_(void *a1, const char *a2, ...)
{
  return [a1 setShouldUseExtendedBackgroundIdleMode:];
}

id objc_msgSend_setSkip_download_unlink_(void *a1, const char *a2, ...)
{
  return [a1 setSkip_download_unlink:];
}

id objc_msgSend_setSocketUUID_(void *a1, const char *a2, ...)
{
  return [a1 setSocketUUID:];
}

id objc_msgSend_setStartBefore_(void *a1, const char *a2, ...)
{
  return [a1 setStartBefore:];
}

id objc_msgSend_setStartHandler_(void *a1, const char *a2, ...)
{
  return [a1 setStartHandler:];
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setStartTime:];
}

id objc_msgSend_setStartedUserInitiated_(void *a1, const char *a2, ...)
{
  return [a1 setStartedUserInitiated:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setStateDescriptor:];
}

id objc_msgSend_setStoragePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setStoragePartitionIdentifier:];
}

id objc_msgSend_setStreamErrorCode_(void *a1, const char *a2, ...)
{
  return [a1 setStreamErrorCode:];
}

id objc_msgSend_setStreamErrorDomain_(void *a1, const char *a2, ...)
{
  return [a1 setStreamErrorDomain:];
}

id objc_msgSend_setSuspendCount_(void *a1, const char *a2, ...)
{
  return [a1 setSuspendCount:];
}

id objc_msgSend_setSuspendHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSuspendHandler:];
}

id objc_msgSend_setTLSMaximumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return [a1 setTLSMaximumSupportedProtocol:];
}

id objc_msgSend_setTLSMinimumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return [a1 setTLSMinimumSupportedProtocol:];
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return [a1 setTask:];
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return [a1 setTaskDescription:];
}

id objc_msgSend_setTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setTaskIdentifier:];
}

id objc_msgSend_setTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 setTaskInfo:];
}

id objc_msgSend_setTaskKind_(void *a1, const char *a2, ...)
{
  return [a1 setTaskKind:];
}

id objc_msgSend_setTaskMetrics_(void *a1, const char *a2, ...)
{
  return [a1 setTaskMetrics:];
}

id objc_msgSend_setTemporaryDestinationURL_(void *a1, const char *a2, ...)
{
  return [a1 setTemporaryDestinationURL:];
}

id objc_msgSend_setThroughputTimerForCurrentInterval(void *a1, const char *a2, ...)
{
  return _[a1 setThroughputTimerForCurrentInterval];
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutIntervalForRequest:];
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutIntervalForResource:];
}

id objc_msgSend_setTotalBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return [a1 setTotalBytesExpectedToSend:];
}

id objc_msgSend_setTotalBytesSent_(void *a1, const char *a2, ...)
{
  return [a1 setTotalBytesSent:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return [a1 setURLCache:];
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return [a1 setURLCredentialStorage:];
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUniqueIdentifier:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUploadFile_(void *a1, const char *a2, ...)
{
  return [a1 setUploadFile:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUuidString_(void *a1, const char *a2, ...)
{
  return [a1 setUuidString:];
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forHTTPHeaderField:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return [a1 setWaitsForConnectivity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWorkState(void *a1, const char *a2, ...)
{
  return _[a1 setWorkState];
}

id objc_msgSend_setXPCConnection_(void *a1, const char *a2, ...)
{
  return [a1 setXPCConnection:];
}

id objc_msgSend_set_DuetActivityProperties_(void *a1, const char *a2, ...)
{
  return [a1 set_DuetActivityProperties:];
}

id objc_msgSend_set_IDSMessageTimeout_(void *a1, const char *a2, ...)
{
  return [a1 set_IDSMessageTimeout:];
}

id objc_msgSend_set_TCPAdaptiveReadTimeout_(void *a1, const char *a2, ...)
{
  return [a1 set_TCPAdaptiveReadTimeout:];
}

id objc_msgSend_set_TCPAdaptiveWriteTimeout_(void *a1, const char *a2, ...)
{
  return [a1 set_TCPAdaptiveWriteTimeout:];
}

id objc_msgSend_set_TLSMaximumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return [a1 set_TLSMaximumSupportedProtocolVersion:];
}

id objc_msgSend_set_TLSMinimumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return [a1 set_TLSMinimumSupportedProtocolVersion:];
}

id objc_msgSend_set_allowsHSTSWithUntrustedRootCertificate_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsHSTSWithUntrustedRootCertificate:];
}

id objc_msgSend_set_allowsPowerNapScheduling_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsPowerNapScheduling:];
}

id objc_msgSend_set_allowsTLSECH_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsTLSECH:];
}

id objc_msgSend_set_allowsTLSFallback_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsTLSFallback:];
}

id objc_msgSend_set_allowsTLSFalseStart_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsTLSFalseStart:];
}

id objc_msgSend_set_allowsVirtualInterfaces_(void *a1, const char *a2, ...)
{
  return [a1 set_allowsVirtualInterfaces:];
}

id objc_msgSend_set_alwaysPerformDefaultTrustEvaluation_(void *a1, const char *a2, ...)
{
  return [a1 set_alwaysPerformDefaultTrustEvaluation:];
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return [a1 set_atsContext:];
}

id objc_msgSend_set_attributedBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_attributedBundleIdentifier:];
}

id objc_msgSend_set_authenticatorConfiguredViaTaskProperty_(void *a1, const char *a2, ...)
{
  return [a1 set_authenticatorConfiguredViaTaskProperty:];
}

id objc_msgSend_set_authenticatorStatusCodes_(void *a1, const char *a2, ...)
{
  return [a1 set_authenticatorStatusCodes:];
}

id objc_msgSend_set_backgroundPublishingURL_(void *a1, const char *a2, ...)
{
  return [a1 set_backgroundPublishingURL:];
}

id objc_msgSend_set_backgroundTrailers_(void *a1, const char *a2, ...)
{
  return [a1 set_backgroundTrailers:];
}

id objc_msgSend_set_bytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return [a1 set_bytesPerSecondLimit:];
}

id objc_msgSend_set_clientIsNotExplicitlyDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 set_clientIsNotExplicitlyDiscretionary:];
}

id objc_msgSend_set_connectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return [a1 set_connectionCachePurgeTimeout:];
}

id objc_msgSend_set_connectionPoolName_(void *a1, const char *a2, ...)
{
  return [a1 set_connectionPoolName:];
}

id objc_msgSend_set_directoryForDownloadedFiles_(void *a1, const char *a2, ...)
{
  return [a1 set_directoryForDownloadedFiles:];
}

id objc_msgSend_set_disallowCellular_(void *a1, const char *a2, ...)
{
  return [a1 set_disallowCellular:];
}

id objc_msgSend_set_discretionaryOverride_(void *a1, const char *a2, ...)
{
  return [a1 set_discretionaryOverride:];
}

id objc_msgSend_set_doesSZExtractorConsumeExtractedData_(void *a1, const char *a2, ...)
{
  return [a1 set_doesSZExtractorConsumeExtractedData:];
}

id objc_msgSend_set_duetPreClearedMode_(void *a1, const char *a2, ...)
{
  return [a1 set_duetPreClearedMode:];
}

id objc_msgSend_set_duetPreauthorized_(void *a1, const char *a2, ...)
{
  return [a1 set_duetPreauthorized:];
}

id objc_msgSend_set_expectedProgressTarget_(void *a1, const char *a2, ...)
{
  return [a1 set_expectedProgressTarget:];
}

id objc_msgSend_set_extractor_(void *a1, const char *a2, ...)
{
  return [a1 set_extractor:];
}

id objc_msgSend_set_forcedNetworkServiceType_(void *a1, const char *a2, ...)
{
  return [a1 set_forcedNetworkServiceType:];
}

id objc_msgSend_set_hasSZExtractor_(void *a1, const char *a2, ...)
{
  return [a1 set_hasSZExtractor:];
}

id objc_msgSend_set_legacySocketStreamProperties_(void *a1, const char *a2, ...)
{
  return [a1 set_legacySocketStreamProperties:];
}

id objc_msgSend_set_loadingPriority_(void *a1, const char *a2, ...)
{
  return [a1 set_loadingPriority:];
}

id objc_msgSend_set_loggingPrivacyLevel_(void *a1, const char *a2, ...)
{
  return [a1 set_loggingPrivacyLevel:];
}

id objc_msgSend_set_longLivedConnectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return [a1 set_longLivedConnectionCachePurgeTimeout:];
}

id objc_msgSend_set_maximumWatchCellularTransferSize_(void *a1, const char *a2, ...)
{
  return [a1 set_maximumWatchCellularTransferSize:];
}

id objc_msgSend_set_metrics_(void *a1, const char *a2, ...)
{
  return [a1 set_metrics:];
}

id objc_msgSend_set_multipathAlternatePort_(void *a1, const char *a2, ...)
{
  return [a1 set_multipathAlternatePort:];
}

id objc_msgSend_set_neTrackerTCCResult_(void *a1, const char *a2, ...)
{
  return [a1 set_neTrackerTCCResult:];
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return [a1 set_nw_activity:];
}

id objc_msgSend_set_onBehalfOfPairedDevice_(void *a1, const char *a2, ...)
{
  return [a1 set_onBehalfOfPairedDevice:];
}

id objc_msgSend_set_pathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return [a1 set_pathToDownloadTaskFile:];
}

id objc_msgSend_set_pidForHAR_(void *a1, const char *a2, ...)
{
  return [a1 set_pidForHAR:];
}

id objc_msgSend_set_preconnect_(void *a1, const char *a2, ...)
{
  return [a1 set_preconnect:];
}

id objc_msgSend_set_prefersInfraWiFi_(void *a1, const char *a2, ...)
{
  return [a1 set_prefersInfraWiFi:];
}

id objc_msgSend_set_preventsIdleSleepOnceConnected_(void *a1, const char *a2, ...)
{
  return [a1 set_preventsIdleSleepOnceConnected:];
}

id objc_msgSend_set_priority_(void *a1, const char *a2, ...)
{
  return [a1 set_priority:];
}

id objc_msgSend_set_reportsDataStalls_(void *a1, const char *a2, ...)
{
  return [a1 set_reportsDataStalls:];
}

id objc_msgSend_set_requiresClientToOpenFiles_(void *a1, const char *a2, ...)
{
  return [a1 set_requiresClientToOpenFiles:];
}

id objc_msgSend_set_requiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return [a1 set_requiresPowerPluggedIn:];
}

id objc_msgSend_set_requiresSustainedDataDelivery_(void *a1, const char *a2, ...)
{
  return [a1 set_requiresSustainedDataDelivery:];
}

id objc_msgSend_set_respectsAllowsCellularAccessForDiscretionaryTasks_(void *a1, const char *a2, ...)
{
  return [a1 set_respectsAllowsCellularAccessForDiscretionaryTasks:];
}

id objc_msgSend_set_shouldSkipPreferredClientCertificateLookup_(void *a1, const char *a2, ...)
{
  return [a1 set_shouldSkipPreferredClientCertificateLookup:];
}

id objc_msgSend_set_socketStreamProperties_(void *a1, const char *a2, ...)
{
  return [a1 set_socketStreamProperties:];
}

id objc_msgSend_set_sourceApplicationAuditTokenData_(void *a1, const char *a2, ...)
{
  return [a1 set_sourceApplicationAuditTokenData:];
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_sourceApplicationBundleIdentifier:];
}

id objc_msgSend_set_sourceApplicationBundleIdentifierForMobileAsset_(void *a1, const char *a2, ...)
{
  return [a1 set_sourceApplicationBundleIdentifierForMobileAsset:];
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_sourceApplicationSecondaryIdentifier:];
}

id objc_msgSend_set_storagePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_storagePartitionIdentifier:];
}

id objc_msgSend_set_suspensionThreshhold_(void *a1, const char *a2, ...)
{
  return [a1 set_suspensionThreshhold:];
}

id objc_msgSend_set_tcpConnectionPoolName_(void *a1, const char *a2, ...)
{
  return [a1 set_tcpConnectionPoolName:];
}

id objc_msgSend_set_timeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return [a1 set_timeoutIntervalForResource:];
}

id objc_msgSend_set_timingDataOptions_(void *a1, const char *a2, ...)
{
  return [a1 set_timingDataOptions:];
}

id objc_msgSend_set_tlsSessionCachePrefix_(void *a1, const char *a2, ...)
{
  return [a1 set_tlsSessionCachePrefix:];
}

id objc_msgSend_set_tlsTrustPinningPolicyName_(void *a1, const char *a2, ...)
{
  return [a1 set_tlsTrustPinningPolicyName:];
}

id objc_msgSend_set_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_uniqueIdentifier:];
}

id objc_msgSend_set_updatedStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 set_updatedStreamingZipModificationDate:];
}

id objc_msgSend_set_watchExtensionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_watchExtensionBundleIdentifier:];
}

id objc_msgSend_setupArchiveTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupArchiveTimer];
}

id objc_msgSend_setupDASPropertiesOnTask_taskInfo_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return [a1 setupDASPropertiesOnTask:taskInfo:discretionaryStatus:];
}

id objc_msgSend_setupDelayTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupDelayTimer];
}

id objc_msgSend_setupDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupDelayedCompletionWakeTimer];
}

id objc_msgSend_setupDownloadDirectory(void *a1, const char *a2, ...)
{
  return _[a1 setupDownloadDirectory];
}

id objc_msgSend_setupNewClassMappingsForUnarchiver(void *a1, const char *a2, ...)
{
  return _[a1 setupNewClassMappingsForUnarchiver];
}

id objc_msgSend_setupThroughputMonitorForWrapper_taskInfo_identifier_(void *a1, const char *a2, ...)
{
  return [a1 setupThroughputMonitorForWrapper:taskInfo:identifier:];
}

id objc_msgSend_setupTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedContainerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sharedContainerIdentifier];
}

id objc_msgSend_sharedCredentialStorage(void *a1, const char *a2, ...)
{
  return _[a1 sharedCredentialStorage];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLauncher(void *a1, const char *a2, ...)
{
  return _[a1 sharedLauncher];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedSpringBoard(void *a1, const char *a2, ...)
{
  return _[a1 sharedSpringBoard];
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return _[a1 sharedStakeholder];
}

id objc_msgSend_sharedUserEventAgentConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedUserEventAgentConnection];
}

id objc_msgSend_shouldCancel(void *a1, const char *a2, ...)
{
  return _[a1 shouldCancel];
}

id objc_msgSend_shouldCancelOnDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 shouldCancelOnDisconnect];
}

id objc_msgSend_shouldElevateDiscretionaryPriority(void *a1, const char *a2, ...)
{
  return _[a1 shouldElevateDiscretionaryPriority];
}

id objc_msgSend_shouldRetainBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _[a1 shouldRetainBTLinkAssertion];
}

id objc_msgSend_shouldRetainInfraWiFi(void *a1, const char *a2, ...)
{
  return _[a1 shouldRetainInfraWiFi];
}

id objc_msgSend_simulateNetworkChangedEvent_identifier_(void *a1, const char *a2, ...)
{
  return [a1 simulateNetworkChangedEvent:identifier];
}

id objc_msgSend_socketUUID(void *a1, const char *a2, ...)
{
  return _[a1 socketUUID];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sourceApplicationBundleIdentifier];
}

id objc_msgSend_springBoardApplicationExistsWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 springBoardApplicationExistsWithIdentifier:];
}

id objc_msgSend_springboardApplicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 springboardApplicationWithBundleIdentifier:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAVAssetDownloadSessionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "startAVAssetDownloadSessionWithTaskIdentifier:");
}

id objc_msgSend_startBridgingUMTask_(void *a1, const char *a2, ...)
{
  return [a1 startBridgingUMTask:];
}

id objc_msgSend_startCatalogDownload_then_(void *a1, const char *a2, ...)
{
  return [a1 startCatalogDownload:x0 then:x1];
}

id objc_msgSend_startDownload_(void *a1, const char *a2, ...)
{
  return [a1 startDownload:];
}

id objc_msgSend_startLoadingMetadata(void *a1, const char *a2, ...)
{
  return _[a1 startLoadingMetadata];
}

id objc_msgSend_startMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringBundleID:];
}

id objc_msgSend_startResourceTimer(void *a1, const char *a2, ...)
{
  return _[a1 startResourceTimer];
}

id objc_msgSend_startThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startThroughputMonitoring];
}

id objc_msgSend_startThroughputMonitoringIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 startThroughputMonitoringIfAppropriate];
}

id objc_msgSend_startTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 startTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_startUMTask_taskInfo_(void *a1, const char *a2, ...)
{
  return [a1 startUMTask:taskInfo];
}

id objc_msgSend_startedUserInitiated(void *a1, const char *a2, ...)
{
  return _[a1 startedUserInitiated];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusMonitor_callbackForIdentifier_networkChanged_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "statusMonitor:callbackForIdentifier:networkChanged:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringBundleID:];
}

id objc_msgSend_stopThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopThroughputMonitoring];
}

id objc_msgSend_storagePartitionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storagePartitionIdentifier];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _[a1 streamStatus];
}

id objc_msgSend_streamTaskWithHostName_port_(void *a1, const char *a2, ...)
{
  return [a1 streamTaskWithHostName:port:];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_submitActivity_inGroupWithName_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "submitActivity:inGroupWithName:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_supportsRedirects(void *a1, const char *a2, ...)
{
  return _[a1 supportsRedirects];
}

id objc_msgSend_supportsWakes(void *a1, const char *a2, ...)
{
  return _[a1 supportsWakes];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_suspendCount(void *a1, const char *a2, ...)
{
  return _[a1 suspendCount];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_takeAssertionForBundleID_sessionID_sessionUUID_pid_(void *a1, const char *a2, ...)
{
  return [a1 takeAssertionForBundleID:sessionID:sessionUUID:pid:];
}

id objc_msgSend_takePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 takePowerAssertion];
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return [a1 targetWithPid:];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return _[a1 taskDescription];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskInfo(void *a1, const char *a2, ...)
{
  return _[a1 taskInfo];
}

id objc_msgSend_taskKind(void *a1, const char *a2, ...)
{
  return _[a1 taskKind];
}

id objc_msgSend_taskMessageForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 taskMessageForIdentifier:];
}

id objc_msgSend_taskMetrics(void *a1, const char *a2, ...)
{
  return _[a1 taskMetrics];
}

id objc_msgSend_taskSequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 taskSequenceNumber];
}

id objc_msgSend_taskShouldResume_(void *a1, const char *a2, ...)
{
  return [a1 taskShouldResume:];
}

id objc_msgSend_taskShouldSuspend_(void *a1, const char *a2, ...)
{
  return [a1 taskShouldSuspend:];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_taskTransferredData_countOfBytesReceived_(void *a1, const char *a2, ...)
{
  return [a1 taskTransferredData:x0 countOfBytesReceived:x1];
}

id objc_msgSend_taskWillResume(void *a1, const char *a2, ...)
{
  return _[a1 taskWillResume];
}

id objc_msgSend_taskWillSuspend(void *a1, const char *a2, ...)
{
  return _[a1 taskWillSuspend];
}

id objc_msgSend_taskWithIdentifier_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return [a1 taskWithIdentifier:didCompleteWithError:];
}

id objc_msgSend_taskWithName_reason_(void *a1, const char *a2, ...)
{
  return [a1 taskWithName:];
}

id objc_msgSend_taskWithName_reason_forBundleID_(void *a1, const char *a2, ...)
{
  return [a1 taskWithName:reason:forBundleID:];
}

id objc_msgSend_tasksArchivePath(void *a1, const char *a2, ...)
{
  return _[a1 tasksArchivePath];
}

id objc_msgSend_tasksHaveBeenEnqueued(void *a1, const char *a2, ...)
{
  return _[a1 tasksHaveBeenEnqueued];
}

id objc_msgSend_temporaryDestinationURL(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDestinationURL];
}

id objc_msgSend_terminateExtractorWithError_completion_(void *a1, const char *a2, ...)
{
  return [a1 terminateExtractorWithError:completion:];
}

id objc_msgSend_terminateStreamWithError_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 terminateStreamWithError:x0 completionBlock:x1];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutIntervalForRequest(void *a1, const char *a2, ...)
{
  return _[a1 timeoutIntervalForRequest];
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return _[a1 timeoutIntervalForResource];
}

id objc_msgSend_trustPassesExtendedValidation_(void *a1, const char *a2, ...)
{
  return [a1 trustPassesExtendedValidation:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedDictionaryWithKeysOfClass_objectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 updateConfiguration:];
}

id objc_msgSend_updateCurrentRequest_(void *a1, const char *a2, ...)
{
  return [a1 updateCurrentRequest:];
}

id objc_msgSend_updateOptions_(void *a1, const char *a2, ...)
{
  return [a1 updateOptions:];
}

id objc_msgSend_updatePriorityForTaskID_(void *a1, const char *a2, ...)
{
  return [a1 updatePriorityForTaskID:];
}

id objc_msgSend_updateStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateStreamingZipModificationDate:");
}

id objc_msgSend_updateTaskInfoBasedOnCurrentDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return [a1 updateTaskInfoBasedOnCurrentDiscretionaryStatus:];
}

id objc_msgSend_uploadTaskWithRequest_fromFile_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "uploadTaskWithRequest:fromFile:");
}

id objc_msgSend_uploadTaskWithStreamedRequest_(void *a1, const char *a2, ...)
{
  return [a1 uploadTaskWithStreamedRequest:];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaUniqueString];
}

id objc_msgSend_usesContainerManagerForAVAsset(void *a1, const char *a2, ...)
{
  return _[a1 usesContainerManagerForAVAsset];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return _[a1 uuidString];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return [a1 valueWithBytes:x0 objCType:x1];
}

id objc_msgSend_valueWithCMTimeRange_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCMTimeRange:];
}

id objc_msgSend_verifyAndUpdateIncomingSequenceNumber_forPriority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyAndUpdateIncomingSequenceNumber:forPriority:");
}

id objc_msgSend_waitUntilDeviceIsUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilDeviceIsUnlocked];
}

id objc_msgSend_wakeForSessionIdentifier_withSessionUUID_wakeRequirement_(void *a1, const char *a2, ...)
{
  return [a1 wakeForSessionIdentifier:x0 withSessionUUID:x1 wakeRequirement:x2];
}

id objc_msgSend_wakeUpApp_forSession_withSessionUUID_(void *a1, const char *a2, ...)
{
  return [a1 wakeUpApp:forSession:withSessionUUID:];
}

id objc_msgSend_wakeUpClient_(void *a1, const char *a2, ...)
{
  return [a1 wakeUpClient:];
}

id objc_msgSend_wakeUpExtension_forSession_withSessionUUID_wakeRequirement_(void *a1, const char *a2, ...)
{
  return [a1 wakeUpExtension:forSession:withSessionUUID:wakeRequirement:];
}

id objc_msgSend_willRetryBackgroundDataTask_withError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return [a1 willRetryBackgroundDataTask:withError:transactionMetrics:];
}

id objc_msgSend_withWorkQueue_(void *a1, const char *a2, ...)
{
  return [a1 withWorkQueue:];
}

id objc_msgSend_wrapperTransferredData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "wrapperTransferredData:");
}

id objc_msgSend_wrapperWillSuspend(void *a1, const char *a2, ...)
{
  return _[a1 wrapperWillSuspend];
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 write:x0 maxLength:x1];
}

id objc_msgSend_writeData_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 writeData:x0 timeout:x1 completionHandler:x2];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}
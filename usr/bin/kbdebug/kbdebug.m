void sub_100002B70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  v11 = __stdoutp;
  v12 = v10;
  fputs((const char *)[v12 cStringUsingEncoding:4], v11);
}

void sub_100002BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002B70(@"XPC connection interrupted\n", a2, a3, a4, a5, a6, a7, a8, v9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

void sub_100002C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002B70(@"XPC connection invalidated\n", a2, a3, a4, a5, a6, a7, a8, v9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

void sub_100002D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002B70(@"XPC error: %@\n", a2, a3, a4, a5, a6, a7, a8, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = objc_opt_new();
  v5 = [v4 proxy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003034;
  v8[3] = &unk_100004190;
  uint64_t v9 = &off_1000044E8;
  id v10 = v4;
  id v6 = v4;
  [v5 retrieveMoreDebugInformationWithCompletion:v8];

  CFRunLoopRun();
  return 0;
}

void sub_100003034(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v61 = *(void *)v67;
    id v59 = v3;
    do
    {
      id v6 = 0;
      id v60 = v5;
      do
      {
        if (*(void *)v67 != v61) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v6);
        v8 = [v7 objectForKeyedSubscript:@"Message"];

        if (v8)
        {
          id v9 = [v7 objectForKeyedSubscript:@"Timestamp"];
          id v10 = [v7 objectForKeyedSubscript:@"Type"];
          v58 = [v7 objectForKeyedSubscript:@"Message"];
          sub_100002B70(@"%@: %@: %@\n", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v9);
        }
        else
        {
          v18 = [v7 objectForKeyedSubscript:@"Description"];

          if (v18)
          {
            v19 = [v7 objectForKeyedSubscript:@"Description"];
            sub_100002B70(@"\t%@:\n", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);

            CFStringRef v27 = @"Active";
            v28 = [v7 objectForKeyedSubscript:@"Active"];
            if (![v28 BOOLValue]) {
              CFStringRef v27 = @"Inactive";
            }
            v29 = [v7 objectForKeyedSubscript:@"KeyboardFocus"];
            [v29 BOOLValue];
            v30 = [v7 objectForKeyedSubscript:@"CommandFocus"];
            [v30 BOOLValue];
            sub_100002B70(@"\t -> State: %@ %@ %@\n", v31, v32, v33, v34, v35, v36, v37, (uint64_t)v27);

            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v9 = v7;
            id v38 = [v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v63;
              id v5 = v60;
              do
              {
                for (i = 0; i != v39; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v40) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v42 = *(void *)(*((void *)&v62 + 1) + 8 * i);
                  if (([*(id *)(a1 + 32) containsObject:v42] & 1) == 0)
                  {
                    v57 = [v9 objectForKeyedSubscript:v42];
                    sub_100002B70(@"\t\t %@: %@\n", v43, v44, v45, v46, v47, v48, v49, v42);
                  }
                }
                id v39 = [v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
              }
              while (v39);
              id v3 = v59;
            }
            else
            {
              id v3 = v59;
              id v5 = v60;
            }
          }
          else
          {
            id v9 = [v7 objectForKeyedSubscript:@"Timestamp"];
            sub_100002B70(@"%@:\n", v50, v51, v52, v53, v54, v55, v56, (uint64_t)v9);
          }
        }

        id v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 40) stop];
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_createArbiterConnection(void *a1, const char *a2, ...)
{
  return [a1 createArbiterConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return [a1 proxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}
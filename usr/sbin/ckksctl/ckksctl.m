double sub_100003684(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  long long *v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  uint64_t v16;
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_1000037B0(a2);
  v5 = malloc_type_malloc(104 * v4 + 208, 0x109004046C4FC64uLL);
  *(void *)(a1 + 16) = v5;
  *v5 = unk_10000C2C0;
  v5[1] = *(_OWORD *)algn_10000C2D0;
  *((void *)v5 + 12) = 0;
  v5[4] = unk_10000C300;
  v5[5] = unk_10000C310;
  v5[2] = xmmword_10000C2E0;
  v5[3] = unk_10000C2F0;
  if (v4)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = *(void *)(a2 + 16);
      if (!*(unsigned char *)(v8 + v6 + 80)) {
        goto LABEL_6;
      }
      if (SecIsInternalRelease()) {
        break;
      }
LABEL_7:
      v6 += 104;
      if (!--v4) {
        goto LABEL_10;
      }
    }
    v8 = *(void *)(a2 + 16);
LABEL_6:
    v9 = *(void *)(a1 + 16) + 104 * v7++;
    v10 = (long long *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(void *)(v9 + 96) = *((void *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_10:
  v16 = *(void *)(a1 + 16) + 104 * v7;
  *(void *)(v16 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_OWORD *)(v16 + 48) = 0u;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  return result;
}

uint64_t sub_1000037B0(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  v1 = *(char **)(a1 + 16);
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = 0;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL)) {
        break;
      }
      ++v2;
      v1 += 104;
    }
    while (v2 != 1024);
  }
  return v2;
}

uint64_t sub_100003828(uint64_t result)
{
  if (!result) {
    return result;
  }
  memset(v36, 170, sizeof(v36));
  sub_100003684((uint64_t)v36, result);
  uint64_t v1 = sub_1000037B0((uint64_t)v36);
  uint64_t v2 = (const char *)v36[0];
  if (!v36[0]) {
    uint64_t v2 = "command";
  }
  printf("usage: %s", v2);
  if (v1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v1;
    while (!*(unsigned char *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104;
      if (!--v4)
      {
        uint64_t v7 = 0;
        uint64_t v8 = v1;
        while (2)
        {
          if (!*(void *)(v36[2] + v7 + 8) || *(unsigned char *)(v36[2] + v7)) {
            goto LABEL_31;
          }
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            uint64_t v9 = *(void *)(v36[2] + v7 + 48);
            if (*(void *)(v36[2] + v7 + 56))
            {
              if (!v9) {
                goto LABEL_30;
              }
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10) {
                v10 = "arg";
              }
              printf(" %s", v10);
            }
            else if (v9 || *(void *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }
LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104;
          if (!--v8)
          {
            uint64_t v11 = 16;
            uint64_t v12 = v1;
            do
            {
              if (*(void *)(v36[2] + v11)) {
                printf(" [%s]", *(const char **)(v36[2] + v11));
              }
              v11 += 104;
              --v12;
            }
            while (v12);
            uint64_t v13 = 0;
            uint64_t v14 = v1;
            do
            {
              if (*(void *)(v36[2] + v13 + 24))
              {
                if (*(unsigned char *)(v36[2] + v13 + 32)) {
                  printf(" [<%s>]");
                }
                else {
                  printf(" <%s>");
                }
              }
              v13 += 104;
              --v14;
            }
            while (v14);
            goto LABEL_42;
          }
          continue;
        }
      }
    }
    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      uint64_t v5 = *(void *)(v36[2] + v3 + 48);
      if (*(void *)(v36[2] + v3 + 56))
      {
        if (!v5) {
          goto LABEL_16;
        }
      }
      else if (!v5 && !*(void *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }
      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6) {
        v6 = "arg";
      }
      printf(" %s", v6);
    }
LABEL_16:
    putchar(93);
    goto LABEL_17;
  }
LABEL_42:
  putchar(10);
  if (v36[1]) {
    printf("\n%s\n", (const char *)v36[1]);
  }
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }
  uint64_t v15 = 0;
  uint64_t v16 = v1;
  do
  {
    if (*(void *)(v36[2] + v15 + 24)) {
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    }
    v15 += 104;
    --v16;
  }
  while (v16);
  puts("\noptional arguments:");
  uint64_t v17 = 88;
  uint64_t v18 = v1;
  do
  {
    if (!*(unsigned char *)(v36[2] + v17 - 88)) {
      goto LABEL_80;
    }
    if (*(void *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      uint64_t v19 = v36[2];
      uint64_t v20 = *(void *)(v36[2] + v17 - 40);
      if (*(void *)(v36[2] + v17 - 32))
      {
        if (!v20) {
          goto LABEL_63;
        }
      }
      else if (!v20 && !*(void *)(v36[2] + v17))
      {
        goto LABEL_63;
      }
      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22) {
        v22 = "arg";
      }
      printf(" %s", v22);
      uint64_t v19 = v36[2];
LABEL_63:
      uint64_t v23 = v19 + v17;
      if (*(void *)(v19 + v17 - 80))
      {
        uint64_t v25 = v23 - 40;
        uint64_t v24 = *(void *)(v23 - 40);
        if (*(void *)(v25 + 8))
        {
          if (v24) {
            goto LABEL_72;
          }
        }
        else if (v24 || *(void *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(void *)(v19 + v17 - 48)) {
            v27 = *(const char **)(v19 + v17 - 48);
          }
          else {
            v27 = "arg";
          }
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }
        if (*(void *)(v19 + v17 - 48)) {
          v26 = *(const char **)(v19 + v17 - 48);
        }
        else {
          v26 = "arg";
        }
        strlen(v26);
        printf(", --%-*s");
      }
      goto LABEL_79;
    }
    uint64_t v21 = *(void *)(v36[2] + v17 - 40);
    if (*(void *)(v36[2] + v17 - 32))
    {
      if (v21) {
        goto LABEL_78;
      }
    }
    else if (v21 || *(void *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }
    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104;
    --v18;
  }
  while (v18);
  uint64_t v28 = v1;
  while (2)
  {
    if (*(void *)(v36[2] + v18 + 8) && !*(unsigned char *)(v36[2] + v18))
    {
      uint64_t v29 = *(void *)(v36[2] + v18 + 48);
      if (*(void *)(v36[2] + v18 + 56))
      {
        if (!v29) {
          goto LABEL_86;
        }
LABEL_89:
        memset(v46, 170, 22);
        *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v44 = v30;
        long long v42 = v30;
        long long v43 = v30;
        long long v40 = v30;
        long long v41 = v30;
        long long v38 = v30;
        long long v39 = v30;
        *(_OWORD *)v37 = v30;
        uint64_t v31 = *(void *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32) {
          v32 = "arg";
        }
        if (v31) {
          v33 = "%s %s...";
        }
        else {
          v33 = "%s %s";
        }
        if (v31) {
          v34 = "%s [repeatable]";
        }
        else {
          v34 = "%s";
        }
        snprintf(__str, 0x1EuLL, v33, *(void *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(void *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }
      else
      {
        if (v29 || *(void *)(v36[2] + v18 + 88)) {
          goto LABEL_89;
        }
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }
    v18 += 104;
    if (--v28) {
      continue;
    }
    break;
  }
  puts("\noptional commands:");
  uint64_t v35 = 0;
  do
  {
    if (*(void *)(v36[2] + v35 + 16)) {
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    }
    v35 += 104;
    --v1;
  }
  while (v1);
  return putchar(10);
}

char **sub_100003DF4(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(_DWORD **)(a1 + 56);
  if (v4) {
    *uint64_t v4 = *(_DWORD *)(a1 + 64);
  }
  result = *(char ***)(a1 + 48);
  if (result) {
    result = (char **)asprintf(result, "%.1048576s", a2);
  }
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    uint64_t v7 = **(void **)(a1 + 96);
    **(void **)(a1 + 88) = malloc_type_realloc(*v6, 8 * (v7 + 1), 0x10040436913F5uLL);
    result = (char **)asprintf((char **)(**(void **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(void **)(a1 + 96) = v7 + 1;
  }
  return result;
}

void sub_100003FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000400C(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v4 = [a3 description];
    printf("Error causing havoc: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    if (a2) {
      uint64_t v5 = @"ON";
    }
    else {
      uint64_t v5 = @"OFF";
    }
    printf("Success. Havoc is now %s\n", (const char *)[(__CFString *)v5 UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_10000423C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100004258(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 description];
    printf("Error deleting zone: %s\n", (const char *)[v3 UTF8String]);
  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void sub_1000046B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

intptr_t sub_100004704(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 description];
    printf("Error modifying tlk shares: %s\n", (const char *)[v3 UTF8String]);
  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void sub_100004920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000493C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v17 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 description];
    printf("Error fetching view: %s\n", (const char *)[v13 UTF8String]);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v14 = +[NSMutableDictionary dictionary];
      [v14 setObject:v17 forKeyedSubscript:@"tlk"];
      [v14 setObject:v9 forKeyedSubscript:@"pastTLKs"];
      [v14 setObject:v10 forKeyedSubscript:@"tlkShares"];
      sub_100004AF4(v14);
      putchar(10);
    }
    else
    {
      id v15 = [v17 description];
      printf("TLK: %s\n", (const char *)[v15 UTF8String]);

      id v16 = [v9 description];
      printf("Old TLKs: %s\n", (const char *)[v16 UTF8String]);

      id v14 = [v10 description];
      printf("TLKShares: %s\n", (const char *)[v14 UTF8String]);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004AF4(void *a1)
{
  uint64_t v1 = sub_100004BCC(a1);
  id v5 = 0;
  uint64_t v2 = +[NSJSONSerialization dataWithJSONObject:v1 options:3 error:&v5];
  id v3 = v5;

  if (v2)
  {
    id v4 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
    printf("%s", (const char *)[v4 UTF8String]);
  }
  else
  {
    id v4 = [v3 localizedDescription];
    NSLog(@"error: %@", v4);
  }
}

id sub_100004BCC(void *a1)
{
  if (a1)
  {
    id v1 = [a1 mutableCopy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v2 = [v1 allKeys];
    id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = [v1 objectForKeyedSubscript:v7];
          id v9 = sub_100005118(v8);
          [v1 setObject:v9 forKeyedSubscript:v7];
        }
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void sub_100004D24(void *a1, int a2)
{
  id v3 = a1;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = [v3 objectForKeyedSubscript:v11];
        sub_100004E78(v11, v12, a2);
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void sub_100004E78(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3 == 1)
    {
      sub_10000502C(@"\n%*s%@ -", v7, v8, v9, v10, v11, v12, v13, 4);
      sub_10000502C(@"%*s------------------------", v28, v29, v30, v31, v32, v33, v34, 4);
    }
    else if (a3)
    {
      sub_10000502C(@"%*s%@ -", v7, v8, v9, v10, v11, v12, v13, (4 * a3));
    }
    else
    {
      sub_10000502C(@"\n%*s%@ -", v7, v8, v9, v10, v11, v12, v13, 0);
      sub_10000502C(@"%*s========================", v14, v15, v16, v17, v18, v19, v20, 0);
    }
    sub_100004D24(v6, (a3 + 1));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sub_10000502C(@"%*s%@ -", v21, v22, v23, v24, v25, v26, v27, (4 * a3));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000509C;
      v35[3] = &unk_10000C440;
      int v36 = a3 + 1;
      [v6 enumerateObjectsUsingBlock:v35];
    }
    else
    {
      sub_10000502C(@"%*s%@: %@", v21, v22, v23, v24, v25, v26, v27, (4 * a3));
    }
  }
}

void sub_10000502C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  id v11 = v10;
  puts((const char *)[v11 UTF8String]);
}

void sub_10000509C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  sub_100004E78(v6, v5, *(unsigned int *)(a1 + 32));
}

id sub_100005118(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v6 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24[0] = @"code";
    id v2 = v1;
    id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 code]);
    v24[1] = @"domain";
    v25[0] = v3;
    id v4 = [v2 domain];
    v25[1] = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v6 = [v5 mutableCopy];

    uint64_t v7 = [v2 userInfo];

    uint64_t v8 = sub_100004BCC(v7);
    [v6 setObject:v8 forKeyedSubscript:@"userInfo"];

    goto LABEL_17;
  }
  if (+[NSJSONSerialization isValidJSONObject:v1]) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v1 jsonDictionary];
    if (+[NSJSONSerialization isValidJSONObject:v10])
    {
      id v11 = v10;
    }
    else
    {
      id v11 = [v1 description];
    }
    id v6 = v11;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_6:
      id v9 = v1;
LABEL_7:
      id v6 = v9;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v1 base64EncodedStringWithOptions:0];
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sub_100004BCC(v1);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [v1 description];
      goto LABEL_7;
    }
    id v13 = v1;
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v13;
    id v14 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = sub_100005118(*(void *)(*((void *)&v19 + 1) + 8 * i));
          [v6 addObject:v18];
        }
        id v15 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
LABEL_17:

  return v6;
}

void sub_1000057F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

intptr_t sub_100005838(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 description];
    printf("Error proposing TLK: %s\n", (const char *)[v3 UTF8String]);
  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void sub_100005BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005BFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = [v3 description];
    printf("Error sending metric: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1;
    }
  }
  else
  {
    puts("Complete.");
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005E4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = [v3 description];
    printf("Error pushing: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1;
    }
  }
  else
  {
    puts("Complete.");
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000609C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = [v3 description];
    printf("Error fetching: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1;
    }
  }
  else
  {
    puts("Complete.");
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000629C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 description];
    printf("ERROR FETCHING STATUS: %s\n", (const char *)[v8 UTF8String]);
  }
  id v9 = [v5 objectAtIndexedSubscript:0];
  id v10 = [v9 mutableCopy];

  id v11 = &NSLog_ptr;
  v169 = v10;
  v170 = v5;
  v168 = v7;
  if (v10)
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"reachability"];
    [v10 setObject:0 forKeyedSubscript:@"reachability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v211 = v13;

    id v14 = [v10 objectForKeyedSubscript:@"ckdeviceID"];
    [v10 setObject:0 forKeyedSubscript:@"ckdeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v209 = v15;

    uint64_t v16 = [v10 objectForKeyedSubscript:@"ckdeviceIDError"];
    [v10 setObject:0 forKeyedSubscript:@"ckdeviceIDError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    id v207 = v17;

    uint64_t v18 = [v10 objectForKeyedSubscript:@"lockstatetracker"];
    [v10 setObject:0 forKeyedSubscript:@"lockstatetracker"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v19 = v18;
    }
    else {
      long long v19 = 0;
    }
    id v205 = v19;

    long long v20 = [v10 objectForKeyedSubscript:@"cloudkitRetryAfter"];
    [v10 setObject:0 forKeyedSubscript:@"cloudkitRetryAfter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v21 = v20;
    }
    else {
      long long v21 = 0;
    }
    id v203 = v21;

    long long v22 = [v10 objectForKeyedSubscript:@"lastCKKSPush"];
    [v10 setObject:0 forKeyedSubscript:@"lastCKKSPush"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    id v201 = v23;

    uint64_t v24 = [v10 objectForKeyedSubscript:@"policy"];
    [v10 setObject:0 forKeyedSubscript:@"policy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0;
    }
    id v199 = v25;

    uint64_t v26 = [v10 objectForKeyedSubscript:@"viewsFromPolicy"];
    [v10 setObject:0 forKeyedSubscript:@"viewsFromPolicy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    id v28 = v27;

    uint64_t v29 = [v10 objectForKeyedSubscript:@"activeAccount"];
    [v10 setObject:0 forKeyedSubscript:@"activeAccount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    id v186 = v30;

    uint64_t v31 = [v10 objectForKeyedSubscript:@"ckaccountstatus"];
    [v10 setObject:0 forKeyedSubscript:@"ckaccountstatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = 0;
    }
    id v33 = v32;

    uint64_t v34 = [v10 objectForKeyedSubscript:@"accounttracker"];
    [v10 setObject:0 forKeyedSubscript:@"accounttracker"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v35 = v34;
    }
    else {
      uint64_t v35 = 0;
    }
    id v36 = v35;

    v37 = [v10 objectForKeyedSubscript:@"fetcher"];
    [v10 setObject:0 forKeyedSubscript:@"fetcher"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v38 = v37;
    }
    else {
      long long v38 = 0;
    }
    id v197 = v38;

    long long v39 = [v10 objectForKeyedSubscript:@"ckksstate"];
    [v10 setObject:0 forKeyedSubscript:@"ckksstate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v40 = v39;
    }
    else {
      long long v40 = 0;
    }
    id v41 = v40;

    long long v42 = [v10 objectForKeyedSubscript:@"lastIncomingQueueOperation"];
    [v10 setObject:0 forKeyedSubscript:@"lastIncomingQueueOperation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v43 = v42;
    }
    else {
      long long v43 = 0;
    }
    id v195 = v43;

    long long v44 = [v10 objectForKeyedSubscript:@"lastNewTLKOperation"];
    [v10 setObject:0 forKeyedSubscript:@"lastNewTLKOperation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v45 = v44;
    }
    else {
      v45 = 0;
    }
    id v193 = v45;

    v46 = [v10 objectForKeyedSubscript:@"lastOutgoingQueueOperation"];
    [v10 setObject:0 forKeyedSubscript:@"lastOutgoingQueueOperation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v47 = v46;
    }
    else {
      v47 = 0;
    }
    id v191 = v47;

    v48 = [v10 objectForKeyedSubscript:@"lastProcessReceivedKeysOperation"];
    [v10 setObject:0 forKeyedSubscript:@"lastProcessReceivedKeysOperation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v49 = v48;
    }
    else {
      v49 = 0;
    }
    id v189 = v49;

    v50 = [v10 objectForKeyedSubscript:@"lastReencryptOutgoingItemsOperation"];
    [v10 setObject:0 forKeyedSubscript:@"lastReencryptOutgoingItemsOperation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v51 = v50;
    }
    else {
      v51 = 0;
    }
    id v52 = v51;

    v53 = [v169 objectForKeyedSubscript:@"launchSequence"];
    [v169 setObject:0 forKeyedSubscript:@"launchSequence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v54 = v53;
    }
    else {
      v54 = 0;
    }
    id v55 = v54;

    if (!*(unsigned char *)(a1 + 40))
    {
      puts("================================================================================\n");
      puts("Global state:\n");
    }
    id v56 = v41;
    printf("CKKS state machine:   %s\n", (const char *)[v56 UTF8String]);
    id v57 = v186;
    printf("Active account:       %s\n", (const char *)[v57 UTF8String]);
    id v58 = v33;
    printf("CloudKit account:     %s\n", (const char *)[v58 UTF8String]);
    id v59 = v36;
    printf("Account tracker:      %s\n", (const char *)[v59 UTF8String]);
    v60 = v199;
    id v61 = [v199 description];
    printf("Syncing Policy:       %s\n", (const char *)[v61 UTF8String]);

    id v62 = [v28 description];
    printf("Views from policy:    %s\n", (const char *)[v62 UTF8String]);

    if (!*(unsigned char *)(a1 + 40))
    {
      id v187 = v57;
      id v63 = [v211 description];
      printf("Reachability:         %s\n", (const char *)[v63 UTF8String]);

      id v64 = [v203 description];
      printf("Retry:                %s\n", (const char *)[v64 UTF8String]);

      id v65 = [v209 description];
      printf("CK DeviceID:          %s\n", (const char *)[v65 UTF8String]);

      id v66 = [v207 description];
      printf("CK DeviceID Error:    %s\n", (const char *)[v66 UTF8String]);

      id v67 = [v205 description];
      printf("Lock state:           %s\n", (const char *)[v67 UTF8String]);

      id v68 = [v201 description];
      printf("Last CKKS push:       %s\n", (const char *)[v68 UTF8String]);

      putchar(10);
      id v69 = [v197 description];
      printf("zone change fetcher:                 %s\n", (const char *)[v69 UTF8String]);

      if (v195) {
        v70 = (const char *)[v195 UTF8String];
      }
      else {
        v70 = "never";
      }
      printf("lastIncomingQueueOperation:          %s\n", v70);
      if (v193) {
        v71 = (const char *)[v193 UTF8String];
      }
      else {
        v71 = "never";
      }
      printf("lastNewTLKOperation:                 %s\n", v71);
      if (v191) {
        v72 = (const char *)[v191 UTF8String];
      }
      else {
        v72 = "never";
      }
      printf("lastOutgoingQueueOperation:          %s\n", v72);
      if (v189) {
        v73 = (const char *)[v189 UTF8String];
      }
      else {
        v73 = "never";
      }
      printf("lastProcessReceivedKeysOperation:    %s\n", v73);
      uint64_t v171 = a1;
      id v182 = v56;
      id v184 = v52;
      if (v52) {
        v74 = (const char *)[v52 UTF8String];
      }
      else {
        v74 = "never";
      }
      printf("lastReencryptOutgoingItemsOperation: %s\n", v74);
      puts("Launch sequence:");
      long long v221 = 0u;
      long long v222 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      id v75 = v55;
      id v76 = v55;
      id v77 = [v76 countByEnumeratingWithState:&v221 objects:v227 count:16];
      if (v77)
      {
        id v78 = v77;
        uint64_t v79 = *(void *)v222;
        do
        {
          for (i = 0; i != v78; i = (char *)i + 1)
          {
            if (*(void *)v222 != v79) {
              objc_enumerationMutation(v76);
            }
            id v81 = [*(id *)(*((void *)&v221 + 1) + 8 * i) description];
            printf("\t%s\n", (const char *)[v81 UTF8String]);
          }
          id v78 = [v76 countByEnumeratingWithState:&v221 objects:v227 count:16];
        }
        while (v78);
      }

      a1 = v171;
      v60 = v199;
      id v55 = v75;
      id v56 = v182;
      id v52 = v184;
      id v57 = v187;
    }
    putchar(10);

    id v5 = v170;
    id v11 = &NSLog_ptr;
  }
  if ((unint64_t)[v5 count] < 2)
  {
    v82 = &__NSArray0__struct;
  }
  else
  {
    v82 = [v5 subarrayWithRange:1, (char *)[v5 count] - 1];
  }
  if (![v82 count]) {
    puts("No CKKS views are active.");
  }
  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  id obj = v82;
  id v83 = [obj countByEnumeratingWithState:&v217 objects:v226 count:16];
  if (v83)
  {
    id v84 = v83;
    uint64_t v202 = *(void *)v218;
    uint64_t v172 = a1;
    do
    {
      v85 = 0;
      id v173 = v84;
      do
      {
        if (*(void *)v218 != v202) {
          objc_enumerationMutation(obj);
        }
        int v86 = *(unsigned __int8 *)(a1 + 40);
        id v87 = [*(id *)(*((void *)&v217 + 1) + 8 * (void)v85) mutableCopy];
        v88 = [v87 objectForKeyedSubscript:@"view"];
        [v87 setObject:0 forKeyedSubscript:@"view"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v89 = v88;
        }
        else {
          v89 = 0;
        }
        id v90 = v89;

        if (v86)
        {
          v91 = [v87 objectForKeyedSubscript:@"keystate"];
          [v87 setObject:0 forKeyedSubscript:@"keystate"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v92 = v91;
          }
          else {
            v92 = 0;
          }
          id v93 = v92;

          id v94 = v90;
          v95 = (const char *)[v94 UTF8String];

          id v96 = v93;
          v97 = (const char *)[v96 UTF8String];

          printf("%-25s: %s\n", v95, v97);
        }
        else
        {
          v98 = [v87 objectForKeyedSubscript:@"ckksManaged"];
          [v87 setObject:0 forKeyedSubscript:@"ckksManaged"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v99 = v98;
          }
          else {
            v99 = 0;
          }
          id v178 = v99;

          v100 = [v87 objectForKeyedSubscript:@"zoneCreated"];
          [v87 setObject:0 forKeyedSubscript:@"zoneCreated"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v101 = v100;
          }
          else {
            v101 = 0;
          }
          id v212 = v101;

          v102 = [v87 objectForKeyedSubscript:@"zoneSubscribed"];
          [v87 setObject:0 forKeyedSubscript:@"zoneSubscribed"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v103 = v102;
          }
          else {
            v103 = 0;
          }
          id v210 = v103;

          v104 = [v87 objectForKeyedSubscript:@"zoneInitializeScheduler"];
          [v87 setObject:0 forKeyedSubscript:@"zoneInitializeScheduler"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v105 = v104;
          }
          else {
            v105 = 0;
          }
          id v206 = v105;

          v106 = [v87 objectForKeyedSubscript:@"keystate"];
          [v87 setObject:0 forKeyedSubscript:@"keystate"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v107 = v106;
          }
          else {
            v107 = 0;
          }
          id v175 = v107;

          v108 = [v87 objectForKeyedSubscript:@"statusError"];
          [v87 setObject:0 forKeyedSubscript:@"statusError"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v109 = v108;
          }
          else {
            v109 = 0;
          }
          id v110 = v109;

          v111 = [v87 objectForKeyedSubscript:@"itemsyncing"];
          [v87 setObject:0 forKeyedSubscript:@"itemsyncing"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v112 = v111;
          }
          else {
            v112 = 0;
          }
          id v200 = v112;

          v113 = [v87 objectForKeyedSubscript:@"currentTLK"];
          [v87 setObject:0 forKeyedSubscript:@"currentTLK"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v114 = v113;
          }
          else {
            v114 = 0;
          }
          id v198 = v114;

          v115 = [v87 objectForKeyedSubscript:@"currentClassA"];
          [v87 setObject:0 forKeyedSubscript:@"currentClassA"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v116 = v115;
          }
          else {
            v116 = 0;
          }
          id v196 = v116;

          v117 = [v87 objectForKeyedSubscript:@"currentClassC"];
          [v87 setObject:0 forKeyedSubscript:@"currentClassC"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v118 = v117;
          }
          else {
            v118 = 0;
          }
          id v194 = v118;

          v119 = [v87 objectForKeyedSubscript:@"currentTLKPtr"];
          [v87 setObject:0 forKeyedSubscript:@"currentTLKPtr"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v120 = v119;
          }
          else {
            v120 = 0;
          }
          id v204 = v120;

          v121 = [v87 objectForKeyedSubscript:@"currentClassAPtr"];
          [v87 setObject:0 forKeyedSubscript:@"currentClassAPtr"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v122 = v121;
          }
          else {
            v122 = 0;
          }
          id v181 = v122;

          v123 = [v87 objectForKeyedSubscript:@"currentClassCPtr"];
          [v87 setObject:0 forKeyedSubscript:@"currentClassCPtr"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v124 = v123;
          }
          else {
            v124 = 0;
          }
          id v180 = v124;

          v125 = [v87 objectForKeyedSubscript:@"launchSequence"];
          [v87 setObject:0 forKeyedSubscript:@"launchSequence"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v126 = v125;
          }
          else {
            v126 = 0;
          }
          id v177 = v126;

          v127 = [v87 objectForKeyedSubscript:@"oqe"];
          [v87 setObject:0 forKeyedSubscript:@"oqe"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v128 = v127;
          }
          else {
            v128 = 0;
          }
          id v192 = v128;

          v129 = [v87 objectForKeyedSubscript:@"iqe"];
          [v87 setObject:0 forKeyedSubscript:@"iqe"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v130 = v129;
          }
          else {
            v130 = 0;
          }
          id v190 = v130;

          v131 = [v87 objectForKeyedSubscript:@"keys"];
          [v87 setObject:0 forKeyedSubscript:@"keys"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v132 = v131;
          }
          else {
            v132 = 0;
          }
          id v188 = v132;

          v133 = [v87 objectForKeyedSubscript:@"ckmirror"];
          [v87 setObject:0 forKeyedSubscript:@"ckmirror"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v134 = v133;
          }
          else {
            v134 = 0;
          }
          id v185 = v134;

          v135 = [v87 objectForKeyedSubscript:@"devicestates"];
          [v87 setObject:0 forKeyedSubscript:@"devicestates"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v136 = v135;
          }
          else {
            v136 = 0;
          }
          id v183 = v136;

          v137 = [v87 objectForKeyedSubscript:@"tlkshares"];
          [v87 setObject:0 forKeyedSubscript:@"tlkshares"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v138 = v137;
          }
          else {
            v138 = 0;
          }
          id v208 = v138;

          puts("================================================================================\n");
          v139 = v90;
          id v140 = v110;
          id v176 = v139;
          printf("View: %s\n\n", (const char *)[v176 UTF8String]);
          if (v110) {
            printf("ERROR FETCHING STATUS: %s\n\n", (const char *)[v110 UTF8String]);
          }
          if (![v212 isEqualToString:@"yes"]
            || ([v210 isEqualToString:@"yes"] & 1) == 0)
          {
            id v141 = [v212 description];
            printf("CK Zone Created:            %s\n", (const char *)[v141 UTF8String]);

            id v142 = [v210 description];
            printf("CK Zone Subscribed:         %s\n", (const char *)[v142 UTF8String]);

            id v143 = [v206 description];
            printf("CK Zone initialize retry:   %s\n", (const char *)[v143 UTF8String]);

            putchar(10);
          }
          id v144 = v175;
          printf("Key state:            %s\n", (const char *)[v144 UTF8String]);
          id v145 = v178;
          printf("CKKS managed view:    %s\n", (const char *)[v145 UTF8String]);
          unsigned int v146 = [v145 isEqualToString:@"yes"];
          v179 = v140;
          if (v146)
          {
            v147 = v177;
            if (v198)
            {
              printf("Current TLK: %s\n", (const char *)[v198 UTF8String]);
            }
            else
            {
              id v149 = [v11[82] stringWithFormat:@"missing; pointer is %@", v204];
              printf("Current TLK:          %s\n", (const char *)[v149 UTF8String]);
            }
            if (v196)
            {
              printf("Current ClassA: %s\n", (const char *)[v196 UTF8String]);
            }
            else
            {
              id v150 = [v11[82] stringWithFormat:@"missing; pointer is %@", v181];
              printf("Current ClassA:       %s\n", (const char *)[v150 UTF8String]);
            }
            if (v194)
            {
              printf("Current ClassC: %s\n", (const char *)[v194 UTF8String]);
            }
            else
            {
              id v151 = [v11[82] stringWithFormat:@"missing; pointer is %@", v180];
              printf("Current ClassC:       %s\n", (const char *)[v151 UTF8String]);
            }
          }
          else
          {
            id v148 = [v204 description];
            printf("Current TLK:          %s\n", (const char *)[v148 UTF8String]);

            v147 = v177;
          }
          id v152 = [v208 description];
          printf("TLK shares:           %s\n", (const char *)[v152 UTF8String]);

          if (v146)
          {
            id v153 = [v200 description];
            printf("Item syncing:          %s\n", (const char *)[v153 UTF8String]);

            id v154 = [v192 description];
            printf("Outgoing Queue counts: %s\n", (const char *)[v154 UTF8String]);

            id v155 = [v190 description];
            printf("Incoming Queue counts: %s\n", (const char *)[v155 UTF8String]);

            id v156 = [v188 description];
            printf("Key counts: %s\n", (const char *)[v156 UTF8String]);

            id v157 = [v185 description];
            printf("Item counts (by key):  %s\n", (const char *)[v157 UTF8String]);

            id v158 = [v183 description];
            printf("Peer states:           %s\n", (const char *)[v158 UTF8String]);
          }
          puts("Launch sequence:");
          long long v213 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          long long v216 = 0u;
          id v159 = v147;
          id v160 = [v159 countByEnumeratingWithState:&v213 objects:v225 count:16];
          if (v160)
          {
            id v161 = v160;
            uint64_t v162 = *(void *)v214;
            do
            {
              for (j = 0; j != v161; j = (char *)j + 1)
              {
                if (*(void *)v214 != v162) {
                  objc_enumerationMutation(v159);
                }
                id v164 = [*(id *)(*((void *)&v213 + 1) + 8 * (void)j) description];
                printf("\t%s\n", (const char *)[v164 UTF8String]);
              }
              id v161 = [v159 countByEnumeratingWithState:&v213 objects:v225 count:16];
            }
            while (v161);
          }

          v165 = [v87 allKeys];
          id v166 = [v165 count];

          if (v166)
          {
            id v167 = [v87 description];
            printf("\nExtra information: %s\n", (const char *)[v167 UTF8String]);
          }
          putchar(10);

          a1 = v172;
          id v84 = v173;
          id v11 = &NSLog_ptr;
        }

        v85 = (char *)v85 + 1;
      }
      while (v85 != v84);
      id v84 = [obj countByEnumeratingWithState:&v217 objects:v226 count:16];
    }
    while (v84);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007E30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"error"];
  }
  if ((unint64_t)[v5 count] <= 1) {
    puts("No CKKS views are active.");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v14 objectForKeyedSubscript:@"view"];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008198(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000081B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_10000502C(@"resync errored: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }
  else
  {
    puts("resync success.");
    id v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008418(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100008438(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_10000502C(@"Reset error: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }
  else
  {
    puts("CloudKit Reset complete.");
    id v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008690(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000086B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_10000502C(@"reset error: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }
  else
  {
    puts("reset complete.");
    id v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008864(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = [a3 description];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"error"];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000893C;
  v7[3] = &unk_10000C330;
  id v8 = *(id *)(a1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_10000893C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t start(int a1, char *const *a2)
{
  memset(v88, 170, 24);
  sub_100003684((uint64_t)v88, (uint64_t)off_100010BE8);
  unint64_t v2 = sub_1000037B0((uint64_t)v88);
  id v3 = (option *)malloc_type_calloc(v2 + 1, 0x20uLL, 0x10500402E37B38AuLL);
  size_t v4 = 2 * v2 + 2;
  id v5 = (char *)malloc_type_malloc(v4, 0x83F72549uLL);
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = (char *)v88[2];
  uint64_t v10 = (char *)v88[2] + 48;
  do
  {
    if (v7 >= v2) {
      goto LABEL_13;
    }
    id v11 = (const char *)*((void *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      uint64_t v13 = *(void *)v10;
      id v12 = (int *)*((void *)v10 + 1);
      if (v12)
      {
        int v14 = 2 * (v13 != 0);
      }
      else if (v13)
      {
        int v14 = 1;
      }
      else
      {
        int v14 = *((void *)v10 + 5) != 0;
      }
      id v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }
    ++v8;
    v10 += 104;
  }
  while (v8 <= v2);
  if (v7 < v2)
  {
    uint64_t v16 = &v3[v7];
    v16->name = 0;
    v16->has_arg = 0;
    v16->flag = 0;
    v16->val = 0;
LABEL_14:
    size_t v17 = 0;
    long long v18 = v9 + 48;
    unint64_t v19 = v2;
    while (1)
    {
      if (*((unsigned char *)v18 - 48))
      {
        if (v17 >= v4) {
          goto LABEL_25;
        }
        v5[v17] = *((unsigned char *)v18 - 48);
        size_t v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            char v74 = 0;
            goto LABEL_28;
          }
          v5[v20] = 58;
          v17 += 2;
        }
        else
        {
          ++v17;
        }
      }
      v18 += 13;
      if (!--v19)
      {
        char v74 = 0;
        goto LABEL_27;
      }
    }
  }
LABEL_13:
  if (v2) {
    goto LABEL_14;
  }
  size_t v17 = 0;
  char v74 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  int v87 = 0;
  do
  {
    while (1)
    {
      int v21 = getopt_long(a1, a2, v6, v3, &v87);
      if (v21) {
        break;
      }
      if (!v87)
      {
LABEL_130:
        sub_100003828((uint64_t)v88);
        exit(1);
      }
      if ((v74 & 1) == 0)
      {
        uint64_t v23 = 0;
        p_name = &v3[v87].name;
        unint64_t v25 = v2;
        do
        {
          uint64_t v26 = (char *)v88[2] + v23;
          uint64_t v27 = *(const char **)((char *)v88[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              size_t v28 = strlen(*(const char **)((char *)v88[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                long long v29 = *((_OWORD *)v26 + 5);
                long long v84 = *((_OWORD *)v26 + 4);
                long long v85 = v29;
                uint64_t v86 = *((void *)v26 + 12);
                long long v30 = *((_OWORD *)v26 + 1);
                long long v80 = *(_OWORD *)v26;
                long long v81 = v30;
                long long v31 = *((_OWORD *)v26 + 3);
                long long v82 = *((_OWORD *)v26 + 2);
                long long v83 = v31;
                sub_100003DF4((uint64_t)&v80, optarg);
              }
            }
          }
          v23 += 104;
          --v25;
        }
        while (v25);
      }
    }
    if (v21 == -1)
    {
      uint64_t v39 = optind;
      if (optind >= a1)
      {
LABEL_71:
        free(v88[2]);
        free(v3);
        free(v6);
      }
      else
      {
        unint64_t v40 = 0;
        do
        {
          unint64_t v41 = v40;
          if ((v74 & 1) == 0)
          {
            uint64_t v42 = 0;
            long long v43 = (char *)v88[2];
            long long v44 = (const char **)((char *)v88[2] + 16);
            while (!*v44 || strcmp(a2[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42) {
                goto LABEL_60;
              }
            }
            v47 = &v43[104 * v42];
            long long v48 = *((_OWORD *)v47 + 5);
            long long v84 = *((_OWORD *)v47 + 4);
            long long v85 = v48;
            uint64_t v86 = *((void *)v47 + 12);
            long long v49 = *((_OWORD *)v47 + 1);
            long long v80 = *(_OWORD *)v47;
            long long v81 = v49;
            long long v50 = *((_OWORD *)v47 + 3);
            long long v82 = *((_OWORD *)v47 + 2);
            long long v83 = v50;
            sub_100003DF4((uint64_t)&v80, 0);
            goto LABEL_71;
          }
LABEL_60:
          id v36 = v88[2];
          if (v41 >= v2) {
            goto LABEL_50;
          }
          v45 = (char *)v88[2] + 104 * v41 + 24;
          unint64_t v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40) {
              goto LABEL_49;
            }
          }
          v46 = (void *)*((void *)v88[2] + 13 * v40 + 6);
          if (v46)
          {
            void *v46 = a2[v39];
            ++v40;
          }
          ++v39;
        }
        while (v39 != a1);
        free(v88[2]);
        free(v3);
        free(v6);
        if (v41 >= v2) {
          goto LABEL_51;
        }
      }
      id v79 = 0;
      id v52 = +[CKKSControl CKKSControlObject:0 error:&v79];
      id v53 = v79;
      if (v53 || !v52)
      {
        v73 = [v53 description];
        errx(1, "no CKKSControl failed: %s", v73);
      }
      v54 = [[CKKSControlCLI alloc] initWithCKKSControl:v52];
      if (qword_100010C10)
      {
        id v78 = +[NSString stringWithCString:qword_100010C10 encoding:4];
      }
      else
      {
        id v78 = 0;
      }
      if (qword_100010C38)
      {
        id v55 = +[NSString stringWithCString:qword_100010C38 encoding:4];
      }
      else
      {
        id v55 = 0;
      }
      if (qword_100010C40)
      {
        id v76 = +[NSString stringWithCString:qword_100010C40 encoding:4];
      }
      else
      {
        id v76 = 0;
      }
      id v56 = &NSLog_ptr;
      if (qword_100010C20)
      {
        uint64_t v57 = +[NSMutableArray array];
        if (qword_100010C20)
        {
          unint64_t v58 = 0;
          do
          {
            id v59 = +[NSString stringWithCString:*(void *)(qword_100010C18 + 8 * v58) encoding:4];
            [(id)v57 addObject:v59];

            ++v58;
          }
          while (v58 < qword_100010C20);
          id v56 = &NSLog_ptr;
        }
      }
      else
      {
        uint64_t v57 = 0;
      }
      if (qword_100010C30)
      {
        uint64_t v60 = [v56[79] array];
        if (qword_100010C30)
        {
          unint64_t v61 = 0;
          do
          {
            id v62 = +[NSString stringWithCString:*(void *)(qword_100010C28 + 8 * v61) encoding:4];
            [(id)v60 addObject:v62];

            ++v61;
          }
          while (v61 < qword_100010C30);
        }
      }
      else
      {
        uint64_t v60 = 0;
      }
      if (dword_100010C48)
      {
        id v63 = objc_alloc_init((Class)NSMutableDictionary);
        if (dword_100010C00)
        {
          id v64 = [(CKKSControlCLI *)v54 fetchPerformanceCounters];
          [v63 setObject:v64 forKeyedSubscript:@"performance"];
        }
        char v65 = dword_100010C04;
        if (dword_100010C04)
        {
          id v66 = [(CKKSControlCLI *)v54 fetchStatus:v78];
          [v63 setObject:v66 forKeyedSubscript:@"status"];

          char v65 = dword_100010C04 != 0;
        }
        if ((v65 & 1) == 0 && !dword_100010C00 || (sub_100004AF4(v63), putchar(10), !dword_100010C04)) {
          [(CKKSControlCLI *)v54 printHumanReadableStatus:v78 shortenOutput:dword_100010C08 != 0];
        }
        goto LABEL_106;
      }
      if (dword_100010C00)
      {
        id v63 = objc_alloc_init((Class)NSMutableDictionary);
        id v67 = [(CKKSControlCLI *)v54 fetchPerformanceCounters];
        [v63 setObject:v67 forKeyedSubscript:@"performance"];

        sub_100004D24(v63, 0);
LABEL_106:

        uint64_t v37 = 0;
LABEL_107:

        return v37;
      }
      if (dword_100010C4C)
      {
        id v68 = v78;
        uint64_t v37 = [(CKKSControlCLI *)v54 fetch:v78];
LABEL_110:

        goto LABEL_107;
      }
      if (dword_100010C50)
      {
        id v69 = v78;
        int64_t v70 = [(CKKSControlCLI *)v54 push:v78];
LABEL_119:
        uint64_t v37 = v70;

        goto LABEL_107;
      }
      if (dword_100010C58)
      {
        id v69 = v78;
        int64_t v70 = [(CKKSControlCLI *)v54 resetLocal:v78];
        goto LABEL_119;
      }
      if (dword_100010C5C)
      {
        id v69 = v78;
        int64_t v70 = [(CKKSControlCLI *)v54 resetCloudKit:v78];
        goto LABEL_119;
      }
      if (dword_100010C54)
      {
        id v69 = v78;
        int64_t v70 = [(CKKSControlCLI *)v54 resync:v78];
        goto LABEL_119;
      }
      if (dword_100010C60)
      {
        uint64_t v37 = [(CKKSControlCLI *)v54 ckmetric];

        goto LABEL_107;
      }
      if (dword_100010C64)
      {
        if (v78)
        {
          if (v55)
          {
            id v68 = v78;
            uint64_t v71 = [(CKKSControlCLI *)v54 proposeSETLK:v78 tlkJson:v55 oldTlkJson:v76 tlkShareJsonStrings:v57];
LABEL_129:
            uint64_t v37 = v71;
            goto LABEL_110;
          }
          v72 = "newTLK is a required argument.\n";
          goto LABEL_132;
        }
      }
      else if (dword_100010C68)
      {
        if (v78)
        {
          id v68 = v78;
          uint64_t v71 = [(CKKSControlCLI *)v54 fetchSEView:v78 json:dword_100010C04 != 0];
          goto LABEL_129;
        }
      }
      else if (dword_100010C6C)
      {
        if (v78)
        {
          if (v57 | v60)
          {
            id v68 = v78;
            uint64_t v71 = [(CKKSControlCLI *)v54 modifySEZone:v78 tlkShareJsonStrings:v57 deletetlkShareJsonStrings:v60];
            goto LABEL_129;
          }
          v72 = "At least one of --tlkShare or --deleteTLKShare is required.";
LABEL_132:
          puts(v72);
          sub_100003828((uint64_t)off_100010BE8);

LABEL_141:
          uint64_t v37 = 1;
          goto LABEL_107;
        }
      }
      else
      {
        if (!dword_100010C70)
        {
          if (dword_100010C74)
          {
            uint64_t v37 = [(CKKSControlCLI *)v54 toggleHavoc];
          }
          else
          {
            sub_100003828((uint64_t)off_100010BE8);

            uint64_t v37 = 0xFFFFFFFFLL;
          }
          goto LABEL_107;
        }
        if (v78)
        {
          id v68 = v78;
          uint64_t v71 = [(CKKSControlCLI *)v54 deleteSEZone:v78];
          goto LABEL_129;
        }
      }
      puts("View is a required argument.\n");
      sub_100003828((uint64_t)off_100010BE8);
      goto LABEL_141;
    }
    if (v21 == 104) {
      goto LABEL_130;
    }
    if (v74)
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v32 = (char *)v88[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22) {
          goto LABEL_49;
        }
      }
      long long v33 = *((_OWORD *)v32 + 5);
      long long v84 = *((_OWORD *)v32 + 4);
      long long v85 = v33;
      uint64_t v86 = *((void *)v32 + 12);
      long long v34 = *((_OWORD *)v32 + 1);
      long long v80 = *(_OWORD *)v32;
      long long v81 = v34;
      long long v35 = *((_OWORD *)v32 + 3);
      long long v82 = *((_OWORD *)v32 + 2);
      long long v83 = v35;
      sub_100003DF4((uint64_t)&v80, optarg);
    }
  }
  while (v22 != v2);
LABEL_49:
  id v36 = v88[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_100003828((uint64_t)off_100010BE8);
  return 0xFFFFFFFFLL;
}

void NSLog(NSString *format, ...)
{
}

uint64_t SecIsInternalRelease()
{
  return _SecIsInternalRelease();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ckmetric(void *a1, const char *a2, ...)
{
  return [a1 ckmetric];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fetchPerformanceCounters(void *a1, const char *a2, ...)
{
  return [a1 fetchPerformanceCounters];
}

id objc_msgSend_jsonDictionary(void *a1, const char *a2, ...)
{
  return [a1 jsonDictionary];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_toggleHavoc(void *a1, const char *a2, ...)
{
  return [a1 toggleHavoc];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}
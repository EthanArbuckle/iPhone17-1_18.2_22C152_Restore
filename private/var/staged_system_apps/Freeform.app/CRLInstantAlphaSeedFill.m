@interface CRLInstantAlphaSeedFill
+ (id)newSeedFillWithImage:(id)a3 seedPoint:(CGPoint)a4 context:(id *)a5 oldFill:(id)a6;
@end

@implementation CRLInstantAlphaSeedFill

+ (id)newSeedFillWithImage:(id)a3 seedPoint:(CGPoint)a4 context:(id *)a5 oldFill:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  v10 = a3;
  id v11 = a6;
  int v38 = 0;
  qword_1016A9A28 = (uint64_t)a5;
  v12 = -[CRLInstantAlphaBinaryBitmap initWithWidth:height:]([CRLInstantAlphaBinaryBitmap alloc], "initWithWidth:height:", v10[1], v10[2], 0);
  if (v12)
  {
    v13 = malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
    if (v13)
    {
      uint64_t v14 = (uint64_t)v13;
      v15 = malloc_type_malloc(0x268uLL, 0x1020040F89E1A17uLL);
      *(void *)uint64_t v14 = v15;
      *(void *)(v14 + 8) = v15;
      if (v15)
      {
        int v40 = 0;
        uint64_t v39 = 0;
        void *v15 = 0;
        v15[1] = 0;
        *(void *)(v14 + 16) = v15 + 2;
        sub_1003DFC64(v10, v12, (int)x, (int)y, &v39, v11);
        sub_1003DFE1C(v12, (int *)&v39);
        sub_1003E01A4(v14, &v39);
        while (1)
        {
          uint64_t v17 = *(void *)(v14 + 8);
          uint64_t v16 = *(void *)(v14 + 16);
          if (v16 == v17 + 16)
          {
            uint64_t v18 = *(void *)(v17 + 8);
            if (!v18)
            {
              [(CRLInstantAlphaBinaryBitmap *)v12 unionWithBitmap:v11];
              sub_1003E023C((void **)v14);
              v35 = v12;
              goto LABEL_39;
            }
            *(void *)(v14 + 8) = v18;
            uint64_t v16 = v18 + 616;
          }
          *(void *)(v14 + 16) = v16 - 12;
          uint64_t v39 = *(void *)(v16 - 12);
          int v40 = *(_DWORD *)(v16 - 4);
          uint64_t v19 = (int)v39;
          if ((int)v39 >= 1)
          {
            int v20 = HIDWORD(v39);
            int v21 = v40;
            if (SHIDWORD(v39) <= v40)
            {
              do
              {
                if (!sub_1003E0288(v12, v20, (v19 - 1)))
                {
                  if (sub_1003E0288(v11, v20, (v19 - 1))
                    || (v22 = (int *)qword_1016A9A28,
                        unsigned int v23 = sub_1003E05BC(v10, v20, (v19 - 1)),
                        sub_1003E0540(v22, v23)))
                  {
                    sub_1003DFC64(v10, v12, v20, v19 - 1, &v37, v11);
                    sub_1003DFE1C(v12, (int *)&v37);
                    if (!sub_1003E01A4(v14, &v37))
                    {
LABEL_27:
                      sub_1003E023C((void **)v14);
                      goto LABEL_38;
                    }
                    int v20 = v38 + 2;
                  }
                }
                BOOL v24 = v20++ < v21;
              }
              while (v24);
            }
          }
          if (v10[2] - 1 > v19)
          {
            int v25 = HIDWORD(v39);
            int v26 = v40;
            if (SHIDWORD(v39) <= v40)
            {
              uint64_t v27 = (int)v19 + 1;
              do
              {
                if (!sub_1003E0288(v12, v25, v27))
                {
                  if (sub_1003E0288(v12, v25, v27)
                    || (v28 = (int *)qword_1016A9A28, unsigned int v29 = sub_1003E05BC(v10, v25, v27), sub_1003E0540(v28, v29)))
                  {
                    sub_1003DFC64(v10, v12, v25, v27, &v37, v11);
                    sub_1003DFE1C(v12, (int *)&v37);
                    if (!sub_1003E01A4(v14, &v37)) {
                      goto LABEL_27;
                    }
                    int v25 = v38 + 2;
                  }
                }
                BOOL v24 = v25++ < v26;
              }
              while (v24);
            }
          }
        }
      }
      free((void *)v14);
    }
    else
    {
      puts("allocSpanStack: stack could not be allocated");
    }
    int v30 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6880);
    }
    v31 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD68C(v30, v31);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F68A0);
    }
    v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v32);
    }
    v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLInstantAlphaSeedFill newSeedFillWithImage:seedPoint:context:oldFill:]");
    v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaSeedFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v33 file:v34 lineNumber:178 isFatal:0 description:"can't allocate span stack"];
  }
LABEL_38:
  v35 = 0;
LABEL_39:

  return v35;
}

@end
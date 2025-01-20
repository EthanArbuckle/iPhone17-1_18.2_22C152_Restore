void sub_100093324(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void SACommonUtils::getHashForString(char *__s@<X0>, uint64_t *a2@<X8>)
{
  if (__s[23] < 0)
  {
    if (!*((void *)__s + 1))
    {
LABEL_17:
      sub_10000DD48(a2, "");
      return;
    }
    v4 = *(const char **)__s;
  }
  else
  {
    v4 = __s;
    if (!__s[23]) {
      goto LABEL_17;
    }
  }
  CC_LONG v5 = strlen(v4);
  CC_SHA256(v4, v5, md);
  v6 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    [v6 appendFormat:@"%02x", md[i]];
  id v8 = v6;
  sub_10000DD48(a2, (char *)[v8 UTF8String]);
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (__s[23] >= 0) {
      v10 = __s;
    }
    else {
      v10 = *(char **)__s;
    }
    if (*((char *)a2 + 23) >= 0) {
      v11 = a2;
    }
    else {
      v11 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2081;
    v17 = v10;
    __int16 v18 = 2081;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,getHashForString\", \"body\":%{private, location:escape_only}s, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
  }
}

void sub_100093570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::isHashMatch(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  if (!v4)
  {
    v6 = SALogObjectGeneral;
    uint64_t v41 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    v42 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatchFailed,hashIsEmpty\"}";
    goto LABEL_90;
  }
  v6 = SALogObjectGeneral;
  BOOL v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v7)
    {
LABEL_91:
      uint64_t v41 = 0;
      goto LABEL_99;
    }
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    v42 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatchFailed,dictionaryIsEmpty\"}";
LABEL_90:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v42, buf, 0x12u);
    goto LABEL_91;
  }
  if (v7)
  {
    id v8 = *(const void **)a1;
    if (v5 >= 0) {
      id v8 = (const void *)a1;
    }
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2081;
    *(void *)&buf[20] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch\", \"hash\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  id v50 = v3;
  v9 = [v3 objectForKey:@"info"];
  if (v9 && (v49 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v9;
    v11 = (char *)[v10 count];
    if (v11)
    {
      int v13 = 0;
      *(void *)&long long v12 = 68289539;
      long long v48 = v12;
      do
      {
        __int16 v14 = [v10 objectAtIndexedSubscript:v13, v48];
        v15 = [v14 objectForKey:@"CMAMtext"];

        if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v16 = v15;
          sub_10000DD48(buf, (char *)[v16 UTF8String]);
          SACommonUtils::getHashForString(buf, (uint64_t *)__p);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          v17 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = __p;
            if (v54 < 0) {
              __int16 v18 = (void **)__p[0];
            }
            *(_DWORD *)buf = v48;
            *(_DWORD *)&uint8_t buf[4] = 0;
            *(_WORD *)&buf[8] = 2082;
            *(void *)&buf[10] = "";
            *(_WORD *)&buf[18] = 2113;
            *(void *)&buf[20] = v16;
            __int16 v56 = 2081;
            v57 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,element\", \"cmam\":%{private, location:escape_only}@, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
          }
          int v19 = *(char *)(a1 + 23);
          if (v19 >= 0) {
            size_t v20 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v20 = *(void *)(a1 + 8);
          }
          if (v19 >= 0) {
            v21 = (const void *)a1;
          }
          else {
            v21 = *(const void **)a1;
          }
          if (v54 >= 0) {
            v22 = (void *)HIBYTE(v54);
          }
          else {
            v22 = __p[1];
          }
          if (v54 >= 0) {
            v23 = __p;
          }
          else {
            v23 = (void **)__p[0];
          }
          if ((unint64_t)v22 >= v20) {
            size_t v24 = v20;
          }
          else {
            size_t v24 = (size_t)v22;
          }
          if (!memcmp(v21, v23, v24) && v22 == (void *)v20)
          {
            v25 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289026;
              *(_DWORD *)&uint8_t buf[4] = 0;
              *(_WORD *)&buf[8] = 2082;
              *(void *)&buf[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,cmam,matched\"}", buf, 0x12u);
            }
            int v26 = 1;
            id v3 = v50;
            v9 = v49;
          }
          else
          {
            v28 = [v10 objectAtIndexedSubscript:v13];
            id v3 = v50;
            v9 = v49;
            v29 = [v28 objectForKey:@"CMAMlongtext"];

            if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v30 = v29;
              sub_10000DD48(v51, (char *)[v30 UTF8String]);
              SACommonUtils::getHashForString((char *)v51, (uint64_t *)buf);
              if (SHIBYTE(v54) < 0) {
                operator delete(__p[0]);
              }
              *(_OWORD *)__p = *(_OWORD *)buf;
              uint64_t v54 = *(void *)&buf[16];
              buf[23] = 0;
              buf[0] = 0;
              if (v52 < 0) {
                operator delete(v51[0]);
              }
              v31 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                v32 = __p;
                if (v54 < 0) {
                  v32 = (void **)__p[0];
                }
                *(_DWORD *)buf = v48;
                *(_DWORD *)&uint8_t buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(void *)&buf[10] = "";
                *(_WORD *)&buf[18] = 2113;
                *(void *)&buf[20] = v30;
                __int16 v56 = 2081;
                v57 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,element\", \"cmam_long_text\":%{private, location:escape_only}@, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
              }
              int v33 = *(char *)(a1 + 23);
              if (v33 >= 0) {
                size_t v34 = *(unsigned __int8 *)(a1 + 23);
              }
              else {
                size_t v34 = *(void *)(a1 + 8);
              }
              if (v33 >= 0) {
                v35 = (const void *)a1;
              }
              else {
                v35 = *(const void **)a1;
              }
              if (v54 >= 0) {
                v36 = (void *)HIBYTE(v54);
              }
              else {
                v36 = __p[1];
              }
              if (v54 >= 0) {
                v37 = __p;
              }
              else {
                v37 = (void **)__p[0];
              }
              if ((unint64_t)v36 >= v34) {
                size_t v38 = v34;
              }
              else {
                size_t v38 = (size_t)v36;
              }
              int v26 = 0;
              if (!memcmp(v35, v37, v38) && v36 == (void *)v34)
              {
                v39 = SALogObjectGeneral;
                id v3 = v50;
                v9 = v49;
                if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68289026;
                  *(_DWORD *)&uint8_t buf[4] = 0;
                  *(_WORD *)&buf[8] = 2082;
                  *(void *)&buf[10] = "";
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,cmam_long,matched\"}", buf, 0x12u);
                }
                int v26 = 1;
              }
              else
              {
                id v3 = v50;
                v9 = v49;
              }
            }
            else
            {

              v40 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68289026;
                *(_DWORD *)&uint8_t buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(void *)&buf[10] = "";
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,cmam_long_text nil\"}", buf, 0x12u);
              }
              id v30 = 0;
              int v26 = 14;
            }
          }
          if (SHIBYTE(v54) < 0) {
            operator delete(__p[0]);
          }

          if (v26 != 14 && v26)
          {
            uint64_t v41 = 1;
            goto LABEL_97;
          }
        }
        else
        {

          v27 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289026;
            *(_DWORD *)&uint8_t buf[4] = 0;
            *(_WORD *)&buf[8] = 2082;
            *(void *)&buf[10] = "";
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,cmam_text nil\"}", buf, 0x12u);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      v44 = SALogObjectGeneral;
      BOOL v45 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      uint64_t v41 = 0;
      if (v45)
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        v46 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,noMatch\"}";
        goto LABEL_96;
      }
    }
    else
    {
      v44 = SALogObjectGeneral;
      uint64_t v41 = 0;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        v46 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,invalidInfoCount,noMatch\"}";
LABEL_96:
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v46, buf, 0x12u);
        uint64_t v41 = 0;
      }
    }
LABEL_97:
  }
  else
  {
    v43 = SALogObjectGeneral;
    uint64_t v41 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,noInfoFound,noMatch\"}", buf, 0x12u);
      uint64_t v41 = 0;
    }
  }

LABEL_99:
  return v41;
}

void sub_100093D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  if (a27 < 0) {
    operator delete(a22);
  }

  _Unwind_Resume(a1);
}

void SACommonUtils::getAnyCmam(SACommonUtils *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = this;
  int v5 = v4;
  if (v4)
  {
    v6 = [(SACommonUtils *)v4 objectForKey:@"info"];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,invalidInfo\"}", buf, 0x12u);
      }
      sub_10000DD48(a2, "");
LABEL_25:

      goto LABEL_26;
    }
    id v7 = v6;
    id v8 = (char *)[v7 count];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = [v7 objectAtIndexedSubscript:i];
        v11 = [v10 objectForKey:@"CMAMtext"];

        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_23;
          }
        }

        long long v12 = [v7 objectAtIndexedSubscript:i];
        v11 = [v12 objectForKey:@"CMAMlongtext"];

        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_23:
            id v17 = v11;
            sub_10000DD48(a2, (char *)[v17 UTF8String]);

            goto LABEL_24;
          }
        }
      }
      int v13 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v14 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,noCmamFound\"}";
    }
    else
    {
      int v13 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v14 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,invalidInfoCount\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);
LABEL_22:
    sub_10000DD48(a2, "");
LABEL_24:

    goto LABEL_25;
  }
  id v16 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v19 = 0;
    __int16 v20 = 2082;
    v21 = "";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,dictionaryIsEmpty\"}", buf, 0x12u);
  }
  sub_10000DD48(a2, "");
LABEL_26:
}

void sub_1000941E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SACommonUtils::getLongestCmam(SACommonUtils *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = this;
  int v5 = v4;
  if (v4)
  {
    v6 = [(SACommonUtils *)v4 objectForKey:@"info"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = v6;
      id v8 = [v7 count];
      if (v8)
      {
        uint64_t v9 = 0;
        while (1)
        {
          id v10 = [v7 objectAtIndexedSubscript:v9];
          v11 = [v10 objectForKey:@"CMAMlongtext"];

          if (v11)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }

          if (v8 == (id)++v9)
          {
            uint64_t v12 = 0;
            while (1)
            {
              int v13 = [v7 objectAtIndexedSubscript:v12];
              v11 = [v13 objectForKey:@"CMAMtext"];

              if (v11)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_25;
                }
              }

              if (v8 == (id)++v12)
              {
                __int16 v14 = SALogObjectGeneral;
                if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_24;
                }
                int v19 = 68289026;
                int v20 = 0;
                __int16 v21 = 2082;
                v22 = "";
                v15 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,noCmamFound\"}";
                goto LABEL_23;
              }
            }
          }
        }
LABEL_25:
        id v18 = v11;
        sub_10000DD48(a2, (char *)[v18 UTF8String]);
      }
      else
      {
        __int16 v14 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 68289026;
          int v20 = 0;
          __int16 v21 = 2082;
          v22 = "";
          v15 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,invalidInfoCount\"}";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0x12u);
        }
LABEL_24:
        sub_10000DD48(a2, "");
      }
    }
    else
    {
      id v16 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 68289026;
        int v20 = 0;
        __int16 v21 = 2082;
        v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,invalidInfo\"}", (uint8_t *)&v19, 0x12u);
      }
      sub_10000DD48(a2, "");
    }
  }
  else
  {
    id v17 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,dictionaryIsEmpty\"}", (uint8_t *)&v19, 0x12u);
    }
    sub_10000DD48(a2, "");
  }
}

void sub_1000945EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::getStringFromDictionary(void *a1, uint64_t a2, std::string *a3)
{
  uint64_t v4 = [a1 objectForKey:a2];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    sub_10004D3E4(a3, (char *)[v4 UTF8String]);
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1000946D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SACommonUtils::getWEAHandling(void *a1, std::string *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"info"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      memset(&__str, 0, sizeof(__str));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v16;
        while (2)
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
            if (v10)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (SACommonUtils::getStringFromDictionary(v10, @"WEAHandling", &__str))
                {
                  std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    std::string::size_type size = __str.__r_.__value_.__l.__size_;
                  }
                  if (size)
                  {
                    std::string::operator=(a2, &__str);
                    int v13 = SALogObjectGeneral;
                    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                    {
                      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                        __int16 v14 = a2;
                      }
                      else {
                        __int16 v14 = (std::string *)a2->__r_.__value_.__r.__words[0];
                      }
                      *(_DWORD *)buf = 68289283;
                      int v21 = 0;
                      __int16 v22 = 2082;
                      v23 = "";
                      __int16 v24 = 2081;
                      v25 = v14;
                      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saanalytics,getWEAHandling\", \"weaHandling\":%{private, location:escape_only}s}", buf, 0x1Cu);
                    }

                    goto LABEL_26;
                  }
                }
              }
            }
            uint64_t v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      uint64_t v12 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v21 = 0;
        __int16 v22 = 2082;
        v23 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saanalytics,getWEAHandling,keyword not found\"}", buf, 0x12u);
      }
LABEL_26:

      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
    }
    else
    {
    }
  }
}

void sub_10009499C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::getWeaHandlingType(unint64_t a1)
{
  uint64_t result = 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  int v4 = (char)v3;
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  switch(v3)
  {
    case 5:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      int v5 = *(_DWORD *)a1;
      int v6 = *(unsigned __int8 *)(a1 + 4);
      BOOL v8 = v5 == 1700949313 && v6 == 114;
      uint64_t result = (2 * v8);
      break;
    case 8:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      unint64_t v9 = bswap64(*(void *)a1);
      BOOL v10 = v9 >= 0x5745412054657374;
      int v11 = v9 > 0x5745412054657374;
      int v12 = !v10;
      if (v11 == v12) {
        uint64_t result = 6;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 10:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      unint64_t v13 = *(void *)a1;
      int v14 = *(unsigned __int16 *)(a1 + 8);
      BOOL v16 = v13 == 0x6175716874726145 && v14 == 25963;
      uint64_t result = (4 * v16);
      break;
    case 12:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      unint64_t v17 = *(void *)a1;
      int v18 = *(_DWORD *)(a1 + 8);
      uint64_t result = v17 == 0x6E65646973657250 && v18 == 1818323316;
      break;
    case 13:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      BOOL v20 = (*(void *)a1 ^ 0x532063696C627550 | *(void *)(a1 + 5) ^ 0x7974656661532063) == 0;
      unsigned int v21 = 5;
      goto LABEL_44;
    case 15:
      if (v4 < 0) {
        a1 = *(void *)a1;
      }
      BOOL v20 = (*(void *)a1 ^ 0x746E656E696D6D49 | *(void *)(a1 + 7) ^ 0x7461657268542074) == 0;
      unsigned int v21 = 3;
LABEL_44:
      if (v20) {
        uint64_t result = v21;
      }
      else {
        uint64_t result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

id SACommonUtils::SACommonGetRunLoop(SACommonUtils *this)
{
  v1 = +[NSRunLoop currentRunLoop];
  id v2 = [v1 getCFRunLoop];

  return v2;
}

void sub_100094C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::isLivabiltyEnabled(SACommonUtils *this)
{
  if (*((unsigned char *)sub_10003E368() + 297)) {
    return 1;
  }

  return _os_feature_enabled_impl();
}

uint64_t SACommonUtils::weightedMedian(char **a1, float **a2, _DWORD *a3)
{
  int v5 = *a1;
  int v4 = a1[1];
  if (*a1 == v4 || (v6 = *a2, id v7 = a2[1], *a2 == v7))
  {
    uint64_t v20 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    BOOL v21 = *a2 == a2[1];
    int v43 = 68289539;
    int v44 = 0;
    __int16 v45 = 2082;
    v46 = "";
    __int16 v47 = 1025;
    LODWORD(v48[0]) = v5 == v4;
    WORD2(v48[0]) = 1025;
    *(_DWORD *)((char *)v48 + 6) = v21;
    unint64_t v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,empty size\", \"isArrayEmpty\":%{private}d, \"isWe"
          "ightEmpty\":%{private}d}";
LABEL_13:
    int v18 = v20;
    uint32_t v19 = 30;
    goto LABEL_14;
  }
  unint64_t v8 = (char *)v7 - (char *)v6;
  unint64_t v9 = v4 - v5;
  if ((char *)v7 - (char *)v6 != v9)
  {
    uint64_t v20 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    int v43 = 68289539;
    int v44 = 0;
    __int16 v45 = 2082;
    v46 = "";
    __int16 v47 = 1025;
    LODWORD(v48[0]) = v9 >> 2;
    WORD2(v48[0]) = 1025;
    *(_DWORD *)((char *)v48 + 6) = v8 >> 2;
    unint64_t v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,unequal size\", \"arraySize\":%{private}d, \"weigh"
          "tsSize\":%{private}d}";
    goto LABEL_13;
  }
  double v12 = 0.0;
  do
  {
    float v13 = *v6++;
    double v12 = v12 + v13;
  }
  while (v6 != v7);
  float v14 = v12;
  double v15 = v14;
  if (fabs(v14 + -1.0) > 0.001)
  {
    uint64_t v16 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v43 = 68289283;
      int v44 = 0;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2049;
      *(double *)long long v48 = v15;
      unint64_t v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,sumWeights invalid\", \"sumWeights\":\"%{private}.4f\"}";
      int v18 = v16;
      uint32_t v19 = 28;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v43, v19);
    }
    return 0;
  }
  if (v8 == 4)
  {
    *a3 = *(_DWORD *)v5;
    return 1;
  }
  __int16 v24 = 0;
  v25 = 0;
  int v26 = 0;
  unint64_t v27 = 0;
  do
  {
    int v28 = *(_DWORD *)&v5[4 * v27];
    float v29 = (*a2)[v27];
    if (v25 >= v26)
    {
      uint64_t v30 = (v25 - v24) >> 3;
      unint64_t v31 = v30 + 1;
      if ((unint64_t)(v30 + 1) >> 61) {
        sub_1000050E8();
      }
      if ((v26 - v24) >> 2 > v31) {
        unint64_t v31 = (v26 - v24) >> 2;
      }
      if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      if (v32)
      {
        if (v32 >> 61) {
          sub_100004E00();
        }
        int v33 = (char *)operator new(8 * v32);
      }
      else
      {
        int v33 = 0;
      }
      size_t v34 = &v33[8 * v30];
      *(_DWORD *)size_t v34 = v28;
      *((float *)v34 + 1) = v29;
      v35 = v34;
      while (v25 != v24)
      {
        uint64_t v36 = *((void *)v25 - 1);
        v25 -= 8;
        *((void *)v35 - 1) = v36;
        v35 -= 8;
      }
      int v26 = &v33[8 * v32];
      v25 = v34 + 8;
      if (v24) {
        operator delete(v24);
      }
      __int16 v24 = v35;
    }
    else
    {
      *(_DWORD *)v25 = v28;
      *((float *)v25 + 1) = v29;
      v25 += 8;
    }
    ++v27;
    int v5 = *a1;
  }
  while (v27 < (a1[1] - *a1) >> 2);
  unint64_t v37 = 126 - 2 * __clz((v25 - v24) >> 3);
  if (v25 == v24) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = v37;
  }
  sub_100095D34((unint64_t)v24, (float *)v25, v38, 1);
  if (((*((_DWORD *)a1 + 2) - *(_DWORD *)a1) & 4) != 0)
  {
    if (v25 != v24)
    {
      float v41 = 0.0;
      v40 = (float *)v24;
      while (1)
      {
        float v41 = v41 + v40[1];
        if (v41 > 0.5) {
          break;
        }
        v40 += 2;
        if (v40 == (float *)v25) {
          goto LABEL_52;
        }
      }
LABEL_56:
      *a3 = *(_DWORD *)v40;
      uint64_t v22 = 1;
      if (!v24) {
        return v22;
      }
LABEL_57:
      operator delete(v24);
      return v22;
    }
  }
  else if (v25 != v24)
  {
    float v39 = 0.0;
    v40 = (float *)v24;
    do
    {
      float v39 = v39 + v40[1];
      if (v39 >= 0.5) {
        goto LABEL_56;
      }
      v40 += 2;
    }
    while (v40 != (float *)v25);
  }
LABEL_52:
  v42 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    int v43 = 68289026;
    int v44 = 0;
    __int16 v45 = 2082;
    v46 = "";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,median not found\"}", (uint8_t *)&v43, 0x12u);
  }
  uint64_t v22 = 0;
  if (v24) {
    goto LABEL_57;
  }
  return v22;
}

void sub_100095104(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL SACommonUtils::didRebootSince(SACommonUtils *this, double a2)
{
  uint64_t v3 = mach_continuous_time();
  double v4 = sub_100087FDC(v3);
  return (double)(uint64_t)((double)(uint64_t)(double)time(0) - v4 + -978307200.0) >= a2;
}

uint64_t SACommonUtils::currentHourOfDay(SACommonUtils *this)
{
  unsigned int v4 = 0;
  v1 = CFCalendarCopyCurrent();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFCalendarDecomposeAbsoluteTime(v1, Current, "H", &v4);
  if (v1) {
    CFRelease(v1);
  }
  return v4;
}

void SACommonUtils::convertDictionaryToString(SACommonUtils *this@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = this;
  sub_10000DD48((void *)a2, "{}");
  if (v4)
  {
    id v12 = 0;
    int v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v12];
    id v6 = v12;
    if (v6 || !v5)
    {
      BOOL v10 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289283;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2113;
        *(void *)&buf[20] = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      id v7 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
      unint64_t v8 = v7;
      if (v7)
      {
        sub_10000DD48(buf, (char *)[v7 UTF8String]);
        if (*(char *)(a2 + 23) < 0) {
          operator delete(*(void **)a2);
        }
        *(_OWORD *)a2 = *(_OWORD *)buf;
        *(void *)(a2 + 16) = *(void *)&buf[16];
      }
      else
      {
        int v11 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString,str nil\"}", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    unint64_t v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString,dict nil\"}", buf, 0x12u);
    }
  }
}

void sub_100095448(_Unwind_Exception *a1)
{
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }

  _Unwind_Resume(a1);
}

id SACommonUtils::convertStringToDictionary(uint64_t *a1)
{
  v1 = a1;
  if (*((char *)a1 + 23) < 0)
  {
    if (!a1[1])
    {
LABEL_10:
      id v6 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        float v14 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary,empty string\"}", buf, 0x12u);
      }
      id v5 = 0;
      goto LABEL_21;
    }
    v1 = (uint64_t *)*a1;
  }
  else if (!*((unsigned char *)a1 + 23))
  {
    goto LABEL_10;
  }
  id v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v1);
  if (v2)
  {
    id v10 = 0;
    uint64_t v3 = +[NSJSONSerialization JSONObjectWithData:v2 options:1 error:&v10];
    id v4 = v10;
    if (v4 || !v3)
    {
      unint64_t v8 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        int v12 = 0;
        __int16 v13 = 2082;
        float v14 = "";
        __int16 v15 = 2113;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      id v5 = 0;
    }
    else
    {
      [v3 enumerateKeysAndObjectsUsingBlock:&stru_1000FA8D8];
      id v5 = v3;
    }
  }
  else
  {
    id v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      float v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary,null data\"}", buf, 0x12u);
    }
    id v5 = 0;
  }

LABEL_21:

  return v5;
}

void sub_1000956E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100095708(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    __int16 v13 = 2113;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

uint64_t SACommonUtils::convertHexToChar(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4)
{
  if (*(char *)(a1 + 23) >= 0) {
    unint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    unint64_t v4 = *(void *)(a1 + 8);
  }
  if (a3 < v4 >> 1)
  {
    uint64_t v6 = SALogObjectGeneral;
    BOOL v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v7)
    {
      int v28 = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      unint64_t v31 = "";
      __int16 v32 = 1025;
      unsigned int v33 = a3;
      __int16 v34 = 2049;
      unint64_t v35 = v4;
      __int16 v9 = "{\"msg%{public}.0s\":\"#commonUtils,convertHexToChar,invalid len\", \"len\":%{private}d, \"hex.size()\":%{private}llu}";
      id v10 = v6;
      uint32_t v11 = 34;
      goto LABEL_7;
    }
    return result;
  }
  *a4 = 0;
  BOOL v12 = *(char *)(a1 + 23) < 0;
  uint64_t v13 = *(unsigned __int8 *)(a1 + 23);
  if ((v13 & 0x80u) != 0) {
    uint64_t v13 = *(void *)(a1 + 8);
  }
  if (!v13)
  {
    unsigned int v22 = 0;
LABEL_32:
    *a4 = v22;
    return 1;
  }
  uint64_t v14 = 0;
  unsigned int v15 = 0;
  unsigned int v16 = 2;
  while (1)
  {
    uint64_t v17 = v12 ? *(void *)a1 : a1;
    if (*(unsigned __int8 *)(v17 + v14) - 48 >= 0xA)
    {
      if (*(unsigned __int8 *)(v17 + v14) - 97 >= 6)
      {
        if (*(unsigned __int8 *)(v17 + v14) - 65 >= 6)
        {
          uint64_t v25 = SALogObjectGeneral;
          BOOL v26 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
          uint64_t result = 0;
          if (!v26) {
            return result;
          }
          goto LABEL_37;
        }
        char v18 = -55;
      }
      else
      {
        char v18 = -87;
      }
    }
    else
    {
      char v18 = -48;
    }
    char v19 = *(unsigned char *)(v17 + v14);
    uint64_t v20 = v16 - 1;
    if (*(unsigned __int8 *)(v17 + v20) - 48 >= 0xA) {
      break;
    }
    char v21 = -48;
LABEL_27:
    *(unsigned char *)(a2 + v15) = (*(unsigned char *)(v17 + v20) + v21) | (16 * (v19 + v18));
    unsigned int v22 = v15 + 1;
    uint64_t v14 = v16;
    BOOL v12 = *(char *)(a1 + 23) < 0;
    unint64_t v23 = *(unsigned __int8 *)(a1 + 23);
    if ((v23 & 0x80u) != 0) {
      unint64_t v23 = *(void *)(a1 + 8);
    }
    BOOL v24 = v23 > v16;
    v16 += 2;
    unsigned int v15 = v22;
    if (!v24) {
      goto LABEL_32;
    }
  }
  if (*(unsigned __int8 *)(v17 + v20) - 97 < 6)
  {
    char v21 = -87;
    goto LABEL_27;
  }
  if (*(unsigned __int8 *)(v17 + v20) - 65 < 6)
  {
    char v21 = -55;
    goto LABEL_27;
  }
  uint64_t v25 = SALogObjectGeneral;
  BOOL v27 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (!v27) {
    return result;
  }
LABEL_37:
  int v28 = 68289026;
  int v29 = 0;
  __int16 v30 = 2082;
  unint64_t v31 = "";
  __int16 v9 = "{\"msg%{public}.0s\":\"#commonUtils,convertHexToChar,error\"}";
  id v10 = v25;
  uint32_t v11 = 18;
LABEL_7:
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v28, v11);
  return 0;
}

uint64_t SACommonUtils::convertCharToHex(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a2;
    do
    {
      char v7 = 1;
      do
      {
        unsigned int v8 = *(unsigned __int8 *)(a1 + v5);
        char v9 = v7;
        unsigned int v10 = v8 >> 4;
        int v11 = v8 & 0xF;
        if ((v9 & 1) == 0) {
          unsigned int v10 = v11;
        }
        if (v10 > 9) {
          char v12 = v10 + 87;
        }
        else {
          char v12 = v10 | 0x30;
        }
        sub_100095BA0((const void **)a3, v12, (uint64_t)&v14);
        if (*(char *)(a3 + 23) < 0) {
          operator delete(*(void **)a3);
        }
        *(_OWORD *)a3 = v14;
        *(void *)(a3 + 16) = v15;
        char v7 = 0;
      }
      while ((v9 & 1) != 0);
      ++v5;
    }
    while (v5 != v6);
  }
  return 1;
}

uint64_t sub_100095BA0@<X0>(const void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  uint64_t result = sub_1000970C8(a3, v5 + 1);
  if (*(char *)(result + 23) >= 0) {
    char v7 = (char *)result;
  }
  else {
    char v7 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      unsigned int v8 = a1;
    }
    else {
      unsigned int v8 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v7, v8, v5);
  }
  char v9 = &v7[v5];
  char *v9 = a2;
  v9[1] = 0;
  return result;
}

uint64_t SACommonUtils::copyDataAndReturnNewLen(SACommonUtils *this, void *a2, const void *a3, unsigned int a4, size_t __n, _DWORD *a6, unsigned int *a7)
{
  if (this && a2 && (int v7 = __n, __n <= a4) && *a6 + (int)__n <= a3)
  {
    memcpy(this, a2, __n);
    uint64_t result = (*a6 + v7);
    *a6 = result;
  }
  else
  {
    unsigned int v10 = SALogObjectGeneral;
    BOOL v11 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v11)
    {
      v12[0] = 68289026;
      v12[1] = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#bletransport,copyDataAndReturnNewLen invalid data\"}", (uint8_t *)v12, 0x12u);
      return 0;
    }
  }
  return result;
}

void sub_100095D34(unint64_t a1, float *a2, uint64_t a3, char a4)
{
LABEL_1:
  v165 = a2 - 2;
  unsigned int v10 = (float *)a1;
  while (1)
  {
    a1 = (unint64_t)v10;
    uint64_t v11 = (char *)a2 - (char *)v10;
    unint64_t v12 = ((char *)a2 - (char *)v10) >> 3;
    if (v5 || !v4)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          int v78 = *((_DWORD *)a2 - 2);
          float v79 = *v10;
          if (v78 == *(_DWORD *)v10)
          {
            float v80 = *(a2 - 1);
            float v81 = v10[1];
            if (v80 == v81) {
              unsigned __int8 v82 = 0;
            }
            else {
              unsigned __int8 v82 = -127;
            }
            if (v80 > v81) {
              unsigned __int8 v82 = 1;
            }
            if (v80 < v81) {
              unsigned __int8 v82 = -1;
            }
          }
          else if (v78 < SLODWORD(v79))
          {
            unsigned __int8 v82 = -1;
          }
          else
          {
            unsigned __int8 v82 = 1;
          }
          if (v82 != 129 && (v82 & 0x80) != 0)
          {
            *(_DWORD *)unsigned int v10 = v78;
            *(a2 - 2) = v79;
            int v150 = *((_DWORD *)v10 + 1);
            v10[1] = *(a2 - 1);
            *((_DWORD *)a2 - 1) = v150;
          }
          break;
        case 3uLL:
          sub_100096998(v10, v10 + 2, v165);
          break;
        case 4uLL:
          sub_100096DAC(v10, v10 + 2, v10 + 4, (uint64_t)v165);
          break;
        case 5uLL:
          sub_100096F04(v10, v10 + 2, v10 + 4, (uint64_t)(v10 + 6), (int *)v165);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v11 <= 191) {
      break;
    }
    if (!a3)
    {
      if (v10 == a2) {
        return;
      }
      int64_t v100 = (v12 - 2) >> 1;
      int64_t v101 = v100;
      do
      {
        int64_t v102 = v101;
        if (v100 >= v101)
        {
          uint64_t v103 = (2 * v101) | 1;
          v104 = &v10[2 * v103];
          if (2 * v102 + 2 < (uint64_t)v12)
          {
            int v105 = *((_DWORD *)v104 + 2);
            if (*(_DWORD *)v104 == v105)
            {
              float v106 = v10[2 * v103 + 1];
              float v107 = v104[3];
              if (v106 == v107) {
                char v108 = 0;
              }
              else {
                char v108 = -127;
              }
              if (v106 > v107) {
                char v108 = 1;
              }
              if (v106 < v107) {
                char v108 = -1;
              }
            }
            else if (*(_DWORD *)v104 < v105)
            {
              char v108 = -1;
            }
            else
            {
              char v108 = 1;
            }
            if (v108 != 129 && v108 < 0)
            {
              v104 += 2;
              uint64_t v103 = 2 * v102 + 2;
            }
          }
          v109 = &v10[2 * v102];
          int v110 = *(_DWORD *)v104;
          int v111 = *(_DWORD *)v109;
          if (*(_DWORD *)v104 == *(_DWORD *)v109)
          {
            float v112 = v104[1];
            float v113 = v10[2 * v102 + 1];
            if (v112 == v113) {
              unsigned __int8 v114 = 0;
            }
            else {
              unsigned __int8 v114 = -127;
            }
            if (v112 > v113) {
              unsigned __int8 v114 = 1;
            }
            if (v112 < v113) {
              unsigned __int8 v114 = -1;
            }
          }
          else if (v110 < v111)
          {
            unsigned __int8 v114 = -1;
          }
          else
          {
            unsigned __int8 v114 = 1;
          }
          if (v114 == 129 || (v114 & 0x80) == 0)
          {
            float v115 = v109[1];
            do
            {
              v116 = v109;
              v109 = v104;
              *(_DWORD *)v116 = v110;
              v116[1] = v104[1];
              if (v100 < v103) {
                break;
              }
              uint64_t v117 = (2 * v103) | 1;
              v104 = &v10[2 * v117];
              uint64_t v103 = 2 * v103 + 2;
              if (v103 < (uint64_t)v12)
              {
                int v118 = *((_DWORD *)v104 + 2);
                if (*(_DWORD *)v104 == v118)
                {
                  float v119 = v10[2 * v117 + 1];
                  float v120 = v104[3];
                  if (v119 == v120) {
                    char v121 = 0;
                  }
                  else {
                    char v121 = -127;
                  }
                  if (v119 > v120) {
                    char v121 = 1;
                  }
                  if (v119 < v120) {
                    char v121 = -1;
                  }
                }
                else
                {
                  char v121 = *(_DWORD *)v104 < v118 ? -1 : 1;
                }
                if (v121 != 129 && v121 < 0) {
                  v104 += 2;
                }
                else {
                  uint64_t v103 = v117;
                }
              }
              else
              {
                uint64_t v103 = v117;
              }
              int v110 = *(_DWORD *)v104;
              if (*(_DWORD *)v104 == v111)
              {
                float v122 = v104[1];
                if (v122 == v115) {
                  unsigned __int8 v123 = 0;
                }
                else {
                  unsigned __int8 v123 = -127;
                }
                if (v122 > v115) {
                  unsigned __int8 v123 = 1;
                }
                if (v122 < v115) {
                  unsigned __int8 v123 = -1;
                }
              }
              else
              {
                unsigned __int8 v123 = v110 < v111 ? -1 : 1;
              }
            }
            while (v123 == 129 || (v123 & 0x80) == 0);
            *(_DWORD *)v109 = v111;
            v109[1] = v115;
          }
        }
        int64_t v101 = v102 - 1;
      }
      while (v102);
      uint64_t v124 = (unint64_t)v11 >> 3;
      while (2)
      {
        uint64_t v125 = 0;
        float v126 = *v10;
        float v127 = v10[1];
        uint64_t v128 = v124 - 2;
        if (v124 < 2) {
          uint64_t v128 = v124 - 1;
        }
        uint64_t v129 = v128 >> 1;
        v130 = v10;
        do
        {
          uint64_t v131 = v125 + 1;
          v132 = &v130[2 * v125 + 2];
          uint64_t v133 = (2 * v125) | 1;
          uint64_t v134 = 2 * v125 + 2;
          if (v134 < v124)
          {
            int v135 = *((_DWORD *)v132 + 2);
            if (*(_DWORD *)v132 == v135)
            {
              float v136 = v130[2 * v131 + 1];
              float v137 = v132[3];
              if (v136 == v137) {
                char v138 = 0;
              }
              else {
                char v138 = -127;
              }
              if (v136 > v137) {
                char v138 = 1;
              }
              if (v136 < v137) {
                char v138 = -1;
              }
            }
            else if (*(_DWORD *)v132 < v135)
            {
              char v138 = -1;
            }
            else
            {
              char v138 = 1;
            }
            if (v138 != 129 && v138 < 0)
            {
              v132 += 2;
              uint64_t v133 = v134;
            }
          }
          float *v130 = *v132;
          v130[1] = v132[1];
          v130 = v132;
          uint64_t v125 = v133;
        }
        while (v133 <= v129);
        if (v132 != a2 - 2)
        {
          float *v132 = *(a2 - 2);
          v132[1] = *(a2 - 1);
          *(a2 - 2) = v126;
          *(a2 - 1) = v127;
          uint64_t v139 = (char *)v132 - (char *)v10 + 8;
          if (v139 >= 9)
          {
            unint64_t v140 = (((unint64_t)v139 >> 3) - 2) >> 1;
            v141 = &v10[2 * v140];
            int v142 = *(_DWORD *)v141;
            float v143 = *v132;
            if (*(_DWORD *)v141 == *(_DWORD *)v132)
            {
              float v144 = v141[1];
              float v145 = v132[1];
              if (v144 == v145) {
                unsigned __int8 v146 = 0;
              }
              else {
                unsigned __int8 v146 = -127;
              }
              if (v144 > v145) {
                unsigned __int8 v146 = 1;
              }
              if (v144 < v145) {
                unsigned __int8 v146 = -1;
              }
            }
            else
            {
              unsigned __int8 v146 = v142 < SLODWORD(v143) ? -1 : 1;
            }
            if (v146 != 129 && (v146 & 0x80) != 0)
            {
              float v127 = v132[1];
              do
              {
                v147 = v132;
                v132 = v141;
                *(_DWORD *)v147 = v142;
                v147[1] = v141[1];
                if (!v140) {
                  break;
                }
                unint64_t v140 = (v140 - 1) >> 1;
                v141 = &v10[2 * v140];
                int v142 = *(_DWORD *)v141;
                if (*(_DWORD *)v141 == LODWORD(v143))
                {
                  float v148 = v141[1];
                  if (v148 == v127) {
                    unsigned __int8 v149 = 0;
                  }
                  else {
                    unsigned __int8 v149 = -127;
                  }
                  if (v148 > v127) {
                    unsigned __int8 v149 = 1;
                  }
                  if (v148 < v127) {
                    unsigned __int8 v149 = -1;
                  }
                }
                else
                {
                  unsigned __int8 v149 = v142 < SLODWORD(v143) ? -1 : 1;
                }
              }
              while (v149 != 129 && (v149 & 0x80) != 0);
              float *v132 = v143;
LABEL_382:
              v132[1] = v127;
            }
          }
          a2 -= 2;
          BOOL v43 = v124-- <= 2;
          if (v43) {
            return;
          }
          continue;
        }
        break;
      }
      float *v132 = v126;
      goto LABEL_382;
    }
    unint64_t v13 = v12 >> 1;
    long long v14 = &v10[2 * (v12 >> 1)];
    if ((unint64_t)v11 >= 0x401)
    {
      sub_100096998((float *)a1, (float *)(a1 + 8 * (v12 >> 1)), v165);
      sub_100096998((float *)(a1 + 8), v14 - 2, a2 - 4);
      sub_100096998((float *)(a1 + 16), (float *)(a1 + 8 + 8 * v13), a2 - 6);
      sub_100096998(v14 - 2, v14, (float *)(a1 + 8 + 8 * v13));
      float v15 = *(float *)a1;
      *(float *)a1 = *v14;
      *long long v14 = v15;
      int v16 = *(_DWORD *)(a1 + 4);
      *(float *)(a1 + 4) = v14[1];
      *((_DWORD *)v14 + 1) = v16;
    }
    else
    {
      sub_100096998((float *)(a1 + 8 * (v12 >> 1)), (float *)a1, v165);
    }
    --a3;
    float v17 = *(float *)a1;
    if (a4) {
      goto LABEL_23;
    }
    int v18 = *(_DWORD *)(a1 - 8);
    if (v18 == LODWORD(v17))
    {
      float v19 = *(float *)(a1 - 4);
      float v20 = *(float *)(a1 + 4);
      if (v19 == v20) {
        unsigned __int8 v21 = 0;
      }
      else {
        unsigned __int8 v21 = -127;
      }
      if (v19 > v20) {
        unsigned __int8 v21 = 1;
      }
      if (v19 < v20) {
        unsigned __int8 v21 = -1;
      }
    }
    else
    {
      unsigned __int8 v21 = v18 < SLODWORD(v17) ? -1 : 1;
    }
    if (v21 != 129 && (v21 & 0x80) != 0)
    {
LABEL_23:
      uint64_t v22 = 0;
      float v23 = *(float *)(a1 + 4);
      do
      {
        int v24 = *(_DWORD *)(a1 + v22 + 8);
        if (v24 == LODWORD(v17))
        {
          float v25 = *(float *)(a1 + v22 + 12);
          if (v25 == v23) {
            unsigned __int8 v26 = 0;
          }
          else {
            unsigned __int8 v26 = -127;
          }
          if (v25 > v23) {
            unsigned __int8 v26 = 1;
          }
          if (v25 < v23) {
            unsigned __int8 v26 = -1;
          }
        }
        else if (v24 < SLODWORD(v17))
        {
          unsigned __int8 v26 = -1;
        }
        else
        {
          unsigned __int8 v26 = 1;
        }
        v22 += 8;
      }
      while (v26 != 129 && (v26 & 0x80) != 0);
      BOOL v27 = (float *)(a1 + v22);
      int v28 = a2;
      if (v22 == 8)
      {
        unsigned int v33 = a2;
        while (v27 < v33)
        {
          int v29 = v33 - 2;
          int v34 = *((_DWORD *)v33 - 2);
          if (v34 == LODWORD(v17))
          {
            float v35 = *(v33 - 1);
            if (v35 == v23) {
              char v36 = 0;
            }
            else {
              char v36 = -127;
            }
            if (v35 > v23) {
              char v36 = 1;
            }
            if (v35 < v23) {
              unsigned __int8 v37 = -1;
            }
            else {
              unsigned __int8 v37 = v36;
            }
          }
          else if (v34 < SLODWORD(v17))
          {
            unsigned __int8 v37 = -1;
          }
          else
          {
            unsigned __int8 v37 = 1;
          }
          unsigned int v33 = v29;
          if (v37 != 129)
          {
            unsigned int v33 = v29;
            if ((v37 & 0x80) != 0) {
              goto LABEL_70;
            }
          }
        }
        int v29 = v33;
      }
      else
      {
        while (1)
        {
          int v29 = v28 - 2;
          int v30 = *((_DWORD *)v28 - 2);
          if (v30 == LODWORD(v17))
          {
            float v31 = *(v28 - 1);
            if (v31 == v23) {
              unsigned __int8 v32 = 0;
            }
            else {
              unsigned __int8 v32 = -127;
            }
            if (v31 > v23) {
              unsigned __int8 v32 = 1;
            }
            if (v31 < v23) {
              unsigned __int8 v32 = -1;
            }
          }
          else if (v30 < SLODWORD(v17))
          {
            unsigned __int8 v32 = -1;
          }
          else
          {
            unsigned __int8 v32 = 1;
          }
          v28 -= 2;
          if (v32 != 129)
          {
            int v28 = v29;
            if ((v32 & 0x80) != 0) {
              break;
            }
          }
        }
      }
LABEL_70:
      if (v27 >= v29)
      {
        unsigned int v10 = v27;
      }
      else
      {
        int v38 = *(_DWORD *)v29;
        unsigned int v10 = v27;
        float v39 = v29;
        do
        {
          *(_DWORD *)unsigned int v10 = v38;
          *(_DWORD *)float v39 = v24;
          int v40 = *((_DWORD *)v10 + 1);
          v10[1] = v39[1];
          *((_DWORD *)v39 + 1) = v40;
          float v41 = v10;
          do
          {
            int v42 = *((_DWORD *)v10 + 2);
            v10 += 2;
            int v24 = v42;
            BOOL v43 = v42 < SLODWORD(v17);
            if (v42 == LODWORD(v17))
            {
              float v44 = v41[3];
              if (v44 == v23) {
                unsigned __int8 v45 = 0;
              }
              else {
                unsigned __int8 v45 = -127;
              }
              if (v44 > v23) {
                unsigned __int8 v45 = 1;
              }
              if (v44 < v23) {
                unsigned __int8 v45 = -1;
              }
            }
            else if (v43)
            {
              unsigned __int8 v45 = -1;
            }
            else
            {
              unsigned __int8 v45 = 1;
            }
            if (v45 == 129) {
              break;
            }
            float v41 = v10;
          }
          while ((v45 & 0x80) != 0);
          while (1)
          {
            v46 = v39 - 2;
            int v38 = *((_DWORD *)v39 - 2);
            if (v38 == LODWORD(v17))
            {
              float v47 = *(v39 - 1);
              if (v47 == v23) {
                char v48 = 0;
              }
              else {
                char v48 = -127;
              }
              if (v47 > v23) {
                char v48 = 1;
              }
              if (v47 < v23) {
                unsigned __int8 v49 = -1;
              }
              else {
                unsigned __int8 v49 = v48;
              }
            }
            else if (v38 < SLODWORD(v17))
            {
              unsigned __int8 v49 = -1;
            }
            else
            {
              unsigned __int8 v49 = 1;
            }
            float v39 = v46;
            if (v49 != 129)
            {
              float v39 = v46;
              if ((v49 & 0x80) != 0) {
                break;
              }
            }
          }
          float v39 = v46;
        }
        while (v10 < v46);
      }
      if (v10 - 2 != (float *)a1)
      {
        *(float *)a1 = *(v10 - 2);
        *(float *)(a1 + 4) = *(v10 - 1);
      }
      *(v10 - 2) = v17;
      *(v10 - 1) = v23;
      if (v27 < v29) {
        goto LABEL_108;
      }
      BOOL v50 = sub_100096B68((float *)a1, v10 - 2);
      if (sub_100096B68(v10, a2))
      {
        a2 = v10 - 2;
        if (v50) {
          return;
        }
        goto LABEL_1;
      }
      if (!v50)
      {
LABEL_108:
        sub_100095D34(a1, v10 - 2, a3, a4 & 1);
        a4 = 0;
      }
    }
    else
    {
      float v51 = *(float *)(a1 + 4);
      if (LODWORD(v17) == *(_DWORD *)v165)
      {
        float v52 = *(a2 - 1);
        if (v51 == v52) {
          unsigned __int8 v53 = 0;
        }
        else {
          unsigned __int8 v53 = -127;
        }
        if (v51 > v52) {
          unsigned __int8 v53 = 1;
        }
        if (v51 < v52) {
          unsigned __int8 v53 = -1;
        }
      }
      else if (SLODWORD(v17) < *(_DWORD *)v165)
      {
        unsigned __int8 v53 = -1;
      }
      else
      {
        unsigned __int8 v53 = 1;
      }
      if (v53 == 129 || (v53 & 0x80) == 0)
      {
        v58 = (float *)(a1 + 8);
        do
        {
          unsigned int v10 = v58;
          if (v58 >= a2) {
            break;
          }
          if (LODWORD(v17) == *(_DWORD *)v58)
          {
            float v59 = v58[1];
            if (v51 == v59) {
              unsigned __int8 v60 = 0;
            }
            else {
              unsigned __int8 v60 = -127;
            }
            if (v51 > v59) {
              unsigned __int8 v60 = 1;
            }
            if (v51 < v59) {
              unsigned __int8 v60 = -1;
            }
          }
          else
          {
            unsigned __int8 v60 = SLODWORD(v17) < *(_DWORD *)v58 ? -1 : 1;
          }
          v58 += 2;
        }
        while (v60 == 129 || (v60 & 0x80) == 0);
      }
      else
      {
        unint64_t v54 = a1;
        while (1)
        {
          unsigned int v10 = (float *)(v54 + 8);
          int v55 = *(_DWORD *)(v54 + 8);
          if (LODWORD(v17) == v55)
          {
            float v56 = *(float *)(v54 + 12);
            if (v51 == v56) {
              unsigned __int8 v57 = 0;
            }
            else {
              unsigned __int8 v57 = -127;
            }
            if (v51 > v56) {
              unsigned __int8 v57 = 1;
            }
            if (v51 < v56) {
              unsigned __int8 v57 = -1;
            }
          }
          else if (SLODWORD(v17) < v55)
          {
            unsigned __int8 v57 = -1;
          }
          else
          {
            unsigned __int8 v57 = 1;
          }
          v54 += 8;
          if (v57 != 129)
          {
            unint64_t v54 = (unint64_t)v10;
            if ((v57 & 0x80) != 0) {
              break;
            }
          }
        }
      }
      v61 = a2;
      if (v10 < a2)
      {
        v62 = a2;
        v61 = a2;
        do
        {
          int v63 = *((_DWORD *)v61 - 2);
          v61 -= 2;
          BOOL v64 = SLODWORD(v17) < v63;
          if (LODWORD(v17) == v63)
          {
            float v65 = *(v62 - 1);
            if (v51 == v65) {
              unsigned __int8 v66 = 0;
            }
            else {
              unsigned __int8 v66 = -127;
            }
            if (v51 > v65) {
              unsigned __int8 v66 = 1;
            }
            if (v51 < v65) {
              unsigned __int8 v66 = -1;
            }
          }
          else if (v64)
          {
            unsigned __int8 v66 = -1;
          }
          else
          {
            unsigned __int8 v66 = 1;
          }
          if (v66 == 129) {
            break;
          }
          v62 = v61;
        }
        while ((v66 & 0x80) != 0);
      }
      if (v10 < v61)
      {
        float v67 = *v10;
        float v68 = *v61;
        do
        {
          float *v10 = v68;
          float *v61 = v67;
          int v69 = *((_DWORD *)v10 + 1);
          v10[1] = v61[1];
          *((_DWORD *)v61 + 1) = v69;
          v70 = v10;
          while (1)
          {
            unsigned int v10 = v70 + 2;
            float v67 = v70[2];
            if (LODWORD(v17) == LODWORD(v67))
            {
              float v71 = v70[3];
              if (v51 == v71) {
                unsigned __int8 v72 = 0;
              }
              else {
                unsigned __int8 v72 = -127;
              }
              if (v51 > v71) {
                unsigned __int8 v72 = 1;
              }
              if (v51 < v71) {
                unsigned __int8 v72 = -1;
              }
            }
            else if (SLODWORD(v17) < SLODWORD(v67))
            {
              unsigned __int8 v72 = -1;
            }
            else
            {
              unsigned __int8 v72 = 1;
            }
            v70 += 2;
            if (v72 != 129)
            {
              v70 = v10;
              if ((v72 & 0x80) != 0) {
                break;
              }
            }
          }
          v73 = v61;
          do
          {
            float v74 = *(v61 - 2);
            v61 -= 2;
            float v68 = v74;
            BOOL v75 = SLODWORD(v17) < SLODWORD(v74);
            if (LODWORD(v17) == LODWORD(v74))
            {
              float v76 = *(v73 - 1);
              if (v51 == v76) {
                unsigned __int8 v77 = 0;
              }
              else {
                unsigned __int8 v77 = -127;
              }
              if (v51 > v76) {
                unsigned __int8 v77 = 1;
              }
              if (v51 < v76) {
                unsigned __int8 v77 = -1;
              }
            }
            else if (v75)
            {
              unsigned __int8 v77 = -1;
            }
            else
            {
              unsigned __int8 v77 = 1;
            }
            if (v77 == 129) {
              break;
            }
            v73 = v61;
          }
          while ((v77 & 0x80) != 0);
        }
        while (v10 < v61);
      }
      BOOL v4 = (unint64_t)(v10 - 2) >= a1;
      BOOL v5 = v10 - 2 == (float *)a1;
      if (v10 - 2 != (float *)a1)
      {
        *(float *)a1 = *(v10 - 2);
        *(float *)(a1 + 4) = *(v10 - 1);
      }
      a4 = 0;
      *(v10 - 2) = v17;
      *(v10 - 1) = v51;
    }
  }
  v83 = v10 + 2;
  BOOL v85 = v10 == a2 || v83 == a2;
  if (a4)
  {
    if (!v85)
    {
      uint64_t v86 = 0;
      v87 = v10;
      do
      {
        v88 = v87;
        v87 = v83;
        int v89 = *((_DWORD *)v88 + 2);
        int v90 = *(_DWORD *)v88;
        if (v89 == *(_DWORD *)v88)
        {
          float v91 = v88[3];
          float v92 = v88[1];
          if (v91 == v92) {
            unsigned __int8 v93 = 0;
          }
          else {
            unsigned __int8 v93 = -127;
          }
          if (v91 > v92) {
            unsigned __int8 v93 = 1;
          }
          if (v91 < v92) {
            unsigned __int8 v93 = -1;
          }
        }
        else if (v89 < v90)
        {
          unsigned __int8 v93 = -1;
        }
        else
        {
          unsigned __int8 v93 = 1;
        }
        if (v93 != 129 && (v93 & 0x80) != 0)
        {
          float v94 = v88[3];
          uint64_t v95 = v86;
          while (1)
          {
            v96 = (char *)v10 + v95;
            *((_DWORD *)v96 + 2) = v90;
            *((float *)v96 + 3) = *(float *)((char *)v10 + v95 + 4);
            if (!v95) {
              break;
            }
            int v90 = *((_DWORD *)v96 - 2);
            if (v89 == v90)
            {
              float v97 = *(float *)((char *)v10 + v95 - 4);
              if (v94 == v97) {
                unsigned __int8 v98 = 0;
              }
              else {
                unsigned __int8 v98 = -127;
              }
              if (v94 > v97) {
                unsigned __int8 v98 = 1;
              }
              if (v94 < v97) {
                unsigned __int8 v98 = -1;
              }
            }
            else if (v89 < v90)
            {
              unsigned __int8 v98 = -1;
            }
            else
            {
              unsigned __int8 v98 = 1;
            }
            v95 -= 8;
            if (v98 == 129 || (v98 & 0x80) == 0)
            {
              uint64_t v99 = (uint64_t)v10 + v95 + 8;
              goto LABEL_261;
            }
          }
          uint64_t v99 = (uint64_t)v10;
LABEL_261:
          *(_DWORD *)uint64_t v99 = v89;
          *(float *)(v99 + 4) = v94;
        }
        v83 = v87 + 2;
        v86 += 8;
      }
      while (v87 + 2 != a2);
    }
  }
  else if (!v85)
  {
    v151 = v10 + 3;
    do
    {
      unint64_t v152 = a1;
      a1 = (unint64_t)v83;
      int v153 = *(_DWORD *)(v152 + 8);
      int v154 = *(_DWORD *)v152;
      if (v153 == *(_DWORD *)v152)
      {
        float v155 = *(float *)(v152 + 12);
        float v156 = *(float *)(v152 + 4);
        if (v155 == v156) {
          unsigned __int8 v157 = 0;
        }
        else {
          unsigned __int8 v157 = -127;
        }
        if (v155 > v156) {
          unsigned __int8 v157 = 1;
        }
        if (v155 < v156) {
          unsigned __int8 v157 = -1;
        }
      }
      else if (v153 < v154)
      {
        unsigned __int8 v157 = -1;
      }
      else
      {
        unsigned __int8 v157 = 1;
      }
      if (v157 != 129 && (v157 & 0x80) != 0)
      {
        float v158 = *(float *)(v152 + 12);
        v159 = v151;
        v160 = v151;
        do
        {
          *((_DWORD *)v159 - 1) = v154;
          int v161 = *((_DWORD *)v160 - 2);
          v160 -= 2;
          *(_DWORD *)v159 = v161;
          int v154 = *((_DWORD *)v159 - 5);
          if (v153 == v154)
          {
            float v162 = *(v159 - 4);
            if (v158 == v162) {
              char v163 = 0;
            }
            else {
              char v163 = -127;
            }
            if (v158 > v162) {
              char v163 = 1;
            }
            if (v158 < v162) {
              unsigned __int8 v164 = -1;
            }
            else {
              unsigned __int8 v164 = v163;
            }
          }
          else if (v153 < v154)
          {
            unsigned __int8 v164 = -1;
          }
          else
          {
            unsigned __int8 v164 = 1;
          }
          if (v164 == 129) {
            break;
          }
          v159 = v160;
        }
        while ((v164 & 0x80) != 0);
        *((_DWORD *)v160 - 1) = v153;
        float *v160 = v158;
      }
      v83 = (float *)(a1 + 8);
      v151 += 2;
    }
    while ((float *)(a1 + 8) != a2);
  }
}

float *sub_100096998(float *result, float *a2, float *a3)
{
  float v3 = *a2;
  float v4 = *result;
  if (*(_DWORD *)a2 == *(_DWORD *)result)
  {
    float v5 = a2[1];
    float v6 = result[1];
    if (v5 == v6) {
      char v7 = 0;
    }
    else {
      char v7 = -127;
    }
    if (v5 > v6) {
      char v7 = 1;
    }
    if (v5 < v6) {
      unsigned __int8 v8 = -1;
    }
    else {
      unsigned __int8 v8 = v7;
    }
  }
  else if (SLODWORD(v3) < SLODWORD(v4))
  {
    unsigned __int8 v8 = -1;
  }
  else
  {
    unsigned __int8 v8 = 1;
  }
  float v9 = *a3;
  if (v8 == 129 || (v8 & 0x80) == 0)
  {
    if (LODWORD(v9) == LODWORD(v3))
    {
      float v13 = a3[1];
      float v14 = a2[1];
      if (v13 == v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = -127;
      }
      if (v13 > v14) {
        unsigned __int8 v15 = 1;
      }
      if (v13 < v14) {
        unsigned __int8 v15 = -1;
      }
    }
    else if (SLODWORD(v9) < SLODWORD(v3))
    {
      unsigned __int8 v15 = -1;
    }
    else
    {
      unsigned __int8 v15 = 1;
    }
    if (v15 != 129 && (v15 & 0x80) != 0)
    {
      *a2 = v9;
      *a3 = v3;
      int v17 = *((_DWORD *)a2 + 1);
      a2[1] = a3[1];
      *((_DWORD *)a3 + 1) = v17;
      float v18 = *a2;
      float v19 = *result;
      if (*(_DWORD *)a2 == *(_DWORD *)result)
      {
        float v20 = a2[1];
        float v21 = result[1];
        if (v20 == v21) {
          unsigned __int8 v22 = 0;
        }
        else {
          unsigned __int8 v22 = -127;
        }
        if (v20 > v21) {
          unsigned __int8 v22 = 1;
        }
        if (v20 < v21) {
          unsigned __int8 v22 = -1;
        }
      }
      else if (SLODWORD(v18) < SLODWORD(v19))
      {
        unsigned __int8 v22 = -1;
      }
      else
      {
        unsigned __int8 v22 = 1;
      }
      if (v22 != 129 && (v22 & 0x80) != 0)
      {
        *uint64_t result = v18;
        *a2 = v19;
        int v26 = *((_DWORD *)result + 1);
        result[1] = a2[1];
        *((_DWORD *)a2 + 1) = v26;
      }
    }
  }
  else
  {
    if (LODWORD(v9) == LODWORD(v3))
    {
      float v10 = a3[1];
      float v11 = a2[1];
      if (v10 == v11) {
        unsigned __int8 v12 = 0;
      }
      else {
        unsigned __int8 v12 = -127;
      }
      if (v10 > v11) {
        unsigned __int8 v12 = 1;
      }
      if (v10 < v11) {
        unsigned __int8 v12 = -1;
      }
    }
    else if (SLODWORD(v9) < SLODWORD(v3))
    {
      unsigned __int8 v12 = -1;
    }
    else
    {
      unsigned __int8 v12 = 1;
    }
    if (v12 != 129 && (v12 & 0x80) != 0)
    {
      *uint64_t result = v9;
      *a3 = v4;
      float v16 = result[1];
      result[1] = a3[1];
LABEL_70:
      a3[1] = v16;
      return result;
    }
    *uint64_t result = v3;
    *a2 = v4;
    float v16 = result[1];
    result[1] = a2[1];
    a2[1] = v16;
    float v23 = *a3;
    if (*(_DWORD *)a3 == LODWORD(v4))
    {
      float v24 = a3[1];
      if (v24 == v16) {
        unsigned __int8 v25 = 0;
      }
      else {
        unsigned __int8 v25 = -127;
      }
      if (v24 > v16) {
        unsigned __int8 v25 = 1;
      }
      if (v24 < v16) {
        unsigned __int8 v25 = -1;
      }
    }
    else if (SLODWORD(v23) < SLODWORD(v4))
    {
      unsigned __int8 v25 = -1;
    }
    else
    {
      unsigned __int8 v25 = 1;
    }
    if (v25 != 129 && (v25 & 0x80) != 0)
    {
      *a2 = v23;
      *a3 = v4;
      a2[1] = a3[1];
      goto LABEL_70;
    }
  }
  return result;
}

BOOL sub_100096B68(float *a1, float *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      int v6 = *((_DWORD *)a2 - 2);
      float v7 = *a1;
      if (v6 == *(_DWORD *)a1)
      {
        float v8 = *(a2 - 1);
        float v9 = a1[1];
        if (v8 == v9) {
          unsigned __int8 v10 = 0;
        }
        else {
          unsigned __int8 v10 = -127;
        }
        if (v8 > v9) {
          unsigned __int8 v10 = 1;
        }
        if (v8 < v9) {
          unsigned __int8 v10 = -1;
        }
      }
      else if (v6 < SLODWORD(v7))
      {
        unsigned __int8 v10 = -1;
      }
      else
      {
        unsigned __int8 v10 = 1;
      }
      if (v10 != 129 && (v10 & 0x80) != 0)
      {
        *(_DWORD *)a1 = v6;
        *(a2 - 2) = v7;
        int v26 = *((_DWORD *)a1 + 1);
        a1[1] = *(a2 - 1);
        *((_DWORD *)a2 - 1) = v26;
      }
      return result;
    case 3:
      sub_100096998(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      sub_100096DAC(a1, a1 + 2, a1 + 4, (uint64_t)(a2 - 2));
      return 1;
    case 5:
      sub_100096F04(a1, a1 + 2, a1 + 4, (uint64_t)(a1 + 6), (int *)a2 - 2);
      return 1;
    default:
      float v11 = a1 + 4;
      sub_100096998(a1, a1 + 2, a1 + 4);
      unsigned __int8 v12 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    int v15 = *(_DWORD *)v12;
    int v16 = *(_DWORD *)v11;
    if (*(_DWORD *)v12 == *(_DWORD *)v11)
    {
      float v17 = v12[1];
      float v18 = v11[1];
      if (v17 == v18) {
        unsigned __int8 v19 = 0;
      }
      else {
        unsigned __int8 v19 = -127;
      }
      if (v17 > v18) {
        unsigned __int8 v19 = 1;
      }
      if (v17 < v18) {
        unsigned __int8 v19 = -1;
      }
    }
    else
    {
      unsigned __int8 v19 = v15 < v16 ? -1 : 1;
    }
    if (v19 != 129 && (v19 & 0x80) != 0)
    {
      float v20 = v12[1];
      uint64_t v21 = v13;
      while (1)
      {
        unsigned __int8 v22 = (_DWORD *)((char *)a1 + v21);
        v22[6] = v16;
        v22[7] = *(_DWORD *)((char *)a1 + v21 + 20);
        if (v21 == -16) {
          break;
        }
        int v16 = v22[2];
        if (v15 == v16)
        {
          float v23 = *(float *)((char *)a1 + v21 + 12);
          if (v20 == v23) {
            unsigned __int8 v24 = 0;
          }
          else {
            unsigned __int8 v24 = -127;
          }
          if (v20 > v23) {
            unsigned __int8 v24 = 1;
          }
          if (v20 < v23) {
            unsigned __int8 v24 = -1;
          }
        }
        else if (v15 < v16)
        {
          unsigned __int8 v24 = -1;
        }
        else
        {
          unsigned __int8 v24 = 1;
        }
        v21 -= 8;
        if (v24 == 129 || (v24 & 0x80) == 0)
        {
          uint64_t v25 = (uint64_t)a1 + v21 + 24;
          goto LABEL_42;
        }
      }
      uint64_t v25 = (uint64_t)a1;
LABEL_42:
      *(_DWORD *)uint64_t v25 = v15;
      *(float *)(v25 + 4) = v20;
      if (++v14 == 8) {
        return v12 + 2 == a2;
      }
    }
    float v11 = v12;
    v13 += 8;
    v12 += 2;
    if (v12 == a2) {
      return 1;
    }
  }
}

float sub_100096DAC(float *a1, float *a2, float *a3, uint64_t a4)
{
  sub_100096998(a1, a2, a3);
  int v9 = *(_DWORD *)a4;
  float v10 = *a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3)
  {
    float result = *(float *)(a4 + 4);
    float v11 = a3[1];
    if (result == v11) {
      unsigned __int8 v12 = 0;
    }
    else {
      unsigned __int8 v12 = -127;
    }
    if (result > v11) {
      unsigned __int8 v12 = 1;
    }
    if (result < v11) {
      unsigned __int8 v12 = -1;
    }
  }
  else if (v9 < SLODWORD(v10))
  {
    unsigned __int8 v12 = -1;
  }
  else
  {
    unsigned __int8 v12 = 1;
  }
  if (v12 != 129 && (v12 & 0x80) != 0)
  {
    *(_DWORD *)a3 = v9;
    *(float *)a4 = v10;
    float result = a3[1];
    a3[1] = *(float *)(a4 + 4);
    *(float *)(a4 + 4) = result;
    float v13 = *a3;
    float v14 = *a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2)
    {
      float result = a3[1];
      float v15 = a2[1];
      if (result == v15) {
        unsigned __int8 v16 = 0;
      }
      else {
        unsigned __int8 v16 = -127;
      }
      if (result > v15) {
        unsigned __int8 v16 = 1;
      }
      if (result < v15) {
        unsigned __int8 v16 = -1;
      }
    }
    else if (SLODWORD(v13) < SLODWORD(v14))
    {
      unsigned __int8 v16 = -1;
    }
    else
    {
      unsigned __int8 v16 = 1;
    }
    if (v16 != 129 && (v16 & 0x80) != 0)
    {
      *a2 = v13;
      *a3 = v14;
      float result = a2[1];
      a2[1] = a3[1];
      a3[1] = result;
      float v17 = *a2;
      float v18 = *a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1)
      {
        float result = a2[1];
        float v19 = a1[1];
        if (result == v19) {
          unsigned __int8 v20 = 0;
        }
        else {
          unsigned __int8 v20 = -127;
        }
        if (result > v19) {
          unsigned __int8 v20 = 1;
        }
        if (result < v19) {
          unsigned __int8 v20 = -1;
        }
      }
      else if (SLODWORD(v17) < SLODWORD(v18))
      {
        unsigned __int8 v20 = -1;
      }
      else
      {
        unsigned __int8 v20 = 1;
      }
      if (v20 != 129 && (v20 & 0x80) != 0)
      {
        *a1 = v17;
        *a2 = v18;
        float result = a1[1];
        a1[1] = a2[1];
        a2[1] = result;
      }
    }
  }
  return result;
}

float sub_100096F04(float *a1, float *a2, float *a3, uint64_t a4, int *a5)
{
  float result = sub_100096DAC(a1, a2, a3, a4);
  int v11 = *a5;
  int v12 = *(_DWORD *)a4;
  if (*a5 == *(_DWORD *)a4)
  {
    float result = *((float *)a5 + 1);
    float v13 = *(float *)(a4 + 4);
    if (result == v13) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = -127;
    }
    if (result > v13) {
      unsigned __int8 v14 = 1;
    }
    if (result < v13) {
      unsigned __int8 v14 = -1;
    }
  }
  else if (v11 < v12)
  {
    unsigned __int8 v14 = -1;
  }
  else
  {
    unsigned __int8 v14 = 1;
  }
  if (v14 != 129 && (v14 & 0x80) != 0)
  {
    *(_DWORD *)a4 = v11;
    *a5 = v12;
    float result = *(float *)(a4 + 4);
    *(_DWORD *)(a4 + 4) = a5[1];
    *((float *)a5 + 1) = result;
    int v15 = *(_DWORD *)a4;
    float v16 = *a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3)
    {
      float result = *(float *)(a4 + 4);
      float v17 = a3[1];
      if (result == v17) {
        unsigned __int8 v18 = 0;
      }
      else {
        unsigned __int8 v18 = -127;
      }
      if (result > v17) {
        unsigned __int8 v18 = 1;
      }
      if (result < v17) {
        unsigned __int8 v18 = -1;
      }
    }
    else if (v15 < SLODWORD(v16))
    {
      unsigned __int8 v18 = -1;
    }
    else
    {
      unsigned __int8 v18 = 1;
    }
    if (v18 != 129 && (v18 & 0x80) != 0)
    {
      *(_DWORD *)a3 = v15;
      *(float *)a4 = v16;
      float result = a3[1];
      a3[1] = *(float *)(a4 + 4);
      *(float *)(a4 + 4) = result;
      float v19 = *a3;
      float v20 = *a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2)
      {
        float result = a3[1];
        float v21 = a2[1];
        if (result == v21) {
          unsigned __int8 v22 = 0;
        }
        else {
          unsigned __int8 v22 = -127;
        }
        if (result > v21) {
          unsigned __int8 v22 = 1;
        }
        if (result < v21) {
          unsigned __int8 v22 = -1;
        }
      }
      else if (SLODWORD(v19) < SLODWORD(v20))
      {
        unsigned __int8 v22 = -1;
      }
      else
      {
        unsigned __int8 v22 = 1;
      }
      if (v22 != 129 && (v22 & 0x80) != 0)
      {
        *a2 = v19;
        *a3 = v20;
        float result = a2[1];
        a2[1] = a3[1];
        a3[1] = result;
        float v23 = *a2;
        float v24 = *a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1)
        {
          float result = a2[1];
          float v25 = a1[1];
          if (result == v25) {
            unsigned __int8 v26 = 0;
          }
          else {
            unsigned __int8 v26 = -127;
          }
          if (result > v25) {
            unsigned __int8 v26 = 1;
          }
          if (result < v25) {
            unsigned __int8 v26 = -1;
          }
        }
        else if (SLODWORD(v23) < SLODWORD(v24))
        {
          unsigned __int8 v26 = -1;
        }
        else
        {
          unsigned __int8 v26 = 1;
        }
        if (v26 != 129 && (v26 & 0x80) != 0)
        {
          *a1 = v23;
          *a2 = v24;
          float result = a1[1];
          a1[1] = a2[1];
          a2[1] = result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000970C8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004D58();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    int v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t SASettings::instance(SASettings *this)
{
  v1 = sub_10003E368();
  if (*((unsigned char *)v1 + 296))
  {
    uint64_t result = SASettingsTest::fInstance;
    if (!SASettingsTest::fInstance) {
      operator new();
    }
  }
  else
  {
    return SASettingsProd::instance((SASettingsProd *)v1);
  }
  return result;
}

uint64_t SASettings::finalize(SASettings *this)
{
  if (*((unsigned char *)sub_10003E368() + 296)) {
    v1 = &SASettingsTest::fInstance;
  }
  else {
    v1 = &SASettingsProd::fInstance;
  }
  uint64_t result = *v1;
  if (*v1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    uint64_t *v1 = 0;
  }
  return result;
}

void SACoreRoutine::create(void *a1)
{
  if (*((unsigned char *)sub_10003E368() + 240)) {
    sub_1000972EC();
  }
  sub_100097484();
}

void sub_1000972D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000972EC()
{
}

void sub_100097418(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void sub_100097484()
{
}

void sub_1000975B0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void sub_1000978DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100097AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void sub_100097E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  if (a18 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_100097FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_1000981C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000983B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009854C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000986A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000988A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000988F8(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  float v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    float v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    __int16 v13 = 2113;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,userInfoDict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

void sub_1000989E4(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  float v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    float v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    __int16 v13 = 2113;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,metaDataDict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

void sub_100098B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100098CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100098D00(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v23 = a3;
  id v5 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) UTF8String];
    uint64_t buf = 68289795;
    __int16 v30 = 2082;
    float v31 = "";
    __int16 v32 = 2113;
    id v33 = v22;
    __int16 v34 = 2114;
    id v35 = v23;
    __int16 v36 = 2081;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,getRegisteredChannelsForTopicResult\", \"channels\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"topic\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x30u);
  }

  if (v23)
  {
    float v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v30 = 2082;
      float v31 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,unableToFetchChannels\"}", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v22;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          __int16 v13 = *(void **)(a1 + 40);
          id v14 = [v12 channelID:v22];
          LOBYTE(v13) = [v13 isSubscribedChannel:v14];

          int v15 = (id)SALogObjectGeneral;
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v16)
            {
              id v17 = [v12 channelID];
              id v18 = [v17 UTF8String];
              uint64_t buf = 68289283;
              __int16 v30 = 2082;
              float v31 = "";
              __int16 v32 = 2081;
              id v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,isActive\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
            }
          }
          else
          {
            if (v16)
            {
              id v19 = [v12 channelID];
              id v20 = [v19 UTF8String];
              uint64_t buf = 68289283;
              __int16 v30 = 2082;
              float v31 = "";
              __int16 v32 = 2081;
              id v33 = v20;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,unsub\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
            }
            [*(id *)(*(void *)(a1 + 40) + 8) unsubscribeFromChannel:v12 forTopic:*(void *)(a1 + 32)];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      (*(void (**)(void))(v21 + 16))();
    }
  }
}

void sub_10009908C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t SACloudChannelProd::SACloudChannelProd(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  sub_100027E74((uint64_t)v17, a3);
  sub_10007C28C((uint64_t)v16, a4);
  *(void *)a1 = off_1000FAA58;
  sub_100027DF0(v16);
  sub_10002809C(v17);
  *(void *)a1 = &off_1000FA970;
  id v8 = v7;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = 0;
  sub_100027E74(a1 + 24, a3);
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  id v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 68289026;
    v13[1] = 0;
    __int16 v14 = 2082;
    int v15 = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,SAChannelManager()\"}", (uint8_t *)v13, 0x12u);
  }
  uint64_t v10 = [[SACloudChannelsInterface alloc] initWithQueue:*(void *)(a1 + 8) isProduction:*((unsigned char *)sub_10003E368() + 26) == 0 channelType:0];
  __int16 v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;

  [*(id *)(a1 + 16) setChannelProxy:a1];
  return a1;
}

void sub_100099344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000993A0(uint64_t a1)
{
  *(void *)a1 = &off_1000FA970;
  [*(id *)(a1 + 16) cleanup];
  float v3 = (void **)(a1 + 56);
  sub_100005360(&v3);
  sub_10002809C((void *)(a1 + 24));

  return a1;
}

void sub_100099420(uint64_t a1)
{
  sub_1000993A0(a1);

  operator delete();
}

CFStringRef sub_100099458(int a1)
{
  if (a1 == 2)
  {
    float v3 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe\"}", (uint8_t *)&v5, 0x12u);
    }
    return @"com.apple.aps.mantis.safetyalert";
  }
  else if (a1)
  {
    uint64_t v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe,invalid type\"}", (uint8_t *)&v5, 0x12u);
    }
    return 0;
  }
  else
  {
    v1 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe,Alert\"}", (uint8_t *)&v5, 0x12u);
    }
    return @"com.apple.aps.locationd.safetyalert";
  }
}

void sub_1000995EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100099458(*((_DWORD *)a2 + 6));
  int v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0) {
      int v6 = a2;
    }
    else {
      int v6 = (uint64_t *)*a2;
    }
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2081;
    uint64_t v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribeRequest\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v16, 0x1Cu);
  }
  if (sub_100004E34(*(void *)(a1 + 56), *(void *)(a1 + 64), (unsigned __int8 **)a2) == *(void *)(a1 + 64))
  {
    int v9 = *((char *)a2 + 23);
    uint64_t v10 = (uint64_t *)*a2;
    NSStringEncoding v11 = +[NSString defaultCStringEncoding];
    if (v9 >= 0) {
      id v12 = a2;
    }
    else {
      id v12 = v10;
    }
    __int16 v13 = +[NSString stringWithCString:v12 encoding:v11];
    [*(id *)(a1 + 16) subscribe:v13 topic:v4];
    unint64_t v14 = *(void *)(a1 + 64);
    if (v14 >= *(void *)(a1 + 72))
    {
      uint64_t v15 = sub_100004F4C((uint64_t *)(a1 + 56), (long long *)a2);
    }
    else
    {
      sub_100004EEC((void *)(a1 + 56), (long long *)a2);
      uint64_t v15 = v14 + 24;
    }
    *(void *)(a1 + 64) = v15;
  }
  else
  {
    __int16 v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) >= 0) {
        id v8 = a2;
      }
      else {
        id v8 = (uint64_t *)*a2;
      }
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2081;
      uint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,AlreadySubscribed\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

void sub_100099804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100099828(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100099458(*((_DWORD *)a2 + 6));
  int v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0) {
      int v6 = (unsigned __int8 *)a2;
    }
    else {
      int v6 = (unsigned __int8 *)*a2;
    }
    int v27 = 68289283;
    int v28 = 0;
    __int16 v29 = 2082;
    __int16 v30 = "";
    __int16 v31 = 2081;
    __int16 v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,unsubscribeRequest\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v27, 0x1Cu);
  }
  if (sub_100004E34(*(void *)(a1 + 56), *(void *)(a1 + 64), (unsigned __int8 **)a2) == *(void *)(a1 + 64))
  {
    long long v25 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) >= 0) {
        long long v26 = (unsigned __int8 *)a2;
      }
      else {
        long long v26 = (unsigned __int8 *)*a2;
      }
      int v27 = 68289283;
      int v28 = 0;
      __int16 v29 = 2082;
      __int16 v30 = "";
      __int16 v31 = 2081;
      __int16 v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,NotSubscribed\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v27, 0x1Cu);
    }
  }
  else
  {
    int v7 = *((char *)a2 + 23);
    id v8 = (uint64_t *)*a2;
    NSStringEncoding v9 = +[NSString defaultCStringEncoding];
    if (v7 >= 0) {
      uint64_t v10 = a2;
    }
    else {
      uint64_t v10 = v8;
    }
    NSStringEncoding v11 = +[NSString stringWithCString:v10 encoding:v9];
    [*(id *)(a1 + 16) unsubscribe:v11 topic:v4];
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = sub_100004E34(*(void *)(a1 + 56), v12, (unsigned __int8 **)a2);
    if (v13 == v12)
    {
      uint64_t v16 = v12;
    }
    else
    {
      uint64_t v14 = v13;
      uint64_t v15 = v13 + 24;
      if (v13 + 24 != v12)
      {
        uint64_t v16 = v13;
        while (1)
        {
          uint64_t v17 = v14;
          uint64_t v14 = v15;
          uint64_t v18 = *(unsigned __int8 *)(v17 + 47);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *(unsigned __int8 *)(v17 + 47);
          }
          else {
            uint64_t v19 = *(void *)(v17 + 32);
          }
          uint64_t v20 = *((unsigned __int8 *)a2 + 23);
          int v21 = (char)v20;
          if ((v20 & 0x80u) != 0) {
            uint64_t v20 = a2[1];
          }
          if (v19 != v20) {
            goto LABEL_29;
          }
          if (v21 >= 0) {
            id v22 = (unsigned __int8 *)a2;
          }
          else {
            id v22 = (unsigned __int8 *)*a2;
          }
          if ((v18 & 0x80) != 0)
          {
            if (memcmp(*(const void **)v14, v22, *(void *)(v17 + 32))) {
              goto LABEL_29;
            }
          }
          else if (*(unsigned char *)(v17 + 47))
          {
            uint64_t v23 = 0;
            while (*(unsigned __int8 *)(v14 + v23) == v22[v23])
            {
              if (v18 == ++v23) {
                goto LABEL_32;
              }
            }
LABEL_29:
            if (*(char *)(v16 + 23) < 0) {
              operator delete(*(void **)v16);
            }
            long long v24 = *(_OWORD *)v14;
            *(void *)(v16 + 16) = *(void *)(v14 + 16);
            *(_OWORD *)uint64_t v16 = v24;
            v16 += 24;
            *(unsigned char *)(v17 + 47) = 0;
            *(unsigned char *)uint64_t v14 = 0;
          }
LABEL_32:
          uint64_t v15 = v14 + 24;
          if (v14 + 24 == v12) {
            goto LABEL_41;
          }
        }
      }
      uint64_t v16 = v13;
    }
LABEL_41:
    sub_1000432C4(a1 + 56, v16, *(long long **)(a1 + 64));
  }
}

void sub_100099B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100099B40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    int v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch ,dict failure\"}", (uint8_t *)&v10, 0x12u);
    }
  }
  [v5 enumerateKeysAndObjectsUsingBlock:&stru_1000FA9D0];
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = a1 + 24;
    NSStringEncoding v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch ,fOnAlertCb\"}", (uint8_t *)&v10, 0x12u);
    }
    sub_100027FF8(v8, v5, v6);
  }
}

void sub_100099CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100099CCC(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    __int16 v13 = 2113;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,sendDictionary dict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

void sub_100099DB8(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 80);
    int v4 = *(unsigned __int8 *)(a1 + 81);
    *(_DWORD *)uint64_t buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 1026;
    LODWORD(v14[0]) = v3;
    WORD2(v14[0]) = 1026;
    *(_DWORD *)((char *)v14 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,states\", \"fDidReceivePublicToken\":%{public}hhd, \"fDidReceiveToken\":%{public}hhd}", buf, 0x1Eu);
  }
  id v5 = *(uint64_t **)(a1 + 56);
  id v6 = *(uint64_t **)(a1 + 64);
  if (v5 != v6)
  {
    int v7 = SALogObjectGeneral;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v5;
        if (*((char *)v5 + 23) < 0) {
          uint64_t v8 = (uint64_t *)*v5;
        }
        *(_DWORD *)uint64_t buf = 68289283;
        int v10 = 0;
        __int16 v11 = 2082;
        id v12 = "";
        __int16 v13 = 2081;
        v14[0] = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,channels\", \"channel\":%{private, location:escape_only}s}", buf, 0x1Cu);
        int v7 = SALogObjectGeneral;
      }
      v5 += 3;
    }
    while (v5 != v6);
  }
}

void *sub_100099F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10009A000;
  block[3] = &unk_1000FA9F0;
  sub_10009A3D0((uint64_t)v5, a2);
  dispatch_async(v2, block);
  return sub_10009A34C(v5);
}

void sub_10009A000(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3321888768;
  v3[2] = sub_10009A0F0;
  v3[3] = &unk_1000FA9F0;
  sub_10009A3D0((uint64_t)v4, a1 + 32);
  sub_10009A0F0((uint64_t)v3);
  sub_10009A34C(v4);
}

void sub_10009A0D4(_Unwind_Exception *a1)
{
  sub_10009A34C(v1);
  _Unwind_Resume(a1);
}

void sub_10009A0F0(uint64_t a1)
{
  memset(v2, 0, sizeof(v2));
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    sub_100005520();
  }
  (*(void (**)(uint64_t, void *))(*(void *)v1 + 48))(v1, v2);
  int v3 = (void **)v2;
  sub_100005360(&v3);
}

void sub_10009A164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  sub_100005360(&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_10009A180(uint64_t a1, uint64_t a2)
{
  return sub_10009A3D0(a1 + 32, a2 + 32);
}

void *sub_10009A18C(uint64_t a1)
{
  return sub_10009A34C((void *)(a1 + 32));
}

void *sub_10009A194(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_10009A268;
  v4[3] = &unk_1000F4FF8;
  sub_10000F63C((uint64_t)v5, a2);
  [v2 unsubcribeForgottenChannels:v4];
  return sub_10000F6D4(v5);
}

void sub_10009A24C(_Unwind_Exception *a1)
{
  sub_10000F6D4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10009A268(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    sub_100005520();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void sub_10009A2B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v3 = *a2;
  int v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000272B8(&v3);
  if (v4) {
    sub_100028F6C(v4);
  }
}

void sub_10009A308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100028F6C(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10009A320(uint64_t result, char a2)
{
  *(unsigned char *)(result + 81) = a2;
  return result;
}

uint64_t sub_10009A328(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

unint64_t sub_10009A330(uint64_t a1)
{
  return 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 64) - *(void *)(a1 + 56)) >> 3);
}

void *sub_10009A34C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t sub_10009A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t SASettingsProd::instance(SASettingsProd *this)
{
  uint64_t result = SASettingsProd::fInstance;
  if (!SASettingsProd::fInstance) {
    operator new();
  }
  return result;
}

void SASettingsProd::SASettingsProd(SASettingsProd *this)
{
  *(void *)this = off_1000FAAC8;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((unsigned char *)this + 32) = 0;
  uint64_t v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 68289026;
    v2[1] = 0;
    __int16 v3 = 2082;
    int v4 = "";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,initialized\"}", (uint8_t *)v2, 0x12u);
  }
}

uint64_t sub_10009A590(void *a1, uint64_t a2)
{
  unint64_t v4 = a1[3];
  unint64_t v5 = a1[2];
  if (v5 < v4)
  {
    uint64_t result = sub_10000F63C(a1[2], a2);
    uint64_t v7 = v5 + 32;
    a1[2] = v5 + 32;
    goto LABEL_25;
  }
  uint64_t v8 = a1[1];
  uint64_t v9 = (uint64_t)(v5 - v8) >> 5;
  if ((unint64_t)(v9 + 1) >> 59) {
    sub_1000050E8();
  }
  uint64_t v10 = v4 - v8;
  uint64_t v11 = v10 >> 4;
  if (v10 >> 4 <= (unint64_t)(v9 + 1)) {
    uint64_t v11 = v9 + 1;
  }
  if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v12 = v11;
  }
  int v27 = a1 + 3;
  if (v12)
  {
    if (v12 >> 59) {
      sub_100004E00();
    }
    __int16 v13 = (char *)operator new(32 * v12);
  }
  else
  {
    __int16 v13 = 0;
  }
  long long v24 = v13;
  v25.i64[0] = (uint64_t)&v13[32 * v9];
  long long v26 = &v13[32 * v12];
  sub_10000F63C(v25.i64[0], a2);
  uint64_t v14 = v25.i64[0];
  uint64_t v7 = v25.i64[0] + 32;
  v25.i64[1] = v25.i64[0] + 32;
  uint64_t v16 = (void *)a1[1];
  unint64_t v15 = a1[2];
  if ((void *)v15 != v16)
  {
    uint64_t v17 = (void *)(v15 - 8);
    while (1)
    {
      uint64_t v18 = v14 - 32;
      uint64_t v19 = (void *)*v17;
      if (*v17)
      {
        if (v17 - 3 == v19)
        {
          *(void *)(v14 - 8) = v18;
          (*(void (**)(void, uint64_t))(*(void *)*v17 + 24))(*v17, v18);
          goto LABEL_21;
        }
        *(void *)(v14 - 8) = v19;
        uint64_t v20 = v17;
      }
      else
      {
        uint64_t v20 = (void *)(v14 - 8);
      }
      *uint64_t v20 = 0;
LABEL_21:
      int v21 = v17 - 3;
      v17 -= 4;
      uint64_t v14 = v18;
      if (v21 == v16)
      {
        int64x2_t v22 = *(int64x2_t *)(a1 + 1);
        uint64_t v7 = v25.i64[1];
        uint64_t v14 = v18;
        goto LABEL_24;
      }
    }
  }
  int64x2_t v22 = vdupq_n_s64(v15);
LABEL_24:
  a1[1] = v14;
  a1[2] = v7;
  int64x2_t v25 = v22;
  uint64_t v23 = (char *)a1[3];
  a1[3] = v26;
  long long v26 = v23;
  long long v24 = (char *)v22.i64[0];
  uint64_t result = sub_10009B540((uint64_t)&v24);
LABEL_25:
  a1[2] = v7;
  return result;
}

void sub_10009A738(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10009B540((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10009A75C(uint64_t a1)
{
  unsigned int v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(a1)) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  return v3 | v2;
}

BOOL sub_10009A7DC()
{
  unsigned int v0 = +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/PrivateFrameworks/WirelessDiagnostics.framework"];
  uint64_t v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289283;
    v3[1] = 0;
    __int16 v4 = 2082;
    unint64_t v5 = "";
    __int16 v6 = 1025;
    BOOL v7 = v0 == 3;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isIphoneAnalyticsEnabled\":%{private}hhd}", (uint8_t *)v3, 0x18u);
  }
  return v0 == 3;
}

BOOL sub_10009A8C4()
{
  unsigned int v0 = +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/Routine.bundle"];
  uint64_t v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289283;
    v3[1] = 0;
    __int16 v4 = 2082;
    unint64_t v5 = "";
    __int16 v6 = 1025;
    BOOL v7 = v0 == 3;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isSignificantLocationEnabled\":%{private}hhd}", (uint8_t *)v3, 0x18u);
  }
  return v0 == 3;
}

uint64_t sub_10009A9AC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingEmergency", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (uint64_t)[v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isEmergencyAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

id sub_10009AABC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingAMBER", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    id v2 = 0;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isAmberAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_10009ABCC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingPublicSafety", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (uint64_t)[v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isPublicSafetyAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_10009ACDC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingNational", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (uint64_t)[v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isNationalAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

id sub_10009ADEC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingWeaTest", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    id v2 = 0;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isTestAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_10009AEFC()
{
  unsigned int v0 = (void *)CFPreferencesCopyValue(@"CellBroadcastSettingIgneous", @"com.apple.commcenter.shared", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (uint64_t)[v0 BOOLValue];
    CFRelease(v1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  int v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    BOOL v7 = "";
    __int16 v8 = 1025;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isIgneousAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

BOOL sub_10009B00C(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    uint64_t v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,isBluetoothEnabled\"}", buf, 0x12u);
  }
  id v3 = objc_alloc_init((Class)CBController);
  __int16 v4 = v3;
  if (v3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009B234;
    v10[3] = &unk_1000FAB38;
    v10[4] = a1;
    [v3 getControllerInfoWithCompletion:v10];
    unint64_t v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(a1 + 32);
      *(_DWORD *)uint64_t buf = 68289283;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 1025;
      int v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"fIsBluetoothStateCached\":%{private}hhd}", buf, 0x18u);
    }
    BOOL v7 = *(unsigned char *)(a1 + 32) != 0;
  }
  else
  {
    __int16 v8 = SALogObjectGeneral;
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,isBluetoothEnabled invalid controller\"}", buf, 0x12u);
      BOOL v7 = 0;
    }
  }

  return v7;
}

void sub_10009B21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B234(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      __int16 v19 = 2113;
      id v20 = v6;
      __int16 v8 = "{\"msg%{public}.0s\":\"#saSettingsProd,BTController failed:\", \"inError\":%{private, location:escape_only}@}";
      int v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v15, v11);
    }
  }
  else if (v5)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v5 bluetoothState];
    *(unsigned char *)(v12 + 32) = v13 == (id)5;
    uint64_t v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      __int16 v19 = 1025;
      LODWORD(v20) = v13 == (id)5;
      __int16 v8 = "{\"msg%{public}.0s\":\"#saSettingsProd,cb\", \"fIsBluetoothStateCached\":%{private}hhd}";
      int v9 = v14;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 24;
      goto LABEL_7;
    }
  }
}

void sub_10009B3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B3D0(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = 68289026;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,settings updated\"}", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  while (v3 != v4)
  {
    sub_10000F63C((uint64_t)&v5, v3);
    if (!v8) {
      sub_100005520();
    }
    (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
    sub_10000F6D4(&v5);
    v3 += 32;
  }
}

void sub_10009B4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10009B508(void *a1)
{
  sub_10009B590(a1);

  operator delete();
}

uint64_t sub_10009B540(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    sub_10000F6D4((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_10009B590(void *a1)
{
  *a1 = off_1000FAAC8;
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,released\"}", (uint8_t *)v7, 0x12u);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    uint64_t v4 = (void *)a1[2];
    uint64_t v5 = (void *)a1[1];
    if (v4 != v3)
    {
      do
        uint64_t v4 = sub_10000F6D4(v4 - 4);
      while (v4 != v3);
      uint64_t v5 = (void *)a1[1];
    }
    a1[2] = v3;
    operator delete(v5);
  }
  return a1;
}

void sub_10009B7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009BA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SANetworkReachabilityProd::SANetworkReachabilityProd(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  sub_100086790((uint64_t)v8, a4);
  *a1 = off_1000FABE0;
  sub_100086790((uint64_t)(a1 + 1), (uint64_t)v8);
  sub_10007CA04(v8);
  *a1 = off_1000FAB90;
  a1[5] = 0;
  v7[0] = off_1000FAC08;
  v7[1] = a1;
  v7[3] = v7;
  sub_100070B9C((uint64_t)(a1 + 6), v6, 60.0);
}

void sub_10009BCA4(_Unwind_Exception *a1)
{
  sub_100070D40(v5);

  *(void *)uint64_t v2 = v4;
  sub_10007CA04(v3);

  _Unwind_Resume(a1);
}

void sub_10009BD00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009BD9C;
  v4[3] = &unk_1000FA458;
  void v4[4] = v2;
  char v5 = *(unsigned char *)(a1 + 40);
  sub_10009BD9C((uint64_t)v4);
}

void sub_10009BD9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    __int16 v8 = 1026;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,setValueImmediate\", \"isConnected\":%{public}hhd}", (uint8_t *)v5, 0x18u);
  }
  sub_100070830((unsigned __int8 *)(v2 + 48), (unsigned __int8 *)(a1 + 40), 0.0);
}

uint64_t sub_10009BE80(uint64_t a1)
{
  *(void *)a1 = off_1000FAB90;
  sub_100070D40(a1 + 48);

  *(void *)a1 = off_1000FABE0;
  sub_10007CA04((void *)(a1 + 8));
  return a1;
}

void sub_10009BEF4(uint64_t a1)
{
  sub_10009BE80(a1);

  operator delete();
}

void sub_10009BF2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v3 = *a2;
  int v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000272B8(&v3);
  if (v4) {
    sub_100028F6C(v4);
  }
}

void sub_10009BF7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100028F6C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10009BF98()
{
}

void *sub_10009BFAC(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_1000FAC08;
  result[1] = v3;
  return result;
}

uint64_t sub_10009BFF4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_1000FAC08;
  a2[1] = v2;
  return result;
}

uint64_t sub_10009C020(uint64_t a1, unsigned __int8 *a2)
{
  int v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(_DWORD *)(v3 + 120);
  char v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 1026;
    int v11 = v4;
    __int16 v12 = 1026;
    int v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,onNetworkReachabilityChangedCb\", \"type\":%{public}d, \"isConnected\":%{public}hhd}", (uint8_t *)v7, 0x1Eu);
  }
  return sub_100086734(v3 + 8, v4, v2 != 0);
}

uint64_t sub_10009C114(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_10009C154()
{
}

void *SATimerProd::SATimerProd(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100004CB8(__p, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3;
    uint64_t v8 = *(void *)(a3 + 16);
  }
  *a1 = off_1000FAD20;
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
  *a1 = off_1000FAC88;
  a1[1] = 0;
  a1[2] = v5;
  a1[3] = 0;
  return a1;
}

void sub_10009C214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C224(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = SALogObjectGeneral;
  BOOL v8 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Timer already running\"}", buf, 0x12u);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 1026;
      int v22 = (int)a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting timer\", \"duration\":%{public}d}", buf, 0x18u);
    }
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 16));
    int v11 = *(void **)(a1 + 8);
    __int16 v10 = (dispatch_object_t *)(a1 + 8);
    dispatch_object_t *v10 = v9;

    __int16 v12 = *v10;
    dispatch_time_t v13 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    uint64_t v14 = *v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3321888768;
    v15[2] = sub_10009C42C;
    v15[3] = &unk_1000F4FF8;
    sub_10000F63C((uint64_t)v16, a2);
    dispatch_source_set_event_handler(v14, v15);
    dispatch_resume(*v10);
    sub_10000F6D4(v16);
  }
}

uint64_t sub_10009C42C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    sub_100005520();
  }
  int v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void sub_10009C47C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  if (*(void *)(a1 + 8))
  {
    id v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Timer already running\"}", buf, 0x12u);
    }
  }
  else
  {
    *(void *)(a1 + 24) = a4;
    __int16 v10 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 1026;
      int v23 = (int)a5;
      __int16 v24 = 1026;
      unsigned int v25 = a2;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting timer\", \"durationSeconds\":%{public}d, \"intervalSeconds\":%{public}d}", buf, 0x1Eu);
    }
    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 16));
    __int16 v12 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v11;

    dispatch_time_t v13 = *(NSObject **)(a1 + 8);
    dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a5 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 1000000000 * a2, 0x1DCD6500uLL);
    int v15 = *(NSObject **)(a1 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3321888768;
    handler[2] = sub_10009C6C4;
    handler[3] = &unk_1000FACB8;
    handler[4] = a1;
    sub_10009C924((uint64_t)v17, a3);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    sub_10008491C(v17);
  }
}

uint64_t sub_10009C6C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v4 = v1;
  if (!v2) {
    sub_100005520();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t sub_10009C720(uint64_t a1, uint64_t a2)
{
  return sub_10009C924(a1 + 40, a2 + 40);
}

void *sub_10009C72C(uint64_t a1)
{
  return sub_10008491C((void *)(a1 + 40));
}

void sub_10009C734(uint64_t a1)
{
}

void sub_10009C74C(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  uint64_t v3 = SALogObjectGeneral;
  BOOL v4 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      dispatch_source_t v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Cancelling timer\"}", (uint8_t *)&v6, 0x12u);
      uint64_t v2 = *(NSObject **)(a1 + 8);
    }
    dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    id v5 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
  else if (v4)
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    dispatch_source_t v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"No timer to cancel\"}", (uint8_t *)&v6, 0x12u);
  }
}

void sub_10009C890(uint64_t a1)
{
  sub_10009C8D0(a1);

  operator delete();
}

uint64_t sub_10009C8D0(uint64_t a1)
{
  *(void *)a1 = off_1000FAC88;
  sub_10009C74C(a1);

  return a1;
}

uint64_t sub_10009C924(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void sub_10009C9BC(void *a1, unint64_t a2)
{
  if (a2 >= 7)
  {
    id v3 = +[NSString stringWithFormat:@"MAAssetState%llu", a2];
    [v3 UTF8String];

    __break(1u);
  }
  else
  {
    uint64_t v2 = off_1000FAFB8[a2];
    sub_10000DD48(a1, v2);
  }
}

void sub_10009CA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009CA44(void *a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      id v3 = "MADownloadSuccessful";
      goto LABEL_81;
    case 1:
      id v3 = "MADownloadXpcError";
      goto LABEL_81;
    case 2:
      id v3 = "MADownloadConnectionInterrupted";
      goto LABEL_81;
    case 3:
      id v3 = "MADownloadFailed";
      goto LABEL_81;
    case 4:
      id v3 = "MADownloadStagingFailed";
      goto LABEL_81;
    case 5:
      id v3 = "MADownloadMetaDataProcessFailed";
      goto LABEL_81;
    case 6:
      id v3 = "MADownloadUnzipFailed";
      goto LABEL_81;
    case 7:
      id v3 = "MADownloadMoveFailed";
      goto LABEL_81;
    case 8:
      id v3 = "MADownloadInstallFailed";
      goto LABEL_81;
    case 9:
      id v3 = "MADownloadDaemonExit";
      goto LABEL_81;
    case 10:
      id v3 = "MADownloadAssetAlreadyInstalled";
      goto LABEL_81;
    case 11:
      id v3 = "MADownloadInvalidSZExtractor";
      goto LABEL_81;
    case 12:
      id v3 = "MADownloadNotEntitled";
      goto LABEL_81;
    case 13:
      id v3 = "MADownloadDaemonNotReady";
      goto LABEL_81;
    case 14:
      id v3 = "MADownloadNoChange";
      goto LABEL_81;
    case 15:
      id v3 = "MADownloadNotApplicableForRequireByOs";
      goto LABEL_81;
    case 16:
      id v3 = "MADownloadNoExtractorFailure";
      goto LABEL_81;
    case 17:
      id v3 = "MADownloadTransformFailure";
      goto LABEL_81;
    case 18:
      id v3 = "MADownloadNoMatchFound";
      goto LABEL_81;
    case 19:
      id v3 = "MADownloadNilAssetType";
      goto LABEL_81;
    case 20:
      id v3 = "MADownloadNilAssetId";
      goto LABEL_81;
    case 21:
      id v3 = "MADownloadStreamingZipNotSupported";
      goto LABEL_81;
    case 22:
      id v3 = "MADownloadBadOptions";
      goto LABEL_81;
    case 23:
      id v3 = "MADownloadAssetBadMetaData";
      goto LABEL_81;
    case 24:
      id v3 = "MADownloadUnableToCreateMessage";
      goto LABEL_81;
    case 25:
      id v3 = "MADownloadFailedNoStandardUrl";
      goto LABEL_81;
    case 26:
      id v3 = "MADownloadFailedNoFallBackUrl";
      goto LABEL_81;
    case 27:
      id v3 = "MADownloadFailedNoPallasUrl";
      goto LABEL_81;
    case 28:
      id v3 = "MADownloadLostTask";
      goto LABEL_81;
    case 29:
      id v3 = "MADownloadNotApplicableForInstalledWithOs";
      goto LABEL_81;
    case 30:
      id v3 = "MADownloadNoValidSession";
      goto LABEL_81;
    case 31:
      id v3 = "MADownloadResponseDeferred";
      goto LABEL_81;
    case 32:
      id v3 = "MADownloadIncomplete";
      goto LABEL_81;
    case 33:
      id v3 = "MADownloadNoStagingDir";
      goto LABEL_81;
    case 34:
      id v3 = "MADownloadNotAllowed";
      goto LABEL_81;
    case 35:
      id v3 = "MADownloadUnknownResult";
      goto LABEL_81;
    case 36:
      id v3 = "MADownloadAssetNoLongerInCatalog";
      goto LABEL_81;
    case 37:
      id v3 = "MADownloadNoSpaceLeft";
      goto LABEL_81;
    case 38:
      id v3 = "MADownloadCouldNotReplace";
      goto LABEL_81;
    case 39:
      id v3 = "MADownloadMalformedAssetType";
      goto LABEL_81;
    case 40:
      id v3 = "MADownloadServerBadRequest";
      goto LABEL_81;
    case 41:
      id v3 = "MADownloadServerAuthFailure";
      goto LABEL_81;
    case 42:
      id v3 = "MADownloadServerError";
      goto LABEL_81;
    case 43:
      id v3 = "MADownloadNotFoundOrDenied";
      goto LABEL_81;
    case 44:
      id v3 = "MADownloadNotFound";
      goto LABEL_81;
    case 45:
      id v3 = "MADownloadServerInternalError";
      goto LABEL_81;
    case 46:
      id v3 = "MADownloadMalformedAssetData";
      goto LABEL_81;
    case 47:
      id v3 = "MADownloadNetworkingError";
      goto LABEL_81;
    case 48:
      id v3 = "MADownloadCancelled";
      goto LABEL_81;
    case 49:
      id v3 = "MADownloadBadUrl";
      goto LABEL_81;
    case 50:
      id v3 = "MADownloadBadServerResponse";
      goto LABEL_81;
    case 51:
      id v3 = "MADownloadTimedOut";
      goto LABEL_81;
    case 52:
      id v3 = "MADownloadTimedOutRequest";
      goto LABEL_81;
    case 53:
      id v3 = "MADownloadTimedOutResource";
      goto LABEL_81;
    case 54:
      id v3 = "MADownloadTimedOutWatchdog";
      goto LABEL_81;
    case 55:
      id v3 = "MADownloadTimedOutStart";
      goto LABEL_81;
    case 56:
      id v3 = "MADownloadTimedOutConnection";
      goto LABEL_81;
    case 57:
      id v3 = "MADownloadCannotLoadFromNetwork";
      goto LABEL_81;
    case 58:
      id v3 = "MADownloadUnsupportedURL";
      goto LABEL_81;
    case 59:
      id v3 = "MADownloadCannotFindHost";
      goto LABEL_81;
    case 60:
      id v3 = "MADownloadCannotConnectToHost";
      goto LABEL_81;
    case 61:
      id v3 = "MADownloadNetworkConnectionLost";
      goto LABEL_81;
    case 62:
      id v3 = "MADownloadDNSLookupFailed";
      goto LABEL_81;
    case 63:
      id v3 = "MADownloadHTTPTooManyRedirects";
      goto LABEL_81;
    case 64:
      id v3 = "MADownloadResourceUnavailable";
      goto LABEL_81;
    case 65:
      id v3 = "MADownloadNotConnectedToInternet";
      goto LABEL_81;
    case 66:
      id v3 = "MADownloadRedirectToNonExistentLocation";
      goto LABEL_81;
    case 67:
      id v3 = "MADownloadInternationalRoamingOff";
      goto LABEL_81;
    case 68:
      id v3 = "MADownloadCallIsActive";
      goto LABEL_81;
    case 69:
      id v3 = "MADownloadDataNotAllowed";
      goto LABEL_81;
    case 70:
      id v3 = "MADownloadSecureConnectionFailed";
      goto LABEL_81;
    case 71:
      id v3 = "MADownloadInvalidReceipts";
      goto LABEL_81;
    case 72:
      id v3 = "MADownloadFailedNoFallbackAllowed";
      goto LABEL_81;
    case 73:
      id v3 = "MADownloadLiveServerDisabledNoFallback";
      goto LABEL_81;
    case 74:
      id v3 = "MADownloadMalformedPurpose";
      goto LABEL_81;
    case 75:
      id v3 = "MADownloadSSOFailure";
LABEL_81:
      sub_10000DD48(a1, v3);
      break;
    default:
      id v4 = +[NSString stringWithFormat:@"MADownloadResult%llu", a2];
      sub_10000DD48(a1, (char *)[v4 UTF8String]);

      break;
  }
}

void sub_10009CE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SAMobileAssetProdHelper::SAMobileAssetProdHelper(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  id v4 = objc_alloc_init((Class)MADownloadOptions);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;

  [*(id *)(a1 + 8) setDiscretionary:0];
  [*(id *)(a1 + 8) setAllowsCellularAccess:1];
  [*(id *)(a1 + 8) setAllowsExpensiveAccess:1];
  [*(id *)(a1 + 8) setRequiresPowerPluggedIn:0];
  [*(id *)(a1 + 8) setTimeoutIntervalForResource:10000];
  [*(id *)(a1 + 8) setLiveServerCatalogOnly:0];
  [*(id *)(a1 + 8) setLiveServerCatalogOnlyIsOverridden:1];

  return a1;
}

void sub_10009D08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SAMobileAssetProdHelper::query(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SafetyAlertsConfig"];
  [v4 setDoNotBlockBeforeFirstUnlock:1];
  [v4 returnTypes:2];
  [v4 addKeyValuePair:@"Component" with:@"SafetyAlertsConfig"];
  id v5 = +[NSString stringWithFormat:@"%d", 2];
  [v4 addKeyValuePair:ASAttributeCompatibilityVersion with:v5];

  [v4 addKeyValuePair:@"DeviceType" with:@"iPhone"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3321888768;
  _DWORD v7[2] = sub_10009D270;
  v7[3] = &unk_1000FAD90;
  uint64_t v9 = a1;
  sub_10009FF80((uint64_t)v10, a2);
  id v6 = v4;
  id v8 = v6;
  [v6 queryMetaData:v7];

  sub_10009FEFC(v10);
}

void sub_10009D234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  sub_10009FEFC(v15);
  _Unwind_Resume(a1);
}

void *sub_10009D270(uint64_t a1, uint64_t a2)
{
  id v4 = **(NSObject ***)(a1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10009D358;
  block[3] = &unk_1000FAD58;
  sub_10009FF80((uint64_t)v8, a1 + 48);
  void v8[4] = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

  return sub_10009FEFC(v8);
}

void sub_10009D358(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3321888768;
  _DWORD v3[2] = sub_10009D46C;
  v3[3] = &unk_1000FAD58;
  sub_10009FF80((uint64_t)v5, a1 + 40);
  void v5[4] = *(void *)(a1 + 72);
  id v4 = *(id *)(a1 + 32);
  sub_10009D46C((uint64_t)v3);

  sub_10009FEFC(v5);
}

void sub_10009D448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  sub_10009FEFC(v14);
  _Unwind_Resume(a1);
}

void sub_10009D46C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  [*(id *)(a1 + 32) results];
  uint64_t v6 = v2;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  uint64_t v3 = *(void *)(a1 + 64);
  if (!v3) {
    sub_100005520();
  }
  (*(void (**)(uint64_t, uint64_t *, id *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

void sub_10009D508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10009D524(uint64_t a1, uint64_t a2)
{
  return sub_10009FF80(a1 + 40, a2 + 40);
}

void *sub_10009D530(uint64_t a1)
{
  return sub_10009FEFC((void *)(a1 + 40));
}

uint64_t sub_10009D538(uint64_t a1, uint64_t a2)
{
  return sub_10009FF80(a1 + 48, a2 + 48);
}

void *sub_10009D544(uint64_t a1)
{
  return sub_10009FEFC((void *)(a1 + 48));
}

void *SAMobileAssetProdHelper::download(uint64_t a1, uint64_t a2)
{
  id v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v12) = 2082;
    *(void *)((char *)&v12 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,download\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3321888768;
  _DWORD v7[2] = sub_10009D774;
  v7[3] = &unk_1000FAE28;
  void v7[4] = a1;
  sub_10008D36C((uint64_t)v8, a2);
  __int16 v10 = 0;
  v9[0] = off_1000F5E28;
  v9[1] = objc_retainBlock(v7);
  __int16 v10 = v9;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)uint64_t buf = _NSConcreteStackBlock;
  *(void *)&long long v12 = 3321888768;
  *((void *)&v12 + 1) = sub_10009F6BC;
  dispatch_time_t v13 = &unk_1000FAE88;
  uint64_t v14 = a1;
  sub_10004DB88((uint64_t)v15, (uint64_t)v9);
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.SafetyAlertsConfig" options:v5 then:buf];
  sub_100021E70(v15);
  sub_100021E70(v9);
  return sub_10007FDF0(v8);
}

void sub_10009D740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_100021E70(v12);
  sub_100021E70((uint64_t *)va);
  sub_10007FDF0(v11);
  _Unwind_Resume(a1);
}

void sub_10009D774(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v17 = 2082;
    int v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalogCb\"}", (uint8_t *)&buf, 0x12u);
  }
  CFStringRef v14 = @"status";
  uint64_t v6 = +[NSNumber numberWithInt:a2 ^ 1u];
  int v15 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  id v8 = sub_10004EDD0();
  sub_10004FEA8((uint64_t)v8, 0, v7);
  if (a2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3321888768;
    v10[2] = sub_10009DA94;
    v10[3] = &unk_1000FADF8;
    void v10[4] = v4;
    sub_10008D36C((uint64_t)v11, a1 + 40);
    dispatch_time_t v13 = 0;
    v12[0] = off_1000FAF38;
    v12[1] = objc_retainBlock(v10);
    dispatch_time_t v13 = v12;
    SAMobileAssetProdHelper::query(v4, (uint64_t)v12);
    sub_10009FEFC(v12);
    sub_10007FDF0(v11);
  }
  else
  {
    uint64_t v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v17 = 2082;
      int v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalog,failed\"}", (uint8_t *)&buf, 0x12u);
    }
    *(void *)(v4 + 24) = 0;
    sub_10009DA10(a1 + 40, 0);
  }
}

void sub_10009D9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_10009FEFC((uint64_t *)va);
  sub_10007FDF0(v12);

  _Unwind_Resume(a1);
}

void sub_10009DA10(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    sub_100005520();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v3 + 48))(v3, &v4);
}

void sub_10009DA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DA94(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5 = buf;
  id v47 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 0xE)
    {
      id v8 = +[NSString stringWithFormat:@"MAQueryResult%llu", a2];
      sub_10000DD48(__p, (char *)[v8 UTF8String]);
    }
    else
    {
      sub_10000DD48(__p, off_1000FAFF0[a2]);
    }
    uint64_t v9 = __p;
    if (v53 < 0) {
      uint64_t v9 = (void **)__p[0];
    }
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)v61 = 2082;
    *(void *)&v61[2] = "";
    *(_WORD *)&v61[10] = 2082;
    *(void *)&v61[12] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,queryAtDownloadResponse\", \"queryResult\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v53 < 0) {
      operator delete(__p[0]);
    }
  }

  dispatch_source_t v11 = SAMobileAssetProdHelper::getHighestVersion(v10, v47);
  long long v12 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(v6 + 16);
    if (v13)
    {
      uint64_t v14 = [*(id *)(v6 + 16) assetType];
      BOOL v15 = v14 != 0;
      id v45 = (id)v14;
      if (v14)
      {
        id v44 = [*(id *)(v6 + 16) assetType];
        int v16 = (const char *)[v44 UTF8String];
      }
      else
      {
        int v16 = "NULL";
      }
      __int16 v17 = *(void **)(v6 + 16);
      if (v17)
      {
        sub_10009C9BC(__p, (unint64_t)[v17 state]);
        if (v53 >= 0) {
          int v18 = __p;
        }
        else {
          int v18 = (void **)__p[0];
        }
        __int16 v17 = *(void **)(v6 + 16);
        uint64_t v3 = 1;
      }
      else
      {
        uint64_t v3 = 0;
        int v18 = (void **)"NULL";
      }
    }
    else
    {
      __int16 v17 = 0;
      uint64_t v3 = 0;
      BOOL v15 = 0;
      int v16 = "NULL";
      int v18 = (void **)"NULL";
    }
    int v19 = sub_10009EBE0(v17);
    __int16 v20 = *(void **)(v6 + 16);
    if (v20) {
      __int16 v21 = sub_10009EC94(v20);
    }
    else {
      __int16 v21 = "NULL";
    }
    *(void *)uint64_t buf = 68290306;
    *(_WORD *)v61 = 2082;
    *(void *)&v61[2] = "";
    *(_WORD *)&v61[10] = 2082;
    *(void *)&v61[12] = "fCurrentAsset";
    *(_WORD *)&v61[20] = 2082;
    *(void *)&v61[22] = v16;
    *(_WORD *)&v61[30] = 2082;
    v62 = v18;
    LOWORD(v63) = 1026;
    *(_DWORD *)((char *)&v63 + 2) = v19;
    HIWORD(v63) = 2082;
    BOOL v64 = v21;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,currentVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    if (v3 && v53 < 0)
    {
      operator delete(__p[0]);
      if (!v15)
      {
LABEL_28:
        if (v13) {

        }
        goto LABEL_30;
      }
    }
    else if (!v15)
    {
      goto LABEL_28;
    }

    goto LABEL_28;
  }
LABEL_30:

  __int16 v22 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
    {
      uint64_t v3 = [v11 assetType];
      BOOL v23 = v3 != 0;
      if (v3)
      {
        id v45 = [v11 assetType];
        __int16 v24 = (const char *)[v45 UTF8String];
      }
      else
      {
        __int16 v24 = "NULL";
      }
      unsigned int v25 = v50;
      sub_10009C9BC(v50, (unint64_t)[v11 state]);
      if (v51 < 0) {
        unsigned int v25 = (void **)v50[0];
      }
    }
    else
    {
      BOOL v23 = 0;
      __int16 v24 = "NULL";
      unsigned int v25 = (void **)"NULL";
    }
    int v26 = sub_10009EBE0(v11);
    int v27 = v26;
    if (v11)
    {
      int v28 = sub_10009EC94(v11);
      *(void *)uint64_t buf = 68290306;
      *(_WORD *)v61 = 2082;
      *(void *)&v61[2] = "";
      *(_WORD *)&v61[10] = 2082;
      *(void *)&v61[12] = "asset";
      *(_WORD *)&v61[20] = 2082;
      *(void *)&v61[22] = v24;
      *(_WORD *)&v61[30] = 2082;
      v62 = v25;
      LOWORD(v63) = 1026;
      *(_DWORD *)((char *)&v63 + 2) = v27;
      HIWORD(v63) = 2082;
      BOOL v64 = v28;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,selectedVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v51 < 0) {
        operator delete(v50[0]);
      }
    }
    else
    {
      *(void *)uint64_t buf = 68290306;
      *(_WORD *)v61 = 2082;
      *(void *)&v61[2] = "";
      *(_WORD *)&v61[10] = 2082;
      *(void *)&v61[12] = "asset";
      *(_WORD *)&v61[20] = 2082;
      *(void *)&v61[22] = v24;
      *(_WORD *)&v61[30] = 2082;
      v62 = v25;
      LOWORD(v63) = 1026;
      *(_DWORD *)((char *)&v63 + 2) = v26;
      HIWORD(v63) = 2082;
      BOOL v64 = "NULL";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,selectedVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    }
    if (v23) {

    }
    if (v11) {
  }
    }

  if ((sub_10009ED28(*(void **)(v6 + 16), v11) & 0x80000000) != 0)
  {
    __int16 v30 = (id)SALogObjectGeneral;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
LABEL_71:

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3321888768;
      v54[2] = sub_10009ED8C;
      v54[3] = &unk_1000FADC8;
      uint64_t v56 = v6;
      id v40 = v11;
      id v55 = v40;
      sub_10008D36C((uint64_t)v57, a1 + 40);
      float v59 = 0;
      v58[0] = off_1000F5E28;
      v58[1] = objc_retainBlock(v54);
      float v59 = v58;
      id v41 = v40;
      uint64_t v42 = *(void *)(v6 + 8);
      *(void *)uint64_t buf = _NSConcreteStackBlock;
      *(void *)v61 = 3321888768;
      *(void *)&v61[8] = sub_10009F9A4;
      *(void *)&v61[16] = &unk_1000FAEF8;
      v62 = (void **)v6;
      id v43 = v41;
      *(void *)&v61[24] = v43;
      sub_10004DB88((uint64_t)&v63, (uint64_t)v58);
      [v43 startDownload:v42 then:buf];
      sub_100021E70(&v63);

      sub_100021E70(v58);
      sub_10007FDF0(v57);

      goto LABEL_72;
    }
    uint64_t v31 = *(void *)(v6 + 16);
    if (v31)
    {
      uint64_t v5 = [*(id *)(v6 + 16) assetType];
      BOOL v32 = v5 != 0;
      if (v5)
      {
        id v45 = [*(id *)(v6 + 16) assetType];
        id v33 = (const char *)[v45 UTF8String];
      }
      else
      {
        id v33 = "NULL";
      }
      __int16 v34 = *(void **)(v6 + 16);
      if (v34)
      {
        __int16 v36 = v48;
        sub_10009C9BC(v48, (unint64_t)[v34 state]);
        if (v49 < 0) {
          __int16 v36 = (void **)v48[0];
        }
        __int16 v34 = *(void **)(v6 + 16);
        int v35 = 1;
      }
      else
      {
        int v35 = 0;
        __int16 v36 = (void **)"NULL";
      }
    }
    else
    {
      __int16 v34 = 0;
      int v35 = 0;
      BOOL v32 = 0;
      id v33 = "NULL";
      __int16 v36 = (void **)"NULL";
    }
    int v37 = sub_10009EBE0(v34);
    int v38 = *(void **)(v6 + 16);
    if (v38) {
      float v39 = sub_10009EC94(v38);
    }
    else {
      float v39 = "NULL";
    }
    *(void *)uint64_t buf = 68290306;
    *(_WORD *)v61 = 2082;
    *(void *)&v61[2] = "";
    *(_WORD *)&v61[10] = 2082;
    *(void *)&v61[12] = "fCurrentAsset";
    *(_WORD *)&v61[20] = 2082;
    *(void *)&v61[22] = v33;
    *(_WORD *)&v61[30] = 2082;
    v62 = v36;
    LOWORD(v63) = 1026;
    *(_DWORD *)((char *)&v63 + 2) = v37;
    HIWORD(v63) = 2082;
    BOOL v64 = v39;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,replacingAsset\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    if (v35 && v49 < 0)
    {
      operator delete(v48[0]);
      if (!v32)
      {
LABEL_69:
        if (v31) {

        }
        goto LABEL_71;
      }
    }
    else if (!v32)
    {
      goto LABEL_69;
    }

    goto LABEL_69;
  }
  __int16 v29 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(void *)uint64_t buf = 68289026;
    *(_WORD *)v61 = 2082;
    *(void *)&v61[2] = "";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,query,Either no asset or asset version same as current asset\"}", buf, 0x12u);
  }
LABEL_72:
}

void sub_10009E324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Unwind_Resume(a1);
}

id SAMobileAssetProdHelper::getHighestVersion(uint64_t a1, void *a2)
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a2;
  id v5 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
  id v7 = 0;
  if (v5)
  {
    uint64_t v32 = *(void *)v39;
    uint64_t v4 = 2082;
    *(void *)&long long v6 = 68289026;
    long long v29 = v6;
    do
    {
      id v33 = v5;
      for (uint64_t i = 0; (id)i != v33; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v9 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
          {
            uint64_t v2 = [v8 assetType];
            BOOL v10 = v2 != 0;
            if (v2)
            {
              id v31 = [v8 assetType];
              dispatch_source_t v11 = (const char *)[v31 UTF8String];
            }
            else
            {
              dispatch_source_t v11 = "NULL";
            }
            sub_10009C9BC(__p, (unint64_t)[v8 state:v29]);
            if (v37 >= 0) {
              long long v12 = __p;
            }
            else {
              long long v12 = (void **)__p[0];
            }
          }
          else
          {
            BOOL v10 = 0;
            long long v12 = (void **)"NULL";
            dispatch_source_t v11 = "NULL";
          }
          int v13 = sub_10009EBE0(v8);
          int v14 = v13;
          if (v8)
          {
            BOOL v15 = sub_10009EC94(v8);
            *(_DWORD *)uint64_t buf = 68290306;
            int v43 = 0;
            __int16 v44 = 2082;
            id v45 = "";
            __int16 v46 = 2082;
            id v47 = "asset";
            __int16 v48 = 2082;
            char v49 = v11;
            __int16 v50 = 2082;
            char v51 = v12;
            __int16 v52 = 1026;
            int v53 = v14;
            __int16 v54 = 2082;
            id v55 = v15;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,assetInList\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
            if (v37 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            *(_DWORD *)uint64_t buf = 68290306;
            int v43 = 0;
            __int16 v44 = 2082;
            id v45 = "";
            __int16 v46 = 2082;
            id v47 = "asset";
            __int16 v48 = 2082;
            char v49 = v11;
            __int16 v50 = 2082;
            char v51 = v12;
            __int16 v52 = 1026;
            int v53 = v13;
            __int16 v54 = 2082;
            id v55 = "NULL";
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,assetInList\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
          }
          if (v10) {

          }
          if (v8) {
        }
          }

        if (v7)
        {
          if ((sub_10009ED28(v7, v8) & 0x80000000) == 0) {
            continue;
          }
          uint64_t v16 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v29;
            int v43 = 0;
            __int16 v44 = 2082;
            id v45 = "";
            __int16 v17 = v16;
            int v18 = "{\"msg%{public}.0s\":\"#asset,getHighestVersion,preferThisAsset,versionIsBetter\"}";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x12u);
          }
        }
        else
        {
          uint64_t v19 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v29;
            int v43 = 0;
            __int16 v44 = 2082;
            id v45 = "";
            __int16 v17 = v19;
            int v18 = "{\"msg%{public}.0s\":\"#asset,getHighestVersion,preferThisAsset,assetWithLatestVersion is Nil\"}";
            goto LABEL_29;
          }
        }
        id v20 = v8;

        id v7 = v20;
      }
      id v5 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
    }
    while (v5);
  }

  __int16 v21 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
    {
      uint64_t i = [v7 assetType];
      BOOL v22 = i != 0;
      if (i)
      {
        uint64_t v4 = [v7 assetType];
        BOOL v23 = (const char *)[(id)v4 UTF8String];
      }
      else
      {
        BOOL v23 = "NULL";
      }
      sub_10009C9BC(v34, (unint64_t)[v7 state:v29]);
      if (v35 >= 0) {
        __int16 v24 = v34;
      }
      else {
        __int16 v24 = (void **)v34[0];
      }
    }
    else
    {
      BOOL v22 = 0;
      BOOL v23 = "NULL";
      __int16 v24 = (void **)"NULL";
    }
    int v25 = sub_10009EBE0(v7);
    int v26 = v25;
    if (v7)
    {
      int v27 = sub_10009EC94(v7);
      *(_DWORD *)uint64_t buf = 68290306;
      int v43 = 0;
      __int16 v44 = 2082;
      id v45 = "";
      __int16 v46 = 2082;
      id v47 = "assetWithLatestVersion";
      __int16 v48 = 2082;
      char v49 = v23;
      __int16 v50 = 2082;
      char v51 = v24;
      __int16 v52 = 1026;
      int v53 = v26;
      __int16 v54 = 2082;
      id v55 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,finalChoice\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v35 < 0) {
        operator delete(v34[0]);
      }
      if (!v22) {
        goto LABEL_49;
      }
    }
    else
    {
      *(_DWORD *)uint64_t buf = 68290306;
      int v43 = 0;
      __int16 v44 = 2082;
      id v45 = "";
      __int16 v46 = 2082;
      id v47 = "assetWithLatestVersion";
      __int16 v48 = 2082;
      char v49 = v23;
      __int16 v50 = 2082;
      char v51 = v24;
      __int16 v52 = 1026;
      int v53 = v25;
      __int16 v54 = 2082;
      id v55 = "NULL";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,finalChoice\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (!v22) {
        goto LABEL_49;
      }
    }

LABEL_49:
    if (v7) {
  }
    }

  return v7;
}

void sub_10009EADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10009EBE0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 attributes];
    uint64_t v4 = [v3 objectForKey:ASAttributeContentVersion];

    if (v4) {
      uint64_t v5 = (uint64_t)[v4 intValue];
    }
    else {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  return v5;
}

void sub_10009EC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const char *sub_10009EC94(void *a1)
{
  id v1 = [a1 getLocalFileUrl];
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v3 = @"NULL";
    goto LABEL_5;
  }
  uint64_t v3 = [v1 absoluteString];
  if (v3)
  {
LABEL_5:
    uint64_t v4 = v3;
    uint64_t v5 = (const char *)[(__CFString *)v4 UTF8String];
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  uint64_t v5 = "NULL";
LABEL_6:

  return v5;
}

void sub_10009ED0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10009ED28(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_10009EBE0(a1);
  int v5 = sub_10009EBE0(v3);
  if (v4 >= v5) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v4 > v5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }

  return v7;
}

void sub_10009ED78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009ED8C(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = (id)SALogObjectGeneral;
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_22;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetType];
    BOOL v8 = v7 != 0;
    uint64_t v19 = (void *)v7;
    if (v7)
    {
      id v18 = [*(id *)(a1 + 32) assetType];
      uint64_t v9 = (const char *)[v18 UTF8String];
    }
    else
    {
      uint64_t v9 = "NULL";
    }
    BOOL v10 = *(void **)(a1 + 32);
    if (v10)
    {
      sub_10009C9BC(__p, (unint64_t)[v10 state]);
      if (v21 >= 0) {
        long long v12 = __p;
      }
      else {
        long long v12 = (void **)__p[0];
      }
      BOOL v10 = *(void **)(a1 + 32);
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      long long v12 = (void **)"NULL";
    }
  }
  else
  {
    BOOL v10 = 0;
    int v11 = 0;
    BOOL v8 = 0;
    uint64_t v9 = "NULL";
    long long v12 = (void **)"NULL";
  }
  int v13 = sub_10009EBE0(v10);
  int v14 = *(void **)(a1 + 32);
  if (v14) {
    BOOL v15 = sub_10009EC94(v14);
  }
  else {
    BOOL v15 = "NULL";
  }
  *(_DWORD *)uint64_t buf = 68290562;
  int v24 = 0;
  __int16 v25 = 2082;
  int v26 = "";
  __int16 v27 = 1026;
  int v28 = a2;
  __int16 v29 = 2082;
  __int16 v30 = "asset";
  __int16 v31 = 2082;
  uint64_t v32 = v9;
  __int16 v33 = 2082;
  __int16 v34 = v12;
  __int16 v35 = 1026;
  int v36 = v13;
  __int16 v37 = 2082;
  long long v38 = v15;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadResponse\", \"isDownloadSuccess\":%{public}hhd, \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x46u);
  if (!v11 || (v21 & 0x80000000) == 0)
  {
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  operator delete(__p[0]);
  if (v8) {
LABEL_19:
  }

LABEL_20:
  if (v6) {

  }
LABEL_22:
  if (a2)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    sub_10008D36C((uint64_t)v22, a1 + 48);
    SAMobileAssetProdHelper::readAsset(v4, v16, (uint64_t)v22);
    sub_10007FDF0(v22);
  }
  else
  {
    __int16 v17 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v24 = 0;
      __int16 v25 = 2082;
      int v26 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadAsset,failed\"}", buf, 0x12u);
    }
    *(void *)(v4 + 24) = 0;
    sub_10009DA10(a1 + 48, 0);
  }
}

void sub_10009F054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void SAMobileAssetProdHelper::readAsset(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v7 = v6;
  if (*(void *)(a3 + 24))
  {
    BOOL v8 = SALogObjectGeneral;
    if (v6)
    {
      uint64_t v9 = (id)SALogObjectGeneral;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        uint64_t v16 = [v7 getLocalFileUrl];
        __int16 v17 = +[NSURL URLWithString:@"safetyalerts_channels.plist" relativeToURL:v16];
        id v18 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289538;
          int v33 = 0;
          __int16 v34 = 2082;
          __int16 v35 = "";
          __int16 v36 = 2114;
          __int16 v37 = v16;
          __int16 v38 = 2114;
          long long v39 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,url\", \"folder\":%{public, location:escape_only}@, \"url\":%{public, location:escape_only}@}", buf, 0x26u);
        }
        id v29 = 0;
        uint64_t v19 = +[NSDictionary dictionaryWithContentsOfURL:v17 error:&v29];
        id v28 = v29;
        id v20 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v33 = 0;
          __int16 v34 = 2082;
          __int16 v35 = "";
          __int16 v36 = 2114;
          __int16 v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,assetContentsData\", \"assetPlist\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        if (v19)
        {
          char v21 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v33 = 0;
            __int16 v34 = 2082;
            __int16 v35 = "";
            __int16 v36 = 2114;
            __int16 v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,plist\", \"assetPlist\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          *(_DWORD *)(a1 + 28) = sub_10009EBE0(v7);
          id v22 = v7;
          BOOL v23 = [v22 attributes];
          int v24 = [v23 objectForKey:ASAttributeCompatibilityVersion];

          if (v24) {
            unsigned int v25 = [v24 intValue];
          }
          else {
            unsigned int v25 = -1;
          }

          *(_DWORD *)(a1 + 24) = v25;
          objc_storeStrong((id *)(a1 + 16), a2);
          sub_10009DA10(a3, v19);
        }
        else
        {
          *(void *)(a1 + 24) = 0;
          sub_10009DA10(a3, 0);
          int v26 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = 0;
        }
        goto LABEL_33;
      }
      BOOL v10 = [v7 assetType];
      if (v10)
      {
        id v27 = [v7 assetType];
        int v11 = (const char *)[v27 UTF8String];
      }
      else
      {
        int v11 = "NULL";
      }
      int v13 = __p;
      sub_10009C9BC(__p, (unint64_t)[v7 state]);
      if (v31 < 0) {
        int v13 = (void **)__p[0];
      }
      int v14 = sub_10009EBE0(v7);
      BOOL v15 = sub_10009EC94(v7);
      *(_DWORD *)uint64_t buf = 68290306;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2082;
      __int16 v37 = "asset";
      __int16 v38 = 2082;
      long long v39 = v11;
      __int16 v40 = 2082;
      long long v41 = v13;
      __int16 v42 = 1026;
      int v43 = v14;
      __int16 v44 = 2082;
      id v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v31 < 0)
      {
        operator delete(__p[0]);
        if (!v10)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      else if (!v10)
      {
        goto LABEL_19;
      }

      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,readAsset,emptyAsset\"}", buf, 0x12u);
    }
    *(void *)(a1 + 24) = 0;
    sub_10009DA10(a3, 0);
  }
  else
  {
    long long v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,readAsset,emptyCallback\"}", buf, 0x12u);
    }
  }
LABEL_33:
}

void sub_10009F5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10009F694(uint64_t a1, uint64_t a2)
{
  return sub_10008D36C(a1 + 48, a2 + 48);
}

void *sub_10009F6A0(uint64_t a1)
{
  return sub_10007FDF0((void *)(a1 + 48));
}

uint64_t sub_10009F6A8(uint64_t a1, uint64_t a2)
{
  return sub_10008D36C(a1 + 40, a2 + 40);
}

void *sub_10009F6B4(uint64_t a1)
{
  return sub_10007FDF0((void *)(a1 + 40));
}

void *sub_10009F6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = **(NSObject ***)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_10009F780;
  v4[3] = &unk_1000FAE58;
  void v4[4] = a2;
  sub_10004DB88((uint64_t)v5, a1 + 40);
  dispatch_async(v2, v4);
  return sub_100021E70(v5);
}

void sub_10009F780(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3321888768;
  _DWORD v3[2] = sub_10009F878;
  v3[3] = &unk_1000FAE58;
  void v3[4] = *(void *)(a1 + 32);
  sub_10004DB88((uint64_t)v4, a1 + 40);
  sub_10009F878((uint64_t)v3);
  sub_100021E70(v4);
}

void sub_10009F85C(_Unwind_Exception *a1)
{
  sub_100021E70(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10009F878(uint64_t a1)
{
  uint64_t v2 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    sub_10009CA44(__p, *(void *)(a1 + 32));
    if (v6 >= 0) {
      id v3 = __p;
    }
    else {
      id v3 = (void **)__p[0];
    }
    *(_DWORD *)uint64_t buf = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    BOOL v10 = "";
    __int16 v11 = 2082;
    long long v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalogResponse\", \"downloadResult\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }

  return sub_100045970(a1 + 40, *(void *)(a1 + 32) == 0);
}

void sub_10009F98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009F9A4(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject ***)(a1 + 40);
  uint64_t v4 = *v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  _DWORD v5[2] = sub_10009FAA4;
  v5[3] = &unk_1000FAEC0;
  uint64_t v7 = v3;
  uint64_t v8 = a2;
  id v6 = *(id *)(a1 + 32);
  sub_10004DB88((uint64_t)v9, a1 + 48);
  dispatch_async(v4, v5);
  sub_100021E70(v9);
}

void sub_10009FA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10009FAA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  _DWORD v5[2] = sub_10009FBCC;
  v5[3] = &unk_1000FAEC0;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = v2;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 32);
  sub_10004DB88((uint64_t)v9, a1 + 56);
  sub_10009FBCC((uint64_t)v5);
  sub_100021E70(v9);
}

void sub_10009FBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  sub_100021E70(v13);

  _Unwind_Resume(a1);
}

uint64_t sub_10009FBCC(uint64_t a1)
{
  uint64_t v2 = (id)SALogObjectGeneral;
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_26;
  }
  id v3 = __p;
  sub_10009CA44(__p, *(void *)(a1 + 48));
  if (v23 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v3 = [*(id *)(a1 + 32) assetType];
    BOOL v6 = v3 != 0;
    if (v3)
    {
      id v19 = [*(id *)(a1 + 32) assetType];
      uint64_t v7 = (const char *)[v19 UTF8String];
    }
    else
    {
      uint64_t v7 = "NULL";
    }
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8)
    {
      BOOL v10 = v20;
      sub_10009C9BC(v20, (unint64_t)[v8 state]);
      if (v21 < 0) {
        BOOL v10 = (void **)v20[0];
      }
      uint64_t v8 = *(void **)(a1 + 32);
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
      BOOL v10 = (void **)"NULL";
    }
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = 0;
    BOOL v6 = 0;
    uint64_t v7 = "NULL";
    BOOL v10 = (void **)"NULL";
  }
  int v11 = sub_10009EBE0(v8);
  long long v12 = *(void **)(a1 + 32);
  if (v12)
  {
    int v13 = sub_10009EC94(v12);
    uint64_t v14 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v14 = 0;
    int v13 = "NULL";
  }
  *(_DWORD *)uint64_t buf = 68290818;
  int v25 = 0;
  __int16 v26 = 2082;
  id v27 = "";
  __int16 v28 = 2082;
  id v29 = v4;
  __int16 v30 = 2082;
  char v31 = "asset";
  __int16 v32 = 2082;
  int v33 = v7;
  __int16 v34 = 2082;
  __int16 v35 = v10;
  __int16 v36 = 1026;
  int v37 = v11;
  __int16 v38 = 2082;
  long long v39 = v13;
  __int16 v40 = 2114;
  uint64_t v41 = v14;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,startDownloadResponse\", \"downloadResult\":%{public, location:escape_only}s, \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}@}", buf, 0x54u);
  if (v9 && v21 < 0)
  {
    operator delete(v20[0]);
    if (!v6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v6) {
LABEL_21:
  }

LABEL_22:
  if (v5) {

  }
  if (v23 < 0) {
    operator delete(__p[0]);
  }
LABEL_26:

  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    BOOL v16 = v15 == 15;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = v16;
  return sub_100045970(a1 + 56, v17);
}

void sub_10009FE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10009FED4(uint64_t a1, uint64_t a2)
{
  return sub_10004DB88(a1 + 56, a2 + 56);
}

void *sub_10009FEE0(uint64_t a1)
{
  return sub_100021E70((void *)(a1 + 56));
}

uint64_t sub_10009FEE8(uint64_t a1, uint64_t a2)
{
  return sub_10004DB88(a1 + 48, a2 + 48);
}

void *sub_10009FEF4(uint64_t a1)
{
  return sub_100021E70((void *)(a1 + 48));
}

void *sub_10009FEFC(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t sub_10009FF80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_1000A0018(uint64_t a1)
{
  return a1;
}

void sub_1000A0044(uint64_t a1)
{
  operator delete();
}

uint64_t sub_1000A0090()
{
  return 0;
}

id sub_1000A0098(uint64_t a1, void *a2)
{
  *a2 = off_1000FAF38;
  id result = objc_retainBlock(*(id *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t sub_1000A00E0(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return _objc_release_x1();
}

uint64_t sub_1000A00F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

uint64_t sub_1000A0108(uint64_t a1, uint64_t a2)
{
  if (sub_10000FA0C(a2, (uint64_t)&off_1000FAFA8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_1000A0148()
{
  return &off_1000FAFA8;
}

void sub_1000A0234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A032C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A04EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACoreTelephonyClientHelper::SACoreTelephonyClientHelper(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(void *)a1 = v5;
  sub_10007C138(a1 + 8, a3);
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 181) = 0;
  id v6 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:*(void *)a1];
  uint64_t v7 = *(void **)(a1 + 168);
  *(void *)(a1 + 168) = v6;

  if (!*(void *)(a1 + 168))
  {
    uint64_t v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v24 = 2082;
      int v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTClient is nil\"}", (uint8_t *)&buf, 0x12u);
      uint64_t v15 = SALogObjectGeneral;
    }
    int v16 = 54;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289795;
      __int16 v24 = 2082;
      int v25 = "";
      __int16 v26 = 2081;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyClientHelper.mm";
      __int16 v28 = 2081;
      id v29 = "SACoreTelephonyClientHelper";
      __int16 v30 = 1026;
      int v31 = 54;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    char v17 = "false && \"#ctsa,fCTClient is nil\"";
LABEL_16:
    __assert_rtn("SACoreTelephonyClientHelper", "SACoreTelephonyClientHelper.mm", v16, v17);
  }
  uint64_t v8 = objc_alloc_init(CTClientDelegate);
  int v9 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = v8;

  BOOL v10 = *(void **)(a1 + 176);
  if (!v10)
  {
    id v18 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v24 = 2082;
      int v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTClientDelegate is nil\"}", (uint8_t *)&buf, 0x12u);
      id v18 = SALogObjectGeneral;
    }
    int v16 = 56;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289795;
      __int16 v24 = 2082;
      int v25 = "";
      __int16 v26 = 2081;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyClientHelper.mm";
      __int16 v28 = 2081;
      id v29 = "SACoreTelephonyClientHelper";
      __int16 v30 = 1026;
      int v31 = 56;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    char v17 = "false && \"#ctsa,fCTClientDelegate is nil\"";
    goto LABEL_16;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A0BB4;
  v22[3] = &unk_1000FB068;
  void v22[4] = a1;
  [v10 setFCarrierBundleChangeCb:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A0BC0;
  v21[3] = &unk_1000FB068;
  v21[4] = a1;
  [*(id *)(a1 + 176) setFOperatorBundleChangeCb:v21];
  [*(id *)(a1 + 176) setFDefaultBundleChangeCb:&stru_1000FB088];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000A0BD0;
  v20[3] = &unk_1000FB068;
  v20[4] = a1;
  [*(id *)(a1 + 176) setFPrefDataSimChangedCb:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A0CA0;
  v19[3] = &unk_1000F5EA8;
  v19[4] = a1;
  [*(id *)(a1 + 176) setFTandemCapabilityChangeCb:v19];
  [*(id *)(a1 + 168) setDelegate:*(void *)(a1 + 176)];
  *(_DWORD *)(a1 + 184) = 0;
  id v11 = [objc_alloc((Class)CTXPCServiceSubscriptionContext) initWithSlot:1];
  sub_1000A0D1C(a1, v11, 2);
  sub_1000A0D1C(a1, v11, 1);
  if (*((unsigned char *)SAPlatformInfo::instance(v12) + 10))
  {
    id v13 = [objc_alloc((Class)CTXPCServiceSubscriptionContext) initWithSlot:2];
    sub_1000A0D1C(a1, v13, 2);
    sub_1000A0D1C(a1, v13, 1);
  }
  sub_1000A0ECC(a1);

  return a1;
}

void sub_1000A0B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A0BB4(uint64_t a1, void *a2)
{
}

void sub_1000A0BC0(uint64_t a1, void *a2)
{
}

void sub_1000A0BD0(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289283;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    __int16 v7 = 2113;
    id v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onPrefDataSimChanged\", \"context\":%{private, location:escape_only}@}", (uint8_t *)v4, 0x1Cu);
  }
}

void sub_1000A0CA0(uint64_t a1)
{
}

void SACoreTelephonyClientHelper::~SACoreTelephonyClientHelper(SACoreTelephonyClientHelper *this)
{
  id v2 = (void *)*((void *)this + 21);
  *((void *)this + 21) = 0;

  sub_100027DF0((void *)this + 17);
  sub_100021E70((void *)this + 13);
  sub_100021E70((void *)this + 9);
  sub_100027DF0((void *)this + 5);
  sub_10007C324((void *)this + 1);
}

void sub_1000A0D1C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v16 = 0;
    __int16 v17 = 2082;
    id v18 = "";
    __int16 v19 = 2113;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#cb,onOperatorBundleChangedNotifFromCT\", \"context\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  id v7 = [objc_alloc((Class)CTBundle) initWithBundleType:a3];
  id v8 = [v5 slotID];
  int v9 = *(void **)(a1 + 168);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A1088;
  v10[3] = &unk_1000FB0B0;
  id v11 = @"AppleSafetyAlert";
  uint64_t v12 = a1;
  id v13 = v8;
  uint64_t v14 = a3;
  [v9 copyCarrierBundleValueWithDefault:v5 key:@"CellBroadcast" bundleType:v7 completion:v10];
}

void sub_1000A0E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000A0ECC(uint64_t a1)
{
  id v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged\"}", buf, 0x12u);
  }
  uint64_t v3 = *(void **)(a1 + 168);
  id v8 = 0;
  id v4 = [v3 getDualSimCapability:&v8];
  id v5 = v8;
  id v6 = SALogObjectGeneral;
  BOOL v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2113;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged,queryFailed\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2050;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged,querySuccess\", \"capability\":%{public}lld}", buf, 0x1Cu);
    }
    *(unsigned char *)(a1 + 188) = v4 == (id)2;
  }
}

void sub_1000A1088(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[5];
  if (!v6)
  {
    if (!v5)
    {
      uint64_t v17 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      int v28 = 68289026;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = "";
      int v10 = "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT,valueIsNil\"}";
      __int16 v11 = v17;
      uint32_t v12 = 18;
      goto LABEL_4;
    }
    id v13 = v5;
    id v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 68289283;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = "";
      __int16 v32 = 2113;
      *(void *)int v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT\", \"val\":%{private, location:escape_only}@}", (uint8_t *)&v28, 0x1Cu);
    }
    uint64_t v15 = [v13 objectForKey:a1[4]];
    if (v15)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    uint64_t v18 = a1[6];
    if (v18 == 2)
    {
      uint64_t v21 = a1[7];
      if (v21 == 1)
      {
        id v20 = (unsigned char *)(v7 + 187);
        goto LABEL_23;
      }
      if (v21 == 2)
      {
        id v20 = (unsigned char *)(v7 + 185);
        goto LABEL_23;
      }
    }
    else if (v18 == 1)
    {
      uint64_t v19 = a1[7];
      if (v19 == 1)
      {
        id v20 = (unsigned char *)(v7 + 186);
        goto LABEL_23;
      }
      if (v19 == 2)
      {
        id v20 = (unsigned char *)(v7 + 184);
LABEL_23:
        *id v20 = isKindOfClass & 1;
      }
    }
    if (*(void *)(v7 + 96))
    {
      id v22 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = *(unsigned __int8 *)(v7 + 186);
        int v24 = *(unsigned __int8 *)(v7 + 187);
        int v25 = *(unsigned __int8 *)(v7 + 184);
        int v26 = *(unsigned __int8 *)(v7 + 185);
        int v28 = 68290050;
        int v29 = 0;
        __int16 v30 = 2082;
        int v31 = "";
        __int16 v32 = 1026;
        *(_DWORD *)int v33 = v23;
        *(_WORD *)&v33[4] = 1026;
        *(_DWORD *)&v33[6] = v24;
        __int16 v34 = 1026;
        int v35 = v25;
        __int16 v36 = 1026;
        int v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleSupport\", \"CB1\":%{public}d, \"CB2\":%{public}d, \"OB1\":%{public}d, \"OB2\":%{public}d}", (uint8_t *)&v28, 0x2Au);
      }
      char v27 = *(unsigned char *)(v7 + 184) || *(unsigned char *)(v7 + 185) || *(unsigned char *)(v7 + 186) || *(unsigned char *)(v7 + 187) != 0;
      sub_100045970(v7 + 72, v27);
    }

    goto LABEL_33;
  }
  uint64_t v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 68289283;
    int v29 = 0;
    __int16 v30 = 2082;
    int v31 = "";
    __int16 v32 = 2113;
    *(void *)int v33 = v6;
    int v10 = "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT,failed\", \"error\":%{private, location:escape_only}@}";
    __int16 v11 = v9;
    uint32_t v12 = 28;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v28, v12);
  }
LABEL_33:
}

void sub_1000A13EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SACoreTelephonyProd::SACoreTelephonyProd(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  sub_10007C138((uint64_t)v10, a3);
  *(void *)a1 = off_1000FA870;
  *(void *)(a1 + 8) = 0;
  sub_10007C138(a1 + 16, (uint64_t)v10);
  sub_100027DF0(v14);
  sub_100021E70(v13);
  sub_100021E70(v12);
  sub_100027DF0(v11);
  sub_10007C324(v10);
  *(void *)a1 = off_1000FB0E0;
  *(void *)(a1 + 184) = 0;
  *(unsigned char *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = v5;
  uint64_t v6 = _CTServerConnectionCreateOnTargetQueue();
  *(void *)(a1 + 176) = v6;
  uint64_t v7 = SALogObjectGeneral;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,created CT connection\"}", buf, 0x12u);
      uint64_t v7 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,registering for kCTSMSCellBroadcastTelemetryNotification\"}", buf, 0x12u);
    }
    id v8 = *(NSObject **)(a1 + 200);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A188C;
    handler[3] = &unk_1000F5DD8;
    handler[4] = a1;
    xpc_set_event_stream_handler("com.apple.CTTelephonyCenter", v8, handler);
    operator new();
  }
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTConnection is nil\"}", buf, 0x12u);
    uint64_t v7 = SALogObjectGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t buf = 68289795;
    int v16 = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2081;
    id v20 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyProd.mm";
    __int16 v21 = 2081;
    id v22 = "SACoreTelephonyProd";
    __int16 v23 = 1026;
    int v24 = 34;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
  }
  __assert_rtn("SACoreTelephonyProd", "SACoreTelephonyProd.mm", 34, "false && \"#ctsa,fCTConnection is nil\"");
}

void sub_1000A1808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
}

void sub_1000A188C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(SACoreTelephony **)(a1 + 32);
  string = xpc_dictionary_get_string(v3, "Name");
  if (string)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:string];
    uint64_t v8 = kCTSMSCellBroadcastTelemetryNotification;
    if (([v7 isEqualToString:kCTSMSCellBroadcastTelemetryNotification] & 1) != 0
      || ([v7 isEqualToString:kCTEventSMSMessageCellBroadcastStringGeofencingStarted] & 1) != 0)
    {
      uint64_t v9 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 68289538;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2082;
        int v25 = string;
        __int16 v26 = 2082;
        char v27 = "willProcess";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x26u);
      }
      int v10 = xpc_dictionary_get_value(v3, "UserInfo");
      __int16 v11 = (NSDictionary *)_CFXPCCreateCFObjectFromXPCObject();

      uint32_t v12 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 68289283;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2113;
        int v25 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,kCTSMSCellBroadcastTelemetryNotification\", \"info\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
      }
      if (v11)
      {
        if ([v7 isEqualToString:v8])
        {
          id v13 = [(NSDictionary *)v11 objectForKey:kCTSMSCellBroadcastString];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [(NSDictionary *)v11 objectForKey:kCTSMSAppleSafetyAlertSupport];
              if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                id v15 = v14;
              }
              else {
                id v15 = 0;
              }

              unsigned int v18 = [v15 unsignedIntValue];
              __int16 v19 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                int v20 = 68289282;
                int v21 = 0;
                __int16 v22 = 2082;
                __int16 v23 = "";
                __int16 v24 = 1026;
                LODWORD(v25) = v18;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onAlertDisplayNotification\", \"weaIdNumber\":%{public}d}", (uint8_t *)&v20, 0x18u);
              }
              if (v18 == 1) {
                SACoreTelephony::onWeaDisplayedNotification(v4, (const char *)[v13 UTF8String]);
              }
              SACoreTelephony::onMotionHarvestWeaTrigger(v4, v11);
            }
          }
        }
        else if ([v7 isEqualToString:kCTEventSMSMessageCellBroadcastStringGeofencingStarted])
        {
          SACoreTelephony::onWeaReceivedNotification(v4, v11);
        }
      }
    }
    else
    {
      __int16 v17 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 68289538;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2082;
        int v25 = string;
        __int16 v26 = 2082;
        char v27 = "ignored";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x26u);
      }
    }
  }
  else
  {
    int v16 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 68289538;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2082;
      int v25 = "nil";
      __int16 v26 = 2082;
      char v27 = "ignored";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x26u);
    }
  }
}

void sub_1000A1D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1000A1D84(void *a1)
{
  *a1 = off_1000FA870;
  sub_100027DF0(a1 + 18);
  sub_100021E70(a1 + 14);
  sub_100021E70(a1 + 10);
  sub_100027DF0(a1 + 6);
  sub_10007C324(a1 + 2);
  return a1;
}

void sub_1000A1DEC(const void *a1)
{
  id v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    uint32_t v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,start,registering for kCTSMSCellBroadcastTelemetryNotification and kCTEventSMSMessageCellBroadcastStringGeofencingStarted\"}", (uint8_t *)&v9, 0x12u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)sub_1000A1F8C, kCTSMSCellBroadcastConfigChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  unint64_t v4 = _CTServerConnectionRegisterForNotification();
  unint64_t v5 = _CTServerConnectionRegisterForNotification();
  unint64_t v6 = HIDWORD(v4);
  unint64_t v7 = HIDWORD(v5);
  if (v6 | HIDWORD(v5))
  {
    uint64_t v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint32_t v12 = "";
      __int16 v13 = 1025;
      int v14 = v6;
      __int16 v15 = 1025;
      int v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,start,error in registering to notifications\", \"weaDisplay\":%{private}d, \"weaReceive\":%{private}d}", (uint8_t *)&v9, 0x1Eu);
    }
  }
}

void sub_1000A1F8C(uint64_t a1, uint64_t a2)
{
  id v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotification\"}", buf, 0x12u);
  }
  if (a2)
  {
    unint64_t v4 = *(NSObject **)(a2 + 200);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A4B44;
    block[3] = &unk_1000F5EA8;
    void block[4] = a2;
    dispatch_async(v4, block);
  }
  else
  {
    unint64_t v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      int v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotification invalid observed\"}", buf, 0x12u);
    }
  }
}

CFMutableDictionaryRef sub_1000A2104(void *a1)
{
  id v121 = a1;
  id v1 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v135 = 2082;
    float v136 = "";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,createAppleSafetyAlertDict New\"}", (uint8_t *)&buf, 0x12u);
  }

  id v2 = [v121 objectForKey:@"SafetyAlertMissingForHash"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        CFMutableDictionaryRef theDict = Mutable;
        CFDictionarySetValue(Mutable, @"SafetyAlertMissingForHash", v2);
      }
      else
      {
        CFMutableDictionaryRef theDict = 0;
      }
      goto LABEL_395;
    }
  }

  unint64_t v4 = [v121 objectForKey:@"uid"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id value = v4;
  }
  else {
    id value = 0;
  }

  unint64_t v5 = [v121 objectForKey:@"session_id"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v101 = v5;
  }
  else {
    id v101 = 0;
  }

  unint64_t v6 = [v121 objectForKey:@"categories"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v113 = v6;
  }
  else {
    id v113 = 0;
  }

  unint64_t v7 = [v121 objectForKey:@"urgency"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v109 = v7;
  }
  else {
    id v109 = 0;
  }

  int v8 = [v121 objectForKey:@"severity"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v108 = v8;
  }
  else {
    id v108 = 0;
  }

  __int16 v9 = [v121 objectForKey:@"certainty"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v107 = v9;
  }
  else {
    id v107 = 0;
  }

  int v10 = [v121 objectForKey:@"expires"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v106 = v10;
  }
  else {
    id v106 = 0;
  }

  __int16 v11 = [v121 objectForKey:@"effective"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v105 = v11;
  }
  else {
    id v105 = 0;
  }

  uint32_t v12 = [v121 objectForKey:@"responseTypes"];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v111 = v12;
  }
  else {
    id v111 = 0;
  }

  __int16 v13 = [v121 objectForKey:@"eventCode"];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v112 = v13;
  }
  else {
    id v112 = 0;
  }

  int v14 = [v121 objectForKey:@"type"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v100 = v14;
  }
  else {
    id v100 = 0;
  }

  __int16 v15 = [v121 objectForKey:@"geometry"];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v104 = v15;
  }
  else {
    id v104 = 0;
  }

  if (!value
    || (CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) == 0)
  {
    CFMutableDictionaryRef theDict = 0;
    goto LABEL_394;
  }
  float v97 = [v121 objectForKey:@"info"];
  if (!v97 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CFRelease(theDict);
    CFMutableDictionaryRef theDict = 0;
    goto LABEL_393;
  }
  LODWORD(buf) = 1;
  CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
  if (v16)
  {
    CFDictionarySetValue(theDict, kAppleSafetyAlert_Status_Key, v16);
    CFRelease(v16);
  }
  LODWORD(buf) = 1;
  CFNumberRef v17 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
  if (v17)
  {
    CFDictionarySetValue(theDict, kAppleSafetyAlert_MessageType_Key, v17);
    CFRelease(v17);
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_UniqueID_Key, value);
  if (v101) {
    CFDictionarySetValue(theDict, kAppleSafetyAlert_SessionID_Key, v101);
  }
  unsigned int v18 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68292099;
    __int16 v135 = 2082;
    float v136 = "";
    __int16 v137 = 2113;
    id v138 = v101;
    __int16 v139 = 2113;
    id v140 = v113;
    __int16 v141 = 2113;
    id v142 = v109;
    __int16 v143 = 2113;
    id v144 = v106;
    __int16 v145 = 2113;
    id v146 = v105;
    __int16 v147 = 2113;
    id v148 = v111;
    __int16 v149 = 2113;
    id v150 = v107;
    __int16 v151 = 2113;
    id v152 = v108;
    __int16 v153 = 2113;
    id v154 = value;
    __int16 v155 = 2113;
    id v156 = v100;
    __int16 v157 = 2113;
    id v158 = v112;
    __int16 v159 = 2113;
    id v160 = v104;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,rootKvPair\", \"session_id\":%{private, location:escape_only}@, \"category\":%{private, location:escape_only}@, \"urgency\":%{private, location:escape_only}@, \"expires\":%{private, location:escape_only}@, \"effective\":%{private, location:escape_only}@, \"responseType\":%{private, location:escape_only}@, \"certainty\":%{private, location:escape_only}@, \"severity\":%{private, location:escape_only}@, \"uid\":%{private, location:escape_only}@, \"type\":%{private, location:escape_only}@, \"eventCode\":%{private, location:escape_only}@, \"geometry\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x8Au);
  }

  id v122 = v97;
  id v19 = [v122 count];
  if (!v19)
  {
    CFRelease(theDict);
LABEL_391:
    CFMutableDictionaryRef theDict = 0;
    goto LABEL_392;
  }
  id v102 = v19;
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
  uint64_t v20 = 0;
  v87 = (void *)kAppleSafetyAlert_Urgency_Key;
  key = (void *)kAppleSafetyAlert_Language_Key;
  BOOL v85 = (void *)kAppleSafetyAlert_Certainty_Key;
  uint64_t v86 = (void *)kAppleSafetyAlert_Severity_Key;
  v96 = (void *)kAppleSafetyAlert_Area_Key;
  float v94 = (void *)kAppleSafetyAlert_Description_Key;
  uint64_t v95 = (void *)kAppleSafetyAlert_Headline_Key;
  unsigned __int8 v93 = (void *)kAppleSafetyAlert_Instruction_Key;
  float v92 = (void *)kAppleSafetyAlert_ExpiryTimestamp_Key;
  float v91 = (void *)kAppleSafetyAlert_EffectiveTimestamp_Key;
  v83 = (void *)kAppleSafetyAlert_Category_Key;
  float v81 = (void *)kAppleSafetyAlert_EventCode_Key;
  unsigned __int8 v82 = (void *)kAppleSafetyAlert_ResponseCode_Key;
  v84 = (void *)kAppleSafetyAlert_WeaHandlingType_Key;
  int v89 = (void *)kAppleSafetyAlert_CmamLongText_Key;
  int v90 = (void *)kAppleSafetyAlert_CmamText_Key;
  unsigned __int8 v98 = (void *)kAppleSafetyAlert_Parameters_Key;
  do
  {
    uint64_t v123 = v20;
    int v21 = [v122 objectAtIndexedSubscript:v81];
    __int16 v22 = [v21 objectForKey:@"language"];

    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v118 = v22;
    }
    else {
      id v118 = 0;
    }

    __int16 v23 = [v122 objectAtIndexedSubscript:v123];
    __int16 v24 = [v23 objectForKey:@"headline"];

    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v114 = v24;
    }
    else {
      id v114 = 0;
    }

    int v25 = [v122 objectAtIndexedSubscript:v123];
    __int16 v26 = [v25 objectForKey:@"description"];

    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v115 = v26;
    }
    else {
      id v115 = 0;
    }

    char v27 = [v122 objectAtIndexedSubscript:v123];
    int v28 = [v27 objectForKey:@"instruction"];

    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v116 = v28;
    }
    else {
      id v116 = 0;
    }

    int v29 = [v122 objectAtIndexedSubscript:v123];
    __int16 v30 = [v29 objectForKey:@"WEAHandling"];

    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v117 = v30;
    }
    else {
      id v117 = 0;
    }

    int v31 = [v122 objectAtIndexedSubscript:v123];
    __int16 v32 = [v31 objectForKey:@"CMAMtext"];

    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      *((void *)&v119 + 1) = v32;
    }
    else {
      *((void *)&v119 + 1) = 0;
    }

    int v33 = [v122 objectAtIndexedSubscript:v123];
    __int16 v34 = [v33 objectForKey:@"CMAMlongtext"];

    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      *(void *)&long long v119 = v34;
    }
    else {
      *(void *)&long long v119 = 0;
    }

    int v35 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68290819;
      __int16 v135 = 2082;
      float v136 = "";
      __int16 v137 = 2113;
      id v138 = v118;
      __int16 v139 = 2113;
      id v140 = v114;
      __int16 v141 = 2113;
      id v142 = v115;
      __int16 v143 = 2113;
      id v144 = v116;
      __int16 v145 = 2113;
      id v146 = v117;
      __int16 v147 = 2113;
      id v148 = (id)*((void *)&v119 + 1);
      __int16 v149 = 2113;
      id v150 = (id)v119;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,infoKvPair\", \"language\":%{private, location:escape_only}@, \"headline\":%{private, location:escape_only}@, \"description\":%{private, location:escape_only}@, \"instruction\":%{private, location:escape_only}@, \"wea_handling\":%{private, location:escape_only}@, \"cmam_text\":%{private, location:escape_only}@, \"cmam_long_text\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x58u);
    }

    if (v119 != 0)
    {
      if (!*((void *)&v119 + 1))
      {
        __int16 v36 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t buf = 68289026;
          __int16 v135 = 2082;
          float v136 = "";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamTextPresent\"}", (uint8_t *)&buf, 0x12u);
        }

        *((void *)&v119 + 1) = (id)v119;
      }
      if (!(void)v119)
      {
        int v37 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t buf = 68289026;
          __int16 v135 = 2082;
          float v136 = "";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamLongTextPresent\"}", (uint8_t *)&buf, 0x12u);
        }

        *(void *)&long long v119 = *((id *)&v119 + 1);
      }
      float v120 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v118)
      {
        LODWORD(buf) = 0;
        LODWORD(buf) = sub_1000A4420(v118);
        CFNumberRef v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v38)
        {
          CFDictionarySetValue(v120, key, v38);
          CFRelease(v38);
        }
      }
      if (v109)
      {
        LODWORD(buf) = 0;
        id v39 = v109;
        if ([v39 isEqualToString:@"Immediate"])
        {
          int v40 = 1;
        }
        else if ([v39 isEqualToString:@"Expected"])
        {
          int v40 = 2;
        }
        else if ([v39 isEqualToString:@"Future"])
        {
          int v40 = 3;
        }
        else if ([v39 isEqualToString:@"Past"])
        {
          int v40 = 4;
        }
        else
        {
          int v40 = [v39 isEqualToString:@"Unknown"] ? 5 : 0;
        }

        LODWORD(buf) = v40;
        CFNumberRef v43 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v43)
        {
          CFDictionarySetValue(v120, v87, v43);
          CFRelease(v43);
        }
      }
      if (v108)
      {
        LODWORD(buf) = 0;
        id v44 = v108;
        if ([v44 isEqualToString:@"Extreme"])
        {
          int v45 = 1;
        }
        else if ([v44 isEqualToString:@"Severe"])
        {
          int v45 = 2;
        }
        else if ([v44 isEqualToString:@"Moderate"])
        {
          int v45 = 3;
        }
        else if ([v44 isEqualToString:@"Minor"])
        {
          int v45 = 4;
        }
        else
        {
          int v45 = [v44 isEqualToString:@"Unknown"] ? 5 : 0;
        }

        LODWORD(buf) = v45;
        CFNumberRef v46 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v46)
        {
          CFDictionarySetValue(v120, v86, v46);
          CFRelease(v46);
        }
      }
      if (v107)
      {
        LODWORD(buf) = 0;
        id v47 = v107;
        if ([v47 isEqualToString:@"Observed"])
        {
          int v48 = 1;
        }
        else if ([v47 isEqualToString:@"Likely"])
        {
          int v48 = 2;
        }
        else if ([v47 isEqualToString:@"Possible"])
        {
          int v48 = 3;
        }
        else if ([v47 isEqualToString:@"Unlikely"])
        {
          int v48 = 4;
        }
        else
        {
          int v48 = [v47 isEqualToString:@"Unknown"] ? 5 : 0;
        }

        LODWORD(buf) = v48;
        CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v49)
        {
          CFDictionarySetValue(v120, v85, v49);
          CFRelease(v49);
        }
      }
      if (v104) {
        CFDictionarySetValue(v120, v96, v104);
      }
      if (v114) {
        CFDictionarySetValue(v120, v95, v114);
      }
      if (v115) {
        CFDictionarySetValue(v120, v94, v115);
      }
      if (v116) {
        CFDictionarySetValue(v120, v93, v116);
      }
      if (v106) {
        CFDictionarySetValue(v120, v92, v106);
      }
      if (v105) {
        CFDictionarySetValue(v120, v91, v105);
      }
      if (!v112) {
        goto LABEL_198;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_198;
      }
      __int16 v50 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      LODWORD(buf) = 0;
      id v51 = v112;
      if ([v51 isEqualToString:@"ADR"])
      {
        int v52 = 1;
      }
      else if ([v51 isEqualToString:@"AVA"])
      {
        int v52 = 2;
      }
      else if ([v51 isEqualToString:@"AVW"])
      {
        int v52 = 3;
      }
      else if ([v51 isEqualToString:@"BLU"])
      {
        int v52 = 4;
      }
      else if ([v51 isEqualToString:@"BZW"])
      {
        int v52 = 5;
      }
      else if ([v51 isEqualToString:@"CAE"])
      {
        int v52 = 6;
      }
      else if ([v51 isEqualToString:@"CDW"])
      {
        int v52 = 7;
      }
      else if ([v51 isEqualToString:@"CEM"])
      {
        int v52 = 8;
      }
      else if ([v51 isEqualToString:@"CFW"])
      {
        int v52 = 9;
      }
      else if (([v51 isEqualToString:@"DMO"] & 1) != 0 {
             || ([v51 isEqualToString:@"DMO"] & 1) != 0)
      }
      {
        int v52 = 10;
      }
      else if ([v51 isEqualToString:@"DSW"])
      {
        int v52 = 11;
      }
      else if ([v51 isEqualToString:@"EAN"])
      {
        int v52 = 12;
      }
      else if ([v51 isEqualToString:@"EQW"])
      {
        int v52 = 13;
      }
      else if ([v51 isEqualToString:@"EVI"])
      {
        int v52 = 14;
      }
      else if ([v51 isEqualToString:@"FFW"])
      {
        int v52 = 15;
      }
      else if ([v51 isEqualToString:@"FLW"])
      {
        int v52 = 16;
      }
      else if ([v51 isEqualToString:@"FRW"])
      {
        int v52 = 17;
      }
      else if ([v51 isEqualToString:@"HMW"])
      {
        int v52 = 18;
      }
      else if ([v51 isEqualToString:@"HUW"])
      {
        int v52 = 19;
      }
      else if ([v51 isEqualToString:@"HWW"])
      {
        int v52 = 20;
      }
      else if ([v51 isEqualToString:@"LEW"])
      {
        int v52 = 21;
      }
      else if ([v51 isEqualToString:@"LAE"])
      {
        int v52 = 22;
      }
      else if ([v51 isEqualToString:@"NIC"])
      {
        int v52 = 23;
      }
      else if ([v51 isEqualToString:@"NMN"])
      {
        int v52 = 24;
      }
      else if ([v51 isEqualToString:@"NPT"])
      {
        int v52 = 25;
      }
      else if ([v51 isEqualToString:@"NUW"])
      {
        int v52 = 26;
      }
      else if ([v51 isEqualToString:@"RHW"])
      {
        int v52 = 27;
      }
      else if ([v51 isEqualToString:@"RMT"])
      {
        int v52 = 28;
      }
      else if ([v51 isEqualToString:@"RWT"])
      {
        int v52 = 29;
      }
      else if ([v51 isEqualToString:@"SPW"])
      {
        int v52 = 30;
      }
      else if ([v51 isEqualToString:@"SVR"])
      {
        int v52 = 31;
      }
      else if ([v51 isEqualToString:@"SMW"])
      {
        int v52 = 32;
      }
      else if ([v51 isEqualToString:@"TOE"])
      {
        int v52 = 33;
      }
      else if ([v51 isEqualToString:@"TOR"])
      {
        int v52 = 34;
      }
      else if ([v51 isEqualToString:@"TRW"])
      {
        int v52 = 35;
      }
      else if ([v51 isEqualToString:@"TSW"])
      {
        int v52 = 36;
      }
      else if ([v51 isEqualToString:@"VOW"])
      {
        int v52 = 37;
      }
      else if ([v51 isEqualToString:@"WSW"])
      {
        int v52 = 38;
      }
      else if ([v51 isEqualToString:@"EWW"])
      {
        int v52 = 39;
      }
      else if ([v51 isEqualToString:@"FFA"])
      {
        int v52 = 40;
      }
      else if ([v51 isEqualToString:@"FLA"])
      {
        int v52 = 41;
      }
      else if ([v51 isEqualToString:@"FFS"])
      {
        int v52 = 42;
      }
      else if ([v51 isEqualToString:@"HUA"])
      {
        int v52 = 43;
      }
      else if ([v51 isEqualToString:@"NWS"])
      {
        int v52 = 44;
      }
      else if ([v51 isEqualToString:@"SSA"])
      {
        int v52 = 45;
      }
      else if ([v51 isEqualToString:@"SSW"])
      {
        int v52 = 46;
      }
      else if ([v51 isEqualToString:@"SVS"])
      {
        int v52 = 47;
      }
      else if ([v51 isEqualToString:@"SPS"])
      {
        int v52 = 48;
      }
      else if ([v51 isEqualToString:@"TOA"])
      {
        int v52 = 49;
      }
      else if ([v51 isEqualToString:@"TRA"])
      {
        int v52 = 50;
      }
      else
      {
        int v52 = 0;
      }

      LODWORD(buf) = v52;
      CFNumberRef v53 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
      CFNumberRef v54 = v53;
      if (v50 && v53)
      {
        CFArrayAppendValue(v50, v53);
        CFDictionarySetValue(v120, v81, v50);
      }
      else if (!v53)
      {
        goto LABEL_196;
      }
      CFRelease(v54);
LABEL_196:
      if (v50) {
        CFRelease(v50);
      }
LABEL_198:
      if (v113)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v55 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v56 = v113;
          id v57 = [v56 countByEnumeratingWithState:&v128 objects:v133 count:16];
          if (v57)
          {
            uint64_t v58 = *(void *)v129;
            do
            {
              for (uint64_t i = 0; i != v57; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v129 != v58) {
                  objc_enumerationMutation(v56);
                }
                unsigned __int8 v60 = *(void **)(*((void *)&v128 + 1) + 8 * i);
                if (v60)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v61 = v60;
                    LODWORD(buf) = 0;
                    id v62 = v61;
                    if ([v62 isEqualToString:@"Geo"])
                    {
                      int v63 = 1;
                    }
                    else if ([v62 isEqualToString:@"Met"])
                    {
                      int v63 = 2;
                    }
                    else if ([v62 isEqualToString:@"Safety"])
                    {
                      int v63 = 3;
                    }
                    else if ([v62 isEqualToString:@"Security"])
                    {
                      int v63 = 4;
                    }
                    else if ([v62 isEqualToString:@"Rescue"])
                    {
                      int v63 = 5;
                    }
                    else if ([v62 isEqualToString:@"Fire"])
                    {
                      int v63 = 6;
                    }
                    else if ([v62 isEqualToString:@"Health"])
                    {
                      int v63 = 7;
                    }
                    else if ([v62 isEqualToString:@"Env"])
                    {
                      int v63 = 8;
                    }
                    else if ([v62 isEqualToString:@"Transport"])
                    {
                      int v63 = 9;
                    }
                    else if ([v62 isEqualToString:@"Infra"])
                    {
                      int v63 = 10;
                    }
                    else if ([v62 isEqualToString:@"CBRNE"])
                    {
                      int v63 = 11;
                    }
                    else
                    {
                      int v63 = 0;
                    }

                    LODWORD(buf) = v63;
                    CFNumberRef v64 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
                    if (v64)
                    {
                      CFArrayAppendValue(v55, v64);
                      CFRelease(v64);
                    }
                  }
                }
              }
              id v57 = [v56 countByEnumeratingWithState:&v128 objects:v133 count:16];
            }
            while (v57);
          }

          CFDictionarySetValue(v120, v83, v55);
          if (v55) {
            CFRelease(v55);
          }
        }
      }
      if (v111)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          float v65 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          id v66 = v111;
          id v67 = [v66 countByEnumeratingWithState:&v124 objects:v132 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v125;
            do
            {
              for (j = 0; j != v67; j = (char *)j + 1)
              {
                if (*(void *)v125 != v68) {
                  objc_enumerationMutation(v66);
                }
                v70 = *(void **)(*((void *)&v124 + 1) + 8 * (void)j);
                if (v70)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v71 = v70;
                    LODWORD(buf) = 0;
                    id v72 = v71;
                    if ([v72 isEqualToString:@"Shelter"])
                    {
                      int v73 = 1;
                    }
                    else if ([v72 isEqualToString:@"Evacuate"])
                    {
                      int v73 = 2;
                    }
                    else if ([v72 isEqualToString:@"Prepare"])
                    {
                      int v73 = 3;
                    }
                    else if ([v72 isEqualToString:@"Execute"])
                    {
                      int v73 = 4;
                    }
                    else if ([v72 isEqualToString:@"Avoid"])
                    {
                      int v73 = 5;
                    }
                    else if ([v72 isEqualToString:@"Monitor"])
                    {
                      int v73 = 6;
                    }
                    else if ([v72 isEqualToString:@"Assess"])
                    {
                      int v73 = 7;
                    }
                    else if ([v72 isEqualToString:@"AllClear"])
                    {
                      int v73 = 8;
                    }
                    else if ([v72 isEqualToString:@"None"])
                    {
                      int v73 = 9;
                    }
                    else
                    {
                      int v73 = 0;
                    }

                    LODWORD(buf) = v73;
                    CFNumberRef v74 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
                    if (v74)
                    {
                      CFArrayAppendValue(v65, v74);
                      CFRelease(v74);
                    }
                  }
                }
              }
              id v67 = [v66 countByEnumeratingWithState:&v124 objects:v132 count:16];
            }
            while (v67);
          }

          CFDictionarySetValue(v120, v82, v65);
          if (v65) {
            CFRelease(v65);
          }
        }
      }
      BOOL v75 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v117)
      {
        LODWORD(buf) = 0;
        id v76 = v117;
        if ([v76 isEqualToString:@"Presidential"])
        {
          int v77 = 1;
        }
        else if ([v76 isEqualToString:@"Amber"])
        {
          int v77 = 2;
        }
        else if ([v76 isEqualToString:@"Imminent Threat"])
        {
          int v77 = 3;
        }
        else if ([v76 isEqualToString:@"Earthquake"])
        {
          int v77 = 4;
        }
        else if ([v76 isEqualToString:@"Public Safety"])
        {
          int v77 = 5;
        }
        else
        {
          int v77 = [v76 isEqualToString:@"WEA Test"] ? 6 : 0;
        }

        LODWORD(buf) = v77;
        CFNumberRef v78 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v78)
        {
          CFDictionarySetValue(v75, v84, v78);
          CFRelease(v78);
        }
      }
      if (*((void *)&v119 + 1)) {
        CFDictionarySetValue(v75, v90, *((const void **)&v119 + 1));
      }
      if ((void)v119) {
        CFDictionarySetValue(v75, v89, (const void *)v119);
      }
      CFDictionarySetValue(v120, v98, v75);
      if (v75) {
        CFRelease(v75);
      }
      CFArrayAppendValue(theArray, v120);
      if (v120) {
        CFRelease(v120);
      }
      __int16 v42 = (void *)v119;
      goto LABEL_297;
    }
    uint64_t v41 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v135 = 2082;
      float v136 = "";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamPresent,droppingInfoBlock\"}", (uint8_t *)&buf, 0x12u);
    }

    *((void *)&v119 + 1) = 0;
    __int16 v42 = 0;
LABEL_297:

    uint64_t v20 = v123 + 1;
  }
  while ((id)(v123 + 1) != v102);
  if (![(__CFArray *)theArray count])
  {
    float v79 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v135 = 2082;
      float v136 = "";
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,warning,noInfoBlocksPresent,droppingAlert\"}", (uint8_t *)&buf, 0x12u);
    }

    if (theArray) {
      CFRelease(theArray);
    }
    goto LABEL_391;
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Info_Key, theArray);
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_392:

LABEL_393:
LABEL_394:

  id v2 = 0;
LABEL_395:

  return theDict;
}

void sub_1000A3F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,uint64_t a42,void *a43,void *a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000A4420(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"en-US"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"es-US"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1000A4480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACoreTelephonyProd::isAdditionalDetailsPresent(SACoreTelephonyProd *this, const NSDictionary *a2)
{
  uint64_t v2 = this;
  id v3 = v2;
  if (v2)
  {
    unint64_t v4 = [(SACoreTelephonyProd *)v2 objectForKey:@"info"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = v4;
      unint64_t v6 = (char *)[v5 count];
      if (v6)
      {
        unint64_t v7 = 0;
        char v8 = 0;
        do
        {
          __int16 v9 = [v5 objectAtIndexedSubscript:v7];
          int v10 = [v9 objectForKey:@"instruction"];

          if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            id v11 = v10;
          }
          else {
            id v11 = 0;
          }

          v8 |= v11 != 0;
          ++v7;
        }
        while (v6 != v7);
      }
      else
      {
        int v14 = SALogObjectGeneral;
        char v8 = 0;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 68289026;
          int v17 = 0;
          __int16 v18 = 2082;
          id v19 = "";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,infoCountInvalid\"}", (uint8_t *)&v16, 0x12u);
          char v8 = 0;
        }
      }
    }
    else
    {
      uint32_t v12 = SALogObjectGeneral;
      char v8 = 0;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,infoMissing\"}", (uint8_t *)&v16, 0x12u);
        char v8 = 0;
      }
    }
  }
  else
  {
    __int16 v13 = SALogObjectGeneral;
    char v8 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,invalidDictionary\"}", (uint8_t *)&v16, 0x12u);
      char v8 = 0;
    }
  }

  return v8 & 1;
}

void sub_1000A4740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000A478C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v19 = 0;
    id v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:&v19];
    id v4 = v19;
    id v5 = v4;
    BOOL v6 = v3 != 0;
    if (v3)
    {
      id v18 = v4;
      id v7 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
      char v8 = [v7 dataUsingEncoding:4];
      __int16 v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:0];
      CFMutableDictionaryRef v10 = sub_1000A2104(v9);
      if (!v10)
      {
        id v11 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v21 = 0;
          __int16 v22 = 2082;
          __int16 v23 = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,invalid rootDict\"}", buf, 0x12u);
        }
      }
      uint64_t v12 = _CTServerConnectionSendAppleSafetyAlert();
      __int16 v13 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 1026;
        int v25 = v12;
        __int16 v26 = 1026;
        int v27 = HIDWORD(v12);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{public}d}", buf, 0x1Eu);
      }
      if (v10) {
        CFRelease(v10);
      }

      id v5 = v18;
    }
    else
    {
      int v16 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,null jsonData\"}", buf, 0x12u);
      }
    }
  }
  else
  {
    __int16 v15 = SALogObjectGeneral;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,null alert\"}", buf, 0x12u);
      BOOL v6 = 0;
    }
  }

  return v6;
}

void sub_1000A4AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A4B44(uint64_t a1)
{
  sub_1000A4BD4(*(SACoreTelephony **)(a1 + 32));
}

void sub_1000A4BCC(uint64_t a1)
{
}

void sub_1000A4BD4(SACoreTelephony *a1)
{
  id v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    BOOL v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotificationCb\"}", (uint8_t *)v4, 0x12u);
  }
  int EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState();
  SACoreTelephony::onEnhanceDeliveryStateChange(a1, EnhancedDeliveryState);
}

uint64_t sub_1000A4CA4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"alert"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    BOOL v6 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2113;
      *(void *)&buf[20] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,IgneousInformation\", \"jsondict\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    if (v5)
    {
      id v7 = [v5 objectForKey:@"source"];
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v80 = 0u;
          memset(v79, 0, sizeof(v79));
          long long v77 = 0u;
          long long v78 = 0u;
          long long v76 = 0u;
          long long v75 = 0u;
          memset(buf, 0, sizeof(buf));
          __asm { FMOV            V0.2D, #10.0 }
          long long v82 = _Q0;
          __asm { FMOV            V0.2D, #-1.0 }
          long long v83 = _Q0;
          long long v84 = _Q0;
          uint64_t v81 = 0;
          unint64_t v85 = 0xBFF0000000000000;
          __int16 v13 = sub_10006B474();
          sub_10002B120((uint64_t)v13, (std::string *)buf);
          int v14 = (id)SALogObjectGeneral;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            sub_10000DD48(__p, (char *)[v7 UTF8String]);
            __int16 v15 = v63 >= 0 ? __p : (void **)__p[0];
            if (SBYTE7(v77) < 0)
            {
              int v16 = (const char *)v76;
              _ZF = *((void *)&v76 + 1) == 0;
            }
            else
            {
              int v16 = (const char *)&v76;
              _ZF = SBYTE7(v77) == 0;
            }
            __int16 v23 = _ZF ? "" : (char *)v16;
            if (SHIBYTE(v78) < 0)
            {
              __int16 v24 = (const char *)*((void *)&v77 + 1);
              BOOL v25 = (void)v78 == 0;
            }
            else
            {
              __int16 v24 = (char *)&v77 + 8;
              BOOL v25 = SHIBYTE(v78) == 0;
            }
            __int16 v26 = v25 ? "" : (char *)v24;
            if (SHIBYTE(v79[2]) < 0)
            {
              int v27 = (void **)v79[0];
              BOOL v28 = v79[1] == 0;
            }
            else
            {
              int v27 = v79;
              BOOL v28 = SHIBYTE(v79[2]) == 0;
            }
            int v29 = v28 ? "" : (char *)v27;
            *(_DWORD *)CFNumberRef v64 = 68290051;
            *(_DWORD *)&v64[4] = 0;
            *(_WORD *)float v65 = 2082;
            *(void *)&v65[2] = "";
            __int16 v66 = 2081;
            id v67 = v15;
            __int16 v68 = 2081;
            int v69 = v23;
            __int16 v70 = 2081;
            id v71 = v26;
            __int16 v72 = 2081;
            int v73 = v29;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert\", \"source\":%{private, location:escape_only}s, \"MASource\":%{private, location:escape_only}s, \"MATestSource\":%{private, location:escape_only}s, \"MAFollowUpSource\":%{private, location:escape_only}s}", v64, 0x3Au);
            if (v63 < 0) {
              operator delete(__p[0]);
            }
          }

          uint64_t v30 = BYTE7(v77);
          if (SBYTE7(v77) < 0) {
            uint64_t v30 = *((void *)&v76 + 1);
          }
          if (!v30) {
            goto LABEL_71;
          }
          sub_10000DD48(v64, (char *)[v7 UTF8String]);
          int v31 = SBYTE3(v67);
          __int16 v32 = *(uint8_t **)v64;
          if (SBYTE3(v67) >= 0) {
            size_t v33 = BYTE3(v67);
          }
          else {
            size_t v33 = *(void *)v65;
          }
          if (SBYTE3(v67) >= 0) {
            __int16 v34 = v64;
          }
          else {
            __int16 v34 = *(uint8_t **)v64;
          }
          if ((SBYTE7(v77) & 0x80u) == 0) {
            size_t v35 = BYTE7(v77);
          }
          else {
            size_t v35 = *((void *)&v76 + 1);
          }
          if ((SBYTE7(v77) & 0x80u) == 0) {
            __int16 v36 = &v76;
          }
          else {
            __int16 v36 = (long long *)v76;
          }
          if (v35 >= v33) {
            size_t v37 = v33;
          }
          else {
            size_t v37 = v35;
          }
          BOOL v38 = memcmp(v34, v36, v37) == 0;
          BOOL v39 = v35 == v33 && v38;
          if (v31 < 0) {
            operator delete(v32);
          }
          if (v39)
          {
            uint64_t v19 = 1;
          }
          else
          {
LABEL_71:
            uint64_t v40 = HIBYTE(v78);
            if (v78 < 0) {
              uint64_t v40 = v78;
            }
            if (!v40) {
              goto LABEL_96;
            }
            sub_10000DD48(v64, (char *)[v7 UTF8String]);
            int v41 = SBYTE3(v67);
            __int16 v42 = *(uint8_t **)v64;
            if (SBYTE3(v67) >= 0) {
              size_t v43 = BYTE3(v67);
            }
            else {
              size_t v43 = *(void *)v65;
            }
            if (SBYTE3(v67) >= 0) {
              id v44 = v64;
            }
            else {
              id v44 = *(uint8_t **)v64;
            }
            if (v78 >= 0) {
              size_t v45 = HIBYTE(v78);
            }
            else {
              size_t v45 = v78;
            }
            if (v78 >= 0) {
              CFNumberRef v46 = (char *)&v77 + 8;
            }
            else {
              CFNumberRef v46 = (char *)*((void *)&v77 + 1);
            }
            if (v45 >= v43) {
              size_t v47 = v43;
            }
            else {
              size_t v47 = v45;
            }
            BOOL v48 = memcmp(v44, v46, v47) == 0;
            BOOL v49 = v45 == v43 && v48;
            if (v41 < 0) {
              operator delete(v42);
            }
            if (v49)
            {
              uint64_t v19 = 2;
            }
            else
            {
LABEL_96:
              __int16 v50 = (void *)HIBYTE(v79[2]);
              if (SHIBYTE(v79[2]) < 0) {
                __int16 v50 = v79[1];
              }
              if (!v50) {
                goto LABEL_121;
              }
              sub_10000DD48(v64, (char *)[v7 UTF8String]);
              int v51 = SBYTE3(v67);
              int v52 = *(uint8_t **)v64;
              if (SBYTE3(v67) >= 0) {
                size_t v53 = BYTE3(v67);
              }
              else {
                size_t v53 = *(void *)v65;
              }
              if (SBYTE3(v67) >= 0) {
                CFNumberRef v54 = v64;
              }
              else {
                CFNumberRef v54 = *(uint8_t **)v64;
              }
              if (SHIBYTE(v79[2]) >= 0) {
                id v55 = (void *)HIBYTE(v79[2]);
              }
              else {
                id v55 = v79[1];
              }
              if (SHIBYTE(v79[2]) >= 0) {
                id v56 = v79;
              }
              else {
                id v56 = (void **)v79[0];
              }
              if ((unint64_t)v55 >= v53) {
                size_t v57 = v53;
              }
              else {
                size_t v57 = (size_t)v55;
              }
              BOOL v58 = memcmp(v54, v56, v57) == 0;
              BOOL v59 = v55 == (void *)v53 && v58;
              if (v51 < 0) {
                operator delete(v52);
              }
              if (!v59)
              {
LABEL_121:
                sub_10000DD48(v64, (char *)[v7 UTF8String]);
                unsigned __int8 v60 = (SACommonUtils *)std::string::compare((const std::string *)v64, (const std::string::value_type *)[@"USGSLivability" UTF8String]);
                if (v60)
                {
                  if (SBYTE3(v67) < 0) {
                    operator delete(*(void **)v64);
                  }
                }
                else
                {
                  char isLivabiltyEnabled = SACommonUtils::isLivabiltyEnabled(v60);
                  if (SBYTE3(v67) < 0) {
                    operator delete(*(void **)v64);
                  }
                  if (isLivabiltyEnabled)
                  {
                    uint64_t v19 = 4;
                    goto LABEL_129;
                  }
                }
                uint64_t v19 = 5;
                goto LABEL_129;
              }
              uint64_t v19 = 3;
            }
          }
LABEL_129:
          *(void *)CFNumberRef v64 = &v80;
          sub_100005360((void ***)v64);
          *(void *)CFNumberRef v64 = &v79[3];
          sub_100005360((void ***)v64);
          if (SHIBYTE(v79[2]) < 0) {
            operator delete(v79[0]);
          }
          if (SHIBYTE(v78) < 0) {
            operator delete(*((void **)&v77 + 1));
          }
          if (SBYTE7(v77) < 0) {
            operator delete((void *)v76);
          }
          if (SHIBYTE(v75) < 0) {
            operator delete(*(void **)&buf[24]);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }

          goto LABEL_26;
        }
      }

      uint64_t v20 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        int v21 = "{\"msg%{public}.0s\":\"#ctsa,source nil\"}";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x12u);
      }
    }
    else
    {
      uint64_t v20 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        int v21 = "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,jsondict nil\"}";
        goto LABEL_24;
      }
    }
    uint64_t v19 = 5;
LABEL_26:

    goto LABEL_27;
  }
  id v18 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,null alert\"}", buf, 0x12u);
  }
  uint64_t v19 = 5;
LABEL_27:

  return v19;
}

void sub_1000A5384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  sub_100032B20((uint64_t)&a24);

  _Unwind_Resume(a1);
}

uint64_t sub_1000A5408(uint64_t a1, uint64_t a2)
{
  CFMutableDictionaryRef cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    int v31 = SALogObjectGeneral;
    uint64_t v32 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      return v32;
    }
    *(_DWORD *)int v52 = 68289026;
    *(_DWORD *)&v52[4] = 0;
    *(_WORD *)&v52[8] = 2082;
    *(void *)&v52[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,rootDict invalid\"}", v52, 0x12u);
    return 0;
  }
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    size_t v33 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v52 = 68289026;
      *(_DWORD *)&v52[4] = 0;
      *(_WORD *)&v52[8] = 2082;
      *(void *)&v52[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDictMain invalid\"}", v52, 0x12u);
    }
    CFRelease(cf);
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    __int16 v34 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v52 = 68289026;
      *(_DWORD *)&v52[4] = 0;
      *(_WORD *)&v52[8] = 2082;
      *(void *)&v52[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDict invalid\"}", v52, 0x12u);
    }
    CFRelease(theDict);
    CFRelease(cf);
    return 0;
  }
  CFMutableArrayRef v4 = Mutable;
  uint64_t v39 = a2;
  uint64_t v60 = 0;
  long long v59 = 0u;
  long long v57 = 0u;
  memset(v58, 0, sizeof(v58));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v52, 0, sizeof(v52));
  __asm { FMOV            V0.2D, #10.0 }
  long long v61 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v62 = _Q0;
  long long v63 = _Q0;
  unint64_t v64 = 0xBFF0000000000000;
  id v11 = sub_10006B474();
  sub_10002B120((uint64_t)v11, (std::string *)v52);
  char v12 = 0;
  char v13 = 1;
  do
  {
    char v14 = v13;
    CFMutableArrayRef v15 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!v15)
    {
      size_t v35 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v44 = 2082;
        size_t v45 = "";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDictList invalid\"}", buf, 0x12u);
      }
      CFRelease(v4);
      CFRelease(theDict);
      CFRelease(cf);
      goto LABEL_47;
    }
    int valuePtr = 0;
    if (v12) {
      +[NSString stringWithUTF8String:"es-US"];
    }
    else {
    int v16 = +[NSString stringWithUTF8String:"en-US"];
    }
    int v17 = sub_1000A4420(v16);

    int valuePtr = v17;
    CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (!v18)
    {
      __int16 v36 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v44 = 2082;
        size_t v45 = "";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,item1 invalid\"}", buf, 0x12u);
      }
LABEL_46:
      CFRelease(v15);
      CFRelease(v4);
      CFRelease(theDict);
      CFRelease(cf);
LABEL_47:
      uint64_t v32 = 0;
      goto LABEL_52;
    }
    CFArrayAppendValue(v15, v18);
    CFRelease(v18);
    if (v12)
    {
      if (v53 >= 0) {
        uint64_t v19 = &v52[24];
      }
      else {
        uint64_t v19 = *(const char **)&v52[24];
      }
    }
    else if (v52[23] >= 0)
    {
      uint64_t v19 = v52;
    }
    else
    {
      uint64_t v19 = *(const char **)v52;
    }
    CFStringRef v20 = CFStringCreateWithCString(kCFAllocatorDefault, v19, 0x8000100u);
    if (!v20)
    {
      size_t v37 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v44 = 2082;
        size_t v45 = "";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,item2 invalid\"}", buf, 0x12u);
      }
      goto LABEL_46;
    }
    CFArrayAppendValue(v15, v20);
    CFArrayAppendValue(v4, v15);
    CFRelease(v20);
    CFRelease(v15);
    char v13 = 0;
    char v12 = 1;
  }
  while ((v14 & 1) != 0);
  if (*(char *)(v39 + 23) >= 0) {
    int v21 = (const char *)v39;
  }
  else {
    int v21 = *(const char **)v39;
  }
  CFStringRef v22 = CFStringCreateWithCString(kCFAllocatorDefault, v21, 0x8000100u);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v22);
  if (v22) {
    CFRelease(v22);
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, v4);
  CFDictionarySetValue(cf, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
  __int16 v23 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v44 = 2082;
    size_t v45 = "";
    __int16 v46 = 2113;
    *(void *)size_t v47 = cf;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert\", \"rootDict\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  LOBYTE(valuePtr) = 0;
  uint64_t v24 = _CTServerConnectionSendAppleSafetyAlert();
  int v25 = valuePtr;
  uint64_t v26 = SALogObjectGeneral;
  BOOL v27 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v44 = 2082;
      size_t v45 = "";
      BOOL v28 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert sent successfully \"}";
      int v29 = v26;
      uint32_t v30 = 18;
      goto LABEL_50;
    }
  }
  else if (v27)
  {
    *(_DWORD *)uint64_t buf = 68290051;
    __int16 v44 = 2082;
    *(_DWORD *)&uint8_t buf[4] = 0;
    size_t v45 = "";
    __int16 v46 = 1026;
    *(_DWORD *)size_t v47 = v24;
    *(_WORD *)&v47[4] = 1026;
    *(_DWORD *)&v47[6] = HIDWORD(v24);
    __int16 v48 = 2113;
    CFMutableDictionaryRef v49 = cf;
    __int16 v50 = 2113;
    CFMutableDictionaryRef v51 = theDict;
    BOOL v28 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{publ"
          "ic}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
    int v29 = v26;
    uint32_t v30 = 50;
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
  }
  CFRelease(v4);
  CFRelease(theDict);
  CFRelease(cf);
  uint64_t v32 = 1;
LABEL_52:
  *(void *)uint64_t buf = &v59;
  sub_100005360((void ***)buf);
  *(void *)uint64_t buf = &v58[8];
  sub_100005360((void ***)buf);
  if ((v58[7] & 0x80000000) != 0) {
    operator delete((void *)v57);
  }
  if (SHIBYTE(v56) < 0) {
    operator delete(*((void **)&v55 + 1));
  }
  if (SBYTE7(v55) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v53) < 0) {
    operator delete(*(void **)&v52[24]);
  }
  if ((v52[23] & 0x80000000) != 0) {
    operator delete(*(void **)v52);
  }
  return v32;
}

void sub_1000A5BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_100032B20((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A5C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v63 = 0;
  long long v62 = 0u;
  long long v60 = 0u;
  memset(v61, 0, sizeof(v61));
  *(_OWORD *)BOOL v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  *(_OWORD *)long long v57 = 0u;
  memset(v55, 0, sizeof(v55));
  __asm { FMOV            V0.2D, #10.0 }
  long long v64 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v65 = _Q0;
  long long v66 = _Q0;
  unint64_t v67 = 0xBFF0000000000000;
  char v13 = sub_10006B474();
  sub_10002B120((uint64_t)v13, (std::string *)v55);
  CFMutableDictionaryRef cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    int v41 = SALogObjectGeneral;
    uint64_t v42 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    uint64_t buf = (void **)68289026;
    __int16 v69 = 2082;
    __int16 v70 = "";
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,rootDict invalid\"}", (uint8_t *)&buf, 0x12u);
    goto LABEL_46;
  }
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    size_t v43 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = (void **)68289026;
      __int16 v69 = 2082;
      __int16 v70 = "";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,infoDictMain invalid\"}", (uint8_t *)&buf, 0x12u);
    }
    CFRelease(cf);
    goto LABEL_46;
  }
  CFMutableArrayRef theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!theArray)
  {
    __int16 v44 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = (void **)68289026;
      __int16 v69 = 2082;
      __int16 v70 = "";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,infoDict invalid\"}", (uint8_t *)&buf, 0x12u);
    }
    CFRelease(theDict);
    CFRelease(cf);
LABEL_46:
    uint64_t v42 = 0;
    goto LABEL_63;
  }
  char v14 = (std::string *)sub_10000DD48(&buf, (char *)[@"FollowUp" UTF8String]);
  int v15 = *(char *)(a2 + 23);
  if (v15 >= 0) {
    int v16 = (const std::string::value_type *)a2;
  }
  else {
    int v16 = *(const std::string::value_type **)a2;
  }
  if (v15 >= 0) {
    std::string::size_type v17 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v17 = *(void *)(a2 + 8);
  }
  CFNumberRef v18 = std::string::insert(v14, 0, v16, v17);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  int64_t v54 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if ((v72[3] & 0x80000000) != 0) {
    operator delete(buf);
  }
  char v20 = 0;
  char v21 = 1;
  do
  {
    char v22 = v21;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      size_t v45 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = (void **)68289026;
        __int16 v69 = 2082;
        __int16 v70 = "";
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,infoDictList invalid\"}", (uint8_t *)&buf, 0x12u);
      }
      CFRelease(theArray);
      CFRelease(theDict);
      CFRelease(cf);
      goto LABEL_56;
    }
    int valuePtr = 0;
    if (v20) {
      +[NSString stringWithUTF8String:"es-US"];
    }
    else {
    uint64_t v24 = +[NSString stringWithUTF8String:"en-US"];
    }
    int v25 = sub_1000A4420(v24);

    int valuePtr = v25;
    CFNumberRef v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (!v26)
    {
      __int16 v46 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = (void **)68289026;
        __int16 v69 = 2082;
        __int16 v70 = "";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,item1 invalid\"}", (uint8_t *)&buf, 0x12u);
      }
LABEL_55:
      CFRelease(Mutable);
      CFRelease(theArray);
      CFRelease(theDict);
      CFRelease(cf);
LABEL_56:
      uint64_t v42 = 0;
      goto LABEL_61;
    }
    CFArrayAppendValue(Mutable, v26);
    CFRelease(v26);
    if (v20) {
      BOOL v27 = (const char **)a4;
    }
    else {
      BOOL v27 = (const char **)a3;
    }
    BOOL v28 = (char *)(a4 + 23);
    if ((v20 & 1) == 0) {
      BOOL v28 = (char *)(a3 + 23);
    }
    if (*v28 >= 0) {
      int v29 = (const char *)v27;
    }
    else {
      int v29 = *v27;
    }
    CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, v29, 0x8000100u);
    if (!v30)
    {
      size_t v47 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = (void **)68289026;
        __int16 v69 = 2082;
        __int16 v70 = "";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,item2 invalid\"}", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_55;
    }
    CFArrayAppendValue(Mutable, v30);
    CFArrayAppendValue(theArray, Mutable);
    CFRelease(v30);
    CFRelease(Mutable);
    char v21 = 0;
    char v20 = 1;
  }
  while ((v22 & 1) != 0);
  if (v54 >= 0) {
    int v31 = __p;
  }
  else {
    int v31 = (void **)__p[0];
  }
  CFStringRef v32 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v31, 0x8000100u);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v32);
  if (v32) {
    CFRelease(v32);
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, theArray);
  CFDictionarySetValue(cf, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
  size_t v33 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = (void **)68289283;
    __int16 v69 = 2082;
    __int16 v70 = "";
    __int16 v71 = 2113;
    *(void *)__int16 v72 = cf;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert\", \"rootDict\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  LOBYTE(valuePtr) = 0;
  uint64_t v34 = _CTServerConnectionSendAppleSafetyAlert();
  int v35 = valuePtr;
  uint64_t v36 = SALogObjectGeneral;
  BOOL v37 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v35)
  {
    if (v37)
    {
      uint64_t buf = (void **)68289026;
      __int16 v69 = 2082;
      __int16 v70 = "";
      BOOL v38 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert sent successfully \"}";
      uint64_t v39 = v36;
      uint32_t v40 = 18;
      goto LABEL_59;
    }
  }
  else if (v37)
  {
    uint64_t buf = (void **)68290051;
    __int16 v69 = 2082;
    __int16 v70 = "";
    __int16 v71 = 1026;
    *(_DWORD *)__int16 v72 = v34;
    *(_WORD *)&v72[4] = 1026;
    *(_DWORD *)&v72[6] = HIDWORD(v34);
    __int16 v73 = 2113;
    CFMutableDictionaryRef v74 = cf;
    __int16 v75 = 2113;
    CFMutableDictionaryRef v76 = theDict;
    BOOL v38 = "{\"msg%{public}.0s\":\"#ctsa,Igneous,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{public}d, \"r"
          "ootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
    uint64_t v39 = v36;
    uint32_t v40 = 50;
LABEL_59:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&buf, v40);
  }
  CFRelease(theArray);
  CFRelease(theDict);
  CFRelease(cf);
  uint64_t v42 = 1;
LABEL_61:
  if (SHIBYTE(v54) < 0) {
    operator delete(__p[0]);
  }
LABEL_63:
  uint64_t buf = (void **)&v62;
  sub_100005360(&buf);
  uint64_t buf = (void **)&v61[8];
  sub_100005360(&buf);
  if ((v61[7] & 0x80000000) != 0) {
    operator delete((void *)v60);
  }
  if (SHIBYTE(v59) < 0) {
    operator delete(v58[1]);
  }
  if (SHIBYTE(v58[0]) < 0) {
    operator delete(v57[0]);
  }
  if (SHIBYTE(v56) < 0) {
    operator delete(*(void **)&v55[24]);
  }
  if ((v55[23] & 0x80000000) != 0) {
    operator delete(*(void **)v55);
  }
  return v42;
}

void sub_1000A6470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  sub_100032B20((uint64_t)&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A6504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v63 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v62, 0, sizeof(v62));
  *(_OWORD *)long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  *(_OWORD *)BOOL v58 = 0u;
  memset(v56, 0, sizeof(v56));
  __asm { FMOV            V0.2D, #10.0 }
  long long v65 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v66 = _Q0;
  long long v67 = _Q0;
  uint64_t v64 = 0;
  unint64_t v68 = 0xBFF0000000000000;
  CFMutableDictionaryRef v10 = sub_10006B474();
  sub_10002B120((uint64_t)v10, (std::string *)v56);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v12)
    {
      CFMutableArrayRef v13 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (v13)
      {
        uint64_t v52 = a1;
        uint64_t v53 = a3;
        char v14 = 1;
        while (1)
        {
          char v15 = v14;
          CFMutableArrayRef v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          if (!v16)
          {
            CFMutableDictionaryRef v49 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(void *)__int16 v69 = 68289026;
              *(_WORD *)&v69[8] = 2082;
              *(void *)&v69[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDictList invalid\"}", v69, 0x12u);
            }
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            goto LABEL_67;
          }
          int valuePtr = 0;
          if (v15) {
            +[NSString stringWithUTF8String:"en-US"];
          }
          else {
          std::string::size_type v17 = +[NSString stringWithUTF8String:"es-US"];
          }
          int v18 = sub_1000A4420(v17);

          int valuePtr = v18;
          CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
          if (!v19)
          {
            __int16 v50 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(void *)__int16 v69 = 68289026;
              *(_WORD *)&v69[8] = 2082;
              *(void *)&v69[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,item1 invalid\"}", v69, 0x12u);
            }
            CFRelease(v16);
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            goto LABEL_67;
          }
          CFArrayAppendValue(v16, v19);
          CFRelease(v19);
          sub_10000DD48(&v54, (char *)[@"APPLE SAFETY ALERTS LIVABILITY TEST:" UTF8String]);
          if (v56[23] >= 0) {
            char v20 = v56;
          }
          else {
            char v20 = *(const std::string::value_type **)v56;
          }
          if (v56[23] >= 0) {
            std::string::size_type v21 = v56[23];
          }
          else {
            std::string::size_type v21 = *(void *)&v56[8];
          }
          char v22 = std::string::append(&v54, v20, v21);
          long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
          *(void *)&v69[16] = *((void *)&v22->__r_.__value_.__l + 2);
          *(_OWORD *)__int16 v69 = v23;
          v22->__r_.__value_.__l.__size_ = 0;
          v22->__r_.__value_.__r.__words[2] = 0;
          v22->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v54.__r_.__value_.__l.__data_);
          }
          uint64_t v24 = (std::string *)sub_10000DD48(buf, (char *)[@"APPLE SAFETY ALERTS LIVABILITY TEST:" UTF8String]);
          if (v57 >= 0) {
            int v25 = &v56[24];
          }
          else {
            int v25 = *(const std::string::value_type **)&v56[24];
          }
          if (v57 >= 0) {
            std::string::size_type v26 = HIBYTE(v57);
          }
          else {
            std::string::size_type v26 = v57;
          }
          BOOL v27 = std::string::append(v24, v25, v26);
          long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
          v54.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v28;
          v27->__r_.__value_.__l.__size_ = 0;
          v27->__r_.__value_.__r.__words[2] = 0;
          v27->__r_.__value_.__r.__words[0] = 0;
          if (v77 < 0)
          {
            operator delete(*(void **)buf);
            if ((v15 & 1) == 0)
            {
LABEL_28:
              std::string::size_type v29 = v54.__r_.__value_.__r.__words[0];
              _NF = (v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
              int v31 = &v54;
              goto LABEL_29;
            }
          }
          else if ((v15 & 1) == 0)
          {
            goto LABEL_28;
          }
          std::string::size_type v29 = *(void *)v69;
          _NF = v69[23] < 0;
          int v31 = (std::string *)v69;
LABEL_29:
          if (_NF) {
            CFStringRef v32 = (const char *)v29;
          }
          else {
            CFStringRef v32 = (const char *)v31;
          }
          CFStringRef v33 = CFStringCreateWithCString(kCFAllocatorDefault, v32, 0x8000100u);
          if (v33)
          {
            CFArrayAppendValue(v16, v33);
            CFArrayAppendValue(v13, v16);
            CFRelease(v33);
          }
          else
          {
            uint64_t v34 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(void *)uint64_t buf = 68289026;
              __int16 v75 = 2082;
              CFMutableDictionaryRef v76 = "";
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,item2 invalid\"}", buf, 0x12u);
            }
            CFRelease(v16);
            CFRelease(v13);
            CFRelease(v12);
            CFMutableArrayRef v16 = Mutable;
          }
          CFRelease(v16);
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v54.__r_.__value_.__l.__data_);
          }
          if ((v69[23] & 0x80000000) != 0) {
            operator delete(*(void **)v69);
          }
          if (!v33) {
            goto LABEL_67;
          }
          char v14 = 0;
          if ((v15 & 1) == 0)
          {
            if (*(char *)(v53 + 31) >= 0) {
              int v35 = (const char *)(v53 + 8);
            }
            else {
              int v35 = *(const char **)(v53 + 8);
            }
            CFStringRef v36 = CFStringCreateWithCString(kCFAllocatorDefault, v35, 0x8000100u);
            CFDictionarySetValue(v12, kAppleSafetyAlert_Earthquake_UniqueID_Key, v36);
            if (v36) {
              CFRelease(v36);
            }
            CFDictionarySetValue(v12, kAppleSafetyAlert_Earthquake_Info_Key, v13);
            CFDictionarySetValue(Mutable, kAppleSafetyAlert_Trigger_Earthquake_Key, v12);
            BOOL v37 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(void *)__int16 v69 = 68289283;
              *(_WORD *)&v69[8] = 2082;
              *(void *)&v69[10] = "";
              *(_WORD *)&v69[18] = 2113;
              *(void *)&v69[20] = Mutable;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert\", \"rootDict\":%{private, location:escape_only}@}", v69, 0x1Cu);
            }
            v54.__r_.__value_.__s.__data_[0] = 0;
            uint64_t v38 = _CTServerConnectionSendAppleSafetyAlert();
            int v39 = v54.__r_.__value_.__s.__data_[0];
            uint64_t v40 = SALogObjectGeneral;
            BOOL v41 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
            if (v39)
            {
              if (v41)
              {
                *(void *)__int16 v69 = 68289026;
                *(_WORD *)&v69[8] = 2082;
                *(void *)&v69[10] = "";
                uint64_t v42 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert sent successfully \"}";
                size_t v43 = v40;
                uint32_t v44 = 18;
                goto LABEL_81;
              }
            }
            else if (v41)
            {
              *(void *)__int16 v69 = 68290051;
              *(_WORD *)&v69[8] = 2082;
              *(void *)&v69[10] = "";
              *(_WORD *)&v69[18] = 1026;
              *(_DWORD *)&v69[20] = v38;
              *(_WORD *)&v69[24] = 1026;
              *(_DWORD *)&v69[26] = HIDWORD(v38);
              __int16 v70 = 2113;
              CFMutableDictionaryRef v71 = Mutable;
              __int16 v72 = 2113;
              CFMutableDictionaryRef v73 = v12;
              uint64_t v42 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,didFailWithError\", \"errordomain\":%{public"
                    "}d, \"error\":%{public}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private"
                    ", location:escape_only}@}";
              size_t v43 = v40;
              uint32_t v44 = 50;
LABEL_81:
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v42, v69, v44);
            }
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            uint64_t v46 = 1;
            goto LABEL_68;
          }
        }
      }
      __int16 v48 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)__int16 v69 = 68289026;
        *(_WORD *)&v69[8] = 2082;
        *(void *)&v69[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDict invalid\"}", v69, 0x12u);
      }
      CFRelease(v12);
      CFRelease(Mutable);
    }
    else
    {
      size_t v47 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)__int16 v69 = 68289026;
        *(_WORD *)&v69[8] = 2082;
        *(void *)&v69[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDictMain invalid\"}", v69, 0x12u);
      }
      CFRelease(Mutable);
    }
LABEL_67:
    uint64_t v46 = 0;
  }
  else
  {
    size_t v45 = SALogObjectGeneral;
    uint64_t v46 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)__int16 v69 = 68289026;
      *(_WORD *)&v69[8] = 2082;
      *(void *)&v69[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,rootDict invalid\"}", v69, 0x12u);
      goto LABEL_67;
    }
  }
LABEL_68:
  *(void *)__int16 v69 = &v63;
  sub_100005360((void ***)v69);
  *(void *)__int16 v69 = (char *)v62 + 8;
  sub_100005360((void ***)v69);
  if (SBYTE7(v62[0]) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v60) < 0) {
    operator delete(v59[1]);
  }
  if (SHIBYTE(v59[0]) < 0) {
    operator delete(v58[0]);
  }
  if (SHIBYTE(v57) < 0) {
    operator delete(*(void **)&v56[24]);
  }
  if ((v56[23] & 0x80000000) != 0) {
    operator delete(*(void **)v56);
  }
  return v46;
}

void sub_1000A6DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_100032B20((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A6E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if (!v4) {
    goto LABEL_39;
  }
  uint64_t v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a3 + 8);
  }
  if (!v6) {
    goto LABEL_39;
  }
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      id v11 = Mutable;
      CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v12)
      {
        CFMutableDictionaryRef theDict = v12;
        CFMutableArrayRef theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        if (theArray)
        {
          uint64_t v42 = v11;
          char v13 = 0;
          char v14 = 1;
          while (1)
          {
            char v15 = v14;
            CFMutableArrayRef v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
            if (!v16)
            {
              uint64_t v34 = SALogObjectGeneral;
              BOOL v41 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
              uint64_t result = 0;
              if (!v41) {
                return result;
              }
              *(_DWORD *)uint64_t buf = 68289026;
              int v47 = 0;
              __int16 v48 = 2082;
              CFMutableDictionaryRef v49 = "";
              BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,infoDictList invalid\"}";
              goto LABEL_41;
            }
            int valuePtr = 0;
            if (v13) {
              +[NSString stringWithUTF8String:"es-US"];
            }
            else {
            std::string::size_type v17 = +[NSString stringWithUTF8String:"en-US"];
            }
            int v18 = sub_1000A4420(v17);

            int valuePtr = v18;
            CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
            if (!v19)
            {
              uint64_t v34 = SALogObjectGeneral;
              if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
                return 0;
              }
              *(_DWORD *)uint64_t buf = 68289026;
              int v47 = 0;
              __int16 v48 = 2082;
              CFMutableDictionaryRef v49 = "";
              BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,item1 invalid\"}";
              goto LABEL_41;
            }
            CFArrayAppendValue(v16, v19);
            CFRelease(v19);
            if (v13) {
              char v20 = (void *)a4;
            }
            else {
              char v20 = (void *)a3;
            }
            std::string::size_type v21 = (char *)(a4 + 23);
            if ((v13 & 1) == 0) {
              std::string::size_type v21 = (char *)(a3 + 23);
            }
            char v22 = *v21 >= 0 ? (const char *)v20 : (const char *)*v20;
            CFStringRef v23 = CFStringCreateWithCString(kCFAllocatorDefault, v22, 0x8000100u);
            if (!v23) {
              break;
            }
            CFArrayAppendValue(v16, v23);
            CFArrayAppendValue(theArray, v16);
            CFRelease(v23);
            CFRelease(v16);
            char v14 = 0;
            char v13 = 1;
            if ((v15 & 1) == 0)
            {
              if (*(char *)(a2 + 23) >= 0) {
                uint64_t v24 = (const char *)a2;
              }
              else {
                uint64_t v24 = *(const char **)a2;
              }
              CFStringRef v25 = CFStringCreateWithCString(kCFAllocatorDefault, v24, 0x8000100u);
              CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v25);
              if (v25) {
                CFRelease(v25);
              }
              CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, theArray);
              CFDictionarySetValue(v42, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
              std::string::size_type v26 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 68289283;
                int v47 = 0;
                __int16 v48 = 2082;
                CFMutableDictionaryRef v49 = "";
                __int16 v50 = 2113;
                *(void *)CFMutableDictionaryRef v51 = v42;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert\", \"rootDict\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              LOBYTE(valuePtr) = 0;
              uint64_t v27 = _CTServerConnectionSendAppleSafetyAlert();
              int v28 = valuePtr;
              uint64_t v29 = SALogObjectGeneral;
              BOOL v30 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
              if (v28)
              {
                if (v30)
                {
                  *(_DWORD *)uint64_t buf = 68289026;
                  int v47 = 0;
                  __int16 v48 = 2082;
                  CFMutableDictionaryRef v49 = "";
                  int v31 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert sent successfully \"}";
                  CFStringRef v32 = v29;
                  uint32_t v33 = 18;
                  goto LABEL_58;
                }
              }
              else if (v30)
              {
                *(_DWORD *)uint64_t buf = 68290051;
                __int16 v48 = 2082;
                int v47 = 0;
                CFMutableDictionaryRef v49 = "";
                __int16 v50 = 1026;
                *(_DWORD *)CFMutableDictionaryRef v51 = v27;
                *(_WORD *)&v51[4] = 1026;
                *(_DWORD *)&v51[6] = HIDWORD(v27);
                __int16 v52 = 2113;
                uint64_t v53 = v42;
                __int16 v54 = 2113;
                long long v55 = theDict;
                int v31 = "{\"msg%{public}.0s\":\"#ctsa,Igneous,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{p"
                      "ublic}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
                CFStringRef v32 = v29;
                uint32_t v33 = 50;
LABEL_58:
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
              }
              return 1;
            }
          }
          uint64_t v34 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
            return 0;
          }
          *(_DWORD *)uint64_t buf = 68289026;
          int v47 = 0;
          __int16 v48 = 2082;
          CFMutableDictionaryRef v49 = "";
          BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,item2 invalid\"}";
        }
        else
        {
          uint64_t v34 = SALogObjectGeneral;
          BOOL v40 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
          uint64_t result = 0;
          if (!v40) {
            return result;
          }
          *(_DWORD *)uint64_t buf = 68289026;
          int v47 = 0;
          __int16 v48 = 2082;
          CFMutableDictionaryRef v49 = "";
          BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,infoDict invalid\"}";
        }
      }
      else
      {
        uint64_t v34 = SALogObjectGeneral;
        BOOL v39 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0;
        if (!v39) {
          return result;
        }
        *(_DWORD *)uint64_t buf = 68289026;
        int v47 = 0;
        __int16 v48 = 2082;
        CFMutableDictionaryRef v49 = "";
        BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,infoDictMain invalid\"}";
      }
    }
    else
    {
      uint64_t v34 = SALogObjectGeneral;
      BOOL v38 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v38) {
        return result;
      }
      *(_DWORD *)uint64_t buf = 68289026;
      int v47 = 0;
      __int16 v48 = 2082;
      CFMutableDictionaryRef v49 = "";
      BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,rootDict invalid\"}";
    }
  }
  else
  {
LABEL_39:
    uint64_t v34 = SALogObjectGeneral;
    BOOL v35 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v35) {
      return result;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v47 = 0;
    __int16 v48 = 2082;
    CFMutableDictionaryRef v49 = "";
    BOOL v37 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert invalid data\"}";
  }
LABEL_41:
  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v37, buf, 0x12u);
  return 0;
}

void sub_1000A7540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A755C(uint64_t a1, uint64_t *a2)
{
  id v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v3 = *a2;
  uint64_t v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000272B8(&v3);
  if (v4) {
    sub_100028F6C(v4);
  }
}

void sub_1000A75AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100028F6C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A75C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendPdu\"}", (uint8_t *)v7, 0x12u);
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v4 = (const char *)a2;
  }
  else {
    uint64_t v4 = *(const char **)a2;
  }
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, v4, 0x8000100u);
  if (v5)
  {
    CFStringRef v6 = v5;
    _CTServerConnectionInjectCellBroadcastMessageWithWac();
    CFRelease(v6);
  }
}

void sub_1000A76D0(SACoreTelephony *a1, int a2)
{
  uint64_t v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    __int16 v9 = 1026;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCompanionNearby\", \"Companion\":%{public}d}", (uint8_t *)v6, 0x18u);
  }
  *((unsigned char *)a1 + 192) = a2;
  int EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState();
  SACoreTelephony::onEnhanceDeliveryStateChange(a1, EnhancedDeliveryState);
}

void sub_1000A77C0(double *a1)
{
  id v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onLocationChanged\"}", (uint8_t *)&v8, 0x12u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = a1[1];
  double v5 = Current - v4;
  CFStringRef v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    BOOL v13 = v5 < 3600.0;
    __int16 v14 = 2050;
    double v15 = Current;
    __int16 v16 = 2050;
    double v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onLocationChanged\", \"isEDRecentlyUpdated\":%{public}d, \"curTime\":\"%{public}0.3f\", \"fLastEDUpdateTime_s\":\"%{public}0.3f\"}", (uint8_t *)&v8, 0x2Cu);
  }
  if (v5 >= 3600.0)
  {
    int EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState();
    SACoreTelephony::onEnhanceDeliveryStateChange((SACoreTelephony *)a1, EnhancedDeliveryState);
  }
}

void sub_1000A7958(uint64_t a1)
{
  sub_1000A7990(a1);

  operator delete();
}

void *sub_1000A7990(uint64_t a1)
{
  *(void *)a1 = off_1000FB0E0;

  sub_1000A79F4((SACoreTelephonyClientHelper **)(a1 + 184), 0);

  return sub_1000A1D84((void *)a1);
}

SACoreTelephonyClientHelper *sub_1000A79F4(SACoreTelephonyClientHelper **a1, SACoreTelephonyClientHelper *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    SACoreTelephonyClientHelper::~SACoreTelephonyClientHelper(result);
    operator delete();
  }
  return result;
}

void SAMobileAssetProd::SAMobileAssetProd(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  sub_10008D36C((uint64_t)v8, a3);
  *a1 = off_1000FB238;
  sub_10007FDF0(v8);
  *a1 = off_1000FB170;
  id v5 = v6;
  a1[1] = v5;
  sub_10008D36C((uint64_t)(a1 + 2), a3);
  SAMobileAssetProdHelper::SAMobileAssetProdHelper((uint64_t)(a1 + 6), v5);
  sub_10000DD48(&__p, "SaMaSm");
  operator new();
}

void sub_1000A822C(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    __cxa_rethrow();
  }
  JUMPOUT(0x1000A8324);
}

void sub_1000A8244()
{
}

void sub_1000A8250(void *a1, int a2)
{
  if (a2) {
    sub_100004CA4(a1);
  }
  JUMPOUT(0x1000A8324);
}

void sub_1000A8260()
{
}

void sub_1000A8268()
{
}

void sub_1000A8270()
{
}

void sub_1000A8278()
{
}

void sub_1000A8280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  sub_1000A9EB8(v19);
  sub_1000A9E0C(v18);
  sub_10007FDF0(v17);

  _Unwind_Resume(a1);
}

uint64_t **sub_1000A832C(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  int v16 = a2;
  double v4 = SALogObjectGeneral;
  if (!(a4 & 1 | (unint64_t)a3))
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      char v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      double v4 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v18 = 0;
      __int16 v19 = 2082;
      char v20 = "";
      __int16 v21 = 2081;
      char v22 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      __int16 v23 = 2081;
      *(void *)uint64_t v24 = "setStateHandler";
      *(_WORD *)&v24[8] = 1026;
      *(_DWORD *)&v24[10] = 93;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("setStateHandler", "SAStateMachine.h", 93, "false && \"Assertion failed\"");
  }
  int v9 = (id)SALogObjectGeneral;
  os_log_type_t v10 = *(unsigned char *)(a1 + 120);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0) {
      id v11 = *(const char **)v11;
    }
    sub_10000DD48(__p, off_1000FB338[a2]);
    if (v15 >= 0) {
      __int16 v12 = __p;
    }
    else {
      __int16 v12 = (void **)__p[0];
    }
    *(_DWORD *)uint64_t buf = 68289794;
    int v18 = 0;
    __int16 v19 = 2082;
    char v20 = "";
    __int16 v21 = 2082;
    char v22 = v11;
    __int16 v23 = 1026;
    *(_DWORD *)uint64_t v24 = a2;
    *(_WORD *)&v24[4] = 2082;
    *(void *)&v24[6] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "{\"msg%{public}.0s\":\"StateMachine,SetState\", \"name\":%{public, location:escape_only}s, \"stateInt\":%{public}d, \"stateStr\":%{public, location:escape_only}s}", buf, 0x2Cu);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }

  uint64_t result = sub_1000AA2AC((uint64_t **)(a1 + 8), a2, &v16);
  result[5] = a3;
  result[6] = a4;
  return result;
}

void sub_1000A85A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000A85C0(uint64_t a1, int a2)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      void v14[2] = sub_1000A8F30;
      v14[3] = &unk_1000FB1C0;
      void v14[4] = a1;
      __int16 v23 = 0;
      v22[0] = off_1000FAF38;
      v22[1] = objc_retainBlock(v14);
      __int16 v23 = v22;
      SAMobileAssetProdHelper::query(a1 + 48, (uint64_t)v22);
      sub_10009FEFC(v22);
      return 0;
    case 2:
      if (*(unsigned char *)(a1 + 216)
        && ((v4 = *(void *)(a1 + 208), (id v5 = *(void **)(a1 + 224)) != 0)
          ? (BOOL v6 = (v4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
          : (BOOL v6 = 0),
            v6))
      {
        __int16 v12 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t buf = 68289282;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 1026;
          int v21 = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,InitialQuerySucceeded\", \"result\":%{public}d}", (uint8_t *)&buf, 0x18u);
          id v5 = *(void **)(a1 + 224);
        }
        BOOL v13 = SAMobileAssetProdHelper::getHighestVersion(a1 + 48, v5);
        sub_10008D36C((uint64_t)v16, a1 + 16);
        SAMobileAssetProdHelper::readAsset(a1 + 48, v13, (uint64_t)v16);
        sub_10007FDF0(v16);

        return 1;
      }
      else
      {
        __int16 v7 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 208);
          uint64_t buf = 68289282;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 1026;
          int v21 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,InitialQueryFailed\", \"result\":%{public}d}", (uint8_t *)&buf, 0x18u);
        }
        sub_10008D36C((uint64_t)v15, a1 + 16);
        SAMobileAssetProdHelper::readAsset(a1 + 48, 0, (uint64_t)v15);
        sub_10007FDF0(v15);
        return 2;
      }
    case 3:
      return 2;
    case 4:
      int v9 = SALogObjectGeneral;
      BOOL v10 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v10) {
        return result;
      }
      uint64_t buf = 68289026;
      __int16 v18 = 2082;
      __int16 v19 = "";
      goto LABEL_16;
    case 5:
      int v9 = SALogObjectGeneral;
      BOOL v11 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v11) {
        return result;
      }
      uint64_t buf = 68289026;
      __int16 v18 = 2082;
      __int16 v19 = "";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,#warning,spuriousMessage\"}", (uint8_t *)&buf, 0x12u);
      return 0;
    default:
      return result;
  }
}

void sub_1000A8934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_10007FDF0((uint64_t *)va);

  _Unwind_Resume(a1);
}

uint64_t sub_1000A8994(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 2:
    case 4:
      id v2 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      goto LABEL_6;
    case 3:
      return 2;
    case 5:
      id v2 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:
        v4[0] = 68289026;
        v4[1] = 0;
        __int16 v5 = 2082;
        BOOL v6 = "";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,#warning,spuriousMessage\"}", (uint8_t *)v4, 0x12u);
      }
      return 1;
    default:
      return 1;
  }
}

uint64_t sub_1000A8AE4(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 5:
      return 1;
    case 4:
      sub_10009DA10(a1 + 16, *(void **)(a1 + 232));
      return 1;
    case 0:
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      _DWORD v4[2] = sub_1000A8FD4;
      v4[3] = &unk_1000FB1E0;
      BOOL v6 = 0;
      void v4[4] = a1;
      v5[0] = off_1000FB2C8;
      v5[1] = objc_retainBlock(v4);
      BOOL v6 = v5;
      SAMobileAssetProdHelper::download(a1 + 48, (uint64_t)v5);
      sub_10007FDF0(v5);
      break;
  }
  return 2;
}

void sub_1000A8BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_10007FDF0((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000A8C18(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v8 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v15) = 2082;
    *(void *)((char *)&v15 + 2) = "";
    int v9 = "{\"msg%{public}.0s\":\"#asset,activity is nil\"}";
LABEL_13:
    BOOL v10 = buf;
    goto LABEL_14;
  }
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  BOOL v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v15) = 2082;
    *(void *)((char *)&v15 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,process_xpcActivity\"}", buf, 0x12u);
  }
  if (!state) {
    goto LABEL_15;
  }
  if (state != 2)
  {
    uint64_t v8 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v15) = 2082;
    *(void *)((char *)&v15 + 2) = "";
    int v9 = "{\"msg%{public}.0s\":\"#asset,unexpectedXpcActivity\"}";
    goto LABEL_13;
  }
  __int16 v7 = *(NSObject **)(v2 + 8);
  *(void *)uint64_t buf = _NSConcreteStackBlock;
  *(void *)&long long v15 = 3221225472;
  *((void *)&v15 + 1) = sub_1000A8E94;
  int v16 = &unk_1000F5EA8;
  uint64_t v17 = v2;
  dispatch_async(v7, buf);
  if (!xpc_activity_set_state(v4, 5))
  {
    uint64_t v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289026;
      v11[1] = 0;
      __int16 v12 = 2082;
      BOOL v13 = "";
      int v9 = "{\"msg%{public}.0s\":\"#asset,failedToSetState\"}";
      BOOL v10 = (uint8_t *)v11;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 0x12u);
    }
  }
LABEL_15:
}

void sub_1000A8E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000A8E84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_1000A8E94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_1000A9074(v1 + 80, 3);
}

void sub_1000A8F20(uint64_t a1)
{
}

void sub_1000A8F30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  objc_storeStrong((id *)(v5 + 224), a3);
  *(void *)(v5 + 208) = a2;
  *(unsigned char *)(v5 + 216) = 1;
  sub_1000A9074(v5 + 80, 2);
  BOOL v6 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = 0;

  if (*(unsigned char *)(v5 + 216)) {
    *(unsigned char *)(v5 + 216) = 0;
  }
}

void sub_1000A8FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8FD4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  if (v5)
  {
    objc_storeStrong((id *)(v3 + 232), a2);
    sub_1000A9074(v3 + 80, 4);
    uint64_t v4 = *(void **)(v3 + 232);
    *(void *)(v3 + 232) = 0;
  }
  else
  {
    sub_1000A9074(v3 + 80, 5);
  }
}

void sub_1000A9060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A9074(uint64_t a1, uint64_t a2)
{
  ++*(_DWORD *)(a1 + 88);
  uint64_t v2 = *(int *)(a1 + 4);
  int v65 = *(_DWORD *)(a1 + 4);
  if (!*(void *)(a1 + 32))
  {
    long long v56 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      long long v56 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2081;
      CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      __int16 v72 = 2081;
      CFMutableDictionaryRef v73 = "handleEvent";
      __int16 v74 = 1026;
      LODWORD(v75) = 115;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 115, "false && \"Assertion failed\"");
  }
  uint64_t v4 = SALogObjectGeneral;
  if (!*(unsigned char *)(a1 + 48))
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      uint64_t v4 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2081;
      CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      __int16 v72 = 2081;
      CFMutableDictionaryRef v73 = "handleEvent";
      __int16 v74 = 1026;
      LODWORD(v75) = 116;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 116, "false && \"Assertion failed\"");
  }
  BOOL v6 = (id)SALogObjectGeneral;
  os_log_type_t v7 = *(unsigned char *)(a1 + 120);
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0) {
      uint64_t v8 = *(const char **)v8;
    }
    sub_10000DD48(v63, off_1000FB338[*(int *)(a1 + 4)]);
    int v9 = v64;
    BOOL v10 = (void **)v63[0];
    sub_1000A9DAC(__p, a2);
    BOOL v11 = v63;
    if (v9 < 0) {
      BOOL v11 = v10;
    }
    if (v62 >= 0) {
      __int16 v12 = __p;
    }
    else {
      __int16 v12 = (void **)__p[0];
    }
    *(_DWORD *)uint64_t buf = 68289794;
    int v67 = 0;
    __int16 v68 = 2082;
    __int16 v69 = "";
    __int16 v70 = 2082;
    CFMutableDictionaryRef v71 = v8;
    __int16 v72 = 2082;
    CFMutableDictionaryRef v73 = (const char *)v11;
    __int16 v74 = 2082;
    __int16 v75 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "{\"msg%{public}.0s\":\"StateMachineHandleEvent\", \"name\":%{public, location:escape_only}s, \"current_state\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
    if (v62 < 0) {
      operator delete(__p[0]);
    }
    if (v64 < 0) {
      operator delete(v63[0]);
    }
  }

  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    goto LABEL_25;
  }
  __int16 v14 = (uint64_t **)(a1 + 8);
  int v15 = *(_DWORD *)(a1 + 4);
  uint64_t v16 = a1 + 16;
  do
  {
    int v17 = *(_DWORD *)(v13 + 32);
    BOOL v18 = v17 < v15;
    if (v17 >= v15) {
      __int16 v19 = (uint64_t *)v13;
    }
    else {
      __int16 v19 = (uint64_t *)(v13 + 8);
    }
    if (!v18) {
      uint64_t v16 = v13;
    }
    uint64_t v13 = *v19;
  }
  while (*v19);
  if (v16 == a1 + 16 || v15 < *(_DWORD *)(v16 + 32))
  {
LABEL_25:
    __int16 v20 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      __int16 v20 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2081;
      CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      __int16 v72 = 2081;
      CFMutableDictionaryRef v73 = "handleEvent";
      __int16 v74 = 1026;
      LODWORD(v75) = 123;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 123, "false && \"Assertion failed\"");
  }
  int v21 = *(uint64_t (**)(void *, uint64_t))(v16 + 40);
  uint64_t v22 = *(void *)(v16 + 48);
  __int16 v23 = (void *)(*(void *)(a1 + 32) + (v22 >> 1));
  if (v22) {
    int v21 = *(uint64_t (**)(void *, uint64_t))(*v23 + v21);
  }
  int v24 = v21(v23, a2);
  int v25 = v24;
  int v60 = v24;
  if (a2 <= 1 && v24 != v2)
  {
    long long v57 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      long long v57 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2081;
      CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      __int16 v72 = 2081;
      CFMutableDictionaryRef v73 = "handleEvent";
      __int16 v74 = 1026;
      LODWORD(v75) = 128;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 128, "false && \"Assertion failed\"");
  }
  std::string::size_type v26 = SALogObjectGeneral;
  if (*(_DWORD *)(a1 + 88) >= 2u && os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0) {
      uint64_t v27 = *(const char **)v27;
    }
    *(_DWORD *)uint64_t buf = 68289282;
    int v67 = 0;
    __int16 v68 = 2082;
    __int16 v69 = "";
    __int16 v70 = 2082;
    CFMutableDictionaryRef v71 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"StateMachineNestedEvent\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    std::string::size_type v26 = SALogObjectGeneral;
  }
  int v28 = v26;
  os_log_type_t v29 = *(unsigned char *)(a1 + 120);
  if (os_log_type_enabled(v28, v29))
  {
    BOOL v30 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0) {
      BOOL v30 = *(const char **)v30;
    }
    sub_10000DD48(v63, off_1000FB338[v25]);
    if (v64 >= 0) {
      int v31 = v63;
    }
    else {
      int v31 = (void **)v63[0];
    }
    *(_DWORD *)uint64_t buf = 68289538;
    int v67 = 0;
    __int16 v68 = 2082;
    __int16 v69 = "";
    __int16 v70 = 2082;
    CFMutableDictionaryRef v71 = v30;
    __int16 v72 = 2082;
    CFMutableDictionaryRef v73 = (const char *)v31;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "{\"msg%{public}.0s\":\"StateMachineOldState\", \"name\":%{public, location:escape_only}s, \"newState\":%{public, location:escape_only}s}", buf, 0x26u);
    if (v64 < 0) {
      operator delete(v63[0]);
    }
  }

  if (v25 != v2)
  {
    CFStringRef v32 = (id)SALogObjectGeneral;
    os_log_type_t v33 = *(unsigned char *)(a1 + 120);
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (const char *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0) {
        uint64_t v34 = *(const char **)v34;
      }
      sub_10000DD48(v63, off_1000FB338[v2]);
      int v35 = v64;
      CFStringRef v36 = (void **)v63[0];
      sub_10000DD48(__p, "Exit");
      BOOL v37 = v63;
      if (v35 < 0) {
        BOOL v37 = v36;
      }
      if (v62 >= 0) {
        BOOL v38 = __p;
      }
      else {
        BOOL v38 = (void **)__p[0];
      }
      *(_DWORD *)uint64_t buf = 68289794;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2082;
      CFMutableDictionaryRef v71 = v34;
      __int16 v72 = 2082;
      CFMutableDictionaryRef v73 = (const char *)v37;
      __int16 v74 = 2082;
      __int16 v75 = v38;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "{\"msg%{public}.0s\":\"StateMachineTransition\", \"name\":%{public, location:escape_only}s, \"oldState\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
      if (v62 < 0) {
        operator delete(__p[0]);
      }
      if (v64 < 0) {
        operator delete(v63[0]);
      }
    }

    uint64_t v39 = *(void *)(a1 + 32);
    BOOL v40 = sub_1000AA2AC(v14, v2, &v65);
    BOOL v41 = v40[5];
    uint64_t v42 = (uint64_t)v40[6];
    size_t v43 = (void *)(v39 + (v42 >> 1));
    if (v42) {
      BOOL v41 = *(uint64_t **)(*v43 + v41);
    }
    if (((unsigned int (*)(void *, uint64_t))v41)(v43, 1) != v2)
    {
      BOOL v58 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v67 = 0;
        __int16 v68 = 2082;
        __int16 v69 = "";
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
        BOOL v58 = SALogObjectGeneral;
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v67 = 0;
        __int16 v68 = 2082;
        __int16 v69 = "";
        __int16 v70 = 2081;
        CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
        __int16 v72 = 2081;
        CFMutableDictionaryRef v73 = "handleEvent";
        __int16 v74 = 1026;
        LODWORD(v75) = 146;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
      }
      __assert_rtn("handleEvent", "SAStateMachine.h", 146, "false && \"Assertion failed\"");
    }
    *(_DWORD *)(a1 + 4) = v25;
    uint32_t v44 = (id)SALogObjectGeneral;
    os_log_type_t v45 = *(unsigned char *)(a1 + 120);
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (const char *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0) {
        uint64_t v46 = *(const char **)v46;
      }
      sub_10000DD48(v63, off_1000FB338[v25]);
      int v47 = v64;
      __int16 v48 = (void **)v63[0];
      sub_10000DD48(__p, "Enter");
      CFMutableDictionaryRef v49 = v63;
      if (v47 < 0) {
        CFMutableDictionaryRef v49 = v48;
      }
      if (v62 >= 0) {
        __int16 v50 = __p;
      }
      else {
        __int16 v50 = (void **)__p[0];
      }
      *(_DWORD *)uint64_t buf = 68289794;
      int v67 = 0;
      __int16 v68 = 2082;
      __int16 v69 = "";
      __int16 v70 = 2082;
      CFMutableDictionaryRef v71 = v46;
      __int16 v72 = 2082;
      CFMutableDictionaryRef v73 = (const char *)v49;
      __int16 v74 = 2082;
      __int16 v75 = v50;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "{\"msg%{public}.0s\":\"StateMachineTransition\", \"name\":%{public, location:escape_only}s, \"newState\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
      if (v62 < 0) {
        operator delete(__p[0]);
      }
      if (v64 < 0) {
        operator delete(v63[0]);
      }
    }

    uint64_t v51 = *(void *)(a1 + 32);
    __int16 v52 = sub_1000AA2AC(v14, v25, &v60);
    uint64_t v53 = v52[5];
    uint64_t v54 = (uint64_t)v52[6];
    long long v55 = (void *)(v51 + (v54 >> 1));
    if (v54) {
      uint64_t v53 = *(uint64_t **)(*v55 + v53);
    }
    if (((unsigned int (*)(void *, void))v53)(v55, 0) != v25)
    {
      long long v59 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v67 = 0;
        __int16 v68 = 2082;
        __int16 v69 = "";
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
        long long v59 = SALogObjectGeneral;
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v67 = 0;
        __int16 v68 = 2082;
        __int16 v69 = "";
        __int16 v70 = 2081;
        CFMutableDictionaryRef v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
        __int16 v72 = 2081;
        CFMutableDictionaryRef v73 = "handleEvent";
        __int16 v74 = 1026;
        LODWORD(v75) = 153;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
      }
      __assert_rtn("handleEvent", "SAStateMachine.h", 153, "false && \"Assertion failed\"");
    }
  }
  --*(_DWORD *)(a1 + 88);
}

void sub_1000A9D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1000A9DA0(uint64_t a1)
{
}

void *sub_1000A9DAC(void *a1, int a2)
{
  return sub_10000DD48(a1, off_1000FB350[a2]);
}

void sub_1000A9DC0(uint64_t a1)
{
  sub_1000A9E48(a1);

  operator delete();
}

uint64_t sub_1000A9DF8(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 72);
  *a3 = *(_DWORD *)(result + 76);
  return result;
}

id *sub_1000A9E0C(id *a1)
{
  return a1;
}

uint64_t sub_1000A9E48(uint64_t a1)
{
  *(void *)a1 = off_1000FB170;

  sub_1000A9EB8(a1 + 80);
  sub_1000A9E0C((id *)(a1 + 48));
  sub_10007FDF0((void *)(a1 + 16));

  return a1;
}

uint64_t sub_1000A9EB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v3 = (void *)(a1 + 64);
  if (v2 != (void *)(a1 + 64))
  {
    uint64_t v4 = (uint64_t *)(a1 + 96);
    do
    {
      int v5 = *((_DWORD *)v2 + 8);
      uint64_t v6 = *v3;
      if (!*v3) {
        goto LABEL_20;
      }
      os_log_type_t v7 = v3;
      do
      {
        int v8 = *(_DWORD *)(v6 + 32);
        BOOL v9 = v8 < v5;
        if (v8 >= v5) {
          BOOL v10 = (uint64_t *)v6;
        }
        else {
          BOOL v10 = (uint64_t *)(v6 + 8);
        }
        if (!v9) {
          os_log_type_t v7 = (void *)v6;
        }
        uint64_t v6 = *v10;
      }
      while (*v10);
      if (v7 != v3 && *((_DWORD *)v7 + 8) <= v5 && (uint64_t v11 = v7[5]) != 0)
      {
        (*(void (**)(uint64_t))(*(void *)v11 + 40))(v11);
        __int16 v12 = (id)SALogObjectGeneral;
        os_log_type_t v13 = *(unsigned char *)(a1 + 120);
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = a1 + 96;
          if (*(char *)(a1 + 119) < 0) {
            uint64_t v14 = *v4;
          }
          sub_1000A9DAC(__p, v5);
          int v15 = __p;
          if (v28 < 0) {
            int v15 = (void **)__p[0];
          }
          *(_DWORD *)uint64_t buf = 68289538;
          int v30 = 0;
          __int16 v31 = 2082;
          CFStringRef v32 = "";
          __int16 v33 = 2082;
          uint64_t v34 = v14;
          __int16 v35 = 2082;
          CFStringRef v36 = v15;
          uint64_t v16 = v12;
          os_log_type_t v17 = v13;
          BOOL v18 = "{\"msg%{public}.0s\":\"StateMachine,CancelTimeout\", \"name\":%{public, location:escape_only}s, \"event\""
                ":%{public, location:escape_only}s}";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v16, v17, v18, buf, 0x26u);
          if (v28 < 0) {
            operator delete(__p[0]);
          }
        }
      }
      else
      {
LABEL_20:
        __int16 v12 = (id)SALogObjectGeneral;
        os_log_type_t v19 = *(unsigned char *)(a1 + 120);
        if (os_log_type_enabled(v12, v19))
        {
          uint64_t v20 = a1 + 96;
          if (*(char *)(a1 + 119) < 0) {
            uint64_t v20 = *v4;
          }
          sub_1000A9DAC(__p, v5);
          int v21 = __p;
          if (v28 < 0) {
            int v21 = (void **)__p[0];
          }
          *(_DWORD *)uint64_t buf = 68289538;
          int v30 = 0;
          __int16 v31 = 2082;
          CFStringRef v32 = "";
          __int16 v33 = 2082;
          uint64_t v34 = v20;
          __int16 v35 = 2082;
          CFStringRef v36 = v21;
          uint64_t v16 = v12;
          os_log_type_t v17 = v19;
          BOOL v18 = "{\"msg%{public}.0s\":\"StateMachine,CancelTimeout,TimerNotRunning\", \"name\":%{public, location:escape_"
                "only}s, \"event\":%{public, location:escape_only}s}";
          goto LABEL_26;
        }
      }

      uint64_t v22 = (void *)v2[1];
      if (v22)
      {
        do
        {
          __int16 v23 = v22;
          uint64_t v22 = (void *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          __int16 v23 = (void *)v2[2];
          BOOL v24 = *v23 == (void)v2;
          uint64_t v2 = v23;
        }
        while (!v24);
      }
      uint64_t v2 = v23;
    }
    while (v23 != v3);
  }
  if (*(char *)(a1 + 119) < 0) {
    operator delete(*(void **)(a1 + 96));
  }

  sub_1000AA1AC(*(void **)(a1 + 64));
  int v25 = *(std::__shared_weak_count **)(a1 + 40);
  if (v25) {
    sub_100028F6C(v25);
  }
  sub_10005E048(*(void **)(a1 + 16));
  return a1;
}

void sub_1000AA17C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {

    sub_100004CA4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AA1AC(void *a1)
{
  if (a1)
  {
    sub_1000AA1AC(*a1);
    sub_1000AA1AC(a1[1]);
    uint64_t v2 = a1[5];
    a1[5] = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    operator delete(a1);
  }
}

void sub_1000AA22C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1000AA268(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t **sub_1000AA2AC(uint64_t **a1, int a2, _DWORD *a3)
{
  uint64_t v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        os_log_type_t v7 = (uint64_t **)v5;
        int v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2) {
          break;
        }
        int v5 = *v7;
        uint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      int v5 = v7[1];
      if (!v5)
      {
        uint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    os_log_type_t v7 = a1 + 1;
LABEL_9:
    BOOL v9 = (uint64_t *)v7;
    os_log_type_t v7 = (uint64_t **)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = *a3;
    void v7[5] = 0;
    v7[6] = 0;
    *os_log_type_t v7 = 0;
    v7[1] = 0;
    _DWORD v7[2] = v9;
    NSObject *v6 = (uint64_t *)v7;
    BOOL v10 = (uint64_t *)**a1;
    uint64_t v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      uint64_t v11 = *v6;
    }
    sub_100015E3C(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

uint64_t sub_1000AA37C(uint64_t a1)
{
  return a1;
}

void sub_1000AA3A8(uint64_t a1)
{
  operator delete();
}

uint64_t sub_1000AA3F4()
{
  return 0;
}

id sub_1000AA3FC(uint64_t a1, void *a2)
{
  *a2 = off_1000FB2C8;
  id result = objc_retainBlock(*(id *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t sub_1000AA444(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return _objc_release_x1();
}

uint64_t sub_1000AA454(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

uint64_t sub_1000AA468(uint64_t a1, uint64_t a2)
{
  if (sub_10000FA0C(a2, (uint64_t)&off_1000FB328)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_1000AA4A8()
{
  return &off_1000FB328;
}

void sub_1000AA568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AA7E0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLocationAuthorized];
}

id sub_1000AA86C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLocationAuthorized];
}

void sub_1000AADC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AAF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AB0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SACoreLocationProd::SACoreLocationProd(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  sub_100065E64((uint64_t)v14, a3);
  sub_10004DB88((uint64_t)v13, a4);
  *(void *)a1 = off_1000F86B8;
  sub_100021E70(v13);
  sub_100065DE0(v14);
  *(void *)a1 = off_1000FB3B8;
  id v8 = v7;
  *(void *)(a1 + 8) = v8;
  sub_100065E64(a1 + 16, a3);
  sub_10004DB88(a1 + 48, a4);
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  int64x2_t v9 = vdupq_n_s64(0xC08F400000000000);
  *(int64x2_t *)(a1 + 96) = v9;
  *(int64x2_t *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = xmmword_1000B6060;
  BOOL v10 = *(NSObject **)(a1 + 8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_1000AB334;
  void v12[3] = &unk_1000F5EA8;
  void v12[4] = a1;
  dispatch_async(v10, v12);

  return a1;
}

void sub_1000AB2EC(_Unwind_Exception *a1)
{
  sub_100065DE0(v3);

  _Unwind_Resume(a1);
}

void sub_1000AB334(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _DWORD v3[2] = sub_1000AB3BC;
  v3[3] = &unk_1000F5EA8;
  void v3[4] = v1;
  sub_1000AB3BC((uint64_t)v3);
}

void sub_1000AB3BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [[SACoreLocationClient alloc] initWithQueue:*(void *)(v1 + 8)];
  uint64_t v3 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = v2;

  [*(id *)(v1 + 80) setClProxy:v1];
  uint64_t v4 = *(void **)(v1 + 8);
  sub_10000DD48(&__p, "singleShotFix");
  SATimer::create(v4);
}

void sub_1000AB480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AB49C(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v6 = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,scheduleSingleShotLocationRequest\"}", buf, 0x12u);
  }
  uint64_t v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB908;
  block[3] = &unk_1000F5EA8;
  void block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t sub_1000AB5A8(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    int64x2_t v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,startMonitoring\"}", buf, 0x12u);
  }
  uint64_t v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB6B8;
  block[3] = &unk_1000F5EA8;
  void block[4] = a1;
  dispatch_async(v3, block);
  return 1;
}

void sub_1000AB6B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v1 + 80);
  if (v3) {
    [v3 startMonitoring];
  }
}

id sub_1000AB744(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return [result startMonitoring];
  }
  return result;
}

uint64_t sub_1000AB758(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    int64x2_t v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,,stopMonitoring\"}", buf, 0x12u);
  }
  uint64_t v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB868;
  block[3] = &unk_1000F5EA8;
  void block[4] = a1;
  dispatch_async(v3, block);
  return 1;
}

void sub_1000AB868(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v1 + 80);
  if (v3) {
    [v3 stopMonitoring];
  }
}

id sub_1000AB8F4(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return [result stopMonitoring];
  }
  return result;
}

void sub_1000AB908(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _DWORD v3[2] = sub_1000AB990;
  v3[3] = &unk_1000F5EA8;
  void v3[4] = v1;
  sub_1000AB990((uint64_t)v3);
}

void *sub_1000AB990(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id result = *(void **)(v1 + 88);
  if (result)
  {
    (*(void (**)(void *))(*result + 40))(result);
    uint64_t v3 = *(void *)(v1 + 88);
    double v4 = *((double *)sub_10003E368() + 2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_1000ABAFC;
    void v5[3] = &unk_1000F5EA8;
    void v5[4] = v1;
    int v7 = 0;
    v6[0] = off_1000F4E78;
    v6[1] = objc_retainBlock(v5);
    int v7 = v6;
    (*(void (**)(uint64_t, void *, double))(*(void *)v3 + 16))(v3, v6, v4);
    return sub_10000F6D4(v6);
  }
  return result;
}

void sub_1000ABAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_10000F6D4((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000ABAFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 80);
  if (v2) {
    [v2 requestSingleShotLocation];
  }

  return sub_1000AB49C(v1);
}

void sub_1000ABB3C(uint64_t a1)
{
  uint64_t v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v6 = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,singleShotLocationRequest\"}", buf, 0x12u);
  }
  uint64_t v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ABC48;
  block[3] = &unk_1000F5EA8;
  void block[4] = a1;
  dispatch_async(v3, block);
}

void sub_1000ABC48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v1 + 80);
  if (v3) {
    [v3 requestSingleShotLocation];
  }
}

id sub_1000ABCD4(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return [result requestSingleShotLocation];
  }
  return result;
}

void sub_1000ABCE8(uint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14 = (long long *)(a1 + 96);
  double v15 = *(double *)(a1 + 96);
  if (v15 == -1000.0
    || (double v16 = *(double *)(a1 + 104), v16 == -1000.0)
    || v15 == 0.0 && v16 == 0.0
    || (v16 == a4 ? (BOOL v17 = v15 == a3) : (BOOL v17 = 0),
        !v17 || *(double *)(a1 + 120) <= 0.0 || a7 - *(double *)(a1 + 136) >= 10.0))
  {
    os_log_type_t v19 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 68290563;
      int v28 = 0;
      __int16 v29 = 2082;
      int v30 = "";
      __int16 v31 = 2049;
      double v32 = a3;
      __int16 v33 = 2049;
      double v34 = a4;
      __int16 v35 = 2049;
      double v36 = a5;
      __int16 v37 = 2049;
      double v38 = a6;
      __int16 v39 = 1026;
      int v40 = a2;
      __int16 v41 = 2050;
      double v42 = a7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocation,usingLocation\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"alt\":\"%{private}f\", \"unc\":\"%{private}f\", \"isLastKnownLocation\":%{public}hhd, \"ts\":\"%{public}f\"}", (uint8_t *)&v27, 0x4Au);
    }
    if (*(void *)(a1 + 40)) {
      sub_100065D08(a1 + 16, a2, a3, a4, a5, a6, a7);
    }
    *(double *)(a1 + 96) = a3;
    *(double *)(a1 + 104) = a4;
    *(double *)(a1 + 112) = a5;
    *(double *)(a1 + 120) = a6;
    *(void *)(a1 + 128) = 0;
    *(double *)(a1 + 136) = a7;
    uint64_t v20 = sub_100003318();
    __int16 v21 = 0;
    long long v23 = v14[1];
    long long v22 = v14[2];
    *uint64_t v20 = *v14;
    v20[1] = v23;
    v20[2] = v22;
    double v24 = *(double *)v20;
    double v25 = *((double *)v20 + 1);
    BOOL v26 = *(double *)v20 == 0.0;
    if (v25 != 0.0) {
      BOOL v26 = 0;
    }
    if (v25 <= 180.0 && v25 >= -180.0 && v24 <= 90.0 && v24 >= -90.0 && !v26)
    {
      if (*((unsigned char *)v20 + 91)) {
        __int16 v21 = *((unsigned char *)v20 + 90) != 0;
      }
    }
    *((_WORD *)v20 + 44) = v21 | 0x100;
  }
  else
  {
    BOOL v18 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 68290563;
      int v28 = 0;
      __int16 v29 = 2082;
      int v30 = "";
      __int16 v31 = 2049;
      double v32 = a3;
      __int16 v33 = 2049;
      double v34 = a4;
      __int16 v35 = 2049;
      double v36 = a5;
      __int16 v37 = 2049;
      double v38 = a6;
      __int16 v39 = 1026;
      int v40 = a2;
      __int16 v41 = 2050;
      double v42 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocation,#warning,sameLocation\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"alt\":\"%{private}f\", \"unc\":\"%{private}f\", \"isLastKnownLocation\":%{public}hhd, \"ts\":\"%{public}f\"}", (uint8_t *)&v27, 0x4Au);
    }
  }
}

long long *sub_1000ABFDC(uint64_t a1, int a2)
{
  double v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289282;
    v12[1] = 0;
    __int16 v13 = 2082;
    uint64_t v14 = "";
    __int16 v15 = 1026;
    int v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocationAuthorized\", \"isAuthorized\":%{public}hhd}", (uint8_t *)v12, 0x18u);
  }
  if ((a2 & 1) == 0)
  {
    int64x2_t v5 = vdupq_n_s64(0xC08F400000000000);
    *(int64x2_t *)(a1 + 96) = v5;
    *(int64x2_t *)(a1 + 112) = v5;
    *(_OWORD *)(a1 + 128) = xmmword_1000B6060;
  }
  if (*(void *)(a1 + 72)) {
    sub_100045970(a1 + 48, a2);
  }
  id result = sub_100003318();
  *((_WORD *)result + 45) = a2 | 0x100;
  if (a2)
  {
    double v7 = *(double *)result;
    double v8 = *((double *)result + 1);
    __int16 v9 = *(double *)result != 0.0;
    if (v8 != 0.0) {
      __int16 v9 = 1;
    }
    if (v7 < -90.0) {
      __int16 v9 = 0;
    }
    if (v7 > 90.0) {
      __int16 v9 = 0;
    }
    if (v8 < -180.0) {
      __int16 v9 = 0;
    }
    if (v8 > 180.0) {
      __int16 v9 = 0;
    }
    *((_WORD *)result + 44) = v9 | 0x100;
  }
  else
  {
    if (*((unsigned char *)result + 89)) {
      *((unsigned char *)result + 89) = 0;
    }
    if (*((unsigned char *)result + 97)) {
      *((unsigned char *)result + 97) = 0;
    }
    int64x2_t v10 = vdupq_n_s64(0xC08F400000000000);
    *id result = (__int128)v10;
    result[1] = (__int128)v10;
    result[2] = xmmword_1000B6060;
    if (*((char *)result + 87) < 0)
    {
      *((void *)result + 9) = 0;
      uint64_t v11 = (unsigned char *)*((void *)result + 8);
    }
    else
    {
      uint64_t v11 = result + 4;
      *((unsigned char *)result + 87) = 0;
    }
    unsigned char *v11 = 0;
  }
  return result;
}

void sub_1000AC1A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v3 = *a2;
  double v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000272B8(&v3);
  if (v4) {
    sub_100028F6C(v4);
  }
}

void sub_1000AC1F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100028F6C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AC214(uint64_t a1)
{
  sub_1000AC24C(a1);

  operator delete();
}

uint64_t sub_1000AC24C(uint64_t a1)
{
  *(void *)a1 = off_1000FB3B8;
  uint64_t v2 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  sub_100021E70((void *)(a1 + 48));
  sub_100065DE0((void *)(a1 + 16));

  return a1;
}

uint64_t SACoreTelephonyTest::SACoreTelephonyTest(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  sub_10007C138((uint64_t)v16, a3);
  *(void *)a1 = off_1000FA870;
  *(void *)(a1 + 8) = 0;
  sub_10007C138(a1 + 16, (uint64_t)v16);
  sub_100027DF0(v20);
  sub_100021E70(v19);
  sub_100021E70(v18);
  sub_100027DF0(v17);
  sub_10007C324(v16);
  *(void *)a1 = off_1000FB420;
  *(unsigned char *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(unsigned char *)(a1 + 376) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_DWORD *)(a1 + 380) = 1;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(unsigned char *)(a1 + 496) = -1;
  *(void *)(a1 + 500) = 0;
  *(_WORD *)(a1 + 508) = -1022;
  *(_DWORD *)(a1 + 512) = 0;
  *(void *)(a1 + 520) = 0;
  int v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreTelephonyTest,init\"}", buf, 0x12u);
  }
  id v7 = v5;
  double v8 = sub_100017698();
  id v9 = v7;
  v11[0] = off_1000FB4B0;
  v11[1] = a1;
  _DWORD v11[2] = v9;
  v11[3] = v11;
  sub_10001797C((uint64_t)v8, 3, (uint64_t)v11);
  sub_10001802C(v11);

  return a1;
}

void sub_1000AC50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10001802C(&a9);

  sub_100032BBC(v11);
  sub_1000A1D84(v9);

  _Unwind_Resume(a1);
}

void *sub_1000AC560(void *a1)
{
  *a1 = off_1000FB420;
  sub_100032BBC((uint64_t)(a1 + 22));

  return sub_1000A1D84(a1);
}

void sub_1000AC5B4(void *a1)
{
  *a1 = off_1000FB420;
  sub_100032BBC((uint64_t)(a1 + 22));
  sub_1000A1D84(a1);

  operator delete();
}

uint64_t sub_1000AC61C()
{
  return 1;
}

void sub_1000AC624(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v3 = *a2;
  double v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000272B8(&v3);
  if (v4) {
    sub_100028F6C(v4);
  }
}

void sub_1000AC674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100028F6C(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000AC690()
{
  return 0;
}

uint64_t sub_1000AC698()
{
  return 0;
}

uint64_t sub_1000AC6A0()
{
  return 0;
}

uint64_t sub_1000AC6A8()
{
  return 0;
}

uint64_t sub_1000AC6B0()
{
  return 1;
}

uint64_t sub_1000AC6C4(uint64_t a1)
{
  return a1;
}

void sub_1000AC6F0(uint64_t a1)
{
  operator delete();
}

void *sub_1000AC73C(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  double v4 = *(void **)(a1 + 16);
  void *v2 = off_1000FB4B0;
  v2[1] = v3;
  _DWORD v2[2] = v4;
  return v2;
}

id sub_1000AC794(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  double v4 = *(void **)(a1 + 16);
  *a2 = off_1000FB4B0;
  a2[1] = v3;
  id result = v4;
  a2[2] = result;
  return result;
}

void sub_1000AC7DC(uint64_t a1)
{
}

void sub_1000AC7E4(id *a1)
{
  operator delete(a1);
}

void sub_1000AC820(uint64_t a1, id *a2)
{
  id v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 8);
  id v5 = *(NSObject **)(a1 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1000AC908;
  v7[3] = &unk_1000F6B88;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t sub_1000AC8BC(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_1000AC8FC()
{
}

void sub_1000AC908(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_1000AC9C4;
  v4[3] = &unk_1000F6B88;
  uint64_t v6 = v2;
  id v5 = *(id *)(a1 + 32);
  sub_1000AC9C4((uint64_t)v4);
}

void sub_1000AC9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000AC9C4(uint64_t a1)
{
  uint64_t v1 = *(SACoreTelephony **)(a1 + 40);
  xpc_object_t xdict = *(id *)(a1 + 32);
  if (xpc_dictionary_get_int64(xdict, "TestMessageType") == 3)
  {
    string = xpc_dictionary_get_string(xdict, "WeaText");
    SACoreTelephony::onWeaDisplayedNotification(v1, string);
  }
}

void sub_1000ACA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000ACA50()
{
  return 0;
}

uint64_t sub_1000ACA58()
{
  return 1;
}

uint64_t sub_1000ACA60()
{
  return 1;
}

uint64_t sub_1000ACA68()
{
  return 1;
}

uint64_t sub_1000ACA70()
{
  return 1;
}

uint64_t sub_1000ACA78()
{
  return 1;
}

uint64_t sub_1000ACA80()
{
  return 1;
}

uint64_t sub_1000ACA88()
{
  return 1;
}

uint64_t sub_1000ACA90()
{
  return 1;
}

uint64_t sub_1000ACA98()
{
  return 1;
}

void sub_1000ACAAC()
{
}

void *SAMobileAssetTest::SAMobileAssetTest(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)sub_10008D36C((uint64_t)v28, a3);
  *a1 = off_1000FB238;
  sub_10007FDF0(v6);
  *a1 = off_1000FB5C8;
  id v7 = v5;
  a1[1] = v7;
  sub_10008D36C((uint64_t)(a1 + 2), a3);
  id v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,init\"}", buf, 0x12u);
  }
  if (!a1[1])
  {
    __int16 v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,fDispatchQueue is invalid\"}", buf, 0x12u);
      __int16 v12 = SALogObjectGeneral;
    }
    int v13 = 21;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2081;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/mobileAsset/test/SAMobileAssetTest.mm";
      __int16 v24 = 2081;
      double v25 = "SAMobileAssetTest";
      __int16 v26 = 1026;
      int v27 = 21;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __int16 v14 = "false && \"#SAMobileAssetTest,fDispatchQueue is invalid\"";
LABEL_16:
    __assert_rtn("SAMobileAssetTest", "SAMobileAssetTest.mm", v13, v14);
  }
  if (!a1[5])
  {
    __int16 v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,fOnAssetReceived is invalid\"}", buf, 0x12u);
      __int16 v15 = SALogObjectGeneral;
    }
    int v13 = 22;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2081;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/mobileAsset/test/SAMobileAssetTest.mm";
      __int16 v24 = 2081;
      double v25 = "SAMobileAssetTest";
      __int16 v26 = 1026;
      int v27 = 22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __int16 v14 = "false && \"#SAMobileAssetTest,fOnAssetReceived is invalid\"";
    goto LABEL_16;
  }
  uint64_t v9 = sub_100017698();
  v17[0] = off_1000FB610;
  v17[1] = a1;
  v17[3] = v17;
  sub_10001797C((uint64_t)v9, 7, (uint64_t)v17);
  sub_10001802C(v17);
  int64x2_t v10 = a1[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ACEF4;
  block[3] = &unk_1000F5EA8;
  void block[4] = a1;
  dispatch_async(v10, block);

  return a1;
}

void sub_1000ACEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_10001802C((uint64_t *)va);
  sub_10007FDF0(v9);

  _Unwind_Resume(a1);
}

void sub_1000ACEF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = sub_10003E368();
  if (*((char *)v2 + 135) < 0)
  {
    sub_100004CB8(__p, (void *)v2[14], v2[15]);
  }
  else
  {
    *(_OWORD *)__p = *((_OWORD *)v2 + 7);
    uint64_t v6 = v2[16];
  }
  id v3 = (void *)HIBYTE(v6);
  if (v6 < 0) {
    id v3 = __p[1];
  }
  if (!v3)
  {
    uint64_t v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      int64x2_t v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,loadingCodeDefaults\"}", buf, 0x12u);
    }
    sub_10009DA10(v1 + 16, 0);
  }
  sub_1000AD040(v1, (uint64_t)__p);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000AD01C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

void sub_1000AD040(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2)
  {
    sub_10000DD48(v24, "file://");
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v6 = *(const std::string::value_type **)a2;
    }
    if (v5 >= 0) {
      std::string::size_type v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      std::string::size_type v7 = *(void *)(a2 + 8);
    }
    int v8 = std::string::append((std::string *)v24, v6, v7);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    int64_t v23 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    if ((v24[23] & 0x80000000) != 0) {
      operator delete(*(void **)v24);
    }
    if (v23 >= 0) {
      int64x2_t v10 = __p;
    }
    else {
      int64x2_t v10 = (void **)__p[0];
    }
    uint64_t v11 = +[NSString stringWithUTF8String:v10];
    __int16 v12 = +[NSURL URLWithString:v11];

    id v21 = 0;
    int v13 = +[NSDictionary dictionaryWithContentsOfURL:v12 error:&v21];
    id v14 = v21;
    if (v14)
    {
      uint64_t v15 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        if (SHIBYTE(v23) < 0) {
          operator delete(__p[0]);
        }

        return;
      }
      *(void *)__int16 v24 = 68289283;
      *(_WORD *)&v24[8] = 2082;
      *(void *)&v24[10] = "";
      *(_WORD *)&v24[18] = 2113;
      *(void *)&v24[20] = v14;
      int v16 = "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset\", \"error\":%{private, location:escape_only}@}";
      BOOL v17 = v15;
      uint32_t v18 = 28;
    }
    else
    {
      if (v13)
      {
        sub_10009DA10(a1 + 16, v13);
        goto LABEL_25;
      }
      uint64_t v20 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(void *)__int16 v24 = 68289026;
      *(_WORD *)&v24[8] = 2082;
      *(void *)&v24[10] = "";
      int v16 = "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset,assetIsEmpty\"}";
      BOOL v17 = v20;
      uint32_t v18 = 18;
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
    goto LABEL_25;
  }
  int v19 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)__int16 v24 = 68289026;
    *(_WORD *)&v24[8] = 2082;
    *(void *)&v24[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset,invalidFilename\"}", v24, 0x12u);
  }
}

void sub_1000AD2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000AD358(uint64_t a1)
{
  *(void *)a1 = off_1000FB5C8;
  sub_10007FDF0((void *)(a1 + 16));

  return a1;
}

void sub_1000AD3A4(uint64_t a1)
{
  *(void *)a1 = off_1000FB5C8;
  sub_10007FDF0((void *)(a1 + 16));

  operator delete();
}

void sub_1000AD414(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = 0;
  *a3 = 0;
}

void sub_1000AD424()
{
}

void *sub_1000AD438(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = off_1000FB610;
  result[1] = v3;
  return result;
}

uint64_t sub_1000AD480(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_1000FB610;
  a2[1] = v2;
  return result;
}

void sub_1000AD4AC(uint64_t a1, id *a2)
{
  id v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 8);
  int v5 = *(NSObject **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1000AD598;
  v7[3] = &unk_1000F6B88;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t sub_1000AD54C(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_1000AD58C()
{
}

void sub_1000AD598(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  if (v2)
  {
    if (xpc_dictionary_get_int64(v2, "TestMessageType") == 7)
    {
      string = (char *)xpc_dictionary_get_string(v3, "AssetFilename");
      sub_10000DD48(&__p, string);
      sub_1000AD040(v1, (uint64_t)&__p);
      if (v9 < 0) {
        operator delete(__p);
      }
    }
  }
  else
  {
    int v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      __p = (void *)68289026;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,InvalidTestInputObject\"}", (uint8_t *)&__p, 0x12u);
    }
  }
}

void sub_1000AD6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *SANetworkReachabilityTest::SANetworkReachabilityTest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100086790((uint64_t)v6, a4);
  *a1 = off_1000FABE0;
  sub_100086790((uint64_t)(a1 + 1), (uint64_t)v6);
  sub_10007CA04(v6);
  *a1 = off_1000FB690;
  return a1;
}

void sub_1000AD798(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10007CA04((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *sub_1000AD7B4(void *a1)
{
  *a1 = off_1000FABE0;
  sub_10007CA04(a1 + 1);
  return a1;
}

void sub_1000AD7F8(void *a1)
{
  *a1 = off_1000FABE0;
  sub_10007CA04(a1 + 1);

  operator delete();
}

void *SACompanionDetectorTest::SACompanionDetectorTest(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  sub_10004DB88((uint64_t)v7, a3);
  sub_1000860BC(a1, v5, (uint64_t)v7);
  sub_100021E70(v7);
  *a1 = off_1000FB6D0;

  return a1;
}

void sub_1000AD910(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100021E70((uint64_t *)va);

  _Unwind_Resume(a1);
}

uint64_t sub_1000AD938(uint64_t a1)
{
  *(void *)a1 = off_1000FA2D0;
  sub_100021E70((void *)(a1 + 16));

  return a1;
}

void sub_1000AD984(uint64_t a1)
{
  *(void *)a1 = off_1000FA2D0;
  sub_100021E70((void *)(a1 + 16));

  operator delete();
}

void *SACloudChannelTest::SACloudChannelTest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100027E74((uint64_t)v8, a3);
  sub_10007C28C((uint64_t)v7, a4);
  *a1 = off_1000FAA58;
  sub_100027DF0(v7);
  sub_10002809C(v8);
  *a1 = off_1000FB710;
  return a1;
}

void sub_1000ADAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_10002809C((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000ADAD0()
{
}

uint64_t sub_1000ADB08()
{
  return 0;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA224(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return _CFCalendarCopyCurrent();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  id v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CLClientGetDistanceCoordinates()
{
  return _CLClientGetDistanceCoordinates();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t GEOCalculateDistance()
{
  return _GEOCalculateDistance();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionGetCellBroadcastConfig()
{
  return __CTServerConnectionGetCellBroadcastConfig();
}

uint64_t _CTServerConnectionGetCellBroadcastSettingForAlertType()
{
  return __CTServerConnectionGetCellBroadcastSettingForAlertType();
}

uint64_t _CTServerConnectionInjectCellBroadcastMessageWithWac()
{
  return __CTServerConnectionInjectCellBroadcastMessageWithWac();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return __CTServerConnectionRegisterForNotification();
}

uint64_t _CTServerConnectionSendAppleSafetyAlert()
{
  return __CTServerConnectionSendAppleSafetyAlert();
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

double std::stod(const std::string *__str, size_t *__idx)
{
  return std::stod(__str, __idx);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return std::to_string(retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

unsigned int alarm(unsigned int a1)
{
  return _alarm(a1);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

long double asin(long double __x)
{
  return _asin(__x);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

long double cos(long double __x)
{
  return _cos(__x);
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

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

long double sin(long double __x)
{
  return _sin(__x);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
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
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_APSDInterfaceStatus(void *a1, const char *a2, ...)
{
  return [a1 APSDInterfaceStatus];
}

id objc_msgSend_CCA(void *a1, const char *a2, ...)
{
  return [a1 CCA];
}

id objc_msgSend_CellularDataEnabled(void *a1, const char *a2, ...)
{
  return [a1 CellularDataEnabled];
}

id objc_msgSend_CellularQualityStatus(void *a1, const char *a2, ...)
{
  return [a1 CellularQualityStatus];
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return [a1 Device];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return [a1 SSID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_WakeOnWiFiStatus(void *a1, const char *a2, ...)
{
  return [a1 WakeOnWiFiStatus];
}

id objc_msgSend_WiFi(void *a1, const char *a2, ...)
{
  return [a1 WiFi];
}

id objc_msgSend_WiFiAvailabilityStatus(void *a1, const char *a2, ...)
{
  return [a1 WiFiAvailabilityStatus];
}

id objc_msgSend_Wireless(void *a1, const char *a2, ...)
{
  return [a1 Wireless];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return [a1 automotive];
}

id objc_msgSend_bleRSSI(void *a1, const char *a2, ...)
{
  return [a1 bleRSSI];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return [a1 bluetoothState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return [a1 channelID];
}

id objc_msgSend_channelProxy(void *a1, const char *a2, ...)
{
  return [a1 channelProxy];
}

id objc_msgSend_clProxy(void *a1, const char *a2, ...)
{
  return [a1 clProxy];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return [a1 cycling];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_densityScore(void *a1, const char *a2, ...)
{
  return [a1 densityScore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceRegistrationState(void *a1, const char *a2, ...)
{
  return [a1 deviceRegistrationState];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_getCFRunLoop(void *a1, const char *a2, ...)
{
  return [a1 getCFRunLoop];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getPushConnection(void *a1, const char *a2, ...)
{
  return [a1 getPushConnection];
}

id objc_msgSend_getReachability(void *a1, const char *a2, ...)
{
  return [a1 getReachability];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_incomingInterface(void *a1, const char *a2, ...)
{
  return [a1 incomingInterface];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAPSDOverCell(void *a1, const char *a2, ...)
{
  return [a1 isAPSDOverCell];
}

id objc_msgSend_isAPSDOverWiFi(void *a1, const char *a2, ...)
{
  return [a1 isAPSDOverWiFi];
}

id objc_msgSend_isInternetReachable(void *a1, const char *a2, ...)
{
  return [a1 isInternetReachable];
}

id objc_msgSend_isSafetyDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSafetyDataSubmissionAllowed];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_noteUserViewedEDSettings(void *a1, const char *a2, ...)
{
  return [a1 noteUserViewedEDSettings];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_quality(void *a1, const char *a2, ...)
{
  return [a1 quality];
}

id objc_msgSend_rat(void *a1, const char *a2, ...)
{
  return [a1 rat];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return [a1 requestLocation];
}

id objc_msgSend_requestSingleShotLocation(void *a1, const char *a2, ...)
{
  return [a1 requestSingleShotLocation];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rrcStatus(void *a1, const char *a2, ...)
{
  return [a1 rrcStatus];
}

id objc_msgSend_rssiHistogram(void *a1, const char *a2, ...)
{
  return [a1 rssiHistogram];
}

id objc_msgSend_rxRate(void *a1, const char *a2, ...)
{
  return [a1 rxRate];
}

id objc_msgSend_safetyAlertsAlertData(void *a1, const char *a2, ...)
{
  return [a1 safetyAlertsAlertData];
}

id objc_msgSend_safetyAlertsAlertID(void *a1, const char *a2, ...)
{
  return [a1 safetyAlertsAlertID];
}

id objc_msgSend_safetyAlertsSignature(void *a1, const char *a2, ...)
{
  return [a1 safetyAlertsSignature];
}

id objc_msgSend_scanDuration(void *a1, const char *a2, ...)
{
  return [a1 scanDuration];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringSignificantLocationChanges];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopActivityUpdates];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringSignificantLocationChanges];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 threadIdentifier];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateLocationAuthorized(void *a1, const char *a2, ...)
{
  return [a1 updateLocationAuthorized];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return [a1 walking];
}
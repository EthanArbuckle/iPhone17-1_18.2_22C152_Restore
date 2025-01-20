@interface SPTailspinFile
+ (id)sampleStoreForFile:(const char *)a3 stackshotsOnly:(BOOL)a4 parsePastLastStackshot:(BOOL)a5;
@end

@implementation SPTailspinFile

+ (id)sampleStoreForFile:(const char *)a3 stackshotsOnly:(BOOL)a4 parsePastLastStackshot:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v7 = a3;
  uint64_t v76 = 0;
  if ((+[SASampleStore canOpenFileAsKTraceFile:a3 errorOut:&v76] & 1) == 0)
  {
    if (v76)
    {
      if (byte_1000EFD38)
      {
        int v18 = *__error();
        v19 = sub_10002FC70();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_10009AE24();
        }
        *__error() = v18;
      }
      if (byte_1000EFD39) {
        BOOL v20 = dword_1000EF4E8 <= 0;
      }
      else {
        BOOL v20 = 0;
      }
      if (!v20) {
        return 0;
      }
      int v21 = *__error();
      CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Could not open %s as a ktrace file: %@", v7, v76);
      if (!v22)
      {
        v31 = sub_10002FC70();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          sub_10009ADBC();
        }
        goto LABEL_123;
      }
      CFStringRef v23 = v22;
      CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
      if (CStringPtr) {
        goto LABEL_118;
      }
      malloc_type_id_t v25 = 4020962941;
    }
    else
    {
      if (byte_1000EFD38)
      {
        int v26 = *__error();
        v27 = sub_10002FC70();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_10009AD48();
        }
        *__error() = v26;
      }
      if (byte_1000EFD39) {
        BOOL v28 = dword_1000EF4E8 <= 0;
      }
      else {
        BOOL v28 = 0;
      }
      if (!v28) {
        return 0;
      }
      int v21 = *__error();
      CFStringRef v30 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Could not open %s as a ktrace file for unknown reason", v7);
      if (!v30)
      {
        v32 = sub_10002FC70();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          sub_10009ACD4();
        }
        goto LABEL_123;
      }
      CFStringRef v23 = v30;
      CStringPtr = CFStringGetCStringPtr(v30, 0x8000100u);
      if (CStringPtr) {
        goto LABEL_118;
      }
      malloc_type_id_t v25 = 2906130801;
    }
LABEL_128:
    v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v25);
    CFStringGetCString(v23, v62, 1024, 0x8000100u);
    v63 = v62;
    goto LABEL_129;
  }
  id v71 = +[NSMutableArray array];
  id v8 = [objc_alloc((Class)SASampleStore) initForFileParsing];
  if ((byte_1000EFD4C & 2) != 0 && sub_100025844())
  {
    if (byte_1000EFD38)
    {
      int v9 = *__error();
      v10 = sub_10002FC70();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Avoiding inspecting live processes for tailspin file due to audio running", buf, 2u);
      }
      *__error() = v9;
    }
    if (byte_1000EFD39) {
      BOOL v11 = dword_1000EF4E8 <= 2;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      int v12 = *__error();
      CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Avoiding inspecting live processes for tailspin file due to audio running");
      if (v13)
      {
        CFStringRef v14 = v13;
        v15 = CFStringGetCStringPtr(v13, 0x8000100u);
        if (v15)
        {
          v16 = (char *)v15;
          v17 = 0;
        }
        else
        {
          v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x2FB58C3FuLL);
          CFStringGetCString(v14, v16, 1024, 0x8000100u);
          v17 = v16;
        }
        if (qword_1000EFD40) {
          v35 = (FILE *)qword_1000EFD40;
        }
        else {
          v35 = __stderrp;
        }
        fprintf(v35, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        CFRelease(v14);
      }
      else
      {
        v33 = sub_10002FC70();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          sub_10009AC90(v33);
        }
        if (qword_1000EFD40) {
          v34 = (FILE *)qword_1000EFD40;
        }
        else {
          v34 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
      }
      *__error() = v12;
    }
    [v8 setDataGatheringOptions:((unint64_t)[v8 dataGatheringOptions] & 0xFFFFFFFFFFFFFFFDLL)];
  }
  sub_100059EA8(v8, (byte_1000EFD4C >> 3) & 1, (byte_1000EFD4C >> 2) & 1, (byte_1000EFD4C & 0x10) == 0);
  id v70 = v8;
  if (v6)
  {
    v36 = v71;
    unsigned __int8 v37 = [v8 parseStackshotsFromKTraceFile:v7 warningsOut:v71 errorOut:&v76];
  }
  else
  {
    if (v5) {
      [v8 setKPerfPETParsePastLastStackshot:1];
    }
    v36 = v71;
    unsigned __int8 v37 = [v8 parseKTraceFile:v7 warningsOut:v71 errorOut:&v76];
  }
  unsigned __int8 v69 = v37;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v38 = [v36 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v73;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v73 != v40) {
          objc_enumerationMutation(v36);
        }
        uint64_t v42 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        if (byte_1000EFD38)
        {
          int v43 = *__error();
          v44 = sub_10002FC70();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v78 = v7;
            __int16 v79 = 2112;
            uint64_t v80 = v42;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "WARNING creating sample store from %s: %@", buf, 0x16u);
          }
          *__error() = v43;
        }
        if (byte_1000EFD39) {
          BOOL v45 = dword_1000EF4E8 <= 3;
        }
        else {
          BOOL v45 = 0;
        }
        if (v45)
        {
          int v46 = *__error();
          v47 = v7;
          CFStringRef v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"WARNING creating sample store from %s: %@", v7, v42);
          if (v48)
          {
            CFStringRef v49 = v48;
            v50 = CFStringGetCStringPtr(v48, 0x8000100u);
            if (v50)
            {
              v51 = (char *)v50;
              v52 = 0;
            }
            else
            {
              v51 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9177DA42uLL);
              CFStringGetCString(v49, v51, 1024, 0x8000100u);
              v52 = v51;
            }
            if (qword_1000EFD40) {
              v55 = (FILE *)qword_1000EFD40;
            }
            else {
              v55 = __stderrp;
            }
            fprintf(v55, "%s\n", v51);
            if (v52) {
              free(v52);
            }
            CFRelease(v49);
            v7 = v47;
          }
          else
          {
            v53 = sub_10002FC70();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v78 = v7;
              __int16 v79 = 2112;
              uint64_t v80 = v42;
              _os_log_fault_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "Unable to format: WARNING creating sample store from %s: %@", buf, 0x16u);
            }
            if (qword_1000EFD40) {
              v54 = (FILE *)qword_1000EFD40;
            }
            else {
              v54 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v54);
          }
          v36 = v71;
          *__error() = v46;
        }
      }
      id v39 = [v36 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v39);
  }
  if (v69) {
    return v70;
  }

  if (v76)
  {
    if (byte_1000EFD38)
    {
      int v56 = *__error();
      v57 = sub_10002FC70();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_10009AC18();
      }
      *__error() = v56;
    }
    id result = 0;
    if (byte_1000EFD39 && dword_1000EF4E8 <= 3)
    {
      int v21 = *__error();
      CFStringRef v58 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"ERROR trying to create sample store from %s: %@", v7, v76);
      if (v58)
      {
        CFStringRef v23 = v58;
        CStringPtr = CFStringGetCStringPtr(v58, 0x8000100u);
        if (!CStringPtr)
        {
          malloc_type_id_t v25 = 1814295888;
          goto LABEL_128;
        }
LABEL_118:
        v62 = (char *)CStringPtr;
        v63 = 0;
LABEL_129:
        if (qword_1000EFD40) {
          v67 = (FILE *)qword_1000EFD40;
        }
        else {
          v67 = __stderrp;
        }
        fprintf(v67, "%s\n", v62);
        if (v63) {
          free(v63);
        }
        CFRelease(v23);
LABEL_135:
        v68 = __error();
        id result = 0;
        int *v68 = v21;
        return result;
      }
      v64 = sub_10002FC70();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
        sub_10009ABB0();
      }
      goto LABEL_123;
    }
  }
  else
  {
    if (byte_1000EFD38)
    {
      int v59 = *__error();
      v60 = sub_10002FC70();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_10009AB3C();
      }
      *__error() = v59;
    }
    id result = 0;
    if (byte_1000EFD39 && dword_1000EF4E8 <= 3)
    {
      int v21 = *__error();
      CFStringRef v61 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"ERROR trying to create sample store from %s: Unknown error", v7);
      if (v61)
      {
        CFStringRef v23 = v61;
        CStringPtr = CFStringGetCStringPtr(v61, 0x8000100u);
        if (!CStringPtr)
        {
          malloc_type_id_t v25 = 1928315350;
          goto LABEL_128;
        }
        goto LABEL_118;
      }
      v65 = sub_10002FC70();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
        sub_10009AAC8();
      }
LABEL_123:
      if (qword_1000EFD40) {
        v66 = (FILE *)qword_1000EFD40;
      }
      else {
        v66 = __stderrp;
      }
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v66);
      goto LABEL_135;
    }
  }
  return result;
}

@end
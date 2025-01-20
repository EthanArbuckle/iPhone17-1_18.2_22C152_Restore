id QLLocalizedDictionaryString(void *a1)
{
  return QLLocalizedStringFromTable(a1, @"Localizable");
}

id QLLocalizedString(void *a1)
{
  return QLLocalizedStringFromTable(a1, @"Localizable");
}

id QLLocalizedStringFromTable(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v5 = QLFrameworkBundle();
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F3DC97E0 table:v3];

  return v6;
}

id QLLocalizedStringWithDefaultValue(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a1;
  v7 = QLFrameworkBundle();
  v8 = [v7 localizedStringForKey:v6 value:v5 table:@"Localizable"];

  return v8;
}

void QLRunInMainThread(void *a1)
{
  v1 = a1;
  if (!v1) {
    QLRunInMainThread_cold_1();
  }
  block = v1;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void QLRunInMainThreadSync(void *a1)
{
  v1 = a1;
  if (!v1) {
    QLRunInMainThreadSync_cold_1();
  }
  block = v1;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

void QLRunInBackgroundThread(void *a1)
{
  v1 = a1;
  if (!v1) {
    QLRunInBackgroundThread_cold_1();
  }
  block = v1;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = dispatch_get_global_queue(0, 0);
    dispatch_async(v2, block);
  }
  else
  {
    block[2]();
  }
}

void sub_1E280ADF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E280B200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E280CC24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E280D754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id QLSLogHandle()
{
  v0 = (void **)MEMORY[0x1E4F945F0];
  v1 = (void *)*MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    v1 = *v0;
  }
  return v1;
}

void sub_1E280EBE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E280ED68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E280F09C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E280F8D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exception_object);
    v19 = QLSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)(v17 - 128) = 138412546;
      *(void *)(v16 + 4) = a16;
      *(_WORD *)(v17 - 116) = 2112;
      *(void *)(v16 + 14) = v18;
      _os_log_impl(&dword_1E2805000, v19, OS_LOG_TYPE_DEFAULT, "Exception during preview computation of %@: %@ #Generic", (uint8_t *)(v17 - 128), 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x1E280F258);
  }
  _Unwind_Resume(exception_object);
}

void sub_1E280FF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
}

void sub_1E2810344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void QLPreviewRequestSetDataRepresentation(QLPreviewRequestRef preview, CFDataRef data, CFStringRef contentTypeUTI, CFDictionaryRef properties)
{
  [(__QLPreviewRequest *)preview startDataRepresentationWithContentType:contentTypeUTI properties:properties];
  [(__QLPreviewRequest *)preview appendData:data forURL:0 lastChunk:1];
}

uint64_t QLPreviewRequestStartDataRepresentation(void *a1, const char *a2, uint64_t a3)
{
  return [a1 startDataRepresentationWithContentType:a2 properties:a3];
}

CFTypeRef QLPreviewRequestCreateAttachmentURL(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[a1 newAttachmentURLWithID:a2 properties:a3];
  id v4 = v3;
  if (v3) {
    CFTypeRef v5 = CFRetain(v3);
  }
  else {
    CFTypeRef v5 = 0;
  }

  return v5;
}

uint64_t QLPreviewRequestAppendDataToAttachment(void *a1, const char *a2, uint64_t a3, int a4)
{
  return [a1 appendData:a3 forURL:a2 lastChunk:a4 != 0];
}

uint64_t QLPreviewRequestSetError(void *a1, const char *a2)
{
  return [a1 setError:a2];
}

Boolean QLPreviewRequestIsCancelled(QLPreviewRequestRef preview)
{
  return [(__QLPreviewRequest *)preview isCancelled];
}

void sub_1E2811578(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL QLPreviewControllerSupportsContentType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[QLItem supportedContentTypes];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (v1)
  {
    id v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v1];
    if ([v2 containsObject:v3])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __QLPreviewControllerSupportsContentType_block_invoke;
      v6[3] = &unk_1E6DD3CB0;
      id v7 = v3;
      v8 = &v9;
      [v2 enumerateObjectsUsingBlock:v6];
      BOOL v4 = *((unsigned char *)v10 + 24) != 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_1E2811A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __QLPreviewControllerSupportsContentType_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) conformsToType:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

id QLPreviewGetSupportedMIMETypes()
{
  v0 = (void *)QLPreviewGetSupportedMIMETypes_result;
  if (!QLPreviewGetSupportedMIMETypes_result)
  {
    uint64_t v1 = +[QLPreviewConverter convertibleMIMETypes];
    uint64_t v2 = (void *)QLPreviewGetSupportedMIMETypes_result;
    QLPreviewGetSupportedMIMETypes_uint64_t result = v1;

    v0 = (void *)QLPreviewGetSupportedMIMETypes_result;
  }
  return v0;
}

uint64_t QLPreviewNeedsHelpUnzippingURL()
{
  return 0;
}

BOOL _QLLayoutIsRTL()
{
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v1 = [v0 userInterfaceLayoutDirection] == 1;

  return v1;
}

id QLItemViewControllerVendorForURL(void *a1)
{
  id v1 = a1;
  Class v2 = NSClassFromString(&cfstr_Qlitemviewcont.isa);
  if (!v2
    || ([(objc_class *)v2 performSelector:sel_qlItemViewControllerForURL_ withObject:v1], (id v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  }

  return v3;
}

id QLItemViewControllerVendorForItem(void *a1)
{
  id v1 = a1;
  Class v2 = NSClassFromString(&cfstr_Qlitemviewcont.isa);
  if (!v2
    || ([(objc_class *)v2 performSelector:sel_qlItemViewControllerForItem_ withObject:v1], (id v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  }

  return v3;
}

void *_getIWorkImportLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = (void *)__lib;
  if (!__lib)
  {
    if (__loaded)
    {
      return 0;
    }
    else
    {
      uint64_t result = dlopen("/System/Library/PrivateFrameworks/iWorkImport.framework/iWorkImport", 1);
      __lib = (uint64_t)result;
      if (!result)
      {
        id v1 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          id v3 = (NSObject **)MEMORY[0x1E4F945F0];
          QLSInitLogging();
          id v1 = *v3;
        }
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        {
          Class v2 = v1;
          int v4 = 136315138;
          CFTypeRef v5 = dlerror();
          _os_log_impl(&dword_1E2805000, v2, OS_LOG_TYPE_ERROR, "Cannot load iWorkImport: %s #Conversion", (uint8_t *)&v4, 0xCu);
        }
        uint64_t result = (void *)__lib;
      }
      __loaded = 1;
    }
  }
  return result;
}

uint64_t QLIWPreviewStartData(uint64_t a1, const char *a2, uint64_t a3)
{
  *(unsigned char *)a1 = 1;
  return QLPreviewRequestStartDataRepresentation(*(void **)(a1 + 8), a2, a3);
}

CFTypeRef QLIWPreviewCreateAttachmentURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return QLPreviewRequestCreateAttachmentURL(*(void **)(a1 + 8), a2, a3);
}

void QLIWPreviewAppendDataToAttachment(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  if (a3 || a2 || *(unsigned char *)a1)
  {
    v8 = *(void **)(a1 + 8);
    QLPreviewRequestAppendDataToAttachment(v8, a2, a3, a4);
  }
  else
  {
    CFTypeRef v5 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v6 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1E2805000, v6, OS_LOG_TYPE_DEFAULT, "QLIWPreviewAppendDataToAttachment was called but QLIWPreviewStartData was never called before. #Conversion", v9, 2u);
    }
    id v7 = (const char *)CFErrorCreate(0, @"QuickLookErrorDomain", 8, 0);
    QLPreviewRequestSetError(*(void **)(a1 + 8), v7);
    CFRelease(v7);
  }
}

BOOL QLIWPreviewShouldContinue(uint64_t a1)
{
  return QLPreviewRequestIsCancelled(*(QLPreviewRequestRef *)(a1 + 8)) == 0;
}

uint64_t QLIWPreviewRequestSetError(uint64_t a1, const char *a2)
{
  return QLPreviewRequestSetError(*(void **)(a1 + 8), a2);
}

uint64_t IWGenerateProgressivePreviewForURL(int a1, void *a2, uint64_t a3, uint64_t a4, CFDictionaryRef theDict)
{
  if (IWGenerateProgressivePreviewForURL_functionPointer) {
    goto LABEL_2;
  }
  IWorkImportLibrary = _getIWorkImportLibrary();
  if (!IWorkImportLibrary) {
    return 0;
  }
  IWGenerateProgressivePreviewForURL_functionPointer = (uint64_t (*)(void, void, void, void, void, void))dlsym(IWorkImportLibrary, "IWorkPreviewProcessWithURLAndOptions");
  if (!IWGenerateProgressivePreviewForURL_functionPointer)
  {
    v14 = (NSObject **)MEMORY[0x1E4F945F0];
    v15 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v15, OS_LOG_TYPE_ERROR, "Cannot find IWorkPreviewProcessWithURLAndOptions function #Conversion", buf, 2u);
    }
    return 0;
  }
LABEL_2:
  *(_OWORD *)buf = xmmword_1F3DC9510;
  long long v19 = *(_OWORD *)&off_1F3DC9520;
  v20 = off_1F3DC9530;
  v17[0] = 0;
  v17[1] = a2;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  Value = CFDictionaryGetValue(theDict, @"Password");
  if (Value) {
    CFDictionarySetValue(MutableCopy, @"Password", Value);
  }
  uint64_t v11 = IWGenerateProgressivePreviewForURL_functionPointer(a3, a4, theDict, a2, v17, buf);
  CFRelease(MutableCopy);
  if (v11 == 4)
  {
    char v12 = (const char *)CFErrorCreate(0, @"QuickLookErrorDomain", 4, 0);
    QLPreviewRequestSetError(a2, v12);
    CFRelease(v12);
  }
  return v11;
}

uint64_t IWGenerateAtomicPreviewForURL(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  CFDictionaryRef properties = 0;
  CFTypeRef cf = 0;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [a5 objectForKey:@"URLBase"];
  uint64_t v11 = [v9 URLWithString:v10];
  char v12 = [v11 URLByDeletingLastPathComponent];

  Value = CFDictionaryGetValue((CFDictionaryRef)a5, @"Password");
  CFTypeRef v23 = 0;
  uint64_t v14 = [v12 absoluteString];
  int v16 = QLIWorkCalculatePreview(0, a3, a4, &cf, (CFTypeRef *)&properties, v14, 0, v15, (uint64_t)Value, (CFErrorRef *)&v23);
  CFDataRef v17 = (const __CFData *)cf;
  if (v16) {
    BOOL v18 = cf == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (cf) {
      CFRelease(cf);
    }
    if (v23)
    {
      QLPreviewRequestSetError(a2, (const char *)v23);
      CFRelease(v23);
    }
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else
  {
    v20 = [(id)*MEMORY[0x1E4F443F0] identifier];
    CFDictionaryRef v21 = properties;
    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v17, v20, properties);

    CFRelease(v17);
    if (v21) {
      CFRelease(v21);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t QLIWorkCalculatePreview(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, CFErrorRef *a10)
{
  v73[1] = *MEMORY[0x1E4F143B8];
  int v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer;
  if (QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer)
  {
    CFDataRef v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkFileAtURLWithPassword_functionPointer;
LABEL_3:
    err[0] = 0;
    if (a1 && v16)
    {
      BOOL v18 = (void *)v16(a1, a6, a3, a9, err);
    }
    else
    {
      if (!a2 || !v17) {
        goto LABEL_46;
      }
      BOOL v18 = (void *)v17(a2, a6, a3, a9, err);
    }
    v26 = v18;
    if (err[0])
    {
      if (a10)
      {
        uint64_t v72 = *MEMORY[0x1E4F28A50];
        v73[0] = err[0];
        CFDictionaryRef v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
        if (CFErrorGetCode(err[0]) == 1) {
          CFIndex v28 = 4;
        }
        else {
          CFIndex v28 = 16;
        }
        *a10 = CFErrorCreate(0, @"QuickLookErrorDomain", v28, v27);
      }
LABEL_51:
      uint64_t v24 = 0;
LABEL_52:

      return v24;
    }
    if (v18)
    {
      v29 = [v18 objectForKey:@"HTMLMainContentData"];
      uint64_t v24 = v29 != 0;
      if (!v29)
      {
LABEL_68:

        goto LABEL_52;
      }
      v30 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v30, "setObject:forKey:", @"text/html");
      objc_msgSend(v30, "setObject:forKey:", @"UTF-8");
      v31 = [v26 objectForKey:@"HTMLResources"];
      [MEMORY[0x1E4F1CA60] dictionary];
      v64 = v62 = v31;
      if (v31 && [v31 count])
      {
        v60 = v26;
        v61 = v30;
        v57 = v29;
        BOOL v58 = v29 != 0;
        v59 = a5;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v71 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          v63 = 0;
          uint64_t v35 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v66 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              v38 = [v32 objectForKey:v37];
              if ([v37 hasSuffix:@".html"])
              {
                int v39 = 0;
                v40 = @"text/html";
              }
              else
              {
                int v41 = [v37 hasSuffix:@".css"];
                int v39 = v41 ^ 1;
                if (v41) {
                  v40 = @"text/css";
                }
                else {
                  v40 = 0;
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v42 = [v38 dataUsingEncoding:4];

                v38 = (void *)v42;
              }
              if ([v37 hasSuffix:@"preview.pdf"])
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v43 = v38;

                  v63 = v43;
                }
              }
              if (v39) {
                v44 = 0;
              }
              else {
                v44 = @"UTF-8";
              }
              v45 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v38, @"AttachmentData", v40, @"MimeType", v44, @"TextEncoding", 0);
              v46 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
              v47 = [v37 stringByAddingPercentEncodingWithAllowedCharacters:v46];
              [v64 setObject:v45 forKey:v47];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v65 objects:v71 count:16];
          }
          while (v34);
        }
        else
        {
          v63 = 0;
        }

        v30 = v61;
        v55 = v64;
        [v61 setObject:v64 forKey:@"Attachments"];
        v56 = v63;
        if (v63)
        {
          a5 = v59;
          v26 = v60;
          uint64_t v24 = v58;
          v29 = v57;
          if ([v64 count] == 1)
          {
            [v61 setObject:@"application/pdf" forKey:@"MimeType"];
            [v61 removeObjectForKey:@"Attachments"];
            *a4 = CFRetain(v63);
            CFTypeRef *v59 = CFRetain(v61);
LABEL_67:

            goto LABEL_68;
          }
        }
        else
        {
          v63 = 0;
          a5 = v59;
          v26 = v60;
          uint64_t v24 = v58;
          v29 = v57;
        }
      }
      else
      {
        v63 = 0;
      }
      [v30 setObject:*MEMORY[0x1E4F1CFD0] forKey:@"AllowJavascript"];
      v52 = [v26 objectForKey:@"Width"];
      uint64_t v53 = [v26 objectForKey:@"Height"];
      v54 = (void *)v53;
      if (v52)
      {
        if (v53)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v30 setObject:v52 forKey:@"Width"];
              [v30 setObject:v54 forKey:@"Height"];
            }
          }
        }
      }
      *a4 = CFRetain(v29);
      *a5 = CFRetain(v30);

      v55 = v64;
      v56 = v63;
      goto LABEL_67;
    }
LABEL_46:
    v48 = (NSObject **)MEMORY[0x1E4F945F0];
    v49 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v49 = *v48;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v49, OS_LOG_TYPE_DEFAULT, "iWorkImport failed to convert document #Conversion", buf, 2u);
    }
    v26 = 0;
    goto LABEL_51;
  }
  IWorkImportLibrary = _getIWorkImportLibrary();
  if (IWorkImportLibrary)
  {
    v20 = IWorkImportLibrary;
    QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer = dlsym(IWorkImportLibrary, "CopyHTMLForIWorkDataWithUTIAndPassword");
    unint64_t v21 = (unint64_t)dlsym(v20, "CopyHTMLForIWorkFileAtURLWithPassword");
    QLIWorkCalculatePreview_CopyHTMLForIWorkFileAtURLWithPassword_functionPointer = (_UNKNOWN *)v21;
    int v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer;
    if ((unint64_t)QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer | v21)
    {
      CFDataRef v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))v21;
      goto LABEL_3;
    }
    v22 = (NSObject **)MEMORY[0x1E4F945F0];
    CFTypeRef v23 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      CFTypeRef v23 = *v22;
    }
    uint64_t v24 = 0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(err[0]) = 0;
      v25 = "Cannot find functions in iWorkImport #Conversion";
LABEL_58:
      _os_log_impl(&dword_1E2805000, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)err, 2u);
      return 0;
    }
  }
  else
  {
    v51 = (NSObject **)MEMORY[0x1E4F945F0];
    CFTypeRef v23 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      CFTypeRef v23 = *v51;
    }
    uint64_t v24 = 0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(err[0]) = 0;
      v25 = "Cannot load iWorkImport framework #Conversion";
      goto LABEL_58;
    }
  }
  return v24;
}

uint64_t IWGenerateAtomicPreviewForData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  CFDictionaryRef theDict = 0;
  CFTypeRef cf = 0;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [a5 objectForKey:@"URLBase"];
  uint64_t v11 = [v9 URLWithString:v10];
  char v12 = [v11 URLByDeletingLastPathComponent];

  Value = CFDictionaryGetValue((CFDictionaryRef)a5, @"Password");
  CFTypeRef v25 = 0;
  uint64_t v14 = [v12 absoluteString];
  int v16 = QLIWorkCalculatePreview(a3, 0, a4, &cf, (CFTypeRef *)&theDict, v14, 0, v15, (uint64_t)Value, (CFErrorRef *)&v25);
  CFDataRef v17 = (const __CFData *)cf;
  if (v16) {
    BOOL v18 = cf == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (cf) {
      CFRelease(cf);
    }
    if (v25)
    {
      QLPreviewRequestSetError(a2, (const char *)v25);
      CFRelease(v25);
    }
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else
  {
    CFDictionaryRef v20 = theDict;
    CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(theDict, @"MimeType");
    if (v21 && CFStringCompare(v21, @"application/pdf", 1uLL) == kCFCompareEqualTo) {
      v22 = (id *)MEMORY[0x1E4F44450];
    }
    else {
      v22 = (id *)MEMORY[0x1E4F443F0];
    }
    CFTypeRef v23 = [*v22 identifier];

    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v17, v23, v20);
    CFRelease(v17);
    if (v20) {
      CFRelease(v20);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

BOOL PGPackageHasEmbeddedPreview(const void *a1)
{
  CFTypeRef v1 = PGCopyPreviewURLForPackageURL(a1);
  CFTypeRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0;
}

CFTypeRef PGCopyPreviewURLForPackageURL(const void *a1)
{
  CFArrayRef URLsToLookForBaseURL = QLPackageCreateURLsToLookForBaseURL(a1);
  if (!URLsToLookForBaseURL) {
    return 0;
  }
  CFArrayRef v2 = URLsToLookForBaseURL;
  CFIndex Count = CFArrayGetCount(URLsToLookForBaseURL);
  if (Count < 1)
  {
    CFTypeRef URLMatchingPrefix = 0;
  }
  else
  {
    CFIndex v4 = Count;
    uint64_t v5 = 1;
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v5 - 1);
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      CFArrayRef v9 = [v8 contentsOfDirectoryAtURL:ValueAtIndex includingPropertiesForKeys:v6 options:0 error:0];

      if (v9) {
        CFTypeRef URLMatchingPrefix = QLPackageCopyFirstURLMatchingPrefix(v9, @"Preview", 0, 0);
      }
      else {
        CFTypeRef URLMatchingPrefix = 0;
      }

      if (v5 >= v4) {
        break;
      }
      ++v5;
    }
    while (!URLMatchingPrefix);
  }
  CFRelease(v2);
  return URLMatchingPrefix;
}

uint64_t PGGeneratePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, const void *a3)
{
  CFTypeRef v4 = PGCopyPreviewURLForPackageURL(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    CFDataRef v6 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4 options:0 error:0];
    id v7 = [(id)*MEMORY[0x1E4F44450] identifier];
    QLPreviewRequestSetDataRepresentation(a2, v6, v7, 0);

    CFRelease(v5);
  }
  return 0;
}

void sub_1E281509C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E28152D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E281563C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromQLNetworkState(unint64_t a1)
{
  if (a1 > 4) {
    return @"Undefined QLNetworkState";
  }
  else {
    return off_1E6DD3E28[a1];
  }
}

void sub_1E2815AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E2815B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E2815F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

uint64_t _reachabilityDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _updateNetworkStateWithFlags:a2];
}

void sub_1E2816128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E2816664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E28167AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E2817928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LPDFGeneratePreviewForURL(int a1, __QLPreviewRequest *a2, CFURLRef bundleURL)
{
  uint64_t v9 = 0;
  CFURLRef v4 = LocCopyPDFURLForLocPDFBundleURL(bundleURL, &v9);
  if (v4)
  {
    CFDataRef v5 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4 options:0 error:0];
    CFDataRef v6 = [(id)*MEMORY[0x1E4F44450] identifier];
    QLPreviewRequestSetDataRepresentation(a2, v5, v6, 0);

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

void sub_1E2819A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E281A72C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281A808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281A8B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281A960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281AA40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281AFFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281B10C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281B1B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281B25C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281B300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281B408(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFURLRef LocCopyPDFURLForLocPDFBundleURL(CFURLRef bundleURL, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  CFURLRef v4 = CFBundleCreate(0, bundleURL);
  if (v4)
  {
    CFDataRef v5 = v4;
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v4);
    if (InfoDictionary)
    {
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D008];
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E4F1D008]);
      CFStringRef PathComponent = Value;
      if (Value)
      {
LABEL_6:
        CFArrayRef v10 = CFBundleCopyBundleLocalizations(v5);
        if (v10)
        {
          CFArrayRef v11 = v10;
          CFArrayRef v12 = CFBundleCopyPreferredLocalizationsFromArray(v10);
          if (v12)
          {
            CFArrayRef v13 = v12;
            if (CFArrayGetCount(v12) < 1) {
              CFStringRef ValueAtIndex = 0;
            }
            else {
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
            }
            CFURLRef v15 = CFBundleCopyResourceURLForLocalization(v5, PathComponent, @"pdf", 0, ValueAtIndex);
            CFRelease(v13);
          }
          else
          {
            CFURLRef v15 = CFBundleCopyResourceURLForLocalization(v5, PathComponent, @"pdf", 0, 0);
          }
          CFRelease(v11);
          if (a2)
          {
            if (v15)
            {
              CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v5, @"CFBundleDisplayName");
              *a2 = ValueForInfoDictionaryKey;
              if (ValueForInfoDictionaryKey
                || (CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v5, v7),
                    (*a2 = ValueForInfoDictionaryKey) != 0))
              {
                CFRetain(ValueForInfoDictionaryKey);
              }
            }
          }
        }
        else
        {
          CFURLRef v15 = 0;
        }
        if (!Value) {
          CFRelease(PathComponent);
        }
        goto LABEL_25;
      }
      CFURLRef v16 = CFURLCreateCopyDeletingPathExtension(0, bundleURL);
      CFURLRef v15 = v16;
      if (!v16)
      {
LABEL_25:
        CFRelease(v5);
        return v15;
      }
      CFStringRef PathComponent = CFURLCopyLastPathComponent(v16);
      CFRelease(v15);
      if (PathComponent) {
        goto LABEL_6;
      }
    }
    CFURLRef v15 = 0;
    goto LABEL_25;
  }
  return 0;
}

void sub_1E281D1C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281D748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281D9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E281DDE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E281E20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1E281F760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E281FA9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t QLImageWithSizeShouldNotBeScaled()
{
  return 0;
}

CFArrayRef QLPackageCreateURLsToLookForBaseURL(const void *a1)
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  if (CFURLHasDirectoryPath((CFURLRef)a1))
  {
    CFURLRef v2 = (const __CFURL *)CFRetain(a1);
    if (!v2) {
      goto LABEL_9;
    }
LABEL_6:
    CFURLRef v5 = CFURLCreateCopyAppendingPathComponent(0, v2, @"QuickLook", 1u);
    if (v5)
    {
      CFURLRef v6 = v5;
      CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(0, v2, @"Contents/QuickLook", 1u);
      if (v7)
      {
        CFURLRef v8 = v7;
        values[0] = v6;
        values[1] = v7;
        CFArrayRef v9 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E4F1D510]);
        CFRelease(v6);
        CFRelease(v8);
        CFRelease(v2);
        return v9;
      }
      CFRelease(v2);
      CFURLRef v12 = v6;
    }
    else
    {
      CFURLRef v12 = v2;
    }
    CFRelease(v12);
    return 0;
  }
  CFStringRef v3 = CFURLCopyFileSystemPath((CFURLRef)a1, kCFURLPOSIXPathStyle);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFURLRef v2 = CFURLCreateWithFileSystemPath(0, v3, kCFURLPOSIXPathStyle, 1u);
    CFRelease(v4);
    if (v2) {
      goto LABEL_6;
    }
  }
LABEL_9:
  CFArrayRef v10 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  return CFArrayCreate(0, 0, 0, v10);
}

CFTypeRef QLPackageCopyFirstURLMatchingPrefix(const __CFArray *a1, const __CFString *a2, const __CFString *a3, CFTypeRef *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v9 = Count;
  CFTypeRef v10 = 0;
  for (CFIndex i = 0; i < v9; ++i)
  {
    while (1)
    {
      CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(a1, i);
      CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent)
      {
        CFStringRef v14 = PathComponent;
        if (v10 || !CFStringHasPrefix(PathComponent, a2))
        {
          if (a3 && !*a4 && CFStringHasPrefix(v14, a3)) {
            *a4 = CFRetain(ValueAtIndex);
          }
        }
        else
        {
          CFTypeRef v10 = CFRetain(ValueAtIndex);
        }
        CFRelease(v14);
      }
      if (v10) {
        break;
      }
      if (++i >= v9) {
        return 0;
      }
    }
    if (!a3) {
      break;
    }
    if (*a4) {
      break;
    }
  }
  return v10;
}

void sub_1E2820B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double QLCGSizeFromQLItemThumbnailSize(uint64_t a1)
{
  if (a1 == 1) {
    return 256.0;
  }
  if (a1) {
    return -1.0;
  }
  return 37.0;
}

void sub_1E2823A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E2823B14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t RTFGeneratePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, uint64_t a3, void *a4)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  CFURLRef v7 = [(id)*MEMORY[0x1E4F444A0] identifier];
  if ([v6 isEqualToString:v7])
  {

LABEL_4:
    CFIndex v9 = (id *)MEMORY[0x1E4F42558];
    goto LABEL_5;
  }
  char v8 = [v6 isEqualToString:@"com.microsoft.word.doc"];

  if (v8) {
    goto LABEL_4;
  }
  CFURLRef v15 = [(id)*MEMORY[0x1E4F444A8] identifier];
  char v16 = [v6 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {

    id v14 = 0;
    id v10 = 0;
    goto LABEL_12;
  }
  CFIndex v9 = (id *)MEMORY[0x1E4F42550];
LABEL_5:
  id v10 = *v9;

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v23 = *MEMORY[0x1E4F424F8];
    v24[0] = v10;
    CFURLRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v20 = 0;
    CFArrayRef v13 = (void *)[v11 initWithURL:a3 options:v12 documentAttributes:0 error:&v20];
    id v14 = v20;

    if (v13)
    {
      RTFGeneratePreviewForAttributedString(a2, v13);

      goto LABEL_16;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_12:
  CFDataRef v17 = (NSObject **)MEMORY[0x1E4F945F0];
  BOOL v18 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    BOOL v18 = *v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    _os_log_impl(&dword_1E2805000, v18, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
  }
LABEL_16:

  return 0;
}

void RTFGeneratePreviewForAttributedString(__QLPreviewRequest *a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 length];
  uint64_t v17 = *MEMORY[0x1E4F424F8];
  v18[0] = @"NSWebArchive";
  CFURLRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v12 = 0;
  objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v4, v5, &v12);
  CFDataRef v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  id v7 = v12;
  if (v6)
  {
    CFURLRef v15 = @"MimeType";
    char v16 = @"application/x-webarchive";
    CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    CFIndex v9 = [(id)*MEMORY[0x1E4F44538] identifier];
    QLPreviewRequestSetDataRepresentation(a1, v6, v9, v8);
  }
  else
  {
    id v10 = (NSObject **)MEMORY[0x1E4F945F0];
    id v11 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
    }
  }
}

uint64_t RTFGeneratePreviewForData(uint64_t a1, __QLPreviewRequest *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  CFURLRef v5 = +[QLTextItemTransformer attributedStringFromData:a3 encoding:0 typeIdentifier:a4 error:&v10];
  id v6 = v10;
  if (v5)
  {
    RTFGeneratePreviewForAttributedString(a2, v5);
  }
  else
  {
    id v7 = (NSObject **)MEMORY[0x1E4F945F0];
    CFDictionaryRef v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      CFDictionaryRef v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
    }
  }

  return 0;
}

void sub_1E28246A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E2824C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OIGenerateAtomicPreviewForURL(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t result = _QLGetOfficeFileTypeFromUTI(a4);
  if (result)
  {
    id v11 = (NSObject **)MEMORY[0x1E4F945F0];
    id v12 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
    }
    CFDictionaryRef properties = 0;
    *(void *)buf = 0;
    QLOfficeCalculatePreview(a2, 0, (uint64_t)a3, a4, (CFTypeRef *)buf, (CFTypeRef *)&properties, [a5 objectForKey:@"URLBase"], 0);
    CFDataRef v13 = *(const __CFData **)buf;
    if (*(void *)buf)
    {
      id v14 = [(id)*MEMORY[0x1E4F443F0] identifier];
      CFDictionaryRef v15 = properties;
      QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v13, v14, properties);

      CFRelease(v13);
      if (v15) {
        CFRelease(v15);
      }
      return 0;
    }
    else
    {
      return OIGeneratePreviewForURLIfWrongContent(a1, (__QLPreviewRequest *)a2, a3, a4);
    }
  }
  return result;
}

BOOL QLOfficeSupportsUTI(void *a1)
{
  return _QLGetOfficeFileTypeFromUTI(a1) != 0;
}

void QLOfficeCalculatePreview(void *a1, uint64_t a2, uint64_t a3, void *a4, CFTypeRef *a5, CFTypeRef *a6, uint64_t a7, int a8)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  _QLGetOfficeFileTypeFromUTI(a4);
  if (a8)
  {
    if (a2)
    {
      inited = (void *)OICopyHTMLThumbnailForOfficeData_delayInitStub(v14);
    }
    else
    {
      if (!a3) {
        goto LABEL_13;
      }
      inited = (void *)OICopyHTMLThumbnailFromFileAtURL_delayInitStub(v14);
    }
  }
  else if (a2)
  {
    inited = (void *)OICopyHTMLForOfficeData_delayInitStub(v14);
  }
  else
  {
    if (!a3) {
      goto LABEL_13;
    }
    inited = (void *)OICopyHTMLFromFileAtURL_delayInitStub(v14);
  }
  char v16 = inited;
  if (inited)
  {
    uint64_t v17 = [inited objectForKey:@"HTMLError"];
    if (v17)
    {
      QLPreviewRequestSetError(a1, v17);
    }
    else
    {
      BOOL v18 = [v16 objectForKey:@"HTMLMainContent"];
      uint64_t v19 = [v18 dataUsingEncoding:4];
      if (v19 && (unint64_t)[v18 length] >= 0xA)
      {
        id v20 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_msgSend(v20, "setObject:forKey:", @"text/html");
        objc_msgSend(v20, "setObject:forKey:", @"UTF-8");
        CFStringRef v21 = [v16 objectForKey:@"HTMLResources"];
        v46 = v21;
        if (v21)
        {
          id v22 = v21;
          if ([v21 count])
          {
            v40 = v20;
            int v41 = v19;
            uint64_t v42 = v18;
            id v43 = v16;
            v44 = a5;
            v45 = a6;
            v47 = [MEMORY[0x1E4F1CA60] dictionary];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v23 = v22;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v50 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  CFIndex v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                  v29 = [v23 objectForKey:v28];
                  if ([v28 hasSuffix:@".html"])
                  {
                    int v30 = 0;
                    v31 = @"text/html";
                  }
                  else
                  {
                    int v32 = [v28 hasSuffix:@".css"];
                    int v30 = v32 ^ 1;
                    if (v32) {
                      v31 = @"text/css";
                    }
                    else {
                      v31 = 0;
                    }
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v33 = [v29 dataUsingEncoding:4];

                    v29 = (void *)v33;
                  }
                  if (v30) {
                    uint64_t v34 = 0;
                  }
                  else {
                    uint64_t v34 = @"UTF-8";
                  }
                  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v29, @"AttachmentData", v31, @"MimeType", v34, @"TextEncoding", 0);
                  [v47 setObject:v35 forKey:v28];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
              }
              while (v25);
            }

            id v20 = v40;
            [v40 setObject:v47 forKey:@"Attachments"];

            a5 = v44;
            a6 = v45;
            uint64_t v17 = 0;
            char v16 = v43;
            uint64_t v19 = v41;
            BOOL v18 = v42;
          }
        }
        v36 = v20;
        [v20 setObject:*MEMORY[0x1E4F1CFD0] forKey:@"AllowJavascript"];
        v37 = [v16 objectForKey:@"HTMLWidth"];
        uint64_t v38 = [v16 objectForKey:@"HTMLHeight"];
        int v39 = (void *)v38;
        if (v37)
        {
          if (v38)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v36 setObject:v37 forKey:@"Width"];
                [v36 setObject:v39 forKey:@"Height"];
              }
            }
          }
        }
        *a5 = CFRetain(v19);
        *a6 = CFRetain(v36);
      }
    }

    return;
  }
LABEL_13:
  v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QuickLookDomain" code:897 userInfo:0];
  QLPreviewRequestSetError(a1, v48);
}

uint64_t OIGeneratePreviewForURLIfWrongContent(uint64_t a1, __QLPreviewRequest *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = (void *)MEMORY[0x1E4F28CB0];
  CFIndex v9 = [a3 path];
  id v10 = [v8 fileHandleForReadingAtPath:v9];

  if (v10)
  {
    id v11 = (NSObject **)MEMORY[0x1E4F945F0];
    id v12 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, " #Conversion", (uint8_t *)v19, 2u);
    }
    CFDataRef v13 = [v10 readDataOfLength:5];
    double v14 = v13;
    if (v13 && [v13 length] == 5)
    {
      uint64_t v20 = 0;
      memset(v19, 0, sizeof(v19));
      [v14 getBytes:v19 length:5];
      if (!strncasecmp((const char *)v19, "<html", 5uLL))
      {
        CFDataRef v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:0];
        if (v16)
        {
          uint64_t v17 = [(id)*MEMORY[0x1E4F443F0] identifier];
          QLPreviewRequestSetDataRepresentation(a2, v16, v17, 0);
        }
      }
      else if (!strncasecmp((const char *)v19, "{\\rtf", 5uLL))
      {
        uint64_t v15 = RTFGeneratePreviewForURL(a1, a2, (uint64_t)a3, a4);
LABEL_16:

        [v10 closeFile];
        goto LABEL_17;
      }
    }
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

void sub_1E2825DB8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x1E2825D58);
  }
  _Unwind_Resume(exception_object);
}

const void *OIGenerateAtomicPreviewForData(uint64_t a1, void *a2, const __CFData *a3, void *a4, void *a5)
{
  if (!_QLGetOfficeFileTypeFromUTI(a4)) {
    return 0;
  }
  id v10 = (NSObject **)MEMORY[0x1E4F945F0];
  id v11 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    id v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  CFDictionaryRef properties = 0;
  *(void *)buf = 0;
  QLOfficeCalculatePreview(a2, (uint64_t)a3, 0, a4, (CFTypeRef *)buf, (CFTypeRef *)&properties, [a5 objectForKey:@"URLBase"], 0);
  CFDataRef v12 = *(const __CFData **)buf;
  if (*(void *)buf)
  {
    CFDataRef v13 = [(id)*MEMORY[0x1E4F443F0] identifier];
    double v14 = properties;
    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v12, v13, properties);

    CFRelease(v12);
    if (v14)
    {
      CFRelease(v14);
      return 0;
    }
  }
  else
  {
    double v14 = (const void *)OIGeneratePreviewForDataIfWrongContent(a1, (__QLPreviewRequest *)a2, a3, (uint64_t)a4);
    if (v14)
    {
      CFDataRef v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QuickLookDomain" code:897 userInfo:0];
      QLPreviewRequestSetError(a2, v16);
    }
  }
  return v14;
}

uint64_t OIGeneratePreviewForDataIfWrongContent(uint64_t a1, __QLPreviewRequest *a2, CFDataRef theData, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (CFDataGetLength(theData) < 5) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v9 = (NSObject **)MEMORY[0x1E4F945F0];
  id v10 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v10, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  uint64_t v18 = 0;
  *(_OWORD *)buf = 0u;
  long long v17 = 0u;
  [(__CFData *)theData getBytes:buf length:5];
  if (!strncasecmp((const char *)buf, "<html", 5uLL))
  {
    CFDataRef v13 = *v9;
    if (!*v9)
    {
      QLSInitLogging();
      CFDataRef v13 = *v9;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1E2805000, v13, OS_LOG_TYPE_DEFAULT, "It's an HTML #Conversion", v15, 2u);
    }
    double v14 = [(id)*MEMORY[0x1E4F443F0] identifier];
    QLPreviewRequestSetDataRepresentation(a2, theData, v14, 0);

    return 0;
  }
  else
  {
    int v11 = strncasecmp((const char *)buf, "{\\rtf", 5uLL);
    CFDataRef v12 = *v9;
    if (v11)
    {
      if (!v12)
      {
        QLSInitLogging();
        CFDataRef v12 = *v9;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, "Returning false #Conversion", v15, 2u);
      }
      return 0xFFFFFFFFLL;
    }
    if (!v12)
    {
      QLSInitLogging();
      CFDataRef v12 = *v9;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, "It's an RTF #Conversion", v15, 2u);
    }
    return RTFGeneratePreviewForData(a1, a2, (uint64_t)theData, a4);
  }
}

uint64_t _QLGetOfficeFileTypeFromUTI(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"com.microsoft.word.doc"]
    && [v1 caseInsensitiveCompare:@"com.microsoft.word.dot"])
  {
    if ([v1 caseInsensitiveCompare:@"org.openxmlformats.wordprocessingml.document"]
      && [v1 caseInsensitiveCompare:@"org.openxmlformats.wordprocessingml.template"]
      && [v1 caseInsensitiveCompare:@"org.openxmlformats.wordprocessingml.document.macroenabled"]
      && [v1 caseInsensitiveCompare:@"org.openxmlformats.wordprocessingml.template.macroenabled"])
    {
      if ([v1 caseInsensitiveCompare:@"com.microsoft.excel.xls"]
        && [v1 caseInsensitiveCompare:@"com.microsoft.excel.xlt"]
        && [v1 caseInsensitiveCompare:@"com.microsoft.excel.xla"])
      {
        if ([v1 caseInsensitiveCompare:@"org.openxmlformats.spreadsheetml.sheet"]
          && [v1 caseInsensitiveCompare:@"org.openxmlformats.spreadsheetml.template"]
          && [v1 caseInsensitiveCompare:@"org.openxmlformats.spreadsheetml.sheet.macroenabled"]
          && [v1 caseInsensitiveCompare:@"org.openxmlformats.spreadsheetml.template.macroenabled"])
        {
          if ([v1 caseInsensitiveCompare:@"com.microsoft.powerpoint.ppt"]
            && [v1 caseInsensitiveCompare:@"com.microsoft.powerpoint.pps"]
            && [v1 caseInsensitiveCompare:@"com.microsoft.powerpoint.pot"])
          {
            if ([v1 caseInsensitiveCompare:@"org.openxmlformats.presentationml.presentation"]
              && [v1 caseInsensitiveCompare:@"org.openxmlformats.presentationml.template.macroenabled"]&& objc_msgSend(v1, "caseInsensitiveCompare:", @"org.openxmlformats.presentationml.template")&& objc_msgSend(v1, "caseInsensitiveCompare:", @"org.openxmlformats.presentationml.presentation.macroenabled")&& objc_msgSend(v1, "caseInsensitiveCompare:", @"org.openxmlformats.presentationml.slideshow")&& objc_msgSend(v1, "caseInsensitiveCompare:", @"org.openxmlformats.presentationml.slideshow.macroenabled"))
            {
              if ([v1 caseInsensitiveCompare:@"public.comma-separated-values-text"]) {
                uint64_t v2 = 0;
              }
              else {
                uint64_t v2 = 7;
              }
            }
            else
            {
              uint64_t v2 = 6;
            }
          }
          else
          {
            uint64_t v2 = 5;
          }
        }
        else
        {
          uint64_t v2 = 4;
        }
      }
      else
      {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t QLOIPreviewStartData(uint64_t a1, const char *a2, uint64_t a3)
{
  *(unsigned char *)a1 = 1;
  return QLPreviewRequestStartDataRepresentation(*(void **)(a1 + 8), a2, a3);
}

CFTypeRef QLOIPreviewCreateAttachmentURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return QLPreviewRequestCreateAttachmentURL(*(void **)(a1 + 8), a2, a3);
}

uint64_t QLOIPreviewAppendDataToAttachment(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  return QLPreviewRequestAppendDataToAttachment(*(void **)(a1 + 8), a2, a3, a4);
}

BOOL QLOIPreviewShouldContinue(uint64_t a1)
{
  return QLPreviewRequestIsCancelled(*(QLPreviewRequestRef *)(a1 + 8)) == 0;
}

void QLOIPreviewRequestSetError(uint64_t a1, char *err)
{
  if (CFErrorGetCode((CFErrorRef)err) == 1)
  {
    uint64_t v4 = (const char *)CFErrorCreate(0, @"QuickLookErrorDomain", 4, 0);
    QLPreviewRequestSetError(*(void **)(a1 + 8), v4);
    CFRelease(v4);
  }
  else
  {
    CFURLRef v5 = *(void **)(a1 + 8);
    QLPreviewRequestSetError(v5, err);
  }
}

uint64_t OIGenerateProgressivePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, void *a3, void *a4, const __CFDictionary *a5)
{
  id v10 = (NSObject **)MEMORY[0x1E4F945F0];
  int v11 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    int v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  *(_OWORD *)buf = xmmword_1F3DC9538;
  long long v19 = *(_OWORD *)off_1F3DC9548;
  uint64_t v20 = off_1F3DC9558;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a5);
  if (CFDictionaryGetValue(a5, @"Password"))
  {
    gotLoadHelper_x8__kOIPreviewOptionsPassphrase(v13);
    CFDictionarySetValue(MutableCopy, **(const void ***)(v14 + 2648), v15);
  }
  int inited = OIPreviewProcessWithURLAndOptions_delayInitStub(v13);
  CFRelease(MutableCopy);
  if (inited == 64257) {
    return 4;
  }
  else {
    return OIGeneratePreviewForURLIfWrongContent(a1, a2, a3, a4);
  }
}

uint64_t OIGenerateProgressivePreviewForData(uint64_t a1, __QLPreviewRequest *a2, const __CFData *a3, uint64_t a4, const __CFDictionary *a5)
{
  id v10 = (NSObject **)MEMORY[0x1E4F945F0];
  int v11 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    int v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  *(_OWORD *)buf = xmmword_1F3DC9538;
  long long v19 = *(_OWORD *)off_1F3DC9548;
  uint64_t v20 = off_1F3DC9558;
  if (a5) {
    CFDictionaryGetValue(a5, @"FileName");
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a5);
  if (CFDictionaryGetValue(a5, @"Password"))
  {
    gotLoadHelper_x8__kOIPreviewOptionsPassphrase(v13);
    CFDictionarySetValue(MutableCopy, **(const void ***)(v14 + 2648), v15);
  }
  int inited = OIPreviewProcessWithDataAndOptions_delayInitStub(v13);
  CFRelease(MutableCopy);
  if (inited == 64257) {
    return 4;
  }
  else {
    return OIGeneratePreviewForDataIfWrongContent(a1, a2, a3, a4);
  }
}

id _QLRemoveSpaces(void *a1)
{
  id v1 = [a1 stringByRemovingPercentEncoding];
  if (([v1 hasPrefix:@" "] & 1) != 0 || objc_msgSend(v1, "hasSuffix:", @" "))
  {
    uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" "];
    id v3 = [v1 stringByTrimmingCharactersInSet:v2];
  }
  else
  {
    id v3 = v1;
  }

  return v3;
}

uint64_t QLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  CFURLRef v5 = [v3 path];
  id v6 = [v5 lastPathComponent];

  if (!v6
    || ([v6 pathExtension],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        !v8))
  {
    CFIndex v9 = [v3 resourceSpecifier];
    id v10 = [v9 lastPathComponent];

    int v11 = [v10 pathExtension];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      id v13 = v10;

      id v6 = v13;
    }
  }
  uint64_t v14 = _QLTypeCopyUTIForFileNameAndMimeType(v6, v4);
  uint64_t v15 = (NSObject **)MEMORY[0x1E4F945F0];
  CFDataRef v16 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    CFDataRef v16 = *v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    long long v17 = v16;
    uint64_t v18 = [v3 description];
    int v20 = 138412802;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1E2805000, v17, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v20, 0x20u);
  }
  return v14;
}

uint64_t _QLTypeCopyUTIForFileNameAndMimeType(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  CFURLRef v5 = [v3 pathExtension];
  id v6 = [v5 lowercaseString];
  id v7 = _QLRemoveSpaces(v6);

  uint64_t v8 = [v4 lowercaseString];
  int v9 = [(__CFString *)v8 isEqualToString:@"text/plain"] ^ 1;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v8];
    if ([v10 isDynamic])
    {

      id v10 = 0;
    }
  }
  else if ([v7 isEqualToString:@"lpdf"])
  {
    id v10 = (id)*MEMORY[0x1E4F44390];
    uint64_t v8 = 0;
  }
  else
  {
    id v10 = (id)*MEMORY[0x1E4F44378];
    int v9 = 0;
    uint64_t v8 = @"application/octet-stream";
  }
  int v11 = _QLCopyPackageExtensionIfIsArchiveFileName(v3);
  if ([v11 length])
  {
    id v12 = v11;

    id v13 = (id)*MEMORY[0x1E4F44468];
    if (!v12)
    {
      id v7 = 0;
      goto LABEL_28;
    }
    CFIndex v28 = v11;
    id v14 = v12;
    goto LABEL_17;
  }
  if (![(__CFString *)v8 hasSuffix:@"zip"])
  {
    id v13 = v10;
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  id v13 = (id)*MEMORY[0x1E4F44378];

  if (v7)
  {
LABEL_15:
    CFIndex v28 = v11;
    if (!v9)
    {
      id v14 = v7;
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:");
LABEL_18:
      id v16 = v15;
      if ([v15 isDynamic])
      {
LABEL_19:

LABEL_27:
        id v7 = v14;
        int v11 = v28;
        goto LABEL_28;
      }
      if (v4)
      {
        long long v17 = [v16 identifier];
        if ((_QLUTIIsScriptableMediaType((uint64_t)v17) & 1) == 0)
        {

          if (!v16) {
            goto LABEL_27;
          }
          goto LABEL_24;
        }
        uint64_t v18 = [v13 identifier];
        int v19 = _QLUTIIsScriptableMediaType((uint64_t)v18);

        if (!v19) {
          goto LABEL_19;
        }
      }
      if (!v16) {
        goto LABEL_27;
      }
LABEL_24:

      int v20 = 0;
      id v7 = v14;
      int v11 = v28;
LABEL_30:
      if (([v16 isDynamic] & 1) == 0
        && ([v16 isEqual:*MEMORY[0x1E4F44378]] & 1) == 0
        && ![v16 isEqual:*MEMORY[0x1E4F444F0]])
      {
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    id v14 = v7;
    id v12 = v7;
LABEL_17:
    uint64_t v15 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v12 conformingToType:v13];
    goto LABEL_18;
  }
LABEL_28:
  id v21 = v13;
  id v16 = v21;
  if (v21)
  {
    int v20 = v21;
    goto LABEL_30;
  }
  int v20 = 0;
LABEL_35:
  __int16 v22 = (void *)_QLTypeCopyPrivateUTIFromFileNameAndMimeType(v3, v4);
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v22];

    id v16 = (id)v23;
  }

  if (!v16) {
    id v16 = (id)*MEMORY[0x1E4F44378];
  }
LABEL_39:
  __int16 v24 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v25 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v25 = *v24;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v3;
    __int16 v31 = 2112;
    id v32 = v4;
    __int16 v33 = 2112;
    id v34 = v16;
    _os_log_impl(&dword_1E2805000, v25, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", buf, 0x20u);
  }
  uint64_t v26 = [v16 identifier];

  return v26;
}

__CFString *QLTypeCopyBestMimeTypeForFileNameAndMimeType(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  CFURLRef v5 = (void *)_QLTypeCopyUTIForFileNameAndMimeType(v3, v4);
  id v6 = _QLTypeCopyBestMimeTypeForUTI(v5);
  id v7 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v8 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

__CFString *_QLTypeCopyBestMimeTypeForUTI(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 isEqualToString:@"public.data"])
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (!v1
      || ([MEMORY[0x1E4F442D8] typeWithIdentifier:v1],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 preferredMIMEType],
          uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v3,
          !v2))
    {
      _QLGetMimeTypeForContentType(v1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if ([(__CFString *)v2 isEqualToString:@"text/rtf"])
    {

      uint64_t v2 = @"application/rtf";
    }
    id v4 = (NSObject **)MEMORY[0x1E4F945F0];
    CFURLRef v5 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      CFURLRef v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v1;
      __int16 v9 = 2112;
      int v10 = v2;
      _os_log_impl(&dword_1E2805000, v5, OS_LOG_TYPE_INFO, "(%@) -> %@ #UTI", (uint8_t *)&v7, 0x16u);
    }
  }

  return v2;
}

__CFString *QLTypeCopyBestMimeTypeForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  CFURLRef v5 = (void *)QLTypeCopyUTIForURLAndMimeType(v3, v4);
  id v6 = _QLTypeCopyBestMimeTypeForUTI(v5);
  int v7 = (NSObject **)MEMORY[0x1E4F945F0];
  id v8 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = v8;
    int v10 = [v3 description];
    int v12 = 138412802;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v6;
    _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v12, 0x20u);
  }
  return v6;
}

uint64_t _QLUTIIsScriptableMediaType(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  if ([v1 conformsToType:*MEMORY[0x1E4F443F0]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F44450]];
  }

  return v2;
}

id _QLCopyArchiveExtensionIfIsArchiveFileName(void *a1)
{
  id v1 = [a1 pathExtension];
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v1];
    if ([v2 conformsToType:*MEMORY[0x1E4F44328]]) {
      id v3 = v1;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id _QLCopyPackageExtensionIfIsArchiveFileName(void *a1)
{
  id v1 = a1;
  id v2 = _QLCopyArchiveExtensionIfIsArchiveFileName(v1);
  if (![v2 length]
    || (uint64_t v3 = [v1 rangeOfString:v2 options:4], v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v4 = 0;
    goto LABEL_12;
  }
  CFURLRef v5 = [v1 substringToIndex:v3 - 1];
  id v6 = [v5 pathExtension];
  id v4 = _QLRemoveSpaces(v6);

  if (v4)
  {
    if ([v4 length])
    {
      int v7 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v4 conformingToType:*MEMORY[0x1E4F44468]];
      id v8 = v7;
      if (v7 && ![v7 isDynamic]) {
        goto LABEL_11;
      }
    }
    id v8 = v4;
    id v4 = 0;
  }
  else
  {
    id v8 = 0;
  }
LABEL_11:

LABEL_12:
  return v4;
}

uint64_t _QLTypeCopyPrivateUTIFromFileNameAndMimeType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFURLRef v5 = v4;
  if (!v3)
  {
    uint64_t v14 = 0;
    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v6 = [v3 pathExtension];
  if (v6)
  {
    int v7 = _QLCopyPackageExtensionIfIsArchiveFileName(v3);
    if ([v7 length]
      && (uint64_t v8 = [v3 rangeOfString:v7 options:4], v8 != 0x7FFFFFFFFFFFFFFFLL)
      && ([v3 substringFromIndex:v8], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v10 = (void *)v9;
      uint64_t v11 = _QLTypeGetKnownExtensions();
      int v12 = v11;
      id v13 = v10;
    }
    else
    {
      int v10 = _QLTypeGetKnownExtensions();
      int v12 = [v6 lowercaseString];
      uint64_t v11 = v10;
      id v13 = v12;
    }
    uint64_t v14 = [v11 objectForKeyedSubscript:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  if (v5)
  {
LABEL_13:
    if (!v14)
    {
      id v15 = [v5 lowercaseString];
      __int16 v16 = _QLTypeGetKnownMimeTypes();
      uint64_t v14 = [v16 objectForKeyedSubscript:v15];
    }
  }
LABEL_15:

  return v14;
}

id _QLToolsGetKnownUTIs()
{
  if (_QLToolsGetKnownUTIs_onceToken != -1) {
    dispatch_once(&_QLToolsGetKnownUTIs_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_QLToolsGetKnownUTIs__knownUTIs;
  return v0;
}

id _QLGetMimeTypeForContentType(void *a1)
{
  id v1 = a1;
  id v2 = _QLToolsGetKnownUTIs();
  id v3 = [v1 lowercaseString];

  id v4 = [v2 objectForKey:v3];
  CFURLRef v5 = [v4 objectForKey:@"mime type"];

  return v5;
}

id _QLTypeGetKnownExtensions()
{
  v0 = (void *)_knownExtensions;
  if (!_knownExtensions)
  {
    id v1 = QLFrameworkBundle();
    id v2 = [v1 URLForResource:@"KnownExtensions" withExtension:@"plist"];

    if (v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2];
      id v4 = (void *)_knownExtensions;
      _knownExtensions = v3;
    }
    if (!_knownExtensions)
    {
      _knownExtensions = MEMORY[0x1E4F1CC08];
    }
    v0 = (void *)_knownExtensions;
  }
  return v0;
}

id _QLTypeGetKnownMimeTypes()
{
  v0 = (void *)_knownMimeTypes;
  if (!_knownMimeTypes)
  {
    id v1 = QLFrameworkBundle();
    id v2 = [v1 URLForResource:@"KnownMimeTypes" withExtension:@"plist"];

    if (v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2];
      id v4 = (void *)_knownMimeTypes;
      _knownMimeTypes = v3;
    }
    if (!_knownMimeTypes)
    {
      _knownMimeTypes = MEMORY[0x1E4F1CC08];
    }
    v0 = (void *)_knownMimeTypes;
  }
  return v0;
}

uint64_t _QLContentTypeConformsToContentTypeInSet(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___QLContentTypeConformsToContentTypeInSet_block_invoke;
  v8[3] = &unk_1E6DD3CB0;
  id v5 = v3;
  id v9 = v5;
  int v10 = &v11;
  [v4 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1E282791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLContentTypeConformsToRawImage(void *a1, const char *a2)
{
  return [a1 conformsToType:*MEMORY[0x1E4F44498]];
}

void QLRunInMainThread_cold_1()
{
  __assert_rtn("QLRunInMainThread", "QLUICUtilities.m", 31, "block != nil");
}

void QLRunInMainThreadSync_cold_1()
{
  __assert_rtn("QLRunInMainThreadSync", "QLUICUtilities.m", 42, "block != nil");
}

void QLRunInBackgroundThread_cold_1()
{
  __assert_rtn("QLRunInBackgroundThread", "QLUICUtilities.m", 54, "block != nil");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1F40D74C0](locArray);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1F40D74D8](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8810](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1F40D8938](anURL);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t QLFrameworkBundle()
{
  return MEMORY[0x1F41476A0]();
}

uint64_t QLGuessEncodingForTextFileAtURL()
{
  return MEMORY[0x1F41476B8]();
}

uint64_t QLGuessEncodingForTextFileFromData()
{
  return MEMORY[0x1F41476C0]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x1F41476C8]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1F40CB888]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1F40CB890](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1F40CB8A0](s, *(void *)&flag, src);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAE8](type, path, *(void *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

uint64_t BRNotificationNameForServerAvailabilityChanges_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CloudDocs)) {
    dlopenHelper_CloudDocs(a1);
  }
  return MEMORY[0x1F4111DB0]();
}

uint64_t OICopyHTMLThumbnailForOfficeData_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F20]();
}

uint64_t OICopyHTMLForOfficeData_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F10]();
}

uint64_t OICopyHTMLThumbnailFromFileAtURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F28]();
}

uint64_t OICopyHTMLFromFileAtURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F18]();
}

uint64_t OIPreviewProcessWithURLAndOptions_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F38]();
}

uint64_t OIPreviewProcessWithDataAndOptions_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    dlopenHelper_OfficeImport(a1);
  }
  return MEMORY[0x1F4139F30]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUIPrivate(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_OfficeImport(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CloudDocs(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___PUProgressIndicatorView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate)) {
    return dlopenHelper_PhotosUIPrivate(result);
  }
  return result;
}

double gotLoadHelper_x8__kOIPreviewOptionsPassphrase(double result)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport)) {
    return dlopenHelper_OfficeImport(result);
  }
  return result;
}
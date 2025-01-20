@interface FRFont
+ (BOOL)_shouldUnregisterFontWithFileURL:(id)a3;
+ (BOOL)_unregisterFontAtFileURL:(id)a3 error:(id *)a4;
+ (BOOL)registerFontWithURL:(id)a3 error:(id *)a4;
+ (id)_postScriptNameForFontAtFileURL:(id)a3;
+ (id)_referenceCountedSet;
+ (id)_registrationQueue;
+ (unint64_t)_referenceCountForFontWithFileURL:(id)a3;
+ (void)_decreaseReferenceCountForFontWithFileURL:(id)a3;
+ (void)_increaseReferenceCountForFontWithFileURL:(id)a3;
+ (void)unregisterFontWithURL:(id)a3;
@end

@implementation FRFont

+ (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079580();
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100018B50;
  v17[4] = sub_100018A30;
  id v18 = 0;
  v7 = [a1 _registrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B1AC;
  block[3] = &unk_1000C9988;
  id v12 = v6;
  v13 = v17;
  v14 = &v19;
  id v15 = a1;
  v16 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  char v9 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

+ (void)unregisterFontWithURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079648();
  }
  v5 = [a1 _registrationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B618;
  v7[3] = &unk_1000C98B8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)_increaseReferenceCountForFontWithFileURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007970C();
  }
  v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Increasing reference count for font at URL %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [a1 _referenceCountedSet];
  [v6 addObject:v4];
}

+ (void)_decreaseReferenceCountForFontWithFileURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079930();
  }
  v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decreasing reference count for font at URL %{public}@", buf, 0xCu);
  }
  id v6 = [a1 _referenceCountedSet];
  [v6 removeObject:v4];
  if ([a1 _shouldUnregisterFontWithFileURL:v4])
  {
    id v10 = 0;
    unsigned __int8 v7 = [a1 _unregisterFontAtFileURL:v4 error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079878();
    }
    id v9 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_1000797D0(v9, v8);
    }
  }
}

+ (unint64_t)_referenceCountForFontWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 _referenceCountedSet];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000799F4();
  }
  id v6 = [v5 countForObject:v4];

  return (unint64_t)v6;
}

+ (BOOL)_shouldUnregisterFontWithFileURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079AB8();
  }
  BOOL v5 = [a1 _referenceCountForFontWithFileURL:v4] == 0;

  return v5;
}

+ (BOOL)_unregisterFontAtFileURL:(id)a3 error:(id *)a4
{
  CFURLRef v5 = (const __CFURL *)a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079C40();
  }
  if (*a4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079B7C();
  }
  CFErrorRef error = 0;
  id v6 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFURLRef v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to unregister font at URL %{public}@", buf, 0xCu);
  }
  BOOL v7 = CTFontManagerUnregisterFontsForURL(v5, kCTFontManagerScopeProcess, &error);
  if (v7)
  {
    id v8 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFURLRef v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Font unregistration succeeded for font at URL %{public}@", buf, 0xCu);
    }
    id v9 = 0;
  }
  else
  {
    CFIndex Code = CFErrorGetCode(error);
    if ((unint64_t)(Code - 201) > 2)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"FRFontUnRegistationErrorDomain");
    }
    v11 = (void *)FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
    {
      v14 = v11;
      id v15 = +[NSNumber numberWithLong:Code];
      *(_DWORD *)buf = 138543874;
      CFURLRef v18 = v5;
      __int16 v19 = 2114;
      v20 = v9;
      __int16 v21 = 2114;
      char v22 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to unregister font at URL %{public}@ with error %{public}@ underlying error code: %{public}@", buf, 0x20u);
    }
  }
  if (error) {
    CFRelease(error);
  }
  id v12 = v9;
  *a4 = v12;

  return v7;
}

+ (id)_postScriptNameForFontAtFileURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079E74();
  }
  CFArrayRef FontDescriptorsFromURL = CTFontManagerCreateFontDescriptorsFromURL(v3);
  if (CFArrayGetCount(FontDescriptorsFromURL) != 1
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100079DBC();
  }
  ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(FontDescriptorsFromURL, 0);
  id v6 = (void *)CTFontDescriptorCopyAttribute(ValueAtIndex, kCTFontNameAttribute);
  CFTypeID v7 = CFGetTypeID(v6);
  if (v7 != CFStringGetTypeID() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079D04();
  }
  CFRelease(FontDescriptorsFromURL);
  id v8 = v6;
  CFRelease(v8);

  return v8;
}

+ (id)_referenceCountedSet
{
  if (qword_1000EE198 != -1) {
    dispatch_once(&qword_1000EE198, &stru_1000C99A8);
  }
  v2 = (void *)qword_1000EE1A0;

  return v2;
}

+ (id)_registrationQueue
{
  if (qword_1000EE1A8 != -1) {
    dispatch_once(&qword_1000EE1A8, &stru_1000C99C8);
  }
  v2 = (void *)qword_1000EE1B0;

  return v2;
}

@end
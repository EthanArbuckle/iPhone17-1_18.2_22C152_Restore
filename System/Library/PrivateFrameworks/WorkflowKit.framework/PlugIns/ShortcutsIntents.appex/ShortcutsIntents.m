uint64_t sub_100002194(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void sub_1000021A8(uint64_t a1, void *a2)
{
  uint64_t v3 = WFHandoffSourceKey;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:v3];
  v6 = (void *)v5;
  v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v4 objectForKey:WFHandoffWorkflowControllerStateKey];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002BF8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parameters];
  id v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = [v3 objectForKey:@"webpageURL"];
  v6 = [v3 objectForKey:@"userInfoURL"];
  v7 = +[NSURL URLWithString:v6];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100002D40;
  v12[3] = &unk_100008338;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v9;
  id v13 = v4;
  id v10 = v5;
  id v11 = v4;
  [v8 deserializeUserInfoAtURL:v7 completionHandler:v12];
}

uint64_t sub_100002D40(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

void sub_100002F0C(id a1)
{
  qword_10000E368 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
  _objc_release_x1();
}

id sub_10000316C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v5 = [*(id *)(a1 + 40) database];
    v6 = +[WFWorkflow workflowWithReference:v3 database:v5 error:0];

    [v6 actions];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "appDescriptor", (void)v16);
          id v13 = [v12 bundleIdentifier];

          if (v13 && [*(id *)(a1 + 32) containsObject:v13])
          {
            id v14 = [v3 shortcutOverview];

            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_14:
  }
  else
  {
    id v14 = [v3 shortcutOverview];
  }

  return v14;
}

NSString *__cdecl sub_100003350(id a1, INAppIdentifier *a2, unint64_t a3)
{
  return (NSString *)[(INAppIdentifier *)a2 bundleIdentifier];
}

WFFolder *__cdecl sub_10000358C(id a1, WFWorkflowCollection *a2, unint64_t a3)
{
  id v3 = a2;
  id v4 = [WFFolder alloc];
  uint64_t v5 = [(WFWorkflowCollection *)v3 identifier];
  v6 = [(WFWorkflowCollection *)v3 name];
  id v7 = [(WFFolder *)v4 initWithIdentifier:v5 displayString:v6];

  [(WFWorkflowCollection *)v3 glyphCharacter];
  id v8 = WFSystemImageNameForOutlineGlyphCharacter();
  if (v8)
  {
    id v9 = +[INImage systemImageNamed:v8];
    [(WFFolder *)v7 setDisplayImage:v9];
  }
  return v7;
}

id sub_1000038A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) shortcutFromWorkflowReference:v3];

  return v5;
}

void sub_100003FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100003FD0(uint64_t a1)
{
  v2 = sub_100004020();
  result = dlsym(v2, "CGImageDestinationCreateWithData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000E378 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004020()
{
  v4[0] = 0;
  if (!qword_10000E380)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100004214;
    v4[4] = &unk_100008500;
    v4[5] = v4;
    long long v5 = off_1000084E8;
    uint64_t v6 = 0;
    qword_10000E380 = _sl_dlopen();
  }
  v0 = (void *)qword_10000E380;
  if (!qword_10000E380)
  {
    v0 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"void *ImageIOLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFShortcutsWidgetConfigurationIntentHandler.m", 26, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *sub_100004174(uint64_t a1)
{
  v2 = sub_100004020();
  result = dlsym(v2, "CGImageDestinationAddImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000E388 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000041C4(uint64_t a1)
{
  v2 = sub_100004020();
  result = dlsym(v2, "CGImageDestinationFinalize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000E390 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004214()
{
  uint64_t result = _sl_dlopen();
  qword_10000E380 = result;
  return result;
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CFRelease(CFTypeRef cf)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WFLocalizedAllShortcutsString()
{
  return _WFLocalizedAllShortcutsString();
}

uint64_t WFSystemImageNameForOutlineGlyphCharacter()
{
  return _WFSystemImageNameForOutlineGlyphCharacter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_PNGRepresentation(void *a1, const char *a2, ...)
{
  return [a1 PNGRepresentation];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend__codableDescription(void *a1, const char *a2, ...)
{
  return [a1 _codableDescription];
}

id objc_msgSend__intentInstanceDescription(void *a1, const char *a2, ...)
{
  return [a1 _intentInstanceDescription];
}

id objc_msgSend__type(void *a1, const char *a2, ...)
{
  return [a1 _type];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_allShortcutsFolder(void *a1, const char *a2, ...)
{
  return [a1 allShortcutsFolder];
}

id objc_msgSend_appDescriptor(void *a1, const char *a2, ...)
{
  return [a1 appDescriptor];
}

id objc_msgSend_appTitles(void *a1, const char *a2, ...)
{
  return [a1 appTitles];
}

id objc_msgSend_associatedAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associatedAppBundleIdentifier];
}

id objc_msgSend_backgroundColorValue(void *a1, const char *a2, ...)
{
  return [a1 backgroundColorValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return [a1 buttons];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabase];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return [a1 descriptors];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_glyphCharacter(void *a1, const char *a2, ...)
{
  return [a1 glyphCharacter];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return [a1 mappedData];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_selectedButton(void *a1, const char *a2, ...)
{
  return [a1 selectedButton];
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 sharedAppGroupDirectoryURL];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shortcutOverview(void *a1, const char *a2, ...)
{
  return [a1 shortcutOverview];
}

id objc_msgSend_sortedVisibleFolders(void *a1, const char *a2, ...)
{
  return [a1 sortedVisibleFolders];
}

id objc_msgSend_sortedVisibleWorkflowsByName(void *a1, const char *a2, ...)
{
  return [a1 sortedVisibleWorkflowsByName];
}

id objc_msgSend_standardClient(void *a1, const char *a2, ...)
{
  return [a1 standardClient];
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return [a1 typeName];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
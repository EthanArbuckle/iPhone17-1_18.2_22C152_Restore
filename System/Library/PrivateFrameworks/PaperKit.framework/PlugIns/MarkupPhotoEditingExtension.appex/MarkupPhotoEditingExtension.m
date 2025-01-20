void MarkupPhotoExtensionInitialize()
{
  objc_class *v0;
  uint64_t vars8;

  v0 = (objc_class *)sub_1000015A8();
  objc_registerClassPair(v0);
}

id sub_1000015A8()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100008A88;
  uint64_t v7 = qword_100008A88;
  if (!qword_100008A88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100002260;
    v3[3] = &unk_100004210;
    v3[4] = &v4;
    sub_100002260((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100001674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000019B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001C04(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = [*(id *)(a1 + 32) markupVC];
    [v3 setAnnotationEditingEnabled:0];

    uint64_t v4 = [v6 localizedDescription];
    NSLog(@"Encountered error while trying to load content: %@", v4);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) accessibilityDescription];
    v5 = [*(id *)(a1 + 32) markupVC];
    [v5 setImageDescription:v4];
  }
}

void sub_100001D9C(uint64_t a1)
{
  id v2 = objc_alloc((Class)PHContentEditingOutput);
  v3 = [*(id *)(a1 + 32) input];
  id v4 = [v2 initWithContentEditingInput:v3];

  v5 = [*(id *)(a1 + 32) markupVC];
  id v6 = [v5 createArchivedModelData];

  id v7 = [objc_alloc((Class)PHAdjustmentData) initWithFormatIdentifier:@"com.apple.PaperKit.Markup" formatVersion:@"1.0" data:v6];
  [v4 setAdjustmentData:v7];
  v8 = [*(id *)(a1 + 32) markupVC];
  v9 = [v8 imageDescription];
  [v4 setAccessibilityDescription:v9];

  v10 = [*(id *)(a1 + 32) markupVC];
  v11 = [v4 renderedContentURL];
  [v10 writeToURL:v11 embeddingSourceImageAndEditModel:0 contentType:UTTypeJPEG error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001F50;
  block[3] = &unk_1000041C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100001F50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) markupVC];
  [v2 documentDidCloseTeardown];

  v3 = *(void **)(a1 + 32);
  return [v3 setIsWritingOutputDoNotTearDown:0];
}

Class sub_100002260(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008A90)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000023A4;
    v3[4] = &unk_100004248;
    void v3[5] = v3;
    long long v4 = off_100004230;
    uint64_t v5 = 0;
    qword_100008A90 = _sl_dlopen();
    if (!qword_100008A90)
    {
      abort_report_np();
LABEL_8:
      sub_1000025D0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("PHEditingExtensionContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008A88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000023A4()
{
  uint64_t result = _sl_dlopen();
  qword_100008A90 = result;
  return result;
}

Class sub_100002418(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008AA0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10000255C;
    v3[4] = &unk_100004248;
    void v3[5] = v3;
    long long v4 = off_100004268;
    uint64_t v5 = 0;
    qword_100008AA0 = _sl_dlopen();
    if (!qword_100008AA0)
    {
      abort_report_np();
LABEL_8:
      sub_1000025F8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("PPKMarkupViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008A98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000255C()
{
  uint64_t result = _sl_dlopen();
  qword_100008AA0 = result;
  return result;
}

void sub_1000025D0()
{
  uint64_t v0 = abort_report_np();
  sub_1000025F8(v0);
}

void sub_1000025F8()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
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

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__shouldShowUndoRedoButtonsInNavigationBar(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowUndoRedoButtonsInNavigationBar];
}

id objc_msgSend__updateUndoRedoButtons(void *a1, const char *a2, ...)
{
  return [a1 _updateUndoRedoButtons];
}

id objc_msgSend_accessibilityDescription(void *a1, const char *a2, ...)
{
  return [a1 accessibilityDescription];
}

id objc_msgSend_adjustmentData(void *a1, const char *a2, ...)
{
  return [a1 adjustmentData];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_createArchivedModelData(void *a1, const char *a2, ...)
{
  return [a1 createArchivedModelData];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_documentDidCloseTeardown(void *a1, const char *a2, ...)
{
  return [a1 documentDidCloseTeardown];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_formatIdentifier(void *a1, const char *a2, ...)
{
  return [a1 formatIdentifier];
}

id objc_msgSend_fullSizeImageURL(void *a1, const char *a2, ...)
{
  return [a1 fullSizeImageURL];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_imageDescription(void *a1, const char *a2, ...)
{
  return [a1 imageDescription];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_isWritingOutputDoNotTearDown(void *a1, const char *a2, ...)
{
  return [a1 isWritingOutputDoNotTearDown];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_markupVC(void *a1, const char *a2, ...)
{
  return [a1 markupVC];
}

id objc_msgSend_renderedContentURL(void *a1, const char *a2, ...)
{
  return [a1 renderedContentURL];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return [a1 undoManager];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_writeToURL_embeddingSourceImageAndEditModel_contentType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:embeddingSourceImageAndEditModel:contentType:error:");
}
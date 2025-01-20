void sub_100002878(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = objc_alloc((Class)TFContainer);
  v2 = [objc_alloc((Class)NUExtensionFrameworkAssembly) initWithExtensionContextProvider:0];
  v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = [v1 initWithBundleAssemblies:v3 assemblies:&__NSArray0__struct];
  v5 = (void *)qword_100008840;
  qword_100008840 = (uint64_t)v4;
}

void sub_100002CD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[NSError naq_errorFailedValidationForIdentifier:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_articleContainerViewController(void *a1, const char *a2, ...)
{
  return [a1 articleContainerViewController];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_previewItemCallback(void *a1, const char *a2, ...)
{
  return [a1 previewItemCallback];
}

id objc_msgSend_previewItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 previewItemIdentifier];
}

id objc_msgSend_resolver(void *a1, const char *a2, ...)
{
  return [a1 resolver];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}
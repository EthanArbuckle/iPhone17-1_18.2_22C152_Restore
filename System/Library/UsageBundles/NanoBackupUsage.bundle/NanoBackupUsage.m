void sub_363C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void v7[4];
  void *v8;

  v2 = objc_opt_new();
  v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)v5[2];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_36EC;
  v7[3] = &unk_8280;
  v8 = v5;
  [v6 listBackupsOfType:1 withSynchronousCompletionHandler:v7];
}

void sub_36EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 uuid];

        if (v9)
        {
          v10 = *(void **)(*(void *)(a1 + 32) + 8);
          v11 = [v8 uuid];
          [v10 setObject:v8 forKeyedSubscript:v11];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void sub_39D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_39F4(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3AA8;
  v5[3] = &unk_82D0;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = *(void *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_3AA8(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = a2;
  id v6 = [v13 name];
  id v7 = [v5 UUIDString];

  uint64_t v8 = +[PSUsageBundleCategory categoryNamed:v6 withIdentifier:v7 forUsageBundleApp:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v8];
  [v8 setNanoBackup:v13];
  uint64_t v9 = [v13 sizeInBytes];
  if (![v9 unsignedLongLongValue])
  {

    uint64_t v9 = &off_85B0;
  }
  v10 = *(void **)(*(void *)(a1 + 48) + 40);
  v11 = [v13 uuid];
  long long v12 = [v11 UUIDString];
  [v10 setObject:v9 forKeyedSubscript:v12];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v9 unsignedLongLongValue];
}

int64_t sub_3BF4(id a1, PSUsageBundleCategory *a2, PSUsageBundleCategory *a3)
{
  uint64_t v4 = a3;
  id v5 = [(PSUsageBundleCategory *)a2 nanoBackup];
  id v6 = [v5 sizeInBytes];
  id v7 = [(PSUsageBundleCategory *)v4 nanoBackup];

  uint64_t v8 = [v7 sizeInBytes];
  int64_t v9 = -(uint64_t)[v6 compare:v8];

  return v9;
}

uint64_t sub_3E6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3E7C(uint64_t a1)
{
}

void sub_3E84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  uint64_t v4 = [*(id *)(v2 + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = [v3 deleteBackup:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v8 = [*(id *)(a1 + 48) usageBundleApp];
    int64_t v9 = [v8 categories];
    [v9 removeObject:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 64)) {
    **(void **)(a1 + 64) = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
}

id sub_4660(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAllBackups];
}

void sub_4908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4934(uint64_t a1)
{
}

void sub_493C(uint64_t a1, void *a2)
{
}

void sub_494C(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__specifiers) objectAtIndexedSubscript:a2];
  id v3 = [v10 propertyForKey:PSUsageBundleCategoryKey];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 usageBundleApp];
    uint64_t v6 = [v5 categories];
    [v6 removeObject:v4];

    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v4 nanoBackup];
    id v9 = [v7 deleteBackup:v8];
  }
}

uint64_t BPSLocalizedNameForMaterial()
{
  return _BPSLocalizedNameForMaterial();
}

uint64_t BPSLocalizedVariantSizeForProductType()
{
  return _BPSLocalizedVariantSizeForProductType();
}

uint64_t BPSPBMaterialForMGMaterial()
{
  return _BPSPBMaterialForMGMaterial();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastModificationDate(void *a1, const char *a2, ...)
{
  return [a1 lastModificationDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nanoBackup(void *a1, const char *a2, ...)
{
  return [a1 nanoBackup];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_populateUsageBundleApps(void *a1, const char *a2, ...)
{
  return [a1 populateUsageBundleApps];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 sizeInBytes];
}

id objc_msgSend_sizeLabel(void *a1, const char *a2, ...)
{
  return [a1 sizeLabel];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topEnclosureMaterial(void *a1, const char *a2, ...)
{
  return [a1 topEnclosureMaterial];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_usageBundleApp(void *a1, const char *a2, ...)
{
  return [a1 usageBundleApp];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}
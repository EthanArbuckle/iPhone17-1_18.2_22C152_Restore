id sub_37C8(uint64_t a1)
{
  void *v1;
  void v3[5];

  v1 = *(void **)(*(void *)(a1 + 32) + 160);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3844;
  v3[3] = &unk_81E0;
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "ax_removeObjectsFromArrayUsingBlock:", v3);
}

BOOL sub_3844(uint64_t a1, void *a2)
{
  return [a2 type] == *(id *)(a1 + 32);
}

double *sub_3910(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == (char *)&dword_0 + 2)
  {
    [*(id *)(*(void *)(a1 + 40) + 160) insertObject:*(void *)(a1 + 32) atIndex:0];
  }
  else if ([*(id *)(a1 + 32) type] == (char *)&dword_0 + 1)
  {
    v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "canvasRow"));
    v3 = [v2 data];
    v4 = [*(id *)(a1 + 32) data];
    unsigned __int8 v5 = [v3 isEqualToData:v4];

    if ((v5 & 1) == 0) {
      [*(id *)(*(void *)(a1 + 40) + 160) addObject:*(void *)(a1 + 32)];
    }
  }
  if ([*(id *)(*(void *)(a1 + 40) + 160) count] == (char *)&dword_0 + 1)
  {
    result = *(double **)(a1 + 40);
  }
  else
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    result = *(double **)(a1 + 40);
    if (Current - result[21] <= 1.0) {
      return result;
    }
  }

  return (double *)[result _dequeueData];
}

void sub_3AAC(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(void *)(v2 + 152)
      || (CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent(), v2 = *(void *)(a1 + 32), Current - *(double *)(v2 + 168) > 1.0))
    {
      id v6 = [*(id *)(v2 + 160) objectAtIndexedSubscript:0];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), v6);
      *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 168) = CFAbsoluteTimeGetCurrent();
      if ([v6 type] == (char *)&dword_0 + 1) {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setObject:atIndexedSubscript:", v6, objc_msgSend(v6, "canvasRow"));
      }
      v4 = *(void **)(*(void *)(a1 + 32) + 64);
      unsigned __int8 v5 = [v6 data];
      [v4 writeValue:v5 forCharacteristic:*(void *)(*(void *)(a1 + 32) + 72) type:0];

      [*(id *)(*(void *)(a1 + 32) + 160) removeObjectAtIndex:0];
    }
  }
}

id sub_4528(uint64_t a1)
{
  byte_D8F0 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_45B8;
  block[3] = &unk_8258;
  block[4] = v2;
  dispatch_async(v3, block);
  return [*(id *)(a1 + 32) _dequeueData];
}

void sub_45B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 152);
  *(void *)(v1 + 152) = 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _SCROD_BRAILLE_LOG()
{
  return __SCROD_BRAILLE_LOG();
}

uint64_t _SCROD_LOG()
{
  return __SCROD_LOG();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__dequeueData(void *a1, const char *a2, ...)
{
  return [a1 _dequeueData];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_brailleDriverDidReceiveInput(void *a1, const char *a2, ...)
{
  return [a1 brailleDriverDidReceiveInput];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_canvasHeight(void *a1, const char *a2, ...)
{
  return [a1 canvasHeight];
}

id objc_msgSend_canvasRow(void *a1, const char *a2, ...)
{
  return [a1 canvasRow];
}

id objc_msgSend_canvasWidth(void *a1, const char *a2, ...)
{
  return [a1 canvasWidth];
}

id objc_msgSend_cellHeight(void *a1, const char *a2, ...)
{
  return [a1 cellHeight];
}

id objc_msgSend_cellWidth(void *a1, const char *a2, ...)
{
  return [a1 cellWidth];
}

id objc_msgSend_central(void *a1, const char *a2, ...)
{
  return [a1 central];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return [a1 characteristics];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_displayCanvas(void *a1, const char *a2, ...)
{
  return [a1 displayCanvas];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_horizontalPinSpacing(void *a1, const char *a2, ...)
{
  return [a1 horizontalPinSpacing];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainCells(void *a1, const char *a2, ...)
{
  return [a1 mainCells];
}

id objc_msgSend_mainCellsLength(void *a1, const char *a2, ...)
{
  return [a1 mainCellsLength];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return [a1 peripheral];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unloadDriver(void *a1, const char *a2, ...)
{
  return [a1 unloadDriver];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verticalPinSpacing(void *a1, const char *a2, ...)
{
  return [a1 verticalPinSpacing];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_writeValue_forCharacteristic_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeValue:forCharacteristic:type:");
}
CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

uint64_t IMDHandleRecordCopyID()
{
  return _IMDHandleRecordCopyID();
}

uint64_t IMDMessageRecordBulkCopy()
{
  return _IMDMessageRecordBulkCopy();
}

uint64_t IMDMessageRecordCopyHandle()
{
  return _IMDMessageRecordCopyHandle();
}

uint64_t IMDMessageRecordCopyMessagesBetweenRowIDs()
{
  return _IMDMessageRecordCopyMessagesBetweenRowIDs();
}

uint64_t IMDMessageRecordCountMessages()
{
  return _IMDMessageRecordCountMessages();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}
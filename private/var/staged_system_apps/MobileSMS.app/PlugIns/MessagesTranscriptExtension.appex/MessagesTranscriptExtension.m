void sub_100001D80(id a1)
{
  uint64_t vars8;

  qword_100008E18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NSObject];

  _objc_release_x1();
}

void sub_100001E1C(id a1)
{
  qword_100008E28 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SLConversationExtensionHostProtocol];

  _objc_release_x1();
}

void sub_100002008(id a1)
{
  v1 = +[IMDaemonController sharedInstance];
  [v1 addListenerID:@"com.apple.MobileSMS.MessagesTranscriptExtension" capabilities:kFZListenerCapNotifications | kFZListenerCapManageStatus | kFZListenerCapChats | kFZListenerCapFileTransfers | kFZListenerCapIDQueries | kFZListenerCapOnDemandChatRegistry | kFZListenerCapMessageHistory | (kFZListenerCapModifyReadState | kFZListenerCapSendMessages)];

  v2 = +[IMDaemonController sharedInstance];
  [v2 blockUntilConnected];

  id v3 = +[IMDaemonController sharedInstance];
  [v3 _setBlocksConnectionAtResume:1];
}

void sub_100002120(id a1)
{
  id v1 = +[IMBalloonPluginManager sharedInstance];
}

void sub_100002148(id a1)
{
}

uint64_t CKIsRunningInMessagesTranscriptExtension()
{
  return _CKIsRunningInMessagesTranscriptExtension();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteProxy];
}

id objc_msgSend_requestDismissal(void *a1, const char *a2, ...)
{
  return [a1 requestDismissal];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}
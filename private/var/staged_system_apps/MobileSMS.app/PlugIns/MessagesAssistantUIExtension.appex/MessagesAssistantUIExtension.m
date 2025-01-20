void sub_100003AC0(id a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v1 = +[IMDaemonController sharedInstance];
  [v1 addListenerID:@"MessagesAssistantUIExtension" capabilities:kFZListenerCapTruncatedChatRegistry | CKListenerCapabilities()];

  v2 = +[IMDaemonController sharedInstance];
  [v2 blockUntilConnected];

  v3 = +[IMDaemonController sharedInstance];
  [v3 _setBlocksConnectionAtResume:1];
}

uint64_t sub_100003DF0(uint64_t a1, double a2, double a3)
{
  BOOL v3 = a3 != CGSizeZero.height || a2 != CGSizeZero.width;
  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, *(void *)(a1 + 32));
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t CKBalloonViewForClass()
{
  return _CKBalloonViewForClass();
}

uint64_t CKListenerCapabilities()
{
  return _CKListenerCapabilities();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__configureSnippetContentViewWithChatAndContactsForAvatarView(void *a1, const char *a2, ...)
{
  return [a1 _configureSnippetContentViewWithChatAndContactsForAvatarView];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_avatarNameFont(void *a1, const char *a2, ...)
{
  return [a1 avatarNameFont];
}

id objc_msgSend_balloonTextFont(void *a1, const char *a2, ...)
{
  return [a1 balloonTextFont];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_chatController(void *a1, const char *a2, ...)
{
  return [a1 chatController];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_connectIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 connectIfNeeded];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_conversationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 conversationIdentifier];
}

id objc_msgSend_conversationListContactImageDiameter(void *a1, const char *a2, ...)
{
  return [a1 conversationListContactImageDiameter];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_customIdentifier(void *a1, const char *a2, ...)
{
  return [a1 customIdentifier];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_desiredSize(void *a1, const char *a2, ...)
{
  return [a1 desiredSize];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hostedViewMaximumAllowedSize(void *a1, const char *a2, ...)
{
  return [a1 hostedViewMaximumAllowedSize];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_intentResponse(void *a1, const char *a2, ...)
{
  return [a1 intentResponse];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_orderedContactsForAvatarView(void *a1, const char *a2, ...)
{
  return [a1 orderedContactsForAvatarView];
}

id objc_msgSend_prepareForDisplay(void *a1, const char *a2, ...)
{
  return [a1 prepareForDisplay];
}

id objc_msgSend_prepareForDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 prepareForDisplayIfNeeded];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_speakableGroupName(void *a1, const char *a2, ...)
{
  return [a1 speakableGroupName];
}

id objc_msgSend_spokenPhrase(void *a1, const char *a2, ...)
{
  return [a1 spokenPhrase];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}
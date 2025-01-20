int64_t sub_18F4(id a1, id a2, id a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  [a2 doubleValue];
  v6 = v5;
  [a3 doubleValue];
  if (v6 > v7) {
    return 1;
  }
  [a2 doubleValue];
  v10 = v9;
  [a3 doubleValue];
  if (v10 >= v11) {
    return 0;
  }
  else {
    return -1;
  }
}

int64_t sub_2678(id a1, id a2, id a3)
{
  objc_msgSend(objc_msgSend(a2, "objectAtIndexedSubscript:", 1), "doubleValue");
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "doubleValue");
  if (v5 < v6) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_6578(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6590(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t sub_65F8(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t sub_6660(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

id sub_7FA4(uint64_t a1, uint64_t a2, void *a3)
{
  float v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(void *)(a1 + 40) + 8 * (void)[a3 integerValue]));
  double v6 = *(void **)(a1 + 32);
  return [v6 setObject:v5 forKeyedSubscript:a2];
}

void sub_8088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_80EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_84DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8558(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_85F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_90B8(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "presentation"), "guidelineAuthoringMediaAttributesForKey:", objc_msgSend(objc_msgSend(a3, "uniqueURL"), "absoluteString"));
  if (result)
  {
    double v6 = result;
    [result offset];
    if (v7 != 0.0 || (id result = [v6 offset], v8 != 0.0))
    {
      v9 = *(void **)(a1 + 40);
      return [v9 setObject:v6 forKey:a2];
    }
  }
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
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

void operator delete[]()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

uint64_t random(void)
{
  return _random();
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return [a1 CGSizeValue];
}

id objc_msgSend__freqOrderFromHightToLow(void *a1, const char *a2, ...)
{
  return [a1 _freqOrderFromHightToLow];
}

id objc_msgSend__initCouchPotatoSettings(void *a1, const char *a2, ...)
{
  return [a1 _initCouchPotatoSettings];
}

id objc_msgSend__initNavigatorSettings(void *a1, const char *a2, ...)
{
  return [a1 _initNavigatorSettings];
}

id objc_msgSend__parseLayout(void *a1, const char *a2, ...)
{
  return [a1 _parseLayout];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowMovieWithPhotos(void *a1, const char *a2, ...)
{
  return [a1 allowMovieWithPhotos];
}

id objc_msgSend_areaPercentInAppearOrder(void *a1, const char *a2, ...)
{
  return [a1 areaPercentInAppearOrder];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_aspectRatio(void *a1, const char *a2, ...)
{
  return [a1 aspectRatio];
}

id objc_msgSend_aspectRatiosInAppearOrder(void *a1, const char *a2, ...)
{
  return [a1 aspectRatiosInAppearOrder];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_audioList(void *a1, const char *a2, ...)
{
  return [a1 audioList];
}

id objc_msgSend_baseScore(void *a1, const char *a2, ...)
{
  return [a1 baseScore];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return [a1 columns];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentScore(void *a1, const char *a2, ...)
{
  return [a1 currentScore];
}

id objc_msgSend_defaultDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultDuration];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return [a1 document];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_endFeed(void *a1, const char *a2, ...)
{
  return [a1 endFeed];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_guidelineAuthoringAttributedTitle(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringAttributedTitle];
}

id objc_msgSend_guidelineAuthoringDebuggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringDebuggingEnabled];
}

id objc_msgSend_guidelineAuthoringDurationFactor(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringDurationFactor];
}

id objc_msgSend_guidelineAuthoringFitToAudioDuration(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringFitToAudioDuration];
}

id objc_msgSend_guidelineAuthoringInteractiveTransitionSettings(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringInteractiveTransitionSettings];
}

id objc_msgSend_guidelineAuthoringPageDuration(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringPageDuration];
}

id objc_msgSend_guidelineAuthoringRecommendedResolutionSizes(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringRecommendedResolutionSizes];
}

id objc_msgSend_guidelineAuthoringTitle(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringTitle];
}

id objc_msgSend_guidelineAuthoringUserAudioItems(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringUserAudioItems];
}

id objc_msgSend_guidelineAuthoringUserMediaItems(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringUserMediaItems];
}

id objc_msgSend_hasAnyEmptyTiles(void *a1, const char *a2, ...)
{
  return [a1 hasAnyEmptyTiles];
}

id objc_msgSend_hasRegionsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 hasRegionsOfInterest];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isSubtitle(void *a1, const char *a2, ...)
{
  return [a1 isSubtitle];
}

id objc_msgSend_isTitle(void *a1, const char *a2, ...)
{
  return [a1 isTitle];
}

id objc_msgSend_itemDurations(void *a1, const char *a2, ...)
{
  return [a1 itemDurations];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutInfos(void *a1, const char *a2, ...)
{
  return [a1 layoutInfos];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_liveFeedNumOfMediasUsed(void *a1, const char *a2, ...)
{
  return [a1 liveFeedNumOfMediasUsed];
}

id objc_msgSend_liveFeedPrimaryResolutionKey(void *a1, const char *a2, ...)
{
  return [a1 liveFeedPrimaryResolutionKey];
}

id objc_msgSend_maximumDuration(void *a1, const char *a2, ...)
{
  return [a1 maximumDuration];
}

id objc_msgSend_mediasUsed(void *a1, const char *a2, ...)
{
  return [a1 mediasUsed];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minimumDuration(void *a1, const char *a2, ...)
{
  return [a1 minimumDuration];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numOfMedia(void *a1, const char *a2, ...)
{
  return [a1 numOfMedia];
}

id objc_msgSend_numberOfMediaItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfMediaItems];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_origLayout(void *a1, const char *a2, ...)
{
  return [a1 origLayout];
}

id objc_msgSend_pageDuration(void *a1, const char *a2, ...)
{
  return [a1 pageDuration];
}

id objc_msgSend_pages(void *a1, const char *a2, ...)
{
  return [a1 pages];
}

id objc_msgSend_pagesGenerated(void *a1, const char *a2, ...)
{
  return [a1 pagesGenerated];
}

id objc_msgSend_panningCropThreshold(void *a1, const char *a2, ...)
{
  return [a1 panningCropThreshold];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_presentation(void *a1, const char *a2, ...)
{
  return [a1 presentation];
}

id objc_msgSend_primaryResolutionKey(void *a1, const char *a2, ...)
{
  return [a1 primaryResolutionKey];
}

id objc_msgSend_producerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 producerIdentifier];
}

id objc_msgSend_rectNamesInAppearOrder(void *a1, const char *a2, ...)
{
  return [a1 rectNamesInAppearOrder];
}

id objc_msgSend_regionsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 regionsOfInterest];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetLiveAuthoring(void *a1, const char *a2, ...)
{
  return [a1 resetLiveAuthoring];
}

id objc_msgSend_resolution(void *a1, const char *a2, ...)
{
  return [a1 resolution];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootCouch(void *a1, const char *a2, ...)
{
  return [a1 rootCouch];
}

id objc_msgSend_rootMediaFeeder(void *a1, const char *a2, ...)
{
  return [a1 rootMediaFeeder];
}

id objc_msgSend_rootNavigator(void *a1, const char *a2, ...)
{
  return [a1 rootNavigator];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return [a1 rows];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textWidgetName(void *a1, const char *a2, ...)
{
  return [a1 textWidgetName];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueURL(void *a1, const char *a2, ...)
{
  return [a1 uniqueURL];
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return [a1 userSettings];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widgetWithName_templateName_className_settings_userData_subWidgets_materials_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widgetWithName:templateName:className:settings:userData:subWidgets:materials:");
}
void sub_27A4(id a1, UIImageView *a2, UIImage *a3)
{
  if (a3) {
    -[UIImageView setImage:](a2, "setImage:");
  }
}

void sub_2AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2AD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _totalSizeForAllDownloads];
  obj = (id *)WeakRetained;
  objc_sync_enter(obj);
  if (obj)
  {
    *(float *)&double v3 = (float)(unint64_t)v2;
    [obj[2] setTotalSize:v3];
  }
  objc_sync_exit(obj);
}

void sub_2B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

TVUsageEntityItem *sub_3B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 representativeItem];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;
  v6 = objc_alloc_init(TVUsageEntityItem);
  v7 = [v5 valueForProperty:*(void *)(a1 + 32)];
  [(TVUsageEntityItem *)v6 setTitle:v7];

  if (objc_opt_respondsToSelector())
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = [v3 valueForKey:v8];
    [(TVUsageEntityItem *)v6 setArtworkCatalog:v9];

    id v10 = [v5 mediaType];
    if (qword_12060 != -1) {
      dispatch_once(&qword_12060, &stru_C498);
    }
    v11 = (void *)qword_12058;
    v12 = +[NSNumber numberWithUnsignedInteger:v10];
    v13 = [v11 objectForKey:v12];

    if (!v13)
    {
      v14 = +[MPPlaceholderArtwork noArtPlaceholderImageForMediaType:v10];
      [v14 scale];
      CGFloat v16 = v15;
      v25.width = 44.0;
      v25.height = 44.0;
      UIGraphicsBeginImageContextWithOptions(v25, 1, v16);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 44.0, 44.0);
      v13 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      v18 = (void *)qword_12058;
      v19 = +[NSNumber numberWithUnsignedInteger:v10];
      [v18 setObject:v13 forKey:v19];
    }
    [(TVUsageEntityItem *)v6 setPlaceholderImage:v13];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [v3 valueForProperty:MPMediaItemPropertyFileSize];
    v21 = (char *)[v20 unsignedLongLongValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = sub_657C(v3);
    }
    else {
      v21 = 0;
    }
  }
  v22 = +[NSByteCountFormatter stringFromByteCount:v21 countStyle:2];
  [(TVUsageEntityItem *)v6 setFileSizeString:v22];

  return v6;
}

void sub_3E28(id a1)
{
  qword_12058 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

TVUsageEntityItem *__cdecl sub_3E68(id a1, MPMediaQuery *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(TVUsageEntityItem);
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v5 = [v4 localizedStringForKey:@"SEASONS_HEADER" value:&stru_C6C8 table:@"VideosUsage"];
  v6 = +[NSLocale currentLocale];
  v7 = [v5 uppercaseStringWithLocale:v6];
  [(TVUsageEntityItem *)v3 setTitle:v7];

  v8 = [(MPMediaQuery *)v2 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];

  id v9 = [v8 unsignedLongLongValue];
  id v10 = +[NSByteCountFormatter stringFromByteCount:v9 countStyle:2];
  [(TVUsageEntityItem *)v3 setFileSizeString:v10];

  return v3;
}

TVUsageEntityItem *__cdecl sub_3FB0(id a1, MPMediaQuery *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(TVUsageEntityItem);
  id v4 = [(MPMediaQuery *)v2 items];
  v5 = [v4 firstObject];

  v6 = [v5 artworkCatalog];
  [(TVUsageEntityItem *)v3 setArtworkCatalog:v6];

  v7 = [v5 valueForProperty:MPMediaItemPropertySeriesName];
  [(TVUsageEntityItem *)v3 setTitle:v7];

  v8 = [(MPMediaQuery *)v2 items];
  id v9 = [v8 count];

  id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v11 = [v10 localizedStringForKey:@"EPISODE_COUNT_SUBTITLE_FORMAT" value:&stru_C6C8 table:@"VideosUsage"];
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v9);

  [(TVUsageEntityItem *)v3 setSubtitle:v12];
  v13 = [(MPMediaQuery *)v2 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];

  id v14 = [v13 unsignedLongLongValue];
  double v15 = +[NSByteCountFormatter stringFromByteCount:v14 countStyle:2];
  [(TVUsageEntityItem *)v3 setFileSizeString:v15];

  return v3;
}

TVUsageEntityItem *__cdecl sub_4188(id a1, MPMediaEntity *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(TVUsageEntityItem);
  id v4 = [(MPMediaEntity *)v2 valueForProperty:MPMediaItemPropertyTitle];
  [(TVUsageEntityItem *)v3 setTitle:v4];

  v5 = [(MPMediaEntity *)v2 valueForProperty:MPMediaItemPropertyEpisodeNumber];
  uint64_t v6 = [(MPMediaEntity *)v2 valueForProperty:MPMediaItemPropertyPlaybackDuration];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v5) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      id v10 = 0;
      goto LABEL_13;
    }
    [0 doubleValue];
    v13 = sub_43EC(v17);
    id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
    double v15 = [v14 localizedStringForKey:@"EPISODE_SUBTITLE_WITHOUT_NUMBER_WITH_DURATION" value:&stru_C6C8 table:@"VideosUsage"];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);
  }
  else
  {
    id v11 = [v5 unsignedIntegerValue];
    [v7 doubleValue];
    v13 = sub_43EC(v12);
    id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
    double v15 = [v14 localizedStringForKey:@"EPISODE_SUBTITLE_WITH_NUMBER_WITH_DURATION" value:&stru_C6C8 table:@"VideosUsage"];
    uint64_t v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11, v13);
  }
  id v10 = (void *)v16;

LABEL_13:
  [(TVUsageEntityItem *)v3 setSubtitle:v10];
  v18 = [(MPMediaEntity *)v2 valueForProperty:MPMediaItemPropertyFileSize];
  id v19 = [v18 unsignedLongLongValue];

  v20 = +[NSByteCountFormatter stringFromByteCount:v19 countStyle:2];
  [(TVUsageEntityItem *)v3 setFileSizeString:v20];

  return v3;
}

id sub_43EC(double a1)
{
  if (qword_12080 != -1) {
    dispatch_once(&qword_12080, &stru_C558);
  }
  id v2 = objc_opt_new();
  [v2 setSecond:(uint64_t)a1];
  id v3 = [(id)qword_12068 dateFromComponents:v2];
  id v4 = [(id)qword_12068 components:32 fromDate:v3];

  id v5 = [v4 hour];
  uint64_t v6 = &qword_12078;
  if ((uint64_t)v5 > 0) {
    uint64_t v6 = &qword_12070;
  }
  id v7 = (id)*v6;
  BOOL v8 = [v7 stringFromDate:v3];

  return v8;
}

void sub_44EC(id a1)
{
  id v1 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v2 = (void *)qword_12068;
  qword_12068 = (uint64_t)v1;

  id v3 = objc_alloc_init((Class)NSDateFormatter);
  id v4 = (void *)qword_12070;
  qword_12070 = (uint64_t)v3;

  id v5 = (void *)qword_12070;
  uint64_t v6 = +[NSLocale currentLocale];
  id v7 = +[NSDateFormatter dateFormatFromTemplate:@"Hmm" options:0 locale:v6];
  [v5 setDateFormat:v7];

  id v8 = objc_alloc_init((Class)NSDateFormatter);
  BOOL v9 = (void *)qword_12078;
  qword_12078 = (uint64_t)v8;

  id v10 = (void *)qword_12078;
  id v12 = +[NSLocale currentLocale];
  id v11 = +[NSDateFormatter dateFormatFromTemplate:@"mmss" options:0 locale:v12];
  [v10 setDateFormat:v11];
}

void sub_51EC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [v9 item];
    id v7 = *(void **)(a1 + 32);

    if (v6 == v7)
    {
      id v8 = [v9 imageView];
      [v8 setImage:v5];

      [v9 setNeedsUpdateConstraints];
    }
  }
}

uint64_t sub_5778(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 sizeForCategory:a2];
  float v8 = v7;
  [*(id *)(a1 + 32) sizeForCategory:v6];
  float v10 = v9;

  if (v8 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_5974(id a1)
{
  qword_12088 = [[TVUsageTableViewSectionHeaderView alloc] initWithReuseIdentifier:@"VideosUsageHSizingHeaderView"];

  _objc_release_x1();
}

id sub_652C(void *a1)
{
  id v1 = [a1 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];
  id v2 = [v1 unsignedLongLongValue];

  return v2;
}

char *sub_657C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 itemsQuery];

  if (v2)
  {
    id v3 = [v1 itemsQuery];
    id v4 = (char *)sub_652C(v3);
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = objc_msgSend(v1, "items", 0);
    id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      id v4 = 0;
      uint64_t v7 = *(void *)v13;
      uint64_t v8 = MPMediaItemPropertyFileSize;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          float v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) valueForProperty:v8];
          id v4 = &v4[(void)[v10 longLongValue]];
        }
        id v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void sub_690C(id a1)
{
  qword_12098 = [[TVUsageTableViewSectionHeaderView alloc] initWithReuseIdentifier:@"VideosUsageHSizingHeaderView"];

  _objc_release_x1();
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSIsBundleIDInstalled()
{
  return _PSIsBundleIDInstalled();
}

uint64_t PSPointImageOfColor()
{
  return _PSPointImageOfColor();
}

uint64_t PSTableViewSideInset()
{
  return _PSTableViewSideInset();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return _PreferencesTableViewHeaderColor();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return _PreferencesTableViewHeaderFont();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t WLKIsRegulatedSKU()
{
  return _WLKIsRegulatedSKU();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_ITunesUQuery(void *a1, const char *a2, ...)
{
  return [a1 ITunesUQuery];
}

id objc_msgSend__prunedDataSource(void *a1, const char *a2, ...)
{
  return [a1 _prunedDataSource];
}

id objc_msgSend__storageReporter(void *a1, const char *a2, ...)
{
  return [a1 _storageReporter];
}

id objc_msgSend__totalSizeForAllDownloads(void *a1, const char *a2, ...)
{
  return [a1 _totalSizeForAllDownloads];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_clearArtworkCatalogs(void *a1, const char *a2, ...)
{
  return [a1 clearArtworkCatalogs];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 deviceMediaLibrary];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_entities(void *a1, const char *a2, ...)
{
  return [a1 entities];
}

id objc_msgSend_entityType(void *a1, const char *a2, ...)
{
  return [a1 entityType];
}

id objc_msgSend_fileSizeString(void *a1, const char *a2, ...)
{
  return [a1 fileSizeString];
}

id objc_msgSend_filterPredicates(void *a1, const char *a2, ...)
{
  return [a1 filterPredicates];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return [a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_groupingType(void *a1, const char *a2, ...)
{
  return [a1 groupingType];
}

id objc_msgSend_headerItem(void *a1, const char *a2, ...)
{
  return [a1 headerItem];
}

id objc_msgSend_homeVideosQuery(void *a1, const char *a2, ...)
{
  return [a1 homeVideosQuery];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return [a1 indexPath];
}

id objc_msgSend_initForAutolayout(void *a1, const char *a2, ...)
{
  return [a1 initForAutolayout];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_itemsQuery(void *a1, const char *a2, ...)
{
  return [a1 itemsQuery];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryDataProvider(void *a1, const char *a2, ...)
{
  return [a1 libraryDataProvider];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_moviesQuery(void *a1, const char *a2, ...)
{
  return [a1 moviesQuery];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_placeholderImage(void *a1, const char *a2, ...)
{
  return [a1 placeholderImage];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_storageReporter(void *a1, const char *a2, ...)
{
  return [a1 storageReporter];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_tvShowsQuery(void *a1, const char *a2, ...)
{
  return [a1 tvShowsQuery];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_updateFileSize(void *a1, const char *a2, ...)
{
  return [a1 updateFileSize];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usageBundleStorageReporter(void *a1, const char *a2, ...)
{
  return [a1 usageBundleStorageReporter];
}

id objc_msgSend_usageDataSource(void *a1, const char *a2, ...)
{
  return [a1 usageDataSource];
}

id objc_msgSend_usageTitle(void *a1, const char *a2, ...)
{
  return [a1 usageTitle];
}

id objc_msgSend_videoITunesUQuery(void *a1, const char *a2, ...)
{
  return [a1 videoITunesUQuery];
}

id objc_msgSend_viewControllerForRemoveItem(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForRemoveItem];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}
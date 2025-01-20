id RENowPlayingBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8328 != -1) {
    dispatch_once(&qword_8328, &stru_4200);
  }
  v0 = (void *)qword_8320;

  return v0;
}

void sub_2A30(id a1)
{
  qword_8320 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id RENowPlayingElementContent(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a1;
  id v17 = objc_alloc_init((Class)REContent);
  [v17 setStyle:3];
  [v17 setOverrideBodyImage:v16];

  if (![v11 length]) {
    goto LABEL_18;
  }
  if (v12)
  {
    v18 = +[CLKSimpleTextProvider textProviderWithText:v11];
    [v17 setHeaderTextProvider:v18];

    [v17 setDescription1TextProvider:v12];
    [v17 setDescription1Opacity:&off_4378];
    goto LABEL_10;
  }
  if ([v13 length])
  {
    v19 = +[CLKSimpleTextProvider textProviderWithText:v11];
    [v17 setHeaderTextProvider:v19];

    v20 = +[CLKSimpleTextProvider textProviderWithText:v13];
    [v17 setDescription1TextProvider:v20];
  }
  else
  {
LABEL_18:
    if ([v11 length] || objc_msgSend(v13, "length"))
    {
      id v21 = v11;
    }
    else if (v14)
    {
      id v21 = v14;
    }
    else
    {
      id v21 = v15;
    }
    v22 = +[CLKSimpleTextProvider textProviderWithText:v21];
    [v17 setDescription1TextProvider:v22];

    [v17 setDescription1FontStyle:2];
  }
LABEL_10:

  return v17;
}

id RENowPlayingLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = RENowPlayingBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_4300 table:@"NowPlayingDataSource"];

  return v3;
}

id RENowPlayingImageNamed(void *a1)
{
  id v1 = a1;
  v2 = RENowPlayingBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

id RENowPlayingSymbolWithBackground(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_8338);
  id WeakRetained = objc_loadWeakRetained(&qword_8340);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v4 = +[CLKDevice currentDevice];
    id v5 = objc_loadWeakRetained(&qword_8340);
    if (v4 == v5)
    {
      v6 = +[CLKDevice currentDevice];
      id v7 = [v6 version];
      uint64_t v8 = qword_8348;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v9 = +[CLKDevice currentDevice];
  objc_storeWeak(&qword_8340, v9);

  id v10 = objc_loadWeakRetained(&qword_8340);
  qword_8348 = (uint64_t)[v10 version];

  id v11 = +[CLKDevice currentDevice];
  uint64_t v12 = objc_opt_new();
  id v13 = (void *)qword_8330;
  qword_8330 = v12;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_8338);
  id v14 = [(id)qword_8330 objectForKey:v1];
  if (!v14)
  {
    id v15 = +[CLKDevice currentDevice];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_8370);
    id v16 = objc_loadWeakRetained(&qword_8378);
    if (v16)
    {
      id v17 = v16;
      id v18 = objc_loadWeakRetained(&qword_8378);
      if (v18 == v15)
      {
        id v19 = [v15 version];
        uint64_t v20 = qword_8380;

        if (v19 == (id)v20)
        {
LABEL_12:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_8370);
          double v22 = *(double *)&qword_8350;
          double v23 = *(double *)&qword_8358;
          double v24 = *(double *)&qword_8360;
          double v25 = *(double *)&qword_8368;

          v26 = +[UIColor colorWithWhite:0.4 alpha:1.0];
          v27 = +[UIColor colorWithWhite:0.756862745 alpha:1.0];
          v28 = +[UIImageSymbolConfiguration configurationWithPointSize:v25];
          if ([v1 hasPrefix:@"_"])
          {
            v29 = [v1 substringFromIndex:1];
            v30 = +[UIImage _systemImageNamed:v29 withConfiguration:v28];
          }
          else
          {
            v30 = +[UIImage systemImageNamed:v1 withConfiguration:v28];
          }
          id v31 = [objc_alloc((Class)UIImageView) initWithImage:v30];
          [v31 sizeToFit];
          [v31 setTintColor:v27];
          v32 = +[CLKDevice currentDevice];
          [v32 screenScale];
          CGFloat v34 = v33;
          v49.width = v22;
          v49.height = v23;
          UIGraphicsBeginImageContextWithOptions(v49, 0, v34);

          v50.width = v22;
          v50.height = v23;
          UIGraphicsBeginImageContext(v50);
          v35 = +[CALayer layer];
          objc_msgSend(v35, "setFrame:", 0.0, 0.0, v22, v23);
          id v36 = v26;
          objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));
          [v35 setCornerRadius:v24];
          v37 = [v31 layer];
          [v35 addSublayer:v37];

          [v31 bounds];
          double v39 = (v22 - v38) * 0.5;
          [v31 bounds];
          double v41 = (v23 - v40) * 0.5;
          [v31 bounds];
          double v43 = v42;
          [v31 bounds];
          double v45 = v44;
          v46 = [v31 layer];
          objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

          [v35 renderInContext:UIGraphicsGetCurrentContext()];
          id v14 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          [(id)qword_8330 setObject:v14 forKeyedSubscript:v1];

          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    id v21 = objc_storeWeak(&qword_8378, v15);
    qword_8380 = (uint64_t)[v15 version];

    sub_31E4();
    goto LABEL_12;
  }
LABEL_16:

  return v14;
}

void sub_31E4()
{
  v0 = +[CLKDevice currentDevice];
  id v5 = +[CLKDeviceMetrics metricsWithDevice:v0 identitySizeClass:2];

  [v5 setRoundingBehavior:2];
  objc_msgSend(v5, "scaledSize:", 105.0, 105.0);
  qword_8350 = v1;
  qword_8358 = v2;
  [v5 scaledValue:6.0];
  qword_8360 = v3;
  [v5 scaledValue:70.0];
  qword_8368 = v4;
}

uint64_t REImageNamedFromBundle()
{
  return _REImageNamedFromBundle();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return _REUISampleRelevanceProviderForSamplePosition();
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}
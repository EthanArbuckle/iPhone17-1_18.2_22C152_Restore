@interface WFShortcutsSmallWidgetConfigurationIntentHandler
- (WFShortcutsSmallWidgetConfigurationIntentHandler)init;
- (id)defaultShortcutForShortcutsSmallWidgetConfiguration:(id)a3;
- (id)shortcutFromWorkflowReference:(id)a3;
- (void)provideShortcutOptionsCollectionForShortcutsSmallWidgetConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation WFShortcutsSmallWidgetConfigurationIntentHandler

- (void)provideShortcutOptionsCollectionForShortcutsSmallWidgetConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, id, void))a5;
  v9 = +[WFDatabase defaultDatabase];
  v10 = v9;
  if (v7) {
    [v9 sortedVisibleWorkflowsNameContains:v7 limit:300];
  }
  else {
  v11 = [v9 sortedVisibleWorkflowsByNameWithLimit:300];
  }

  v12 = [v11 descriptors];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000038A4;
  v15[3] = &unk_1000084A0;
  v15[4] = self;
  v13 = objc_msgSend(v12, "if_map:", v15);

  id v14 = [objc_alloc((Class)INObjectCollection) initWithItems:v13];
  v8[2](v8, v14, 0);
}

- (id)defaultShortcutForShortcutsSmallWidgetConfiguration:(id)a3
{
  id v4 = [objc_alloc((Class)WFWorkflowQuery) initWithLocation:0];
  [v4 setResultsLimit:1];
  v5 = +[WFDatabase defaultDatabase];
  v6 = [v5 sortedWorkflowsWithQuery:v4];
  id v7 = [v6 descriptors];
  v8 = [v7 firstObject];

  v9 = [(WFShortcutsSmallWidgetConfigurationIntentHandler *)self shortcutFromWorkflowReference:v8];

  return v9;
}

- (id)shortcutFromWorkflowReference:(id)a3
{
  id v3 = a3;
  id v4 = [WFShortcut alloc];
  v5 = [v3 identifier];
  v6 = [v3 name];
  id v7 = [(WFShortcut *)v4 initWithIdentifier:v5 displayString:v6];

  v8 = [v3 icon];
  id v9 = [v8 backgroundColorValue];

  if (v9)
  {
    v10 = +[NSNumber numberWithInteger:v9];
    v39 = v10;
    id v9 = +[NSArray arrayWithObjects:&v39 count:1];
  }
  v11 = +[VCVoiceShortcutClient standardClient];
  v12 = [v3 icon];
  v13 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v12 glyphCharacter]);
  v38 = v13;
  id v14 = +[NSArray arrayWithObjects:&v38 count:1];
  v15 = objc_msgSend(v11, "drawGlyphs:atSize:withBackgroundColorValues:error:", v14, v9, 0, 30.0, 30.0);

  if ([v15 count])
  {
    v16 = [v15 firstObject];

    CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
    v18 = [UTTypePNG identifier];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    v19 = (uint64_t (*)(CFMutableDataRef, void *, uint64_t, void))off_10000E378;
    v37 = off_10000E378;
    if (!off_10000E378)
    {
      v20 = sub_100004020();
      v35[3] = (uint64_t)dlsym(v20, "CGImageDestinationCreateWithData");
      off_10000E378 = (_UNKNOWN *)v35[3];
      v19 = (uint64_t (*)(CFMutableDataRef, void *, uint64_t, void))v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v19)
    {
      v21 = (const void *)v19(Mutable, v18, 1, 0);

      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      v22 = (void (*)(const void *, void *, void))off_10000E388;
      v37 = off_10000E388;
      if (!off_10000E388)
      {
        v23 = sub_100004020();
        v35[3] = (uint64_t)dlsym(v23, "CGImageDestinationAddImage");
        off_10000E388 = (_UNKNOWN *)v35[3];
        v22 = (void (*)(const void *, void *, void))v35[3];
      }
      _Block_object_dispose(&v34, 8);
      if (v22)
      {
        v22(v21, v16, 0);
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x2020000000;
        v24 = (void (*)(const void *))off_10000E390;
        v37 = off_10000E390;
        if (!off_10000E390)
        {
          v25 = sub_100004020();
          v35[3] = (uint64_t)dlsym(v25, "CGImageDestinationFinalize");
          off_10000E390 = (_UNKNOWN *)v35[3];
          v24 = (void (*)(const void *))v35[3];
        }
        _Block_object_dispose(&v34, 8);
        if (v24)
        {
          v24(v21);
          v26 = +[INImage imageWithImageData:Mutable];
          [v26 _setRenderingMode:1];
          if (v26) {
            [(WFShortcut *)v7 setDisplayImage:v26];
          }
          CFRelease(v21);
          CFRelease(Mutable);

          goto LABEL_16;
        }
        v32 = +[NSAssertionHandler currentHandler];
        v33 = +[NSString stringWithUTF8String:"_Bool WFCGImageDestinationFinalize(CGImageDestinationRef _Nonnull)"];
        objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"WFShortcutsWidgetConfigurationIntentHandler.m", 29, @"%s", dlerror());
      }
      else
      {
        v30 = +[NSAssertionHandler currentHandler];
        v31 = +[NSString stringWithUTF8String:"void WFCGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)"];
        objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"WFShortcutsWidgetConfigurationIntentHandler.m", 28, @"%s", dlerror());
      }
    }
    else
    {
      v28 = +[NSAssertionHandler currentHandler];
      v29 = +[NSString stringWithUTF8String:"CGImageDestinationRef  _Nullable WFCGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"WFShortcutsWidgetConfigurationIntentHandler.m", 27, @"%s", dlerror());
    }
    __break(1u);
  }
LABEL_16:

  return v7;
}

- (WFShortcutsSmallWidgetConfigurationIntentHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFShortcutsSmallWidgetConfigurationIntentHandler;
  v2 = [(WFShortcutsSmallWidgetConfigurationIntentHandler *)&v5 init];
  if (v2)
  {
    +[WFInitialization initializeProcessWithDatabase:1];
    id v3 = v2;
  }

  return v2;
}

@end
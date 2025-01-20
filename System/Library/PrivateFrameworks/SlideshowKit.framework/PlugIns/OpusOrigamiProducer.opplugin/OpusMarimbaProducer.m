@interface OpusMarimbaProducer
+ (id)_mediaAttributesForKey:(id)a3 withAttributes:(id)a4;
+ (id)_mediaPropertiesForMediaItem:(id)a3;
+ (id)_transitionSettingsForTransition:(id)a3;
+ (void)setupJavascriptContext:(id)a3;
- (BOOL)_authorBootstrap:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)_authorCluster:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)_authorFinish:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)_authorImport:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)_authorProduce:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)author:(BOOL)a3 progressBlock:(id)a4 requiresProducer:(BOOL *)a5 error:(id *)a6;
- (BOOL)liveAuthorInitialBootstrap:(id)a3 error:(id *)a4;
- (BOOL)needsLiveAuthoring;
- (BOOL)resetLiveAuthoring;
- (BOOL)supportsLiveAuthoring;
- (float)currentLiveAuthoringProgress;
- (float)liveAuthoringProgressForMediaItem:(id)a3;
- (id)_durationDictionaryForGuidelines;
- (id)_subtitleDictionaryForGuidelines;
- (id)liveAuthorNextChunk:(id)a3 error:(id *)a4;
- (unint64_t)totalNumberOfLiveAuthoringItems;
- (void)_initCouchPotatoSettings;
- (void)_initNavigatorSettingsForLiveAuthoring:(BOOL)a3;
- (void)_initTemplates;
- (void)_updateSynopsisGuideline;
- (void)didChangeTextForWidget:(id)a3 toSettings:(id)a4;
- (void)didPanMediaForWidget:(id)a3 toState:(id)a4;
@end

@implementation OpusMarimbaProducer

+ (void)setupJavascriptContext:(id)a3
{
}

- (BOOL)_authorBootstrap:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation", a3), "info"), "producerIdentifier"))
  {
    if (objc_msgSend(objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "producerIdentifier"), "isEqualToString:", objc_msgSend(-[OpusMarimbaProducer plugin](self, "plugin"), "identifier")))
    {
      v8 = (void ***)v15;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v9 = (void **)sub_698DC;
    }
    else
    {
      v8 = (void ***)v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v9 = (void **)sub_69944;
    }
  }
  else
  {
    v8 = &v12;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v9 = (void **)sub_699AC;
  }
  v8[2] = v9;
  v8[3] = (void **)&unk_1AAEF0;
  v8[4] = (void **)a4;
  v8[5] = (void **)&v16;
  -[OpusMarimbaProducer cleanupPresentation:](self, "cleanupPresentation:", v12, v13);
  int v10 = *((unsigned __int8 *)v17 + 24);
  if (a5 && *((unsigned char *)v17 + 24)) {
    *a5 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
  }
  _Block_object_dispose(&v16, 8);
  return v10 == 0;
}

- (BOOL)_authorCluster:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  char v8 = 0;
  if (!a4) {
    return 1;
  }
  (*((void (**)(id, char *, id, float))a4 + 2))(a4, &v8, a3, 0.3);
  BOOL result = v8 == 0;
  if (a5)
  {
    if (v8)
    {
      v7 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
      BOOL result = 0;
      *a5 = v7;
    }
  }
  return result;
}

- (BOOL)_authorImport:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  char v8 = 0;
  if (!a4) {
    return 1;
  }
  (*((void (**)(id, char *, id, float))a4 + 2))(a4, &v8, a3, 0.5);
  BOOL result = v8 == 0;
  if (a5)
  {
    if (v8)
    {
      v7 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
      BOOL result = 0;
      *a5 = v7;
    }
  }
  return result;
}

- (void)_initTemplates
{
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addWidgetTemplate:", +[OKPresentationWidget widgetWithName:templateName:className:settings:userData:subWidgets:materials:](OKPresentationWidget, "widgetWithName:templateName:className:settings:userData:subWidgets:materials:", @"Marimba", 0, @"OKWidgetMarimbaView", &off_1BBD70, 0, 0, 0));
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelinesForKey:", @"forceLive"), "lastObject"), "value"), "BOOLValue");
  v15[0] = @"@frame";
  v13[0] = OKResolutionString1024x768;
  v13[1] = OKResolutionString768x1024;
  v14[0] = @"{{0, 0}, {1024, 768}}";
  v14[1] = @"{{0, 0}, {768, 1024}}";
  v16[0] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[1] = &__kCFBooleanFalse;
  v15[1] = @"autoplay";
  v15[2] = @"forceLive";
  v16[2] = +[NSNumber numberWithBool:v3];
  id v4 = [+[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3] mutableCopy];
  id v5 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringInteractiveTransitionSettings");
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"interactiveTransitionSettings"];
  }
  id v6 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringAttributedTitle");
  if (v6)
  {
    id v7 = v6;
    CFStringRef v8 = @"attributedTitle";
LABEL_7:
    [v4 setObject:v7 forKey:v8];
    goto LABEL_8;
  }
  id v9 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringTitle");
  if (v9)
  {
    id v7 = v9;
    CFStringRef v8 = @"title";
    goto LABEL_7;
  }
LABEL_8:
  int v10 = +[OKPresentationWidget widgetWithName:@"marimba" templateName:@"Marimba" className:0 settings:v4 userData:0 subWidgets:0 materials:0];

  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:@"page.data = null;" forKey:@"didAppearActionScript"];
  v12 = v10;
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addPageTemplate:", +[OKPresentationPage pageWithName:templateName:navigatorName:properties:settings:userData:widgets:](OKPresentationPage, "pageWithName:templateName:navigatorName:properties:settings:userData:widgets:", @"MarimbaPage", 0, 0, 0, v11, 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1)));
}

- (void)_initCouchPotatoSettings
{
  objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "setCouchPotatoSupported:", 1);
  objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "setCouchPotatoDelay:", 0.1);
  objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "setCouchPotatoStepDuration:", 0.1);
  objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "setRenderTimeLoggingSupported:", 1);
  id v3 = +[OKPresentationCouch couchWithName:kOKPresentationRootNavigatorName settings:&__NSDictionary0__struct steps:0 restartScript:@"document.mainNavigator.pages['page'].widgets['marimba'].restart(info.completionBlock);"];
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addCouch:", v3);
  id v4 = +[OKPresentationCouchStep couchStepWithAnchorPageName:script:duration:settings:](OKPresentationCouchStep, "couchStepWithAnchorPageName:script:duration:settings:", @"page", @"playAllWidgetsSequentially(document, page, [\"marimba\"]);",
         &__NSDictionary0__struct,
         -1.0);
  [(OKPresentationCouch *)v3 addStep:v4];
}

- (void)_initNavigatorSettingsForLiveAuthoring:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "info"), "setResolutions:", objc_msgSend(-[OpusMarimbaProducer plugin](self, "plugin"), "supportedResolutions"));
  id v5 = +[NSMutableDictionary dictionary];
  unsigned int v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelinesForKey:", @"fitsToMusic"), "lastObject"), "value"), "BOOLValue");
  id v7 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringUserAudioItems");
  if (v7)
  {
    CFStringRef v8 = v7;
    if ([v7 count])
    {
      BOOL v25 = v3;
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            CFStringRef v33 = @"url";
            id v34 = objc_msgSend(objc_msgSend(v14, "uniqueURL"), "absoluteString");
            objc_msgSend(v9, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
            objc_msgSend(objc_msgSend(v14, "metadata"), "duration");
          }
          id v11 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v11);
      }
      [v5 setObject:v9 forKeyedSubscript:@"audioPlaylist"];
      if (v6) {
        v15 = &__kCFBooleanFalse;
      }
      else {
        v15 = &__kCFBooleanTrue;
      }
      [v5 setObject:v15 forKeyedSubscript:@"audioPlaylistLoops"];

      BOOL v3 = v25;
    }
  }
  id v16 = objc_msgSend(objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelinesForKey:", @"style"), "lastObject"), "value");
  id v17 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder");
  id v18 = v17;
  if (!v3) {
    id v18 = [v17 allMediaURLs];
  }
  id v19 = [(OpusMarimbaProducer *)self _subtitleDictionaryForGuidelines];
  id v20 = [(OpusMarimbaProducer *)self _durationDictionaryForGuidelines];
  id v21 = +[NSMutableDictionary dictionary];
  [v21 setObject:&off_1BBE38 forKeyedSubscript:@"actionBindings"];
  if (v3)
  {
    if (!v20) {
      id v20 = &__NSDictionary0__struct;
    }
    if (!v19) {
      id v19 = &__NSDictionary0__struct;
    }
    v31[0] = @"marimba.mediaFeeder";
    v31[1] = @"marimba.style";
    v32[0] = v18;
    v32[1] = v16;
    v31[2] = @"marimba.seed";
    v32[2] = +[NSNumber numberWithUnsignedInt:arc4random()];
    v32[3] = v19;
    v31[3] = @"marimba.subtitles";
    v31[4] = @"marimba.durations";
    v32[4] = v20;
    objc_msgSend(v21, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 5));
  }
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addPage:", +[OKPresentationPage pageWithName:templateName:navigatorName:properties:settings:userData:widgets:](OKPresentationPage, "pageWithName:templateName:navigatorName:properties:settings:userData:widgets:", @"page", @"MarimbaPage", 0, 0, v21, 0, 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", @"  \t\t\tnavigator.pages['page'].widgets['marimba'].gotoItem(info.keyPath, info.animated, 0); \t\t",
    @"navigationScript");
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"wraps"];
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addNavigator:", +[OKPresentationNavigator navigatorWithName:className:pagesNames:settings:userData:](OKPresentationNavigator, "navigatorWithName:className:pagesNames:settings:userData:", kOKPresentationRootNavigatorName, @"OKNavigatorLinear", &off_1BBFE0, v5, &__NSDictionary0__struct));
  id v22 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v21];
  [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:@"marimba.gotoPosterFrame"];
  v23 = +[OKPresentationPage pageWithName:@"page-thumbnail" templateName:@"MarimbaPage" navigatorName:0 properties:0 settings:v22 userData:0 widgets:0];

  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addPage:", v23);
  uint64_t v24 = kOKPresentationThumbnailNavigatorName;
  id v30 = [(OKPresentationPage *)v23 name];
  objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addNavigator:", +[OKPresentationNavigator navigatorWithName:className:pagesNames:settings:userData:](OKPresentationNavigator, "navigatorWithName:className:pagesNames:settings:userData:", v24, @"OKNavigatorFixed", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1), &__NSDictionary0__struct, &__NSDictionary0__struct));
}

- (BOOL)_authorProduce:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  if (OFLoggerLevel >= 5) {
    +[OFLogger logMessageWithLevel:5 file:"/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m" line:355 andFormat:@"Marimba::_authorProduce called"];
  }
  char v10 = 0;
  [(OpusMarimbaProducer *)self _initTemplates];
  [(OpusMarimbaProducer *)self _initNavigatorSettingsForLiveAuthoring:0];
  [(OpusMarimbaProducer *)self _initCouchPotatoSettings];
  [(OpusMarimbaProducer *)self _updateSynopsisGuideline];

  self->_marimbaDocument = 0;
  if (!a4) {
    return 1;
  }
  (*((void (**)(id, char *, float))a4 + 2))(a4, &v10, 0.9);
  BOOL result = v10 == 0;
  if (a5)
  {
    if (v10)
    {
      id v9 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
      BOOL result = 0;
      *a5 = v9;
    }
  }
  return result;
}

- (BOOL)_authorFinish:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  char v8 = 0;
  if (!a4) {
    return 1;
  }
  (*((void (**)(id, char *, id, float))a4 + 2))(a4, &v8, a3, 1.0);
  BOOL result = v8 == 0;
  if (a5)
  {
    if (v8)
    {
      id v7 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
      BOOL result = 0;
      *a5 = v7;
    }
  }
  return result;
}

- (BOOL)author:(BOOL)a3 progressBlock:(id)a4 requiresProducer:(BOOL *)a5 error:(id *)a6
{
  BOOL v9 = a3;
  id v11 = objc_alloc_init(OpusMarimbaProducerContext);
  if (-[OpusMarimbaProducer _authorBootstrap:progressBlock:error:](self, "_authorBootstrap:progressBlock:error:", v11, a4, a6)&& -[OpusMarimbaProducer _authorCluster:progressBlock:error:](self, "_authorCluster:progressBlock:error:", v11, a4, a6)&& (!v9|| -[OpusMarimbaProducer _authorImport:progressBlock:error:](self, "_authorImport:progressBlock:error:", v11, a4, a6))&& -[OpusMarimbaProducer _authorProduce:progressBlock:error:](
         self,
         "_authorProduce:progressBlock:error:",
         v11,
         a4,
         a6)
    && [(OpusMarimbaProducer *)self _authorFinish:v11 progressBlock:a4 error:a6])
  {
    BOOL v12 = 1;
    *a5 = 1;

    if (a6) {
      return *a6 == 0;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (void)_updateSynopsisGuideline
{
  CGAffineTransform *(__cdecl **v7)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  CFStringRef v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  NSString *v35;
  id v36;
  id v37;
  NSString *v38;
  NSDictionary **v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  OpusMarimbaProducer *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  long long v89;
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  long long v94;
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  long long v103;
  long long v104;
  long long v105;
  uint64_t v106;
  id v107;
  NSDictionary *v108;
  void v109[3];
  void v110[3];
  NSDictionary *v111;
  void v112[2];
  void v113[2];
  void v114[3];
  void v115[3];
  NSDictionary *v116;
  void v117[2];
  void v118[2];
  unsigned char v119[128];
  void v120[3];
  void v121[3];
  NSDictionary *v122;
  void v123[2];
  void v124[2];
  uint64_t v125;
  id v126;
  NSDictionary *v127;
  void v128[2];
  void v129[2];
  void v130[4];
  void v131[4];
  unsigned char v132[128];
  unsigned char v133[128];
  void v134[3];
  void v135[3];
  unsigned char v136[128];
  unsigned char v137[128];
  unsigned char v138[128];

  v59 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringUserMediaItems");
  id v3 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringAttributedTitle");
  if (v3) {
    id v4 = [v3 string];
  }
  else {
    id v4 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringTitle");
  }
  id v5 = v4;
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelinesForKey:", @"style"), "lastObject"), "value");
  id v7 = &CATransform3DGetAffineTransform_ptr;
  v50 = self;
  if (self->_marimbaDocument && ([v6 isEqualToString:@"KenBurns"] & 1) == 0)
  {
    v54 = v5;
    v55 = +[NSMutableArray array];
    BOOL v9 = objc_msgSend(-[MPDocument mainLayers](self->_marimbaDocument, "mainLayers"), "lastObject");
    v78 = objc_alloc_init((Class)NSMutableArray);
    v76 = objc_alloc_init((Class)NSMutableArray);
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    obj = [v9 effectContainers];
    v57 = [obj countByEnumeratingWithState:&v102 objects:v138 count:16];
    if (v57)
    {
      v58 = 0;
      char v10 = 0;
      v56 = *(void *)v103;
      v81 = kOKPresentationGuidelineAuthoringSynopsisItemType;
      id v11 = kOKPresentationGuidelineAuthoringSynopsisItemValue;
      BOOL v12 = kOKPresentationGuidelineAuthoringSynopsisItemNavigationKeyPath;
      v74 = kOKPresentationGuidelineAuthoringSynopsisItemName;
      v52 = kOKPresentationGuidelineAuthoringSynopsisGroupItems;
      v53 = kOKPresentationGuidelineAuthoringSynopsisGroupName;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v103 != v56) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v102 + 1) + 8 * v13);
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v60 = v14;
          v61 = v13;
          v62 = [v14 effects];
          v67 = [v62 countByEnumeratingWithState:&v98 objects:v137 count:16];
          if (v67)
          {
            v64 = *(id *)v99;
            if (v10) {
              v15 = 1;
            }
            else {
              v15 = v54 == 0;
            }
            id v16 = !v15;
            do
            {
              id v17 = 0;
              do
              {
                if (*(id *)v99 != v64) {
                  objc_enumerationMutation(v62);
                }
                v70 = v17;
                id v18 = *(void **)(*((void *)&v98 + 1) + 8 * v17);
                v94 = 0u;
                v95 = 0u;
                v96 = 0u;
                v97 = 0u;
                id v19 = [v18 texts];
                id v20 = [v19 countByEnumeratingWithState:&v94 objects:v136 count:16];
                if (v20)
                {
                  id v21 = v20;
                  id v22 = *(void *)v95;
                  do
                  {
                    for (i = 0; i != v21; i = (char *)i + 1)
                    {
                      if (*(void *)v95 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                      BOOL v25 = @"title";
                      if ((v16 & 1) == 0) {
                        BOOL v25 = +[NSString stringWithFormat:@"text-%d", v10];
                      }
                      v135[0] = &off_1BBEF0;
                      v134[0] = v81;
                      v134[1] = v11;
                      long long v26 = objc_msgSend(objc_msgSend(v24, "attributedString"), "string");
                      v134[2] = v12;
                      v135[1] = v26;
                      v135[2] = v25;
                      objc_msgSend(v78, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v135, v134, 3));
                    }
                    id v21 = [v19 countByEnumeratingWithState:&v94 objects:v136 count:16];
                  }
                  while (v21);
                }
                id v17 = v70 + 1;
              }
              while ((id)(v70 + 1) != v67);
              v67 = [v62 countByEnumeratingWithState:&v98 objects:v137 count:16];
            }
            while (v67);
          }
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v65 = [v60 effects];
          v71 = [v65 countByEnumeratingWithState:&v90 objects:v133 count:16];
          if (v71)
          {
            v68 = *(void *)v91;
            do
            {
              long long v27 = 0;
              do
              {
                if (*(void *)v91 != v68) {
                  objc_enumerationMutation(v65);
                }
                v73 = v27;
                long long v28 = *(void **)(*((void *)&v90 + 1) + 8 * v27);
                v86 = 0u;
                v87 = 0u;
                v88 = 0u;
                v89 = 0u;
                long long v29 = [v28 slides];
                id v30 = [v29 countByEnumeratingWithState:&v86 objects:v132 count:16];
                if (v30)
                {
                  v31 = v30;
                  v32 = *(void *)v87;
                  do
                  {
                    for (j = 0; j != v31; j = (char *)j + 1)
                    {
                      if (*(void *)v87 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      id v34 = *(void **)(*((void *)&v86 + 1) + 8 * (void)j);
                      if ([v34 path])
                      {
                        v35 = +[NSString stringWithFormat:@"media-%d", v10];
                        v130[0] = v74;
                        v131[0] = +[NSNumber numberWithUnsignedInteger:v10];
                        v131[1] = &off_1BBF08;
                        v130[1] = v81;
                        v130[2] = v11;
                        v36 = [v34 path];
                        v130[3] = v12;
                        v131[2] = v36;
                        v131[3] = v35;
                        objc_msgSend(v76, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v131, v130, 4));
                        ++v10;
                      }
                    }
                    v31 = [v29 countByEnumeratingWithState:&v86 objects:v132 count:16];
                  }
                  while (v31);
                }
                long long v27 = v73 + 1;
              }
              while ((id)(v73 + 1) != v71);
              v71 = [v65 countByEnumeratingWithState:&v90 objects:v133 count:16];
            }
            while (v71);
          }
          v37 = [v78 arrayByAddingObjectsFromArray:v76];
          if ([v37 count])
          {
            v128[0] = v53;
            v38 = +[NSString stringWithFormat:@"%lu", v58];
            v128[1] = v52;
            v129[0] = v38;
            v129[1] = v37;
            objc_msgSend(v55, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 2));
            ++v58;
          }
          [v78 removeAllObjects];
          [v76 removeAllObjects];
          uint64_t v13 = v61 + 1;
        }
        while ((id)(v61 + 1) != v57);
        v57 = [obj countByEnumeratingWithState:&v102 objects:v138 count:16];
      }
      while (v57);
    }

    v125 = kOKPresentationGuidelineAuthoringSynopsisCollectionGroups;
    v126 = v55;
    v127 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
    v39 = &v127;
    id v7 = &CATransform3DGetAffineTransform_ptr;
  }
  else
  {
    char v8 = +[NSMutableArray array];
    if (v5)
    {
      v123[0] = kOKPresentationGuidelineAuthoringSynopsisGroupName;
      v124[0] = +[NSString stringWithFormat:@"%lu", 0];
      v123[1] = kOKPresentationGuidelineAuthoringSynopsisGroupItems;
      v120[0] = kOKPresentationGuidelineAuthoringSynopsisItemType;
      v120[1] = kOKPresentationGuidelineAuthoringSynopsisItemValue;
      v121[0] = &off_1BBEF0;
      v121[1] = v5;
      v120[2] = kOKPresentationGuidelineAuthoringSynopsisItemNavigationKeyPath;
      v121[2] = @"title";
      v122 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:3];
      v80 = 1;
      v124[1] = +[NSArray arrayWithObjects:&v122 count:1];
      objc_msgSend(v8, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v124, v123, 2));
    }
    else
    {
      v80 = 0;
    }
    v66 = [(OpusMarimbaProducer *)self _subtitleDictionaryForGuidelines];
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v69 = [v59 countByEnumeratingWithState:&v82 objects:v119 count:16];
    if (v69)
    {
      v40 = 0;
      v63 = *(id *)v83;
      v77 = kOKPresentationGuidelineAuthoringSynopsisGroupName;
      v75 = kOKPresentationGuidelineAuthoringSynopsisGroupItems;
      v41 = kOKPresentationGuidelineAuthoringSynopsisItemValue;
      v42 = kOKPresentationGuidelineAuthoringSynopsisItemNavigationKeyPath;
      v43 = kOKPresentationGuidelineAuthoringSynopsisItemType;
      do
      {
        v44 = 0;
        v72 = v40;
        do
        {
          if (*(id *)v83 != v63) {
            objc_enumerationMutation(v59);
          }
          v79 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v44);
          v45 = objc_msgSend(v66, "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(v79, "uniqueURL"), "absoluteString"));
          if (v45)
          {
            v46 = v45;
            v117[0] = v77;
            v118[0] = +[NSString stringWithFormat:@"%lu", v80];
            v117[1] = v75;
            v114[0] = v43;
            v114[1] = v41;
            v115[0] = &off_1BBEF0;
            v115[1] = v46;
            v114[2] = v42;
            v115[2] = +[NSString stringWithFormat:@"text-%d", (char *)v44 + (void)v72];
            v116 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:3];
            id v7 = &CATransform3DGetAffineTransform_ptr;
            v118[1] = +[NSArray arrayWithObjects:&v116 count:1];
            objc_msgSend(v8, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v118, v117, 2));
            v47 = v8;
            v48 = (uint64_t)v40;
            v49 = v80 + 1;
          }
          else
          {
            v47 = v8;
            v48 = (v72 + v44);
            id v7 = &CATransform3DGetAffineTransform_ptr;
            v49 = v80;
          }
          v112[0] = v77;
          v80 = v49 + 1;
          v113[0] = +[NSString stringWithFormat:@"%lu", v49];
          v112[1] = v75;
          v110[0] = &off_1BBF08;
          v109[0] = v43;
          v109[1] = v41;
          v110[1] = objc_msgSend(objc_msgSend(v79, "uniqueURL"), "absoluteString");
          v109[2] = v42;
          ++v40;
          v110[2] = +[NSString stringWithFormat:@"media-%d", v48];
          v111 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:3];
          v113[1] = +[NSArray arrayWithObjects:&v111 count:1];
          objc_msgSend(v47, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 2));
          v44 = (char *)v44 + 1;
          char v8 = v47;
        }
        while (v69 != v44);
        v40 = (char *)v44 + (void)v72;
        v69 = [v59 countByEnumeratingWithState:&v82 objects:v119 count:16];
      }
      while (v69);
    }
    v106 = kOKPresentationGuidelineAuthoringSynopsisCollectionGroups;
    v107 = v8;
    v108 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v39 = &v108;
  }
  objc_msgSend(-[OpusMarimbaProducer presentation](v50, "presentation"), "addGuideline:", +[OKPresentationGuideline guidelineAuthoringSynopsis:](OKPresentationGuideline, "guidelineAuthoringSynopsis:", objc_msgSend(v7[447], "arrayWithObjects:count:", v39, 1)));
}

- (id)_subtitleDictionaryForGuidelines
{
  id v2 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringMediaAttributes");
  id v3 = +[NSMutableDictionary dictionary];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6B128;
  v5[3] = &unk_1AAF18;
  v5[4] = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  return v3;
}

- (id)_durationDictionaryForGuidelines
{
  id v2 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringMediaAttributes");
  id v3 = +[NSMutableDictionary dictionary];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6B248;
  v5[3] = &unk_1AAF18;
  v5[4] = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  return v3;
}

- (BOOL)supportsLiveAuthoring
{
  return 1;
}

- (BOOL)needsLiveAuthoring
{
  objc_sync_enter(self);
  unint64_t currentFeederIndex = self->_currentFeederIndex;
  LOBYTE(currentFeederIndex) = currentFeederIndex < (unint64_t)objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder"), "numberOfMediaItems");
  objc_sync_exit(self);
  return currentFeederIndex;
}

- (BOOL)resetLiveAuthoring
{
  self->_unint64_t currentFeederIndex = 0;
  objc_sync_exit(self);
  return 0;
}

- (BOOL)liveAuthorInitialBootstrap:(id)a3 error:(id *)a4
{
  char v10 = 0;
  [(OpusMarimbaProducer *)self _initTemplates];
  if (!a3)
  {
    BOOL v7 = a4 == 0;
    [(OpusMarimbaProducer *)self _initCouchPotatoSettings];
    [(OpusMarimbaProducer *)self _initNavigatorSettingsForLiveAuthoring:1];
    goto LABEL_10;
  }
  (*((void (**)(id, char *, float))a3 + 2))(a3, &v10, 0.3);
  BOOL v7 = a4 == 0;
  if (a4 && v10) {
    goto LABEL_12;
  }
  if (v10) {
    return 0;
  }
  [(OpusMarimbaProducer *)self _initCouchPotatoSettings];
  (*((void (**)(id, char *, float))a3 + 2))(a3, &v10, 0.6);
  if (v10)
  {
    if (a4)
    {
LABEL_12:
      BOOL v9 = +[NSError errorWithDomain:OKErrorDomain code:-4 userInfo:0];
      BOOL result = 0;
      *a4 = v9;
      return result;
    }
    return 0;
  }
  [(OpusMarimbaProducer *)self _initNavigatorSettingsForLiveAuthoring:1];
  (*((void (**)(id, char *, float))a3 + 2))(a3, &v10, 0.6);
LABEL_10:
  BOOL result = v10 == 0;
  if (!v7 && v10) {
    goto LABEL_12;
  }
  return result;
}

- (id)liveAuthorNextChunk:(id)a3 error:(id *)a4
{
  objc_sync_enter(self);
  id v5 = objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder");
  unint64_t v6 = self->_currentFeederIndex + 100;
  self->_unint64_t currentFeederIndex = v6;
  if (v6 > (unint64_t)[v5 numberOfMediaItems]) {
    self->_unint64_t currentFeederIndex = (unint64_t)[v5 numberOfMediaItems];
  }
  objc_sync_exit(self);
  return &off_1BBFF8;
}

- (unint64_t)totalNumberOfLiveAuthoringItems
{
  objc_sync_enter(self);
  id v3 = objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder"), "numberOfMediaItems");
  objc_sync_exit(self);
  return (unint64_t)v3;
}

- (float)currentLiveAuthoringProgress
{
  objc_sync_enter(self);
  unint64_t currentFeederIndex = self->_currentFeederIndex;
  float v4 = (float)(currentFeederIndex + 1)
     / (float)(unint64_t)objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder"), "numberOfMediaItems");
  objc_sync_exit(self);
  return v4;
}

- (float)liveAuthoringProgressForMediaItem:(id)a3
{
  objc_sync_enter(self);
  id v5 = objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder"), "indexForMediaItem:", a3);
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    float v6 = 9.2234e18;
  }
  else {
    float v6 = (float)((unint64_t)v5 + 1)
  }
       / (float)(unint64_t)objc_msgSend(objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "rootMediaFeeder"), "numberOfMediaItems");
  objc_sync_exit(self);
  return v6;
}

- (void)didPanMediaForWidget:(id)a3 toState:(id)a4
{
  id v6 = [a4 objectForKeyedSubscript:@"mediaURL"];
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_6B770;
    v7[3] = &unk_1AAF40;
    v7[4] = a4;
    objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringMediaAttributesUpdateForKey:updateBlock:", objc_msgSend(v6, "absoluteString"), v7);
  }
}

- (void)didChangeTextForWidget:(id)a3 toSettings:(id)a4
{
  id v7 = [a4 objectForKeyedSubscript:@"attributedText"];
  if (v7)
  {
    id v8 = v7;
    if ([v7 length])
    {
      id v9 = [a4 objectForKeyedSubscript:@"mediaURL"];
      if (objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"isTitle"), "BOOLValue"))
      {
        objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "addGuideline:", +[OKPresentationGuideline guidelineAuthoringAttributedTitle:](OKPresentationGuideline, "guidelineAuthoringAttributedTitle:", v8));
        id v10 = [(OpusMarimbaProducer *)self presentation];
        objc_msgSend(v10, "removeGuidelineForGlobalUniqueKey:", +[OKPresentationGuideline globalUniqueKeyForKey:](OKPresentationGuideline, "globalUniqueKeyForKey:", kOKPresentationGuidelineAuthoringTitle));
        [(OpusMarimbaProducer *)self setSettingsObject:v8 forKeyPath:@"attributedTitle" onWidget:a3];
      }
      else if (v9)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_6B9B0;
        v12[3] = &unk_1AAF40;
        v12[4] = v8;
        objc_msgSend(-[OpusMarimbaProducer presentation](self, "presentation"), "guidelineAuthoringMediaAttributesUpdateForKey:updateBlock:", objc_msgSend(v9, "absoluteString"), v12);
        id v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "mergedSettings"), "objectForKeyedSubscript:", @"attributedSubtitles"), "mutableCopy");
        if (!v11) {
          id v11 = objc_alloc_init((Class)NSMutableDictionary);
        }
        objc_msgSend(v11, "setObject:forKey:", v8, objc_msgSend(v9, "absoluteString"));
        [(OpusMarimbaProducer *)self setSettingsObject:v11 forKeyPath:@"attributedSubtitles" onWidget:a3];
      }
    }
  }
}

+ (id)_mediaPropertiesForMediaItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [a3 metadata];
  [v5 duration];
  if (v6 < 3.0 && v6 > 0.0) {
    double v6 = 3.0;
  }
  id v8 = +[NSNumber numberWithDouble:v6];
  [v4 setObject:v8 forKeyedSubscript:kMPMetaDataDuration];
  [v4 setObject:&off_1BC070 forKeyedSubscript:kMPMetaDataStartTime];
  [v4 setObject:v8 forKeyedSubscript:kMPMetaDataStopTime];
  if ([v5 creationDate])
  {
    id v9 = [v5 creationDate];
    [v4 setObject:v9 forKeyedSubscript:kMPMetaDataCreationDate];
  }
  [v5 resolution];
  [v4 setObject:NSStringFromCGSize(v18) forKeyedSubscript:kMPMetaDataResolution];
  if ([v5 type] == (char *)&dword_0 + 3) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = +[NSNumber numberWithInt:v10];
  [v4 setObject:v11 forKeyedSubscript:kMPMetaDataMediaType];
  if ([v5 name])
  {
    id v12 = [v5 name];
    [v4 setObject:v12 forKeyedSubscript:kMPMetaDataCaption];
  }
  if ([v5 caption])
  {
    id v13 = [v5 caption];
    [v4 setObject:v13 forKeyedSubscript:kMPMetaDataComment];
  }
  [v5 longitude];
  v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v14 forKeyedSubscript:kMPMetaDataLongitude];
  [v5 latitude];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v15 forKeyedSubscript:kMPMetaDataLatitude];
  if ([v5 regionsOfInterest])
  {
    id v16 = [v5 regionsOfInterest];
    [v4 setObject:v16 forKeyedSubscript:kMPMetaDataRegionOfInterestRectangles];
  }
  return v4;
}

+ (id)_mediaAttributesForKey:(id)a3 withAttributes:(id)a4
{
  id v6 = objc_msgSend(a4, "objectForKeyedSubscript:");
  if (!v6)
  {
    id v6 = objc_alloc_init((Class)OKProducerMediaAttributes);
    [a4 setObject:v6 forKeyedSubscript:a3];
  }
  return v6;
}

+ (id)_transitionSettingsForTransition:(id)a3
{
  if (!a3) {
    return &off_1BBE60;
  }
  id v4 = (__CFString *)[a3 transitionID];
  id v5 = [a3 presetID];
  if (([(__CFString *)v4 isEqualToString:@"Dissolve"] & 1) != 0
    || ([(__CFString *)v4 isEqualToString:@"Push"] & 1) != 0
    || ([(__CFString *)v4 isEqualToString:@"Reveal"] & 1) != 0
    || ([(__CFString *)v4 isEqualToString:@"MoveIn"] & 1) != 0
    || ([(__CFString *)v4 isEqualToString:@"Uncover"] & 1) != 0
    || [(__CFString *)v4 isEqualToString:@"Cover"])
  {
    BOOL v6 = ([(__CFString *)v4 isEqualToString:@"Uncover"] & 1) == 0
      && ![(__CFString *)v4 isEqualToString:@"Cover"];
  }
  else
  {
    BOOL v6 = 1;
    id v4 = @"Dissolve";
  }
  if ([v5 isEqualToString:@"ToLeft"])
  {
    uint64_t v8 = 1;
  }
  else if ([v5 isEqualToString:@"ToRight"])
  {
    uint64_t v8 = 2;
  }
  else if ([v5 isEqualToString:@"ToTop"])
  {
    uint64_t v8 = 3;
  }
  else if ([v5 isEqualToString:@"ToBottom"])
  {
    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(__CFString *)v4 isEqualToString:@"Dissolve"]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  v11[0] = v4;
  v10[0] = @"transitionID";
  v10[1] = @"transitionDirection";
  v11[1] = +[NSNumber numberWithUnsignedInteger:v9];
  v10[2] = @"transitionDuration";
  [a3 duration];
  v11[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[3] = @"transitionWantsOpaquePages";
  v11[3] = +[NSNumber numberWithBool:v6];
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
}

@end
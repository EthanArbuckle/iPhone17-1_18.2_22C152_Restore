@interface _TUIFeedCaptureInfo
- (BOOL)suspendUpdatesUntilExceedingHeight;
- (NSArray)sectionLoaders;
- (NSString)title;
- (NSURL)packagesURL;
- (NSURL)url;
- (TUIFeedContent)content;
- (TUIFeedEntry)waitForLoadEntry;
- (TUIManager)manager;
- (TUITemplateFactory)factory;
- (_TUIFeedCaptureInfo)initWithURL:(id)a3 packagesURL:(id)a4;
- (void)dealloc;
- (void)updateSectionsFromJSON:(id)a3;
@end

@implementation _TUIFeedCaptureInfo

- (void)dealloc
{
  [(NSURL *)self->_url stopAccessingSecurityScopedResource];
  v3.receiver = self;
  v3.super_class = (Class)_TUIFeedCaptureInfo;
  [(_TUIFeedCaptureInfo *)&v3 dealloc];
}

- (_TUIFeedCaptureInfo)initWithURL:(id)a3 packagesURL:(id)a4
{
  v6 = (NSURL *)a3;
  id v7 = a4;
  v136.receiver = self;
  v136.super_class = (Class)_TUIFeedCaptureInfo;
  v8 = [(_TUIFeedCaptureInfo *)&v136 init];
  v9 = v8;
  if (v8)
  {
    url = v8->_url;
    v8->_url = v6;
    v11 = v6;

    p_packagesURL = (void **)&v9->_packagesURL;
    objc_storeStrong((id *)&v9->_packagesURL, a4);
    [(NSURL *)v9->_url startAccessingSecurityScopedResource];
    v13 = +[NSURLComponents componentsWithURL:v11 resolvingAgainstBaseURL:1];

    v14 = [v13 path];
    v15 = [v14 stringByStandardizingPath];
    [v13 setPath:v15];

    v16 = [v13 URL];

    v17 = objc_alloc_init(TUIManager);
    manager = v9->_manager;
    v9->_manager = v17;

    v19 = objc_alloc_init(TUIViewRegistry);
    [(TUIManager *)v9->_manager setViewRegistry:v19];

    v20 = objc_alloc_init(TUIElementRegistry);
    [(TUIManager *)v9->_manager setElementRegistry:v20];

    v21 = objc_alloc_init(TUIFilterRegistry);
    [(TUIManager *)v9->_manager setFilterRegistry:v21];

    v22 = objc_alloc_init(TUIDynamicRegistry);
    [(TUIManager *)v9->_manager setDynamicRegistry:v22];

    v23 = objc_alloc_init(TUIResourceRegistry);
    [(TUIManager *)v9->_manager setResourceRegistry:v23];

    v24 = [[TUIResourceLoader alloc] initWithProtocolClasses:0];
    [(TUIManager *)v9->_manager setResourceLoader:v24];

    v25 = [TUIImageResourceCache alloc];
    v26 = [(TUIManager *)v9->_manager resourceLoader];
    v27 = [(TUIManager *)v9->_manager filterRegistry];
    v28 = +[NSBundle mainBundle];
    v29 = [(TUIImageResourceCache *)v25 initWithLoader:v26 filters:v27 customImageBundle:v28];
    [(TUIManager *)v9->_manager setImageResourceCache:v29];

    v30 = [TUITemplateFactory alloc];
    v31 = [(TUIManager *)v9->_manager elementRegistry];
    v32 = [(TUITemplateFactory *)v30 initWithRegistry:v31];
    factory = v9->_factory;
    v9->_factory = v32;

    id v116 = objc_alloc_init((Class)BCULayerRenderer);
    id v34 = [objc_alloc((Class)BCUCoverEffects) initWithRenderer:v116];
    v35 = [(TUIManager *)v9->_manager filterRegistry];
    v115 = v34;
    v36 = [v34 templateImageFilters];
    [v35 registerImageFilters:v36];

    uint64_t v37 = [(NSURL *)v16 URLByAppendingPathComponent:@"feed.json"];
    v38 = +[NSData dataWithContentsOfURL:v37];
    v39 = +[NSJSONSerialization JSONObjectWithData:v38 options:0 error:0];

    uint64_t v40 = objc_opt_class();
    v41 = [v39 objectForKeyedSubscript:@"title"];
    uint64_t v42 = TUIDynamicCast(v40, v41);
    title = v9->_title;
    v9->_title = (NSString *)v42;

    uint64_t v44 = objc_opt_class();
    v45 = [v39 objectForKeyedSubscript:@"packages"];
    uint64_t v46 = TUIDynamicCast(v44, v45);

    v112 = (void *)v46;
    if (v46)
    {
      uint64_t v47 = +[NSURL URLWithString:v46 relativeToURL:v37];

      id v7 = (id)v47;
    }
    v114 = (void *)v37;
    if (!v7)
    {
      v48 = [(NSURL *)v16 URLByAppendingPathComponent:@"packages" isDirectory:1];
      id v7 = [v48 URLByResolvingSymlinksInPath];
    }
    char v135 = 0;
    v49 = +[NSFileManager defaultManager];
    v50 = [v7 path];
    unsigned __int8 v51 = [v49 fileExistsAtPath:v50 isDirectory:&v135];

    if ((v51 & 1) == 0)
    {
      v52 = [@"~/Library/FeedViewer/Packages" stringByExpandingTildeInPath];
      uint64_t v53 = +[NSURL fileURLWithPath:v52];

      id v7 = (id)v53;
    }
    id v54 = [v7 copy];
    v55 = *p_packagesURL;
    *p_packagesURL = v54;

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v56 = +[NSFileManager defaultManager];
    id v117 = v7;
    v57 = [v56 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

    id v58 = [v57 countByEnumeratingWithState:&v131 objects:v139 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = *(void *)v132;
      do
      {
        for (i = 0; i != v59; i = (char *)i + 1)
        {
          if (*(void *)v132 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = +[TUITemplateBundle bundleWithURL:*(void *)(*((void *)&v131 + 1) + 8 * i) requireInfoPlist:0];
          v63 = v62;
          if (v62) {
            [v62 registerPackagesWithFactory:v9->_factory];
          }
        }
        id v59 = [v57 countByEnumeratingWithState:&v131 objects:v139 count:16];
      }
      while (v59);
    }

    uint64_t v64 = objc_opt_class();
    v113 = v39;
    v65 = [v39 objectForKeyedSubscript:@"sections"];
    v66 = TUIDynamicCast(v64, v65);

    v67 = objc_opt_new();
    id v68 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v66, "count"));
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_755FC;
    v127[3] = &unk_253448;
    v69 = v9;
    v128 = v69;
    id v110 = v68;
    id v129 = v110;
    id v109 = v67;
    id v130 = v109;
    v111 = v66;
    [v66 enumerateObjectsUsingBlock:v127];
    v118 = v16;
    uint64_t v70 = [(NSURL *)v16 URLByAppendingPathComponent:@"dynamic-state" isDirectory:1];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    v71 = +[NSFileManager defaultManager];
    v108 = (void *)v70;
    v72 = [v71 enumeratorAtURL:v70 includingPropertiesForKeys:0 options:1 errorHandler:0];

    id v73 = [v72 countByEnumeratingWithState:&v123 objects:v138 count:16];
    if (v73)
    {
      id v74 = v73;
      uint64_t v75 = *(void *)v124;
      do
      {
        for (j = 0; j != v74; j = (char *)j + 1)
        {
          if (*(void *)v124 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = +[_TUIFeedCaptureDynamicStateProvider imageResourceProviderWithURL:*(void *)(*((void *)&v123 + 1) + 8 * (void)j)];
          if (v77)
          {
            v78 = [(TUIManager *)v9->_manager dynamicRegistry];
            v79 = [v77 kind];
            [v78 registerStateProvider:v77 forKind:v79];
          }
        }
        id v74 = [v72 countByEnumeratingWithState:&v123 objects:v138 count:16];
      }
      while (v74);
    }

    uint64_t v80 = [(NSURL *)v118 URLByAppendingPathComponent:@"images" isDirectory:1];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v81 = +[NSFileManager defaultManager];
    v107 = (void *)v80;
    v82 = [v81 enumeratorAtURL:v80 includingPropertiesForKeys:0 options:1 errorHandler:0];

    id v83 = [v82 countByEnumeratingWithState:&v119 objects:v137 count:16];
    if (v83)
    {
      id v84 = v83;
      uint64_t v85 = *(void *)v120;
      do
      {
        for (k = 0; k != v84; k = (char *)k + 1)
        {
          if (*(void *)v120 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = +[_TUIFeedCaptureImageResourceProvider imageResourceProviderWithURL:*(void *)(*((void *)&v119 + 1) + 8 * (void)k)];
          if (v87)
          {
            v88 = [(TUIManager *)v9->_manager resourceRegistry];
            v89 = [v87 kind];
            [v88 registerImageProvider:v87 forKind:v89];
          }
        }
        id v84 = [v82 countByEnumeratingWithState:&v119 objects:v137 count:16];
      }
      while (v84);
    }

    uint64_t v90 = +[TUIFeedContent feedContentWithEntries:v110 stackName:0];
    content = v69->_content;
    v69->_content = (TUIFeedContent *)v90;

    v92 = (NSArray *)[v109 copy];
    sectionLoaders = v69->_sectionLoaders;
    v69->_sectionLoaders = v92;

    uint64_t v94 = objc_opt_class();
    v95 = [v113 objectForKeyedSubscript:@"wait-for-section"];
    v96 = TUIDynamicCast(v94, v95);

    if (v96)
    {
      id v97 = [v96 unsignedIntegerValue];
      v98 = [(TUIFeedContent *)v69->_content entries];
      id v99 = [v98 count];

      if (v97 < v99)
      {
        v100 = [(TUIFeedContent *)v69->_content entries];
        uint64_t v101 = [v100 objectAtIndexedSubscript:[v96 unsignedIntegerValue]];
        waitForLoadEntry = v69->_waitForLoadEntry;
        v69->_waitForLoadEntry = (TUIFeedEntry *)v101;
      }
    }
    uint64_t v103 = objc_opt_class();
    v104 = [v113 objectForKeyedSubscript:@"suspend-updates-until-exceeding-height"];
    v105 = TUIDynamicCast(v103, v104);
    v69->_suspendUpdatesUntilExceedingHeight = [v105 BOOLValue];

    id v7 = v117;
    v6 = v118;
  }

  return v9;
}

- (void)updateSectionsFromJSON:(id)a3
{
  url = self->_url;
  id v5 = a3;
  v6 = [(NSURL *)url URLByAppendingPathComponent:@"feed.json"];
  id v7 = +[NSData dataWithContentsOfURL:v6];
  v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:0];

  uint64_t v9 = objc_opt_class();
  v10 = [v8 objectForKeyedSubscript:@"sections"];
  v11 = TUIDynamicCast(v9, v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_758D8;
  v13[3] = &unk_253470;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  [v5 enumerateIndexesUsingBlock:v13];
}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUITemplateFactory)factory
{
  return self->_factory;
}

- (NSString)title
{
  return self->_title;
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)packagesURL
{
  return self->_packagesURL;
}

- (TUIFeedEntry)waitForLoadEntry
{
  return self->_waitForLoadEntry;
}

- (BOOL)suspendUpdatesUntilExceedingHeight
{
  return self->_suspendUpdatesUntilExceedingHeight;
}

- (NSArray)sectionLoaders
{
  return self->_sectionLoaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionLoaders, 0);
  objc_storeStrong((id *)&self->_waitForLoadEntry, 0);
  objc_storeStrong((id *)&self->_packagesURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_factory, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end
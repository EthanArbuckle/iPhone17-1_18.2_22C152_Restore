@interface SRHMediaViewsStore
+ (void)initialize;
- (BOOL)connectionDidInvalidate;
- (CGRect)scrollViewVisibleArea;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)q;
- (SRHMediaViewsStore)initWithScrollView:(id)a3;
- (void)_writeMediaEventsToBiome:(id)a3;
- (void)addViewToStore:(id)a3;
- (void)dealloc;
- (void)markViewsAsOffScreen;
- (void)markViewsAsOnScreen;
- (void)processScrollViewOffset;
- (void)removeAllViews;
- (void)removeViewFromStore:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionDidInvalidate:(BOOL)a3;
- (void)setQ:(id)a3;
- (void)setupConnection;
@end

@implementation SRHMediaViewsStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _MergedGlobals_2 = (uint64_t)os_log_create("com.apple.SensorKit", "SRHMediaViewsStore");
  }
}

- (SRHMediaViewsStore)initWithScrollView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRHMediaViewsStore;
  v4 = [(SRHMediaViewsStore *)&v6 init];
  if (v4)
  {
    v4->_scrollView = (UIScrollView *)a3;
    v4->_offScreenMediaViews = (NSMapTable *)(id)[MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    v4->_onScreenMediaViews = (NSMapTable *)(id)[MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v4->_q = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SensorKit.SKMediaEventsHelper.XPCConnection", 0);
    [(SRHMediaViewsStore *)v4 setupConnection];
  }
  return v4;
}

- (void)setupConnection
{
  self->_connection = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKit.SKMediaEventsHelper"];
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270987F40]);
  [(NSXPCConnection *)self->_connection _setQueue:self->_q];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__SRHMediaViewsStore_setupConnection__block_invoke;
  v4[3] = &unk_2654ACB30;
  objc_copyWeak(&v5, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SRHMediaViewsStore_setupConnection__block_invoke_40;
  v3[3] = &unk_2654ACB58;
  v3[4] = self;
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v3];
  self->_connectionDidInvalidate = 0;
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __37__SRHMediaViewsStore_setupConnection__block_invoke(uint64_t a1)
{
  v2 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_25C113000, v2, OS_LOG_TYPE_INFO, "Connection to SKMediaEventsHelper has been invalidated.", v4, 2u);
  }
  return [objc_loadWeak((id *)(a1 + 32)) setConnectionDidInvalidate:1];
}

void __37__SRHMediaViewsStore_setupConnection__block_invoke_40(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_25C113000, v2, OS_LOG_TYPE_INFO, "Connection to SKMediaEventsHelper has been interrupted. %p", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  [(NSMapTable *)self->_offScreenMediaViews removeAllObjects];

  self->_offScreenMediaViews = 0;
  [(NSMapTable *)self->_onScreenMediaViews removeAllObjects];

  self->_onScreenMediaViews = 0;
  self->_scrollView = 0;
  [(NSXPCConnection *)self->_connection invalidate];
  dispatch_release((dispatch_object_t)self->_q);

  v3.receiver = self;
  v3.super_class = (Class)SRHMediaViewsStore;
  [(SRHMediaViewsStore *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  if ([(SRHMediaViewsStore *)self connectionDidInvalidate])
  {

    [(SRHMediaViewsStore *)self setupConnection];
  }
  return self->_connection;
}

- (void)addViewToStore:(id)a3
{
  if (!-[NSMapTable objectForKey:](self->_offScreenMediaViews, "objectForKey:"))
  {
    uint64_t v5 = objc_alloc_init(SRHMediaView);
    [(NSMapTable *)self->_offScreenMediaViews setObject:v5 forKey:a3];
  }
}

- (void)removeViewFromStore:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  p_offScreenMediaViews = &self->_offScreenMediaViews;
  if (![(NSMapTable *)self->_offScreenMediaViews objectForKey:a3])
  {
    p_offScreenMediaViews = &self->_onScreenMediaViews;
    id v7 = [(NSMapTable *)self->_onScreenMediaViews objectForKey:a3];
    if (!v7) {
      return;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v7, "uuid"), "UUIDString"));
    -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", [NSDictionary dictionaryWithDictionary:v5]);
  }
  v8 = *p_offScreenMediaViews;
  [(NSMapTable *)v8 removeObjectForKey:a3];
}

- (void)markViewsAsOffScreen
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v4 = [(NSMapTable *)self->_onScreenMediaViews keyEnumerator];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = v4;
  uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 134218499;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", v10, v14);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v11, "uuid"), "UUIDString"));
        v12 = _MergedGlobals_2;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
        {
          scrollView = self->_scrollView;
          *(_DWORD *)buf = v14;
          uint64_t v21 = v10;
          __int16 v22 = 2113;
          id v23 = v11;
          __int16 v24 = 2048;
          v25 = scrollView;
          _os_log_impl(&dword_25C113000, v12, OS_LOG_TYPE_INFO, "OffScreen event for view:%p, %{private}@, scrollView:%p (mark all visible media as offScreen)", buf, 0x20u);
        }
      }
      uint64_t v7 = [(NSEnumerator *)obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v7);
  }
  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", [NSDictionary dictionaryWithDictionary:v3]);
}

- (void)markViewsAsOnScreen
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v4 = [(NSMapTable *)self->_onScreenMediaViews keyEnumerator];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138478083;
    long long v13 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9), v13);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), objc_msgSend((id)objc_msgSend(v10, "uuid"), "UUIDString"));
        id v11 = _MergedGlobals_2;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
        {
          scrollView = self->_scrollView;
          *(_DWORD *)buf = v13;
          id v19 = v10;
          __int16 v20 = 2048;
          uint64_t v21 = scrollView;
          _os_log_impl(&dword_25C113000, v11, OS_LOG_TYPE_INFO, "OnScreen event for %{private}@, scrollView:%p (app is active)", buf, 0x16u);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", [NSDictionary dictionaryWithDictionary:v3]);
}

- (CGRect)scrollViewVisibleArea
{
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  double v4 = v3;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v6 = v4 + v5;
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  double v8 = v7;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v10 = v8 + v9;
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  double v12 = v11;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v14 = v13;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v16 = v12 - (v14 + v15);
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  double v18 = v17;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v20 = v19;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v22 = v18 - (v20 + v21);
  double v23 = v6;
  double v24 = v10;
  double v25 = v16;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)processScrollViewOffset
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v124 = __Block_byref_object_copy__0;
  v125 = __Block_byref_object_dispose__0;
  double v3 = (void *)qword_26B34E418;
  uint64_t v126 = qword_26B34E418;
  if (!qword_26B34E418)
  {
    v122[0] = MEMORY[0x263EF8330];
    v122[1] = 3221225472;
    v122[2] = __getUIApplicationClass_block_invoke;
    v122[3] = &unk_2654ACA10;
    v122[4] = buf;
    __getUIApplicationClass_block_invoke((uint64_t)v122);
    double v3 = *(void **)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  uint64_t v89 = objc_msgSend((id)objc_msgSend(v3, "sharedApplication"), "applicationState");
  id v87 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v4 = [(NSMapTable *)self->_onScreenMediaViews keyEnumerator];
  id v92 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v106 objects:v121 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v107 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self->_onScreenMediaViews objectForKey:v8];
        [v8 bounds];
        objc_msgSend(v8, "convertPoint:toView:", -[UIScrollView superview](self->_scrollView, "superview"), v10, v11);
        double v13 = v12;
        double v15 = v14;
        [v8 bounds];
        double v17 = v16;
        [v8 bounds];
        CGFloat v19 = v18;
        objc_msgSend(v9, "setPosition:", v13, v15, v17);
        [(SRHMediaViewsStore *)self scrollViewVisibleArea];
        v132.origin.x = v20;
        v132.origin.y = v21;
        v132.size.double width = v22;
        v132.size.double height = v23;
        v128.origin.x = v13;
        v128.origin.y = v15;
        v128.size.double width = v17;
        v128.size.double height = v19;
        CGRect v129 = CGRectIntersection(v128, v132);
        double width = v129.size.width;
        double height = v129.size.height;
        if (CGRectIsNull(v129)) {
          double v26 = 0.0;
        }
        else {
          double v26 = width * height;
        }
        [v8 bounds];
        double v28 = v27;
        [v8 bounds];
        if (v26 < v28 * v29 * 0.5)
        {
          [v92 addObject:v8];
          if (!v89)
          {
            objc_msgSend(v87, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v9, "uuid"), "UUIDString"));
            v30 = _MergedGlobals_2;
            if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
            {
              scrollView = self->_scrollView;
              *(_DWORD *)buf = 134218499;
              *(void *)&uint8_t buf[4] = v8;
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2048;
              v124 = (void (*)(uint64_t, uint64_t))scrollView;
              _os_log_impl(&dword_25C113000, v30, OS_LOG_TYPE_INFO, "OffScreen event for view:%p, %{private}@, scrollView:%p", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v106 objects:v121 count:16];
    }
    while (v5);
  }
  id v93 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  obuint64_t j = [(NSMapTable *)self->_offScreenMediaViews keyEnumerator];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v32 = [(NSEnumerator *)obj countByEnumeratingWithState:&v102 objects:v120 count:16];
  if (v32)
  {
    uint64_t v91 = *(void *)v103;
    *(void *)&long long v33 = 134218499;
    long long v86 = v33;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v103 != v91) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v102 + 1) + 8 * v34);
        objc_msgSend(v35, "bounds", v86);
        if (v36 > 67.0)
        {
          [v35 bounds];
          if (v37 > 67.0)
          {
            id v88 = [(NSMapTable *)self->_offScreenMediaViews objectForKey:v35];
            [v35 bounds];
            objc_msgSend(v35, "convertPoint:toView:", -[UIScrollView superview](self->_scrollView, "superview"), v38, v39);
            double v41 = v40;
            double v43 = v42;
            [v35 bounds];
            double v45 = v44;
            [v35 bounds];
            double v47 = v46;
            [(SRHMediaViewsStore *)self scrollViewVisibleArea];
            v133.origin.x = v48;
            v133.origin.y = v49;
            v133.size.double width = v50;
            v133.size.double height = v51;
            v130.origin.x = v41;
            v130.origin.y = v43;
            v130.size.double width = v45;
            v130.size.double height = v47;
            CGRect v131 = CGRectIntersection(v130, v133);
            double v52 = v131.size.width;
            double v53 = v131.size.height;
            double v54 = CGRectIsNull(v131) ? 0.0 : v52 * v53;
            [v35 bounds];
            double v56 = v55;
            [v35 bounds];
            if (v54 >= v56 * v57 * 0.5)
            {
              offScreenMediaViews = self->_offScreenMediaViews;
              onScreenMediaViews = self->_onScreenMediaViews;
              v60 = [(NSMapTable *)onScreenMediaViews keyEnumerator];
              long long v116 = 0u;
              long long v117 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              uint64_t v61 = [(NSEnumerator *)v60 countByEnumeratingWithState:&v114 objects:buf count:16];
              if (v61)
              {
                uint64_t v62 = *(void *)v115;
LABEL_32:
                uint64_t v63 = 0;
                while (1)
                {
                  if (*(void *)v115 != v62) {
                    objc_enumerationMutation(v60);
                  }
                  objc_msgSend(-[NSMapTable objectForKey:](onScreenMediaViews, "objectForKey:", *(void *)(*((void *)&v114 + 1) + 8 * v63)), "position");
                  if (isAreaOccupied(v64, v65, v66, v67, v41, v43, v45, v47)) {
                    break;
                  }
                  if (v61 == ++v63)
                  {
                    uint64_t v61 = [(NSEnumerator *)v60 countByEnumeratingWithState:&v114 objects:buf count:16];
                    if (v61) {
                      goto LABEL_32;
                    }
                    goto LABEL_38;
                  }
                }
              }
              else
              {
LABEL_38:
                long long v112 = 0u;
                long long v113 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                uint64_t v68 = [v93 countByEnumeratingWithState:&v110 objects:v122 count:16];
                if (v68)
                {
                  uint64_t v69 = *(void *)v111;
LABEL_40:
                  uint64_t v70 = 0;
                  while (1)
                  {
                    if (*(void *)v111 != v69) {
                      objc_enumerationMutation(v93);
                    }
                    objc_msgSend(-[NSMapTable objectForKey:](offScreenMediaViews, "objectForKey:", *(void *)(*((void *)&v110 + 1) + 8 * v70)), "position");
                    if (isAreaOccupied(v71, v72, v73, v74, v41, v43, v45, v47)) {
                      break;
                    }
                    if (v68 == ++v70)
                    {
                      uint64_t v68 = [v93 countByEnumeratingWithState:&v110 objects:v122 count:16];
                      if (v68) {
                        goto LABEL_40;
                      }
                      goto LABEL_46;
                    }
                  }
                }
                else
                {
LABEL_46:
                  [v93 addObject:v35];
                  objc_msgSend(v88, "setPosition:", v41, v43, v45, v47);
                  if (!v89)
                  {
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), objc_msgSend((id)objc_msgSend(v88, "uuid"), "UUIDString"));
                    v75 = _MergedGlobals_2;
                    if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
                    {
                      v76 = self->_scrollView;
                      *(_DWORD *)buf = v86;
                      *(void *)&uint8_t buf[4] = v35;
                      *(_WORD *)&buf[12] = 2113;
                      *(void *)&buf[14] = v88;
                      *(_WORD *)&buf[22] = 2048;
                      v124 = (void (*)(uint64_t, uint64_t))v76;
                      _os_log_impl(&dword_25C113000, v75, OS_LOG_TYPE_INFO, "OnScreen event for view:%p, %{private}@, scrollView:%p", buf, 0x20u);
                    }
                  }
                }
              }
            }
          }
        }
        ++v34;
      }
      while (v34 != v32);
      uint64_t v77 = [(NSEnumerator *)obj countByEnumeratingWithState:&v102 objects:v120 count:16];
      uint64_t v32 = v77;
    }
    while (v77);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v78 = [v92 countByEnumeratingWithState:&v98 objects:v119 count:16];
  if (v78)
  {
    uint64_t v79 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v78; ++j)
      {
        if (*(void *)v99 != v79) {
          objc_enumerationMutation(v92);
        }
        uint64_t v81 = *(void *)(*((void *)&v98 + 1) + 8 * j);
        [(NSMapTable *)self->_offScreenMediaViews setObject:[(NSMapTable *)self->_onScreenMediaViews objectForKey:v81] forKey:v81];
        [(NSMapTable *)self->_onScreenMediaViews removeObjectForKey:v81];
      }
      uint64_t v78 = [v92 countByEnumeratingWithState:&v98 objects:v119 count:16];
    }
    while (v78);
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v82 = [v93 countByEnumeratingWithState:&v94 objects:v118 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v95;
    do
    {
      for (uint64_t k = 0; k != v82; ++k)
      {
        if (*(void *)v95 != v83) {
          objc_enumerationMutation(v93);
        }
        uint64_t v85 = *(void *)(*((void *)&v94 + 1) + 8 * k);
        [(NSMapTable *)self->_onScreenMediaViews setObject:[(NSMapTable *)self->_offScreenMediaViews objectForKey:v85] forKey:v85];
        [(NSMapTable *)self->_offScreenMediaViews removeObjectForKey:v85];
      }
      uint64_t v82 = [v93 countByEnumeratingWithState:&v94 objects:v118 count:16];
    }
    while (v82);
  }

  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", [NSDictionary dictionaryWithDictionary:v87]);
}

- (void)removeAllViews
{
  [(SRHMediaViewsStore *)self markViewsAsOffScreen];
  [(NSMapTable *)self->_onScreenMediaViews removeAllObjects];
  offScreenMediaViews = self->_offScreenMediaViews;
  [(NSMapTable *)offScreenMediaViews removeAllObjects];
}

- (void)_writeMediaEventsToBiome:(id)a3
{
  if ([a3 count])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v6 = [(NSXPCConnection *)[(SRHMediaViewsStore *)self connection] remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
    [v6 writeMediaEvents:a3 withTimestamp:&__block_literal_global_49 reply:Current];
  }
}

void __47__SRHMediaViewsStore__writeMediaEventsToBiome___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138477827;
    uint64_t v5 = a2;
    _os_log_error_impl(&dword_25C113000, v3, OS_LOG_TYPE_ERROR, "Failed to set up connection with mediaEventsHelper sevice because of %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void __47__SRHMediaViewsStore__writeMediaEventsToBiome___block_invoke_47(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a2)
  {
    double v3 = _MergedGlobals_2;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138477827;
      uint64_t v5 = a2;
      _os_log_error_impl(&dword_25C113000, v3, OS_LOG_TYPE_ERROR, "Failed to write to Biome because of %{private}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)setConnection:(id)a3
{
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
}

@end
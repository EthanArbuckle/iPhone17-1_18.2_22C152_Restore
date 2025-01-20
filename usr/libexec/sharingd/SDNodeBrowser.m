@interface SDNodeBrowser
- (BOOL)onlySupportsADisk:(id)a3;
- (NSArray)nodes;
- (NSArray)sidebarNodes;
- (NSDictionary)options;
- (NSString)bundleID;
- (OS_xpc_object)connection;
- (SDNodeBrowser)initWithNode:(__SFNode *)a3 protocol:(id)a4 flags:(unint64_t)a5 kind:(id)a6;
- (SDNodeBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (id)airDropNodes;
- (id)domainChildren;
- (id)neighborhoodNodes;
- (id)nodesInternal:(BOOL)a3;
- (id)odiskNodes;
- (id)sharePointNodes;
- (id)sidebarNodesFromServerNodes:(id)a3 nonServerCount:(unint64_t)a4 addAllNode:(BOOL *)a5;
- (id)workgroupChildren;
- (int)addNode:(__SFNode *)a3;
- (int)removeNode:(__SFNode *)a3;
- (int64_t)mode;
- (void)addBonjourChildrenFromCache:(id)a3;
- (void)addClassroomChildrenFromCache:(id)a3;
- (void)addConnectedChildrenFromCache:(id)a3;
- (void)addFakeRangingMeasurementIfAppropriateToNodesInCache:(id)a3;
- (void)addManagedChildrenFromCache:(id)a3;
- (void)addRapportChildrenFromCache:(id)a3;
- (void)addWindowsChildrenFromCache:(id)a3;
- (void)appendAllNode:(id)a3;
- (void)connectedChanged:(id)a3;
- (void)copyOverBonjourInfo:(__SFNode *)a3 source:(__SFNode *)a4;
- (void)dealloc;
- (void)domainsChanged:(id)a3;
- (void)loadAirDrop;
- (void)loadBonjour;
- (void)loadClassroom;
- (void)loadConnected;
- (void)loadDomains;
- (void)loadManaged;
- (void)loadODisk;
- (void)loadRapport;
- (void)loadSidebarPrefsMonitor;
- (void)loadWindows;
- (void)loadWorkgroups;
- (void)managedChanged:(id)a3;
- (void)notifyClient;
- (void)notifyClientAboutWorkgroups;
- (void)serversChanged:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionState:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(int)a3;
- (void)setHelperConnection:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setUserName:(id)a3;
- (void)sharePointBrowser:(id)a3 nodesDidChangeWithError:(int)a4;
- (void)sidebarPrefsChanged:(id)a3;
- (void)start;
- (void)stop;
- (void)takeActionOnServerChanged:(id)a3 neighborhood:(id)a4;
- (void)unloadAirDrop;
- (void)unloadBonjour;
- (void)unloadClassroom;
- (void)unloadConnected;
- (void)unloadDomains;
- (void)unloadManaged;
- (void)unloadODisk;
- (void)unloadRapport;
- (void)unloadSharePoints;
- (void)unloadSidebarPrefsMonitor;
- (void)unloadWindows;
- (void)unloadWorkgroups;
- (void)updateSelectionReasonInNodes:(id)a3;
- (void)workgroupsChanged:(id)a3;
@end

@implementation SDNodeBrowser

- (SDNodeBrowser)initWithNode:(__SFNode *)a3 protocol:(id)a4 flags:(unint64_t)a5 kind:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v40.receiver = self;
  v40.super_class = (Class)SDNodeBrowser;
  v12 = [(SDNodeBrowser *)&v40 init];
  v13 = v12;
  if (v12)
  {
    v12->_mode = 0;
    objc_storeStrong((id *)&v12->_kind, a6);
    v14 = objc_alloc_init(SDNodeCoalescer);
    nodeCoalescer = v13->_nodeCoalescer;
    v13->_nodeCoalescer = v14;

    airDropDiscoveryLogger = v13->_airDropDiscoveryLogger;
    v13->_airDropDiscoveryLogger = 0;

    v13->_startTime = 0.0;
    v13->_shouldCollectNodeCoalescerMetrics = 1;
    coalescer = v13->_coalescer;
    v13->_coalescer = 0;

    connection = v13->_connection;
    v13->_connection = 0;

    objc_storeStrong((id *)&v13->_protocol, a4);
    odiskDomains = v13->_odiskDomains;
    v13->_odiskDomains = 0;

    airDropDomains = v13->_airDropDomains;
    v13->_airDropDomains = 0;

    bonjourDomains = v13->_bonjourDomains;
    v13->_bonjourDomains = 0;

    domainBrowser = v13->_domainBrowser;
    v13->_domainBrowser = 0;

    managedBrowser = v13->_managedBrowser;
    v13->_managedBrowser = 0;

    classroomBrowser = v13->_classroomBrowser;
    v13->_classroomBrowser = 0;

    workgroupBrowser = v13->_workgroupBrowser;
    v13->_workgroupBrowser = 0;

    connectedBrowser = v13->_connectedBrowser;
    v13->_connectedBrowser = 0;

    sharePointBrowser = v13->_sharePointBrowser;
    v13->_sharePointBrowser = 0;

    managedURLTable = v13->_managedURLTable;
    v13->_managedURLTable = 0;

    commentHashTable = v13->_commentHashTable;
    v13->_commentHashTable = 0;

    v13->_combineWorkgroups = 0;
    windowsWorkgroups = v13->_windowsWorkgroups;
    v13->_windowsWorkgroups = 0;

    originalNodes = v13->_originalNodes;
    v13->_originalNodes = 0;

    v13->_error = 0;
    objc_storeStrong((id *)&v13->_queue, &_dispatch_main_q);
    v13->_parent = (__SFNode *)CFRetain(a3);
    uint64_t v32 = +[SDStatusMonitor sharedMonitor];
    monitor = v13->_monitor;
    v13->_monitor = (SDStatusMonitor *)v32;

    uint64_t v34 = SFNodeCopyProtocols();
    protocols = v13->_protocols;
    v13->_protocols = (NSArray *)v34;

    contactIdentifierMap = v13->_contactIdentifierMap;
    v13->_contactIdentifierMap = 0;

    if (IsAppleInternalBuild())
    {
      v13->_showAllKnownPeopleInMagicHead = sub_1000D9060(@"ShowKnownInMagicHead", 0) != 0;
      uint64_t v37 = objc_opt_new();
      cachedFakeMeasurements = v13->_cachedFakeMeasurements;
      v13->_cachedFakeMeasurements = (NSMutableDictionary *)v37;
    }
  }

  return v13;
}

- (void)dealloc
{
  [(SDNodeBrowser *)self stop];
  parent = self->_parent;
  if (parent) {
    CFRelease(parent);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDNodeBrowser;
  [(SDNodeBrowser *)&v4 dealloc];
}

- (void)notifyClient
{
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (void)setUserName:(id)a3
{
}

- (void)setConnectionState:(int)a3
{
}

- (void)notifyClientAboutWorkgroups
{
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindPrinter])
  {
    [(SDNodeBrowser *)self notifyClient];
    return;
  }
  CFSetRef v3 = (const __CFSet *)SFNodeCopyWorkgroups();
  CFSetRef v4 = [(SDWorkgroupBrowser *)self->_workgroupBrowser workgroups];
  CFSetRef v5 = v4;
  if (v3)
  {
    CFIndex Count = CFSetGetCount(v3);
    if (v5)
    {
      CFIndex v7 = CFSetGetCount(v5);
      CFIndex v8 = v7;
      p_BOOL combineWorkgroups = &self->_combineWorkgroups;
      BOOL combineWorkgroups = self->_combineWorkgroups;
      if (Count < 1)
      {
        Mutable = 0;
      }
      else
      {
        CFIndex v27 = v7;
        __chkstk_darwin(v7);
        v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v12, v11);
        CFSetGetValues(v3, (const void **)v12);
        Mutable = CFSetCreateMutable(0, 0, &kCFCopyStringSetCallBacks);
        for (uint64_t i = 0; i != Count; ++i)
        {
          if (!CFSetContainsValue(v5, *(const void **)&v12[8 * i])) {
            CFSetSetValue(Mutable, *(const void **)&v12[8 * i]);
          }
        }
        CFIndex v8 = v27;
      }
      goto LABEL_17;
    }
    p_BOOL combineWorkgroups = &self->_combineWorkgroups;
    BOOL combineWorkgroups = self->_combineWorkgroups;
    Mutable = CFSetCreateMutableCopy(0, 0, v3);
  }
  else
  {
    if (v4)
    {
      CFIndex v8 = CFSetGetCount(v4);
      CFIndex Count = 0;
      Mutable = 0;
      p_BOOL combineWorkgroups = &self->_combineWorkgroups;
      BOOL combineWorkgroups = self->_combineWorkgroups;
LABEL_17:
      SFNodeSetWorkgroups();
      CFRelease(v5);
      goto LABEL_20;
    }
    CFIndex Count = 0;
    Mutable = 0;
    p_BOOL combineWorkgroups = &self->_combineWorkgroups;
    BOOL combineWorkgroups = self->_combineWorkgroups;
  }
  CFSetRef v15 = CFSetCreate(0, 0, 0, &kCFCopyStringSetCallBacks);
  SFNodeSetWorkgroups();
  CFRelease(v15);
  CFIndex v8 = 0;
LABEL_20:
  if (v8 >= [(SDStatusMonitor *)self->_monitor workgroupThreshold])
  {
    if (v8 <= [(SDStatusMonitor *)self->_monitor workgroupThreshold]) {
      goto LABEL_25;
    }
    char v16 = 0;
  }
  else
  {
    char v16 = 1;
  }
  *p_BOOL combineWorkgroups = v16;
LABEL_25:
  if (combineWorkgroups)
  {
    if (*p_combineWorkgroups)
    {
      v17 = Mutable;
      if (!Mutable) {
        goto LABEL_37;
      }
    }
    else
    {
      v17 = v3;
      if (!v3) {
        goto LABEL_40;
      }
    }
    CFSetRef v18 = (const __CFSet *)CFRetain(v17);
    if (v18)
    {
      CFSetRef v19 = v18;
      CFIndex v20 = CFSetGetCount(v18);
      if (v20)
      {
        uint64_t v21 = v20;
        v26[1] = v26;
        CFIndex v27 = v8;
        __chkstk_darwin(v20);
        v23 = (void *)((char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
        bzero(v23, v22);
        CFSetGetValues(v19, (const void **)v23);
        if (v21 >= 1)
        {
          do
          {
            v24 = +[SDServerBrowser sharedBrowser];
            uint64_t v25 = *v23++;
            [v24 stopBrowsingWorkgroup:v25];

            --v21;
          }
          while (v21);
        }
        CFIndex v8 = v27;
      }
      CFRelease(v19);
    }
  }
  if (!*p_combineWorkgroups) {
    goto LABEL_40;
  }
LABEL_37:
  if (v8 < 1)
  {
    if (Count < 1) {
      goto LABEL_41;
    }
LABEL_40:
    [(SDNodeBrowser *)self notifyClient];
    goto LABEL_41;
  }
  [(SDNodeBrowser *)self loadWindows];
LABEL_41:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)takeActionOnServerChanged:(id)a3 neighborhood:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 isEqualToString:@"com.apple.sharingd.BonjourChanged"]
    && (bonjourDomains = self->_bonjourDomains) != 0
    || [v8 isEqualToString:@"com.apple.sharingd.WindowsChanged"]
    && (bonjourDomains = self->_windowsWorkgroups) != 0
    || [v8 isEqualToString:@"com.apple.sharingd.ODisksChanged"]
    && (bonjourDomains = self->_odiskDomains) != 0
    || [v8 isEqualToString:@"com.apple.sharingd.AirDropChanged"]
    && (bonjourDomains = self->_airDropDomains) != 0)
  {
    if (([(NSMutableSet *)bonjourDomains containsObject:v6] & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"com.apple.sharingd.RapportChanged"])
  {
LABEL_10:
    [(SDNodeBrowser *)self setError:0];
    [(SDNodeBrowser *)self notifyClient];
  }
LABEL_11:
}

- (void)serversChanged:(id)a3
{
  id v4 = a3;
  id v7 = [v4 name];
  CFSetRef v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"NeighborhoodName"];
  [(SDNodeBrowser *)self takeActionOnServerChanged:v7 neighborhood:v6];
}

- (void)domainsChanged:(id)a3
{
  [(SDNodeBrowser *)self setError:0];

  [(SDNodeBrowser *)self notifyClient];
}

- (void)workgroupsChanged:(id)a3
{
  [(SDNodeBrowser *)self setError:0];

  [(SDNodeBrowser *)self notifyClientAboutWorkgroups];
}

- (void)sharePointBrowser:(id)a3 nodesDidChangeWithError:(int)a4
{
  id v5 = a3;
  id v6 = [v5 userName];
  [(SDNodeBrowser *)self setUserName:v6];

  id v7 = [v5 connectionState];
  [(SDNodeBrowser *)self setConnectionState:v7];

  [(SDNodeBrowser *)self notifyClient];
}

- (void)connectedChanged:(id)a3
{
  [(SDNodeBrowser *)self setError:0];

  [(SDNodeBrowser *)self notifyClient];
}

- (void)managedChanged:(id)a3
{
  [(SDNodeBrowser *)self setError:0];

  [(SDNodeBrowser *)self notifyClient];
}

- (void)sidebarPrefsChanged:(id)a3
{
  [(SDNodeBrowser *)self setError:0];

  [(SDNodeBrowser *)self notifyClient];
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3 && [(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    self->_mode = a3;
    id v5 = +[SDServerBrowser sharedBrowser];
    [v5 setBonjourBrowserMode:a3];
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)loadBonjour
{
  CFSetRef v3 = (const __CFSet *)SFNodeCopyKinds();
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && [(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    id v4 = (void *)SFNodeCopyDomains();
    if ([v4 count])
    {
      CFSetRef v19 = v4;
      id v5 = [v4 allObjects];
      if (!self->_bonjourDomains)
      {
        id v6 = (NSMutableSet *)objc_opt_new();
        bonjourDomains = self->_bonjourDomains;
        self->_bonjourDomains = v6;
      }
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.BonjourChanged" object:0];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            [(NSMutableSet *)self->_bonjourDomains addObject:v14];
            CFSetRef v15 = +[SDServerBrowser sharedBrowser];
            [v15 startBrowsingDomain:v14];

            if ([v14 isEqual:@"local"])
            {
              char v16 = +[SDServerBrowser sharedBrowser];
              [v16 setBonjourBrowserMode:self->_mode];
            }
            v17 = +[SDServerBrowser sharedBrowser];
            CFSetRef v18 = [v17 bonjourNodesForDomain:v14];

            if ([v18 count]) {
              [(SDNodeBrowser *)self notifyClient];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      id v4 = v19;
    }
  }
  CFRelease(v3);
}

- (void)loadWindows
{
  CFSetRef v3 = (const __CFSet *)SFNodeCopyKinds();
  if (CFSetContainsValue(v3, kSFNodeKindWorkgroup))
  {
    id v4 = (void *)SFNodeCopyWorkgroups();
    if ([v4 count])
    {
      id v5 = [v4 allObjects];
      if (!self->_windowsWorkgroups)
      {
        id v6 = (NSMutableSet *)objc_opt_new();
        windowsWorkgroups = self->_windowsWorkgroups;
        self->_windowsWorkgroups = v6;
      }
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.WindowsChanged" object:0];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            -[NSMutableSet addObject:](self->_windowsWorkgroups, "addObject:", v14, (void)v18);
            CFSetRef v15 = +[SDServerBrowser sharedBrowser];
            [v15 startBrowsingWorkgroup:v14];

            char v16 = +[SDServerBrowser sharedBrowser];
            v17 = [v16 windowsNodesForWorkgroup:v14];

            if ([v17 count]) {
              [(SDNodeBrowser *)self notifyClient];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
  CFRelease(v3);
}

- (void)loadDomains
{
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    CFSetRef v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"domainsChanged:" name:@"com.apple.sharingd.DomainsChanged" object:0];

    id v4 = +[SDDomainBrowser sharedBrowser];
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = v4;

    [(SDDomainBrowser *)self->_domainBrowser start];
    id v6 = [(SDDomainBrowser *)self->_domainBrowser childrenForNode:self->_parent];
    if ([v6 count]) {
      [(SDNodeBrowser *)self notifyClient];
    }
  }
}

- (void)loadWorkgroups
{
  if (([(NSString *)self->_kind isEqual:kSFBrowserKindNetwork] & 1) != 0
    || [(NSString *)self->_kind isEqual:kSFBrowserKindPrinter])
  {
    CFSetRef v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"workgroupsChanged:" name:@"com.apple.sharingd.WorkgroupsChanged" object:0];

    id v4 = +[SDWorkgroupBrowser sharedBrowser];
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = v4;

    [(SDWorkgroupBrowser *)self->_workgroupBrowser start];
    id v6 = [(SDWorkgroupBrowser *)self->_workgroupBrowser nodes];
    if ([v6 count]) {
      [(SDNodeBrowser *)self notifyClientAboutWorkgroups];
    }
  }
}

- (BOOL)onlySupportsADisk:(id)a3
{
  uint64_t v3 = kSFNodeProtocolAFP;
  id v4 = a3;
  LOBYTE(v3) = [v4 containsObject:v3];
  unsigned __int8 v5 = [v4 containsObject:kSFNodeProtocolSMB];
  unsigned __int8 v6 = [v4 containsObject:kSFNodeProtocolADisk];

  return v6 & ((v3 | v5) ^ 1);
}

- (void)loadConnected
{
  unsigned __int8 v3 = [(NSString *)self->_kind isEqual:kSFBrowserKindNetwork];
  uint64_t v4 = kSFBrowserKindRemoteDisc;
  if ((v3 & 1) != 0
    || ([(NSString *)self->_kind isEqual:kSFBrowserKindRemoteDisc] & 1) != 0
    || [(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop])
  {
    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"connectedChanged:" name:@"com.apple.sharingd.ConnectedChanged" object:0];

    unsigned __int8 v6 = +[SDConnectedBrowser sharedBrowser];
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = v6;

    [(SDConnectedBrowser *)self->_connectedBrowser start];
    unsigned __int8 v8 = [(NSString *)self->_kind isEqual:v4];
    id v9 = self->_connectedBrowser;
    if (v8) {
      [(SDConnectedBrowser *)v9 odiskNodes];
    }
    else {
    id v10 = [(SDConnectedBrowser *)v9 nodes];
    }
    if ([v10 count]) {
      [(SDNodeBrowser *)self notifyClient];
    }
  }
}

- (void)loadManaged
{
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"managedChanged:" name:@"com.apple.sharingd.ManagedChanged" object:0];

    uint64_t v4 = +[SDManagedBrowser sharedBrowser];
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = v4;

    [(SDManagedBrowser *)self->_managedBrowser start];
    id v6 = [(SDManagedBrowser *)self->_managedBrowser nodes];
    if ([v6 count]) {
      [(SDNodeBrowser *)self notifyClient];
    }
  }
}

- (void)loadODisk
{
  CFSetRef v3 = (const __CFSet *)SFNodeCopyKinds();
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && [(NSString *)self->_kind isEqual:kSFBrowserKindRemoteDisc])
  {
    uint64_t v4 = (void *)SFNodeCopyDomains();
    if ([v4 count])
    {
      unsigned __int8 v5 = [v4 allObjects];
      if (!self->_odiskDomains)
      {
        id v6 = (NSMutableSet *)objc_opt_new();
        odiskDomains = self->_odiskDomains;
        self->_odiskDomains = v6;
      }
      unsigned __int8 v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.ODisksChanged" object:0];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            -[NSMutableSet addObject:](self->_odiskDomains, "addObject:", v14, (void)v18);
            CFSetRef v15 = +[SDServerBrowser sharedBrowser];
            [v15 startODiskBrowsing:v14];

            char v16 = +[SDServerBrowser sharedBrowser];
            v17 = [v16 odiskNodesForDomain:v14];

            if ([v17 count]) {
              [(SDNodeBrowser *)self notifyClient];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
  CFRelease(v3);
}

- (void)loadClassroom
{
  CFSetRef v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 isClassroomEnabled];

  if (v4)
  {
    CFSetRef v5 = (const __CFSet *)SFNodeCopyKinds();
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && [(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop])
    {
      id v6 = +[NSNotificationCenter defaultCenter];
      [v6 addObserver:self selector:"classroomChanged:" name:@"com.apple.sharingd.ClassroomChanged" object:0];

      id v7 = +[SDClassroomBrowser sharedBrowser];
      classroomBrowser = self->_classroomBrowser;
      self->_classroomBrowser = v7;

      connection = self->_connection;
      if (connection)
      {
        id v10 = sub_1001B3F50(connection);
        [(SDClassroomBrowser *)self->_classroomBrowser setClientBundleID:v10];
      }
      [(SDClassroomBrowser *)self->_classroomBrowser start];
      id v11 = [(SDClassroomBrowser *)self->_classroomBrowser nodes];
      if ([v11 count]) {
        [(SDNodeBrowser *)self notifyClient];
      }
    }
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

- (void)loadAirDrop
{
  CFSetRef v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 isAirDropAllowed];

  if (v4)
  {
    CFSetRef v5 = (const __CFSet *)SFNodeCopyKinds();
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && [(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop])
    {
      id v6 = (void *)SFNodeCopyDomains();
      if ([v6 count])
      {
        long long v23 = v6;
        CFSetRef v24 = v5;
        id v7 = [v6 allObjects];
        if (!self->_airDropDomains)
        {
          unsigned __int8 v8 = (NSMutableSet *)objc_opt_new();
          airDropDomains = self->_airDropDomains;
          self->_airDropDomains = v8;
        }
        id v10 = +[NSNotificationCenter defaultCenter];
        [v10 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.AirDropChanged" object:0];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id obj = v7;
        id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v26 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v28 != v26) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              [(NSMutableSet *)self->_airDropDomains addObject:v14];
              if (self->_bundleID)
              {
                CFSetRef v15 = [(SDNodeBrowser *)self options];
                BOOL v16 = CFDictionaryGetInt64() != 0;

                v17 = +[SDServerBrowser sharedBrowser];
                bundleID = self->_bundleID;
                protocol = self->_protocol;
                long long v20 = [(SDNodeBrowser *)self helperConnection];
                [v17 startAirDropBrowsing:v14 bundleID:bundleID sessionID:protocol helperConnection:v20 delayBonjour:v16];
              }
              else
              {
                v17 = +[SDServerBrowser sharedBrowser];
                [v17 startAirDropBrowsing:v14 connection:self->_connection sessionID:self->_protocol];
              }

              long long v21 = +[SDServerBrowser sharedBrowser];
              long long v22 = [v21 airDropNodesForDomain:v14];

              if ([v22 count]) {
                [(SDNodeBrowser *)self notifyClient];
              }
            }
            id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v12);
        }

        id v6 = v23;
        CFSetRef v5 = v24;
      }
    }
    CFRelease(v5);
  }
}

- (void)loadSidebarPrefsMonitor
{
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"sidebarPrefsChanged:" name:@"com.apple.sharingd.FinderPrefsChanged" object:0];
  }
}

- (void)loadRapport
{
  CFSetRef v3 = (const __CFSet *)SFNodeCopyKinds();
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && [(NSString *)self->_kind isEqual:kSFNodeKindAirDrop])
  {
    unsigned int v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.RapportChanged" object:0];

    CFSetRef v5 = +[SDRapportBrowser sharedRapportBrowser];
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = v5;

    id v7 = [(SDNodeBrowser *)self helperConnection];
    [(SDRapportBrowser *)self->_rapportBrowser setHelperConnection:v7];

    [(SDRapportBrowser *)self->_rapportBrowser start];
    unsigned __int8 v8 = [(SDRapportBrowser *)self->_rapportBrowser nodes];
    if ([v8 count]) {
      [(SDNodeBrowser *)self notifyClient];
    }
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (id)domainChildren
{
  return [(SDDomainBrowser *)self->_domainBrowser childrenForNode:self->_parent];
}

- (id)workgroupChildren
{
  workgroupBrowser = self->_workgroupBrowser;
  if (workgroupBrowser)
  {
    if (!self->_combineWorkgroups)
    {
LABEL_5:
      workgroupBrowser = [workgroupBrowser nodes];
      goto LABEL_7;
    }
    if ([(NSString *)self->_kind isEqual:kSFBrowserKindPrinter])
    {
      workgroupBrowser = self->_workgroupBrowser;
      goto LABEL_5;
    }
    workgroupBrowser = 0;
  }
LABEL_7:

  return workgroupBrowser;
}

- (void)copyOverBonjourInfo:(__SFNode *)a3 source:(__SFNode *)a4
{
  id v4 = (id)SFNodeCopyModel();
  SFNodeSetModel();
  id v5 = (id)SFNodeCopyColor();
  SFNodeSetColor();
  id v6 = (id)SFNodeCopySiblingNodes();
  SFNodeSetSiblingNodes();
  id v7 = (id)SFNodeCopyDomain();
  SFNodeSetDomain();
  id v8 = (id)SFNodeCopyAppleID();
  SFNodeSetAppleID();
  id v9 = (id)SFNodeCopyIconData();
  SFNodeSetIconData();
  id v10 = (id)SFNodeCopyIconHash();
  SFNodeSetIconHash();
  id v11 = (id)SFNodeCopyLastName();
  SFNodeSetLastName();
  id v12 = (id)SFNodeCopyFirstName();
  SFNodeSetFirstName();
  id v13 = (id)SFNodeCopyContactIdentifier();
  SFNodeSetContactIdentifier();
  id v14 = (id)SFNodeCopyContactIdentifiers();
  SFNodeSetContactIdentifiers();
  id v15 = (id)SFNodeCopyComputerName();
  SFNodeSetComputerName();
  id v16 = (id)SFNodeCopySecondaryName();
  SFNodeSetSecondaryName();
  id v17 = (id)SFNodeCopyTransportBundleID();
  SFNodeSetTransportBundleID();
  id v18 = (id)SFNodeCopyBonjourProtocols();
  SFNodeSetBonjourProtocols();
  id v19 = (id)SFNodeCopyRapportFlags();
  SFNodeSetRapportFlags();
  SFNodeGetSupportedMedia();

  SFNodeSetSupportedMedia();
}

- (void)addBonjourChildrenFromCache:(id)a3
{
  id v4 = a3;
  uint64_t v37 = kSFBrowserKindRemoteDisc;
  if (-[NSString isEqual:](self->_kind, "isEqual:"))
  {
    uint64_t v5 = 112;
  }
  else
  {
    unsigned int v6 = [(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop];
    uint64_t v5 = 128;
    if (v6) {
      uint64_t v5 = 120;
    }
  }
  id v7 = *(id *)((char *)&self->super.isa + v5);
  if ([v7 count])
  {
    CFSetRef v8 = (const __CFSet *)SFNodeCopyKinds();
    CFSetRef v9 = v8;
    if (!self->_commentHashTable && CFSetContainsValue(v8, kSFNodeKindWorkgroup))
    {
      id v10 = (NSMutableDictionary *)objc_opt_new();
      commentHashTable = self->_commentHashTable;
      self->_commentHashTable = v10;
    }
    CFSetRef cf = v9;
    id v32 = v7;
    [v7 allObjects];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v38)
    {
      uint64_t v35 = *(void *)v45;
      uint64_t v33 = kSFBrowserKindAirDrop;
      v36 = self;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
          uint64_t v39 = v12;
          if ([(NSString *)self->_kind isEqual:v37])
          {
            id v14 = +[SDServerBrowser sharedBrowser];
            uint64_t v15 = [v14 odiskNodesForDomain:v13];
          }
          else
          {
            unsigned int v16 = [(NSString *)self->_kind isEqual:v33];
            id v17 = +[SDServerBrowser sharedBrowser];
            id v14 = v17;
            if (v16) {
              [v17 airDropNodesForDomain:v13];
            }
            else {
            uint64_t v15 = [v17 bonjourNodesForDomain:v13];
            }
          }
          id v18 = (void *)v15;

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v19 = v18;
          long long v20 = (char *)[v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v20)
          {
            long long v21 = v20;
            uint64_t v22 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(v19);
                }
                CFSetRef v24 = (void *)SFNodeCopyRealName();
                uint64_t v25 = [v24 lowercaseString];
                uint64_t v26 = [v4 objectForKeyedSubscript:v25];

                if (!v26)
                {
                  Copy = (const void *)SFNodeCreateCopy();
                  [v4 setObject:Copy forKeyedSubscript:v25];
                  CFRelease(Copy);
                }
                long long v28 = (const void *)SFNodeCopyKinds();
                long long v29 = (const void *)SFNodeCopyKinds();
                long long v30 = (const void *)SFNodeCopyDomain();
                CFRelease(v28);
                CFRelease(v30);
                CFRelease(v29);
              }
              long long v21 = (char *)[v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v21);
          }

          uint64_t v12 = v39 + 1;
          self = v36;
        }
        while ((id)(v39 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v38);
    }
    CFRelease(cf);

    id v7 = v32;
  }
  if (self->_commentHashTable && ![v4 count]) {
    [(NSMutableDictionary *)self->_commentHashTable removeAllObjects];
  }
}

- (void)addWindowsChildrenFromCache:(id)a3
{
  id v35 = a3;
  if (self->_windowsWorkgroups && (!self->_workgroupBrowser || self->_combineWorkgroups))
  {
    id v4 = objc_opt_new();
    uint64_t v33 = self;
    uint64_t v5 = [(NSMutableSet *)self->_windowsWorkgroups allObjects];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v42;
      do
      {
        CFSetRef v9 = 0;
        do
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v9);
          id v11 = +[SDServerBrowser sharedBrowser];
          uint64_t v12 = [v11 windowsNodesForWorkgroup:v10];

          if (v12) {
            [v4 addObjectsFromArray:v12];
          }

          CFSetRef v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v7);
    }
    long long v30 = v5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v4;
    id v14 = (char *)[v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
    uint64_t v15 = v33;
    if (v14)
    {
      unsigned int v16 = v14;
      uint64_t v17 = *(void *)v38;
      value = (void *)kSFNodeKindBonjour;
      v31 = (void *)kSFNodeProtocolSMB;
      uint64_t v32 = *(void *)v38;
      do
      {
        id v18 = 0;
        uint64_t v34 = v16;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v13);
          }
          CFSetRef v19 = (const __CFSet *)SFNodeCopyKinds();
          if (!CFSetContainsValue(v19, value))
          {
            long long v20 = (const void *)SFNodeCopyNetbiosName();
            long long v21 = (const void *)SFNodeCopyWorkgroup();
            CFStringRef v22 = (const __CFString *)SFNodeCopySecondaryName();
            CFStringRef v23 = v22;
            if (v15->_commentHashTable
              && v22
              && CFStringGetLength(v22)
              && (CFSetRef v24 = CFDictionaryGetValue((CFDictionaryRef)v15->_commentHashTable, v23)) != 0
              && ([v35 objectForKeyedSubscript:v24],
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                  v25,
                  v25)
              || ([v35 objectForKeyedSubscript:v20],
                  uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                  v26,
                  v26))
            {
              id v27 = v13;
              CFSetRef Copy = (const __CFSet *)SFNodeCopyKinds();
              CFArrayRef v29 = (const __CFArray *)SFNodeCopyProtocols();
              if (CFSetContainsValue(Copy, value)
                && (v47.length = CFArrayGetCount(v29), v47.location = 0, CFArrayContainsValue(v29, v47, v31)))
              {
                SFNodeAddKind();
              }
              else
              {
                SFNodeSetMountPoint();
                SFNodeSetSecondaryName();
                SFNodeSetNetbiosName();
                SFNodeSetWorkgroup();
                SFNodeAddKind();
                SFNodeRemoveKind();
                SFNodeRemoveKind();
                SFNodeRemoveKind();
              }
              CFRelease(v29);
              id v13 = v27;
              uint64_t v17 = v32;
            }
            else
            {
              CFSetRef Copy = (const __CFSet *)SFNodeCreateCopy();
              [v35 setObject:Copy forKeyedSubscript:v20];
            }
            unsigned int v16 = v34;
            CFRelease(Copy);
            if (v23) {
              CFRelease(v23);
            }
            CFRelease(v21);
            CFRelease(v20);
            uint64_t v15 = v33;
          }
          CFRelease(v19);
          ++v18;
        }
        while (v16 != v18);
        unsigned int v16 = (char *)[v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v16);
    }
  }
}

- (void)addClassroomChildrenFromCache:(id)a3
{
  id v4 = a3;
  classroomBrowser = self->_classroomBrowser;
  if (classroomBrowser)
  {
    id v6 = [(SDClassroomBrowser *)classroomBrowser nodes];
    id v7 = v6;
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
            id v13 = (void *)SFNodeCopyRealName();
            id v14 = [v13 lowercaseString];
            [v4 setObject:v12 forKeyedSubscript:v14];

            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)addManagedChildrenFromCache:(id)a3
{
  id v4 = a3;
  managedBrowser = self->_managedBrowser;
  if (managedBrowser)
  {
    id v6 = [(SDManagedBrowser *)managedBrowser nodes];
    if (v6)
    {
      managedURLTable = self->_managedURLTable;
      if (managedURLTable)
      {
        [(NSMutableDictionary *)managedURLTable removeAllObjects];
      }
      else
      {
        id v8 = (NSMutableDictionary *)objc_opt_new();
        id v9 = self->_managedURLTable;
        self->_managedURLTable = v8;
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      CFStringRef v22 = v6;
      id v10 = v6;
      id v11 = (char *)[v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = (void *)SFNodeCopyRealName();
            long long v16 = [v15 lowercaseString];
            if (v16)
            {
              long long v17 = [v4 objectForKeyedSubscript:v16];

              if (v17)
              {
                uint64_t v18 = SFNodeCopyURL();
                SFNodeAddKind();
                SFNodeSetURL();
                [v4 setObject:v17 forKeyedSubscript:v16];
                if (v18)
                {
                  CFSetRef v19 = (const void *)v18;
                  goto LABEL_16;
                }
              }
              else
              {
                uint64_t Copy = SFNodeCreateCopy();
                [v4 setObject:Copy forKeyedSubscript:v16];
                CFSetRef v19 = (const void *)Copy;
LABEL_16:
                CFRelease(v19);
              }
              long long v21 = (void *)SFNodeCopyURL();
              [(NSMutableDictionary *)self->_managedURLTable setObject:v16 forKeyedSubscript:v21];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = (char *)[v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }

      id v6 = v22;
    }
  }
}

- (void)addConnectedChildrenFromCache:(id)a3
{
  id v32 = a3;
  if (self->_connectedBrowser)
  {
    if ([(NSString *)self->_kind isEqual:kSFBrowserKindRemoteDisc])
    {
      id v4 = [(SDConnectedBrowser *)self->_connectedBrowser odiskNodes];
      if (!v4)
      {
LABEL_45:

        goto LABEL_46;
      }
    }
    else
    {
      unsigned int v5 = [(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop];
      connectedBrowser = self->_connectedBrowser;
      if (v5)
      {
        id v4 = [(SDConnectedBrowser *)connectedBrowser airDropNodes];
        if (!v4) {
          goto LABEL_45;
        }
      }
      else
      {
        id v4 = [(SDConnectedBrowser *)connectedBrowser nodes];
        if (!v4) {
          goto LABEL_45;
        }
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v4;
    id obj = v4;
    id v31 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v31) {
      goto LABEL_44;
    }
    uint64_t v30 = *(void *)v36;
    value = (void *)kSFNodeKindRecent;
    uint64_t v33 = (void *)kSFNodeKindConnected;
    long long v24 = (void *)kSFNodeKindBonjour;
LABEL_11:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v36 != v30) {
        objc_enumerationMutation(obj);
      }
      CFURLRef v8 = (const __CFURL *)SFNodeCopyURL();
      CFSetRef v9 = (const __CFSet *)SFNodeCopyKinds();
      int v10 = CFSetContainsValue(v9, value);
      int v11 = CFSetContainsValue(v9, v33);
      uint64_t v12 = (void *)SFNodeCopyRealName();
      managedURLTable = self->_managedURLTable;
      if (!managedURLTable
        || ([(NSMutableDictionary *)managedURLTable objectForKeyedSubscript:v8],
            (id v14 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v14 = [v12 lowercaseString:v23];
        if (!v14) {
          goto LABEL_40;
        }
      }
      long long v15 = [v32 objectForKeyedSubscript:v14, v23];

      if (v10)
      {
        unsigned int v16 = sub_1001B4670();
        if (!v15) {
          goto LABEL_28;
        }
        if (!v16) {
          goto LABEL_33;
        }
        CFStringRef v17 = CFURLCopyScheme(v8);
        CFSetRef theSet = (CFSetRef)SFNodeCopyKinds();
        uint64_t v18 = (const void *)SFNodeCopyProtocols();
        CFStringRef v27 = v17;
        if (!v17)
        {
          CFRelease(v18);
          CFRelease(theSet);
LABEL_33:
          SFNodeSetURL();
          SFNodeSetRealName();
          if (v10) {
            SFNodeAddKind();
          }
          else {
            SFNodeRemoveKind();
          }
          if (v11) {
            SFNodeAddKind();
          }
          else {
            SFNodeRemoveKind();
          }
          [v32 setObject:v15 forKeyedSubscript:v14];
          goto LABEL_40;
        }
        CFSetRef v19 = v18;
        CFIndex Count = CFArrayGetCount((CFArrayRef)v18);
        if (!CFSetContainsValue(theSet, v24))
        {
          CFRelease(v27);
          CFRelease(v19);
          long long v21 = theSet;
          goto LABEL_31;
        }
        v40.location = 0;
        v40.length = Count;
        int v26 = CFArrayContainsValue((CFArrayRef)v19, v40, v27);
        CFRelease(v27);
        CFRelease(v19);
        CFRelease(theSet);
        if (v26) {
          goto LABEL_33;
        }
      }
      else
      {
        if (!v15)
        {
          LOBYTE(v16) = 1;
LABEL_28:
          if (!v11 && (v16 & 1) != 0) {
            goto LABEL_40;
          }
          uint64_t Copy = SFNodeCreateCopy();
          [v32 setObject:Copy forKeyedSubscript:v14];
          long long v21 = (const void *)Copy;
LABEL_31:
          CFRelease(v21);
          goto LABEL_40;
        }
        if (v11) {
          goto LABEL_33;
        }
      }
LABEL_40:
      CFRelease(v8);
      CFRelease(v9);

      if (v31 == (id)++v7)
      {
        id v22 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        id v31 = v22;
        if (!v22)
        {
LABEL_44:

          id v4 = v23;
          goto LABEL_45;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_46:
}

- (void)addRapportChildrenFromCache:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDRapportBrowser *)self->_rapportBrowser nodes];
  id v6 = v5;
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        int v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
          uint64_t v12 = (void *)SFNodeCopyRealName();
          uint64_t v13 = [v12 lowercaseString];
          [v4 setObject:v11 forKeyedSubscript:v13];

          int v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)addFakeRangingMeasurementIfAppropriateToNodesInCache:(id)a3
{
  if (self->_showAllKnownPeopleInMagicHead)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10019A594;
    v3[3] = &unk_1008CF2B8;
    v3[4] = self;
    [a3 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

- (void)updateSelectionReasonInNodes:(id)a3
{
  id v3 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v4)
  {
    unsigned int v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v32;
    double v8 = 200.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        int v10 = (void *)SFNodeCopyRealName();
        uint64_t v11 = sub_1001AC8B8();
        uint64_t v12 = magic_head_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          long long v37 = v11;
          __int16 v38 = 2112;
          long long v39 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Evaluating %@ for %@", buf, 0x16u);
        }

        if (([v11 flags] & 2) != 0)
        {
          [v11 horizontalAngle];
          double v14 = v13;
          [v11 horizontalAngle];
          double v16 = v14 >= 0.0 ? v15 : -v15;
          if (v16 < v8)
          {
            id v17 = v10;

            double v8 = v16;
            id v6 = v17;
          }
        }
      }
      unsigned int v5 = (char *)[v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v3;
  CFSetRef v19 = (char *)[v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    long long v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (void *)SFNodeCopyRealName();
        id v24 = v6;
        id v25 = v23;
        if (v24 == v25)
        {
        }
        else
        {
          int v26 = v25;
          if ((v6 == 0) != (v25 != 0))
          {
            [v24 isEqual:v25];
          }
          else
          {
          }
        }
        SFNodeSetSelectionReason();
      }
      long long v20 = (char *)[v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

- (id)sidebarNodesFromServerNodes:(id)a3 nonServerCount:(unint64_t)a4 addAllNode:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  unsigned int v10 = [(SDStatusMonitor *)self->_monitor connectedEnabled];
  unsigned int v41 = [(SDStatusMonitor *)self->_monitor bonjourEnabled];
  unint64_t v11 = (unint64_t)[v8 count];
  if (v11)
  {
    long long v33 = self;
    long long v35 = v9;
    unint64_t v37 = a4;
    __int16 v38 = a5;
    uint64_t v12 = objc_opt_new();
    CFRange v40 = objc_opt_new();
    long long v34 = objc_opt_new();
    double v13 = objc_opt_new();
    id v36 = v8;
    id v14 = [v8 mutableCopy];
    [v14 sortUsingComparator:&stru_1008CF2F8];
    double v15 = 0;
    double v16 = (const void *)kSFNodeKindConnected;
    id v17 = (const void *)kSFNodeKindManaged;
    value = (void *)kSFNodeKindRecent;
    do
    {
      id v18 = [v14 objectAtIndexedSubscript:v15];

      CFSetRef v19 = (const __CFSet *)SFNodeCopyKinds();
      CFSetRef v20 = v19;
      if (v10 && (int v21 = CFSetContainsValue(v19, v16), v22 = v13, v21)
        || (v23 = CFSetContainsValue(v20, v17), id v22 = v12, v23)
        || v41 && (v24 = CFSetContainsValue(v20, value), id v22 = v40, v24))
      {
        [v22 addObject:v18];
      }
      CFRelease(v20);
      ++v15;
    }
    while ((char *)v11 != v15);
    id v25 = [v12 count];
    id v26 = [v13 count];
    id v27 = [v40 count];
    signed int v28 = [(SDStatusMonitor *)v33->_monitor sidebarMaxCount];
    if ((unint64_t)v27 >= v28 - ((unint64_t)v25 + (unint64_t)v26)) {
      unint64_t v29 = v28 - ((unint64_t)v25 + (void)v26);
    }
    else {
      unint64_t v29 = (unint64_t)v27;
    }
    if (v29)
    {
      long long v30 = [v40 subarrayWithRange:0];
      [v34 addObjectsFromArray:v30];
    }
    [v34 sortUsingComparator:&stru_1008CF318];
    uint64_t v9 = v35;
    [v35 addObjectsFromArray:v13];
    [v35 addObjectsFromArray:v12];
    [v35 addObjectsFromArray:v34];

    a4 = v37;
    a5 = v38;
    id v8 = v36;
  }
  char v31 = v10 | v41;
  if (!(v11 | a4)) {
    char v31 = 0;
  }
  *a5 = v31;

  return v9;
}

- (id)neighborhoodNodes
{
  id v3 = objc_opt_new();
  id v4 = [(SDNodeBrowser *)self domainChildren];
  [v3 addObjectsFromArray:v4];

  unsigned int v5 = [(SDNodeBrowser *)self workgroupChildren];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)sharePointNodes
{
  unsigned __int8 v3 = [(NSString *)self->_kind isEqual:kSFBrowserKindPrinter];
  sharePointBrowser = self->_sharePointBrowser;
  if (v3) {
    [(SDSharePointBrowser *)sharePointBrowser printerNodes];
  }
  else {
  unsigned int v5 = [(SDSharePointBrowser *)sharePointBrowser fileNodes];
  }

  return v5;
}

- (id)odiskNodes
{
  unsigned __int8 v3 = objc_opt_new();
  [(SDNodeBrowser *)self addBonjourChildrenFromCache:v3];
  [(SDNodeBrowser *)self addConnectedChildrenFromCache:v3];
  id v4 = [v3 allValues];

  return v4;
}

- (id)airDropNodes
{
  unsigned __int8 v3 = objc_opt_new();
  [(SDNodeBrowser *)self addBonjourChildrenFromCache:v3];
  [(SDNodeBrowser *)self addConnectedChildrenFromCache:v3];
  [(SDNodeBrowser *)self addClassroomChildrenFromCache:v3];
  [(SDNodeBrowser *)self addRapportChildrenFromCache:v3];
  [(SDNodeBrowser *)self addFakeRangingMeasurementIfAppropriateToNodesInCache:v3];
  nodeCoalescer = self->_nodeCoalescer;
  unsigned int v5 = [v3 allValues];
  id v6 = [(SDNodeCoalescer *)nodeCoalescer coalescedNodesForNewAvailableNodes:v5];

  [(SDAirDropDiscoveryLogger *)self->_airDropDiscoveryLogger updateWithAirDropNodes:v6];
  [(SDNodeBrowser *)self updateSelectionReasonInNodes:v6];

  return v6;
}

- (void)unloadBonjour
{
  bonjourDomains = self->_bonjourDomains;
  if (bonjourDomains)
  {
    id v4 = [(NSMutableSet *)bonjourDomains allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
          unsigned int v10 = +[SDServerBrowser sharedBrowser];
          [v10 stopBrowsingDomain:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    unint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:self name:@"com.apple.sharingd.BonjourChanged" object:0];

    uint64_t v12 = self->_bonjourDomains;
    self->_bonjourDomains = 0;
  }
}

- (void)unloadWindows
{
  windowsWorkgroups = self->_windowsWorkgroups;
  if (windowsWorkgroups)
  {
    id v4 = [(NSMutableSet *)windowsWorkgroups allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
          unsigned int v10 = +[SDServerBrowser sharedBrowser];
          [v10 stopBrowsingWorkgroup:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    unint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:self name:@"com.apple.sharingd.WindowsChanged" object:0];

    uint64_t v12 = self->_windowsWorkgroups;
    self->_windowsWorkgroups = 0;
  }
}

- (void)unloadDomains
{
  if (self->_domainBrowser)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.DomainsChanged" object:0];

    [(SDDomainBrowser *)self->_domainBrowser stop];
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = 0;
  }
}

- (void)unloadWorkgroups
{
  if (self->_workgroupBrowser)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.WorkgroupsChanged" object:0];

    [(SDWorkgroupBrowser *)self->_workgroupBrowser stop];
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = 0;
  }
}

- (void)unloadSharePoints
{
  sharePointBrowser = self->_sharePointBrowser;
  if (sharePointBrowser)
  {
    [(SDSharePointBrowser *)sharePointBrowser setDelegate:0];
    [(SDSharePointBrowser *)self->_sharePointBrowser stop];
    id v4 = self->_sharePointBrowser;
    self->_sharePointBrowser = 0;
  }
}

- (void)unloadConnected
{
  if (self->_connectedBrowser)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.ConnectedChanged" object:0];

    [(SDConnectedBrowser *)self->_connectedBrowser stop];
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = 0;
  }
}

- (void)unloadManaged
{
  if (self->_managedBrowser)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.ManagedChanged" object:0];

    [(SDManagedBrowser *)self->_managedBrowser stop];
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = 0;
  }
}

- (void)unloadClassroom
{
  if (self->_classroomBrowser)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.ClassroomChanged" object:0];

    [(SDClassroomBrowser *)self->_classroomBrowser stop];
    classroomBrowser = self->_classroomBrowser;
    self->_classroomBrowser = 0;
  }
}

- (void)unloadODisk
{
  odiskDomains = self->_odiskDomains;
  if (odiskDomains)
  {
    id v4 = [(NSMutableSet *)odiskDomains allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
          unsigned int v10 = +[SDServerBrowser sharedBrowser];
          [v10 stopODiskBrowsing:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    unint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:self name:@"com.apple.sharingd.ODisksChanged" object:0];

    uint64_t v12 = self->_odiskDomains;
    self->_odiskDomains = 0;
  }
}

- (void)unloadAirDrop
{
  airDropDomains = self->_airDropDomains;
  if (airDropDomains)
  {
    id v4 = [(NSMutableSet *)airDropDomains allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
          unsigned int v10 = +[SDServerBrowser sharedBrowser];
          [v10 stopAirDropBrowsing:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    unint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:self name:@"com.apple.sharingd.AirDropChanged" object:0];

    uint64_t v12 = self->_airDropDomains;
    self->_airDropDomains = 0;
  }
}

- (void)unloadSidebarPrefsMonitor
{
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindNetwork])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.FinderPrefsChanged" object:0];
  }
}

- (void)unloadRapport
{
  if (self->_rapportBrowser)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.RapportChanged" object:0];

    [(SDRapportBrowser *)self->_rapportBrowser stop];
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = 0;
  }
}

- (void)start
{
  if (!self->_coalescer)
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v3 = (CUCoalescer *)objc_opt_new();
    coalescer = self->_coalescer;
    self->_coalescer = v3;

    [(CUCoalescer *)self->_coalescer setDispatchQueue:self->_queue];
    [(CUCoalescer *)self->_coalescer setMaxDelay:0.05];
    [(CUCoalescer *)self->_coalescer setMinDelay:0.02];
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    unint64_t v11 = sub_10019BC18;
    uint64_t v12 = &unk_1008CA3B0;
    objc_copyWeak(&v13, &location);
    [(CUCoalescer *)self->_coalescer setActionHandler:&v9];
    if (SFNodeIsNeighborhood())
    {
      [(SDNodeBrowser *)self loadBonjour];
      [(SDNodeBrowser *)self loadWindows];
      [(SDNodeBrowser *)self loadDomains];
    }
    else if (SFNodeIsServer())
    {
      [(SDNodeBrowser *)self loadSharePoints];
    }
    if (SFNodeIsRoot())
    {
      [(SDNodeBrowser *)self loadWorkgroups];
      [(SDNodeBrowser *)self loadConnected];
      [(SDNodeBrowser *)self loadManaged];
      [(SDNodeBrowser *)self loadClassroom];
      [(SDNodeBrowser *)self loadODisk];
      [(SDNodeBrowser *)self loadRapport];
      [(SDNodeBrowser *)self loadAirDrop];
      [(SDNodeBrowser *)self loadSidebarPrefsMonitor];
    }
    [(CUCoalescer *)self->_coalescer trigger];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (!self->_airDropDiscoveryLogger)
  {
    id v5 = objc_alloc_init(SDAirDropDiscoveryLogger);
    airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    self->_airDropDiscoveryLogger = v5;

    uint64_t v7 = [(NSDictionary *)self->_options objectForKeyedSubscript:kSFBrowserOptionsShouldDisableDiscoveryMetricsKey];
    unsigned int v8 = [v7 BOOLValueSafe];

    if (v8) {
      self->_shouldCollectNodeCoalescerMetrics = 0;
    }
    self->_startTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)stop
{
  if (self->_coalescer)
  {
    [(SDNodeBrowser *)self unloadBonjour];
    [(SDNodeBrowser *)self unloadWindows];
    [(SDNodeBrowser *)self unloadDomains];
    [(SDNodeBrowser *)self unloadSharePoints];
    [(SDNodeBrowser *)self unloadWorkgroups];
    [(SDNodeBrowser *)self unloadConnected];
    [(SDNodeBrowser *)self unloadManaged];
    [(SDNodeBrowser *)self unloadClassroom];
    [(SDNodeBrowser *)self unloadODisk];
    [(SDNodeBrowser *)self unloadAirDrop];
    [(SDNodeBrowser *)self unloadRapport];
    if (SFNodeIsRoot()) {
      [(SDNodeBrowser *)self unloadSidebarPrefsMonitor];
    }
    SFNodeSetConnectionState();
    [(CUCoalescer *)self->_coalescer invalidate];
    coalescer = self->_coalescer;
    self->_coalescer = 0;
  }
  airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
  if (airDropDiscoveryLogger)
  {
    if (self->_shouldCollectNodeCoalescerMetrics)
    {
      [(SDAirDropDiscoveryLogger *)airDropDiscoveryLogger logMetricsWithSessionTime:CFAbsoluteTimeGetCurrent() - self->_startTime];
      airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    }
    self->_airDropDiscoveryLogger = 0;

    self->_startTime = 0.0;
  }
}

- (void)appendAllNode:(id)a3
{
  id v4 = a3;
  if (!qword_1009801F8)
  {
    CFStringRef v3 = sub_1000D8224(@"All...");
    qword_1009801F8 = SFNodeCreate();
    SFNodeAddKind();
    if (v3) {
      CFRelease(v3);
    }
  }
  [v4 addObject:qword_1009801F8];
}

- (id)nodesInternal:(BOOL)a3
{
  BOOL v3 = a3;
  char v15 = 0;
  id v5 = [(SDNodeBrowser *)self neighborhoodNodes];
  id v6 = [v5 count];
  uint64_t v7 = objc_opt_new();
  if (SFNodeIsRoot()) {
    BOOL v8 = v3;
  }
  else {
    BOOL v8 = 0;
  }
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindRemoteDisc])
  {
    uint64_t v9 = [(SDNodeBrowser *)self odiskNodes];
LABEL_8:
    uint64_t v10 = (void *)v9;
    [v7 addObjectsFromArray:v9];
    goto LABEL_12;
  }
  if ([(NSString *)self->_kind isEqual:kSFBrowserKindAirDrop])
  {
    uint64_t v9 = [(SDNodeBrowser *)self airDropNodes];
    goto LABEL_8;
  }
  uint64_t v10 = objc_opt_new();
  [(SDNodeBrowser *)self addBonjourChildrenFromCache:v10];
  [(SDNodeBrowser *)self addWindowsChildrenFromCache:v10];
  [(SDNodeBrowser *)self addManagedChildrenFromCache:v10];
  [(SDNodeBrowser *)self addConnectedChildrenFromCache:v10];
  unint64_t v11 = [v10 allValues];
  if (v8)
  {
    uint64_t v12 = [(SDNodeBrowser *)self sidebarNodesFromServerNodes:v11 nonServerCount:v6 addAllNode:&v15];

    unint64_t v11 = (void *)v12;
  }
  [v7 addObjectsFromArray:v11];

LABEL_12:
  if (self->_sharePointBrowser)
  {
    id v13 = [(SDNodeBrowser *)self sharePointNodes];
    [v7 addObjectsFromArray:v13];
  }
  if (v8)
  {
    if (v15 && [(SDStatusMonitor *)self->_monitor allEnabled]) {
      [(SDNodeBrowser *)self appendAllNode:v7];
    }
  }
  else if (v6)
  {
    [v7 addObjectsFromArray:v5];
  }

  return v7;
}

- (NSArray)nodes
{
  return (NSArray *)[(SDNodeBrowser *)self nodesInternal:0];
}

- (NSArray)sidebarNodes
{
  return (NSArray *)[(SDNodeBrowser *)self nodesInternal:1];
}

- (int)addNode:(__SFNode *)a3
{
  connectedBrowser = self->_connectedBrowser;
  if (connectedBrowser) {
    return [(SDConnectedBrowser *)connectedBrowser addNode:a3];
  }
  else {
    return -1;
  }
}

- (int)removeNode:(__SFNode *)a3
{
  CFSetRef v5 = (const __CFSet *)SFNodeCopyKinds();
  if (!v5) {
    return -1;
  }
  CFSetRef v6 = v5;
  if (CFSetContainsValue(v5, kSFNodeKindPerson) || (connectedBrowser = self->_connectedBrowser) == 0) {
    int v7 = -1;
  }
  else {
    int v7 = [(SDConnectedBrowser *)connectedBrowser removeNode:a3];
  }
  CFRelease(v6);
  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helperConnection);

  return (SDXPCHelperConnection *)WeakRetained;
}

- (void)setHelperConnection:(id)a3
{
}

- (SDNodeBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDNodeBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 280, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_cachedFakeMeasurements, 0);
  objc_storeStrong((id *)&self->_contactIdentifierMap, 0);
  objc_storeStrong((id *)&self->_originalNodes, 0);
  objc_storeStrong((id *)&self->_commentHashTable, 0);
  objc_storeStrong((id *)&self->_managedURLTable, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_sharePointBrowser, 0);
  objc_storeStrong((id *)&self->_workgroupBrowser, 0);
  objc_storeStrong((id *)&self->_connectedBrowser, 0);
  objc_storeStrong((id *)&self->_classroomBrowser, 0);
  objc_storeStrong((id *)&self->_managedBrowser, 0);
  objc_storeStrong((id *)&self->_domainBrowser, 0);
  objc_storeStrong((id *)&self->_windowsWorkgroups, 0);
  objc_storeStrong((id *)&self->_bonjourDomains, 0);
  objc_storeStrong((id *)&self->_airDropDomains, 0);
  objc_storeStrong((id *)&self->_odiskDomains, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_airDropDiscoveryLogger, 0);
  objc_storeStrong((id *)&self->_nodeCoalescer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

@end
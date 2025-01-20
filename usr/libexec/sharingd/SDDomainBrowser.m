@interface SDDomainBrowser
+ (id)sharedBrowser;
- (SDDomainBrowser)init;
- (id)childrenForNode:(__SFNode *)a3;
- (id)displayNameForDomain:(id)a3;
- (void)browseAfterDelay:(double)a3;
- (void)buildNodes;
- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5;
- (void)parseDomain:(id)a3;
- (void)postNotification;
- (void)restart;
- (void)scheduleBrowser;
- (void)start;
- (void)statusChanged:(id)a3;
- (void)stop;
@end

@implementation SDDomainBrowser

+ (id)sharedBrowser
{
  if (qword_100980290 != -1) {
    dispatch_once(&qword_100980290, &stru_1008CFBE0);
  }
  v2 = (void *)qword_100980298;

  return v2;
}

- (SDDomainBrowser)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDDomainBrowser;
  v2 = [(SDDomainBrowser *)&v9 init];
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0;

    v3->_clientCount = 0;
    domainBrowser = v3->_domainBrowser;
    v3->_domainBrowser = 0;

    v3->_sendNotification = 0;
    uint64_t v6 = objc_opt_new();
    domains = v3->_domains;
    v3->_domains = (NSMutableSet *)v6;

    v3->_domainTree = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_1008CFAB8, &kCFTypeDictionaryValueCallBacks);
  }
  return v3;
}

- (void)browseAfterDelay:(double)a3
{
  timer = self->_timer;
  dispatch_time_t v4 = sub_1001B1AF8(a3);

  sub_1001B1BC4(timer, v4);
}

- (void)statusChanged:(id)a3
{
}

- (void)scheduleBrowser
{
  v3 = (NSNetServiceBrowser *)objc_alloc_init((Class)NSNetServiceBrowser);
  domainBrowser = self->_domainBrowser;
  self->_domainBrowser = v3;

  [(NSNetServiceBrowser *)self->_domainBrowser searchForBrowsableDomains];
  v5 = self->_domainBrowser;

  [(NSNetServiceBrowser *)v5 setDelegate:self];
}

- (void)restart
{
  if (self->_clientCount >= 1)
  {
    [(NSMutableSet *)self->_domains removeAllObjects];
    domainBrowser = self->_domainBrowser;
    if (domainBrowser) {
      [(NSNetServiceBrowser *)domainBrowser stop];
    }
    CFDictionaryRemoveAllValues(self->_domainTree);
    [(SDDomainBrowser *)self scheduleBrowser];
  }
}

- (id)childrenForNode:(__SFNode *)a3
{
  if (SFNodeIsRoot())
  {
    Value = (void *)CFDictionaryGetValue(self->_domainTree, &stru_1008E7020);
  }
  else
  {
    CFSetRef v5 = (const __CFSet *)SFNodeCopyKinds();
    if (CFSetContainsValue(v5, kSFNodeKindDomain))
    {
      uint64_t v6 = (const void *)SFNodeCopyRealName();
      Value = (void *)CFDictionaryGetValue(self->_domainTree, v6);
      CFRelease(v6);
    }
    else
    {
      Value = 0;
    }
    CFRelease(v5);
  }

  return [Value allValues];
}

- (id)displayNameForDomain:(id)a3
{
  v3 = (__CFString *)a3;
  dispatch_time_t v4 = (char *)[(__CFString *)v3 length] + 1;
  CFSetRef v5 = (char *)malloc_type_malloc((size_t)v4, 0x25665BCEuLL);
  if (CFStringGetCString(v3, v5, (CFIndex)v4, 0x8000100u))
  {
    Mutable = CFStringCreateMutable(0, 0);
    if (v5 && *v5)
    {
      v7 = (unsigned __int8 *)v5;
      do
      {
        v7 = sub_1001B9074(v7, (uint64_t)&v11);
        CFStringRef v8 = CFStringCreateWithCString(0, (const char *)&v11, 0x8000100u);
        if (v8)
        {
          CFStringRef v9 = v8;
          CFStringAppend(Mutable, v8);
          CFRelease(v9);
        }
        if (!v7) {
          break;
        }
        if (*v7) {
          CFStringAppend(Mutable, @".");
        }
      }
      while (*v7);
    }
  }
  else
  {
    Mutable = 0;
  }
  free(v5);

  return Mutable;
}

- (void)parseDomain:(id)a3
{
  dispatch_time_t v4 = (__CFString *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)cStr = 0u;
  long long v27 = 0u;
  if (v4)
  {
    bzero(v25, 0x400uLL);
    id v5 = [(__CFString *)v4 length];
    uint64_t v6 = (char *)malloc_type_malloc((size_t)v5 + 1, 0xEAAC5916uLL);
    CFStringGetCString(v4, v6, (CFIndex)v5 + 1, 0x8000100u);
    uint64_t v7 = 0;
    v6[(void)v5 - 1] = 0;
    v24 = v6;
    CFStringRef v8 = (unsigned __int8 *)v6;
    while (*v8)
    {
      uint64_t v9 = v7 + 1;
      v25[v7] = v8;
      CFStringRef v8 = sub_1001B9074(v8, (uint64_t)cStr);
      uint64_t v7 = v9;
      if (!v8) {
        goto LABEL_7;
      }
    }
    LODWORD(v9) = v7;
LABEL_7:
    int v10 = v9 - 1;
    if ((int)v9 >= 1)
    {
      CFStringRef v11 = 0;
      BOOL v12 = 0;
      uint64_t v13 = v9 + 1;
      do
      {
        if (v11) {
          CFRelease(v11);
        }
        v14 = (char *)v25[v10];
        CFStringRef v11 = CFStringCreateWithCString(0, v14, 0x8000100u);
        if (v12)
        {
          v15 = sub_1001B9074((unsigned __int8 *)v14, (uint64_t)cStr);
          CFStringRef v16 = CFStringCreateWithCString(0, cStr, 0x8000100u);
          CFStringRef v17 = CFStringCreateWithCString(0, (const char *)v15, 0x8000100u);
          Value = (void *)CFDictionaryGetValue(self->_domainTree, v17);
          if (!Value)
          {
            Value = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_1008CFAB8, &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, v17, Value);
            CFRelease(Value);
          }
          if (!CFDictionaryGetValue((CFDictionaryRef)Value, v16))
          {
            v19 = (const void *)SFNodeCreate();
            SFNodeAddDomain();
            SFNodeAddKind();
            SFNodeSetDomain();
            CFDictionarySetValue((CFMutableDictionaryRef)Value, v16, v19);
            CFRelease(v19);
          }
          CFRelease(v16);
          CFRelease(v17);
          BOOL v12 = 1;
        }
        else
        {
          CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(self->_domainTree, &stru_1008E7020);
          if (v20) {
            BOOL v12 = CFDictionaryGetValue(v20, v11) != 0;
          }
          else {
            BOOL v12 = 0;
          }
        }
        --v13;
        --v10;
      }
      while (v13 > 1);
      if (v11)
      {
        if (!v12)
        {
          Mutable = (void *)CFDictionaryGetValue(self->_domainTree, &stru_1008E7020);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_1008CFAB8, &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, &stru_1008E7020, Mutable);
            CFRelease(Mutable);
          }
          v22 = [(SDDomainBrowser *)self displayNameForDomain:v11];
          v23 = (const void *)SFNodeCreate();
          SFNodeAddDomain();
          SFNodeAddKind();
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v11, v23);
          CFRelease(v23);
        }
        CFRelease(v11);
      }
    }
    free(v24);
  }
}

- (void)buildNodes
{
  CFDictionaryRemoveAllValues(self->_domainTree);
  v3 = [(NSMutableSet *)self->_domains allObjects];

  if (v3)
  {
    uint64_t Count = CFArrayGetCount((CFArrayRef)v3);
    MutableCopy = CFArrayCreateMutableCopy(0, Count, (CFArrayRef)v3);
    v8.location = 0;
    v8.length = Count;
    CFArraySortValues(MutableCopy, v8, (CFComparatorFunction)sub_1001B95A0, self);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
        [(SDDomainBrowser *)self parseDomain:CFArrayGetValueAtIndex(MutableCopy, i)];
    }
    CFRelease(MutableCopy);
  }
}

- (void)postNotification
{
  if (self->_clientCount >= 1)
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 postNotificationName:@"com.apple.sharingd.DomainsChanged" object:0 userInfo:0];
  }
}

- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5
{
  id v9 = a4;
  uint64_t v7 = [v9 lowercaseString];
  CFRange v8 = v7;
  if (v7 && ([v7 isEqualToString:@"local."] & 1) == 0) {
    [(NSMutableSet *)self->_domains addObject:v9];
  }
  if (!a5)
  {
    [(SDDomainBrowser *)self buildNodes];
    [(SDDomainBrowser *)self postNotification];
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  [(NSMutableSet *)self->_domains removeObject:a4];
  if (!a5)
  {
    [(SDDomainBrowser *)self buildNodes];
    [(SDDomainBrowser *)self postNotification];
  }
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v4 = a4;
  id v5 = browser_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001B9AC0((uint64_t)v4, v5);
  }
}

- (void)start
{
  clientuint64_t Count = self->_clientCount;
  self->_clientuint64_t Count = clientCount + 1;
  if (!clientCount)
  {
    [(SDDomainBrowser *)self scheduleBrowser];
    if (!self->_timer)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001B98C0;
      v7[3] = &unk_1008CA4B8;
      v7[4] = self;
      sub_1001B1B10(1, &_dispatch_main_q, v7);
      id v4 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v4;

      dispatch_resume((dispatch_object_t)self->_timer);
    }
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"statusChanged:" name:@"com.apple.sharingd.MulticastDNSChanged" object:0];
  }
}

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_clientuint64_t Count = v2;
  if (!v2)
  {
    domainBrowser = self->_domainBrowser;
    if (domainBrowser)
    {
      [(NSNetServiceBrowser *)domainBrowser setDelegate:0];
      [(NSNetServiceBrowser *)self->_domainBrowser stop];
      id v5 = self->_domainBrowser;
      self->_domainBrowser = 0;
    }
    [(NSMutableSet *)self->_domains removeAllObjects];
    CFDictionaryRemoveAllValues(self->_domainTree);
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBrowser, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_domains, 0);
}

@end
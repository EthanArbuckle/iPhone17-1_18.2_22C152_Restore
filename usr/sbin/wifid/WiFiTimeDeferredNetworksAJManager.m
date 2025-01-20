@interface WiFiTimeDeferredNetworksAJManager
- (BOOL)canDeferNetwork:(__WiFiNetwork *)a3 withUsageRank:(unint64_t)a4 andMotionState:(int)a5;
- (BOOL)deferNetwork:(__WiFiNetwork *)a3;
- (BOOL)isTimeDeferredNetworksPresent;
- (WiFiTimeDeferredNetworksAJManager)initWithArgs:(__WiFiDeviceManager *)a3;
- (double)deferIntervalSecs;
- (unint64_t)numDaysSinceAssocOverrideDeferral;
- (unint64_t)usageRankForDeferral;
- (void)clearScanResultsForAutoJoinSessionReset;
- (void)dealloc;
- (void)printDeferredNetworks;
- (void)setDeferIntervalSecs:(double)a3;
- (void)setLinkDown;
- (void)setLinkUpForNetwork:(__WiFiNetwork *)a3;
- (void)setNumDaysSinceAssocOverrideDeferral:(unint64_t)a3;
- (void)setScanResultsWithAutoJoinSessionCompletion:(id)a3 complete:(BOOL)a4;
- (void)setUsageRankForDeferral:(unint64_t)a3;
@end

@implementation WiFiTimeDeferredNetworksAJManager

- (void)setScanResultsWithAutoJoinSessionCompletion:(id)a3 complete:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: scanResults NULL", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]"];
    }
    goto LABEL_15;
  }
  if (![a3 count])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, "%s: no scan results", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]"];
    }
LABEL_15:
    goto LABEL_10;
  }
  [(NSMutableArray *)self->_cumulativeAutoJoinScanResults addObjectsFromArray:a3];
  if (v4)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3052000000;
    v23 = sub_100022D68;
    v24 = sub_100022C4C;
    id v25 = (id)0xAAAAAAAAAAAAAAAALL;
    id v25 = objc_alloc_init((Class)NSMutableString);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3052000000;
    v17 = sub_100022D68;
    v18 = sub_100022C4C;
    id v19 = (id)0xAAAAAAAAAAAAAAAALL;
    id v19 = +[NSMutableIndexSet indexSet];
    networks = self->_networks;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10017201C;
    v13[3] = &unk_100243168;
    v13[4] = self;
    v13[5] = &v14;
    v13[6] = &v20;
    [(NSMutableArray *)networks enumerateObjectsUsingBlock:v13];
    id v9 = [(id)v15[5] count];
    v10 = v21;
    if (v9 && v21[5])
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: Removing networks not found in cumulative AJ scan from time-deferred list: %@", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]", v21[5] message];
      }
      [(NSMutableArray *)self->_networks removeObjectsAtIndexes:v15[5]];
      [(WiFiTimeDeferredNetworksAJManager *)self printDeferredNetworks];
      v10 = v21;
    }

    [(NSMutableArray *)self->_cumulativeAutoJoinScanResults removeAllObjects];
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
LABEL_10:
}

- (WiFiTimeDeferredNetworksAJManager)initWithArgs:(__WiFiDeviceManager *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiTimeDeferredNetworksAJManager;
  v6 = [(WiFiTimeDeferredNetworksAJManager *)&v10 init];
  if (!v6)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: self", @"-[WiFiTimeDeferredNetworksAJManager initWithArgs:]"];
    }
    goto LABEL_11;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: delegate" args:@"-[WiFiTimeDeferredNetworksAJManager initWithArgs:]"];
    }
LABEL_11:

    v6 = 0;
    goto LABEL_6;
  }
  v6->_networks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v6->_cumulativeAutoJoinScanResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v6->_deviceManager = a3;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: initialized WiFiTimeDeferredNetworksAJManager", "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]")];
  }
LABEL_6:
  return v6;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_networks removeAllObjects];

  [(NSMutableArray *)self->_cumulativeAutoJoinScanResults removeAllObjects];
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiTimeDeferredNetworksAJManager;
  [(WiFiTimeDeferredNetworksAJManager *)&v5 dealloc];
}

- (BOOL)canDeferNetwork:(__WiFiNetwork *)a3 withUsageRank:(unint64_t)a4 andMotionState:(int)a5
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  if (!self->_deviceManager)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: manager object is NULL" message:3, "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
    goto LABEL_53;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: network object is NULL", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
    goto LABEL_53;
  }
  if (![(WiFiTimeDeferredNetworksAJManager *)self usageRankForDeferral])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: usageRankForDeferral is not correctly initialized" message:3];
    }
    goto LABEL_53;
  }
  [(WiFiTimeDeferredNetworksAJManager *)self deferIntervalSecs];
  if (v10 == 0.0)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: deferIntervalSecs is not correctly initialized" message:3];
    }
    goto LABEL_53;
  }
  if (![(WiFiTimeDeferredNetworksAJManager *)self numDaysSinceAssocOverrideDeferral])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: numDaysSinceAssocOverrideDeferral is not correctly initialized", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
    }
LABEL_53:
    goto LABEL_31;
  }
  CFArrayRef v11 = sub_10010A748((uint64_t)self->_deviceManager, a3);
  if (v11)
  {
    if (sub_1000CEBB4((CFDictionaryRef *)a3)) {
      unsigned int v12 = 1;
    }
    else {
      unsigned int v12 = [[+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager") isMovingNetwork:a3];
    }
    if (sub_1000CEB50((CFDictionaryRef *)a3)) {
      unsigned int v13 = 1;
    }
    else {
      unsigned int v13 = [[+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager") isOmnipresentNetwork:a3];
    }
    uint64_t v14 = sub_10010BF80((uint64_t)self->_deviceManager, a3);
    if (!v14) {
      goto LABEL_20;
    }
    if (sub_1000CF14C((uint64_t)v11) == 1
      || sub_1000C6B08((uint64_t)v11) == 1
      || (v13 & 1) == 0
      && ([(WiFiTimeDeferredNetworksAJManager *)self usageRankForDeferral] > a4
       || (v12 & 1) == 0 && (a5 > 6 || ((1 << a5) & 0x58) == 0)))
    {
LABEL_30:
      CFRelease(v11);
      goto LABEL_31;
    }
    if (sub_1000C74BC((uint64_t)a3)
      || sub_1000066FC((uint64_t)a3)
      || sub_10001BB2C((BOOL)a3)
      || (unint64_t v23 = sub_10001CD58(v11)) == 0
      || ([+[NSDate date] timeIntervalSinceDate:v23],
          [(WiFiTimeDeferredNetworksAJManager *)self numDaysSinceAssocOverrideDeferral] < (unint64_t)(v24 / 86400.0)))
    {
LABEL_20:
      *((unsigned char *)v37 + 24) = 1;
    }
    else
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: not deferring %@ because it was recently joined", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", sub_10001A43C(v11) message];
      }
      if (!*((unsigned char *)v37 + 24)) {
        goto LABEL_30;
      }
    }
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    networks = self->_networks;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100171D68;
    v27[3] = &unk_100243140;
    v27[7] = &v28;
    v27[8] = a3;
    v27[4] = self;
    v27[5] = &v32;
    v27[6] = &v36;
    [(NSMutableArray *)networks enumerateObjectsUsingBlock:v27];
    if (*((unsigned char *)v37 + 24))
    {
      unsigned int v16 = [(WiFiTimeDeferredNetworksAJManager *)self deferNetwork:a3];
      *((unsigned char *)v37 + 24) = v16;
      if (v16 && v33[3] != 0.0)
      {
        v18 = (void *)qword_10027DD68;
        if (qword_10027DD68)
        {
          id v19 = sub_10001A43C(a3);
          [(WiFiTimeDeferredNetworksAJManager *)self deferIntervalSecs];
          [v18 WFLog:4, "%s: time-deferring %@ (isMoving:%d isOmnipresent:%d usageRank:%lu isSuitableAfterTd:%d) from auto join for another %2.1f seconds", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", v19, v12, v13, a4, v14, v20 - v33[3] message];
        }
      }
    }
    else if (v29[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
      [(WiFiTimeDeferredNetworksAJManager *)self printDeferredNetworks];
    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    goto LABEL_30;
  }
LABEL_31:
  char v21 = *((unsigned char *)v37 + 24);
  _Block_object_dispose(&v36, 8);
  return v21;
}

- (BOOL)deferNetwork:(__WiFiNetwork *)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  networks = self->_networks;
  id v7 = [(NSMutableArray *)networks countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v18;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(networks);
      }
      unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if ([v12 doesContain:a3])
      {
        [v12 setDeferredNetwork:a3];
        char v9 = 1;
      }
    }
    id v8 = [(NSMutableArray *)networks countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v8);
  if (v9)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
LABEL_12:
    uint64_t v14 = objc_alloc_init(DeferredNetwork);
    if (v14)
    {
      v15 = v14;
      unsigned int v13 = [(DeferredNetwork *)v14 setDeferredNetwork:a3];
      if (v13) {
        [(NSMutableArray *)self->_networks addObject:v15];
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)clearScanResultsForAutoJoinSessionReset
{
}

- (void)setLinkUpForNetwork:(__WiFiNetwork *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001722FC;
  v8[3] = &unk_100240AF8;
  v8[4] = &v9;
  v8[5] = a3;
  [(NSMutableArray *)networks enumerateObjectsUsingBlock:v8];
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    [(WiFiTimeDeferredNetworksAJManager *)self printDeferredNetworks];
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  self->_currentNetwork = (__WiFiNetwork *)sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
  _Block_object_dispose(&v9, 8);
}

- (void)setLinkDown
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100172460;
  v6[3] = &unk_100240B20;
  v6[4] = self;
  v6[5] = &v7;
  [(NSMutableArray *)networks enumerateObjectsUsingBlock:v6];
  if (v8[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    [(WiFiTimeDeferredNetworksAJManager *)self printDeferredNetworks];
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  _Block_object_dispose(&v7, 8);
}

- (BOOL)isTimeDeferredNetworksPresent
{
  return [(NSMutableArray *)self->_networks count] != 0;
}

- (void)printDeferredNetworks
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = [(NSMutableArray *)self->_networks count];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_100022D68;
  uint64_t v12 = sub_100022C4C;
  id v13 = (id)0xAAAAAAAAAAAAAAAALL;
  id v13 = objc_alloc_init((Class)NSMutableString);
  if (v15[3])
  {
    if (v9[5])
    {
      networks = self->_networks;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001726E0;
      v7[3] = &unk_100243190;
      v7[4] = &v8;
      v7[5] = &v14;
      [(NSMutableArray *)networks enumerateObjectsUsingBlock:v7];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: time-deferred networks list: %@", "-[WiFiTimeDeferredNetworksAJManager printDeferredNetworks]", v9[5] message];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:4 message:@"%s: logString alloc failed", @"-[WiFiTimeDeferredNetworksAJManager printDeferredNetworks]"];
      }
    }
  }
  v6 = (void *)v9[5];
  if (v6) {

  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

- (unint64_t)usageRankForDeferral
{
  return self->_usageRankForDeferral;
}

- (void)setUsageRankForDeferral:(unint64_t)a3
{
  self->_usageRankForDeferral = a3;
}

- (double)deferIntervalSecs
{
  return self->_deferIntervalSecs;
}

- (void)setDeferIntervalSecs:(double)a3
{
  self->_deferIntervalSecs = a3;
}

- (unint64_t)numDaysSinceAssocOverrideDeferral
{
  return self->_numDaysSinceAssocOverrideDeferral;
}

- (void)setNumDaysSinceAssocOverrideDeferral:(unint64_t)a3
{
  self->_numDaysSinceAssocOverrideDeferral = a3;
}

@end
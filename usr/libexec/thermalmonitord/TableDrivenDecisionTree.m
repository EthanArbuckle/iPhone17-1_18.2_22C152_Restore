@interface TableDrivenDecisionTree
- (TableDrivenDecisionTree)initWithComponentControllers:(id)a3 hotspotControllers:(id)a4 decisionTreeTable:(id)a5;
- (id)findCC:(int)a3;
- (int)getMTypeFromComponent:(int)a3;
- (int)getReleaseRateForComponent:(int)a3;
- (void)actionComponentControl;
- (void)evaluateDecisionTree;
- (void)initDecisionTable:(__CFDictionary *)a3;
- (void)readReleaseRateForAllComponents;
@end

@implementation TableDrivenDecisionTree

- (void)actionComponentControl
{
  if (byte_1000AB149)
  {
    if (byte_1000AA0A8) {
      int v11 = 0;
    }
    else {
      int v11 = 10;
    }
    byte_1000AA0A8 = BYTE5(qword_1000AB138) - self->releaseMaxLoadIndexForComponent[5] > v11;
  }
  uint64_t v3 = 0;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  do
  {
    id v5 = [(TableDrivenDecisionTree *)self findCC:[(TableDrivenDecisionTree *)self getMTypeFromComponent:v3]];
    if (v5)
    {
      v6 = v5;
      if (v3 == 3 && [v5 shouldSuppressMitigations])
      {
        v7 = v6;
        uint64_t v8 = 100;
        uint64_t v9 = 100;
      }
      else
      {
        if (!byte_1000AB149 || (byte_1000AA0A8 & 1) != 0)
        {
          [v6 setMaxLoadingIndex:maxLoadIndexForComponent[v3] releaseIndex:maxLoadIndexForComponent[v3 + 17]];
          v45[v3] = [v6 getReleaseMaxLI];
          goto LABEL_13;
        }
        uint64_t v8 = *((unsigned __int8 *)&qword_1000AB138 + v3);
        v7 = v6;
        uint64_t v9 = v8;
      }
      [v7 setMaxLoadingIndex:v8 releaseIndex:v9];
    }
    else
    {
      v45[v3] = 101;
    }
LABEL_13:
    ++v3;
  }
  while (v3 != 17);
  if (byte_1000AA7A0)
  {
    v10 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67113216;
      v12[1] = v45[3];
      __int16 v13 = 1024;
      int v14 = v45[4];
      __int16 v15 = 1024;
      int v16 = v45[0];
      __int16 v17 = 1024;
      int v18 = v45[1];
      __int16 v19 = 1024;
      int v20 = v45[2];
      __int16 v21 = 1024;
      int v22 = v45[5];
      __int16 v23 = 1024;
      int v24 = v45[6];
      __int16 v25 = 1024;
      int v26 = v45[7];
      __int16 v27 = 1024;
      int v28 = v45[8];
      __int16 v29 = 1024;
      int v30 = v45[9];
      __int16 v31 = 1024;
      int v32 = v45[10];
      __int16 v33 = 1024;
      int v34 = v45[11];
      __int16 v35 = 1024;
      int v36 = v45[12];
      __int16 v37 = 1024;
      int v38 = v45[13];
      __int16 v39 = 1024;
      int v40 = v45[15];
      __int16 v41 = 1024;
      int v42 = v45[14];
      __int16 v43 = 1024;
      int v44 = v45[16];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> ReleaseMaxLI DT: BL %d Charge %d CPU %d SOC %d Radio %d ThermalLevel %d RefreshRate %d Fan %d WiFi %d AudioAmp %d Arc %d Speaker %d Package %d RadioModemBand %d RadioFR2RFCG %d RadioFR2RFBC %d RadioFR2RFBand %d", (uint8_t *)v12, 0x68u);
    }
  }
}

- (id)findCC:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  componentControllers = self->_componentControllers;
  id v5 = [(NSArray *)componentControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(componentControllers);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 isEqualMType:v3]) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)componentControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (int)getMTypeFromComponent:(int)a3
{
  if (a3 > 0x10) {
    return -1;
  }
  else {
    return dword_100068978[a3];
  }
}

- (void)evaluateDecisionTree
{
  uint64_t v3 = 0;
  releaseMaxLoadIndexForComponent = self->releaseMaxLoadIndexForComponent;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  int v4 = [(NSArray *)self->_hotspotControllers count];
  do
  {
    if (v4 < 1)
    {
      LOBYTE(v7) = 101;
      LOBYTE(v6) = 101;
    }
    else
    {
      uint64_t v5 = 0;
      int v6 = 101;
      int v7 = 101;
      do
      {
        id v8 = -[NSArray objectAtIndex:](self->_hotspotControllers, "objectAtIndex:", v5, releaseMaxLoadIndexForComponent, maxLoadIndexForComponent);
        signed int v9 = [v8 maxLIForComponent:v3];
        signed int v10 = [v8 releaseMaxLIForComponent:v3 releaseRate:self->releaseRateForComponent[v3]];
        if (v7 >= v9) {
          int v7 = v9;
        }
        if (v6 >= v10) {
          int v6 = v10;
        }
        ++v5;
      }
      while (v4 != v5);
    }
    maxLoadIndexForComponent[v3] = v7;
    releaseMaxLoadIndexForComponent[v3++] = v6;
  }
  while (v3 != 17);

  [(TableDrivenDecisionTree *)self actionComponentControl];
}

- (TableDrivenDecisionTree)initWithComponentControllers:(id)a3 hotspotControllers:(id)a4 decisionTreeTable:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TableDrivenDecisionTree;
  id v8 = [(TableDrivenDecisionTree *)&v11 init];
  signed int v9 = (TableDrivenDecisionTree *)v8;
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    *((void *)v8 + 2) = a4;
    *((void *)v8 + 3) = 0;
    *((void *)v8 + 4) = 0;
    v8[40] = 0;
    *(void *)(v8 + 49) = 0;
    *(void *)(v8 + 41) = 0;
    v8[57] = 0;
    [v8 initDecisionTable:a5];
  }
  return v9;
}

- (int)getReleaseRateForComponent:(int)a3
{
  id v3 = [(TableDrivenDecisionTree *)self findCC:[(TableDrivenDecisionTree *)self getMTypeFromComponent:*(void *)&a3]];

  return [v3 getReleaseRate];
}

- (void)readReleaseRateForAllComponents
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002914C;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA0B0 != -1) {
    dispatch_once(&qword_1000AA0B0, block);
  }
}

- (void)initDecisionTable:(__CFDictionary *)a3
{
  if (a3 && CFDictionaryGetCount(a3) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      CFIndex v6 = v5 + 1;
      CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"HotSpotDecisionTableNormal%d", v5 + 1);
      if (v7)
      {
        CFStringRef v8 = v7;
        Value = CFDictionaryGetValue(a3, v7);
        if (Value)
        {
          [self->_hotspotControllers[v5] setDecisionTableSection:Value];
          [(TableDrivenDecisionTree *)self readReleaseRateForAllComponents];
        }
        CFRelease(v8);
      }
      ++v5;
    }
    while (CFDictionaryGetCount(a3) > v6);
  }
}

@end
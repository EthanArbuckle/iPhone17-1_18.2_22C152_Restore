@interface TGraphSampler
+ (id)sharedInstance;
- (BOOL)shouldLogSensor:(__CFString *)a3;
- (BOOL)shouldLogSensorForLiteMode:(__CFString *)a3;
- (TGraphSampler)init;
- (__CFString)getTGraphData:(int)a3;
- (void)addtGraphDataSource:(id)a3;
- (void)dealloc;
- (void)genTGraphData;
- (void)genTGraphHeader;
- (void)logToPowerlog;
- (void)setProduct:(id)a3 withComponents:(id)a4 andHotspotSupervisors:(id)a5;
- (void)setTGraphDataString:(__CFString *)a3;
- (void)updateAppleCareState:(int)a3 value:(int)a4;
- (void)updateLiteModePowerLogDictionaryForSensors;
- (void)updatePowerLogDictionaryForSensors;
- (void)updatePowerLogLiteHiP:(char)a3 client:(int)a4;
- (void)updatePowerlogLiteMode:(int64_t)a3 pressureLevel:(int64_t)a4;
- (void)updatePowerlogMiscState:(int)a3 value:(int)a4;
- (void)updateSubkeyController:(id)a3 forControlList:(id)a4;
@end

@implementation TGraphSampler

- (void)setTGraphDataString:(__CFString *)a3
{
  tGraphDataString = self->tGraphDataString;
  if (tGraphDataString) {
    CFRelease(tGraphDataString);
  }
  if (a3) {
    v6 = (__CFString *)CFRetain(a3);
  }
  else {
    v6 = 0;
  }
  self->tGraphDataString = v6;
}

- (void)logToPowerlog
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v4 = v3 - self->lastLogTimestamp;
  powerlogQueue = self->_powerlogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAD4;
  block[3] = &unk_100085248;
  block[4] = self;
  dispatch_async((dispatch_queue_t)powerlogQueue, block);
  v6 = self->_powerlogQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000AA7C;
  v13[3] = &unk_100085A90;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v3;
  dispatch_async((dispatch_queue_t)v6, v13);
  [(TGraphSampler *)self updateLiteModePowerLogDictionaryForSensors];
  BOOL v7 = qword_1000AA798
    || [(CommonProduct *)self->productObj maxControlEffort] > 0
    || self->gotDataToLogToLiteMode;
  int v8 = ++dword_1000AA068;
  if (byte_1000AA06C) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  if (v9) {
    int v10 = 3;
  }
  else {
    int v10 = 63;
  }
  if ((v10 & v8) == 0)
  {
    byte_1000AA06C = v7;
    v11 = self->_powerlogQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000A890;
    v12[3] = &unk_100085248;
    v12[4] = self;
    dispatch_async((dispatch_queue_t)v11, v12);
  }
}

- (void)genTGraphData
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    __uint64_t v4 = Mutable;
    sub_100008A14(Mutable, @"%d", 50 * [(CommonProduct *)self->productObj thermalState]);
    if ([(CommonProduct *)self->productObj totalSensors] >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        sub_100008A14(v4, @"%d", *((unsigned int *)&qword_1000AACCC + v5));
        if (byte_1000AABC8
          && [+[HidSensors sharedInstance] getFilterTimeConstantForSensor:v5])
        {
          sub_100008A14(v4, @"%d", dword_1000AABCC[v5]);
        }
        ++v5;
      }
      while (v5 < [(CommonProduct *)self->productObj totalSensors]);
    }
    if ([(CommonProduct *)self->productObj powerSensors] >= 1)
    {
      uint64_t v6 = 0;
      do
        sub_100022074(v4, @"%f", dbl_1000AB0E8[v6++]);
      while (v6 < [(CommonProduct *)self->productObj powerSensors]);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    listOfSupervisorControl = self->listOfSupervisorControl;
    id v8 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(listOfSupervisorControl);
          }
          v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ((int)[v12 numberOfFields] >= 1)
          {
            uint64_t v13 = 0;
            do
            {
              id v14 = [v12 copyFieldCurrentValueForIndex:v13];
              CFArrayAppendValue(v4, v14);
              if (v14) {
                CFRelease(v14);
              }
              uint64_t v13 = (v13 + 1);
            }
            while ((int)v13 < (int)[v12 numberOfFields]);
          }
        }
        id v9 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    listofComponentControl = self->listofComponentControl;
    id v16 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(listofComponentControl);
          }
          v20 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          if ((int)[v20 numberOfFields] >= 1)
          {
            uint64_t v21 = 0;
            do
            {
              id v22 = [v20 copyFieldCurrentValueForIndex:v21];
              CFArrayAppendValue(v4, v22);
              if (v22) {
                CFRelease(v22);
              }
              uint64_t v21 = (v21 + 1);
            }
            while ((int)v21 < (int)[v20 numberOfFields]);
          }
        }
        id v17 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v17);
    }
    extratGraphDataSources = self->extratGraphDataSources;
    if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
    {
      CFIndex v24 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->extratGraphDataSources, v24);
        if ((int)[ValueAtIndex numberOfFields] >= 1)
        {
          uint64_t v26 = 0;
          do
          {
            id v27 = [ValueAtIndex copyFieldCurrentValueForIndex:v26];
            CFArrayAppendValue(v4, v27);
            if (v27) {
              CFRelease(v27);
            }
            uint64_t v26 = (v26 + 1);
          }
          while ((int)v26 < (int)[ValueAtIndex numberOfFields]);
        }
        ++v24;
      }
      while (CFArrayGetCount(self->extratGraphDataSources) > v24);
    }
    CFStringRef v28 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v4, @", ");
    CFStringRef v29 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @", %@", v28);
    [(TGraphSampler *)self setTGraphDataString:v29];
    if (v28) {
      CFRelease(v28);
    }
    if (v29) {
      CFRelease(v29);
    }
    CFRelease(v4);
  }
  else
  {
    v30 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055CB8(v30);
    }
  }
}

- (void)updateLiteModePowerLogDictionaryForSensors
{
  if (!self->gotDataToLogToLiteMode && self->_powerlogSubkeyController_Sensors_Components)
  {
    int v3 = [(CommonProduct *)self->productObj totalSensors];
    if (v3 >= 1)
    {
      CFIndex v4 = 0;
      uint64_t v5 = v3;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex([+[HidSensors sharedInstance] sensorFourCharCode], v4);
        if (!ValueAtIndex
          || ![(TGraphSampler *)self shouldLogSensorForLiteMode:ValueAtIndex])
        {
          goto LABEL_16;
        }
        int v7 = *((_DWORD *)&qword_1000AACCC + v4);
        id v8 = (char *)self + 4 * v4;
        int v9 = *((_DWORD *)v8 + 16);
        __int16 v10 = v7 - v9;
        if (v7 - v9 < 0) {
          __int16 v10 = v9 - v7;
        }
        if (v9 < dword_1000A2514) {
          break;
        }
        if ((v10 & 0xFFFCu) >= 0x64) {
          goto LABEL_15;
        }
LABEL_16:
        if (v5 == ++v4) {
          goto LABEL_17;
        }
      }
      if (v7 < dword_1000A2514 || (v10 & 0xFFFCu) <= 0x63) {
        goto LABEL_16;
      }
LABEL_15:
      self->gotDataToLogToLiteMode = 1;
      -[PowerlogSubkeyController setIntValue:forKey:](self->_powerlogSubkeyController_Sensors_Components, "setIntValue:forKey:");
      *((_DWORD *)v8 + 16) = *((_DWORD *)&qword_1000AACCC + v4);
      goto LABEL_16;
    }
LABEL_17:
    if (self->gotDataToLogToLiteMode)
    {
      [(PowerlogSubkeyController *)self->_powerlogSubkeyController_Sensors_Components setIntValue:sub_10000A4C8() forKey:@"PG0B"];
      powerlogSubkeyController_Sensors_Components = self->_powerlogSubkeyController_Sensors_Components;
      [(PowerlogSubkeyController *)powerlogSubkeyController_Sensors_Components printPowerLogDictionary];
    }
  }
}

- (BOOL)shouldLogSensorForLiteMode:(__CFString *)a3
{
  if (CFEqual(a3, @"TG0B")) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    if (v4 == 12) {
      break;
    }
    CFComparisonResult v6 = CFStringCompare(a3, *(&off_1000859D8 + v4 + 1), 0);
    unint64_t v4 = v5 + 1;
  }
  while (v6);
  return v5 < 0xC;
}

- (__CFString)getTGraphData:(int)a3
{
  if (a3 == 2)
  {
    [(TGraphSampler *)self genTGraphData];
  }
  else if (a3 == 1)
  {
    [(TGraphSampler *)self genTGraphHeader];
  }
  else
  {
    [(TGraphSampler *)self setTGraphDataString:@"Invalid Key"];
    unint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055C74(v4);
    }
  }
  return self->tGraphDataString;
}

+ (id)sharedInstance
{
  if (qword_1000AA058 != -1) {
    dispatch_once(&qword_1000AA058, &stru_100085A40);
  }
  return (id)qword_1000AA060;
}

- (TGraphSampler)init
{
  v6.receiver = self;
  v6.super_class = (Class)TGraphSampler;
  v2 = [(TGraphSampler *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    v2->productObj = 0;
    v2->listofComponentControl = 0;
    v2->listOfSupervisorControl = 0;
    v2->extratGraphDataSources = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->tGraphDataString = 0;
    v3->isInternal = 0;
    v3->lastLogTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v3->_powerlogSubkeyController_Hotspots = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_HS"];
    v3->_powerlogSubkeyController_Components = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_CP"];
    v3->_powerlogSubkeyController_Sensors = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_S1"];
    v3->_powerlogSubkeyController_MiscInternalState = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_EX"];
    v3->_powerlogSubkeyController_MiscExternalState = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_S2"];
    v3->_powerlogSubkeyController_LiteMode = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_Lite"];
    v3->_powerlogSubkeyController_HiP = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_HiP"];
    v3->_powerlogSubkeyController_Sensors_Components = (PowerlogSubkeyController *)[[PowerlogSubkeyController alloc] initForSubkey:@"TGraph_SC"];
    v3->_powerlogQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.powerlog", 0);
    uint64_t v4 = 0;
    v3->_appleCareState = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    do
      [(NSMutableArray *)v3->_appleCareState setObject:&off_10008D100 atIndexedSubscript:v4++];
    while (v4 != 5);
    v3->_appleCareStateLastLogged = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v3->_appleCareState];
  }
  return v3;
}

- (void)setProduct:(id)a3 withComponents:(id)a4 andHotspotSupervisors:(id)a5
{
  productObj = self->productObj;
  if (productObj) {
    CFRelease(productObj);
  }
  listofComponentControl = self->listofComponentControl;
  if (listofComponentControl) {
    CFRelease(listofComponentControl);
  }
  listOfSupervisorControl = self->listOfSupervisorControl;
  if (listOfSupervisorControl) {
    CFRelease(listOfSupervisorControl);
  }
  self->productObj = (CommonProduct *)a3;
  self->listofComponentControl = (NSMutableArray *)a4;
  self->listOfSupervisorControl = (NSMutableArray *)a5;
  self->isInternal = sub_100005BA0();
}

- (void)dealloc
{
  [(TGraphSampler *)self setTGraphDataString:0];
  v3.receiver = self;
  v3.super_class = (Class)TGraphSampler;
  [(TGraphSampler *)&v3 dealloc];
}

- (void)addtGraphDataSource:(id)a3
{
  extratGraphDataSources = self->extratGraphDataSources;
  if (extratGraphDataSources) {
    CFArrayAppendValue(extratGraphDataSources, a3);
  }
}

- (void)updateSubkeyController:(id)a3 forControlList:(id)a4
{
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(a4);
          }
          [a3 setIntValue:objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "getPowerlogFieldCurrentValue") forKey:objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "getPowerlogKey")];
          int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)shouldLogSensor:(__CFString *)a3
{
  LODWORD(v4) = [+[HidSensors sharedInstance] shouldRetrieveSensor:a3];
  if (v4)
  {
    CFComparisonResult v4 = CFStringCompare(a3, @"Th0x", 0);
    if (v4)
    {
      unint64_t v5 = 0;
      do
      {
        unint64_t v6 = v5;
        if (v5 == 10) {
          break;
        }
        CFComparisonResult v7 = CFStringCompare(a3, *(&off_100085980 + v5 + 1), 0);
        unint64_t v5 = v6 + 1;
      }
      while (v7);
      LOBYTE(v4) = v6 > 9;
    }
  }
  return v4;
}

- (void)updatePowerLogDictionaryForSensors
{
  if (self->_powerlogSubkeyController_Sensors)
  {
    int v3 = [(CommonProduct *)self->productObj totalSensors];
    if (v3 >= 1)
    {
      CFIndex v4 = 0;
      uint64_t v5 = v3;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex([+[HidSensors sharedInstance] sensorFourCharCode], v4);
        if (ValueAtIndex)
        {
          CFComparisonResult v7 = ValueAtIndex;
          if ([(TGraphSampler *)self shouldLogSensor:ValueAtIndex]) {
            [(PowerlogSubkeyController *)self->_powerlogSubkeyController_Sensors setIntValue:*((unsigned int *)&qword_1000AACCC + v4) forKey:v7];
          }
        }
        ++v4;
      }
      while (v5 != v4);
    }
    powerlogSubkeyController_Sensors = self->_powerlogSubkeyController_Sensors;
    uint64_t v9 = sub_10000A4C8();
    [(PowerlogSubkeyController *)powerlogSubkeyController_Sensors setIntValue:v9 forKey:@"PG0B"];
  }
}

- (void)genTGraphHeader
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, @"Thermal State");
  CFIndex Count = CFArrayGetCount([+[HidSensors sharedInstance] hidSensorKeys]);
  CFIndex v5 = CFArrayGetCount([+[HidSensors sharedInstance] synthSensorKeys]);
  v57 = self;
  signed int v6 = [(CommonProduct *)self->productObj powerSensors];
  CFIndex v7 = Count - v6;
  if (v7 < 1)
  {
    CFIndex v20 = 0;
  }
  else
  {
    signed int v55 = v6;
    CFIndex v8 = 0;
    CFStringRef v9 = CFSTR("(");
    long long v10 = &byte_1000AABC8;
    do
    {
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v9);
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] sensorFourCharCode], v8);
      CFStringAppend(MutableCopy, ValueAtIndex);
      CFStringAppend(MutableCopy, @""));
      CFStringRef v13 = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] hidSensorKeys], v8);
      CFStringAppend(MutableCopy, v13);
      CFArrayAppendValue(Mutable, MutableCopy);
      if (*v10)
      {
        uint64_t v14 = [+[HidSensors sharedInstance] getFilterTimeConstantForSensor:v8];
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = v10;
          CFStringRef v17 = v9;
          uint64_t v18 = CFStringCreateMutableCopy(0, 0, MutableCopy);
          CFStringAppendFormat(v18, 0, @"_f%u", v15);
          CFArrayAppendValue(Mutable, v18);
          v19 = v18;
          CFStringRef v9 = v17;
          long long v10 = v16;
          CFRelease(v19);
        }
      }
      CFRelease(MutableCopy);
      ++v8;
    }
    while (v7 != v8);
    CFIndex v20 = v7;
    signed int v6 = v55;
  }
  uint64_t v21 = v6;
  CFIndex v22 = v7 + v5;
  if (v5 >= 1)
  {
    uint64_t v54 = v6;
    CFIndex v56 = v20;
    CFIndex v23 = 0;
    do
    {
      CFIndex v24 = CFStringCreateMutableCopy(0, 0, @"(");
      CFStringRef v25 = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] sensorFourCharCode], v7 + v23);
      CFStringAppend(v24, v25);
      CFStringAppend(v24, @""));
      CFStringRef v26 = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] synthSensorKeys], v23);
      CFStringAppend(v24, v26);
      CFArrayAppendValue(Mutable, v24);
      CFRelease(v24);
      ++v23;
    }
    while (v7 + v23 < v22);
    uint64_t v21 = v54;
    CFIndex v20 = v56 + v23;
  }
  CFIndex v27 = v20 + v21;
  if (v22 < v20 + v21)
  {
    do
    {
      CFStringRef v28 = CFStringCreateMutableCopy(0, 0, @"(");
      CFStringRef v29 = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] sensorFourCharCode], v5 + v7);
      CFStringAppend(v28, v29);
      CFStringAppend(v28, @""));
      CFStringRef v30 = (const __CFString *)CFArrayGetValueAtIndex([+[HidSensors sharedInstance] hidSensorKeys], v7);
      CFStringAppend(v28, v30);
      CFArrayAppendValue(Mutable, v28);
      CFRelease(v28);
      ++v7;
    }
    while (v5 + v7 < v27);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  listOfSupervisorControl = v57->listOfSupervisorControl;
  id v32 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v63;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v63 != v34) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        long long v36 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ((int)[v36 numberOfFields] >= 1)
        {
          uint64_t v37 = 0;
          do
          {
            id v38 = [v36 copyHeaderForIndex:v37];
            CFArrayAppendValue(Mutable, v38);
            if (v38) {
              CFRelease(v38);
            }
            uint64_t v37 = (v37 + 1);
          }
          while ((int)v37 < (int)[v36 numberOfFields]);
        }
      }
      id v33 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v33);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  listofComponentControl = v57->listofComponentControl;
  id v40 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v59;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(listofComponentControl);
        }
        v44 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        if ((int)[v44 numberOfFields] >= 1)
        {
          uint64_t v45 = 0;
          do
          {
            id v46 = [v44 copyHeaderForIndex:v45];
            CFArrayAppendValue(Mutable, v46);
            if (v46) {
              CFRelease(v46);
            }
            uint64_t v45 = (v45 + 1);
          }
          while ((int)v45 < (int)[v44 numberOfFields]);
        }
      }
      id v41 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v41);
  }
  CFArrayRef extratGraphDataSources = v57->extratGraphDataSources;
  if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
  {
    CFIndex v48 = 0;
    do
    {
      v49 = (void *)CFArrayGetValueAtIndex(v57->extratGraphDataSources, v48);
      if ((int)[v49 numberOfFields] >= 1)
      {
        uint64_t v50 = 0;
        do
        {
          id v51 = [v49 copyHeaderForIndex:v50];
          if (v51)
          {
            v52 = v51;
            CFArrayAppendValue(Mutable, v51);
            CFRelease(v52);
          }
          uint64_t v50 = (v50 + 1);
        }
        while ((int)v50 < (int)[v49 numberOfFields]);
      }
      ++v48;
    }
    while (CFArrayGetCount(v57->extratGraphDataSources) > v48);
  }
  CFStringRef v53 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, Mutable, @", ");
  [(TGraphSampler *)v57 setTGraphDataString:v53];
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v53) {
    CFRelease(v53);
  }
}

- (void)updatePowerlogMiscState:(int)a3 value:(int)a4
{
  if (a3 <= 6)
  {
    uint64_t v7 = (uint64_t)*(&off_100085948 + a3);
    if (byte_1000AA7A0)
    {
      CFIndex v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = "-[TGraphSampler updatePowerlogMiscState:value:]";
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        __int16 v18 = 1024;
        int v19 = a4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> %s: key %@, value %d", buf, 0x1Cu);
      }
    }
    uint64_t v9 = 360;
    if (a3 != 2 && a3 != 4)
    {
      if (!self->isInternal) {
        return;
      }
      uint64_t v9 = 352;
    }
    uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + v9);
    if (v10)
    {
      powerlogQueue = self->_powerlogQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100022270;
      block[3] = &unk_100085200;
      int v13 = a4;
      block[4] = v10;
      void block[5] = v7;
      dispatch_async((dispatch_queue_t)powerlogQueue, block);
    }
  }
}

- (void)updatePowerlogLiteMode:(int64_t)a3 pressureLevel:(int64_t)a4
{
  v10.tv_sec = 0;
  *(void *)&v10.tv_usec = 0;
  if (!gettimeofday(&v10, 0))
  {
    uint64_t v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v10.tv_usec / 1000000.0 + (double)v10.tv_sec), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3), +[NSNumber numberWithLongLong:a4], 0);
    powerlogQueue = self->_powerlogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022394;
    block[3] = &unk_100085A68;
    block[4] = self;
    void block[5] = v7;
    dispatch_async((dispatch_queue_t)powerlogQueue, block);
  }
}

- (void)updatePowerLogLiteHiP:(char)a3 client:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v10.tv_sec = 0;
  *(void *)&v10.tv_usec = 0;
  if (!gettimeofday(&v10, 0))
  {
    uint64_t v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v10.tv_usec / 1000000.0 + (double)v10.tv_sec), +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v5), +[NSNumber numberWithInt:v4], 0);
    powerlogQueue = self->_powerlogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000224E8;
    block[3] = &unk_100085A68;
    block[4] = self;
    void block[5] = v7;
    dispatch_async((dispatch_queue_t)powerlogQueue, block);
  }
}

- (void)updateAppleCareState:(int)a3 value:(int)a4
{
  if (a3 <= 4)
  {
    if (byte_1000AA7A0)
    {
      uint64_t v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v13 = "-[TGraphSampler updateAppleCareState:value:]";
        __int16 v14 = 1024;
        int v15 = a3;
        __int16 v16 = 1024;
        int v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> %s: stateType %d, value %d", buf, 0x18u);
      }
    }
    powerlogQueue = self->_powerlogQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100022634;
    v9[3] = &unk_100085188;
    v9[4] = self;
    int v10 = a3;
    int v11 = a4;
    dispatch_async((dispatch_queue_t)powerlogQueue, v9);
  }
}

@end
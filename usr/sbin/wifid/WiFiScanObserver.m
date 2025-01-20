@interface WiFiScanObserver
- (NSMutableArray)callbacks;
- (WiFiScanObserver)init;
- (id)scanResultsCallback;
- (void)addScanResultsCallback:(id)a3;
- (void)dealloc;
- (void)ingestScanResults:(id)a3 ofType:(unint64_t)a4 clientName:(id)a5 directed:(BOOL)a6;
- (void)removeScanResultsCallback:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setScanResultsCallback:(id)a3;
@end

@implementation WiFiScanObserver

- (WiFiScanObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)WiFiScanObserver;
  v2 = [(WiFiScanObserver *)&v4 init];
  if (v2) {
    v2->_callbacks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)addScanResultsCallback:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(WiFiScanObserver *)self callbacks];
    v5 = _Block_copy(a3);
    [(NSMutableArray *)v4 addObject:v5];
  }
}

- (void)removeScanResultsCallback:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(WiFiScanObserver *)self callbacks];
    [(NSMutableArray *)v4 removeObject:a3];
  }
}

- (void)ingestScanResults:(id)a3 ofType:(unint64_t)a4 clientName:(id)a5 directed:(BOOL)a6
{
  BOOL v6 = a6;
  v12 = (void *)os_transaction_create();
  if (a3 && [(NSMutableArray *)[(WiFiScanObserver *)self callbacks] count])
  {
    BOOL v28 = v6;
    v29 = v12;
    v30 = v11;
    id v13 = objc_alloc_init((Class)NSMutableSet);
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: ingested %lu networks", "-[WiFiScanObserver ingestScanResults:ofType:clientName:directed:]", objc_msgSend(a3, "count"));
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(a3);
          }
          v19 = [[WiFiScanObserverNetwork alloc] initWithWiFiNetworkRef:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          if (v19)
          {
            v20 = v19;
            [v13 addObject:v19];
            CFRelease(v20);
          }
        }
        id v16 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v16);
    }
    if (!v13)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: no networks to provide", "-[WiFiScanObserver ingestScanResults:ofType:clientName:directed:]"];
      }
      v11 = v30;
      if (v12) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    [v21 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4)] forKey:@"resultType"];
    if (a5) {
      [v21 setObject:a5 forKey:@"clientName"];
    }
    if (v28) {
      [v21 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1)] forKey:@"directed"];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v22 = [(WiFiScanObserver *)self callbacks];
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * (void)j) + 16))();
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }
    if (v21) {
      CFRelease(v21);
    }
    CFRelease(v13);
    v12 = v29;
    v11 = v30;
  }
  if (v12) {
LABEL_30:
  }

LABEL_31:
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiScanObserver;
  [(WiFiScanObserver *)&v3 dealloc];
}

- (id)scanResultsCallback
{
  return self->scanResultsCallback;
}

- (void)setScanResultsCallback:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

@end
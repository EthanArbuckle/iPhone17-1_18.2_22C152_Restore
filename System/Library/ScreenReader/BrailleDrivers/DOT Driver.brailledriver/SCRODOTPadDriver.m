@interface SCRODOTPadDriver
- (BOOL)_setMainTextCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (SCRODOTPadDriver)init;
- (id)_getInputEvents;
- (id)canvas;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)_BTLELoadDriverWithIOElement:(id)a3;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)canvasHeight;
- (int64_t)canvasWidth;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)_dequeueData;
- (void)_enqueueData:(id)a3;
- (void)_processCommand:(id)a3;
- (void)_removeQueuedDataWithType:(int64_t)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)displayCanvas;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setBrailleDriverDelegate:(id)a3;
- (void)setCanvasHeight:(int64_t)a3;
- (void)setCanvasWidth:(int64_t)a3;
@end

@implementation SCRODOTPadDriver

- (SCRODOTPadDriver)init
{
  v15.receiver = self;
  v15.super_class = (Class)SCRODOTPadDriver;
  v2 = [(SCRODOTPadDriver *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_isDriverLoaded = 0;
    p_setMainCellsSEL = &v2->_setMainCellsSEL;
    if ("_setMainTextCells:length:")
    {
      SEL *p_setMainCellsSEL = "_setMainTextCells:length:";
      v5 = "_setMainTextCells:length:";
    }
    else
    {
      v5 = 0;
      SEL *p_setMainCellsSEL = 0;
    }
    v2->_setMainCellsIMP = [(SCRODOTPadDriver *)v2 methodForSelector:v5];
    p_getInputEventsSEL = &v3->_getInputEventsSEL;
    if ("_getInputEvents")
    {
      SEL *p_getInputEventsSEL = "_getInputEvents";
      v7 = "_getInputEvents";
    }
    else
    {
      v7 = 0;
      SEL *p_getInputEventsSEL = 0;
    }
    v3->_getInputEventsIMP = [(SCRODOTPadDriver *)v3 methodForSelector:v7];
    uint64_t v8 = +[NSMutableArray array];
    inputEvents = v3->_inputEvents;
    v3->_inputEvents = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    queuedLines = v3->_queuedLines;
    v3->_queuedLines = (NSMutableArray *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("dot.pad.data.writing.queue", 0);
    dataWritingQueue = v3->_dataWritingQueue;
    v3->_dataWritingQueue = (OS_dispatch_queue *)v12;
  }
  return v3;
}

- (void)dealloc
{
  [(SCRODOTPadDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)SCRODOTPadDriver;
  [(SCRODOTPadDriver *)&v3 dealloc];
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)loadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  if ([v4 transport] == 32
    && [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBTLESerialElementProtocol])
  {
    int v5 = [(SCRODOTPadDriver *)self _BTLELoadDriverWithIOElement:v4];
  }
  else
  {
    int v5 = 1;
  }

  return v5;
}

- (BOOL)unloadDriver
{
  objc_super v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Unload driver: %@", (uint8_t *)&v7, 0xCu);
  }

  if (self->_peripheral)
  {
    -[CBCentralManager cancelPeripheralConnection:](self->_central, "cancelPeripheralConnection:");
    peripheral = self->_peripheral;
    self->_peripheral = 0;
  }
  central = self->_central;
  self->_central = 0;

  *(_WORD *)&self->_isDriverLoaded = 256;
  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)isInputEnabled
{
  return 0;
}

- (BOOL)postsKeyboardEvents
{
  return 0;
}

- (int)brailleInputMode
{
  return 0;
}

- (int64_t)statusSize
{
  return self->_statusSize;
}

- (id)getInputEvents
{
  return (id)((uint64_t (*)(void))self->_getInputEventsIMP)();
}

- (id)_getInputEvents
{
  id v3 = [(NSMutableArray *)self->_inputEvents copy];
  [(NSMutableArray *)self->_inputEvents removeAllObjects];

  return v3;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  return ((uint64_t (*)(void))self->_setMainCellsIMP)();
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (id)canvas
{
  return self->_canvas;
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)_setMainTextCells:(const char *)a3 length:(int64_t)a4
{
  writeCharacteristic = self->_writeCharacteristic;
  if (writeCharacteristic)
  {
    size_t v8 = a4 + 10;
    __chkstk_darwin();
    uint64_t v10 = (char *)&v21 - ((v9 + 25) & 0xFFFFFFFFFFFFFFF0);
    bzero(v10, v8);
    *(_WORD *)uint64_t v10 = 21930;
    v10[2] = 0;
    v10[3] = a4 + 6;
    *((_DWORD *)v10 + 1) = 512;
    v10[8] = 0;
    if (a4 >= 1)
    {
      v11 = v10 + 9;
      int64_t v12 = a4;
      do
      {
        unsigned int v13 = *(unsigned __int8 *)a3++;
        *v11++ = (2 * v13) & 0x70 | v13 & 0x87 | (v13 >> 3) & 8;
        --v12;
      }
      while (v12);
    }
    if ((unint64_t)(a4 + 9) < 5)
    {
      char v16 = -91;
    }
    else
    {
      v14 = v10 + 4;
      int64_t v15 = a4 + 5;
      char v16 = -91;
      do
      {
        char v17 = *v14++;
        v16 ^= v17;
        --v15;
      }
      while (v15);
    }
    v10[a4 + 9] = v16;
    v18 = +[NSData dataWithBytes:v10 length:v8];
    [(SCRODOTPadDriver *)self _removeQueuedDataWithType:2];
    v19 = objc_opt_new();
    [v19 setData:v18];
    [v19 setType:2];
    [(SCRODOTPadDriver *)self _enqueueData:v19];
  }
  return writeCharacteristic != 0;
}

- (void)_removeQueuedDataWithType:(int64_t)a3
{
  dataWritingQueue = self->_dataWritingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_37C8;
  v4[3] = &unk_8208;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dataWritingQueue, v4);
}

- (void)_enqueueData:(id)a3
{
  id v4 = a3;
  dataWritingQueue = self->_dataWritingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3910;
  v7[3] = &unk_8230;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dataWritingQueue, v7);
}

- (void)_dequeueData
{
  dataWritingQueue = self->_dataWritingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3AAC;
  block[3] = &unk_8258;
  block[4] = self;
  dispatch_async(dataWritingQueue, block);
}

- (void)displayCanvas
{
  if (self->_writeCharacteristic)
  {
    [(SCRODOTPadDriver *)self _removeQueuedDataWithType:1];
    id v3 = [(SCRO2DBrailleCanvasDOT *)self->_canvas mainCells];
    uint64_t v4 = [(SCRODOTPadDriver *)self canvasHeight];
    int64_t v5 = [(SCRODOTPadDriver *)self canvasWidth];
    uint64_t v24 = v4;
    if (v4 >= 1)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      size_t v8 = v5 + 10;
      int v23 = v5 + 6;
      unint64_t v9 = v5 + 9;
      int64_t v22 = v5 + 5;
      do
      {
        __chkstk_darwin();
        uint64_t v10 = (_WORD *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
        bzero(v10, v8);
        *uint64_t v10 = 21930;
        *((unsigned char *)v10 + 2) = 0;
        *((unsigned char *)v10 + 3) = v23;
        uint64_t v11 = v7 + 1;
        *((unsigned char *)v10 + 4) = v7 + 1;
        *(_DWORD *)((char *)v10 + 5) = 2;
        if (v6 >= 1)
        {
          int64_t v12 = (char *)v10 + 9;
          uint64_t v13 = v6;
          v14 = v3;
          do
          {
            unsigned int v15 = *v14++;
            *v12++ = (2 * v15) & 0x70 | v15 & 0x87 | (v15 >> 3) & 8;
            --v13;
          }
          while (v13);
        }
        if (v9 < 5)
        {
          char v17 = -91;
        }
        else
        {
          char v16 = (char *)(v10 + 2);
          char v17 = -91;
          int64_t v18 = v22;
          do
          {
            char v19 = *v16++;
            v17 ^= v19;
            --v18;
          }
          while (v18);
        }
        *((unsigned char *)v10 + v9) = v17;
        v20 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8, v22);
        uint64_t v21 = objc_opt_new();
        [v21 setData:v20];
        [v21 setType:1];
        [v21 setCanvasRow:v7];
        [(SCRODOTPadDriver *)self _enqueueData:v21];

        v3 += v6;
        ++v7;
      }
      while (v11 != v24);
    }
  }
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (void)setBrailleDriverDelegate:(id)a3
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v6 = objc_msgSend(a4, "value", a3);
  if ([v6 length])
  {
    while (1)
    {
      [v6 length];
      __chkstk_darwin();
      size_t v8 = (unsigned __int8 *)&v13 - v7;
      objc_msgSend(v6, "getBytes:length:", (char *)&v13 - v7, objc_msgSend(v6, "length"));
      if ((unint64_t)[v6 length] < 4) {
        break;
      }
      if (*v8 != 170) {
        break;
      }
      if (v8[1] != 85) {
        break;
      }
      unint64_t v9 = __rev16(*((unsigned __int16 *)v8 + 1)) + 4;
      if (v9 > (unint64_t)[v6 length]) {
        break;
      }
      uint64_t v10 = objc_msgSend(v6, "subdataWithRange:", 0, v9);
      [(SCRODOTPadDriver *)self _processCommand:v10];
      if (v9 >= (unint64_t)[v6 length])
      {

        break;
      }
      uint64_t v11 = objc_msgSend(v6, "subdataWithRange:", v9, (char *)objc_msgSend(v6, "length") - v9);

      id v12 = [v11 length];
      uint64_t v6 = v11;
      if (!v12) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v11 = v6;
LABEL_11:
}

- (void)_processCommand:(id)a3
{
  id v4 = a3;
  int64_t v5 = (char *)&v44 - (((unint64_t)[v4 length] + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getBytes:length:", v5, objc_msgSend(v4, "length"));
  int v6 = v5[5];
  if (v5[4]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6 == 3;
  }
  if (v7)
  {
    BOOL v12 = 0;
    BOOL v11 = 0;
    BOOL v10 = 0;
    BOOL v9 = v5[6] == 18;
    goto LABEL_11;
  }
  if (v6 != 2) {
    goto LABEL_10;
  }
  int v8 = v5[6];
  if (v8 != 2)
  {
    if (v8 == 1)
    {
      BOOL v9 = 0;
      BOOL v10 = 0;
      BOOL v11 = v5[8] == 0;
      BOOL v12 = v5[8] == 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v9 = 0;
    BOOL v12 = 0;
    BOOL v11 = 0;
    BOOL v10 = 0;
    goto LABEL_11;
  }
  BOOL v9 = 0;
  BOOL v12 = 0;
  BOOL v11 = 0;
  BOOL v10 = v5[8] == 0;
LABEL_11:
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_4528;
  v56[3] = &unk_8258;
  v56[4] = self;
  uint64_t v13 = objc_retainBlock(v56);
  v14 = v13;
  if (v11)
  {
    byte_D8F0 = 1;
    if (!v10) {
      goto LABEL_18;
    }
LABEL_17:
    ((void (*)(void *))v13[2])(v13);
    goto LABEL_58;
  }
  if (v12)
  {
    byte_D8F0 = 0;
    goto LABEL_17;
  }
  if (byte_D8F0 & v10) {
    goto LABEL_17;
  }
LABEL_18:
  char v15 = 0;
  uint64_t v16 = 0;
  for (unint64_t i = 8; i != 12; ++i)
  {
    if ((unint64_t)[v4 length] > i) {
      uint64_t v16 = (v5[i] << v15) + (int)v16;
    }
    v15 += 8;
  }
  int64_t v18 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    char v19 = +[NSNumber numberWithInt:v16];
    *(_DWORD *)buf = 138412290;
    v60 = v19;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Got data command: %@", buf, 0xCu);
  }
  if (!self->_pressedFunctionButtons)
  {
    v20 = +[NSMutableSet set];
    pressedFunctionButtons = self->_pressedFunctionButtons;
    self->_pressedFunctionButtons = v20;

    int64_t v22 = +[NSMutableSet set];
    pressedArrowButtons = self->_pressedArrowButtons;
    self->_pressedArrowButtons = v22;
  }
  v46 = &v44;
  id v47 = v4;
  v45 = v14;
  if (v9)
  {
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    id v24 = [&off_8568 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v53;
      uint64_t v27 = 1;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(&off_8568);
          }
          v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          int v30 = [v29 intValue] & v16;
          unsigned int v31 = [(NSMutableSet *)self->_pressedArrowButtons containsObject:v29];
          if (v30 < 1)
          {
            if (v31)
            {
              [(NSMutableSet *)self->_pressedArrowButtons removeObject:v29];
              uint64_t v27 = v27 & 0xFFFE00FF | ([v29 intValue] << 8);
            }
          }
          else if ((v31 & 1) == 0)
          {
            [(NSMutableSet *)self->_pressedArrowButtons addObject:v29];
            uint64_t v27 = v27 & 0xFFFE00FF | ([v29 intValue] << 8) | 0x10000;
          }
        }
        id v25 = [&off_8568 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v25);
      goto LABEL_54;
    }
  }
  else
  {
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    id v32 = [&off_8580 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v49;
      uint64_t v27 = 1;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(&off_8580);
          }
          v36 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
          int v37 = [v36 intValue] & v16;
          unsigned int v38 = [(NSMutableSet *)self->_pressedFunctionButtons containsObject:v36];
          if (v37 < 1)
          {
            if (v38)
            {
              [(NSMutableSet *)self->_pressedFunctionButtons removeObject:v36];
              uint64_t v27 = v27 & 0xFFFE00FF | ([v36 intValue] << 8);
            }
          }
          else if ((v38 & 1) == 0)
          {
            [(NSMutableSet *)self->_pressedFunctionButtons addObject:v36];
            uint64_t v27 = v27 & 0xFFFE00FF | ([v36 intValue] << 8) | 0x10000;
          }
        }
        id v33 = [&off_8580 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v33);
      goto LABEL_54;
    }
  }
  uint64_t v27 = 1;
LABEL_54:
  inputEvents = self->_inputEvents;
  v40 = +[NSNumber numberWithUnsignedInt:v27];
  [(NSMutableArray *)inputEvents addObject:v40];

  v41 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = +[NSNumber numberWithUnsignedInt:v27];
    *(_DWORD *)buf = 138412290;
    v60 = v42;
    _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Input event: %@", buf, 0xCu);
  }
  id v4 = v47;
  v14 = v45;
  if (v27 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_driverDelegate);
    [WeakRetained brailleDriverDidReceiveInput];
  }
LABEL_58:
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  int64_t v5 = _SCROD_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Got write value update", v6, 2u);
  }
}

- (int)_BTLELoadDriverWithIOElement:(id)a3
{
  id v4 = (__CFString *)a3;
  int64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  int v6 = [v5 bundleIdentifier];
  BOOL v7 = _SCROD_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Loading BTLE element: %@", buf, 0xCu);
  }

  if (v6)
  {
    if (self->_isDriverLoaded) {
      [(SCRODOTPadDriver *)self unloadDriver];
    }
    int v8 = [v5 infoDictionary];
    BOOL v9 = [v8 objectForKey:kSCROBrailleDriverModels];
    BOOL v10 = [(__CFString *)v4 peripheral];
    BOOL v11 = [v10 name];

    v41 = v11;
    if ([v11 hasPrefix:@"DotPad320"])
    {
      BOOL v12 = @"com.apple.braille.driver.dot.pad.320";
    }
    else if ([v11 hasPrefix:@"DotPad832"])
    {
      BOOL v12 = @"com.apple.braille.driver.dot.pad.832";
    }
    else if ([v11 hasPrefix:@"DotPocket12"])
    {
      BOOL v12 = @"com.apple.braille.driver.dot.mini.12";
    }
    else
    {
      BOOL v12 = 0;
    }
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = &v12->isa;

    char v15 = [v9 objectForKey:v12];
    uint64_t v16 = v15;
    if (v15)
    {
      v39 = v6;
      v40 = v9;
      unsigned int v38 = v8;
      char v17 = [v15 objectForKey:kSCROBrailleDriverMainDisplaySize];
      self->_mainSize = [v17 unsignedCharValue];

      int64_t v18 = [v16 objectForKey:kSCROBrailleDriverStatusDisplaySize];
      self->_statusSize = [v18 unsignedCharValue];

      char v19 = [v16 objectForKey:@"canvasHeight"];
      self->_canvasHeight = (int64_t)[v19 integerValue];

      v20 = [v16 objectForKey:@"canvasWidth"];
      self->_canvasWidth = (int64_t)[v20 integerValue];

      uint64_t v21 = +[NSMutableArray arrayWithCapacity:self->_canvasWidth];
      canvasLines = self->_canvasLines;
      self->_canvasLines = v21;

      if (self->_canvasWidth >= 1)
      {
        int64_t v23 = 0;
        do
        {
          id v24 = self->_canvasLines;
          id v25 = objc_opt_new();
          [(NSMutableArray *)v24 addObject:v25];

          ++v23;
        }
        while (v23 < self->_canvasWidth);
      }
      uint64_t v26 = _SCROD_LOG();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = +[NSNumber numberWithInteger:self->_mainSize];
        v28 = +[NSNumber numberWithInteger:self->_statusSize];
        v29 = +[NSNumber numberWithInteger:self->_canvasWidth];
        int v30 = +[NSNumber numberWithInteger:self->_canvasHeight];
        *(_DWORD *)buf = 138413314;
        v43 = v27;
        __int16 v44 = 2112;
        v45 = v28;
        __int16 v46 = 2112;
        id v47 = v29;
        __int16 v48 = 2112;
        long long v49 = v30;
        __int16 v50 = 2112;
        long long v51 = v12;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Dot main size: %@, statusSize: %@, canvas: {%@, %@} : %@", buf, 0x34u);
      }
      unsigned int v31 = [(__CFString *)v4 central];
      id v32 = [(__CFString *)v4 peripheral];
      id v33 = _SCROD_LOG();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "BTLE Dot Pad %@", buf, 0xCu);
      }

      BOOL v9 = v40;
      if (v31 && v32)
      {
        objc_storeStrong((id *)&self->_central, v31);
        objc_storeStrong((id *)&self->_peripheral, v32);
        uint64_t v34 = [[SCRO2DBrailleCanvasDOT alloc] initWithWidth:2 * self->_canvasWidth initWithHeight:4 * self->_canvasHeight];
        canvas = self->_canvas;
        self->_canvas = v34;

        self->_runLoopToStop = CFRunLoopGetCurrent();
        self->_hasBeenUnloaded = 0;
        [(CBPeripheral *)self->_peripheral setDelegate:self];
        [(CBCentralManager *)self->_central setDelegate:self];
        [(CBCentralManager *)self->_central connectPeripheral:self->_peripheral options:0];
        int v13 = 0;
        self->_isDriverLoaded = 1;
      }
      else
      {
        v36 = _SCROD_LOG();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Failed to load DOTPad braille driver because there is no peripheral or central", buf, 2u);
        }

        int v13 = 1;
      }
      int v8 = v38;
      int v6 = v39;
    }
    else
    {
      unsigned int v31 = _SCROD_LOG();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = v12;
        __int16 v44 = 2112;
        v45 = v9;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Failed to load Dotpad braille driver, Unknown model identifier [%{public}@] %@", buf, 0x16u);
      }
      int v13 = 1;
    }
  }
  else
  {
    int v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Failed to load DOTPad braille driver because we have no bundle identifier", buf, 2u);
    }
    int v13 = 1;
  }

  return v13;
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  [v5 setDelegate:self];
  [v5 discoverServices:0];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = _SCROD_LOG();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Disconnect : %@ %@", (uint8_t *)&v11, 0x16u);
  }

  [(SCRODOTPadDriver *)self unloadDriver];
  BOOL v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:self userInfo:0];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(v4, "services", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 discoverCharacteristics:0 forService:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(a4, "characteristics", a3);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(CBCharacteristic **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = _SCROD_LOG();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v23 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Discovered characteristic: %@", buf, 0xCu);
        }

        [(CBPeripheral *)self->_peripheral readValueForCharacteristic:v11];
        [(CBPeripheral *)self->_peripheral setNotifyValue:1 forCharacteristic:v11];
        long long v13 = [(CBCharacteristic *)v11 UUID];
        id v14 = [v13 UUIDString];
        id v15 = [v14 length];

        if (v15 && ([(CBCharacteristic *)v11 properties] & 8) != 0)
        {
          objc_storeStrong((id *)&self->_writeCharacteristic, v11);
          uint64_t v16 = _SCROD_LOG();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            writeCharacteristic = self->_writeCharacteristic;
            *(_DWORD *)buf = 138412290;
            int64_t v23 = writeCharacteristic;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Set write charactistic: %@", buf, 0xCu);
          }

          [(SCRODOTPadDriver *)self displayCanvas];
          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (int64_t)canvasWidth
{
  return self->_canvasWidth;
}

- (void)setCanvasWidth:(int64_t)a3
{
  self->_canvasWidth = a3;
}

- (int64_t)canvasHeight
{
  return self->_canvasHeight;
}

- (void)setCanvasHeight:(int64_t)a3
{
  self->_canvasHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_dataWritingQueue, 0);
  objc_storeStrong((id *)&self->_queuedLines, 0);
  objc_storeStrong((id *)&self->_inflightLine, 0);
  objc_storeStrong((id *)&self->_canvasLines, 0);
  objc_destroyWeak((id *)&self->_driverDelegate);
  objc_storeStrong((id *)&self->_pressedArrowButtons, 0);
  objc_storeStrong((id *)&self->_pressedFunctionButtons, 0);
  objc_storeStrong((id *)&self->_previousCanvasData, 0);
  objc_storeStrong((id *)&self->_inputEvents, 0);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_writeCharacteristic, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end
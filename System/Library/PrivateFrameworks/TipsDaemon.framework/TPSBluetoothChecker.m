@interface TPSBluetoothChecker
+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5;
+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 withPairedDevices:(id)a4;
+ (BOOL)bluetoothPairedWithTag:(id)a3 withPairedPeers:(id)a4;
+ (id)bluetoothPairedForProductIDs:(id)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5;
+ (id)bluetoothPairedForProductIDs:(id)a3 withPairedDevices:(id)a4;
+ (id)sharedInstance;
- (BOOL)bluetoothPairedForProductID:(unsigned int)a3;
- (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4;
- (BOOL)bluetoothPairedWithTag:(id)a3;
- (BluetoothManager)bluetoothManager;
- (CBCentralManager)centralManager;
- (NSArray)pairedDevices;
- (NSArray)pairedPeers;
- (OS_dispatch_queue)peersAccessQueue;
- (TPSBluetoothChecker)init;
- (id)devicesAccessQueue;
- (void)initializeBTManager;
- (void)setBluetoothManager:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setPeersAccessQueue:(id)a3;
@end

@implementation TPSBluetoothChecker

void __36__TPSBluetoothChecker_pairedDevices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) bluetoothManager];
  uint64_t v2 = [v5 pairedDevices];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)pairedDevices
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = [(TPSBluetoothChecker *)self devicesAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__TPSBluetoothChecker_pairedDevices__block_invoke;
  v6[3] = &unk_1E6E6B758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)devicesAccessQueue
{
  if (devicesAccessQueue_onceToken != -1) {
    dispatch_once(&devicesAccessQueue_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)devicesAccessQueue_accessQueue;

  return v2;
}

- (BluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

+ (id)bluetoothPairedForProductIDs:(id)a3 withPairedDevices:(id)a4
{
  return (id)[a1 bluetoothPairedForProductIDs:a3 minimumVersion:0 withPairedDevices:a4];
}

+ (id)bluetoothPairedForProductIDs:(id)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  id v9 = a5;
  v10 = v9;
  if ((unint64_t)[v7 count] >= 2)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke;
    v19[3] = &unk_1E6E6BE30;
    id v20 = v7;
    v10 = [v9 sortedArrayUsingComparator:v19];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke_2;
  v15[3] = &unk_1E6E6BE58;
  id v11 = v7;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  v18 = &v21;
  [v10 enumerateObjectsUsingBlock:v15];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __37__TPSBluetoothChecker_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(TPSBluetoothChecker);

  return MEMORY[0x1F41817F8]();
}

- (TPSBluetoothChecker)init
{
  v9.receiver = self;
  v9.super_class = (Class)TPSBluetoothChecker;
  uint64_t v2 = [(TPSBluetoothChecker *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1BD18]) initWithDelegate:0 queue:0];
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(0, v5);
    peersAccessQueue = v2->_peersAccessQueue;
    v2->_peersAccessQueue = (OS_dispatch_queue *)v6;

    [(TPSBluetoothChecker *)v2 initializeBTManager];
  }
  return v2;
}

- (void)initializeBTManager
{
  uint64_t v3 = (void *)MEMORY[0x1E4F50B70];
  id v4 = [(TPSBluetoothChecker *)self devicesAccessQueue];
  [v3 setSharedInstanceQueue:v4];

  id v5 = [(TPSBluetoothChecker *)self devicesAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TPSBluetoothChecker_initializeBTManager__block_invoke;
  block[3] = &unk_1E6E6B0A8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __42__TPSBluetoothChecker_initializeBTManager__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F50B70] sharedInstance];
  [*(id *)(a1 + 32) setBluetoothManager:v2];
}

void __41__TPSBluetoothChecker_devicesAccessQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create(0, v2);
  v1 = (void *)devicesAccessQueue_accessQueue;
  devicesAccessQueue_accessQueue = (uint64_t)v0;
}

- (NSArray)pairedPeers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = [(TPSBluetoothChecker *)self peersAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__TPSBluetoothChecker_pairedPeers__block_invoke;
  v6[3] = &unk_1E6E6B758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__TPSBluetoothChecker_pairedPeers__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) centralManager];
  id v2 = [v6 sharedPairingAgent];
  uint64_t v3 = [v2 retrievePairedPeers];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)bluetoothPairedWithTag:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSBluetoothChecker *)self pairedPeers];
  LOBYTE(self) = [(id)objc_opt_class() bluetoothPairedWithTag:v4 withPairedPeers:v5];

  return (char)self;
}

- (BOOL)bluetoothPairedForProductID:(unsigned int)a3
{
  return [(TPSBluetoothChecker *)self bluetoothPairedForProductID:*(void *)&a3 minimumVersion:0];
}

- (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(TPSBluetoothChecker *)self pairedDevices];
  LOBYTE(v4) = [(id)objc_opt_class() bluetoothPairedForProductID:v4 minimumVersion:v6 withPairedDevices:v7];

  return v4;
}

+ (BOOL)bluetoothPairedWithTag:(id)a3 withPairedPeers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__TPSBluetoothChecker_bluetoothPairedWithTag_withPairedPeers___block_invoke;
  v10[3] = &unk_1E6E6BE08;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __62__TPSBluetoothChecker_bluetoothPairedWithTag_withPairedPeers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 hasTag:*(void *)(a1 + 32)];
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 withPairedDevices:(id)a4
{
  return [a1 bluetoothPairedForProductID:*(void *)&a3 minimumVersion:0 withPairedDevices:a4];
}

+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  char v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithUnsignedInt:v6];
  v15[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v13 = [a1 bluetoothPairedForProductIDs:v12 minimumVersion:v10 withPairedDevices:v9];

  return v13 != 0;
}

uint64_t __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSNumber;
  id v7 = a3;
  char v8 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(a2, "productId"));
  uint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = NSNumber;
  uint64_t v12 = [v7 productId];

  uint64_t v13 = [v11 numberWithUnsignedInt:v12];
  uint64_t v14 = [v10 indexOfObject:v13];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && (v14 != 0x7FFFFFFFFFFFFFFFLL ? (BOOL v15 = v9 < v14) : (BOOL v15 = 1), v15)) {
    return -1;
  }
  else {
    return 1;
  }
}

void __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke_2(void *a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  __int16 v7 = [v6 vendorId];
  unsigned __int16 v8 = [v6 productId];
  if (v7 == 76)
  {
    unsigned __int16 v9 = v8;
    id v10 = (void *)a1[4];
    id v11 = [NSNumber numberWithUnsignedShort:v8];
    LODWORD(v10) = [v10 containsObject:v11];

    if (v10)
    {
      if (a1[5])
      {
        uint64_t v12 = [v6 accessoryInfo];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"AACPVersionInfo"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v13 count] >= 0xB)
        {
          uint64_t v14 = [v13 objectAtIndexedSubscript:10];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v14 length] >= 2)
          {
            if (objc_msgSend(v14, "tps_compareBuildVersionWithString:", a1[5]) != -1)
            {
              uint64_t v15 = [NSNumber numberWithUnsignedShort:v9];
              uint64_t v16 = *(void *)(a1[6] + 8);
              id v17 = *(void **)(v16 + 40);
              *(void *)(v16 + 40) = v15;
            }
            v18 = [MEMORY[0x1E4FAF480] default];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = a1[5];
              v23[0] = 67109634;
              v23[1] = v9;
              __int16 v24 = 2112;
              v25 = v14;
              __int16 v26 = 2112;
              uint64_t v27 = v22;
              _os_log_debug_impl(&dword_1E4492000, v18, OS_LOG_TYPE_DEBUG, "ProductID: %d, Found version: %@. Required Version: %@", (uint8_t *)v23, 0x1Cu);
            }
          }
        }
      }
      else
      {
        uint64_t v19 = [NSNumber numberWithUnsignedShort:v9];
        uint64_t v20 = *(void *)(a1[6] + 8);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;
      }
      *a4 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
    }
  }
}

- (void)setBluetoothManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_queue)peersAccessQueue
{
  return self->_peersAccessQueue;
}

- (void)setPeersAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersAccessQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
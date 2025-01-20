@interface TKVibratorController
- (TKVibratorController)init;
- (unint64_t)vibratorState;
- (unsigned)_previewVibrationSystemSoundID;
- (void)_turnOffIfAppropriate;
- (void)_vibrationDidCompleteWithPlayRequestIdentifier:(id)a3;
- (void)dealloc;
- (void)turnOff;
- (void)turnOnWithVibrationPattern:(id)a3;
@end

@implementation TKVibratorController

- (TKVibratorController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TKVibratorController;
  v2 = [(TKVibratorController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F7FC60]) initWithLabel:@"TKVibratorController" appendUUIDToLabel:1];
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (TLAccessQueue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__TKVibratorController_dealloc__block_invoke;
  v6[3] = &unk_2645898B8;
  v6[4] = self;
  [(TLAccessQueue *)v4 performSynchronousBlock:v6];

  v5.receiver = self;
  v5.super_class = (Class)TKVibratorController;
  [(TKVibratorController *)&v5 dealloc];
}

void __31__TKVibratorController_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _turnOffIfAppropriate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (unint64_t)vibratorState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__TKVibratorController_vibratorState__block_invoke;
  v5[3] = &unk_264589D78;
  v5[4] = self;
  v5[5] = &v6;
  [(TLAccessQueue *)accessQueue performSynchronousBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__TKVibratorController_vibratorState__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 16) || (result = [*(id *)(v2 + 24) count]) != 0) {
    *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (unsigned)_previewVibrationSystemSoundID
{
  return 1352;
}

- (void)turnOnWithVibrationPattern:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke;
  v7[3] = &unk_264589980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TLAccessQueue *)accessQueue performSynchronousBlock:v7];
}

void __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _turnOffIfAppropriate];
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v2);
  [*(id *)(a1 + 32) _previewVibrationSystemSoundID];
  id v3 = objc_alloc(NSDictionary);
  id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", &unk_26D2E85F0, *MEMORY[0x263EFC0F0], *(void *)(a1 + 40), *MEMORY[0x263EFC110], 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v6, &location);
  id v5 = v2;
  AudioServicesPlaySystemSoundWithOptions();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _vibrationDidCompleteWithPlayRequestIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)turnOff
{
  accessQueue = self->_accessQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__TKVibratorController_turnOff__block_invoke;
  v3[3] = &unk_2645898B8;
  v3[4] = self;
  [(TLAccessQueue *)accessQueue performSynchronousBlock:v3];
}

uint64_t __31__TKVibratorController_turnOff__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _turnOffIfAppropriate];
}

- (void)_turnOffIfAppropriate
{
  id v3 = self->_activePlayRequestIdentifier;
  if (v3)
  {
    id v8 = v3;
    activePlayRequestIdentifier = self->_activePlayRequestIdentifier;
    self->_activePlayRequestIdentifier = 0;

    pendingStopRequestIdentifiers = self->_pendingStopRequestIdentifiers;
    if (!pendingStopRequestIdentifiers)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      v7 = self->_pendingStopRequestIdentifiers;
      self->_pendingStopRequestIdentifiers = v6;

      pendingStopRequestIdentifiers = self->_pendingStopRequestIdentifiers;
    }
    [(NSMutableSet *)pendingStopRequestIdentifiers addObject:v8];
    [(TKVibratorController *)self _previewVibrationSystemSoundID];
    AudioServicesStopSystemSound();
    id v3 = v8;
  }
}

- (void)_vibrationDidCompleteWithPlayRequestIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__TKVibratorController__vibrationDidCompleteWithPlayRequestIdentifier___block_invoke;
  v7[3] = &unk_264589980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TLAccessQueue *)accessQueue performSynchronousBlock:v7];
}

void __71__TKVibratorController__vibrationDidCompleteWithPlayRequestIdentifier___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
  else
  {
    id v5 = *(void **)(v3 + 24);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 removeObject:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStopRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_activePlayRequestIdentifier, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
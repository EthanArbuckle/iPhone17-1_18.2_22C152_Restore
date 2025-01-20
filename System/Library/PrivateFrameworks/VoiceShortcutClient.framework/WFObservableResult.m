@interface WFObservableResult
+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4;
+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 completion:(id)a5;
+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 roundedIcon:(BOOL)a5 synchronously:(BOOL)a6 completion:(id)a7;
- (BOOL)observingDistributedNotifications;
- (CGSize)glyphSize;
- (Class)valueType;
- (NSHashTable)observers;
- (OS_dispatch_queue)observerNotificationQueue;
- (OS_dispatch_queue)serialQueue;
- (WFObservableResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4;
- (void)addResultObserver:(id)a3;
- (void)databaseDidChange:(id)a3;
- (void)dealloc;
- (void)removeResultObserver:(id)a3;
- (void)setObservingDistributedNotifications:(BOOL)a3;
- (void)startConnectionIfNecessary;
- (void)stopConnection;
@end

@implementation WFObservableResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerNotificationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (void)setObservingDistributedNotifications:(BOOL)a3
{
  self->_observingDistributedNotifications = a3;
}

- (BOOL)observingDistributedNotifications
{
  return self->_observingDistributedNotifications;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)observerNotificationQueue
{
  return self->_observerNotificationQueue;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (CGSize)glyphSize
{
  double width = self->_glyphSize.width;
  double height = self->_glyphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (Class)valueType
{
  return self->_valueType;
}

- (void)databaseDidChange:(id)a3
{
  id v4 = a3;
  v5 = [WFCoreDataChangeNotification alloc];
  v6 = [v4 userInfo];

  v7 = [(WFCoreDataChangeNotification *)v5 initWithDictionaryRepresentation:v6];
  [(WFObservableResult *)self handleChangeNotification:v7];
}

- (void)stopConnection
{
  if ([(WFObservableResult *)self observingDistributedNotifications])
  {
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:self name:@"com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification" object:0];

    [(WFObservableResult *)self setObservingDistributedNotifications:0];
  }
}

- (void)startConnectionIfNecessary
{
  v3 = [(WFObservableResult *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  if (![(WFObservableResult *)self observingDistributedNotifications])
  {
    id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:self selector:sel_databaseDidChange_ name:@"com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification" object:0 suspensionBehavior:4];

    [(WFObservableResult *)self setObservingDistributedNotifications:1];
  }
}

- (void)removeResultObserver:(id)a3
{
  id v4 = a3;
  v5 = [(WFObservableResult *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__WFObservableResult_removeResultObserver___block_invoke;
  v7[3] = &unk_1E6079130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __43__WFObservableResult_removeResultObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 stopConnection];
  }
}

- (void)addResultObserver:(id)a3
{
  id v4 = a3;
  v5 = [(WFObservableResult *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__WFObservableResult_addResultObserver___block_invoke;
  v7[3] = &unk_1E6079130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __40__WFObservableResult_addResultObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return [v3 startConnectionIfNecessary];
}

- (void)dealloc
{
  [(WFObservableResult *)self stopConnection];
  v3.receiver = self;
  v3.super_class = (Class)WFObservableResult;
  [(WFObservableResult *)&v3 dealloc];
}

- (WFObservableResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F0CB3550] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"WFObservableResult.m" lineNumber:204 description:@"Value type must be secure-codable"];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFObservableResult;
  v9 = [(WFObservableResult *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueType, a3);
    v10->_glyphSize.CGFloat width = width;
    v10->_glyphSize.CGFloat height = height;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.shortcuts.WFObservableResult-private", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.shortcuts.WFObservableResult-observer", v14);
    observerNotificationQueue = v10->_observerNotificationQueue;
    v10->_observerNotificationQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v17;

    v19 = v10;
  }

  return v10;
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 roundedIcon:(BOOL)a5 synchronously:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (void (**)(void))a7;
  v14 = v13;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v13[2](v13);
  }
  else
  {
    v16 = objc_msgSend(v12, "if_compactMap:", &__block_literal_global_145);
    if ([v16 count])
    {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = DeviceRGB;
      v27 = (void (**)(void))_Block_copy(aBlock);
      v18 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:]([WFRemoteImageDrawingContext alloc], "initWithImageCount:singleImageSize:scale:colorSpace:", [v16 count], DeviceRGB, width, height, 0.0);
      if (v18)
      {
        v19 = [v16 valueForKey:@"glyphCharacter"];
        v20 = objc_msgSend(v16, "if_compactMap:", &__block_literal_global_203);
        uint64_t v21 = [v20 count];
        if (v21 != [v19 count])
        {

          v20 = 0;
        }
        objc_super v22 = +[VCVoiceShortcutClient standardClient];
        if (v8)
        {
          v23 = v33;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_206;
          v33[3] = &unk_1E6079C90;
          v33[4] = v14;
          uint64_t v24 = [v22 synchronousRemoteDataStoreWithErrorHandler:v33];
        }
        else
        {
          v23 = v32;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_208;
          v32[3] = &unk_1E6079C90;
          v32[4] = v14;
          uint64_t v24 = [v22 asynchronousRemoteDataStoreWithErrorHandler:v32];
        }
        v26 = (void *)v24;

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_209;
        v28[3] = &unk_1E6078FB0;
        id v29 = v16;
        v30 = v18;
        v31 = v14;
        [v26 drawGlyphs:v19 withBackgroundColorValues:v20 padding:v9 rounded:v30 intoContext:v28 completion:0.0];
      }
      else
      {
        v25 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]";
          __int16 v37 = 2112;
          id v38 = v12;
          _os_log_impl(&dword_1B3C5C000, v25, OS_LOG_TYPE_ERROR, "%s Could not create remote image drawing context for drawing icons into workflows: %@", buf, 0x16u);
        }

        v14[2](v14);
      }

      v27[2]();
    }
    else
    {
      v14[2](v14);
    }
  }
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2(uint64_t a1)
{
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_206(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching synchronous VCVoiceShortcutClient proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_208(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching asynchronous VCVoiceShortcutClient proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_209(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_210;
  v3[3] = &unk_1E6078970;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_210(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = (void *)MEMORY[0x1B3EC58F0]();
  uint64_t v6 = [*(id *)(a1 + 32) imageAtIndex:a3];
  [*(id *)(a1 + 32) scale];
  objc_msgSend(v7, "setIconImage:scale:", v6);
}

id __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_200(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "backgroundColorValue"));
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1F0CB5FD8]) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4
{
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 completion:(id)a5
{
}

@end
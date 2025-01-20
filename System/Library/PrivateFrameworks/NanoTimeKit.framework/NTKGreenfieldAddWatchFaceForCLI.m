@interface NTKGreenfieldAddWatchFaceForCLI
- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4;
- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5;
- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4;
- (void)addWatchFaceWithURL:(id)a3 withCompletion:(id)a4;
@end

@implementation NTKGreenfieldAddWatchFaceForCLI

- (void)addWatchFaceWithURL:(id)a3 withCompletion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  addWatchFaceManager = self->_addWatchFaceManager;
  if (!addWatchFaceManager)
  {
    v8 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
    v9 = self->_addWatchFaceManager;
    self->_addWatchFaceManager = v8;

    [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager setDelegate:self];
    addWatchFaceManager = self->_addWatchFaceManager;
  }
  [(NTKGreenfieldAddWatchFaceManager *)addWatchFaceManager decodeWatchFaceWithURL:v12 sourceApplicationBundleIdentifier:0];
  v10 = (void *)[v6 copy];
  id completion = self->_completion;
  self->_id completion = v10;
}

- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager finished with error:%@", (uint8_t *)&v10, 0x16u);
  }
  id completion = (void (**)(id, id))self->_completion;
  if (completion) {
    completion[2](completion, v5);
  }
}

- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToAddComplicationWithItemId", (uint8_t *)&v12, 0xCu);
  }
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.greenfield.cli.errordomain" code:0 userInfo:0];
  id completion = (void (**)(id, void *))self->_completion;
  if (completion) {
    completion[2](completion, v10);
  }
}

- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v11 = 138412290;
    int v12 = v8;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToCompletedWithSkippedComplicationSlots", (uint8_t *)&v11, 0xCu);
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.greenfield.cli.errordomain" code:1 userInfo:0];
  id completion = (void (**)(id, void *))self->_completion;
  if (completion) {
    completion[2](completion, v9);
  }
}

- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v12 = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToComplicationsNotAvailableWithSlots", (uint8_t *)&v12, 0xCu);
  }
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.greenfield.cli.errordomain" code:2 userInfo:0];
  id completion = (void (**)(id, void *))self->_completion;
  if (completion) {
    completion[2](completion, v10);
  }
}

- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v12 = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToRevisitComplicationWithItemId", (uint8_t *)&v12, 0xCu);
  }
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.greenfield.cli.errordomain" code:3 userInfo:0];
  id completion = (void (**)(id, void *))self->_completion;
  if (completion) {
    completion[2](completion, v10);
  }
}

- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [NSNumber numberWithBool:v4];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[%@] updateStateToWelcomeWithCanAddFaceDirectly canAddFaceDirectly:%@", (uint8_t *)&v10, 0x16u);
  }
  if (v4) {
    [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleAddToMyFacesAction];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_addWatchFaceManager, 0);
}

@end
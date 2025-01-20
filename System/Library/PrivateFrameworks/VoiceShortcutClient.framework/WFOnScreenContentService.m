@interface WFOnScreenContentService
+ (id)sharedService;
- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4;
- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation WFOnScreenContentService

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[VCVoiceShortcutClient standardClient];
  [v7 getOnScreenContentWithOptions:v6 completionHandler:v5];
}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[VCVoiceShortcutClient standardClient];
  [v7 getOnScreenContentWithOptions:v6 completion:v5];
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_18637);
  }
  v2 = (void *)sharedService_service;
  return v2;
}

uint64_t __41__WFOnScreenContentService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(WFOnScreenContentService);
  uint64_t v1 = sharedService_service;
  sharedService_service = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
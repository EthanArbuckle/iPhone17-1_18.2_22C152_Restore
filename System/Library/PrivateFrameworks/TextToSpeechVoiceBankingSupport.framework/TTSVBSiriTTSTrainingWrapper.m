@interface TTSVBSiriTTSTrainingWrapper
+ (BOOL)isSiriTrainingAvailable;
+ (NSBundle)siriTTSTrainingBundle;
@end

@implementation TTSVBSiriTTSTrainingWrapper

+ (BOOL)isSiriTrainingAvailable
{
  v2 = +[TTSVBSiriTTSTrainingWrapper siriTTSTrainingBundle];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (NSBundle)siriTTSTrainingBundle
{
  if (siriTTSTrainingBundle_onceToken != -1) {
    dispatch_once(&siriTTSTrainingBundle_onceToken, &__block_literal_global);
  }
  v2 = (void *)siriTTSTrainingBundle__SiriTTSTrainingBundle;

  return (NSBundle *)v2;
}

void __52__TTSVBSiriTTSTrainingWrapper_siriTTSTrainingBundle__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getSiriTTSTrainerTaskClass_softClass;
  uint64_t v8 = getSiriTTSTrainerTaskClass_softClass;
  if (!getSiriTTSTrainerTaskClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getSiriTTSTrainerTaskClass_block_invoke;
    v4[3] = &unk_265539178;
    v4[4] = &v5;
    __getSiriTTSTrainerTaskClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:v1];
    BOOL v3 = (void *)siriTTSTrainingBundle__SiriTTSTrainingBundle;
    siriTTSTrainingBundle__SiriTTSTrainingBundle = v2;
  }
}

@end
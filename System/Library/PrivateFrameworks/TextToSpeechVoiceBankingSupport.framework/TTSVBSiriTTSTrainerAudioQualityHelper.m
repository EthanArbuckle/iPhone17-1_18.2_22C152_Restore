@interface TTSVBSiriTTSTrainerAudioQualityHelper
+ (id)assessAudioForBuffers:(id)a3;
@end

@implementation TTSVBSiriTTSTrainerAudioQualityHelper

+ (id)assessAudioForBuffers:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getSiriTTSTrainerAudioQualityHelperClass_softClass;
  uint64_t v13 = getSiriTTSTrainerAudioQualityHelperClass_softClass;
  if (!getSiriTTSTrainerAudioQualityHelperClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getSiriTTSTrainerAudioQualityHelperClass_block_invoke;
    v9[3] = &unk_265539178;
    v9[4] = &v10;
    __getSiriTTSTrainerAudioQualityHelperClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = [v6 assessAudioQualityWithBuffers:v3];
  [v7 SPL];
  -[TTSVBAudioQualityMeasurement setSpl:](v4, "setSpl:");
  objc_msgSend(v7, "SPL_end");
  -[TTSVBAudioQualityMeasurement setSplEnd:](v4, "setSplEnd:");
  objc_msgSend(v7, "SPL_unnormalized");
  -[TTSVBAudioQualityMeasurement setSplUnnormalized:](v4, "setSplUnnormalized:");
  objc_msgSend(v7, "SPL_unnormalized_end");
  -[TTSVBAudioQualityMeasurement setSplEndUnnormalized:](v4, "setSplEndUnnormalized:");
  objc_msgSend(v7, "SPL_threshold");
  -[TTSVBAudioQualityMeasurement setSplThreshold:](v4, "setSplThreshold:");
  [v7 SNR];
  -[TTSVBAudioQualityMeasurement setSnr:](v4, "setSnr:");
  objc_msgSend(v7, "SNR_end");
  -[TTSVBAudioQualityMeasurement setSnrEnd:](v4, "setSnrEnd:");
  objc_msgSend(v7, "SNR_unnormalized");
  -[TTSVBAudioQualityMeasurement setSnrUnnormalized:](v4, "setSnrUnnormalized:");
  objc_msgSend(v7, "SNR_unnormalized_end");
  -[TTSVBAudioQualityMeasurement setSnrEndUnnormalized:](v4, "setSnrEndUnnormalized:");
  objc_msgSend(v7, "SNR_threshold");
  -[TTSVBAudioQualityMeasurement setSnrThreshold:](v4, "setSnrThreshold:");

  return v4;
}

@end
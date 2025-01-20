@interface QuickTypePFLTrainerMLP
+ (__CFData)copyToFlatBuffer:(void *)a3;
+ (id)reportingStringForModelUpdates:(float *)a3 count:(unint64_t)a4;
+ (void)initialize;
- (BOOL)trainOn:(id)a3 forNEpochs:(unint64_t)a4;
- (NSNumber)clippingNorm;
- (NSNumber)gradientClipMax;
- (NSNumber)gradientClipMin;
- (NSNumber)initialLoss;
- (NSNumber)learningRate;
- (NSNumber)trainingLoss;
- (NSString)privacyIdentifier;
- (QuickTypePFLTrainerMLP)initWithSeedModelPath:(id)a3 andPrivacyIdentifier:(id)a4;
- (id).cxx_construct;
- (id)getWeightUpdatesAddNoise:(BOOL)a3 encryptionKey:(id)a4 recipe:(id)a5;
- (unint64_t)batchSize;
- (unint64_t)normBinCount;
- (void)setBatchSize:(unint64_t)a3;
- (void)setClippingNorm:(id)a3;
- (void)setGradientClipMax:(id)a3;
- (void)setGradientClipMin:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setNormBinCount:(unint64_t)a3;
- (void)writeModelToURL:(id)a3;
@end

@implementation QuickTypePFLTrainerMLP

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.NLP", "QuickTypePFLTrainerMLP");
    MEMORY[0x270F9A758]();
  }
}

+ (__CFData)copyToFlatBuffer:(void *)a3
{
  CFTypeRef cf = 0;
  CFArrayRef v3 = (const __CFArray *)NLModelContainerCopySplitContainerData();
  if (CFArrayGetCount(v3) != 2) {
    __assert_rtn("+[QuickTypePFLTrainerMLP copyToFlatBuffer:]", "QuickTypePFLTrainerMLP.mm", 64, "CFArrayGetCount(containerDataArray) == 2 && \"NLModelContainerCopySplitContainerData is expected to return an array of size 2\"");
  }
  CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v3, 1);
  CFIndex Length = CFDataGetLength(ValueAtIndex);
  MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Length, ValueAtIndex);
  if (v3) {
    CFRelease(v3);
  }
  return MutableCopy;
}

+ (id)reportingStringForModelUpdates:(float *)a3 count:(unint64_t)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  if (a4 >= 3) {
    unint64_t v7 = 3;
  }
  else {
    unint64_t v7 = a4;
  }
  if (v7)
  {
    v8 = a3;
    do
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *v8);
      [v6 addObject:v9];

      ++v8;
      --v7;
    }
    while (v7);
  }
  v10 = [v6 componentsJoinedByString:@", "];
  if (a4 >= 4)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@ .. %f", v10, a3[a4 - 1]];

    v10 = (void *)v11;
  }
  v26[0] = @"ModelUpdate";
  v26[1] = @"ModelShape";
  v27[0] = v10;
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"(%zu,)", a4);
  v27[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  id v25 = 0;
  v14 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:0 error:&v25];
  id v15 = v25;
  if (![v14 length] || v15)
  {
    v17 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      +[QuickTypePFLTrainerMLP reportingStringForModelUpdates:count:]((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
    }
    v16 = 0;
  }
  else
  {
    v16 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
  }

  return v16;
}

- (QuickTypePFLTrainerMLP)initWithSeedModelPath:(id)a3 andPrivacyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)QuickTypePFLTrainerMLP;
  v8 = [(QuickTypePFLTrainerMLP *)&v18 init];
  if (v8)
  {
    id v9 = objc_alloc(NSURL);
    v10 = [v6 absoluteString];
    uint64_t v11 = [v9 initWithString:v10];
    seedModelPath = v8->_seedModelPath;
    v8->_seedModelPath = (NSURL *)v11;

    nlp::CFScopedPtr<void *>::reset((const void **)&v8->_model.m_ref, 0);
    v8->_batchSize = 1;
    uint64_t v13 = [NSNumber numberWithDouble:5.0];
    clippingNorm = v8->_clippingNorm;
    v8->_clippingNorm = (NSNumber *)v13;

    v8->_normBinCount = 30;
    uint64_t v15 = [v7 copy];
    privacyIdentifier = v8->_privacyIdentifier;
    v8->_privacyIdentifier = (NSString *)v15;
  }
  return v8;
}

- (BOOL)trainOn:(id)a3 forNEpochs:(unint64_t)a4
{
  v52[3] = *MEMORY[0x263EF8340];
  id v39 = a3;
  v51[0] = *MEMORY[0x263F56628];
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  v52[0] = v6;
  v51[1] = *MEMORY[0x263F565F8];
  id v7 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  v51[2] = *MEMORY[0x263F56600];
  v52[1] = v7;
  v52[2] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  id v9 = (void *)[v8 mutableCopy];

  v10 = [(QuickTypePFLTrainerMLP *)self learningRate];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    v12 = [(QuickTypePFLTrainerMLP *)self learningRate];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F56618]];
  }
  uint64_t v13 = [(QuickTypePFLTrainerMLP *)self gradientClipMax];
  if (v13)
  {
    v14 = [(QuickTypePFLTrainerMLP *)self gradientClipMin];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      v16 = [(QuickTypePFLTrainerMLP *)self gradientClipMin];
      [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x263F56610]];

      v17 = [(QuickTypePFLTrainerMLP *)self gradientClipMax];
      [v9 setObject:v17 forKeyedSubscript:*MEMORY[0x263F56608]];
    }
  }
  CFTypeRef cf = 0;
  objc_super v18 = (const void *)NLModelContainerCreateWithContentsOfURL();
  v47 = v18;
  if (v18 && (uint64_t v19 = (const void *)MLPModelTrainerCreateWithModel(), v46 = v19, CFRelease(v18), v47 = 0, v19))
  {
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke;
    v44[3] = &unk_264BEEBD8;
    id v20 = v39;
    id v45 = v20;
    uint64_t v21 = (void *)MEMORY[0x237DBF4B0](v44);
    uint64_t v22 = (void *)MLPModelTrainerEvaluateModel();
    uint64_t v23 = (void *)MEMORY[0x263F56620];
    v24 = [v22 objectForKeyedSubscript:*MEMORY[0x263F56620]];
    initialLoss = self->_initialLoss;
    self->_initialLoss = v24;

    v26 = (id)sLog;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      [(NSNumber *)self->_initialLoss floatValue];
      *(_DWORD *)buf = 134217984;
      double v50 = v27;
      _os_log_impl(&dword_234530000, v26, OS_LOG_TYPE_INFO, "Initial loss: %.2f", buf, 0xCu);
    }

    [v20 rewind];
    char v43 = 1;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_60;
    v40[3] = &unk_264BEEC00;
    id v28 = v20;
    id v41 = v28;
    v42 = &v43;
    v29 = (void *)MEMORY[0x237DBF4B0](v40);
    v30 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234530000, v30, OS_LOG_TYPE_INFO, "Started training", buf, 2u);
    }
    v31 = (const void *)MLPModelTrainerTrainModel();
    nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, v31);
    [v28 rewind];
    v32 = (void *)MLPModelTrainerEvaluateModel();
    v33 = [v32 objectForKeyedSubscript:*v23];
    trainingLoss = self->_trainingLoss;
    self->_trainingLoss = v33;

    v35 = (id)sLog;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      [(NSNumber *)self->_trainingLoss floatValue];
      *(_DWORD *)buf = 134217984;
      double v50 = v36;
      _os_log_impl(&dword_234530000, v35, OS_LOG_TYPE_INFO, "Training loss: %.2f", buf, 0xCu);
    }

    BOOL v37 = self->_model.m_ref != 0;
    CFRelease(v19);
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

uint64_t __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) nextTrainingDataBatch:a3];
  if (!result) {
    *a5 = 1;
  }
  return result;
}

uint64_t __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_60(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned char *a5)
{
  if (a4) {
    [*(id *)(a1 + 32) rewind];
  }
  if (*(void *)(a1 + 40) != a2) {
    return 0;
  }
  uint64_t result = [*(id *)(a1 + 32) nextTrainingDataBatch:a3];
  if (!result) {
    *a5 = 1;
  }
  return result;
}

void __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CFArrayRef v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_234530000, v3, OS_LOG_TYPE_INFO, "PFL Training %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getWeightUpdatesAddNoise:(BOOL)a3 encryptionKey:(id)a4 recipe:(id)a5
{
  BOOL v6 = a3;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v56 = a5;
  if (!self->_model.m_ref)
  {
    v55 = v8;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:]();
    }
    goto LABEL_53;
  }
  if ((!v8 || !v6) && !+[NLPLearnerUtils isInternalInstall])
  {
    v55 = v8;
LABEL_53:
    v35 = 0;
    goto LABEL_59;
  }
  v54 = objc_alloc_init(QuickTypeWeightUpdates);
  id v9 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_234530000, v9, OS_LOG_TYPE_INFO, "Dumping updated model weights", buf, 2u);
  }
  if ([v56 pluginShouldAddNoiseAndEncryptResult])
  {
    v10 = (id)sLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = [NSNumber numberWithBool:v6];
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.9(v11, (uint64_t)v8, buf, v10);
    }

    id v12 = v8;
  }
  else
  {

    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG)) {
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:]0();
    }
    id v12 = 0;
    LODWORD(v6) = 0;
  }
  v55 = v12;
  uint64_t v13 = (const void *)NLModelContainerCreateWithContentsOfURL();
  v60 = v13;
  CFDataRef v14 = (const __CFData *)[(id)objc_opt_class() copyToFlatBuffer:v13];
  CFDataRef v59 = v14;
  if (v13) {
    CFRelease(v13);
  }
  v60 = 0;
  BytePtr = CFDataGetBytePtr(v14);
  v16 = (__CFData *)[(id)objc_opt_class() copyToFlatBuffer:self->_model.m_ref];
  v58 = v16;
  MutableBytePtr = CFDataGetMutableBytePtr(v16);
  unint64_t Length = CFDataGetLength(v14);
  unint64_t v19 = Length >> 2;
  if (Length >> 2 != (unint64_t)CFDataGetLength(v16) >> 2) {
    __assert_rtn("-[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:]", "QuickTypePFLTrainerMLP.mm", 220, "weightCount == (CFDataGetLength(updatedModelData) / sizeof(float)) && \"Mismatching buffer lengths for seed model and updated model\"");
  }
  uint64_t v52 = [objc_alloc(MEMORY[0x263F3A448]) initWithRecipe:v56];
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG)) {
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.8();
  }
  double v20 = 0.0;
  float v21 = 0.0;
  if (Length >= 4)
  {
    if (v19 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = Length >> 2;
    }
    uint64_t v23 = (float *)MutableBytePtr;
    do
    {
      float v24 = *(float *)BytePtr;
      BytePtr += 4;
      float v25 = *v23;
      float v26 = *v23 - v24;
      *v23++ = v26;
      double v20 = v26 * v26 + *(float *)&v20;
      *(float *)&double v20 = v20;
      float v27 = vabds_f32(v25, v24);
      if (v27 > v21) {
        float v21 = v27;
      }
      --v22;
    }
    while (v22);
  }
  *(float *)&double v20 = sqrtf(*(float *)&v20);
  id v28 = objc_msgSend(NSNumber, "numberWithFloat:", v20, v52);
  [(QuickTypeWeightUpdates *)v54 setL2Norm:v28];

  *(float *)&double v29 = v21;
  v30 = [NSNumber numberWithFloat:v29];
  [(QuickTypeWeightUpdates *)v54 setMaxNorm:v30];

  if (v14) {
    CFRelease(v14);
  }
  CFDataRef v59 = 0;
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, 0);
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG)) {
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.7();
  }
  if (!v6)
  {
    float v36 = [(id)objc_opt_class() reportingStringForModelUpdates:MutableBytePtr count:v19];
    [(QuickTypeWeightUpdates *)v54 setWeightUpdatesDiagnosticReport:v36];

    BOOL v37 = (id)sLog;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = [(QuickTypeWeightUpdates *)v54 weightUpdatesDiagnosticReport];
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.6(v38, v62, v37);
    }

    if (v55)
    {
      id v57 = 0;
      v33 = [v53 encryptedDataWithPublicKey:v55 inPlaceDataFloatNumbers:MutableBytePtr count:v19 error:&v57];
      id v39 = v57;
      v34 = v39;
      if (!v33 || v39)
      {
        id v45 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
          -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.4((uint64_t)v34, v45, v46, v47, v48, v49, v50, v51);
        }
        goto LABEL_39;
      }
      if (v16) {
        CFRelease(v16);
      }
      v58 = 0;
      v40 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl(&dword_234530000, v40, OS_LOG_TYPE_INFO, "Privatization and encryption completed", v61, 2u);
      }
      id v41 = (id)sLog;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.5(v61, [v33 length], v41);
      }

      [(QuickTypeWeightUpdates *)v54 setWeightUpdates:v33];
      v35 = v54;
      v16 = 0;
    }
    else
    {
      id v42 = objc_alloc_init(MEMORY[0x263F3A450]);
      [v42 setVersion:1];
      [v42 setData32s:MutableBytePtr count:v19];
      char v43 = [v42 data];
      [(QuickTypeWeightUpdates *)v54 setWeightUpdates:v43];

      v35 = v54;
      v33 = 0;
    }
    v34 = 0;
    goto LABEL_56;
  }
  v31 = (id)sLog;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v32 = [(QuickTypePFLTrainerMLP *)self clippingNorm];
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:](v32, v62, [(QuickTypePFLTrainerMLP *)self normBinCount], v31);
  }

  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:]();
  }
  v33 = 0;
  v34 = 0;
LABEL_39:
  v35 = 0;
LABEL_56:

  if (v16) {
    CFRelease(v16);
  }

LABEL_59:
  return v35;
}

- (void)writeModelToURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_model.m_ref)
  {
    if (NLModelContainerWriteToURL())
    {
      uint64_t v5 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_234530000, v5, OS_LOG_TYPE_INFO, "Saved PFL model at %@", buf, 0xCu);
      }
    }
    else
    {
      BOOL v6 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[QuickTypePFLTrainerMLP writeModelToURL:](0, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    -[QuickTypePFLTrainerMLP writeModelToURL:]();
  }
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
}

- (NSNumber)gradientClipMin
{
  return self->_gradientClipMin;
}

- (void)setGradientClipMin:(id)a3
{
}

- (NSNumber)gradientClipMax
{
  return self->_gradientClipMax;
}

- (void)setGradientClipMax:(id)a3
{
}

- (NSNumber)clippingNorm
{
  return self->_clippingNorm;
}

- (void)setClippingNorm:(id)a3
{
}

- (unint64_t)normBinCount
{
  return self->_normBinCount;
}

- (void)setNormBinCount:(unint64_t)a3
{
  self->_normBinCount = a3;
}

- (NSNumber)initialLoss
{
  return self->_initialLoss;
}

- (NSNumber)trainingLoss
{
  return self->_trainingLoss;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
  objc_storeStrong((id *)&self->_clippingNorm, 0);
  objc_storeStrong((id *)&self->_gradientClipMax, 0);
  objc_storeStrong((id *)&self->_gradientClipMin, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_trainingLoss, 0);
  objc_storeStrong((id *)&self->_initialLoss, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, 0);
  objc_storeStrong((id *)&self->_seedModelPath, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

+ (void)copyToFlatBuffer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)reportingStringForModelUpdates:(uint64_t)a3 count:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)trainOn:(uint64_t)a3 forNEpochs:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)trainOn:(uint64_t)a3 forNEpochs:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_234530000, v0, v1, "PFL error: model is nil.", v2, v3, v4, v5, v6);
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_234530000, v0, v1, "PFL privatization failed", v2, v3, v4, v5, v6);
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a3 encryptionKey:(os_log_t)log recipe:.cold.3(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_234530000, log, OS_LOG_TYPE_DEBUG, "Privacy parameters: norm = %@, binCount = %lu", buf, 0x16u);
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a3 encryptionKey:(uint64_t)a4 recipe:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getWeightUpdatesAddNoise:(uint8_t *)buf encryptionKey:(uint64_t)a2 recipe:(os_log_t)log .cold.5(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_234530000, log, OS_LOG_TYPE_DEBUG, "Encrypted data size is : %{bytes}zu", buf, 0xCu);
}

- (void)getWeightUpdatesAddNoise:(void *)a1 encryptionKey:(uint8_t *)buf recipe:(os_log_t)log .cold.6(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_234530000, log, OS_LOG_TYPE_DEBUG, "Added model diagnostic report: %@", buf, 0xCu);
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_234530000, v0, v1, "Constructed protobuf from weight updates", v2, v3, v4, v5, v6);
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_234530000, v0, v1, "Computing weight updates from flatened models", v2, v3, v4, v5, v6);
}

- (void)getWeightUpdatesAddNoise:(uint8_t *)buf encryptionKey:(os_log_t)log recipe:.cold.9(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_234530000, log, OS_LOG_TYPE_DEBUG, "Privatization : %@. Encryption : %@", buf, 0x16u);
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_234530000, v0, v1, "Task configured by platform to skip privatization and encryption", v2, v3, v4, v5, v6);
}

- (void)writeModelToURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_234530000, v0, v1, "Failed to save PFL model: nothing to save.", v2, v3, v4, v5, v6);
}

- (void)writeModelToURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
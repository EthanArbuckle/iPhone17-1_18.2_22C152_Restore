@interface SASSpeechRecognized(SiriUIFoundationAdditions)
- (uint64_t)sruif_isUserUtterance;
- (uint64_t)sruif_isUtterance;
- (uint64_t)sruif_waitsForConfirmation;
- (void)sruif_setRecognitionWithCorrectedSpeech:()SiriUIFoundationAdditions;
@end

@implementation SASSpeechRecognized(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUtterance
{
  return 1;
}

- (uint64_t)sruif_isUserUtterance
{
  return 1;
}

- (uint64_t)sruif_waitsForConfirmation
{
  return 1;
}

- (void)sruif_setRecognitionWithCorrectedSpeech:()SiriUIFoundationAdditions
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F64C90];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setText:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F64BF0]);
  v15[0] = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v7 setTokens:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F64C00]);
  id v14 = v7;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [v9 setInterpretations:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F64C08]);
  id v13 = v9;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v11 setPhrases:v12];

  [a1 setRecognition:v11];
}

@end
@interface PIRedEyeAdjustmentController
+ (id)inputCorrectionInfoKey;
- (BOOL)hasCorrections;
- (NSArray)inputCorrectionInfo;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setInputCorrectionInfo:(id)a3;
@end

@implementation PIRedEyeAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setInputCorrectionInfo:(id)a3
{
  id v6 = (id)[a3 copy];
  v4 = [(PIAdjustmentController *)self adjustment];
  v5 = +[PIRedEyeAdjustmentController inputCorrectionInfoKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSArray)inputCorrectionInfo
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIRedEyeAdjustmentController inputCorrectionInfoKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C978] array];
  }
  v7 = v6;

  return (NSArray *)v7;
}

- (BOOL)hasCorrections
{
  v3 = [(PIAdjustmentController *)self adjustment];
  v4 = +[PIRedEyeAdjustmentController inputCorrectionInfoKey];
  v5 = [v3 objectForKeyedSubscript:v4];

  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0 && [v5 count] != 0;
  v7 = [(PIAdjustmentController *)self adjustment];
  v8 = [v7 objectForKeyedSubscript:@"enabled"];
  BOOL v9 = [v8 BOOLValue] & v6;

  return v9;
}

+ (id)inputCorrectionInfoKey
{
  return @"inputCorrectionInfo";
}

@end
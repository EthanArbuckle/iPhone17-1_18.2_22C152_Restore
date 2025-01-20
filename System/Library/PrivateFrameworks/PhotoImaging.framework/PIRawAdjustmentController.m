@interface PIRawAdjustmentController
- (NSString)inputDecoderVersion;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setInputDecoderVersion:(id)a3;
@end

@implementation PIRawAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)inputDecoderVersion
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"inputDecoderVersion"];

  return (NSString *)v3;
}

- (void)setInputDecoderVersion:(id)a3
{
  id v5 = (id)[a3 copy];
  v4 = [(PIAdjustmentController *)self adjustment];
  [v4 setObject:v5 forKeyedSubscript:@"inputDecoderVersion"];
}

@end
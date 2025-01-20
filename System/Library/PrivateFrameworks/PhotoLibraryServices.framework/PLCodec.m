@interface PLCodec
+ (BOOL)isPlayableFourCharCodecName:(id)a3;
+ (id)H264fourCharCode;
+ (id)HEVCfourCharCode;
+ (unsigned)_typeCodeFromString:(id)a3;
@end

@implementation PLCodec

+ (id)HEVCfourCharCode
{
  if (HEVCfourCharCode_onceToken != -1) {
    dispatch_once(&HEVCfourCharCode_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)HEVCfourCharCode_codecName;
  return v2;
}

void __27__PLCodec_HEVCfourCharCode__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F8CC38] stringFromFourCharCode:1752589105];
  v1 = (void *)HEVCfourCharCode_codecName;
  HEVCfourCharCode_codecName = v0;
}

+ (id)H264fourCharCode
{
  if (H264fourCharCode_onceToken != -1) {
    dispatch_once(&H264fourCharCode_onceToken, &__block_literal_global_75197);
  }
  v2 = (void *)H264fourCharCode_codecName;
  return v2;
}

void __27__PLCodec_H264fourCharCode__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F8CC38] stringFromFourCharCode:1635148593];
  v1 = (void *)H264fourCharCode_codecName;
  H264fourCharCode_codecName = v0;
}

+ (BOOL)isPlayableFourCharCodecName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [a1 _typeCodeFromString:v4];
    BOOL v5 = VTSelectAndCreateVideoDecoderInstance() == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (unsigned)_typeCodeFromString:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  if ((unint64_t)[v3 length] < 4)
  {
    unsigned int v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "getBytes:range:", &v6, 0, 4);
    unsigned int v4 = bswap32(v6);
  }

  return v4;
}

@end
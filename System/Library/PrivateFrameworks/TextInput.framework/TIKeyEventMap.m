@interface TIKeyEventMap
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TIKeyEventMap)initWithCoder:(id)a3;
- (id)inputEventForInputString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
- (int64_t)candidateNumberKey:(int)a3;
- (unint64_t)hash;
@end

@implementation TIKeyEventMap

- (int64_t)candidateNumberKey:(int)a3
{
  return u_charDigitValue(a3);
}

- (id)inputEventForInputString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  return 0;
}

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v6 = a3;

  return v6;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return [(TIKeyEventMap *)self isMemberOfClass:v4];
}

- (TIKeyEventMap)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyEventMap;
  return [(TIKeyEventMap *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __42__TIKeyEventMap_zh_punctuationMap_zh_Hant__block_invoke()
{
  v0 = (void *)punctuationMap_zh_Hant___punctuationMap;
  punctuationMap_zh_Hant___punctuationMap = (uint64_t)&unk_1EDC2C260;
}

void __42__TIKeyEventMap_zh_punctuationMap_zh_Hans__block_invoke()
{
  v0 = (void *)punctuationMap_zh_Hans___punctuationMap;
  punctuationMap_zh_Hans___punctuationMap = (uint64_t)&unk_1EDC2C238;
}

uint64_t __46__TIKeyEventMap_zh_Hans_Pinyin_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__TIKeyEventMap_zh_Hant_Pinyin_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_194 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__TIKeyEventMap_zh_Hant_Zhuyin_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_200 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_209 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __66__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_candidateNumberKey___block_invoke()
{
  v0 = (void *)candidateNumberKey____numberKeys;
  candidateNumberKey____numberKeys = (uint64_t)&unk_1EDC28750;
}

void __41__TIKeyEventMap_zh_Stroke_wubiFromASCII___block_invoke()
{
  v0 = (void *)wubiFromASCII__asciiToWubiMap;
  wubiFromASCII__asciiToWubiMap = (uint64_t)&unk_1EDC2C288;
}

uint64_t __46__TIKeyEventMap_zh_Hans_Stroke_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_299 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__TIKeyEventMap_zh_Hant_Stroke_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_304 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__TIKeyEventMap_zh_Hant_Cangjie_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_310 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__TIKeyEventMap_zh_Hans_Wubixing_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance___keyEventMap_316 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __33__TIKeyEventMap_ja_optionMap_JIS__block_invoke()
{
  v0 = (void *)optionMap_JIS_optionMap;
  optionMap_JIS_optionMap = (uint64_t)&unk_1EDC2C2D8;
}

void __38__TIKeyEventMap_ja_shiftOptionMap_JIS__block_invoke()
{
  v0 = (void *)shiftOptionMap_JIS_optionMap;
  shiftOptionMap_JIS_optionMap = (uint64_t)&unk_1EDC2C2B0;
}

@end
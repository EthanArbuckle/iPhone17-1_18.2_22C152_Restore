@interface CRCHCharacterSetRules
+ (id)sharedCharacterSetRules;
+ (unint64_t)characterType:(unsigned int)a3;
+ (unint64_t)expectedMaxStrokeCount:(unsigned int)a3;
+ (unint64_t)expectedMinStrokeCount:(unsigned int)a3;
- (CRCHCharacterSetRules)init;
- (NSCharacterSet)arithmeticOperatorCharSet;
- (NSCharacterSet)containsDotCharSet;
- (NSCharacterSet)dateTimeEndLetterCharSet;
- (NSCharacterSet)dateTimeSeparatorCharSet;
- (NSCharacterSet)digitCharSet;
- (NSCharacterSet)digitEndPunctuationCharSet;
- (NSCharacterSet)digitStartPunctuationCharSet;
- (NSCharacterSet)emailAtCharSet;
- (NSCharacterSet)emailPunctuationCharSet;
- (NSCharacterSet)emoticonBottomCharSet;
- (NSCharacterSet)emoticonMiddleCharSet;
- (NSCharacterSet)emoticonTopCharSet;
- (NSCharacterSet)endPunctuationCharSet;
- (NSCharacterSet)lexiconSkipCharSet;
- (NSCharacterSet)lowercaseCharSet;
- (NSCharacterSet)middlePunctuationCharSet;
- (NSCharacterSet)numeralEndLetterCharSet;
- (NSCharacterSet)prefixCapitalizationExceptionCharSet;
- (NSCharacterSet)selfLoopPunctuationCharSet;
- (NSCharacterSet)startPunctuationCharSet;
- (NSCharacterSet)uppercaseCharSet;
- (NSCharacterSet)urlPunctuationCharSet;
- (OS_dispatch_queue)_charSetRulesQueue;
- (id).cxx_construct;
- (map<unsigned)signatureUniChar;
- (map<unsigned)strokeMaxPenalties;
- (unint64_t)_characterType:(unsigned int)a3;
- (unint64_t)_expectedMaxStrokeCount:(unsigned int)a3;
- (unint64_t)_expectedMinStrokeCount:(unsigned int)a3;
- (void)dealloc;
- (void)setArithmeticOperatorCharSet:(id)a3;
- (void)setContainsDotCharSet:(id)a3;
- (void)setDateTimeEndLetterCharSet:(id)a3;
- (void)setDateTimeSeparatorCharSet:(id)a3;
- (void)setDigitCharSet:(id)a3;
- (void)setDigitEndPunctuationCharSet:(id)a3;
- (void)setDigitStartPunctuationCharSet:(id)a3;
- (void)setEmailAtCharSet:(id)a3;
- (void)setEmailPunctuationCharSet:(id)a3;
- (void)setEmoticonBottomCharSet:(id)a3;
- (void)setEmoticonMiddleCharSet:(id)a3;
- (void)setEmoticonTopCharSet:(id)a3;
- (void)setEndPunctuationCharSet:(id)a3;
- (void)setLexiconSkipCharSet:(id)a3;
- (void)setLowercaseCharSet:(id)a3;
- (void)setMiddlePunctuationCharSet:(id)a3;
- (void)setNumeralEndLetterCharSet:(id)a3;
- (void)setPrefixCapitalizationExceptionCharSet:(id)a3;
- (void)setSelfLoopPunctuationCharSet:(id)a3;
- (void)setSignatureUniChar:(map<unsigned)int;
- (void)setStartPunctuationCharSet:(id)a3;
- (void)setStrokeMaxPenalties:(map<unsigned)int;
- (void)setUppercaseCharSet:(id)a3;
- (void)setUrlPunctuationCharSet:(id)a3;
@end

@implementation CRCHCharacterSetRules

+ (id)sharedCharacterSetRules
{
  if (qword_1EB58C9C8 != -1) {
    dispatch_once(&qword_1EB58C9C8, &__block_literal_global_9);
  }
  return (id)_MergedGlobals_14;
}

CRCHCharacterSetRules *__48__CRCHCharacterSetRules_sharedCharacterSetRules__block_invoke()
{
  result = objc_alloc_init(CRCHCharacterSetRules);
  _MergedGlobals_14 = (uint64_t)result;
  return result;
}

+ (unint64_t)expectedMaxStrokeCount:(unsigned int)a3
{
  id v4 = +[CRCHCharacterSetRules sharedCharacterSetRules];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [v4 _charSetRulesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CRCHCharacterSetRules_expectedMaxStrokeCount___block_invoke;
  block[3] = &unk_1E6CDB360;
  block[4] = v4;
  block[5] = &v10;
  unsigned int v9 = a3;
  dispatch_sync(v5, block);
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __48__CRCHCharacterSetRules_expectedMaxStrokeCount___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _expectedMaxStrokeCount:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (unint64_t)expectedMinStrokeCount:(unsigned int)a3
{
  id v4 = +[CRCHCharacterSetRules sharedCharacterSetRules];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [v4 _charSetRulesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CRCHCharacterSetRules_expectedMinStrokeCount___block_invoke;
  block[3] = &unk_1E6CDB360;
  block[4] = v4;
  block[5] = &v10;
  unsigned int v9 = a3;
  dispatch_sync(v5, block);
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __48__CRCHCharacterSetRules_expectedMinStrokeCount___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _expectedMinStrokeCount:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (unint64_t)characterType:(unsigned int)a3
{
  id v4 = +[CRCHCharacterSetRules sharedCharacterSetRules];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [v4 _charSetRulesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CRCHCharacterSetRules_characterType___block_invoke;
  block[3] = &unk_1E6CDB360;
  block[4] = v4;
  block[5] = &v10;
  unsigned int v9 = a3;
  dispatch_sync(v5, block);
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __39__CRCHCharacterSetRules_characterType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _characterType:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CRCHCharacterSetRules)init
{
  v4.receiver = self;
  v4.super_class = (Class)CRCHCharacterSetRules;
  v2 = [(CRCHCharacterSetRules *)&v4 init];
  if (v2)
  {
    v2->__charSetRulesQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreHandwriting.CHCharacterSetsRules", 0);
    v2->_lowercaseCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzàáâäçèéêëìíîïñòóôöùúûü\xFFœæß"];
    v2->_uppercaseCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÄÇÈÉÊËÌÍÎÏÑÒÓÔÖÙÚÛÜŸŒÆ"];
    v2->_digitCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    v2->_startPunctuationCharSet = (NSCharacterSet *)objc_retain((id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\"#@(¡¿“„«"];
    v2->_middlePunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-'_"];
    v2->_endPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".,;:!?\"“»"]);
    v2->_digitStartPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"$€¢£-.+["];
    v2->_digitEndPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%?!.,:;\"]]$€¢£°"));
    v2->_arithmeticOperatorCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"^*+=<>.,"];
    v2->_dateTimeSeparatorCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":'\"-/"];
    v2->_dateTimeEndLetterCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"apmAPM."];
    v2->_numeralEndLetterCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"strdndth."];
    v2->_lexiconSkipCharSet = (NSCharacterSet *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "alphanumericCharacterSet"), "invertedSet");
    v2->_containsDotCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"!?:;ij%¡¿ÄËÏÖÜŸäëïöü\xFF"];
    v2->_prefixCapitalizationExceptionCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"@#"];
    v2->_selfLoopPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"!?."];
    v2->_emoticonTopCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":;B="];
    v2->_emoticonMiddleCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-'"];
    v2->_emoticonBottomCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@")(pPDoOxX*"];
    v2->_emailAtCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"@"];
    v2->_emailPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"_-.+"];
    v2->_urlPunctuationCharSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"_-.:/+&?%()$="];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRCHCharacterSetRules;
  [(CRCHCharacterSetRules *)&v3 dealloc];
}

- (unint64_t)_expectedMaxStrokeCount:(unsigned int)a3
{
  unsigned int v9 = a3;
  p_strokeMaxPenalties = (uint64_t **)&self->_strokeMaxPenalties;
  left = self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
LABEL_6:
    if ((int)a3 <= 7837)
    {
      unint64_t v7 = 5;
      switch(a3)
      {
        case 0x21u:
        case 0x22u:
        case 0x2Bu:
        case 0x30u:
        case 0x31u:
        case 0x32u:
        case 0x33u:
        case 0x34u:
        case 0x35u:
        case 0x37u:
        case 0x38u:
        case 0x39u:
        case 0x3Au:
        case 0x3Bu:
        case 0x3Du:
        case 0x3Fu:
        case 0x40u:
        case 0x44u:
        case 0x4Au:
        case 0x4Cu:
        case 0x50u:
        case 0x51u:
        case 0x54u:
        case 0x55u:
        case 0x56u:
        case 0x58u:
        case 0x61u:
        case 0x62u:
        case 0x64u:
        case 0x65u:
        case 0x66u:
        case 0x67u:
        case 0x68u:
        case 0x69u:
        case 0x6Au:
        case 0x6Eu:
        case 0x70u:
        case 0x71u:
        case 0x72u:
        case 0x74u:
        case 0x75u:
        case 0x76u:
        case 0x78u:
        case 0x79u:
        case 0x7Bu:
        case 0x7Du:
        case 0xA1u:
        case 0xA7u:
        case 0xABu:
        case 0xBAu:
        case 0xBBu:
        case 0xBFu:
        case 0xC7u:
        case 0xD2u:
        case 0xD3u:
        case 0xD4u:
        case 0xD7u:
        case 0xDFu:
        case 0xE7u:
        case 0xECu:
        case 0xEDu:
        case 0xEEu:
        case 0xF2u:
        case 0xF3u:
        case 0xF4u:
          goto LABEL_8;
        case 0x23u:
        case 0x2Au:
        case 0x45u:
        case 0x4Du:
        case 0x57u:
        case 0x5Au:
        case 0x77u:
        case 0x7Au:
        case 0xC0u:
        case 0xC1u:
        case 0xC2u:
        case 0xCCu:
        case 0xCDu:
        case 0xCEu:
        case 0xD1u:
        case 0xDCu:
        case 0xE4u:
        case 0xEBu:
        case 0xFCu:
        case 0xFFu:
          unint64_t v7 = 4;
          break;
        case 0x24u:
        case 0x25u:
        case 0x41u:
        case 0x42u:
        case 0x46u:
        case 0x47u:
        case 0x48u:
        case 0x49u:
        case 0x4Bu:
        case 0x4Eu:
        case 0x52u:
        case 0x59u:
        case 0x6Bu:
        case 0x6Du:
        case 0xA3u:
        case 0xAAu:
        case 0xD6u:
        case 0xD9u:
        case 0xDAu:
        case 0xDBu:
        case 0xE0u:
        case 0xE1u:
        case 0xE2u:
        case 0xE8u:
        case 0xE9u:
        case 0xEAu:
        case 0xEFu:
        case 0xF1u:
        case 0xF6u:
        case 0xF7u:
        case 0xF9u:
        case 0xFAu:
        case 0xFBu:
        case 0x152u:
        case 0x153u:
          goto LABEL_17;
        case 0x26u:
        case 0x27u:
        case 0x28u:
        case 0x29u:
        case 0x2Cu:
        case 0x2Du:
        case 0x2Eu:
        case 0x2Fu:
        case 0x36u:
        case 0x3Cu:
        case 0x3Eu:
        case 0x43u:
        case 0x4Fu:
        case 0x53u:
        case 0x5Bu:
        case 0x5Cu:
        case 0x5Du:
        case 0x5Eu:
        case 0x5Fu:
        case 0x60u:
        case 0x63u:
        case 0x6Cu:
        case 0x6Fu:
        case 0x73u:
        case 0x7Cu:
        case 0x7Eu:
        case 0x7Fu:
        case 0x80u:
        case 0x81u:
        case 0x82u:
        case 0x83u:
        case 0x84u:
        case 0x85u:
        case 0x86u:
        case 0x87u:
        case 0x88u:
        case 0x89u:
        case 0x8Au:
        case 0x8Bu:
        case 0x8Cu:
        case 0x8Du:
        case 0x8Eu:
        case 0x8Fu:
        case 0x90u:
        case 0x91u:
        case 0x92u:
        case 0x93u:
        case 0x94u:
        case 0x95u:
        case 0x96u:
        case 0x97u:
        case 0x98u:
        case 0x99u:
        case 0x9Au:
        case 0x9Bu:
        case 0x9Cu:
        case 0x9Du:
        case 0x9Eu:
        case 0x9Fu:
        case 0xA0u:
        case 0xA2u:
        case 0xA4u:
        case 0xA6u:
        case 0xA8u:
        case 0xA9u:
        case 0xACu:
        case 0xADu:
        case 0xAEu:
        case 0xAFu:
        case 0xB0u:
        case 0xB1u:
        case 0xB2u:
        case 0xB3u:
        case 0xB4u:
        case 0xB5u:
        case 0xB6u:
        case 0xB7u:
        case 0xB8u:
        case 0xB9u:
        case 0xBCu:
        case 0xBDu:
        case 0xBEu:
        case 0xC3u:
        case 0xC5u:
        case 0xC6u:
        case 0xCBu:
        case 0xD0u:
        case 0xD5u:
        case 0xD8u:
        case 0xDDu:
        case 0xDEu:
        case 0xE3u:
        case 0xE5u:
        case 0xE6u:
        case 0xF0u:
        case 0xF5u:
        case 0xF8u:
        case 0xFDu:
        case 0xFEu:
        case 0x100u:
        case 0x101u:
        case 0x102u:
        case 0x103u:
        case 0x104u:
        case 0x105u:
        case 0x106u:
        case 0x107u:
        case 0x108u:
        case 0x109u:
        case 0x10Au:
        case 0x10Bu:
        case 0x10Cu:
        case 0x10Du:
        case 0x10Eu:
        case 0x10Fu:
        case 0x110u:
        case 0x111u:
        case 0x112u:
        case 0x113u:
        case 0x114u:
        case 0x115u:
        case 0x116u:
        case 0x117u:
        case 0x118u:
        case 0x119u:
        case 0x11Au:
        case 0x11Bu:
        case 0x11Cu:
        case 0x11Du:
        case 0x11Eu:
        case 0x11Fu:
        case 0x120u:
        case 0x121u:
        case 0x122u:
        case 0x123u:
        case 0x124u:
        case 0x125u:
        case 0x126u:
        case 0x127u:
        case 0x128u:
        case 0x129u:
        case 0x12Au:
        case 0x12Bu:
        case 0x12Cu:
        case 0x12Du:
        case 0x12Eu:
        case 0x12Fu:
        case 0x130u:
        case 0x131u:
        case 0x132u:
        case 0x133u:
        case 0x134u:
        case 0x135u:
        case 0x136u:
        case 0x137u:
        case 0x138u:
        case 0x139u:
        case 0x13Au:
        case 0x13Bu:
        case 0x13Cu:
        case 0x13Du:
        case 0x13Eu:
        case 0x13Fu:
        case 0x140u:
        case 0x141u:
        case 0x142u:
        case 0x143u:
        case 0x144u:
        case 0x145u:
        case 0x146u:
        case 0x147u:
        case 0x148u:
        case 0x149u:
        case 0x14Au:
        case 0x14Bu:
        case 0x14Cu:
        case 0x14Du:
        case 0x14Eu:
        case 0x14Fu:
        case 0x150u:
        case 0x151u:
          goto LABEL_21;
        case 0xA5u:
        case 0xC4u:
        case 0xC8u:
        case 0xC9u:
        case 0xCAu:
        case 0xCFu:
          goto LABEL_18;
        default:
          if (a3 != 376) {
            goto LABEL_21;
          }
          break;
      }
      goto LABEL_18;
    }
    if ((int)a3 > 8229)
    {
      if (a3 != 8230 && a3 != 8364) {
        goto LABEL_21;
      }
LABEL_17:
      unint64_t v7 = 3;
    }
    else
    {
      if (a3 - 8220 >= 3 && a3 != 7838)
      {
LABEL_21:
        unint64_t v7 = 1;
        goto LABEL_18;
      }
LABEL_8:
      unint64_t v7 = 2;
    }
LABEL_18:
    std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_strokeMaxPenalties, a3, &v9)[5] = (uint64_t *)v7;
    return v7;
  }
  while (1)
  {
    unsigned int v6 = left[8];
    if (v6 <= a3) {
      break;
    }
LABEL_5:
    left = *(_DWORD **)left;
    if (!left) {
      goto LABEL_6;
    }
  }
  if (v6 < a3)
  {
    left += 2;
    goto LABEL_5;
  }
  return (unint64_t)std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_strokeMaxPenalties, a3, &v9)[5];
}

- (unint64_t)_expectedMinStrokeCount:(unsigned int)a3
{
  unint64_t result = 3;
  if ((int)a3 > 375)
  {
    if (a3 - 8220 < 3)
    {
      return 2;
    }
    else if (a3 != 376 && a3 != 8230)
    {
      return 1;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xA1u:
      case 0xABu:
      case 0xBBu:
      case 0xC0u:
      case 0xC1u:
      case 0xC2u:
      case 0xC8u:
      case 0xC9u:
      case 0xCAu:
      case 0xCCu:
      case 0xCDu:
      case 0xCEu:
      case 0xD1u:
      case 0xD2u:
      case 0xD3u:
      case 0xD4u:
      case 0xD9u:
      case 0xDAu:
      case 0xDBu:
      case 0xE0u:
      case 0xE1u:
      case 0xE2u:
      case 0xE8u:
      case 0xE9u:
      case 0xEAu:
      case 0xECu:
      case 0xEDu:
      case 0xEEu:
      case 0xF1u:
      case 0xF2u:
      case 0xF3u:
      case 0xF4u:
      case 0xF9u:
      case 0xFAu:
      case 0xFBu:
        return 2;
      case 0xA2u:
      case 0xA3u:
      case 0xA4u:
      case 0xA5u:
      case 0xA6u:
      case 0xA7u:
      case 0xA8u:
      case 0xA9u:
      case 0xAAu:
      case 0xACu:
      case 0xADu:
      case 0xAEu:
      case 0xAFu:
      case 0xB0u:
      case 0xB1u:
      case 0xB2u:
      case 0xB3u:
      case 0xB4u:
      case 0xB5u:
      case 0xB6u:
      case 0xB7u:
      case 0xB8u:
      case 0xB9u:
      case 0xBAu:
      case 0xBCu:
      case 0xBDu:
      case 0xBEu:
      case 0xBFu:
      case 0xC3u:
      case 0xC5u:
      case 0xC6u:
      case 0xC7u:
      case 0xD0u:
      case 0xD5u:
      case 0xD7u:
      case 0xD8u:
      case 0xDDu:
      case 0xDEu:
      case 0xDFu:
      case 0xE3u:
      case 0xE5u:
      case 0xE6u:
      case 0xE7u:
      case 0xF0u:
      case 0xF5u:
      case 0xF8u:
        return 1;
      case 0xC4u:
      case 0xCBu:
      case 0xCFu:
      case 0xD6u:
      case 0xDCu:
      case 0xE4u:
      case 0xEBu:
      case 0xEFu:
      case 0xF6u:
      case 0xF7u:
      case 0xFCu:
        return result;
      default:
        if (a3 > 0x3B || ((1 << a3) & 0xC00000400000000) == 0) {
          return 1;
        }
        return 2;
    }
  }
  return result;
}

- (unint64_t)_characterType:(unsigned int)a3
{
  unsigned int v14 = a3;
  left = (char *)self->_signatureUniChar.__tree_.__pair1_.__value_.__left_;
  p_signatureUniChar = (uint64_t **)&self->_signatureUniChar;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = &self->_signatureUniChar.__tree_.__pair1_;
  do
  {
    unsigned int v8 = *((_DWORD *)left + 7);
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      uint64_t v10 = (char **)left;
    }
    else {
      uint64_t v10 = (char **)(left + 8);
    }
    if (v9) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)left;
    }
    left = *v10;
  }
  while (*v10);
  if (p_pair1 == &self->_signatureUniChar.__tree_.__pair1_ || HIDWORD(p_pair1[3].__value_.__left_) > a3)
  {
LABEL_12:
    int v11 = [(NSCharacterSet *)self->_lowercaseCharSet characterIsMember:(unsigned __int16)a3];
    if ([(NSCharacterSet *)self->_uppercaseCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 2u;
    }
    if ([(NSCharacterSet *)self->_digitCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 4u;
    }
    if ([(NSCharacterSet *)self->_startPunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 8u;
    }
    if ([(NSCharacterSet *)self->_middlePunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x10u;
    }
    if ([(NSCharacterSet *)self->_endPunctuationCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x20u;
    }
    if ([(NSCharacterSet *)self->_digitStartPunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x40u;
    }
    if ([(NSCharacterSet *)self->_digitEndPunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x80u;
    }
    if ([(NSCharacterSet *)self->_arithmeticOperatorCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x100u;
    }
    if ([(NSCharacterSet *)self->_dateTimeSeparatorCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x200u;
    }
    if ([(NSCharacterSet *)self->_dateTimeEndLetterCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x400u;
    }
    if ([(NSCharacterSet *)self->_numeralEndLetterCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x800u;
    }
    if ([(NSCharacterSet *)self->_lexiconSkipCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x1000u;
    }
    if ([(NSCharacterSet *)self->_containsDotCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x2000u;
    }
    if ([(NSCharacterSet *)self->_prefixCapitalizationExceptionCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x4000u;
    }
    if ([(NSCharacterSet *)self->_selfLoopPunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x8000u;
    }
    if ([(NSCharacterSet *)self->_emoticonTopCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x10000u;
    }
    if ([(NSCharacterSet *)self->_emoticonMiddleCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x20000u;
    }
    if ([(NSCharacterSet *)self->_emoticonBottomCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x40000u;
    }
    if ([(NSCharacterSet *)self->_emailAtCharSet characterIsMember:(unsigned __int16)a3]) {
      v11 |= 0x80000u;
    }
    if ([(NSCharacterSet *)self->_emailPunctuationCharSet characterIsMember:(unsigned __int16)a3])
    {
      v11 |= 0x100000u;
    }
    if ([(NSCharacterSet *)self->_urlPunctuationCharSet characterIsMember:(unsigned __int16)a3]) {
      int v12 = v11 | 0x200000;
    }
    else {
      int v12 = v11;
    }
    *((_DWORD *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_signatureUniChar, a3, &v14)+ 8) = v12;
  }
  return *((int *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_signatureUniChar, a3, &v14)+ 8);
}

- (NSCharacterSet)lowercaseCharSet
{
  return self->_lowercaseCharSet;
}

- (void)setLowercaseCharSet:(id)a3
{
}

- (NSCharacterSet)uppercaseCharSet
{
  return self->_uppercaseCharSet;
}

- (void)setUppercaseCharSet:(id)a3
{
}

- (NSCharacterSet)digitCharSet
{
  return self->_digitCharSet;
}

- (void)setDigitCharSet:(id)a3
{
}

- (NSCharacterSet)startPunctuationCharSet
{
  return self->_startPunctuationCharSet;
}

- (void)setStartPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)middlePunctuationCharSet
{
  return self->_middlePunctuationCharSet;
}

- (void)setMiddlePunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)endPunctuationCharSet
{
  return self->_endPunctuationCharSet;
}

- (void)setEndPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)digitStartPunctuationCharSet
{
  return self->_digitStartPunctuationCharSet;
}

- (void)setDigitStartPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)digitEndPunctuationCharSet
{
  return self->_digitEndPunctuationCharSet;
}

- (void)setDigitEndPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)arithmeticOperatorCharSet
{
  return self->_arithmeticOperatorCharSet;
}

- (void)setArithmeticOperatorCharSet:(id)a3
{
}

- (NSCharacterSet)dateTimeSeparatorCharSet
{
  return self->_dateTimeSeparatorCharSet;
}

- (void)setDateTimeSeparatorCharSet:(id)a3
{
}

- (NSCharacterSet)dateTimeEndLetterCharSet
{
  return self->_dateTimeEndLetterCharSet;
}

- (void)setDateTimeEndLetterCharSet:(id)a3
{
}

- (NSCharacterSet)numeralEndLetterCharSet
{
  return self->_numeralEndLetterCharSet;
}

- (void)setNumeralEndLetterCharSet:(id)a3
{
}

- (NSCharacterSet)lexiconSkipCharSet
{
  return self->_lexiconSkipCharSet;
}

- (void)setLexiconSkipCharSet:(id)a3
{
}

- (NSCharacterSet)containsDotCharSet
{
  return self->_containsDotCharSet;
}

- (void)setContainsDotCharSet:(id)a3
{
}

- (NSCharacterSet)prefixCapitalizationExceptionCharSet
{
  return self->_prefixCapitalizationExceptionCharSet;
}

- (void)setPrefixCapitalizationExceptionCharSet:(id)a3
{
}

- (NSCharacterSet)selfLoopPunctuationCharSet
{
  return self->_selfLoopPunctuationCharSet;
}

- (void)setSelfLoopPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)emoticonTopCharSet
{
  return self->_emoticonTopCharSet;
}

- (void)setEmoticonTopCharSet:(id)a3
{
}

- (NSCharacterSet)emoticonMiddleCharSet
{
  return self->_emoticonMiddleCharSet;
}

- (void)setEmoticonMiddleCharSet:(id)a3
{
}

- (NSCharacterSet)emoticonBottomCharSet
{
  return self->_emoticonBottomCharSet;
}

- (void)setEmoticonBottomCharSet:(id)a3
{
}

- (NSCharacterSet)emailAtCharSet
{
  return self->_emailAtCharSet;
}

- (void)setEmailAtCharSet:(id)a3
{
}

- (NSCharacterSet)emailPunctuationCharSet
{
  return self->_emailPunctuationCharSet;
}

- (void)setEmailPunctuationCharSet:(id)a3
{
}

- (NSCharacterSet)urlPunctuationCharSet
{
  return self->_urlPunctuationCharSet;
}

- (void)setUrlPunctuationCharSet:(id)a3
{
}

- (map<unsigned)strokeMaxPenalties
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)self[8].__tree_.__begin_node_;
  v5 = &self[8].__tree_.__pair1_;
  if (begin_node != &self[8].__tree_.__pair1_)
  {
    unint64_t v7 = 0;
    unsigned int v8 = &retstr->__tree_.__pair1_;
    while (1)
    {
      unsigned int left = begin_node[4].__value_.__left_;
      uint64_t v10 = p_pair1;
      if (v8 == p_pair1) {
        goto LABEL_9;
      }
      int v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v7;
      int v12 = p_pair1;
      if (v7)
      {
        do
        {
          uint64_t v10 = v11;
          int v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v11[1].__value_.__left_;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v12[2].__value_.__left_;
          BOOL v13 = v10->__value_.__left_ == v12;
          int v12 = v10;
        }
        while (v13);
      }
      if (LODWORD(v10[4].__value_.__left_) < left)
      {
LABEL_9:
        if (v7) {
          unsigned int v14 = v10;
        }
        else {
          unsigned int v14 = p_pair1;
        }
        if (v7) {
          v15 = (uint64_t **)&v10[1];
        }
        else {
          v15 = (uint64_t **)p_pair1;
        }
        if (!*v15)
        {
LABEL_25:
          v18 = (uint64_t *)operator new(0x30uLL);
          *((_OWORD *)v18 + 2) = *(_OWORD *)&begin_node[4].__value_.__left_;
          self = (map<unsigned int, unsigned long, std::less<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long>>> *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at((uint64_t **)retstr, (uint64_t)v14, v15, v18);
          unsigned int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)retstr->__tree_.__begin_node_;
        }
      }
      else
      {
        v15 = (uint64_t **)p_pair1;
        unsigned int v14 = p_pair1;
        if (!v7) {
          goto LABEL_25;
        }
        v16 = v7;
        while (1)
        {
          while (1)
          {
            unsigned int v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v16;
            unsigned int v17 = *((_DWORD *)v16 + 8);
            if (v17 <= left) {
              break;
            }
            v16 = (uint64_t *)v14->__value_.__left_;
            v15 = (uint64_t **)v14;
            if (!v14->__value_.__left_) {
              goto LABEL_25;
            }
          }
          if (v17 >= left) {
            break;
          }
          v16 = (uint64_t *)v14[1].__value_.__left_;
          if (!v16)
          {
            v15 = (uint64_t **)&v14[1];
            goto LABEL_25;
          }
        }
      }
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[1].__value_.__left_;
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v19->__value_.__left_;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v13 = v20->__value_.__left_ == begin_node;
          begin_node = v20;
        }
        while (!v13);
      }
      if (v20 == v5) {
        return self;
      }
      unint64_t v7 = (uint64_t *)p_pair1->__value_.__left_;
      begin_node = v20;
    }
  }
  return self;
}

- (void)setStrokeMaxPenalties:(map<unsigned)int
{
  p_strokeMaxPenalties = (uint64_t **)&self->_strokeMaxPenalties;
  if (&self->_strokeMaxPenalties == a3) {
    return;
  }
  p_pair1 = &a3->__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)a3->__tree_.__begin_node_;
  if (self->_strokeMaxPenalties.__tree_.__pair3_.__value_)
  {
    unsigned int v8 = &self->_strokeMaxPenalties.__tree_.__pair1_;
    unsigned int left = self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_;
    BOOL v9 = self->_strokeMaxPenalties.__tree_.__begin_node_;
    self->_strokeMaxPenalties.__tree_.__begin_node_ = &self->_strokeMaxPenalties.__tree_.__pair1_;
    left[2] = 0;
    self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_ = 0;
    self->_strokeMaxPenalties.__tree_.__pair3_.__value_ = 0;
    if (v9[1]) {
      uint64_t v10 = v9[1];
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    if (v10)
    {
      int v11 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next(v10);
      if (begin_node == p_pair1)
      {
        BOOL v13 = (void *)v10;
      }
      else
      {
        int v12 = begin_node;
        do
        {
          BOOL v13 = v11;
          unsigned int v14 = v12[4].__value_.__left_;
          *(_DWORD *)(v10 + 32) = v14;
          *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)(v10 + 40) = v12[5];
          v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v8->__value_.__left_;
          v16 = &self->_strokeMaxPenalties.__tree_.__pair1_;
          unsigned int v17 = (uint64_t **)&self->_strokeMaxPenalties.__tree_.__pair1_;
          if (v8->__value_.__left_)
          {
            do
            {
              while (1)
              {
                v16 = v15;
                if (v14 >= LODWORD(v15[4].__value_.__left_)) {
                  break;
                }
                v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v15->__value_.__left_;
                unsigned int v17 = (uint64_t **)v16;
                if (!v16->__value_.__left_) {
                  goto LABEL_15;
                }
              }
              v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v15[1].__value_.__left_;
            }
            while (v15);
            unsigned int v17 = (uint64_t **)&v16[1];
          }
LABEL_15:
          std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at(p_strokeMaxPenalties, (uint64_t)v16, v17, (uint64_t *)v10);
          if (v11) {
            int v11 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
          }
          else {
            int v11 = 0;
          }
          v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v12[1].__value_.__left_;
          if (v18)
          {
            do
            {
              begin_node = v18;
              v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v18->__value_.__left_;
            }
            while (v18);
          }
          else
          {
            do
            {
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v12[2].__value_.__left_;
              BOOL v19 = begin_node->__value_.__left_ == v12;
              int v12 = begin_node;
            }
            while (!v19);
          }
          if (!v13) {
            break;
          }
          uint64_t v10 = (uint64_t)v13;
          int v12 = begin_node;
        }
        while (begin_node != p_pair1);
      }
      std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v13);
      if (!v11) {
        goto LABEL_33;
      }
      for (i = (void *)v11[2]; i; i = (void *)i[2])
        int v11 = i;
      v20 = v11;
    }
    else
    {
      v20 = 0;
    }
    std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v20);
  }
LABEL_33:
  if (begin_node != p_pair1)
  {
    v22 = &self->_strokeMaxPenalties.__tree_.__pair1_;
    do
    {
      v23 = operator new(0x30uLL);
      v23[2] = *(_OWORD *)&begin_node[4].__value_.__left_;
      v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v22->__value_.__left_;
      v25 = v22;
      v26 = (uint64_t **)v22;
      if (v22->__value_.__left_)
      {
        do
        {
          while (1)
          {
            v25 = v24;
            if (*((_DWORD *)v23 + 8) >= LODWORD(v24[4].__value_.__left_)) {
              break;
            }
            v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v24->__value_.__left_;
            v26 = (uint64_t **)v25;
            if (!v25->__value_.__left_) {
              goto LABEL_41;
            }
          }
          v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v24[1].__value_.__left_;
        }
        while (v24);
        v26 = (uint64_t **)&v25[1];
      }
LABEL_41:
      std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at(p_strokeMaxPenalties, (uint64_t)v25, v26, (uint64_t *)v23);
      v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[1].__value_.__left_;
      if (v27)
      {
        do
        {
          v28 = v27;
          v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)v27->__value_.__left_;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v19 = v28->__value_.__left_ == begin_node;
          begin_node = v28;
        }
        while (!v19);
      }
      begin_node = v28;
    }
    while (v28 != p_pair1);
  }
}

- (map<unsigned)signatureUniChar
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)self[9].__tree_.__begin_node_;
  v5 = &self[9].__tree_.__pair1_;
  if (begin_node != &self[9].__tree_.__pair1_)
  {
    unint64_t v7 = 0;
    unsigned int v8 = &retstr->__tree_.__pair1_;
    while (1)
    {
      uint64_t v9 = *(uint64_t *)((char *)&begin_node[3].__value_.__left_ + 4);
      uint64_t v10 = p_pair1;
      if (v8 == p_pair1) {
        goto LABEL_9;
      }
      unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v7;
      int v12 = p_pair1;
      if (v7)
      {
        do
        {
          uint64_t v10 = left;
          unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)left[1].__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v12[2].__value_.__left_;
          BOOL v13 = v10->__value_.__left_ == v12;
          int v12 = v10;
        }
        while (v13);
      }
      unsigned int left_high = HIDWORD(begin_node[3].__value_.__left_);
      if (HIDWORD(v10[3].__value_.__left_) < left_high)
      {
LABEL_9:
        if (v7) {
          v15 = v10;
        }
        else {
          v15 = p_pair1;
        }
        if (v7) {
          v16 = (uint64_t **)&v10[1];
        }
        else {
          v16 = (uint64_t **)p_pair1;
        }
        if (!*v16)
        {
LABEL_25:
          BOOL v19 = (uint64_t *)operator new(0x28uLL);
          *(uint64_t *)((char *)v19 + 28) = v9;
          self = (map<unsigned int, int, std::less<unsigned int>, std::allocator<std::pair<const unsigned int, int>>> *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at((uint64_t **)retstr, (uint64_t)v15, v16, v19);
          unsigned int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)retstr->__tree_.__begin_node_;
        }
      }
      else
      {
        v16 = (uint64_t **)p_pair1;
        v15 = p_pair1;
        if (!v7) {
          goto LABEL_25;
        }
        unsigned int v17 = v7;
        while (1)
        {
          while (1)
          {
            v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v17;
            unsigned int v18 = *((_DWORD *)v17 + 7);
            if (v18 <= left_high) {
              break;
            }
            unsigned int v17 = (uint64_t *)v15->__value_.__left_;
            v16 = (uint64_t **)v15;
            if (!v15->__value_.__left_) {
              goto LABEL_25;
            }
          }
          if (v18 >= left_high) {
            break;
          }
          unsigned int v17 = (uint64_t *)v15[1].__value_.__left_;
          if (!v17)
          {
            v16 = (uint64_t **)&v15[1];
            goto LABEL_25;
          }
        }
      }
      v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)begin_node[1].__value_.__left_;
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v20->__value_.__left_;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v13 = v21->__value_.__left_ == begin_node;
          begin_node = v21;
        }
        while (!v13);
      }
      if (v21 == v5) {
        return self;
      }
      unint64_t v7 = (uint64_t *)p_pair1->__value_.__left_;
      begin_node = v21;
    }
  }
  return self;
}

- (void)setSignatureUniChar:(map<unsigned)int
{
  p_signatureUniChar = (uint64_t **)&self->_signatureUniChar;
  if (&self->_signatureUniChar == a3) {
    return;
  }
  p_pair1 = &a3->__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)a3->__tree_.__begin_node_;
  if (self->_signatureUniChar.__tree_.__pair3_.__value_)
  {
    unsigned int v8 = &self->_signatureUniChar.__tree_.__pair1_;
    unsigned int left = self->_signatureUniChar.__tree_.__pair1_.__value_.__left_;
    uint64_t v9 = self->_signatureUniChar.__tree_.__begin_node_;
    self->_signatureUniChar.__tree_.__begin_node_ = &self->_signatureUniChar.__tree_.__pair1_;
    left[2] = 0;
    self->_signatureUniChar.__tree_.__pair1_.__value_.__left_ = 0;
    self->_signatureUniChar.__tree_.__pair3_.__value_ = 0;
    if (v9[1]) {
      uint64_t v10 = v9[1];
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    if (v10)
    {
      int v11 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next(v10);
      if (begin_node == p_pair1)
      {
        BOOL v13 = (void *)v10;
      }
      else
      {
        int v12 = begin_node;
        do
        {
          BOOL v13 = v11;
          unsigned int left_high = HIDWORD(v12[3].__value_.__left_);
          *(_DWORD *)(v10 + 28) = left_high;
          *(_DWORD *)(v10 + 32) = v12[4].__value_.__left_;
          v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v8->__value_.__left_;
          v16 = &self->_signatureUniChar.__tree_.__pair1_;
          unsigned int v17 = (uint64_t **)&self->_signatureUniChar.__tree_.__pair1_;
          if (v8->__value_.__left_)
          {
            do
            {
              while (1)
              {
                v16 = v15;
                if (left_high >= HIDWORD(v15[3].__value_.__left_)) {
                  break;
                }
                v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v15->__value_.__left_;
                unsigned int v17 = (uint64_t **)v16;
                if (!v16->__value_.__left_) {
                  goto LABEL_15;
                }
              }
              v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v15[1].__value_.__left_;
            }
            while (v15);
            unsigned int v17 = (uint64_t **)&v16[1];
          }
LABEL_15:
          std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at(p_signatureUniChar, (uint64_t)v16, v17, (uint64_t *)v10);
          if (v11) {
            int v11 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
          }
          else {
            int v11 = 0;
          }
          unsigned int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v12[1].__value_.__left_;
          if (v18)
          {
            do
            {
              begin_node = v18;
              unsigned int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v18->__value_.__left_;
            }
            while (v18);
          }
          else
          {
            do
            {
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v12[2].__value_.__left_;
              BOOL v19 = begin_node->__value_.__left_ == v12;
              int v12 = begin_node;
            }
            while (!v19);
          }
          if (!v13) {
            break;
          }
          uint64_t v10 = (uint64_t)v13;
          int v12 = begin_node;
        }
        while (begin_node != p_pair1);
      }
      std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v13);
      if (!v11) {
        goto LABEL_33;
      }
      for (i = (void *)v11[2]; i; i = (void *)i[2])
        int v11 = i;
      v20 = v11;
    }
    else
    {
      v20 = 0;
    }
    std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v20);
  }
LABEL_33:
  if (begin_node != p_pair1)
  {
    v22 = &self->_signatureUniChar.__tree_.__pair1_;
    do
    {
      uint64_t v23 = *(uint64_t *)((char *)&begin_node[3].__value_.__left_ + 4);
      v24 = (uint64_t *)operator new(0x28uLL);
      *(uint64_t *)((char *)v24 + 28) = v23;
      v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v22->__value_.__left_;
      v26 = v22;
      v27 = (uint64_t **)v22;
      if (v22->__value_.__left_)
      {
        do
        {
          while (1)
          {
            v26 = v25;
            if (HIDWORD(v25[3].__value_.__left_) <= v23) {
              break;
            }
            v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v25->__value_.__left_;
            v27 = (uint64_t **)v26;
            if (!v26->__value_.__left_) {
              goto LABEL_41;
            }
          }
          v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v25[1].__value_.__left_;
        }
        while (v25);
        v27 = (uint64_t **)&v26[1];
      }
LABEL_41:
      std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at(p_signatureUniChar, (uint64_t)v26, v27, v24);
      v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)begin_node[1].__value_.__left_;
      if (v28)
      {
        do
        {
          v29 = v28;
          v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)v28->__value_.__left_;
        }
        while (v28);
      }
      else
      {
        do
        {
          v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, int>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v19 = v29->__value_.__left_ == begin_node;
          begin_node = v29;
        }
        while (!v19);
      }
      begin_node = v29;
    }
    while (v29 != p_pair1);
  }
}

- (OS_dispatch_queue)_charSetRulesQueue
{
  return self->__charSetRulesQueue;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy((void *)self->_signatureUniChar.__tree_.__pair1_.__value_.__left_);
  unsigned int left = self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_;
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(left);
}

- (id).cxx_construct
{
  *((void *)self + 25) = 0;
  *((void *)self + 24) = (char *)self + 200;
  *((void *)self + 29) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = (char *)self + 224;
  return self;
}

@end
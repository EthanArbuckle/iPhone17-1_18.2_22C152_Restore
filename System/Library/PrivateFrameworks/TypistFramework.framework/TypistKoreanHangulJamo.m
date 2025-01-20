@interface TypistKoreanHangulJamo
+ (id)leadingConsonants;
+ (id)trailingConsonants;
+ (id)vowels;
- (BOOL)_isConsonantVariant:(unsigned __int16)a3;
- (BOOL)_isVerticalVowel:(unsigned __int16)a3;
- (BOOL)isConsonantVariant;
- (BOOL)isVerticalVowel;
- (TypistKoreanHangulJamo)initWithJamo:(unsigned __int16)a3 position:(unint64_t)a4;
- (id)description;
- (int)_getJamoType:(unsigned __int16)a3 withOrderInSyllable:(unint64_t)a4;
- (int)hangulJamoPosition;
- (unsigned)jamo;
@end

@implementation TypistKoreanHangulJamo

- (TypistKoreanHangulJamo)initWithJamo:(unsigned __int16)a3 position:(unint64_t)a4
{
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKoreanHangulJamo;
  v6 = [(TypistKoreanHangulJamo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_jamo = v5;
    v6->_hangulJamoPosition = [(TypistKoreanHangulJamo *)v6 _getJamoType:v5 withOrderInSyllable:a4];
    v7->_isConsonantVariant = [(TypistKoreanHangulJamo *)v7 _isConsonantVariant:v5];
    v7->_isVerticalVowel = [(TypistKoreanHangulJamo *)v7 _isVerticalVowel:v5];
  }
  return v7;
}

- (int)_getJamoType:(unsigned __int16)a3 withOrderInSyllable:(unint64_t)a4
{
  uint64_t v5 = a3;
  v6 = [MEMORY[0x263F08708] hangulLeadingConsonants];
  char v7 = [v6 characterIsMember:v5];

  if (!a4 && (v7 & 1) != 0) {
    return 0;
  }
  objc_super v9 = [MEMORY[0x263F08708] hangulTrailingConsonants];
  char v10 = [v9 characterIsMember:v5];

  if (a4 && (v10 & 1) != 0) {
    return 1;
  }
  v11 = [MEMORY[0x263F08708] hangulHorizontalVowels];
  char v12 = [v11 characterIsMember:v5];

  if (v12) {
    return 2;
  }
  v13 = [MEMORY[0x263F08708] hangulVerticalVowels];
  char v14 = [v13 characterIsMember:v5];

  if (v14) {
    return 3;
  }
  v15 = [MEMORY[0x263F08708] hangulMixedVowels];
  int v16 = [v15 characterIsMember:v5];

  if (v16) {
    return 4;
  }
  else {
    return 5;
  }
}

- (unsigned)jamo
{
  return self->_jamo;
}

- (int)hangulJamoPosition
{
  return self->_hangulJamoPosition;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%C", self->_jamo);
}

- (BOOL)_isConsonantVariant:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [MEMORY[0x263F08708] hangulConsonantVariants];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)_isVerticalVowel:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [MEMORY[0x263F08708] hangulVerticalVowels];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)isConsonantVariant
{
  return self->_isConsonantVariant;
}

- (BOOL)isVerticalVowel
{
  return self->_isVerticalVowel;
}

+ (id)leadingConsonants
{
  if (leadingConsonants_leadingConsonantsToken != -1) {
    dispatch_once(&leadingConsonants_leadingConsonantsToken, &__block_literal_global_12);
  }
  v2 = (void *)leadingConsonants_leadingConsonants;
  return v2;
}

void __43__TypistKoreanHangulJamo_leadingConsonants__block_invoke()
{
  v0 = (void *)leadingConsonants_leadingConsonants;
  leadingConsonants_leadingConsonants = (uint64_t)&unk_270C6F948;
}

+ (id)vowels
{
  if (vowels_vowelToken != -1) {
    dispatch_once(&vowels_vowelToken, &__block_literal_global_127);
  }
  v2 = (void *)vowels_hangulVowels;
  return v2;
}

void __32__TypistKoreanHangulJamo_vowels__block_invoke()
{
  v0 = (void *)vowels_hangulVowels;
  vowels_hangulVowels = (uint64_t)&unk_270C6F960;
}

+ (id)trailingConsonants
{
  if (trailingConsonants_trailingConsonantsToken != -1) {
    dispatch_once(&trailingConsonants_trailingConsonantsToken, &__block_literal_global_195);
  }
  v2 = (void *)trailingConsonants_trailingConsonants;
  return v2;
}

void __44__TypistKoreanHangulJamo_trailingConsonants__block_invoke()
{
  v0 = (void *)trailingConsonants_trailingConsonants;
  trailingConsonants_trailingConsonants = (uint64_t)&unk_270C6F978;
}

@end
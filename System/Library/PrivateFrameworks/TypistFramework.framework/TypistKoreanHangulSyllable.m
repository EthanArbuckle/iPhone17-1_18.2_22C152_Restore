@interface TypistKoreanHangulSyllable
+ (BOOL)isKoreanSyllable:(unsigned __int16)a3;
+ (id)decomposeSyllableForScribble:(unsigned __int16)a3;
- (BOOL)_hasConsonantVariants:(id)a3;
- (BOOL)hasConsonantVariants;
- (TypistKoreanHangulSyllable)initWithSyllable:(unsigned __int16)a3;
- (id)jamos;
- (int)_determineSyllableStructure:(unint64_t)a3 vowelPositionType:(int)a4;
- (int)syllableStructure;
- (unsigned)syllable;
- (void)setSyllable:(unsigned __int16)a3;
@end

@implementation TypistKoreanHangulSyllable

- (TypistKoreanHangulSyllable)initWithSyllable:(unsigned __int16)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TypistKoreanHangulSyllable;
  v4 = [(TypistKoreanHangulSyllable *)&v13 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    jamosInSyllable = v4->jamosInSyllable;
    v4->jamosInSyllable = v5;

    v4->_syllable = a3;
    v7 = +[TypistKoreanHangulSyllable decomposeSyllableForScribble:[(TypistKoreanHangulSyllable *)v4 syllable]];
    if ([v7 length])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = -[TypistKoreanHangulJamo initWithJamo:position:]([TypistKoreanHangulJamo alloc], "initWithJamo:position:", [v7 characterAtIndex:v8], v8);
        [(NSMutableArray *)v4->jamosInSyllable addObject:v9];

        ++v8;
      }
      while ([v7 length] > v8);
    }
    uint64_t v10 = [(NSMutableArray *)v4->jamosInSyllable count];
    v11 = [(NSMutableArray *)v4->jamosInSyllable objectAtIndexedSubscript:1];
    v4->_syllableStructure = -[TypistKoreanHangulSyllable _determineSyllableStructure:vowelPositionType:](v4, "_determineSyllableStructure:vowelPositionType:", v10, [v11 hangulJamoPosition]);

    v4->_hasConsonantVariants = [(TypistKoreanHangulSyllable *)v4 _hasConsonantVariants:v4->jamosInSyllable];
  }
  return v4;
}

- (id)jamos
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->jamosInSyllable];
}

- (int)syllableStructure
{
  return self->_syllableStructure;
}

- (unsigned)syllable
{
  return self->_syllable;
}

- (BOOL)hasConsonantVariants
{
  return self->_hasConsonantVariants;
}

- (BOOL)_hasConsonantVariants:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    char v5 = 0;
    char v6 = 0;
    do
    {
      v7 = [v3 objectAtIndexedSubscript:v4];
      char v8 = [v7 isConsonantVariant];

      v6 |= v8;
      v9 = [v3 objectAtIndexedSubscript:v4];
      char v10 = [v9 isVerticalVowel];

      v5 |= v10;
      ++v4;
    }
    while (v4 < [v3 count]);
    char v11 = v6 & v5;
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

+ (id)decomposeSyllableForScribble:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  char v5 = objc_opt_new();
  if ([a1 isKoreanSyllable:v3])
  {
    int v6 = v3 - 44032;
    int v7 = ((int)v3 - 44032) / 588;
    uint64_t v8 = v7;
    uint64_t v9 = (int)(((18725 * (__int16)(v6 - 588 * v7)) >> 19) + ((18725 * (__int16)(v6 - 588 * v7)) >> 31));
    uint64_t v10 = v6 % 28;
    char v11 = +[TypistKoreanHangulJamo leadingConsonants];
    v12 = [v11 objectAtIndexedSubscript:v8];

    objc_super v13 = +[TypistKoreanHangulJamo vowels];
    v14 = [v13 objectAtIndexedSubscript:v9];

    v15 = +[TypistKoreanHangulJamo trailingConsonants];
    v16 = [v15 objectAtIndexedSubscript:v10];

    [v5 appendString:v12];
    [v5 appendString:v14];
    if (v16) {
      [v5 appendString:v16];
    }
    id v17 = v5;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (int)_determineSyllableStructure:(unint64_t)a3 vowelPositionType:(int)a4
{
  if (a3 == 3)
  {
    int v4 = a4 - 2;
    if ((a4 - 2) <= 2)
    {
      char v5 = &unk_26041A9CC;
      return v5[v4];
    }
  }
  else if (a3 == 2)
  {
    int v4 = a4 - 2;
    if ((a4 - 2) < 3)
    {
      char v5 = &unk_26041A9C0;
      return v5[v4];
    }
  }
  return 6;
}

+ (BOOL)isKoreanSyllable:(unsigned __int16)a3
{
  return (unsigned __int16)((unsigned __int16)(a3 + 21504) >> 2) < 0xAE9u;
}

- (void)setSyllable:(unsigned __int16)a3
{
  self->_syllable = a3;
}

- (void).cxx_destruct
{
}

@end
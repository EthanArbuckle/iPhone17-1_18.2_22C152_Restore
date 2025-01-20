@interface TITesterUtils
+ (id)decomposeDiphthong:(unsigned __int16)a3;
+ (id)decomposeDoublePatchim:(unsigned __int16)a3;
+ (id)decomposeHangul:(unsigned __int16)a3;
+ (id)decomposeHangulSequence:(id)a3;
@end

@implementation TITesterUtils

+ (id)decomposeHangulSequence:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  uint64_t v5 = [v3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = +[TITesterUtils decomposeHangul:](TITesterUtils, "decomposeHangul:", [v3 characterAtIndex:i]);
      [v4 appendString:v8];
    }
  }

  return v4;
}

+ (id)decomposeHangul:(unsigned __int16)a3
{
  unsigned __int16 v14 = a3;
  if ((a3 - 12623) <= 0x14)
  {
    uint64_t v3 = +[TITesterUtils decomposeDiphthong:](TITesterUtils, "decomposeDiphthong:");
LABEL_5:
    v4 = (void *)v3;
    goto LABEL_9;
  }
  if ((unsigned __int16)(a3 + 10332) <= 0xD45Bu)
  {
    uint64_t v3 = [NSString stringWithCharacters:&v14 length:1];
    goto LABEL_5;
  }
  uint64_t v5 = (unsigned __int16)(a3 + 21504) / 0x24Cu;
  unsigned __int16 v6 = (unsigned __int16)(a3 + 21504) % 0x24Cu;
  uint64_t v7 = v6 / 0x1Cu;
  unsigned int v8 = v6 % 0x1Cu;
  v4 = [MEMORY[0x263F089D8] string];
  __int16 v13 = [@"ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ" characterAtIndex:v5];
  v9 = [NSString stringWithCharacters:&v13 length:1];
  [v4 appendString:v9];

  v10 = +[TITesterUtils decomposeDiphthong:](TITesterUtils, "decomposeDiphthong:", [@"ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ" characterAtIndex:v7]);
  [v4 appendString:v10];
  if (v8)
  {
    v11 = +[TITesterUtils decomposeDoublePatchim:](TITesterUtils, "decomposeDoublePatchim:", [@"ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ" characterAtIndex:v8 - 1]);
    [v4 appendString:v11];
  }
LABEL_9:
  return v4;
}

+ (id)decomposeDoublePatchim:(unsigned __int16)a3
{
  unsigned __int16 v8 = a3;
  uint64_t v3 = [NSString stringWithCharacters:&v8 length:1];
  uint64_t v4 = [@"ㄳㄵㄶㄺㄻㄼㄽㄾㄿㅀㅄ" rangeOfString:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [&unk_26F2C9DC8 objectAtIndex:v4];
  }
  unsigned __int16 v6 = v5;

  return v6;
}

+ (id)decomposeDiphthong:(unsigned __int16)a3
{
  unsigned __int16 v8 = a3;
  uint64_t v3 = [NSString stringWithCharacters:&v8 length:1];
  uint64_t v4 = [@"ㅘㅙㅚㅝㅞㅟㅢ" rangeOfString:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [&unk_26F2C9DB0 objectAtIndex:v4];
  }
  unsigned __int16 v6 = v5;

  return v6;
}

@end
@interface TCFontUtils
+ (id)stringByFixingString:(id)a3 latinFontFamilyName:(id)a4 symbolFontFamilyName:(id)a5;
@end

@implementation TCFontUtils

+ (id)stringByFixingString:(id)a3 latinFontFamilyName:(id)a4 symbolFontFamilyName:(id)a5
{
  id v7 = a3;
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  v27 = v8;
  v28 = v7;
  uint64_t v10 = [v7 length];
  std::vector<unsigned short>::vector(__p, v10);
  objc_msgSend(v7, "getCharacters:range:", __p[0], 0, v10);
  if (![(NSString *)v9 length])
  {
    v11 = v8;

    v9 = v11;
  }
  v12 = TCCodePointMapperForFontFamilyName(v8);
  if (v12)
  {
    int IsPi = 0;
    if (v10)
    {
LABEL_5:
      uint64_t v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v17 = 0;
      char v18 = 0;
      v19 = (unsigned __int16 *)__p[0];
      while (1)
      {
        uint64_t v20 = v19[v14];
        if ((v20 - 32) <= 0xDF)
        {
          if (v12)
          {
            int v21 = v12(v20);
            v15 |= v21 != 0;
            if (v21) {
              LOWORD(v20) = v21;
            }
          }
          else
          {
            v15 |= IsPi;
            if (IsPi) {
              LOWORD(v20) = v20 - 4096;
            }
          }
          goto LABEL_27;
        }
        if ((unsigned __int16)(v20 + 4064) <= 0xDFu)
        {
          if (v18)
          {
            if (v17) {
              goto LABEL_20;
            }
            if ((v16 & 1) == 0) {
              goto LABEL_26;
            }
          }
          else
          {
            v17 = TCCodePointMapperForFontFamilyName(v9);
            if (v17)
            {
LABEL_20:
              int v22 = v17((unsigned __int16)(v20 + 4096));
              v15 |= v22 != 0;
              if (v22) {
                LOWORD(v20) = v22;
              }
              char v18 = 1;
              goto LABEL_27;
            }
            if ((TCFontFamilyHasCodePointsInPiRange(v9) & 1) == 0 && (TCFontFamilyIsPi(v9) & 1) == 0)
            {
LABEL_26:
              v17 = 0;
              char v16 = 0;
              LOWORD(v20) = v20 + 4096;
              char v18 = 1;
              int v15 = 1;
              goto LABEL_27;
            }
          }
          v17 = 0;
          char v18 = 1;
          char v16 = 1;
        }
LABEL_27:
        v19 = (unsigned __int16 *)__p[0];
        *((_WORD *)__p[0] + v14++) = v20;
        if (v10 == v14) {
          goto LABEL_31;
        }
      }
    }
  }
  else
  {
    int IsPi = TCFontFamilyIsPi(v8);
    if (v10) {
      goto LABEL_5;
    }
  }
  LOBYTE(v15) = 0;
LABEL_31:
  char v23 = v15 | objc_msgSend(NSString, "tc_fixUnpairedSurrogateCharactersInBuffer:", __p);
  id v24 = v28;
  v25 = v24;
  if (v23)
  {
    v25 = [NSString stringWithCharacters:__p[0] length:v10];
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v25;
}

@end
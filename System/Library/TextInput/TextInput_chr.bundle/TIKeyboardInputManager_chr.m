@interface TIKeyboardInputManager_chr
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)doesComposeText;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManager_chr

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (BOOL)doesComposeText
{
  return [(TIKeyboardInputManager_chr *)self inHardwareKeyboardMode] ^ 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TIKeyboardInputManager_chr *)self inHardwareKeyboardMode])
  {
    id v5 = v4;
    goto LABEL_48;
  }
  unint64_t v6 = [v4 length];
  uint64_t v7 = MEMORY[0x270FA5388]();
  v9 = (char *)&v22 - v8;
  if (v7)
  {
    uint64_t v22 = (uint64_t)&v22;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    int v12 = 0;
    while (1)
    {
      int v13 = objc_msgSend(v4, "characterAtIndex:", v11, v22, v23);
      if (v6 - 1 > v11) {
        break;
      }
LABEL_44:
      unsigned int v19 = v10 + 1;
      *(_WORD *)&v9[2 * v10] = v13;
      unint64_t v11 = ++v12;
      ++v10;
      if (v6 <= v12)
      {
        uint64_t v20 = v19;
        goto LABEL_47;
      }
    }
    int v14 = [v4 characterAtIndex:v12 + 1];
    if (v13 <= 5067)
    {
      if (v13 > 5048)
      {
        switch(v13)
        {
          case 5049:
            int v15 = 1;
            unsigned int v16 = 4;
            goto LABEL_37;
          case 5054:
            int v15 = 1;
            unsigned int v16 = 5;
            goto LABEL_37;
          case 5062:
            int v15 = 1;
            unsigned int v16 = 6;
            goto LABEL_37;
        }
      }
      else
      {
        switch(v13)
        {
          case 5030:
            int v15 = 1;
            unsigned int v16 = 1;
            goto LABEL_37;
          case 5037:
            int v15 = 1;
            unsigned int v16 = 2;
            goto LABEL_37;
          case 5043:
            int v15 = 1;
            unsigned int v16 = 3;
            goto LABEL_37;
        }
      }
    }
    else if (v13 <= 5084)
    {
      switch(v13)
      {
        case 5068:
          int v15 = 1;
          unsigned int v16 = 7;
          goto LABEL_37;
        case 5075:
          int v15 = 1;
          unsigned int v16 = 8;
          goto LABEL_37;
        case 5076:
          int v15 = 1;
          unsigned int v16 = 9;
          goto LABEL_37;
      }
    }
    else if (v13 > 5096)
    {
      if (v13 == 5097)
      {
        int v15 = 1;
        unsigned int v16 = 12;
        goto LABEL_37;
      }
      if (v13 == 5103)
      {
        int v15 = 1;
        unsigned int v16 = 13;
        goto LABEL_37;
      }
    }
    else
    {
      if (v13 == 5085)
      {
        int v15 = 1;
        unsigned int v16 = 10;
        goto LABEL_37;
      }
      if (v13 == 5091)
      {
        int v15 = 1;
        unsigned int v16 = 11;
LABEL_37:
        int v17 = 0;
        int v18 = v14 - 5024;
        if ((v14 - 5024) >= 6) {
          int v18 = -1;
        }
        if (v15 && v18 != -1) {
          int v17 = cherokee_syllables[6 * v16 + v18];
        }
        if (v17)
        {
          ++v12;
          LOWORD(v13) = v17;
        }
        goto LABEL_44;
      }
    }
    int v15 = 0;
    unsigned int v16 = -1;
    goto LABEL_37;
  }
  uint64_t v20 = 0;
LABEL_47:
  id v5 = [NSString stringWithCharacters:v9 length:v20];
LABEL_48:

  return v5;
}

- (id)externalStringToInternal:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TIKeyboardInputManager_chr *)self inHardwareKeyboardMode])
  {
    id v5 = v4;
  }
  else
  {
    [v4 length];
    MEMORY[0x270FA5388]();
    uint64_t v7 = (char *)v15 - v6;
    if ([v4 length])
    {
      unint64_t v8 = 0;
      int v9 = 0;
      do
      {
        int v10 = [v4 characterAtIndex:v8];
        int v11 = 1;
        uint64_t v12 = 1;
        switch(v10)
        {
          case 5032:
            goto LABEL_79;
          case 5033:
            uint64_t v12 = 2;
            goto LABEL_10;
          case 5034:
            uint64_t v12 = 3;
            goto LABEL_10;
          case 5035:
            uint64_t v12 = 4;
            goto LABEL_10;
          case 5036:
            uint64_t v12 = 5;
LABEL_10:
            int v11 = 1;
            goto LABEL_79;
          case 5038:
            uint64_t v12 = 1;
            goto LABEL_16;
          case 5039:
            int v11 = 2;
            uint64_t v12 = 2;
            goto LABEL_79;
          case 5040:
            uint64_t v12 = 3;
            goto LABEL_16;
          case 5041:
            uint64_t v12 = 4;
            goto LABEL_16;
          case 5042:
            uint64_t v12 = 5;
LABEL_16:
            int v11 = 2;
            goto LABEL_79;
          case 5044:
            uint64_t v12 = 1;
            goto LABEL_22;
          case 5045:
            uint64_t v12 = 2;
            goto LABEL_22;
          case 5046:
            int v11 = 3;
            uint64_t v12 = 3;
            goto LABEL_79;
          case 5047:
            uint64_t v12 = 4;
            goto LABEL_22;
          case 5048:
            uint64_t v12 = 5;
LABEL_22:
            int v11 = 3;
            goto LABEL_79;
          case 5050:
            uint64_t v12 = 1;
            goto LABEL_26;
          case 5051:
            uint64_t v12 = 2;
            goto LABEL_26;
          case 5052:
            uint64_t v12 = 3;
LABEL_26:
            int v11 = 4;
            goto LABEL_79;
          case 5053:
            int v11 = 4;
            uint64_t v12 = 4;
            goto LABEL_79;
          case 5057:
            uint64_t v12 = 1;
            goto LABEL_32;
          case 5058:
            uint64_t v12 = 2;
            goto LABEL_32;
          case 5059:
            uint64_t v12 = 3;
            goto LABEL_32;
          case 5060:
            uint64_t v12 = 4;
LABEL_32:
            int v11 = 5;
            goto LABEL_79;
          case 5061:
            int v11 = 5;
            uint64_t v12 = 5;
            goto LABEL_79;
          case 5063:
            uint64_t v12 = 1;
            goto LABEL_39;
          case 5064:
            uint64_t v12 = 2;
            goto LABEL_39;
          case 5065:
            uint64_t v12 = 3;
            goto LABEL_39;
          case 5066:
            uint64_t v12 = 4;
            goto LABEL_39;
          case 5067:
            uint64_t v12 = 5;
LABEL_39:
            int v11 = 6;
            goto LABEL_79;
          case 5070:
            uint64_t v12 = 1;
            goto LABEL_45;
          case 5071:
            uint64_t v12 = 2;
            goto LABEL_45;
          case 5072:
            uint64_t v12 = 3;
            goto LABEL_45;
          case 5073:
            uint64_t v12 = 4;
            goto LABEL_45;
          case 5074:
            uint64_t v12 = 5;
LABEL_45:
            int v11 = 7;
            goto LABEL_79;
          case 5077:
            uint64_t v12 = 1;
            goto LABEL_54;
          case 5078:
            uint64_t v12 = 1;
            goto LABEL_50;
          case 5079:
            uint64_t v12 = 2;
            goto LABEL_54;
          case 5080:
            uint64_t v12 = 2;
LABEL_50:
            int v11 = 9;
            goto LABEL_79;
          case 5081:
            uint64_t v12 = 3;
            goto LABEL_54;
          case 5082:
            uint64_t v12 = 4;
            goto LABEL_54;
          case 5083:
            uint64_t v12 = 5;
LABEL_54:
            int v11 = 8;
            goto LABEL_79;
          case 5086:
            uint64_t v12 = 1;
            goto LABEL_60;
          case 5087:
            uint64_t v12 = 2;
            goto LABEL_60;
          case 5088:
            uint64_t v12 = 3;
            goto LABEL_60;
          case 5089:
            uint64_t v12 = 4;
            goto LABEL_60;
          case 5090:
            uint64_t v12 = 5;
LABEL_60:
            int v11 = 10;
            goto LABEL_79;
          case 5092:
            uint64_t v12 = 1;
            goto LABEL_66;
          case 5093:
            uint64_t v12 = 2;
            goto LABEL_66;
          case 5094:
            uint64_t v12 = 3;
            goto LABEL_66;
          case 5095:
            uint64_t v12 = 4;
            goto LABEL_66;
          case 5096:
            uint64_t v12 = 5;
LABEL_66:
            int v11 = 11;
            goto LABEL_79;
          case 5098:
            uint64_t v12 = 1;
            goto LABEL_72;
          case 5099:
            uint64_t v12 = 2;
            goto LABEL_72;
          case 5100:
            uint64_t v12 = 3;
            goto LABEL_72;
          case 5101:
            uint64_t v12 = 4;
            goto LABEL_72;
          case 5102:
            uint64_t v12 = 5;
LABEL_72:
            int v11 = 12;
            goto LABEL_79;
          case 5104:
            uint64_t v12 = 1;
            goto LABEL_78;
          case 5105:
            uint64_t v12 = 2;
            goto LABEL_78;
          case 5106:
            uint64_t v12 = 3;
            goto LABEL_78;
          case 5107:
            uint64_t v12 = 4;
            goto LABEL_78;
          case 5108:
            uint64_t v12 = 5;
LABEL_78:
            int v11 = 13;
LABEL_79:
            *(_WORD *)&v7[2 * v9] = cherokee_syllables[6 * v11];
            LOWORD(v10) = cherokee_syllables[v12];
            ++v9;
            break;
          default:
            break;
        }
        *(_WORD *)&v7[2 * v9++] = v10;
        ++v8;
      }
      while ([v4 length] > v8);
      uint64_t v13 = v9;
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v5 = [NSString stringWithCharacters:v7 length:v13];
  }

  return v5;
}

@end
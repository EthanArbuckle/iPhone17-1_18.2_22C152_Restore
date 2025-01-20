@interface TIKeyEventMap_ja_LiveConversion
- (id)inputEventForInputString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
@end

@implementation TIKeyEventMap_ja_LiveConversion

- (id)inputEventForInputString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  int v6 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v10;
  if (([v10 _isBasicLatin] & 1) == 0)
  {
    id v11 = v9;
  }
  v12 = 0;
  int v13 = v6 & 0x1D90000 | [v11 _firstChar];
  if (v13 <= 4194400)
  {
    if (v13 > 1048584)
    {
      if (v13 <= 1048602)
      {
        switch(v13)
        {
          case 1048585:
            goto LABEL_10;
          case 1048586:
            goto LABEL_20;
          case 1048587:
            goto LABEL_29;
          case 1048588:
            goto LABEL_35;
          case 1048591:
            goto LABEL_36;
          default:
            goto LABEL_45;
        }
        goto LABEL_45;
      }
      if (v13 <= 1048633)
      {
        if (v13 != 1048603)
        {
          int v17 = 1048615;
          goto LABEL_27;
        }
        goto LABEL_48;
      }
      if (v13 != 1048634)
      {
        int v19 = 1048635;
        goto LABEL_41;
      }
      goto LABEL_43;
    }
    if (v13 > 524402)
    {
      if (v13 == 524403) {
        goto LABEL_43;
      }
      if (v13 != 524408)
      {
        int v14 = 524410;
LABEL_19:
        if (v13 != v14) {
          goto LABEL_45;
        }
LABEL_20:
        v15 = objc_alloc_init(TIKeyboardInput);
        v12 = v15;
        uint64_t v16 = 4;
        goto LABEL_44;
      }
      goto LABEL_29;
    }
    if (v13 != 524385)
    {
      int v18 = 524387;
LABEL_34:
      if (v13 != v18) {
        goto LABEL_45;
      }
LABEL_35:
      v15 = objc_alloc_init(TIKeyboardInput);
      v12 = v15;
      uint64_t v16 = 1;
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  if (v13 <= 8388616)
  {
    if (v13 > 4194418)
    {
      if (v13 == 4194419) {
        goto LABEL_43;
      }
      if (v13 != 4194424)
      {
        int v14 = 4194426;
        goto LABEL_19;
      }
LABEL_29:
      v15 = objc_alloc_init(TIKeyboardInput);
      v12 = v15;
      uint64_t v16 = 3;
LABEL_44:
      [(TIKeyboardInput *)v15 setTransliterationType:v16];
      goto LABEL_45;
    }
    if (v13 != 4194401)
    {
      int v18 = 4194403;
      goto LABEL_34;
    }
LABEL_42:
    v15 = objc_alloc_init(TIKeyboardInput);
    v12 = v15;
    uint64_t v16 = 2;
    goto LABEL_44;
  }
  if (v13 > 8388634)
  {
    if (v13 <= 8388665)
    {
      if (v13 != 8388635)
      {
        int v17 = 8388647;
LABEL_27:
        if (v13 != v17) {
          goto LABEL_45;
        }
        goto LABEL_43;
      }
LABEL_48:
      v12 = objc_alloc_init(TIKeyboardInput);
      [(TIKeyboardInput *)v12 setString:@"\x1B"];
      goto LABEL_45;
    }
    if (v13 != 8388666)
    {
      int v19 = 8388667;
LABEL_41:
      if (v13 != v19) {
        goto LABEL_45;
      }
      goto LABEL_42;
    }
LABEL_43:
    v15 = objc_alloc_init(TIKeyboardInput);
    v12 = v15;
    uint64_t v16 = 5;
    goto LABEL_44;
  }
  switch(v13)
  {
    case 8388617:
LABEL_10:
      v12 = objc_alloc_init(TIKeyboardInput);
      [(TIKeyboardInput *)v12 setShrinkSegment:1];
      break;
    case 8388618:
      goto LABEL_20;
    case 8388619:
      goto LABEL_29;
    case 8388620:
      goto LABEL_35;
    case 8388623:
LABEL_36:
      v12 = objc_alloc_init(TIKeyboardInput);
      [(TIKeyboardInput *)v12 setExpandSegment:1];
      break;
    default:
      break;
  }
LABEL_45:

  return v12;
}

@end
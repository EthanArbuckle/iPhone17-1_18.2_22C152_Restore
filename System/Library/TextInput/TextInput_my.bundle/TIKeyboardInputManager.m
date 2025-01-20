@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

void __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rangeAtIndex:1];
  uint64_t v41 = v5;
  uint64_t v42 = v4;
  uint64_t v6 = [v3 rangeAtIndex:2];
  uint64_t v7 = [v3 rangeAtIndex:4];
  uint64_t v9 = v8;
  uint64_t v10 = [v3 rangeAtIndex:6];
  size_t v12 = v11;
  uint64_t v13 = [v3 rangeAtIndex:7];
  uint64_t v43 = v14;
  uint64_t v44 = v13;
  uint64_t v15 = [v3 rangeAtIndex:8];
  uint64_t v17 = v16;
  if (![v3 range]) {
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(v3, "range") - 1) != 4153) {
    goto LABEL_7;
  }
  if ((unint64_t)[v3 range] >= 3)
  {
    int v40 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(v3, "range") - 3);
    uint64_t v18 = v6;
    uint64_t v19 = v17;
    uint64_t v20 = v15;
    v21 = *(void **)(a1 + 32);
    uint64_t v22 = [v3 range] - 2;
    v23 = v21;
    uint64_t v15 = v20;
    uint64_t v17 = v19;
    uint64_t v6 = v18;
    int v24 = [v23 characterAtIndex:v22];
    if (v40 == 4100 && v24 == 4154)
    {
LABEL_7:
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v7, v9);
        uint64_t v25 = v15;
        v26 = *(void **)(a1 + 40);
        v27 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v9);
        v28 = v26;
        uint64_t v15 = v25;
        [v28 insertString:v27 atIndex:v6];
      }
      if (v12)
      {
        if (v12 == 1)
        {
          BOOL v29 = [*(id *)(a1 + 32) characterAtIndex:v10] >= 0x103D;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "getCharacters:range:", __base, v10, v12);
          qsort_b(__base, v12, 2uLL, &__block_literal_global);
          v30 = *(void **)(a1 + 40);
          v31 = [NSString stringWithCharacters:__base length:v12];
          objc_msgSend(v30, "replaceCharactersInRange:withString:", v10, v12, v31);

          BOOL v29 = __base[0] >= 0x103Du;
        }
        LOBYTE(v12) = !v29;
      }
      if (v42 != 0x7FFFFFFFFFFFFFFFLL && v41)
      {
        [*(id *)(a1 + 40) insertString:@"ေ" atIndex:v44];
        objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v42, v41);
      }
      if (v43 == 2)
      {
        int v32 = [*(id *)(a1 + 32) characterAtIndex:v44];
        int v33 = [*(id *)(a1 + 32) characterAtIndex:v44 + 1];
        __int16 v45 = v33;
        if (((v32 - 4141) > 5 || ((1 << (v32 - 45)) & 0x23) == 0)
          && (v33 - 4141) <= 5
          && ((1 << (v33 - 45)) & 0x23) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v44 + 1, 1);
          v34 = *(void **)(a1 + 40);
          v35 = [NSString stringWithCharacters:&v45 length:1];
          [v34 insertString:v35 atIndex:v44];
        }
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL || v17 == 0) {
        char v37 = 1;
      }
      else {
        char v37 = v12;
      }
      if ((v37 & 1) == 0)
      {
        [v3 rangeAtIndex:3];
        if (!v38)
        {
          uint64_t v39 = [*(id *)(a1 + 32) characterAtIndex:v6];
          if (_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E11__onceToken != -1) {
            dispatch_once(&_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E11__onceToken, &__block_literal_global_7);
          }
          if ([(id)_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E27__requiresTallACharacterSet characterIsMember:v39])objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v15, v17, @"ါ"); {
        }
          }
      }
    }
  }
}

uint64_t __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke_2(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  return *a2 - *a3;
}

uint64_t __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke_3()
{
  _ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E27__requiresTallACharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ခဂငဒပဝ"];

  return MEMORY[0x270F9A758]();
}

void __54__TIKeyboardInputManager_my_externalStringToInternal___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 rangeAtIndex:1];
  uint64_t v5 = v4;
  uint64_t v6 = [v12 rangeAtIndex:3];
  uint64_t v8 = v7;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    uint64_t v9 = [*(id *)(a1 + 32) length];
    if (v5 + v3 + 1 < (unint64_t)[*(id *)(a1 + 32) length]) {
      uint64_t v9 = [*(id *)(a1 + 32) rangeOfComposedCharacterSequenceAtIndex:v5 + v3 + 1];
    }
    uint64_t v10 = *(void **)(a1 + 40);
    size_t v11 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
    [v10 insertString:v11 atIndex:v9];

    objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v3, v5);
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v6, v8);
    objc_msgSend(*(id *)(a1 + 40), "insertString:atIndex:", @"ေ", objc_msgSend(v12, "range"));
  }
}

@end
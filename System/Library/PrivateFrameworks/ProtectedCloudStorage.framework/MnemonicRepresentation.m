@interface MnemonicRepresentation
+ (id)entropyFromMnemonic:(id)a3;
+ (id)mnemonicFrom:(id)a3;
+ (id)mnemonicWordList;
+ (id)potentialWords:(id)a3;
+ (id)seedFromMnemonic:(id)a3;
+ (id)textfieldAutoCompleteBuilder:(id)a3 forNextLetter:(id)a4;
@end

@implementation MnemonicRepresentation

+ (id)mnemonicWordList
{
  if (mnemonicWordList_wordlistToken != -1) {
    dispatch_once(&mnemonicWordList_wordlistToken, &__block_literal_global_18);
  }
  v2 = (void *)mnemonicWordList__wordlist;
  return v2;
}

void __42__MnemonicRepresentation_mnemonicWordList__block_invoke()
{
  v0 = (void *)mnemonicWordList__wordlist;
  mnemonicWordList__wordlist = (uint64_t)&unk_1F03F7540;
}

+ (id)mnemonicFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 length] & 3) != 0
    || (unint64_t)[v4 length] < 0xC
    || (unint64_t)[v4 length] >= 0x21)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v37 = [v4 length];
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "input entropy to mnemonic generation is of incorrect length, %lu", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    id v7 = v4;
    CC_SHA256((const void *)[v7 bytes], objc_msgSend(v7, "length"), buf);
    unsigned int v8 = buf[0];
    int v9 = 8 * (unsigned __int16)[v7 length];
    v35 = v30;
    unsigned int v10 = ((unsigned __int16)[v7 length] >> 2) + v9;
    unint64_t v11 = (390451573 * (unint64_t)v10) >> 32;
    v12 = (unsigned __int16 *)&v30[-((2 * v11 + 15) & 0x7FFF0)];
    id v13 = v7;
    uint64_t v14 = [v13 bytes];
    if ([v13 length])
    {
      unsigned int v31 = v10;
      unint64_t v32 = (390451573 * (unint64_t)v10) >> 32;
      unsigned int v33 = v8;
      id v34 = a1;
      int v15 = 0;
      uint64_t v16 = 0;
      unsigned int v17 = 0;
      unsigned int v18 = 0;
      do
      {
        if (v18 > 0xA)
        {
          char v20 = v18;
          uint64_t v19 = v16;
        }
        else
        {
          do
          {
            uint64_t v19 = (v16 + 1);
            unsigned int v17 = *(unsigned __int8 *)(v14 + v16) | (v17 << 8);
            char v20 = v18 + 8;
            LODWORD(v16) = v16 + 1;
            BOOL v21 = v18 >= 3;
            v18 += 8;
          }
          while (!v21);
        }
        char v22 = v20 - 11;
        int v23 = v15 + 1;
        v12[v15] = v17 >> (v20 - 11);
        unsigned int v18 = (v20 - 11);
        v17 &= ~(-1 << (v20 - 11));
        unint64_t v24 = [v13 length];
        int v15 = v23;
        uint64_t v16 = v19;
      }
      while (v24 > v19);
      uint64_t v25 = v23;
      a1 = v34;
      unsigned int v8 = v33;
      unint64_t v11 = v32;
      unsigned int v10 = v31;
    }
    else
    {
      char v22 = 0;
      LOWORD(v17) = 0;
      uint64_t v25 = 0;
    }
    v12[v25] = ((_WORD)v17 << (11 - v22)) | (v8 >> (v22 - 3));
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    if (v10 >= 0xB)
    {
      if (v11 <= 1) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = v11;
      }
      do
      {
        v27 = [a1 mnemonicWordList];
        unsigned int v28 = *v12++;
        v29 = [v27 objectAtIndexedSubscript:v28];
        [v5 addObject:v29];

        --v26;
      }
      while (v26);
    }
  }

  return v5;
}

+ (id)entropyFromMnemonic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (0xAAAAAAAAAAAAAAABLL * [v4 count] <= 0x5555555555555555
    && (unint64_t)[v4 count] >= 9
    && (unint64_t)[v4 count] < 0x19)
  {
    uint64_t v7 = [v4 count];
    unint64_t v8 = 11 * v7 / 0x21uLL;
    id v9 = [MEMORY[0x1E4F1CA58] dataWithLength:(unsigned __int16)(11 * v7 - v8) >> 3];
    uint64_t v10 = [v9 bytes];
    if ([v4 count])
    {
      id v22 = v9;
      unint64_t v23 = v8;
      int v11 = 0;
      unsigned __int8 v12 = 0;
      unsigned int v13 = 0;
      unsigned __int8 v14 = 0;
      do
      {
        unsigned __int8 v15 = v14;
        if (v14 <= 7u)
        {
          uint64_t v16 = [v4 objectAtIndexedSubscript:v12];
          unsigned int v17 = [v16 lowercaseString];

          unsigned int v18 = [a1 mnemonicWordList];
          unsigned __int16 v19 = [v18 indexOfObject:v17];

          ++v12;
          v15 += 11;
          unsigned int v13 = v19 | (v13 << 11);
        }
        unsigned __int8 v14 = v15 - 8;
        *(unsigned char *)(v10 + v11) = v13 >> (v15 - 8);
        v13 &= ~(-1 << (v15 - 8));
        ++v11;
      }
      while (objc_msgSend(v4, "count", v22, v23) > (unint64_t)v12);
      int v20 = v13;
      id v9 = v22;
      LOBYTE(v8) = v23;
    }
    else
    {
      int v20 = 0;
    }
    id v21 = v9;
    CC_SHA256((const void *)[v21 bytes], objc_msgSend(v21, "length"), buf);
    if (buf[0] >> (8 - v8) == v20)
    {
      id v5 = v21;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v24 = 0;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "provided mnemonic has incorrect checksum", v24, 2u);
      }
      id v5 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = [v4 count];
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "input mnemonic is of incorrect length, %lu", buf, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

+ (id)seedFromMnemonic:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [a3 componentsJoinedByString:@" "];
  id v4 = [v3 dataUsingEncoding:4];

  id v5 = [@"mnemonic" dataUsingEncoding:4];
  id v6 = v4;
  uint64_t v7 = (const char *)[v6 bytes];
  size_t v8 = [v6 length];
  id v9 = v5;
  CCKeyDerivationPBKDF(2u, v7, v8, (const uint8_t *)[v9 bytes], objc_msgSend(v9, "length"), 5u, 0x800u, derivedKey, 0x40uLL);
  uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:derivedKey length:64];

  return v10;
}

+ (id)potentialWords:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = [v4 lowercaseString];
    id v6 = (__CFString *)[v5 mutableCopy];

    CFStringTrimWhitespace(v6);
    if ([(__CFString *)v6 length])
    {
      uint64_t v7 = +[MnemonicRepresentation mnemonicWordList];
      size_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self beginswith[cd] %@", v6];
      id v9 = [v7 filteredArrayUsingPredicate:v8];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

+ (id)textfieldAutoCompleteBuilder:(id)a3 forNextLetter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (__CFString *)[v5 mutableCopy];
  CFStringTrimWhitespace(v7);
  size_t v8 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
  id v9 = [v8 componentsSeparatedByString:@"-"];

  uint64_t v10 = [v9 lastObject];
  int v11 = [NSString stringWithFormat:@"%@%@", v10, v6];
  unsigned __int8 v12 = +[MnemonicRepresentation potentialWords:v11];
  if ([v12 count])
  {
    if ([v12 count] == 1)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
      [v13 removeLastObject];
      unsigned __int8 v14 = [v12 firstObject];
      [v13 addObject:v14];

      unsigned __int8 v15 = [v13 componentsJoinedByString:@"-"];

      goto LABEL_7;
    }
    id v16 = [NSString stringWithFormat:@"%@%@", v5, v6];
  }
  else
  {
    id v16 = v5;
  }
  unsigned __int8 v15 = v16;
LABEL_7:

  return v15;
}

@end
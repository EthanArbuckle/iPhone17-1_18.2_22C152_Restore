@interface TIUserDictionaryWord
+ (BOOL)userWord:(id)a3 duplicatesTarget:(id)a4 andShortcut:(id)a5;
+ (id)managedObjectModelURL;
+ (int64_t)validateTransaction:(id)a3 existingEntries:(id)a4;
@end

@implementation TIUserDictionaryWord

+ (BOOL)userWord:(id)a3 duplicatesTarget:(id)a4 andShortcut:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 phrase];
  char v11 = [v8 isEqualToString:v10];

  v12 = [v9 shortcut];
  if ([v12 length]) {
    [v9 shortcut];
  }
  else {
  v13 = [v9 phrase];
  }

  uint64_t v14 = [v7 compare:v13 options:1];
  if (v14) {
    char v15 = 1;
  }
  else {
    char v15 = v11;
  }
  char v16 = (v14 != 0) ^ v15;

  return v16;
}

+ (int64_t)validateTransaction:(id)a3 existingEntries:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 valueToInsert];
  id v8 = [v7 phrase];

  id v9 = [v5 valueToInsert];
  v10 = [v9 shortcut];

  uint64_t v11 = [v8 length];
  int v12 = [v8 _containsIdeographicCharacters];
  if (!v11)
  {
    int64_t v21 = 1;
    goto LABEL_51;
  }
  int v13 = v12;
  uint64_t v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  char v15 = [v8 stringByTrimmingCharactersInSet:v14];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
    int64_t v21 = 2;
    goto LABEL_51;
  }
  if ([v10 length]) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v16 == 1;
  }
  if (v17) {
    int v18 = v13;
  }
  else {
    int v18 = 1;
  }
  if (v18 != 1)
  {
    int64_t v21 = 3;
    goto LABEL_51;
  }
  if (v10)
  {
    v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v20 = [v10 rangeOfCharacterFromSet:v19];

    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v21 = 5;
      goto LABEL_51;
    }
  }
  if ([v10 _containsEmoji])
  {
    int64_t v21 = 9;
    goto LABEL_51;
  }
  int v22 = [v10 _containsCJKSymbolsAndPunctuation];
  if ((v13 & ~v22) == 1)
  {
    if (![v10 length])
    {
      int64_t v21 = 11;
      goto LABEL_51;
    }
  }
  else
  {
    if (v22) {
      int64_t v21 = 10;
    }
    else {
      int64_t v21 = 0;
    }
    if (v22) {
      goto LABEL_51;
    }
  }
  if ([v10 _containsIdeographicCharacters])
  {
    int64_t v21 = 8;
  }
  else
  {
    if ([v10 _containsHiraganaKatakanaOrBopomofo])
    {
      unint64_t v23 = 1;
    }
    else if ([v10 isEqualToString:@"☻"])
    {
      unint64_t v23 = 1;
    }
    else
    {
      unint64_t v23 = 2;
    }
    if ([v10 length] && objc_msgSend(v10, "length") < v23)
    {
      int64_t v21 = 6;
    }
    else
    {
      id v24 = v10;
      if ([v24 length])
      {
        int64_t v21 = 7;
      }
      else
      {
        id v25 = v8;

        int64_t v21 = 4;
        id v24 = v25;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v6;
      uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        id v34 = v6;
        id v35 = v24;
        uint64_t v28 = *(void *)v38;
LABEL_40:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v37 + 1) + 8 * v29);
          v31 = [v5 valueToDelete];
          char v32 = [v31 matchesEntry:v30];

          if ((v32 & 1) == 0
            && +[TIUserDictionaryWord userWord:v30 duplicatesTarget:v8 andShortcut:v35])
          {
            break;
          }
          if (v27 == ++v29)
          {
            uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v27) {
              goto LABEL_40;
            }
            int64_t v21 = 0;
            break;
          }
        }
        id v6 = v34;
        id v24 = v35;
      }
      else
      {
        int64_t v21 = 0;
      }
    }
  }
LABEL_51:

  return v21;
}

+ (id)managedObjectModelURL
{
  return 0;
}

@end
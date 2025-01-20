@interface TIKeyboardFeatureSpecialization_ain
- (BOOL)shouldConvertEagerly;
- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6;
- (id)internalStringToExternal:(id)a3;
- (id)wordCharacters;
@end

@implementation TIKeyboardFeatureSpecialization_ain

- (BOOL)shouldConvertEagerly
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  v4 = [a3 _stringByReplacingCharacter:32 withCharacter:12288];
  v5 = [v4 _stringByReplacingCharacter:45 withCharacter:12540];

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardFeatureSpecialization_ain;
  v6 = [(TIKeyboardFeatureSpecialization *)&v8 internalStringToExternal:v5];

  return v6;
}

- (id)wordCharacters
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F7E6B0]) initWithBaseCharacterSet:10];
  v4 = [(TIKeyboardFeatureSpecialization *)self nonstopPunctuationCharacters];
  [v3 addCharactersInString:v4];

  [v3 removeCharactersInString:@"ー"];

  return v3;
}

- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if ([v10 length] && objc_msgSend(v10, "length") > a4)
  {
    v34.receiver = self;
    v34.super_class = (Class)TIKeyboardFeatureSpecialization_ain;
    v12 = [(TIKeyboardFeatureSpecialization *)&v34 findPrefixMatchesFor:v10 fromIndex:a4 usingCompositionMap:v11 matchesInputAsPrefix:v6];
    if (a4)
    {
      uint64_t v13 = [v10 characterAtIndex:a4];
      uint64_t v14 = v13;
      if (v13 == 114 || v13 == 104)
      {
        int v15 = [v10 characterAtIndex:a4 - 1];
        v16 = [NSString _stringWithUnichar:v14];
        if (v14 == 114)
        {
          v17 = 0;
          int v18 = 0;
          HIDWORD(v21) = v15 - 97;
          LODWORD(v21) = v15 - 97;
          switch((v21 >> 1))
          {
            case 0u:
              v17 = @"ㇻ";
              goto LABEL_25;
            case 2u:
              v17 = @"ㇾ";
              goto LABEL_25;
            case 4u:
              v17 = @"ㇼ";
              goto LABEL_25;
            case 7u:
              v17 = @"ㇿ";
              goto LABEL_25;
            case 0xAu:
              v17 = @"ㇽ";
LABEL_25:
              int v18 = 1;
              break;
            default:
              break;
          }
        }
        else if (v14 == 104)
        {
          v17 = 0;
          int v18 = 0;
          HIDWORD(v19) = v15 - 97;
          LODWORD(v19) = v15 - 97;
          switch((v19 >> 1))
          {
            case 0u:
              v17 = @"ㇵ";
              goto LABEL_25;
            case 2u:
              v17 = @"ㇸ";
              goto LABEL_25;
            case 4u:
              v17 = @"ㇶ";
              goto LABEL_25;
            case 7u:
              v17 = @"ㇹ";
              goto LABEL_25;
            case 0xAu:
              v17 = @"ㇷ";
              goto LABEL_25;
            default:
              break;
          }
        }
        else
        {
          int v18 = 0;
          v17 = 0;
        }
        unint64_t v22 = a4 + 1;
        BOOL v23 = v22 >= [v10 length] || objc_msgSend(v10, "characterAtIndex:", v22) != 106;
        if ((v18 & v23) == 1)
        {
          v24 = (void *)[v12 mutableCopy];
          uint64_t v25 = [v24 count];
          if ([v24 count])
          {
            uint64_t v32 = v25;
            v33 = v17;
            uint64_t v26 = 0;
            while (1)
            {
              v27 = objc_msgSend(v24, "objectAtIndexedSubscript:", v26, v32);
              v28 = [v27 key];
              unint64_t v29 = [v28 length];
              unint64_t v30 = [v16 length];

              if (v29 <= v30) {
                break;
              }
              if ([v24 count] <= (unint64_t)++v26)
              {
                uint64_t v25 = v32;
                v17 = v33;
                goto LABEL_36;
              }
            }
            uint64_t v25 = v26;
            v17 = v33;
          }
LABEL_36:
          v31 = [MEMORY[0x263F7EA50] itemWithKey:v16 value:v17];
          [v24 insertObject:v31 atIndex:v25];

          v12 = v24;
        }
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

@end
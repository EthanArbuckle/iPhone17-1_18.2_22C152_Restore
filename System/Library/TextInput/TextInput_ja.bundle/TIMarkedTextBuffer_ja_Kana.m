@interface TIMarkedTextBuffer_ja_Kana
- (BOOL)hardwareKeyboard;
- (NSString)externalString;
- (TIMarkedTextBuffer_ja_Kana)initWithInternalString:(id)a3;
- (int64_t)externalIndex;
- (void)clear;
- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5;
- (void)setExternalIndex:(int64_t)a3;
- (void)setHardwareKeyboard:(BOOL)a3;
- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4;
@end

@implementation TIMarkedTextBuffer_ja_Kana

- (TIMarkedTextBuffer_ja_Kana)initWithInternalString:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIMarkedTextBuffer_ja_Kana;
  v5 = [(TIMarkedTextBuffer_ja_Kana *)&v7 init];
  if (v5)
  {
    -[TIMarkedTextBuffer_ja_Kana setInternalString:withInputIndex:](v5, "setInternalString:withInputIndex:", v4, [v4 length]);
    [(TIMarkedTextBuffer_ja_Kana *)v5 setHardwareKeyboard:1];
  }

  return v5;
}

- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = v6;
  if (a4 < 2) {
    goto LABEL_25;
  }
  int64_t v8 = a4 - 1;
  if (a4 - 1 >= (unint64_t)[v6 length]) {
    goto LABEL_25;
  }
  int v9 = [v7 characterAtIndex:a4 - 1];
  if (v9 == 12444)
  {
    if (![(TIMarkedTextBuffer_ja_Kana *)self hardwareKeyboard]) {
      goto LABEL_25;
    }
    v15 = objc_msgSend(v7, "substringWithRange:", a4 - 2, 1);
    uint64_t v16 = [@"はひふへほ" rangeOfString:v15];
    uint64_t v18 = v17;

    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_25;
    }
    v19 = @"ぱぴぷぺぽ";
    goto LABEL_14;
  }
  if (v9 == 12443)
  {
    if (![(TIMarkedTextBuffer_ja_Kana *)self hardwareKeyboard])
    {
      unsigned int v27 = [v7 characterAtIndex:a4 - 2] - 12353;
      if (v27 > 0x53) {
        goto LABEL_25;
      }
      int v28 = Kana_variant_map[v27];
      __int16 v31 = v28;
      if (!v28) {
        goto LABEL_25;
      }
      uint64_t v22 = [NSString stringWithCharacters:&v31 length:1];
      goto LABEL_22;
    }
    v20 = objc_msgSend(v7, "substringWithRange:", a4 - 2, 1);
    uint64_t v16 = [@"うかきくけこさしすせそたちつてとはひふへほ" rangeOfString:v20];
    uint64_t v18 = v21;

    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_25;
    }
    v19 = @"ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ";
LABEL_14:
    uint64_t v22 = -[__CFString substringWithRange:](v19, "substringWithRange:", v16, v18);
LABEL_22:
    v13 = (void *)v22;
    goto LABEL_23;
  }
  if (v9 != 8616) {
    goto LABEL_25;
  }
  uint64_t v10 = [v7 characterAtIndex:a4 - 2];
  __int16 v32 = v10;
  v11 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  int v12 = [v11 characterIsMember:v10];

  if (v12)
  {
    v13 = [NSString stringWithCharacters:&v32 length:1];
    uint64_t v14 = [v13 lowercaseString];
    goto LABEL_17;
  }
  v23 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
  int v24 = [v23 characterIsMember:v10];

  v25 = [NSString stringWithCharacters:&v32 length:1];
  v13 = v25;
  if (!v24)
  {
LABEL_23:
    if (v13) {
      goto LABEL_24;
    }
LABEL_25:
    int64_t v8 = a4;
    goto LABEL_26;
  }
  uint64_t v14 = [v25 uppercaseString];
LABEL_17:
  v26 = (void *)v14;

  v13 = v26;
  if (!v26) {
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v29 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", a4 - 2, 2, v13);

  objc_super v7 = (void *)v29;
LABEL_26:
  externalString = self->_externalString;
  self->_externalIndex = v8;
  self->_externalString = (NSString *)v7;
}

- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5
{
  if (a3) {
    *a3 = 1;
  }
  if (a5)
  {
    uint64_t v6 = [(TIMarkedTextBuffer_ja_Kana *)self internalIndex];
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    *a5 = v7 - 1;
  }
}

- (void)clear
{
  externalString = self->_externalString;
  self->_externalString = (NSString *)&stru_26F5DD710;

  self->_externalIndex = 0;
}

- (BOOL)hardwareKeyboard
{
  return self->hardwareKeyboard;
}

- (void)setHardwareKeyboard:(BOOL)a3
{
  self->hardwareKeyboard = a3;
}

- (int64_t)externalIndex
{
  return self->_externalIndex;
}

- (void)setExternalIndex:(int64_t)a3
{
  self->_externalIndex = a3;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (void).cxx_destruct
{
}

@end
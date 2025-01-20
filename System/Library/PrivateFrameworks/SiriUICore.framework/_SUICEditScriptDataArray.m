@interface _SUICEditScriptDataArray
+ (id)EditScriptDataWithArray:(id)a3;
+ (id)EditScriptDataWithString:(id)a3 chunkSize:(int64_t)a4;
- (NSArray)data;
- (NSString)cachedStringValue;
- (NSString)description;
- (_SUICEditScriptDataArray)initWithArray:(id)a3;
- (_SUICEditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4;
- (id)stringAtIndex:(int64_t)a3;
- (id)stringValue;
- (int64_t)characterIndexForItem:(int64_t)a3;
- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4 fallsOnWordBoundary:(BOOL *)a5;
- (int64_t)length;
- (int64_t)lengthOfItem:(int64_t)a3;
- (void)setCachedStringValue:(id)a3;
- (void)setData:(id)a3;
@end

@implementation _SUICEditScriptDataArray

- (_SUICEditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_SUICEditScriptDataArray;
  v7 = [(_SUICEditScriptDataArray *)&v40 init];
  v8 = v7;
  if (v7)
  {
    [(_SUICEditScriptDataArray *)v7 setCachedStringValue:v6];
    unint64_t v9 = [v6 length];
    if (a4 == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      data = v8->_data;
      v8->_data = (NSArray *)v12;

      unint64_t v14 = 0x1E96BD000uLL;
      if (!initWithString_chunkSize__whitespaceOrPunctuationCharacterSet)
      {
        uint64_t v15 = [MEMORY[0x1E4F28E58] whitespaceCharacterSet];
        v16 = (void *)initWithString_chunkSize__whitespaceOrPunctuationCharacterSet;
        initWithString_chunkSize__whitespaceOrPunctuationCharacterSet = v15;

        v17 = (void *)initWithString_chunkSize__whitespaceOrPunctuationCharacterSet;
        v18 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
        [v17 formUnionWithCharacterSet:v18];
      }
      uint64_t v37 = 0;
      if (v9)
      {
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        unint64_t v21 = v9 - 1;
        id v36 = v6;
        do
        {
          uint64_t v22 = IsCharacterAtIndexMemberOfCharacterSet(v6, &v37, *(void **)(v14 + 4048));
          int v23 = v22;
          uint64_t v24 = v37;
          if ((v22 & 1) != 0 || v37 == v21)
          {
            uint64_t v25 = v19 + v20;
            uint64_t v26 = (v22 << 63 >> 63) - (v19 + v20) + v37;
            if (v26 >= 0)
            {
              uint64_t v20 = v26 + 1;
              v27 = v8->_data;
              objc_msgSend(v6, "substringWithRange:", v25, v26 + 1);
              v28 = v8;
              unint64_t v29 = v21;
              unint64_t v30 = v9;
              v32 = unint64_t v31 = v14;
              [(NSArray *)v27 addObject:v32];

              unint64_t v14 = v31;
              unint64_t v9 = v30;
              unint64_t v21 = v29;
              v8 = v28;
              id v6 = v36;
              uint64_t v19 = v25;
            }
            if (v23)
            {
              v33 = v8->_data;
              v34 = objc_msgSend(v6, "substringWithRange:", v24, 1);
              [(NSArray *)v33 addObject:v34];

              uint64_t v20 = 1;
              uint64_t v19 = v24;
            }
          }
          uint64_t v37 = v24 + 1;
        }
        while (v24 + 1 < v9);
      }
    }
    else if (!a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
      v11 = v8->_data;
      v8->_data = (NSArray *)v10;

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __53___SUICEditScriptDataArray_initWithString_chunkSize___block_invoke;
      v38[3] = &unk_1E5C59650;
      v39 = v8;
      objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v38);
    }
  }

  return v8;
}

- (_SUICEditScriptDataArray)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUICEditScriptDataArray;
  v5 = [(_SUICEditScriptDataArray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSArray *)v6;
  }
  return v5;
}

- (NSString)description
{
  return [(NSArray *)self->_data description];
}

+ (id)EditScriptDataWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[_SUICEditScriptDataArray alloc] initWithString:v5 chunkSize:a4];

  return v6;
}

+ (id)EditScriptDataWithArray:(id)a3
{
  id v3 = a3;
  id v4 = [[_SUICEditScriptDataArray alloc] initWithArray:v3];

  return v4;
}

- (int64_t)length
{
  return [(NSArray *)self->_data count];
}

- (id)stringAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_data objectAtIndex:a3];
}

- (id)stringValue
{
  cachedStringValue = self->_cachedStringValue;
  if (!cachedStringValue)
  {
    id v4 = [(NSArray *)self->_data componentsJoinedByString:&stru_1EFB44F78];
    [(_SUICEditScriptDataArray *)self setCachedStringValue:v4];

    cachedStringValue = self->_cachedStringValue;
  }

  return cachedStringValue;
}

- (int64_t)lengthOfItem:(int64_t)a3
{
  id v3 = [(NSArray *)self->_data objectAtIndex:a3];
  int64_t v4 = [v3 length];

  return v4;
}

- (int64_t)characterIndexForItem:(int64_t)a3
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
    v6 += [(_SUICEditScriptDataArray *)self lengthOfItem:v5++];
  while (a3 != v5);
  return v6;
}

- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4 fallsOnWordBoundary:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = [(_SUICEditScriptDataArray *)self length];
  unint64_t v10 = [v8 length];
  unint64_t v11 = v10;
  if (v9 >= v10) {
    unint64_t v12 = v10;
  }
  else {
    unint64_t v12 = v9;
  }
  if (!v12)
  {
    unint64_t v14 = 0;
    int64_t v13 = 0;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  unint64_t v29 = v9;
  unint64_t v30 = a5;
  int64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v28 = v10;
  unint64_t v15 = v10 - 1;
  unint64_t v16 = v9 - 1;
  while (1)
  {
    unint64_t v17 = v6 ? v16 : v13;
    unint64_t v18 = v6 ? v15 : v13;
    uint64_t v19 = -[_SUICEditScriptDataArray stringAtIndex:](self, "stringAtIndex:", v17, v28, v29, v30);
    uint64_t v20 = [v8 stringAtIndex:v18];
    if (([v19 isEqualToString:v20] & 1) == 0) {
      break;
    }

    ++v13;
    --v15;
    --v16;
    unint64_t v14 = v19;
    if (v12 == v13)
    {
      unint64_t v14 = v19;
      int64_t v13 = v12;
      goto LABEL_18;
    }
  }

LABEL_18:
  unint64_t v9 = v29;
  a5 = v30;
  unint64_t v11 = v28;
  if (v30)
  {
LABEL_19:
    uint64_t v21 = [v14 length];
    uint64_t v22 = v21 - 1;
    if (v21 < 1)
    {
      char v24 = 1;
    }
    else
    {
      if (v6) {
        uint64_t v22 = 0;
      }
      uint64_t v31 = v22;
      int v23 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      char v24 = IsCharacterAtIndexMemberOfCharacterSet(v14, &v31, v23);
    }
    *a5 = v24;
  }
LABEL_25:
  if (v13 == v12 && v9 == v11) {
    int64_t v26 = -1;
  }
  else {
    int64_t v26 = v13;
  }

  return v26;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)cachedStringValue
{
  return self->_cachedStringValue;
}

- (void)setCachedStringValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringValue, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end
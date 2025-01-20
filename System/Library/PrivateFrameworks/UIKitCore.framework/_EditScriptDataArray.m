@interface _EditScriptDataArray
+ (id)EditScriptDataWithArray:(id)a3;
+ (id)EditScriptDataWithString:(id)a3 chunkSize:(int64_t)a4;
- (NSArray)data;
- (NSString)cachedStringValue;
- (NSString)description;
- (_EditScriptDataArray)initWithArray:(id)a3;
- (_EditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4;
- (id)stringAtIndex:(int64_t)a3;
- (id)stringValue;
- (int64_t)characterIndexForItem:(int64_t)a3;
- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4;
- (int64_t)length;
- (int64_t)lengthOfItem:(int64_t)a3;
- (void)setCachedStringValue:(id)a3;
- (void)setData:(id)a3;
@end

@implementation _EditScriptDataArray

- (_EditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_EditScriptDataArray;
  v8 = [(_EditScriptDataArray *)&v34 init];
  v9 = v8;
  if (v8)
  {
    [(_EditScriptDataArray *)v8 setCachedStringValue:v7];
    uint64_t v10 = [v7 length];
    if (a4 == 1)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      data = v9->_data;
      v9->_data = (NSArray *)v15;

      uint64_t v31 = v10 - 1;
      if (v10 >= 1)
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        id v29 = v7;
        uint64_t v30 = v10;
        do
        {
          uint64_t v20 = [v7 characterAtIndex:v19];
          v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          unsigned int v22 = [v21 characterIsMember:v20];

          if ((v22 & 1) != 0 || v19 == v31)
          {
            v17 += v18;
            uint64_t v18 = v19 + 1 - v17 - v22;
            v23 = v9->_data;
            objc_msgSend(v7, "substringWithRange:", v17, v18);
            v25 = v24 = v9;
            [(NSArray *)v23 addObject:v25];

            if (v22)
            {
              v26 = v24->_data;
              v27 = objc_msgSend(v7, "substringWithRange:", v19, 1);
              [(NSArray *)v26 addObject:v27];

              uint64_t v17 = v19;
              uint64_t v18 = 1;
            }
            v9 = v24;
            ++v19;
            id v7 = v29;
            uint64_t v10 = v30;
          }
          else
          {
            ++v19;
          }
        }
        while (v19 != v10);
      }
    }
    else
    {
      if (a4)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_EditScriptDataArray.m", 61, @"Unexpected chunk size == %ld!", a4);
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
        v12 = v9->_data;
        v9->_data = (NSArray *)v11;

        uint64_t v13 = [v7 length];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __49___EditScriptDataArray_initWithString_chunkSize___block_invoke;
        v32[3] = &unk_1E52FB708;
        v33 = v9;
        objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 2, v32);
        v14 = v33;
      }
    }
  }

  return v9;
}

- (_EditScriptDataArray)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EditScriptDataArray;
  v5 = [(_EditScriptDataArray *)&v9 init];
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
  uint64_t v6 = [[_EditScriptDataArray alloc] initWithString:v5 chunkSize:a4];

  return v6;
}

+ (id)EditScriptDataWithArray:(id)a3
{
  id v3 = a3;
  id v4 = [[_EditScriptDataArray alloc] initWithArray:v3];

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
    id v4 = [(NSArray *)self->_data componentsJoinedByString:&stru_1ED0E84C0];
    [(_EditScriptDataArray *)self setCachedStringValue:v4];

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
    v6 += [(_EditScriptDataArray *)self lengthOfItem:v5++];
  while (a3 != v5);
  return v6;
}

- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(_EditScriptDataArray *)self length];
  unint64_t v8 = [v6 length];
  int64_t v9 = 0;
  if (v7 >= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v7;
  }
  if (v10)
  {
    unint64_t v21 = v8;
    unint64_t v22 = v7;
    unint64_t v11 = v8 - 1;
    unint64_t v12 = v7 - 1;
    while (1)
    {
      unint64_t v13 = v4 ? v12 : v9;
      unint64_t v14 = v4 ? v11 : v9;
      uint64_t v15 = -[_EditScriptDataArray stringAtIndex:](self, "stringAtIndex:", v13, v21, v22);
      v16 = [v6 stringAtIndex:v14];
      int v17 = [v15 isEqualToString:v16];

      if (!v17) {
        break;
      }
      ++v9;
      --v11;
      --v12;
      if (v10 == v9)
      {
        int64_t v9 = v10;
        break;
      }
    }
    unint64_t v8 = v21;
    unint64_t v7 = v22;
  }
  if (v9 == v10 && v7 == v8) {
    int64_t v19 = -1;
  }
  else {
    int64_t v19 = v9;
  }

  return v19;
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
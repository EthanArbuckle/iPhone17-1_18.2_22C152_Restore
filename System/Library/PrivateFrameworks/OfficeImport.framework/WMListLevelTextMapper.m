@interface WMListLevelTextMapper
- (WMListLevelTextMapper)initWithText:(id)a3;
- (WMListLevelTextMapper)initWithText:(id)a3 levelDescriptions:(id)a4 language:(int)a5;
- (id)listLevelTextForOutline:(id)a3;
- (id)token:(unsigned int)a3;
- (unint64_t)tokenCount;
@end

@implementation WMListLevelTextMapper

- (WMListLevelTextMapper)initWithText:(id)a3
{
  return [(WMListLevelTextMapper *)self initWithText:a3 levelDescriptions:0 language:1033];
}

- (WMListLevelTextMapper)initWithText:(id)a3 levelDescriptions:(id)a4 language:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)WMListLevelTextMapper;
  v10 = [(WMListLevelTextMapper *)&v38 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    unsigned int v35 = a5;
    tokens = v10->_tokens;
    v10->_tokens = (NSMutableArray *)v11;

    v37 = v9;
    unint64_t v13 = [v8 length];
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = objc_msgSend(v8, "rangeOfString:options:range:", @"%", 2, v14, v13 - v14);
      if (!v17) {
        break;
      }
      unint64_t v18 = v16;
      unint64_t v14 = v13;
      if (v16 != v13 - 1)
      {
        unint64_t v14 = v16 + 1;
        int v19 = [v8 characterAtIndex:v16 + 1];
        if (v18 > v15)
        {
          v20 = objc_msgSend(v8, "substringWithRange:", v15, v18 - v15);
          v21 = v10->_tokens;
          v22 = +[WMListLevelTextToken tokenWithString:v20 level:0 formatter:0];
          [(NSMutableArray *)v21 addObject:v22];
        }
        unsigned int v23 = (unsigned __int16)(v19 - 58);
        if (v23 >= 0xFFF7) {
          unint64_t v24 = v18;
        }
        else {
          unint64_t v24 = v18 + 1;
        }
        if (v23 < 0xFFF7) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = 2;
        }
        v36 = objc_msgSend(v8, "substringWithRange:", v24, v25);
        uint64_t v26 = (v19 - 48);
        if ([v37 count] >= (unint64_t)(int)v26)
        {
          v34 = v10->_tokens;
          v27 = [v37 objectAtIndexedSubscript:v19 - 49];
          v28 = +[CMNumberFormatter formatterForNumberFormat:language:](CMNumberFormatter, "formatterForNumberFormat:language:", [v27 numberFormat], v35);
          v29 = +[WMListLevelTextToken tokenWithString:v36 level:v26 formatter:v28];
          [(NSMutableArray *)v34 addObject:v29];
        }
        else
        {
          NSLog((NSString *)@"Ignoring list level: too many tokens in the format given the number of level descriptions");
        }
        unint64_t v15 = v18 + 2;

        id v9 = v37;
      }
    }
    if (v13 > v15)
    {
      v30 = objc_msgSend(v8, "substringWithRange:", v15, v13 - v15);
      v31 = v10->_tokens;
      v32 = +[WMListLevelTextToken tokenWithString:v30 level:0 formatter:0];
      [(NSMutableArray *)v31 addObject:v32];
    }
  }

  return v10;
}

- (id)listLevelTextForOutline:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v7 = [(NSMutableArray *)self->_tokens count];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v9 = [(NSMutableArray *)self->_tokens objectAtIndex:i];
      v10 = [v9 string];
      uint64_t v11 = v10;
      if (v9) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12 && [v10 length])
      {
        id v13 = v11;
        if ((int)[v9 level] >= 1
          && [v13 characterAtIndex:0] == 37
          && (unint64_t)[v13 length] >= 2)
        {
          if ([v13 length] != 2)
          {
            unint64_t v15 = [MEMORY[0x263F08690] currentHandler];
            [v15 handleFailureInMethod:a2 object:self file:@"WMListLevelTextMapper.mm" lineNumber:137 description:@"Invalid placeholder length"];
          }
          uint64_t v14 = objc_msgSend(v9, "stringForIndex:", objc_msgSend(v5, "counterAtLevel:", (objc_msgSend(v9, "level") - 1)));

          id v13 = (id)v14;
        }
        [v6 appendString:v13];
      }
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (unint64_t)tokenCount
{
  return [(NSMutableArray *)self->_tokens count];
}

- (id)token:(unsigned int)a3
{
  if ([(NSMutableArray *)self->_tokens count] <= (unint64_t)a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_tokens objectAtIndex:a3];
  }
  return v5;
}

@end
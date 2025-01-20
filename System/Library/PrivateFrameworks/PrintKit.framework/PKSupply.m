@interface PKSupply
+ (BOOL)isValidColorString:(const char *)a3;
- (NSArray)colors;
- (NSString)description;
- (NSString)markerType;
- (NSString)name;
- (PKSupply)initWithName:(const char *)a3 markerType:(const char *)a4 colors:(const char *)a5 level:(int)a6 lowLevel:(int)a7 highLevel:(int)a8;
- (id)userCodableDictionary;
- (int)highLevel;
- (int)level;
- (int)lowLevel;
- (int64_t)supplyType;
@end

@implementation PKSupply

+ (BOOL)isValidColorString:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  v3 = a3;
  size_t v4 = strlen(a3);
  BOOL result = 0;
  if (v4 >= 7 && !(v4 % 7))
  {
    do
    {
      BOOL result = _is_valid_color(v3);
      if (!result) {
        break;
      }
      v3 += 7;
      v4 -= 7;
    }
    while (v4 >= 7);
  }
  return result;
}

- (PKSupply)initWithName:(const char *)a3 markerType:(const char *)a4 colors:(const char *)a5 level:(int)a6 lowLevel:(int)a7 highLevel:(int)a8
{
  v39.receiver = self;
  v39.super_class = (Class)PKSupply;
  v12 = [(PKSupply *)&v39 init];
  if (v12)
  {
    uint64_t v13 = [NSString stringWithUTF8String:a3];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    uint64_t v15 = [NSString stringWithUTF8String:a4];
    markerType = v12->_markerType;
    v12->_markerType = (NSString *)v15;

    v17 = [MEMORY[0x263EFF980] array];
    int v35 = a8;
    __s1 = (char *)a4;
    size_t v18 = strlen(a5);
    if (v18 >= 7)
    {
      for (unint64_t i = v18; i > 6; i -= 7)
      {
        if (_is_valid_color(a5))
        {
          int v20 = __maskrune(a5[1], 0xFuLL);
          int v21 = __maskrune(a5[2], 0xFuLL);
          int v22 = __maskrune(a5[3], 0xFuLL);
          int v23 = __maskrune(a5[4], 0xFuLL);
          int v24 = __maskrune(a5[5], 0xFuLL);
          int v25 = __maskrune(a5[6], 0xFuLL);
          v26 = (void *)[objc_alloc((Class)getUIColorClass()) initWithRed:(double)(v21 | (16 * v20)) / 255.0 green:(double)(v23 | (16 * v22)) / 255.0 blue:(double)(v25 | (16 * v24)) / 255.0 alpha:1.0];
          [v17 addObject:v26];
        }
        a5 += 7;
      }
    }
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v17];

    colors = v12->_colors;
    v12->_colors = (NSArray *)v27;

    int v29 = a7;
    if (a7 == -1) {
      int v29 = 0;
    }
    v12->_level = a6;
    v12->_lowLevel = v29;
    if (v35 == -1) {
      int v30 = 100;
    }
    else {
      int v30 = v35;
    }
    v12->_highLevel = v30;
    if (v29 && v30 == 100)
    {
      uint64_t v31 = 3;
    }
    else if (v29 || v30 == 100)
    {
      uint64_t v32 = 0;
      v33 = (const char **)&qword_2649EF120;
      while (strcmp(__s1, *(v33 - 1)) && (((0x380404317uLL >> v32) & 1) != 0 || strcmp(__s1, *v33)))
      {
        ++v32;
        v33 += 3;
        if (v32 == 36) {
          goto LABEL_25;
        }
      }
      if (v32 < 0x24) {
        goto LABEL_26;
      }
LABEL_25:
      LODWORD(v32) = 1;
LABEL_26:
      uint64_t v31 = *((void *)&_supply_type_for_type(char const*)::markers + 3 * v32);
    }
    else
    {
      uint64_t v31 = 4;
    }
    v12->_supplyType = v31;
  }
  return v12;
}

- (NSString)description
{
  v20[9] = *MEMORY[0x263EF8340];
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"PKSupply <%p> {", self);
  v20[0] = v19;
  v3 = NSString;
  size_t v18 = [(PKSupply *)self name];
  size_t v4 = [v3 stringWithFormat:@"\tname: %@", v18];
  v20[1] = v4;
  v5 = NSString;
  v6 = [(PKSupply *)self markerType];
  v7 = [v5 stringWithFormat:@"\tmarkerType: %@", v6];
  v20[2] = v7;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"\tsupplyType: %lu", -[PKSupply supplyType](self, "supplyType"));
  v20[3] = v8;
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"\tlevel: %d", -[PKSupply level](self, "level"));
  v20[4] = v9;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"\tlowLevel: %d", -[PKSupply lowLevel](self, "lowLevel"));
  v20[5] = v10;
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"\thighLevel: %d", -[PKSupply highLevel](self, "highLevel"));
  v20[6] = v11;
  v12 = NSString;
  uint64_t v13 = [(PKSupply *)self colors];
  v14 = [v12 stringWithFormat:@"\tcolors: %@", v13];
  v20[7] = v14;
  v20[8] = @"}";
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:9];

  v16 = [v15 componentsJoinedByString:@"\n"];

  return (NSString *)v16;
}

- (id)userCodableDictionary
{
  v3 = objc_opt_new();
  size_t v4 = [(PKSupply *)self name];

  if (v4)
  {
    v5 = [(PKSupply *)self name];
    [v3 setObject:v5 forKey:@"name"];
  }
  v6 = [(PKSupply *)self markerType];

  if (v6)
  {
    v7 = [(PKSupply *)self markerType];
    [v3 setObject:v7 forKey:@"markerType"];
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[PKSupply lowLevel](self, "lowLevel"));
  [v3 setObject:v8 forKey:@"lowLevel"];

  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[PKSupply highLevel](self, "highLevel"));
  [v3 setObject:v9 forKey:@"highLevel"];

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKSupply supplyType](self, "supplyType"));
  [v3 setObject:v10 forKey:@"supplyType"];

  v11 = [(PKSupply *)self colors];

  if (v11)
  {
    id v12 = [(PKSupply *)self colors];
    uint64_t v13 = objc_opt_new();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = ___ZL21makeUserCodableColorsP7NSArray_block_invoke;
    v17[3] = &unk_2649EF478;
    id v14 = v13;
    id v18 = v14;
    [v12 enumerateObjectsUsingBlock:v17];

    [v3 setObject:v14 forKey:@"colors"];
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", -[PKSupply level](self, "level"));
  [v3 setObject:v15 forKey:@"level"];

  return v3;
}

- (NSArray)colors
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)level
{
  return self->_level;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)markerType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int)lowLevel
{
  return self->_lowLevel;
}

- (int)highLevel
{
  return self->_highLevel;
}

- (int64_t)supplyType
{
  return self->_supplyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerType, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end
@interface TTKSimpleKeyboardPlane
+ (float)keyplaneHeightForKeys:(id)a3;
+ (float)keyplaneWidthForKeys:(id)a3;
- (NSArray)keys;
- (NSString)name;
- (TTKSimpleKeyboardPlane)initWithJsonDictionary:(id)a3;
- (TTKSimpleKeyboardPlane)initWithName:(id)a3 keys:(id)a4;
- (TTKSimpleKeyboardPlane)initWithTIKeyboardLayout:(id)a3;
- (float)keyboardWidth;
- (id)keyboardOrientation;
- (id)toJsonDictionary;
@end

@implementation TTKSimpleKeyboardPlane

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSString)name
{
  return self->_name;
}

- (id)keyboardOrientation
{
  v3 = objc_opt_class();
  v4 = [(TTKSimpleKeyboardPlane *)self keys];
  [v3 keyplaneWidthForKeys:v4];
  float v6 = v5;

  v7 = objc_opt_class();
  v8 = [(TTKSimpleKeyboardPlane *)self keys];
  [v7 keyplaneHeightForKeys:v8];
  float v10 = v9;

  uint64_t v11 = 0;
  id result = @"Portrait";
  while (1)
  {
    float v13 = flt_23F04A564[v11];
    float v14 = v13 + -2.0;
    float v15 = v13 + 2.0;
    if (v14 < v6 && v6 < v15) {
      break;
    }
    if (++v11 == 7) {
      return result;
    }
  }
  if (v11 != 4) {
    return @"Landscape";
  }
  float v17 = v6 / v10;
  if (v10 <= 0.0) {
    float v17 = 2.923;
  }
  if (v17 > 3.0) {
    return @"Portrait";
  }
  else {
    return @"Landscape";
  }
}

- (float)keyboardWidth
{
  v3 = objc_opt_class();
  v4 = [(TTKSimpleKeyboardPlane *)self keys];
  [v3 keyplaneWidthForKeys:v4];
  float v6 = v5;

  if (v6 > 317.0 && v6 < 323.0) {
    return 320.0;
  }
  uint64_t v8 = 1;
  while (v8 != 12)
  {
    uint64_t v9 = v8;
    float result = flt_23F04A534[v8++];
    if ((float)(result + -3.0) < v6 && v6 < (float)(result + 3.0))
    {
      if ((unint64_t)(v9 - 1) < 0xB) {
        return result;
      }
      return roundf(v6);
    }
  }
  return roundf(v6);
}

- (id)toJsonDictionary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v5 = self->_keys;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        float v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toJsonDictionary", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"keys"];
  return v3;
}

- (TTKSimpleKeyboardPlane)initWithJsonDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTKSimpleKeyboardPlane;
  float v5 = [(TTKSimpleKeyboardPlane *)&v20 init];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  if (v5)
  {
    uint64_t v7 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    uint64_t v9 = [v4 objectForKey:@"keys"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [[TTKSimpleKey alloc] initWithJsonDictionary:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
          [v6 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
    objc_storeStrong((id *)&v5->_keys, v6);
  }
  return v5;
}

- (TTKSimpleKeyboardPlane)initWithName:(id)a3 keys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTKSimpleKeyboardPlane;
  uint64_t v9 = [(TTKSimpleKeyboardPlane *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_keys, a4);
  }

  return v10;
}

- (TTKSimpleKeyboardPlane)initWithTIKeyboardLayout:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__735;
  v24 = __Block_byref_object_dispose__736;
  id v25 = [MEMORY[0x263EFF980] array];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__TTKSimpleKeyboardPlane_initWithTIKeyboardLayout___block_invoke;
  v19[3] = &unk_26504FB18;
  v19[4] = &v20;
  [v4 enumerateKeysUsingBlock:v19];
  v18.receiver = self;
  v18.super_class = (Class)TTKSimpleKeyboardPlane;
  float v5 = [(TTKSimpleKeyboardPlane *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    p_keys = &v5->_keys;
    objc_storeStrong((id *)&v5->_keys, (id)v21[5]);
    id v8 = NSString;
    uint64_t v9 = [(TTKSimpleKeyboardPlane *)v6 keyboardOrientation];
    uint64_t v10 = NSNumber;
    [(id)objc_opt_class() keyplaneWidthForKeys:*p_keys];
    uint64_t v11 = objc_msgSend(v10, "numberWithFloat:");
    objc_super v12 = NSNumber;
    [(id)objc_opt_class() keyplaneHeightForKeys:*p_keys];
    uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
    uint64_t v14 = [v8 stringWithFormat:@"%@_%@_%@", v9, v11, v13];
    name = v6->_name;
    v6->_name = (NSString *)v14;
  }
  long long v16 = v6;
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __51__TTKSimpleKeyboardPlane_initWithTIKeyboardLayout___block_invoke(uint64_t a1, uint64_t a2, __int16 a3, double a4, double a5, double a6, double a7)
{
  if (a2)
  {
    id v14 = [NSString stringWithUTF8String:a2];
    uint64_t v13 = -[TTKSimpleKey initWithString:frame:keyCode:]([TTKSimpleKey alloc], "initWithString:frame:keyCode:", v14, a3, a4, a5, a6, a7);
    if (v13) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v13];
    }
  }
}

+ (float)keyplaneHeightForKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v11) frame];
        v27.origin.CGFloat x = v12;
        v27.origin.CGFloat y = v13;
        v27.size.CGFloat width = v14;
        v27.size.CGFloat height = v15;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectUnion(v24, v27);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v26);

  return v16;
}

+ (float)keyplaneWidthForKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v11) frame];
        v27.origin.CGFloat x = v12;
        v27.origin.CGFloat y = v13;
        v27.size.CGFloat width = v14;
        v27.size.CGFloat height = v15;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectUnion(v24, v27);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v26);

  return v16;
}

@end
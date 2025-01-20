@interface TTSNeuralStyle
- (NSArray)styleVector;
- (NSString)key;
- (NSString)name;
- (TTSNeuralStyle)initWithName:()basic_string<char vector:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (vector<float,)getStyleVector;
- (void)setKey:(id)a3;
- (void)setName:(id)a3;
- (void)setStyleVector:(id)a3;
@end

@implementation TTSNeuralStyle

- (TTSNeuralStyle)initWithName:()basic_string<char vector:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  uint64_t v4 = v3;
  v21.receiver = self;
  v21.super_class = (Class)TTSNeuralStyle;
  v6 = [(TTSNeuralStyle *)&v21 init];
  if (v6)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v9 = *(_DWORD **)v4;
    v10 = *(_DWORD **)(v4 + 8);
    if (*(_DWORD **)v4 != v10)
    {
      do
      {
        LODWORD(v8) = *v9;
        v11 = [NSNumber numberWithFloat:v8];
        [(NSArray *)v7 addObject:v11];

        ++v9;
      }
      while (v9 != v10);
    }
    if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    }
    v12 = objc_msgSend(NSString, "stringWithCString:encoding:", var0, objc_msgSend(NSString, "defaultCStringEncoding"));
    uint64_t v13 = [v12 copy];
    key = v6->_key;
    v6->_key = (NSString *)v13;

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:v6->_key value:0 table:@"SiriStyles"];
    name = v6->_name;
    v6->_name = (NSString *)v16;

    if (!v6->_name)
    {

      v19 = 0;
      goto LABEL_10;
    }
    styleVector = v6->_styleVector;
    v6->_styleVector = v7;
  }
  v19 = v6;
LABEL_10:

  return v19;
}

- (vector<float,)getStyleVector
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [(TTSNeuralStyle *)self styleVector];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) floatValue];
        int v9 = v8;
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          uint64_t v13 = retstr->var0;
          uint64_t v14 = var1 - retstr->var0;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v16 = (char *)var0 - (char *)v13;
          if (v16 >> 1 > v15) {
            unint64_t v15 = v16 >> 1;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            v18 = (char *)std::allocator<float>::allocate_at_least[abi:ne180100]((uint64_t)&retstr->var2, v17);
            uint64_t v13 = retstr->var0;
            var1 = retstr->var1;
          }
          else
          {
            v18 = 0;
          }
          v19 = (float *)&v18[4 * v14];
          *(_DWORD *)v19 = v9;
          v12 = v19 + 1;
          while (var1 != v13)
          {
            int v20 = *((_DWORD *)var1-- - 1);
            *((_DWORD *)v19-- - 1) = v20;
          }
          retstr->var0 = v19;
          retstr->var1 = v12;
          retstr->var2.var0 = (float *)&v18[4 * v17];
          if (v13) {
            operator delete(v13);
          }
        }
        else
        {
          *(_DWORD *)var1 = v8;
          v12 = var1 + 1;
        }
        retstr->var1 = v12;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSArray)styleVector
{
  return self->_styleVector;
}

- (void)setStyleVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleVector, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
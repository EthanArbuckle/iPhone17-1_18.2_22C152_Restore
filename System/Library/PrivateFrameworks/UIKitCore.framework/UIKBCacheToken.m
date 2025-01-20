@interface UIKBCacheToken
+ (id)tokenForKey:(id)a3 style:(id)a4;
+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5;
+ (id)tokenForKeyMask:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5;
+ (id)tokenForKeyplane:(id)a3;
+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5;
+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6;
+ (id)tokenTemplateForKey:(id)a3 style:(int)a4 size:(CGSize)a5;
- ($5C396DA91E87D63640AC871340DC94CC)styling;
- (BOOL)hasKey;
- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4;
- (CGSize)size;
- (NSSet)transformationIdentifiers;
- (NSString)name;
- (NSString)string;
- (UIKBCacheToken)initWithComponents:(id)a3 name:(id)a4;
- (UIKBCacheToken)initWithName:(id)a3;
- (double)scale;
- (id)description;
- (id)stringForComponentArray:(id)a3 additionalValues:(id)a4;
- (id)stringForConstruction:(id)a3;
- (id)stringForKey:(id)a3 state:(int)a4;
- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4;
- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4;
- (id)stringForState:(int)a3;
- (int)_writeArray:(id)a3 toStr:(char *)a4 maxLen:(int)a5;
- (int)_writeEdgeInsets:(UIEdgeInsets)a3 toStr:(char *)a4 maxLen:(int)a5;
- (int)_writeNumber:(float)a3 toStr:(char *)a4;
- (int)_writeString:(id)a3 toStr:(char *)a4 maxLen:(int)a5;
- (int)displayHint;
- (int)emptyFields;
- (int)rowHint;
- (int64_t)renderFlags;
- (void)setEmptyFields:(int)a3;
- (void)setName:(id)a3;
- (void)setRenderFlags:(int64_t)a3;
- (void)setScale:(double)a3;
- (void)setTransformationIdentifiers:(id)a3;
@end

@implementation UIKBCacheToken

- (UIKBCacheToken)initWithName:(id)a3
{
  return [(UIKBCacheToken *)self initWithComponents:0 name:a3];
}

- (UIKBCacheToken)initWithComponents:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIKBCacheToken;
  v9 = [(UIKBCacheToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_components, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v10->_emptyFields = 0;
  }

  return v10;
}

- (CGSize)size
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)rowHint
{
  return 0;
}

- (int)displayHint
{
  return 0;
}

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)0;
}

- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4
{
  return 0;
}

- (BOOL)hasKey
{
  return 0;
}

- (int)_writeString:(id)a3 toStr:(char *)a4 maxLen:(int)a5
{
  int result = 0;
  if (a3)
  {
    if ((a5 & 0x80000000) == 0)
    {
      uint64_t v9 = 0;
      uint64_t v7 = a5;
      id v8 = a3;
      objc_msgSend(v8, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a4, v7, &v9, 4, 0, 0, objc_msgSend(v8, "length"), 0);

      return v9;
    }
  }
  return result;
}

- (int)_writeNumber:(float)a3 toStr:(char *)a4
{
  float v4 = (float)(int)a3;
  if ((int)a3 <= 9 && v4 == a3)
  {
    *a4 = (int)a3 + 48;
    return 1;
  }
  else
  {
    if (a3 >= 0.0)
    {
      int v6 = 0;
    }
    else
    {
      *a4 = 45;
      a3 = -a3;
      float v4 = (float)(int)a3;
      int v6 = 1;
    }
    char v8 = 0;
    float v9 = 1.0;
    if (a3 != v4) {
      float v9 = 0.1;
    }
    float v10 = *(float *)"(knN";
    do
    {
      while (1)
      {
        int v11 = (int)(float)(a3 / v10);
        if ((v8 & 1) == 0 && v11 < 1) {
          break;
        }
        if (v10 == 0.1) {
          a4[v6++] = 46;
        }
        int result = v6 + 1;
        a4[v6] = v11 + 48;
        a3 = a3 - (float)(v10 * (float)v11);
        float v10 = v10 / 10.0;
        char v8 = 1;
        ++v6;
        if (v10 < v9) {
          return result;
        }
      }
      char v8 = 0;
      float v10 = v10 / 10.0;
    }
    while (v10 >= v9);
    int result = v6 + 1;
    a4[v6] = 48;
  }
  return result;
}

- (int)_writeEdgeInsets:(UIEdgeInsets)a3 toStr:(char *)a4 maxLen:(int)a5
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  int v11 = [(UIKBCacheToken *)self _writeString:@"insets:{" toStr:a4 maxLen:*(void *)&a5];
  *(float *)&double v12 = top;
  uint64_t v13 = [(UIKBCacheToken *)self _writeNumber:&a4[v11] toStr:v12] + (uint64_t)v11;
  a4[v13] = 44;
  *(float *)&double v14 = left;
  uint64_t v15 = (int)v13 + 1 + [(UIKBCacheToken *)self _writeNumber:&a4[(int)v13 + 1] toStr:v14];
  a4[v15] = 44;
  *(float *)&double v16 = bottom;
  uint64_t v17 = (int)v15 + 1 + [(UIKBCacheToken *)self _writeNumber:&a4[(int)v15 + 1] toStr:v16];
  a4[v17] = 44;
  *(float *)&double v18 = right;
  uint64_t v19 = (int)v17 + 1 + [(UIKBCacheToken *)self _writeNumber:&a4[(int)v17 + 1] toStr:v18];
  int result = v19 + 1;
  a4[v19] = 125;
  return result;
}

- (int)_writeArray:(id)a3 toStr:(char *)a4 maxLen:(int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [(UIKBCacheToken *)self _writeString:v13 toStr:&a4[v10] maxLen:(a5 - v10)]+ v10;
          int v10 = v14 & ((int)v14 >> 31);
          uint64_t v15 = &a4[v14 - 1];
          while (1)
          {
            BOOL v16 = __OFSUB__(v14, 1);
            LODWORD(v14) = v14 - 1;
            if ((int)v14 < 0 != v16) {
              break;
            }
            if (*v15--)
            {
              int v10 = v14 + 1;
              break;
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v13 floatValue];
            int v18 = -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[v10]);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_16;
            }
            [v13 UIEdgeInsetsValue];
            int v18 = -[UIKBCacheToken _writeEdgeInsets:toStr:maxLen:](self, "_writeEdgeInsets:toStr:maxLen:", &a4[v10], (a5 - v10));
          }
          v10 += v18;
        }
LABEL_16:
        a4[v10++] = 59;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v9) {
        goto LABEL_20;
      }
    }
  }
  int v10 = 0;
LABEL_20:

  return v10;
}

- (id)stringForConstruction:(id)a3
{
  v5 = (int (**)(id, void *, uint64_t))a3;
  if (!v5) {
    goto LABEL_5;
  }
  int v6 = malloc_type_malloc(0x100uLL, 0x19488C48uLL);
  if (v6)
  {
    int v6 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v5[2](v5, v6, 256), 4, 1);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"UIKBCacheToken.m", 193, @"Invalid key string for token: %@", self object file lineNumber description];

LABEL_5:
      int v6 = 0;
    }
  }

  return v6;
}

- (id)stringForComponentArray:(id)a3 additionalValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__UIKBCacheToken_stringForComponentArray_additionalValues___block_invoke;
  v12[3] = &unk_1E52F3D38;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  int v10 = [(UIKBCacheToken *)self stringForConstruction:v12];

  return v10;
}

uint64_t __59__UIKBCacheToken_stringForComponentArray_additionalValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) _writeArray:*(void *)(a1 + 40) toStr:a2 maxLen:a3];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2 + (int)v6, a3)
  }
         + v6;
  return v6;
}

- (NSString)string
{
  return (NSString *)[(UIKBCacheToken *)self stringForComponentArray:self->_components additionalValues:0];
}

- (id)stringForKey:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(UIKBCacheToken *)self emptyFields] == 1)
  {
    uint64_t v7 = [(UIKBCacheToken *)self stringForState:v4];
  }
  else
  {
    id v8 = NSString;
    id v9 = [(UIKBCacheToken *)self string];
    int v10 = [v6 cacheDisplayString];
    uint64_t v7 = [v8 stringWithValidatedFormat:v9, @"%@ %d %d %d", 0, v10, objc_msgSend(v6, "displayTypeHint"), v4, objc_msgSend(v6, "clipCorners") validFormatSpecifiers error];
  }
  return v7;
}

- (id)stringForState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = NSString;
  v5 = [(UIKBCacheToken *)self string];
  id v6 = objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%d", 0, v3);

  return v6;
}

- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(NSMutableArray *)self->_components count];
  if (v5) {
    id v8 = @"split";
  }
  else {
    id v8 = @"default";
  }
  if (v5) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v5) {
    uint64_t v10 = v7 - 3;
  }
  else {
    uint64_t v10 = v7;
  }
  uint64_t v11 = -[NSMutableArray subarrayWithRange:](self->_components, "subarrayWithRange:", v9, v10);
  double v12 = [(UIKBCacheToken *)self stringForComponentArray:v11 additionalValues:0];
  id v13 = [MEMORY[0x1E4F28E78] stringWithString:v8];
  id v14 = v13;
  if (a4)
  {
    uint64_t v15 = @"right";
    if (a4 == 2) {
      uint64_t v15 = @"left";
    }
    [v13 appendFormat:@"_%@", v15];
  }
  if ([(NSSet *)self->_transformationIdentifiers count])
  {
    BOOL v16 = [(NSSet *)self->_transformationIdentifiers allObjects];
    uint64_t v17 = [v16 componentsJoinedByString:@","];
    [v14 appendFormat:@"t:%@;", v17];
  }
  int v18 = [NSString stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];

  return v18;
}

- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4
{
  components = self->_components;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__UIKBCacheToken_stringForRenderFlags_lightKeyboard___block_invoke;
  v7[3] = &unk_1E52F3D60;
  BOOL v8 = a4;
  v7[4] = self;
  v7[5] = a3;
  BOOL v5 = [(UIKBCacheToken *)self stringForComponentArray:components additionalValues:v7];
  return v5;
}

uint64_t __53__UIKBCacheToken_stringForRenderFlags_lightKeyboard___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LOBYTE(a3) = *(unsigned char *)(a1 + 48);
  *(float *)&a3 = (float)LODWORD(a3);
  int v5 = [*(id *)(a1 + 32) _writeNumber:a2 toStr:a3];
  *(unsigned char *)(a2 + v5) = 59;
  *(float *)&double v6 = (float)*(int *)(a1 + 40);
  return v5 + [*(id *)(a1 + 32) _writeNumber:a2 + 2 toStr:v6] + 1;
}

+ (id)tokenForKeyplane:(id)a3
{
  return +[UIKBCacheToken_Keyplane tokenForKeyplane:a3];
}

+ (id)tokenForKey:(id)a3 style:(id)a4
{
  return +[UIKBCacheToken_Key tokenForKey:a3 style:*(void *)&a4];
}

+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  return +[UIKBCacheToken_Key tokenForKey:style:displayInsets:](UIKBCacheToken_Key, "tokenForKey:style:displayInsets:", a3, *(void *)&a4, a5.top, a5.left, a5.bottom, a5.right);
}

+ (id)tokenForKeyMask:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  return +[UIKBCacheToken_KeyMask tokenForKey:style:displayInsets:](UIKBCacheToken_KeyMask, "tokenForKey:style:displayInsets:", a3, *(void *)&a4, a5.top, a5.left, a5.bottom, a5.right);
}

+ (id)tokenTemplateForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = [v8 name];
  uint64_t v10 = +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v8, v9, v7, width, height);

  return v10;
}

+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6
{
  return +[UIKBCacheToken_KeyTemplate tokenTemplateForKey:name:style:size:](UIKBCacheToken_KeyTemplate, "tokenTemplateForKey:name:style:size:", a3, a4, *(void *)&a5, a6.width, a6.height);
}

+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  return +[UIKBCacheToken_KeyFilledTemplate tokenTemplateFilledForKey:style:size:](UIKBCacheToken_KeyFilledTemplate, "tokenTemplateFilledForKey:style:size:", a3, *(void *)&a4, a5.width, a5.height);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBCacheToken;
  uint64_t v3 = [(UIKBCacheToken *)&v7 description];
  uint64_t v4 = [(UIKBCacheToken *)self string];
  int v5 = [v3 stringByAppendingFormat:@" <%@>", v4];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int)emptyFields
{
  return self->_emptyFields;
}

- (void)setEmptyFields:(int)a3
{
  self->_emptyFields = a3;
}

- (int64_t)renderFlags
{
  return self->_renderFlags;
}

- (void)setRenderFlags:(int64_t)a3
{
  self->_renderFlags = a3;
}

- (NSSet)transformationIdentifiers
{
  return self->_transformationIdentifiers;
}

- (void)setTransformationIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformationIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

uint64_t __56__UIKBCacheToken_Keyplane_stringForSplitState_handBias___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  if (*(unsigned char *)(a1 + 48))
  {
    int v7 = 0;
  }
  else
  {
    id v8 = *(double **)(a1 + 32);
    double v9 = v8[7];
    *(float *)&double v9 = v9;
    int v10 = [v8 _writeNumber:a2 toStr:v9];
    *(unsigned char *)(a2 + v10) = 59;
    uint64_t v11 = v10 + 1;
    double v12 = *(double **)(a1 + 32);
    double v13 = v12[8];
    *(float *)&double v13 = v13;
    uint64_t v14 = (int)[v12 _writeNumber:a2 + v11 toStr:v13] + (uint64_t)(int)v11;
    int v15 = v14 + 1;
    *(unsigned char *)(a2 + v14) = 59;
    int v16 = [*(id *)(a1 + 32) _writeString:*(void *)(*(void *)(a1 + 32) + 80) toStr:a2 + v14 + 1 maxLen:(a3 - (v14 + 1))];
    int v7 = v16 + v15 + 1;
    *(unsigned char *)(a2 + v16 + v15) = 59;
  }
  uint64_t v17 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v17[18];
  uint64_t v18 = (int)[v17 _writeNumber:a2 + v7 toStr:a4] + (uint64_t)v7;
  *(unsigned char *)(a2 + v18) = 59;
  uint64_t v19 = (int)v18
      + 1
      + (int)[*(id *)(a1 + 32) _writeString:*(void *)(*(void *)(a1 + 32) + 88) toStr:a2 + (int)v18 + 1 maxLen:(a3 - (v18 + 1))];
  uint64_t v20 = (int)v19 + 1;
  *(unsigned char *)(a2 + v19) = 59;
  long long v21 = +[UIKeyboardPreferencesController sharedPreferencesController];
  long long v22 = [v21 preferencesActions];
  int v23 = [v22 BOOLForPreferenceKey:@"GesturesEnabled"];

  long long v24 = *(void **)(a1 + 32);
  if (v23)
  {
    uint64_t v25 = v24[12];
    if (v25)
    {
      uint64_t v26 = v20 + (int)[v24 _writeString:v25 toStr:a2 + (int)v20 maxLen:(a3 - v20)];
      *(unsigned char *)(a2 + v26) = 59;
      uint64_t v27 = (int)v26
          + 1
          + (int)[*(id *)(a1 + 32) _writeString:*(void *)(*(void *)(a1 + 32) + 112) toStr:a2 + (int)v26 + 1 maxLen:(a3 - (v26 + 1))];
      LODWORD(v20) = v27 + 1;
      *(unsigned char *)(a2 + v27) = 59;
      long long v24 = *(void **)(a1 + 32);
    }
  }
  uint64_t v28 = v24[13];
  if (v28)
  {
    uint64_t v29 = (int)[v24 _writeString:v28 toStr:a2 + (int)v20 maxLen:(a3 - v20)]
        + (uint64_t)(int)v20;
    LODWORD(v20) = v29 + 1;
    *(unsigned char *)(a2 + v29) = 59;
    long long v24 = *(void **)(a1 + 32);
  }
  if (*(unsigned char *)(a1 + 48)) {
    v30 = @"split";
  }
  else {
    v30 = @"default";
  }
  uint64_t v31 = (int)[v24 _writeString:v30 toStr:a2 + (int)v20 maxLen:(a3 - v20)]
      + (uint64_t)(int)v20;
  uint64_t v32 = *(void *)(a1 + 40);
  if (v32)
  {
    if (v32 == 2) {
      v33 = @"left";
    }
    else {
      v33 = @"right";
    }
    LODWORD(v31) = [*(id *)(a1 + 32) _writeString:v33 toStr:a2 + v31 maxLen:(a3 - v31)]
                 + v31;
  }
  uint64_t v34 = (int)v31 + 1;
  *(unsigned char *)(a2 + (int)v31) = 59;
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    v35 = NSString;
    v36 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
    v37 = [v36 componentsJoinedByString:@","];
    v38 = [v35 stringWithFormat:@"t:%@;", v37];

    uint64_t v34 = [*(id *)(a1 + 32) _writeString:v38 toStr:a2 + v34 maxLen:(a3 - v34)]+ v34;
  }
  v39 = *(double **)(a1 + 32);
  double v40 = v39[3];
  if (v40 > 0.0)
  {
    *(float *)&double v40 = v40;
    return [v39 _writeNumber:a2 + (int)v34 toStr:v40] + v34;
  }
  return v34;
}

uint64_t __50__UIKBCacheToken_Key__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 56) &= 0xFFFFFFu;
  int v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  int v8 = [v7 _writeNumber:a2 toStr:a4];
  *(unsigned char *)(a2 + v8) = 59;
  uint64_t v9 = (int)[*(id *)(a1 + 32) _writeString:*(void *)(*(void *)(a1 + 32) + 64) toStr:a2 + v8 + 1 maxLen:(a3 - (v8 + 1))]+ (uint64_t)(v8 + 1);
  uint64_t v11 = v9 + 1;
  *(unsigned char *)(a2 + v9) = 59;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v12 + 72);
  if (v13)
  {
    int v14 = [(id)v12 _writeString:v13 toStr:a2 + v11 maxLen:(a3 - v11)] + v11;
    LODWORD(v11) = v14 + 1;
    *(unsigned char *)(a2 + v14) = 59;
    uint64_t v12 = *(void *)(a1 + 32);
  }
  uint64_t v15 = *(void *)(v12 + 80);
  if (v15)
  {
    uint64_t v16 = (int)[(id)v12 _writeString:v15 toStr:a2 + (int)v11 maxLen:(a3 - v11)]
        + (uint64_t)(int)v11;
    LODWORD(v11) = v16 + 1;
    *(unsigned char *)(a2 + v16) = 59;
    uint64_t v12 = *(void *)(a1 + 32);
  }
  *(float *)&double v10 = (float)*(int *)(v12 + 88);
  uint64_t v17 = (int)[(id)v12 _writeNumber:a2 + (int)v11 toStr:v10] + (uint64_t)(int)v11;
  *(unsigned char *)(a2 + v17) = 59;
  uint64_t v18 = *(int **)(a1 + 32);
  *(float *)&double v19 = (float)v18[23];
  uint64_t v20 = (int)v17 + 1 + (int)[v18 _writeNumber:a2 + (int)v17 + 1 toStr:v19];
  *(unsigned char *)(a2 + v20) = 59;
  long long v21 = *(double **)(a1 + 32);
  double v22 = v21[12];
  *(float *)&double v22 = v22;
  uint64_t v23 = (int)v20 + 1 + (int)[v21 _writeNumber:a2 + (int)v20 + 1 toStr:v22];
  *(unsigned char *)(a2 + v23) = 59;
  long long v24 = *(double **)(a1 + 32);
  double v25 = v24[13];
  *(float *)&double v25 = v25;
  uint64_t v26 = (int)v23 + 1 + (int)[v24 _writeNumber:a2 + (int)v23 + 1 toStr:v25];
  uint64_t v28 = (int)v26 + 1;
  *(unsigned char *)(a2 + v26) = 59;
  uint64_t v29 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v29 + 136))
  {
    uint64_t v30 = v28
        + (int)objc_msgSend((id)v29, "_writeEdgeInsets:toStr:maxLen:", a2 + (int)v28, (a3 - v28), *(double *)(v29 + 144), *(double *)(v29 + 152), *(double *)(v29 + 160), *(double *)(v29 + 168));
    LODWORD(v28) = v30 + 1;
    *(unsigned char *)(a2 + v30) = 59;
    uint64_t v29 = *(void *)(a1 + 32);
  }
  *(float *)&double v27 = (float)*(unsigned int *)(v29 + 112);
  uint64_t v31 = (int)[(id)v29 _writeNumber:a2 + (int)v28 toStr:v27] + (uint64_t)(int)v28;
  *(unsigned char *)(a2 + v31) = 59;
  uint64_t v32 = *(unint64_t **)(a1 + 32);
  *(float *)&double v33 = (float)v32[15];
  uint64_t v34 = (int)v31 + 1 + (int)[v32 _writeNumber:a2 + (int)v31 + 1 toStr:v33];
  *(unsigned char *)(a2 + v34) = 59;
  v35 = *(unint64_t **)(a1 + 32);
  *(float *)&double v36 = (float)v35[16];
  uint64_t v37 = (int)v34 + 1 + (int)[v35 _writeNumber:a2 + (int)v34 + 1 toStr:v36];
  if (*(double *)(*(void *)(a1 + 32) + 24) > 0.0)
  {
    *(unsigned char *)(a2 + v37) = 59;
    v38 = *(double **)(a1 + 32);
    double v39 = v38[3];
    *(float *)&double v39 = v39;
    uint64_t v37 = [v38 _writeNumber:a2 + (int)v37 + 1 toStr:v39] + v37 + 1;
  }
  uint64_t v40 = *(void *)(a1 + 40);
  if (v40) {
    return (*(unsigned int (**)(uint64_t, uint64_t, void))(v40 + 16))(v40, a2 + (int)v37, (a3 - v37))+ v37;
  }
  return v37;
}

uint64_t __57__UIKBCacheToken_Key_stringForRenderFlags_lightKeyboard___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  *a2 = 59;
  LOBYTE(a3) = *(unsigned char *)(a1 + 48);
  *(float *)&a3 = (float)LODWORD(a3);
  int v5 = [*(id *)(a1 + 32) _writeNumber:a2 + 1 toStr:a3];
  a2[v5 + 1] = 59;
  *(float *)&double v6 = (float)*(int *)(a1 + 40);
  return [*(id *)(a1 + 32) _writeNumber:&a2[v5 + 2] toStr:v6] + v5 + 2;
}

uint64_t __54__UIKBCacheToken_KeyMask__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  int v8 = [v7 _writeNumber:a2 toStr:a4];
  uint64_t v9 = v8 + 1;
  *(unsigned char *)(a2 + v8) = 59;
  double v10 = *(double **)(a1 + 32);
  double v11 = v10[12];
  *(float *)&double v11 = v11;
  uint64_t v12 = (int)[v10 _writeNumber:a2 + v9 toStr:v11] + (uint64_t)(int)v9;
  *(unsigned char *)(a2 + v12) = 59;
  uint64_t v13 = *(double **)(a1 + 32);
  double v14 = v13[13];
  *(float *)&double v14 = v14;
  uint64_t v15 = (int)[v13 _writeNumber:a2 + v12 + 1 toStr:v14] + (uint64_t)((int)v12 + 1);
  *(unsigned char *)(a2 + v15) = 59;
  uint64_t v16 = (int)objc_msgSend(*(id *)(a1 + 32), "_writeEdgeInsets:toStr:maxLen:", a2 + v15 + 1, (a3 - (v15 + 1)), *(double *)(*(void *)(a1 + 32) + 144), *(double *)(*(void *)(a1 + 32) + 152), *(double *)(*(void *)(a1 + 32) + 160), *(double *)(*(void *)(a1 + 32) + 168))+ (uint64_t)((int)v15 + 1);
  *(unsigned char *)(a2 + v16) = 59;
  uint64_t v17 = *(unsigned int **)(a1 + 32);
  *(float *)&double v18 = (float)v17[28];
  uint64_t v19 = (int)[v17 _writeNumber:a2 + v16 + 1 toStr:v18] + (uint64_t)((int)v16 + 1);
  *(unsigned char *)(a2 + v19) = 59;
  uint64_t v20 = *(unint64_t **)(a1 + 32);
  *(float *)&double v21 = (float)v20[15];
  uint64_t v22 = (int)[v20 _writeNumber:a2 + v19 + 1 toStr:v21] + (uint64_t)((int)v19 + 1);
  *(unsigned char *)(a2 + v22) = 59;
  uint64_t v23 = *(unint64_t **)(a1 + 32);
  *(float *)&double v24 = (float)v23[16];
  uint64_t v25 = (int)[v23 _writeNumber:a2 + v22 + 1 toStr:v24] + (uint64_t)((int)v22 + 1);
  if (*(double *)(*(void *)(a1 + 32) + 24) > 0.0)
  {
    *(unsigned char *)(a2 + v25) = 59;
    uint64_t v26 = *(double **)(a1 + 32);
    double v27 = v26[3];
    *(float *)&double v27 = v27;
    uint64_t v25 = [v26 _writeNumber:a2 + v25 + 1 toStr:v27] + v25 + 1;
  }
  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    return (*(unsigned int (**)(uint64_t, uint64_t, void))(v28 + 16))(v28, a2 + (int)v25, (a3 - v25))+ v25;
  }
  return v25;
}

uint64_t __58__UIKBCacheToken_KeyTemplate__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  int v8 = [v7 _writeNumber:a2 toStr:a4];
  *(unsigned char *)(a2 + v8) = 59;
  uint64_t v9 = (int)[*(id *)(a1 + 32) _writeString:@"%@" toStr:a2 + v8 + 1 maxLen:(a3 - (v8 + 1))]+ (uint64_t)(v8 + 1);
  uint64_t v10 = v9 + 1;
  *(unsigned char *)(a2 + v9) = 59;
  double v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[9];
  if (v12)
  {
    int v13 = [v11 _writeString:v12 toStr:a2 + v10 maxLen:(a3 - v10)] + v10;
    LODWORD(v10) = v13 + 1;
    *(unsigned char *)(a2 + v13) = 59;
    double v11 = *(void **)(a1 + 32);
  }
  uint64_t v14 = v11[10];
  if (v14)
  {
    uint64_t v15 = (int)[v11 _writeString:v14 toStr:a2 + (int)v10 maxLen:(a3 - v10)]
        + (uint64_t)(int)v10;
    LODWORD(v10) = v15 + 1;
    *(unsigned char *)(a2 + v15) = 59;
    double v11 = *(void **)(a1 + 32);
  }
  uint64_t v16 = (int)[v11 _writeString:@"%d" toStr:a2 + (int)v10 maxLen:(a3 - v10)]
      + (uint64_t)(int)v10;
  *(unsigned char *)(a2 + v16) = 59;
  uint64_t v17 = *(int **)(a1 + 32);
  *(float *)&double v18 = (float)v17[23];
  uint64_t v19 = (int)v16 + 1 + (int)[v17 _writeNumber:a2 + (int)v16 + 1 toStr:v18];
  *(unsigned char *)(a2 + v19) = 59;
  uint64_t v20 = *(double **)(a1 + 32);
  double v21 = v20[12];
  *(float *)&double v21 = v21;
  uint64_t v22 = (int)v19 + 1 + (int)[v20 _writeNumber:a2 + (int)v19 + 1 toStr:v21];
  *(unsigned char *)(a2 + v22) = 59;
  uint64_t v23 = *(double **)(a1 + 32);
  double v24 = v23[13];
  *(float *)&double v24 = v24;
  uint64_t v25 = (int)v22 + 1 + (int)[v23 _writeNumber:a2 + (int)v22 + 1 toStr:v24];
  *(unsigned char *)(a2 + v25) = 59;
  uint64_t v26 = (int)v25
      + 1
      + (int)[*(id *)(a1 + 32) _writeString:@"%d" toStr:a2 + (int)v25 + 1 maxLen:(a3 - (v25 + 1))];
  *(unsigned char *)(a2 + v26) = 59;
  uint64_t v27 = (int)v26
      + 1
      + (int)[*(id *)(a1 + 32) _writeString:@"%d" toStr:a2 + (int)v26 + 1 maxLen:(a3 - (v26 + 1))];
  if (*(double *)(*(void *)(a1 + 32) + 24) > 0.0)
  {
    *(unsigned char *)(a2 + v27) = 59;
    uint64_t v28 = *(double **)(a1 + 32);
    double v29 = v28[3];
    *(float *)&double v29 = v29;
    uint64_t v27 = [v28 _writeNumber:a2 + (int)v27 + 1 toStr:v29] + v27 + 1;
  }
  uint64_t v30 = *(void *)(a1 + 40);
  if (v30) {
    return (*(unsigned int (**)(uint64_t, uint64_t, void))(v30 + 16))(v30, a2 + (int)v27, (a3 - v27))+ v27;
  }
  return v27;
}

uint64_t __64__UIKBCacheToken_KeyFilledTemplate__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  int v8 = [v7 _writeNumber:a2 toStr:a4];
  *(unsigned char *)(a2 + v8) = 59;
  uint64_t v9 = (int)[*(id *)(a1 + 32) _writeString:*(void *)(*(void *)(a1 + 32) + 64) toStr:a2 + v8 + 1 maxLen:(a3 - (v8 + 1))]+ (uint64_t)(v8 + 1);
  uint64_t v11 = v9 + 1;
  *(unsigned char *)(a2 + v9) = 59;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v12 + 72);
  if (v13)
  {
    int v14 = [(id)v12 _writeString:v13 toStr:a2 + v11 maxLen:(a3 - v11)] + v11;
    LODWORD(v11) = v14 + 1;
    *(unsigned char *)(a2 + v14) = 59;
    uint64_t v12 = *(void *)(a1 + 32);
  }
  *(float *)&double v10 = (float)*(int *)(v12 + 88);
  uint64_t v15 = (int)[(id)v12 _writeNumber:a2 + (int)v11 toStr:v10] + (uint64_t)(int)v11;
  *(unsigned char *)(a2 + v15) = 59;
  uint64_t v16 = *(int **)(a1 + 32);
  *(float *)&double v17 = (float)v16[23];
  uint64_t v18 = (int)v15 + 1 + (int)[v16 _writeNumber:a2 + (int)v15 + 1 toStr:v17];
  *(unsigned char *)(a2 + v18) = 59;
  uint64_t v19 = *(double **)(a1 + 32);
  double v20 = v19[12];
  *(float *)&double v20 = v20;
  uint64_t v21 = (int)v18 + 1 + (int)[v19 _writeNumber:a2 + (int)v18 + 1 toStr:v20];
  *(unsigned char *)(a2 + v21) = 59;
  uint64_t v22 = *(double **)(a1 + 32);
  double v23 = v22[13];
  *(float *)&double v23 = v23;
  uint64_t v24 = (int)v21 + 1 + (int)[v22 _writeNumber:a2 + (int)v21 + 1 toStr:v23];
  *(unsigned char *)(a2 + v24) = 59;
  uint64_t v25 = (int)v24
      + 1
      + (int)[*(id *)(a1 + 32) _writeString:@"%d" toStr:a2 + (int)v24 + 1 maxLen:(a3 - (v24 + 1))];
  if (*(double *)(*(void *)(a1 + 32) + 24) > 0.0)
  {
    *(unsigned char *)(a2 + v25) = 59;
    uint64_t v26 = *(double **)(a1 + 32);
    double v27 = v26[3];
    *(float *)&double v27 = v27;
    uint64_t v25 = [v26 _writeNumber:a2 + (int)v25 + 1 toStr:v27] + v25 + 1;
  }
  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    return (*(unsigned int (**)(uint64_t, uint64_t, void))(v28 + 16))(v28, a2 + (int)v25, (a3 - v25))+ v25;
  }
  return v25;
}

@end
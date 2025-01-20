@interface _UIPhysicalKeyTranslationMap
+ (BOOL)supportsSecureCoding;
+ (void)enumerateAllCombinationsOfModifiers:(int64_t)a3 staticModifiers:(int64_t)a4 usingBlock:(id)a5;
- (BOOL)areModifiers:(int64_t)a3 minimalExcessOfMask:(int64_t)a4 matching:(id)a5 translator:(id)a6 matchedModifierSubset:(int64_t *)a7 betterMatchFound:(BOOL *)a8;
- (BOOL)keyTranslation:(id *)a3 withModifiers:(int64_t)a4;
- (NSMapTable)translationMap;
- (_UIPhysicalKeyTranslationMap)initWithCoder:(id)a3;
- (_UIPhysicalKeyTranslationMap)initWithKeyCode:(unsigned __int16)a3 action:(unsigned int)a4 modifiers:(int64_t)a5;
- (id)allTranslations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyTranslationWithModifiers:(int64_t)a3 translator:(id)a4;
- (int64_t)originalModifiers;
- (unsigned)keyAction;
- (unsigned)keyCode;
- (void)encodeWithCoder:(id)a3;
- (void)populateAllCombinationsOfModifiers:(int64_t)a3 translator:(id)a4;
- (void)setKeyTranslation:(id)a3 modifiers:(int64_t)a4;
@end

@implementation _UIPhysicalKeyTranslationMap

- (_UIPhysicalKeyTranslationMap)initWithKeyCode:(unsigned __int16)a3 action:(unsigned int)a4 modifiers:(int64_t)a5
{
  unsigned int v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIPhysicalKeyTranslationMap;
  v8 = [(_UIPhysicalKeyTranslationMap *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:512];
    translationMap = v8->_translationMap;
    v8->_translationMap = (NSMapTable *)v9;

    v8->_keyCode = v7;
    v8->_keyAction = a4;
    v8->_originalModifiers = a5;
  }
  return v8;
}

- (id)keyTranslationWithModifiers:(int64_t)a3 translator:(id)a4
{
  id v6 = a4;
  id v11 = 0;
  BOOL v7 = [(_UIPhysicalKeyTranslationMap *)self keyTranslation:&v11 withModifiers:a3];
  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = objc_msgSend(v6, "translationForHIDUsageCode:modifiers:", (unsigned __int16)-[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), a3);

    [(_UIPhysicalKeyTranslationMap *)self setKeyTranslation:v9 modifiers:a3];
    id v8 = (id)v9;
  }

  return v8;
}

- (BOOL)keyTranslation:(id *)a3 withModifiers:(int64_t)a4
{
  id v6 = [(_UIPhysicalKeyTranslationMap *)self translationMap];
  BOOL v7 = NSMapGet(v6, (const void *)(a4 + 1));

  if (!v7
    || ([MEMORY[0x1E4F1CA98] null],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }
  *a3 = v9;

  return v7 != 0;
}

- (void)setKeyTranslation:(id)a3 modifiers:(int64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    _UISpecialKeyInputFromHIDUsage([(_UIPhysicalKeyTranslationMap *)self keyCode]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v6;
  BOOL v7 = [(_UIPhysicalKeyTranslationMap *)self translationMap];
  id v8 = (const void *)[v9 lowercaseString];
  if (!v8) {
    id v8 = (const void *)[MEMORY[0x1E4F1CA98] null];
  }
  NSMapInsert(v7, (const void *)(a4 + 1), v8);
}

+ (void)enumerateAllCombinationsOfModifiers:(int64_t)a3 staticModifiers:(int64_t)a4 usingBlock:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void (**)(id, int64_t, unsigned char *))a5;
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v8.i16[0] = vaddlv_u8(v8);
  LODWORD(v9) = v8.i32[0];
  memset(v17, 0, sizeof(v17));
  if (a3)
  {
    unsigned int v10 = 0;
    int v11 = 0;
    do
    {
      if (((1 << v10) & (unint64_t)a3) != 0) {
        *((void *)v17 + v11++) = (1 << v10) & (unint64_t)a3;
      }
      if (v10 > 0x3E) {
        break;
      }
      ++v10;
    }
    while (v11 < v8.i32[0]);
  }
  int v12 = (int)ldexp(1.0, v8.i32[0]);
  char v16 = 0;
  if (v12 >= 1)
  {
    int v13 = 0;
    if (v9 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v9;
    }
    do
    {
      int64_t v14 = a4;
      if (a3)
      {
        uint64_t v15 = 0;
        int64_t v14 = a4;
        do
        {
          if ((v13 >> v15)) {
            v14 |= *((void *)v17 + v15);
          }
          ++v15;
        }
        while (v9 != v15);
      }
      v7[2](v7, v14, &v16);
      ++v13;
    }
    while (v13 < v12 && !v16);
  }
}

- (void)populateAllCombinationsOfModifiers:(int64_t)a3 translator:(id)a4
{
  id v6 = a4;
  if (![(_UIPhysicalKeyTranslationMap *)self keyAction])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78___UIPhysicalKeyTranslationMap_populateAllCombinationsOfModifiers_translator___block_invoke;
    v7[3] = &unk_1E53041E0;
    v7[4] = self;
    id v8 = v6;
    +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:a3 staticModifiers:0 usingBlock:v7];
  }
}

- (id)allTranslations
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(_UIPhysicalKeyTranslationMap *)self translationMap];
  v5 = NSAllMapTableValues(v4);
  id v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

- (BOOL)areModifiers:(int64_t)a3 minimalExcessOfMask:(int64_t)a4 matching:(id)a5 translator:(id)a6 matchedModifierSubset:(int64_t *)a7 betterMatchFound:(BOOL *)a8
{
  id v14 = a5;
  id v15 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v16.i16[0] = vaddlv_u8(v16);
  __int32 v17 = v16.i32[0];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124___UIPhysicalKeyTranslationMap_areModifiers_minimalExcessOfMask_matching_translator_matchedModifierSubset_betterMatchFound___block_invoke;
  v22[3] = &unk_1E5304208;
  v22[4] = self;
  id v18 = v15;
  id v23 = v18;
  id v19 = v14;
  __int32 v29 = v17;
  id v24 = v19;
  v25 = &v30;
  int64_t v27 = a4;
  v28 = a8;
  v26 = &v34;
  +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:a3 staticModifiers:0 usingBlock:v22];
  if (a7) {
    *a7 = v35[3];
  }
  char v20 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyCode:action:modifiers:", (unsigned __int16)-[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), -[_UIPhysicalKeyTranslationMap keyAction](self, "keyAction"), -[_UIPhysicalKeyTranslationMap originalModifiers](self, "originalModifiers"));
  id v6 = [(_UIPhysicalKeyTranslationMap *)self translationMap];
  uint64_t v7 = [v6 copyWithZone:a3];
  id v8 = (void *)v5[2];
  v5[2] = v7;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIPhysicalKeyTranslationMap)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [v4 decodeInt32ForKey:@"keyCode"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"keyAction"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"modifierFlags"];

  return [(_UIPhysicalKeyTranslationMap *)self initWithKeyCode:v5 action:v6 modifiers:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), @"keyCode");
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIPhysicalKeyTranslationMap keyAction](self, "keyAction"), @"keyAction");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIPhysicalKeyTranslationMap originalModifiers](self, "originalModifiers"), @"modifierFlags");
}

- (NSMapTable)translationMap
{
  return self->_translationMap;
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (unsigned)keyAction
{
  return self->_keyAction;
}

- (int64_t)originalModifiers
{
  return self->_originalModifiers;
}

- (void).cxx_destruct
{
}

@end
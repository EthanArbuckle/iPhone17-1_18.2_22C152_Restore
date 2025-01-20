@interface _UICompoundEffect
+ (BOOL)supportsSecureCoding;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (_UICompoundEffect)initWithCoder:(id)a3;
- (_UICompoundEffect)initWithEffects:(id)a3;
- (id)_allEffects;
- (id)description;
- (int64_t)_expectedUsage;
- (unint64_t)hash;
- (void)_enumerateEffects:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICompoundEffect

- (void).cxx_destruct
{
}

- (int64_t)_expectedUsage
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35___UICompoundEffect__expectedUsage__block_invoke;
  v4[3] = &unk_1E52DD518;
  v4[4] = &v5;
  [(_UICompoundEffect *)self _enumerateEffects:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerateEffects:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_effects;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (_UICompoundEffect)initWithEffects:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UICompoundEffect;
  uint64_t v5 = [(_UICompoundEffect *)&v18 init];
  if (v5)
  {
    id v17 = v4;
    id v6 = v4;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = ___UICompoundEffectFlatten_block_invoke;
          v19[3] = &unk_1E52DD568;
          id v20 = v7;
          [v13 _enumerateEffects:v19];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [v7 copy];
    effects = v5->_effects;
    v5->_effects = (NSArray *)v14;

    id v4 = v17;
  }

  return v5;
}

- (_UICompoundEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICompoundEffect;
  uint64_t v5 = [(UIVisualEffect *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_UICompoundEffectSubEffects"];
    effects = v5->_effects;
    v5->_effects = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICompoundEffect;
  id v4 = a3;
  [(UIVisualEffect *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_effects, @"_UICompoundEffectSubEffects", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_effects hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqualToArray:self->_effects];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_allEffects
{
  return self->_effects;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96___UICompoundEffect__needsUpdateForTransitionFromEnvironment_toEnvironment_changedTraits_usage___block_invoke;
  v17[3] = &unk_1E52DD4F0;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  long long v21 = &v23;
  int64_t v22 = a6;
  id v20 = v15;
  [(_UICompoundEffect *)self _enumerateEffects:v17];
  LOBYTE(self) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)self;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 traitCollection];
  id v11 = [v8 traitCollection];
  id v12 = [v10 changedTraitsFromTraitCollection:v11];

  LOBYTE(a5) = [(_UICompoundEffect *)self _needsUpdateForTransitionFromEnvironment:v9 toEnvironment:v8 changedTraits:v12 usage:a5];
  return a5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p> combinedEffects = %@", v5, self, self->_effects];

  return v6;
}

@end
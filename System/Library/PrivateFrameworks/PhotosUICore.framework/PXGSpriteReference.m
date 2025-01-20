@interface PXGSpriteReference
- (BOOL)hasObjectReference;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)description;
- (PXGLayout)layout;
- (PXGSpriteReference)init;
- (id)_init;
- (id)objectReference;
- (int64_t)layoutVersion;
- (unint64_t)hash;
- (unsigned)spriteIndex;
- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4;
- (void)setIsDynamic:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutVersion:(int64_t)a3;
- (void)setObjectReference:(id)a3;
- (void)setSpriteIndex:(unsigned int)a3;
@end

@implementation PXGSpriteReference

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectReference, 0);
  objc_destroyWeak((id *)&self->_layout);
}

- (void)setObjectReference:(id)a3
{
}

- (id)objectReference
{
  return self->_objectReference;
}

- (void)setIsDynamic:(BOOL)a3
{
  self->_isDynamic = a3;
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (void)setLayout:(id)a3
{
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (void)setLayoutVersion:(int64_t)a3
{
  self->_layoutVersion = a3;
}

- (int64_t)layoutVersion
{
  return self->_layoutVersion;
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unsigned int v7 = [(PXGSpriteReference *)self spriteIndex];
  if (v7 != -1)
  {
    unsigned int v8 = v7;
    id v9 = [(PXGSpriteReference *)self layout];

    if (v9 == v6)
    {
      if ([(PXGSpriteReference *)self isDynamic]
        || (uint64_t v10 = [v12 indexAfterApplyingChangesToIndex:v8], v10 == 0x7FFFFFFFFFFFFFFFLL))
      {
        [(PXGSpriteReference *)self setSpriteIndex:0xFFFFFFFFLL];
      }
      else
      {
        [(PXGSpriteReference *)self setSpriteIndex:v10];
        v11 = [(PXGSpriteReference *)self layout];
        -[PXGSpriteReference setLayoutVersion:](self, "setLayoutVersion:", [v11 version]);
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGSpriteReference *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(PXGSpriteReference *)self isDynamic];
      if (v6 == [(PXGSpriteReference *)v5 isDynamic]
        && (int64_t v7 = [(PXGSpriteReference *)self layoutVersion],
            v7 == [(PXGSpriteReference *)v5 layoutVersion])
        && (unsigned int v8 = [(PXGSpriteReference *)self spriteIndex],
            v8 == [(PXGSpriteReference *)v5 spriteIndex])
        && (BOOL v9 = [(PXGSpriteReference *)self hasObjectReference],
            v9 == [(PXGSpriteReference *)v5 hasObjectReference]))
      {
        if ([(PXGSpriteReference *)self hasObjectReference])
        {
          id v12 = [(PXGSpriteReference *)self objectReference];
          v13 = [(PXGSpriteReference *)v5 objectReference];
          char v10 = [v12 isEqual:v13];
        }
        else
        {
          char v10 = 1;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXGSpriteReference *)self layoutVersion];
  int64_t v4 = v3 ^ [(PXGSpriteReference *)self spriteIndex];
  if ([(PXGSpriteReference *)self hasObjectReference])
  {
    v5 = [(PXGSpriteReference *)self objectReference];
    v4 ^= [v5 hash];
  }
  return [(PXGSpriteReference *)self isDynamic] | (unint64_t)(2 * v4);
}

- (NSString)description
{
  int64_t v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PXGSpriteReference *)self spriteIndex];
  int64_t v7 = [(PXGSpriteReference *)self objectReference];
  unsigned int v8 = [(PXGSpriteReference *)self layout];
  BOOL v9 = [v3 stringWithFormat:@"<%@: %p, spriteIndex=%li, objRef=%@, layout=%@, version=%li>", v5, self, v6, v7, v8, -[PXGSpriteReference layoutVersion](self, "layoutVersion")];

  return (NSString *)v9;
}

- (BOOL)hasObjectReference
{
  v2 = [(PXGSpriteReference *)self objectReference];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isValid
{
  unsigned int v4 = [(PXGSpriteReference *)self spriteIndex];
  if (v4 == -1)
  {
    v2 = [(PXGSpriteReference *)self objectReference];
    if (!v2)
    {
      BOOL v6 = 0;
LABEL_6:

      return v6;
    }
  }
  v5 = [(PXGSpriteReference *)self layout];
  BOOL v6 = v5 != 0;

  if (v4 == -1) {
    goto LABEL_6;
  }
  return v6;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteReference;
  id result = [(PXGSpriteReference *)&v3 init];
  if (result) {
    *((_DWORD *)result + 3) = -1;
  }
  return result;
}

- (PXGSpriteReference)init
{
  unsigned int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGSpriteReference.m", 26, @"%s is not available as initializer", "-[PXGSpriteReference init]");

  abort();
}

@end
@interface TSTLayoutSpaceBundle
- (BOOL)performActionOnFrozenLayoutSpaces:(id)a3;
- (BOOL)performActionOnRepeatLayoutSpaces:(id)a3;
- (TSTLayout)layout;
- (TSTLayoutSpace)frozenHeaderColumnsSpace;
- (TSTLayoutSpace)frozenHeaderCornerSpace;
- (TSTLayoutSpace)frozenHeaderRowsSpace;
- (TSTLayoutSpace)repeatHeaderColumnsSpace;
- (TSTLayoutSpace)repeatHeaderCornerSpace;
- (TSTLayoutSpace)repeatHeaderRowsSpace;
- (TSTLayoutSpace)space;
- (TSTLayoutSpaceBundle)initWithLayout:(id)a3;
- (id)description;
- (id)getSpaceContainingCellID:(id)a3;
- (int)validateLayoutSpaces;
- (void)dealloc;
- (void)invalidateCoordinates;
- (void)invalidateTableOffsets;
- (void)performActionOnEachLayoutSpace:(id)a3;
- (void)setFrozenHeaderColumnsSpace:(id)a3;
- (void)setFrozenHeaderCornerSpace:(id)a3;
- (void)setFrozenHeaderRowsSpace:(id)a3;
- (void)setLayout:(id)a3;
- (void)setRepeatHeaderColumnsSpace:(id)a3;
- (void)setRepeatHeaderCornerSpace:(id)a3;
- (void)setRepeatHeaderRowsSpace:(id)a3;
- (void)setSpace:(id)a3;
@end

@implementation TSTLayoutSpaceBundle

- (TSTLayoutSpaceBundle)initWithLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutSpaceBundle;
  v4 = [(TSTLayoutSpaceBundle *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mLayout = (TSTLayout *)a3;
    v4->mSpace = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:v4 type:0];
  }
  return v5;
}

- (void)dealloc
{
  self->mSpace = 0;
  self->mFrozenHeaderColumnsSpace = 0;

  self->mFrozenHeaderRowsSpace = 0;
  self->mFrozenHeaderCornerSpace = 0;

  self->mRepeatHeaderColumnsSpace = 0;
  self->mRepeatHeaderRowsSpace = 0;

  self->mRepeatHeaderCornerSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutSpaceBundle;
  [(TSTLayoutSpaceBundle *)&v3 dealloc];
}

- (void)invalidateCoordinates
{
}

uint64_t __45__TSTLayoutSpaceBundle_invalidateCoordinates__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)invalidateTableOffsets
{
}

uint64_t __46__TSTLayoutSpaceBundle_invalidateTableOffsets__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (id)getSpaceContainingCellID:(id)a3
{
  p_mSpace = &self->mSpace;
  unint64_t Range = TSTLayoutSpaceGetRange((uint64_t)self->mSpace);
  if (HIWORD(Range)) {
    BOOL v7 = (Range & 0xFFFF00000000) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7
    && (unsigned __int16)Range <= a3.var0
    && (unsigned __int16)(Range + HIWORD(Range) - 1) >= a3.var0
    && a3.var1 >= BYTE2(Range)
    && a3.var1 <= (BYTE4(Range) + BYTE2(Range) - 1))
  {
    return *p_mSpace;
  }
  p_mSpace = &self->mRepeatHeaderCornerSpace;
  unint64_t v8 = TSTLayoutSpaceGetRange((uint64_t)self->mRepeatHeaderCornerSpace);
  BOOL v9 = !HIWORD(v8) || (v8 & 0xFFFF00000000) == 0;
  if (!v9
    && (unsigned __int16)v8 <= a3.var0
    && (unsigned __int16)(v8 + HIWORD(v8) - 1) >= a3.var0
    && a3.var1 >= BYTE2(v8)
    && a3.var1 <= (BYTE4(v8) + BYTE2(v8) - 1))
  {
    return *p_mSpace;
  }
  p_mSpace = &self->mRepeatHeaderColumnsSpace;
  unint64_t v10 = TSTLayoutSpaceGetRange((uint64_t)self->mRepeatHeaderColumnsSpace);
  BOOL v11 = !HIWORD(v10) || (v10 & 0xFFFF00000000) == 0;
  if (!v11
    && (unsigned __int16)v10 <= a3.var0
    && (unsigned __int16)(v10 + HIWORD(v10) - 1) >= a3.var0
    && a3.var1 >= BYTE2(v10)
    && a3.var1 <= (BYTE4(v10) + BYTE2(v10) - 1))
  {
    return *p_mSpace;
  }
  mRepeatHeaderRowsSpace = self->mRepeatHeaderRowsSpace;
  p_mRepeatHeaderRowsSpace = &self->mRepeatHeaderRowsSpace;
  unint64_t v14 = TSTLayoutSpaceGetRange((uint64_t)mRepeatHeaderRowsSpace);
  v15 = 0;
  if (HIWORD(v14) && (v14 & 0xFFFF00000000) != 0)
  {
    if ((unsigned __int16)v14 > a3.var0) {
      return 0;
    }
    if ((unsigned __int16)(v14 + HIWORD(v14) - 1) < a3.var0) {
      return 0;
    }
    if (a3.var1 < BYTE2(v14)) {
      return 0;
    }
    p_mSpace = p_mRepeatHeaderRowsSpace;
    if (a3.var1 > (BYTE4(v14) + BYTE2(v14) - 1)) {
      return 0;
    }
    return *p_mSpace;
  }
  return v15;
}

- (int)validateLayoutSpaces
{
  int v3 = [(TSTLayoutSpace *)self->mSpace validate:0];
  int v4 = [(TSTLayoutSpace *)self->mFrozenHeaderColumnsSpace validate:self->mSpace] | v3;
  int v5 = [(TSTLayoutSpace *)self->mFrozenHeaderRowsSpace validate:self->mSpace];
  int v6 = v4 | v5 | [(TSTLayoutSpace *)self->mFrozenHeaderCornerSpace validate:self->mSpace];
  int v7 = [(TSTLayoutSpace *)self->mRepeatHeaderColumnsSpace validate:self->mSpace];
  int v8 = v7 | [(TSTLayoutSpace *)self->mRepeatHeaderRowsSpace validate:self->mSpace];
  return v6 | v8 | [(TSTLayoutSpace *)self->mRepeatHeaderCornerSpace validate:self->mSpace];
}

- (void)performActionOnEachLayoutSpace:(id)a3
{
  if (![(TSTLayoutSpaceBundle *)self performActionOnFrozenLayoutSpaces:"performActionOnFrozenLayoutSpaces:"]
    && ![(TSTLayoutSpaceBundle *)self performActionOnRepeatLayoutSpaces:a3]
    && self->mSpace)
  {
    int v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (BOOL)performActionOnFrozenLayoutSpaces:(id)a3
{
  if (self->mFrozenHeaderCornerSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0
    || self->mFrozenHeaderRowsSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0)
  {
    return 1;
  }
  if (!self->mFrozenHeaderColumnsSpace) {
    return 0;
  }
  int v6 = (uint64_t (*)(id))*((void *)a3 + 2);

  return v6(a3);
}

- (BOOL)performActionOnRepeatLayoutSpaces:(id)a3
{
  if (self->mRepeatHeaderCornerSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0
    || self->mRepeatHeaderRowsSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0)
  {
    return 1;
  }
  if (!self->mRepeatHeaderColumnsSpace) {
    return 0;
  }
  int v6 = (uint64_t (*)(id))*((void *)a3 + 2);

  return v6(a3);
}

- (id)description
{
  int v3 = (void *)MEMORY[0x263F089D8];
  int v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  int v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  mLayout = self->mLayout;
  BOOL v9 = (objc_class *)objc_opt_class();
  unint64_t v10 = (void *)[v3 stringWithFormat:@"<%@ %p layout=<%@ %p>\n   mainSpace=<%@ %p>", v5, self, v7, mLayout, NSStringFromClass(v9), self->mSpace];
  if (self->mFrozenHeaderCornerSpace)
  {
    BOOL v11 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   frozenCorner=<%@ %p>", NSStringFromClass(v11), self->mFrozenHeaderCornerSpace];
  }
  if (self->mFrozenHeaderRowsSpace)
  {
    v12 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   frozenRows=<%@ %p>", NSStringFromClass(v12), self->mFrozenHeaderRowsSpace];
  }
  if (self->mFrozenHeaderColumnsSpace)
  {
    v13 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   frozenColumns=<%@ %p>", NSStringFromClass(v13), self->mFrozenHeaderColumnsSpace];
  }
  if (self->mRepeatHeaderCornerSpace)
  {
    unint64_t v14 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   repeatCorner=<%@ %p>", NSStringFromClass(v14), self->mRepeatHeaderCornerSpace];
  }
  if (self->mRepeatHeaderRowsSpace)
  {
    v15 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   repeatRows=<%@ %p>", NSStringFromClass(v15), self->mRepeatHeaderRowsSpace];
  }
  if (self->mRepeatHeaderColumnsSpace)
  {
    v16 = (objc_class *)objc_opt_class();
    [v10 appendFormat:@"\n   repeatColumns=<%@ %p>", NSStringFromClass(v16), self->mRepeatHeaderColumnsSpace];
  }
  [v10 appendString:@"}>"];
  return v10;
}

- (TSTLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
  self->mLayout = (TSTLayout *)a3;
}

- (TSTLayoutSpace)space
{
  return self->mSpace;
}

- (void)setSpace:(id)a3
{
}

- (TSTLayoutSpace)frozenHeaderColumnsSpace
{
  return self->mFrozenHeaderColumnsSpace;
}

- (void)setFrozenHeaderColumnsSpace:(id)a3
{
}

- (TSTLayoutSpace)frozenHeaderRowsSpace
{
  return self->mFrozenHeaderRowsSpace;
}

- (void)setFrozenHeaderRowsSpace:(id)a3
{
}

- (TSTLayoutSpace)frozenHeaderCornerSpace
{
  return self->mFrozenHeaderCornerSpace;
}

- (void)setFrozenHeaderCornerSpace:(id)a3
{
}

- (TSTLayoutSpace)repeatHeaderColumnsSpace
{
  return self->mRepeatHeaderColumnsSpace;
}

- (void)setRepeatHeaderColumnsSpace:(id)a3
{
}

- (TSTLayoutSpace)repeatHeaderRowsSpace
{
  return self->mRepeatHeaderRowsSpace;
}

- (void)setRepeatHeaderRowsSpace:(id)a3
{
}

- (TSTLayoutSpace)repeatHeaderCornerSpace
{
  return self->mRepeatHeaderCornerSpace;
}

- (void)setRepeatHeaderCornerSpace:(id)a3
{
}

@end
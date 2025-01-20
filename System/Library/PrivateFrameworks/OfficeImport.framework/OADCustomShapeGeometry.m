@interface OADCustomShapeGeometry
- (CsPoint<int>)limo;
- (CsRect<int>)geometryCoordSpace;
- (OADCustomShapeGeometry)init;
- (id)description;
- (id)formulaAtIndex:(unint64_t)a3;
- (id)pathAtIndex:(unint64_t)a3;
- (id)textBodyRectAtIndex:(unint64_t)a3;
- (int)type;
- (unint64_t)formulaCount;
- (unint64_t)pathCount;
- (unint64_t)textBodyRectCount;
- (void)addFormula:(id)a3;
- (void)addPath:(id)a3;
- (void)addTextBodyRect:(id)a3;
- (void)dealloc;
- (void)setGeometryCoordSpace:(CsRect<int>)a3;
- (void)setLimo:(CsPoint<int>)a3;
@end

@implementation OADCustomShapeGeometry

- (OADCustomShapeGeometry)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADCustomShapeGeometry;
  if ([(OADShapeGeometry *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)addPath:(id)a3
{
}

- (void)setGeometryCoordSpace:(CsRect<int>)a3
{
  mGeometryCoordSpace = self->mGeometryCoordSpace;
  _DWORD *mGeometryCoordSpace = **(_DWORD **)a3.var0;
  mGeometryCoordSpace[1] = *(_DWORD *)(*(void *)a3.var0 + 4);
  mGeometryCoordSpace[2] = *(_DWORD *)(*(void *)a3.var0 + 8);
  mGeometryCoordSpace[3] = *(_DWORD *)(*(void *)a3.var0 + 12);
}

- (void)setLimo:(CsPoint<int>)a3
{
  mLimo = self->mLimo;
  _DWORD *mLimo = *(_DWORD *)a3.var0[0];
  mLimo[1] = *(_DWORD *)(*(void *)&a3 + 4);
}

- (unint64_t)textBodyRectCount
{
  return [(NSMutableArray *)self->mTextBodyRects count];
}

- (void)dealloc
{
  mGeometryCoordSpace = self->mGeometryCoordSpace;
  if (mGeometryCoordSpace) {
    MEMORY[0x23EC997B0](mGeometryCoordSpace, 0x1000C40451B5BE8);
  }
  mLimo = self->mLimo;
  if (mLimo) {
    MEMORY[0x23EC997B0](mLimo, 0x1000C4000313F17);
  }
  v5.receiver = self;
  v5.super_class = (Class)OADCustomShapeGeometry;
  [(OADCustomShapeGeometry *)&v5 dealloc];
}

- (void)addTextBodyRect:(id)a3
{
}

- (id)textBodyRectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mTextBodyRects objectAtIndex:a3];
}

- (CsRect<int>)geometryCoordSpace
{
  _OWORD *v2 = *(_OWORD *)self->mGeometryCoordSpace;
  *(void *)&result.var0[2] = a2;
  *(void *)result.var0 = self;
  return result;
}

- (unint64_t)pathCount
{
  return [(NSMutableArray *)self->mPaths count];
}

- (id)pathAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mPaths objectAtIndex:a3];
}

- (void)addFormula:(id)a3
{
}

- (unint64_t)formulaCount
{
  return [(NSMutableArray *)self->mFormulas count];
}

- (id)formulaAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mFormulas objectAtIndex:a3];
}

- (int)type
{
  return 0;
}

- (CsPoint<int>)limo
{
  void *v2 = *(void *)self->mLimo;
  return (CsPoint<int>)self;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADCustomShapeGeometry;
  v2 = [(OADShapeGeometry *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPaths, 0);
  objc_storeStrong((id *)&self->mTextBodyRects, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
}

@end
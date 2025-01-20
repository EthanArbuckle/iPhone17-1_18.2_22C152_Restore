@interface SXTextTangierTextWrapContext
- (CGAffineTransform)targetInverseTransformInRoot;
- (SXTextTangierTextWrapContext)initWithColumn:(id)a3 targetLayout:(id)a4;
- (TSDWrapPolygon)interiorWrapPolygon;
- (TSUPointerKeyDictionary)wrapPathInverseTransformInRootDictionary;
- (TSWPColumn)column;
- (TSWPLayoutTarget)target;
- (id)transformedWrapPolygonForWrappable:(id)a3 canvasSpaceToWrapSpaceTransform:(CGAffineTransform *)a4;
- (void)setTarget:(id)a3;
- (void)setWrapPathInverseTransformInRootDictionary:(id)a3;
@end

@implementation SXTextTangierTextWrapContext

- (SXTextTangierTextWrapContext)initWithColumn:(id)a3 targetLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXTextTangierTextWrapContext;
  v9 = [(SXTextTangierTextWrapContext *)&v13 init];
  if (v9)
  {
    v10 = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    wrapPathInverseTransformInRootDictionary = v9->_wrapPathInverseTransformInRootDictionary;
    v9->_wrapPathInverseTransformInRootDictionary = v10;

    objc_storeStrong((id *)&v9->_column, a3);
    [(SXTextTangierTextWrapContext *)v9 setTarget:v8];
  }

  return v9;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
  v4 = [(SXTextTangierTextWrapContext *)self target];
  v5 = v4;
  if (v4) {
    [v4 transformInRoot];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformInvert(&v8, &v7);
  long long v6 = *(_OWORD *)&v8.c;
  *(_OWORD *)&self->_targetInverseTransformInRoot.a = *(_OWORD *)&v8.a;
  *(_OWORD *)&self->_targetInverseTransformInRoot.c = v6;
  *(_OWORD *)&self->_targetInverseTransformInRoot.tx = *(_OWORD *)&v8.tx;
}

- (id)transformedWrapPolygonForWrappable:(id)a3 canvasSpaceToWrapSpaceTransform:(CGAffineTransform *)a4
{
  id v6 = a3;
  CGAffineTransform v7 = [(SXTextTangierTextWrapContext *)self wrapPathInverseTransformInRootDictionary];
  CGAffineTransform v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v9 = [v6 wrapPolygon];
    CGAffineTransform v8 = (void *)[v9 copy];

    if (v8)
    {
      v10 = [v8 bezierPath];
      uint64_t v11 = [v8 intersectsSelf];
      long long v12 = *(_OWORD *)&self->_targetInverseTransformInRoot.c;
      long long v16 = *(_OWORD *)&self->_targetInverseTransformInRoot.a;
      long long v17 = v12;
      long long v18 = *(_OWORD *)&self->_targetInverseTransformInRoot.tx;
      [v10 transformUsingAffineTransform:&v16];
      long long v13 = *(_OWORD *)&a4->c;
      long long v16 = *(_OWORD *)&a4->a;
      long long v17 = v13;
      long long v18 = *(_OWORD *)&a4->tx;
      [v10 transformUsingAffineTransform:&v16];
      [v8 setPath:v10];
      [v8 setIntersectsSelf:v11];
      [(TSUPointerKeyDictionary *)self->_wrapPathInverseTransformInRootDictionary setObject:v8 forUncopiedKey:v6];
    }
  }
  id v14 = v8;

  return v14;
}

- (TSWPColumn)column
{
  return self->_column;
}

- (TSWPLayoutTarget)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (TSWPLayoutTarget *)WeakRetained;
}

- (TSDWrapPolygon)interiorWrapPolygon
{
  return self->_interiorWrapPolygon;
}

- (CGAffineTransform)targetInverseTransformInRoot
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (TSUPointerKeyDictionary)wrapPathInverseTransformInRootDictionary
{
  return self->_wrapPathInverseTransformInRootDictionary;
}

- (void)setWrapPathInverseTransformInRootDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapPathInverseTransformInRootDictionary, 0);
  objc_storeStrong((id *)&self->_interiorWrapPolygon, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_column, 0);
}

@end
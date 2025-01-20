@interface RBInterpolatedDisplayListContents
+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5;
- (BOOL)isEmpty;
- (CGRect)boundingRect;
- (NSString)xmlDescription;
- (const)_rb_contents;
- (const)_rb_xml_document;
- (id).cxx_construct;
- (id)encodedDataForDelegate:(id)a3 error:(id *)a4;
- (id)initWithInterpolator:(float)a3 by:;
- (void)_contentsWithScale:(double)a3@<D0>;
- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4;
- (void)drawInState:(_RBDrawingState *)a3;
- (void)renderInContext:(CGContext *)a3 options:(id)a4;
@end

@implementation RBInterpolatedDisplayListContents

- (id)initWithInterpolator:(float)a3 by:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)RBInterpolatedDisplayListContents;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  if (v5)
  {
    uint64_t v6 = [a2 copy];

    v5[1] = (id)v6;
    *((float *)v5 + 4) = a3;
  }
  return v5;
}

- (void)_contentsWithScale:(double)a3@<D0>
{
  if (a1)
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 20);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    v7 = *(void **)(a1 + 24);
    if (!v7 || *(double *)(a1 + 32) != a3)
    {
      objc_super v8 = objc_opt_new();
      [v8 setDeviceScale:a3];
      LODWORD(v9) = 1.0;
      [(id)a1 _drawInState:v8[35] alpha:v9];
      uint64_t v10 = [v8 moveContents];

      *(void *)(a1 + 24) = v10;
      *(double *)(a1 + 32) = a3;

      v7 = *(void **)(a1 + 24);
    }
    *a2 = v7;
    os_unfair_lock_unlock(v6);
  }
  else
  {
    *a2 = 0;
  }
}

- (BOOL)isEmpty
{
  p = self->_interp._p;
  BOOL result = 0;
  if (p)
  {
    v3 = p->_from._p;
    if (!v3 || [(_RBDisplayListContents *)v3 isEmpty])
    {
      v4 = p->_to._p;
      if (!v4 || ([(_RBDisplayListContents *)v4 isEmpty] & 1) != 0) {
        return 1;
      }
    }
  }
  return result;
}

- (CGRect)boundingRect
{
  *(float *)&double v2 = self->_progress;
  [(RBDisplayListInterpolator *)self->_interp._p boundingRectWithProgress:v2];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)drawInState:(_RBDrawingState *)a3
{
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  v7 = (void *)[a4 objectForKeyedSubscript:RBDisplayListRenderRasterizationScale];
  if (v7) {
    [v7 doubleValue];
  }
  else {
    double v8 = 1.0;
  }
  [(RBInterpolatedDisplayListContents *)(uint64_t)self _contentsWithScale:v8];
  id v9 = v10;
  [v10 renderInContext:a3 options:a4];
}

- (NSString)xmlDescription
{
  [(RBInterpolatedDisplayListContents *)(uint64_t)self _contentsWithScale:1.0];
  id v2 = v5;
  double v3 = (NSString *)[v5 xmlDescription];

  return v3;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  [(RBInterpolatedDisplayListContents *)(uint64_t)self _contentsWithScale:1.0];
  id v6 = v9;
  v7 = (void *)[v9 encodedDataForDelegate:a3 error:a4];

  return v7;
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  return +[RBMovedDisplayListContents decodedObjectWithData:a3 delegate:a4 error:a5];
}

- (const)_rb_contents
{
  [(RBInterpolatedDisplayListContents *)(uint64_t)self _contentsWithScale:1.0];
  id v2 = v5;
  double v3 = (const void *)objc_msgSend(v5, "_rb_contents");

  return v3;
}

- (const)_rb_xml_document
{
  [(RBInterpolatedDisplayListContents *)(uint64_t)self _contentsWithScale:1.0];
  id v2 = v5;
  double v3 = (const void *)objc_msgSend(v5, "_rb_xml_document");

  return v3;
}

- (void).cxx_destruct
{
  p = self->_interp._p;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 5) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end
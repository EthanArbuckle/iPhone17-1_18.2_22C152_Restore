@interface PXLayoutSnapshot
- (CGRect)contentRect;
- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot;
- (PXLayoutSnapshot)init;
- (PXLayoutSnapshot)initWithContentRect:(CGRect)a3;
- (_PXLayoutGeometry)geometryForItem:(SEL)a3;
- (id)description;
- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)setDataSourceSnapshot:(id)a3;
@end

@implementation PXLayoutSnapshot

- (void).cxx_destruct
{
}

- (void)setDataSourceSnapshot:(id)a3
{
}

- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"PXLayoutSnapshot.m" lineNumber:41 description:@"-enumerateGeometriesForItemsInRect:usingBlock: must be overidden"];
}

- (_PXLayoutGeometry)geometryForItem:(SEL)a3
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
  [v7 handleFailureInMethod:a3 object:self file:@"PXLayoutSnapshot.m" lineNumber:36 description:@"-geometryForItem: must be overidden"];

  long long v9 = *((_OWORD *)off_1E5DAAFE8 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E5DAAFE8 + 6);
  *(_OWORD *)&retstr->var6.origin.double y = v9;
  *(_OWORD *)&retstr->var6.size.double height = *((_OWORD *)off_1E5DAAFE8 + 8);
  retstr->var7.double height = *((CGFloat *)off_1E5DAAFE8 + 18);
  long long v10 = *((_OWORD *)off_1E5DAAFE8 + 3);
  *(_OWORD *)&retstr->var2.double height = *((_OWORD *)off_1E5DAAFE8 + 2);
  *(_OWORD *)&retstr->var3.b = v10;
  long long v11 = *((_OWORD *)off_1E5DAAFE8 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E5DAAFE8 + 4);
  *(_OWORD *)&retstr->var3.tdouble y = v11;
  long long v12 = *((_OWORD *)off_1E5DAAFE8 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E5DAAFE8;
  *(_OWORD *)&retstr->var1.double y = v12;
  return result;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PXLayoutSnapshot;
  v3 = [(PXLayoutSnapshot *)&v7 description];
  [(PXLayoutSnapshot *)self contentRect];
  v4 = NSStringFromCGRect(v9);
  v5 = [v3 stringByAppendingFormat:@"contentRect:%@", v4];

  return v5;
}

- (PXLayoutSnapshot)initWithContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PXLayoutSnapshot;
  CGRect result = [(PXLayoutSnapshot *)&v8 init];
  if (result)
  {
    result->_contentRect.origin.CGFloat x = x;
    result->_contentRect.origin.CGFloat y = y;
    result->_contentRect.size.CGFloat width = width;
    result->_contentRect.size.CGFloat height = height;
  }
  return result;
}

- (PXLayoutSnapshot)init
{
  return 0;
}

@end
@interface TSWPTextHostLayout
- (TSWPShapeInfo)editingShape;
- (TSWPShapeLayout)editingShapeLayout;
- (void)dealloc;
- (void)setEditingShape:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation TSWPTextHostLayout

- (void)dealloc
{
  [(TSDLayout *)self->_editingShapeLayout setParent:0];

  self->_editingShapeLayout = 0;
  self->_editingShapeInfo = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextHostLayout;
  [(TSDDrawableLayout *)&v3 dealloc];
}

- (void)updateChildrenFromInfo
{
  v8[1] = *MEMORY[0x263EF8340];
  editingShapeInfo = [(TSDLayout *)self->_editingShapeLayout info];
  editingShapeLayout = self->_editingShapeLayout;
  if (editingShapeInfo == (TSDInfo *)self->_editingShapeInfo)
  {
    if (editingShapeLayout)
    {
LABEL_7:
      v8[0] = editingShapeLayout;
      v7 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
      goto LABEL_8;
    }
  }
  else
  {
    [(TSDLayout *)self->_editingShapeLayout setParent:0];

    self->_editingShapeLayout = 0;
    editingShapeInfo = (TSDInfo *)self->_editingShapeInfo;
  }
  if (editingShapeInfo)
  {
    v6 = (TSWPShapeLayout *)objc_msgSend(objc_alloc((Class)-[TSDInfo layoutClass](editingShapeInfo, "layoutClass")), "initWithInfo:", self->_editingShapeInfo);
    self->_editingShapeLayout = v6;
    [(TSDLayout *)v6 setParent:self];
    editingShapeLayout = self->_editingShapeLayout;
    if (editingShapeLayout) {
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_8:
  [(TSDAbstractLayout *)self setChildren:v7];
  [v7 makeObjectsPerformSelector:a2];
}

- (void)setEditingShape:(id)a3
{
  editingShapeInfo = self->_editingShapeInfo;
  if (editingShapeInfo != a3)
  {
    [(TSDDrawableInfo *)editingShapeInfo setParentInfo:0];

    self->_editingShapeInfo = (TSWPShapeInfo *)a3;
    [(TSDDrawableInfo *)self->_editingShapeInfo setParentInfo:[(TSDLayout *)self info]];
    [(TSDLayout *)self invalidateChildren];
  }
}

- (TSWPShapeLayout)editingShapeLayout
{
  return self->_editingShapeLayout;
}

- (TSWPShapeInfo)editingShape
{
  return self->_editingShapeInfo;
}

@end
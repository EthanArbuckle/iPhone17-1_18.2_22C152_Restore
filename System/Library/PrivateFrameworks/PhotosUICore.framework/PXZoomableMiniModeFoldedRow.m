@interface PXZoomableMiniModeFoldedRow
- ($54B668FA3CFF7C50914A1C899F2834C0)collapseProgress;
- (PXZoomableMiniModeFoldedRow)initWithCollapseProgress:(id *)a3 yPosition:(double)a4;
- (double)yPosition;
- (id)description;
@end

@implementation PXZoomableMiniModeFoldedRow

- (double)yPosition
{
  return self->_yPosition;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)collapseProgress
{
  long long v3 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  return self;
}

- (id)description
{
  long long v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; collapseProgress.blur:%.2f yPosition:%.2f",
    v5,
    self,
    *(void *)&self->_collapseProgress.blur,
  v6 = *(void *)&self->_yPosition);

  return v6;
}

- (PXZoomableMiniModeFoldedRow)initWithCollapseProgress:(id *)a3 yPosition:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableMiniModeFoldedRow;
  result = [(PXZoomableMiniModeFoldedRow *)&v9 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    long long v8 = *(_OWORD *)&a3->var4;
    *(_OWORD *)&result->_collapseProgress.translation = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_collapseProgress.blur = v8;
    *(_OWORD *)&result->_collapseProgress.alpha = v7;
    result->_yPosition = a4;
  }
  return result;
}

@end
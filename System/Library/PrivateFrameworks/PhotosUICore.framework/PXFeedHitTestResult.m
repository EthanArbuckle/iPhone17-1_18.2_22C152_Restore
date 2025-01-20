@interface PXFeedHitTestResult
- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4;
- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5;
- (PXSectionedObjectReference)objectReference;
- (PXSimpleIndexPath)dataSourceIndexPath;
- (id)hoverAction;
- (id)hoverAction:(id)a3;
- (id)objectReference:(id)a3;
- (id)presentMenuAction;
- (id)presentMenuAction:(id)a3;
- (id)primaryAction;
- (id)primaryAction:(id)a3;
- (id)touchAction;
- (id)touchAction:(id)a3;
- (void)setDataSourceIndexPath:(PXSimpleIndexPath *)a3;
@end

@implementation PXFeedHitTestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong(&self->_presentMenuAction, 0);
  objc_storeStrong(&self->_hoverAction, 0);
  objc_storeStrong(&self->_touchAction, 0);
  objc_storeStrong(&self->_primaryAction, 0);
}

- (void)setDataSourceIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_dataSourceIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_dataSourceIndexPath.item = v3;
}

- (PXSimpleIndexPath)dataSourceIndexPath
{
  long long v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (id)presentMenuAction
{
  return self->_presentMenuAction;
}

- (id)hoverAction
{
  return self->_hoverAction;
}

- (id)touchAction
{
  return self->_touchAction;
}

- (id)primaryAction
{
  return self->_primaryAction;
}

- (id)objectReference:(id)a3
{
  v4 = (PXSectionedObjectReference *)[a3 copy];
  objectReference = self->_objectReference;
  self->_objectReference = v4;

  return self;
}

- (id)presentMenuAction:(id)a3
{
  v4 = (void *)[a3 copy];
  id presentMenuAction = self->_presentMenuAction;
  self->_id presentMenuAction = v4;

  return self;
}

- (id)hoverAction:(id)a3
{
  v4 = (void *)[a3 copy];
  id hoverAction = self->_hoverAction;
  self->_id hoverAction = v4;

  return self;
}

- (id)touchAction:(id)a3
{
  v4 = (void *)[a3 copy];
  id touchAction = self->_touchAction;
  self->_id touchAction = v4;

  return self;
}

- (id)primaryAction:(id)a3
{
  v4 = (void *)[a3 copy];
  id primaryAction = self->_primaryAction;
  self->_id primaryAction = v4;

  return self;
}

- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 spriteReferenceForSpriteIndex:v6];
  v11 = [(PXGHitTestResult *)self initWithSpriteReference:v10 layout:v9 identifier:v8 userData:0];

  return v11;
}

- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4
{
  return [(PXFeedHitTestResult *)self initWithSpriteIndex:*(void *)&a3 layout:a4 identifier:0];
}

@end
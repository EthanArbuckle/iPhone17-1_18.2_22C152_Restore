@interface TUIAXEvaluationContext
- (CGPoint)sectionOffset;
- (NSMapTable)identifierToAXElementMap;
- (TUIAXEvaluationContext)init;
- (TUIAXScreenOffsetProviding)screenOffsetProvider;
- (TUIRenderModelSection)renderModelSection;
- (double)totalContentHeight;
- (unint64_t)sectionIndex;
- (void)setIdentifierToAXElementMap:(id)a3;
- (void)setRenderModelSection:(id)a3;
- (void)setScreenOffsetProvider:(id)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setSectionOffset:(CGPoint)a3;
- (void)setTotalContentHeight:(double)a3;
@end

@implementation TUIAXEvaluationContext

- (TUIAXEvaluationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIAXEvaluationContext;
  v2 = [(TUIAXEvaluationContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    identifierToAXElementMap = v2->_identifierToAXElementMap;
    v2->_identifierToAXElementMap = (NSMapTable *)v3;
  }
  return v2;
}

- (TUIAXScreenOffsetProviding)screenOffsetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenOffsetProvider);

  return (TUIAXScreenOffsetProviding *)WeakRetained;
}

- (void)setScreenOffsetProvider:(id)a3
{
}

- (CGPoint)sectionOffset
{
  double x = self->_sectionOffset.x;
  double y = self->_sectionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSectionOffset:(CGPoint)a3
{
  self->_sectionOffset = a3;
}

- (double)totalContentHeight
{
  return self->_totalContentHeight;
}

- (void)setTotalContentHeight:(double)a3
{
  self->_totalContentHeight = a3;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndedouble x = a3;
}

- (TUIRenderModelSection)renderModelSection
{
  return self->_renderModelSection;
}

- (void)setRenderModelSection:(id)a3
{
}

- (NSMapTable)identifierToAXElementMap
{
  return self->_identifierToAXElementMap;
}

- (void)setIdentifierToAXElementMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToAXElementMap, 0);
  objc_storeStrong((id *)&self->_renderModelSection, 0);

  objc_destroyWeak((id *)&self->_screenOffsetProvider);
}

@end
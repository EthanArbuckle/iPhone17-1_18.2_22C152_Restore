@interface SXDebugComponentInserter
- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5;
- (SXComponentInsertionConditionEngine)conditionEngine;
- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5;
- (id)conditionsForDOMObjectProvider:(id)a3;
- (unint64_t)componentTraits;
@end

@implementation SXDebugComponentInserter

- (id)conditionsForDOMObjectProvider:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (unint64_t)componentTraits
{
  return 0;
}

- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  return 1;
}

- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  id v5 = a5;
  v6 = objc_alloc_init(SXInsertedDebugComponent);
  v7 = [SXInsertComponentLayout alloc];
  v8 = [v5 columnLayout];

  v9 = [v8 documentLayout];
  v10 = -[SXInsertComponentLayout initWithColumnRange:](v7, "initWithColumnRange:", 0, [v9 columns]);

  [(SXInsertComponentLayout *)v10 setIgnoreDocumentMargin:3];
  v11 = [[SXComponentInsert alloc] initWithComponent:v6 componentLayout:v10];

  return v11;
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (void).cxx_destruct
{
}

@end
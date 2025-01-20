@interface SXComponentSizerEngine
- (SXComponentSizerEngine)init;
- (SXComponentTypeMatching)factoryMatching;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (void)addFactory:(id)a3;
- (void)removeFactory:(id)a3;
@end

@implementation SXComponentSizerEngine

- (SXComponentSizerEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXComponentSizerEngine;
  v2 = [(SXComponentSizerEngine *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SXComponentTypeMatching);
    factoryMatching = v2->_factoryMatching;
    v2->_factoryMatching = v3;
  }
  return v2;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(SXComponentSizerEngine *)self factoryMatching];
  v15 = [v13 type];
  v16 = +[SXComponentTypeDescribing descriptionWithType:role:](SXComponentTypeDescribing, "descriptionWithType:role:", v15, [v13 role]);
  v17 = [v14 match:v16];

  v18 = [v17 sizerForComponent:v13 componentLayout:v12 layoutOptions:v11 DOMObjectProvider:v10];

  return v18;
}

- (void)addFactory:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentSizerEngine *)self factoryMatching];
    [v5 addDescription:v4];
  }
}

- (void)removeFactory:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentSizerEngine *)self factoryMatching];
    [v5 removeDescription:v4];
  }
}

- (SXComponentTypeMatching)factoryMatching
{
  return self->_factoryMatching;
}

- (void).cxx_destruct
{
}

@end
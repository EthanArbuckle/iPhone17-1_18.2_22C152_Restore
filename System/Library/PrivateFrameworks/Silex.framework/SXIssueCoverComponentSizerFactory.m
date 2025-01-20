@interface SXIssueCoverComponentSizerFactory
- (NSString)type;
- (SXIssueCoverComponentSizerFactory)initWithLayoutAttributesFactory:(id)a3;
- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXIssueCoverComponentSizerFactory

- (SXIssueCoverComponentSizerFactory)initWithLayoutAttributesFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCoverComponentSizerFactory;
  v6 = [(SXIssueCoverComponentSizerFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutOptionsFactory, a3);
  }

  return v7;
}

- (NSString)type
{
  return (NSString *)@"issue_cover";
}

- (int)role
{
  return 0;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 componentStyleForComponent:v13];
  v15 = [SXIssueCoverComponentSizer alloc];
  v16 = [(SXIssueCoverComponentSizerFactory *)self layoutOptionsFactory];
  v17 = [(SXIssueCoverComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 layoutOptionsFactory:v16];

  return v17;
}

- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (void).cxx_destruct
{
}

@end
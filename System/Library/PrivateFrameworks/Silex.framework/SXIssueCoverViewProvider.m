@interface SXIssueCoverViewProvider
- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory;
- (SXIssueCoverViewProvider)initWithLayoutAttributesFactory:(id)a3;
- (id)viewForIssueCover:(id)a3;
- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5;
@end

@implementation SXIssueCoverViewProvider

- (SXIssueCoverViewProvider)initWithLayoutAttributesFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCoverViewProvider;
  v6 = [(SXIssueCoverViewProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutOptionsFactory, a3);
  }

  return v7;
}

- (id)viewForIssueCover:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  return v3;
}

- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [SXIssueCoverLayoutOptions alloc];
  [v8 size];
  double v13 = v12;

  v17 = [(SXIssueCoverLayoutOptions *)v11 initWithBoundingWidth:v13];
  v14 = [(SXIssueCoverViewProvider *)self layoutOptionsFactory];
  v15 = [v14 createAttributesWithIssueCover:v10 options:v17];

  [v15 frame];
  objc_msgSend(v9, "setFrame:");
  v16 = [MEMORY[0x263F1C550] colorWithRed:0.909803922 green:0.909803922 blue:0.909803922 alpha:1.0];
  [v9 setBackgroundColor:v16];
}

- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (void).cxx_destruct
{
}

@end
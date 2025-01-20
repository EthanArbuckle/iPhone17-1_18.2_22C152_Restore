@interface SXLayoutContext
- (SXColumnLayout)columnLayout;
- (SXLayoutContext)initWithColumnLayout:(id)a3 unitConverter:(id)a4;
- (SXUnitConverter)unitConverter;
@end

@implementation SXLayoutContext

- (SXLayoutContext)initWithColumnLayout:(id)a3 unitConverter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutContext;
  v9 = [(SXLayoutContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_columnLayout, a3);
    objc_storeStrong((id *)&v10->_unitConverter, a4);
  }

  return v10;
}

- (SXColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (SXUnitConverter)unitConverter
{
  return self->_unitConverter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverter, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
}

@end
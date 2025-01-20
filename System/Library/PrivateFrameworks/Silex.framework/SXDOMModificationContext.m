@interface SXDOMModificationContext
- (NSString)specVersion;
- (SXDOMModificationContext)initWithLayoutOptions:(id)a3 specVersion:(id)a4;
- (SXLayoutOptions)layoutOptions;
@end

@implementation SXDOMModificationContext

- (SXDOMModificationContext)initWithLayoutOptions:(id)a3 specVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMModificationContext;
  v9 = [(SXDOMModificationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutOptions, a3);
    objc_storeStrong((id *)&v10->_specVersion, a4);
  }

  return v10;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specVersion, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
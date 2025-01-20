@interface PXVisualDiagnosticsConfiguration
- (BOOL)isPrivateDataAllowed;
- (CGSize)defaultPageSize;
- (NSString)name;
- (PXVisualDiagnosticsConfiguration)init;
- (PXVisualDiagnosticsConfiguration)initWithRootProvider:(id)a3;
- (PXVisualDiagnosticsProvider)rootProvider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDefaultPageSize:(CGSize)a3;
- (void)setIsPrivateDataAllowed:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRootProvider:(id)a3;
@end

@implementation PXVisualDiagnosticsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_rootProvider, 0);
}

- (void)setIsPrivateDataAllowed:(BOOL)a3
{
  self->_isPrivateDataAllowed = a3;
}

- (BOOL)isPrivateDataAllowed
{
  return self->_isPrivateDataAllowed;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setDefaultPageSize:(CGSize)a3
{
  self->_defaultPageSize = a3;
}

- (CGSize)defaultPageSize
{
  double width = self->_defaultPageSize.width;
  double height = self->_defaultPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRootProvider:(id)a3
{
}

- (PXVisualDiagnosticsProvider)rootProvider
{
  return self->_rootProvider;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXVisualDiagnosticsConfiguration *)self name];
  v6 = [(PXVisualDiagnosticsConfiguration *)self rootProvider];
  v7 = (void *)[v3 initWithFormat:@"<%@ %p; name: %@, rootProvider: %@>", v4, self, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PXVisualDiagnosticsConfiguration *)self rootProvider];
  v6 = (void *)[v4 initWithRootProvider:v5];

  [(PXVisualDiagnosticsConfiguration *)self defaultPageSize];
  objc_msgSend(v6, "setDefaultPageSize:");
  v7 = [(PXVisualDiagnosticsConfiguration *)self name];
  [v6 setName:v7];

  return v6;
}

- (PXVisualDiagnosticsConfiguration)initWithRootProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVisualDiagnosticsConfiguration;
  v6 = [(PXVisualDiagnosticsConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootProvider, a3);
    v7->_defaultPageSize = (CGSize)xmmword_259D747F0;
  }

  return v7;
}

- (PXVisualDiagnosticsConfiguration)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVisualDiagnosticsConfiguration.m", 18, @"%s is not available as initializer", "-[PXVisualDiagnosticsConfiguration init]");

  abort();
}

@end
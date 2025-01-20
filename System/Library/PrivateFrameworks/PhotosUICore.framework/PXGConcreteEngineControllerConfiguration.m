@interface PXGConcreteEngineControllerConfiguration
- (BOOL)deferReferenceSizeChanges;
- (BOOL)isVisible;
- (CGSize)pixelSize;
- (CGSize)referenceSize;
- (NSString)description;
- (PXGConcreteEngineControllerConfiguration)init;
- (PXGConcreteEngineControllerConfiguration)initWithViewEnvironment:(id)a3;
- (PXGViewEnvironment)viewEnvironment;
- (PXMediaProvider)mediaProvider;
- (UIColor)backgroundColor;
- (double)displayScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rootLayoutPromise;
- (int64_t)version;
- (void)_incrementVersion;
- (void)setBackgroundColor:(id)a3;
- (void)setDeferReferenceSizeChanges:(BOOL)a3;
- (void)setDisplayScale:(double)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRootLayoutPromise:(id)a3;
- (void)setViewEnvironment:(id)a3;
@end

@implementation PXGConcreteEngineControllerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong(&self->_rootLayoutPromise, 0);
}

- (int64_t)version
{
  return self->_version;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)deferReferenceSizeChanges
{
  return self->_deferReferenceSizeChanges;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (id)rootLayoutPromise
{
  return self->_rootLayoutPromise;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(PXGConcreteEngineControllerConfiguration *)self referenceSize];
  v6 = NSStringFromCGSize(v10);
  v7 = [v3 stringWithFormat:@"<%@: %p referenceSize: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (CGSize)pixelSize
{
}

- (void)setMediaProvider:(id)a3
{
  v5 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
    v5 = v6;
  }
}

- (void)setBackgroundColor:(id)a3
{
  v8 = (UIColor *)a3;
  v4 = self->_backgroundColor;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIColor *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)[(UIColor *)v8 copy];
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v6;

      [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
    }
  }
}

- (void)setDeferReferenceSizeChanges:(BOOL)a3
{
  if (self->_deferReferenceSizeChanges != a3)
  {
    self->_deferReferenceSizeChanges = a3;
    [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
  }
}

- (void)setDisplayScale:(double)a3
{
  if (a3 <= 0.0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGConcreteEngineControllerConfiguration.m", 92, @"Invalid parameter not satisfying: %@", @"displayScale > 0 && !isnan(displayScale)" object file lineNumber description];
  }
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  if (self->_referenceSize.width != a3.width || self->_referenceSize.height != a3.height)
  {
    self->_referenceSize = a3;
    [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
  }
}

- (void)setViewEnvironment:(id)a3
{
  v8 = (PXGViewEnvironment *)a3;
  v4 = self->_viewEnvironment;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXGViewEnvironment *)v4 isEqual:v8];

    if (!v5)
    {
      v6 = (PXGViewEnvironment *)[(PXGViewEnvironment *)v8 copy];
      viewEnvironment = self->_viewEnvironment;
      self->_viewEnvironment = v6;

      [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
    }
  }
}

- (void)setRootLayoutPromise:(id)a3
{
  id aBlock = a3;
  v4 = _Block_copy(self->_rootLayoutPromise);
  BOOL v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v8 = _Block_copy(aBlock);
      id rootLayoutPromise = self->_rootLayoutPromise;
      self->_id rootLayoutPromise = v8;

      [(PXGConcreteEngineControllerConfiguration *)self _incrementVersion];
    }
  }
}

- (void)_incrementVersion
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PXGConcreteEngineControllerConfiguration allocWithZone:a3];
  BOOL v5 = [(PXGConcreteEngineControllerConfiguration *)self viewEnvironment];
  v6 = [(PXGConcreteEngineControllerConfiguration *)v4 initWithViewEnvironment:v5];

  char v7 = [(PXGConcreteEngineControllerConfiguration *)self rootLayoutPromise];
  [(PXGConcreteEngineControllerConfiguration *)v6 setRootLayoutPromise:v7];

  v8 = [(PXGConcreteEngineControllerConfiguration *)self viewEnvironment];
  [(PXGConcreteEngineControllerConfiguration *)v6 setViewEnvironment:v8];

  [(PXGConcreteEngineControllerConfiguration *)v6 setIsVisible:[(PXGConcreteEngineControllerConfiguration *)self isVisible]];
  [(PXGConcreteEngineControllerConfiguration *)v6 setDeferReferenceSizeChanges:[(PXGConcreteEngineControllerConfiguration *)self deferReferenceSizeChanges]];
  [(PXGConcreteEngineControllerConfiguration *)self referenceSize];
  -[PXGConcreteEngineControllerConfiguration setReferenceSize:](v6, "setReferenceSize:");
  [(PXGConcreteEngineControllerConfiguration *)self displayScale];
  -[PXGConcreteEngineControllerConfiguration setDisplayScale:](v6, "setDisplayScale:");
  v9 = [(PXGConcreteEngineControllerConfiguration *)self backgroundColor];
  [(PXGConcreteEngineControllerConfiguration *)v6 setBackgroundColor:v9];

  CGSize v10 = [(PXGConcreteEngineControllerConfiguration *)self mediaProvider];
  [(PXGConcreteEngineControllerConfiguration *)v6 setMediaProvider:v10];

  v6->_version = [(PXGConcreteEngineControllerConfiguration *)self version];
  return v6;
}

- (PXGConcreteEngineControllerConfiguration)initWithViewEnvironment:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGConcreteEngineControllerConfiguration;
  v6 = [(PXGConcreteEngineControllerConfiguration *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    v6->_displayScale = 1.0;
    objc_storeStrong((id *)&v6->_viewEnvironment, a3);
    uint64_t v8 = [MEMORY[0x1E4FB1618] blackColor];
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v8;
  }
  return v7;
}

- (PXGConcreteEngineControllerConfiguration)init
{
  v3 = [PXGViewEnvironment alloc];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v5 = [(PXGViewEnvironment *)v3 initWithView:v4 accessibilityEnabled:0 isBeingFullPageSnapshotted:0];

  v6 = [(PXGConcreteEngineControllerConfiguration *)self initWithViewEnvironment:v5];
  return v6;
}

@end
@interface SXTextTangierContainerInfo
- (BOOL)isSelectable;
- (BOOL)shouldHyphenate;
- (Class)layoutClass;
- (Class)repClass;
- (NSSet)fixedExclusionPaths;
- (NSSet)rangedExclusionPaths;
- (SXTextTangierContainerInfo)initWithContext:(id)a3 geometry:(id)a4 stylesheet:(id)a5 string:(id)a6 locale:(id)a7;
- (SXTextTangierStorage)storage;
- (TSDRepDirectLayerHosting)directLayerHost;
- (void)setDirectLayerHost:(id)a3;
- (void)setFixedExclusionPaths:(id)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setRangedExclusionPaths:(id)a3;
- (void)setShouldHyphenate:(BOOL)a3;
@end

@implementation SXTextTangierContainerInfo

- (SXTextTangierContainerInfo)initWithContext:(id)a3 geometry:(id)a4 stylesheet:(id)a5 string:(id)a6 locale:(id)a7
{
  v23[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SXTextTangierContainerInfo;
  v16 = [(TSDContainerInfo *)&v22 initWithContext:v12 geometry:a4];
  if (v16)
  {
    v17 = [(SXTextTangierStorage *)[SXComponentTextStorage alloc] initWithContext:v12 stylesheet:v13 storageKind:0 string:v14 locale:v15];
    storage = v16->_storage;
    v16->_storage = &v17->super;

    v19 = [(SXTextTangierContainerInfo *)v16 storage];
    v23[0] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [(TSDContainerInfo *)v16 setChildInfos:v20];
  }
  return v16;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (void)setIsSelectable:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isSelectable = a3;
  id v4 = [(SXTextTangierContainerInfo *)self storage];
  [v4 setIsSelectable:v3];
}

- (void)setShouldHyphenate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldHyphenate = a3;
  id v4 = [(SXTextTangierContainerInfo *)self storage];
  [v4 setShouldHyphenate:v3];
}

- (NSSet)rangedExclusionPaths
{
  v2 = [(SXTextTangierContainerInfo *)self storage];
  BOOL v3 = [v2 rangedExclusionPaths];

  return (NSSet *)v3;
}

- (void)setRangedExclusionPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextTangierContainerInfo *)self storage];
  [v5 setRangedExclusionPaths:v4];
}

- (SXTextTangierStorage)storage
{
  return self->_storage;
}

- (NSSet)fixedExclusionPaths
{
  return self->_fixedExclusionPaths;
}

- (void)setFixedExclusionPaths:(id)a3
{
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (TSDRepDirectLayerHosting)directLayerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directLayerHost);
  return (TSDRepDirectLayerHosting *)WeakRetained;
}

- (void)setDirectLayerHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directLayerHost);
  objc_storeStrong((id *)&self->_fixedExclusionPaths, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
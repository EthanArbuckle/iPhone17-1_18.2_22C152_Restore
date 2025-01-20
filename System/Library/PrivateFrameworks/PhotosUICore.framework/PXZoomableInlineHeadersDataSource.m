@interface PXZoomableInlineHeadersDataSource
- ($4479F518DFD59EF68F6FA14DAF968345)sectionInfos;
- (PXAssetsDataSource)assetsDataSource;
- (PXZoomableInlineHeadersDataSource)initWithAssetsDataSource:(id)a3 level:(unint64_t)a4 metaDataStore:(id)a5;
- (int64_t)numberOfSections;
- (unint64_t)level;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation PXZoomableInlineHeadersDataSource

- ($4479F518DFD59EF68F6FA14DAF968345)sectionInfos
{
  return self->_sectionInfos;
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (void).cxx_destruct
{
}

- (PXZoomableInlineHeadersDataSource)initWithAssetsDataSource:(id)a3 level:(unint64_t)a4 metaDataStore:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PXZoomableInlineHeadersDataSource;
  v11 = [(PXZoomableInlineHeadersDataSource *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetsDataSource, a3);
    v12->_level = a4;
    if ([v9 numberOfSections] < 1)
    {
      v13 = 0;
    }
    else
    {
      uint64_t v19 = [v9 identifier];
      long long v20 = xmmword_1AB359AA0;
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = [v9 assetsInSectionIndexPath:&v19];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = objc_msgSend(v13, "px_sortOrder");
      uint64_t v15 = v14 == 1;
      if (v14 == 2) {
        uint64_t v15 = 2;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    v12->_type = v15;
    uint64_t v16 = [v10 numberOfSectionInfosForLevel:a4];
    v12->_numberOfSections = v16;
    if (v16)
    {
      v17 = ($4479F518DFD59EF68F6FA14DAF968345 *)malloc_type_malloc(32 * v16, 0x1000040E0EAB150uLL);
      v12->_sectionInfos = v17;
      memcpy(v17, (const void *)[v10 sectionInfosForLevel:a4], 32 * v12->_numberOfSections);
    }
  }
  return v12;
}

- (void)dealloc
{
  free(self->_sectionInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeadersDataSource;
  [(PXZoomableInlineHeadersDataSource *)&v3 dealloc];
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)level
{
  return self->_level;
}

@end
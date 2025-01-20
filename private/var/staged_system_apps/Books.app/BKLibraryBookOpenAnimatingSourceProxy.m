@interface BKLibraryBookOpenAnimatingSourceProxy
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookOpenAnimatingSourceProxy)initWithLibraryAsset:(id)a3 coverHost:(id)a4;
- (BKLibraryBookOpenCoverHosting)coverHost;
- (BOOL)coverAnimationSourceUseLargeCover;
- (CGRect)coverAnimationSourceFrame;
- (id)coverAnimationSourceImage;
- (id)coverAnimationSourceReferenceView;
- (id)coverAnimationSourceView;
- (int64_t)coverAnimationSourceAlignment;
- (void)coverAnimationSourceFinalize;
- (void)coverAnimationSourcePrepare;
- (void)setCoverHost:(id)a3;
- (void)setLibraryAsset:(id)a3;
@end

@implementation BKLibraryBookOpenAnimatingSourceProxy

- (BKLibraryBookOpenAnimatingSourceProxy)initWithLibraryAsset:(id)a3 coverHost:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookOpenAnimatingSourceProxy;
  v9 = [(BKLibraryBookOpenAnimatingSourceProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryAsset, a3);
    objc_storeStrong((id *)&v10->_coverHost, a4);
  }

  return v10;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  unsigned __int8 v5 = [v3 coverAnimationSourceUseLargeCoverForLibraryAsset:v4];

  return v5;
}

- (id)coverAnimationSourceImage
{
  v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  unsigned __int8 v5 = [v3 coverImageForLibraryAsset:v4];

  return v5;
}

- (id)coverAnimationSourceView
{
  v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  unsigned __int8 v5 = [v3 coverAnimationSourceViewForLibraryAsset:v4];

  return v5;
}

- (int64_t)coverAnimationSourceAlignment
{
  v2 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  id v3 = [v2 coverAnimationSourceAlignment];

  return (int64_t)v3;
}

- (CGRect)coverAnimationSourceFrame
{
  id v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  [v3 coverRectForLibraryAsset:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)coverAnimationSourceReferenceView
{
  id v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  double v5 = [v3 coverAnimationSourceReferenceViewForLibraryAsset:v4];

  return v5;
}

- (void)coverAnimationSourcePrepare
{
  id v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  id v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  [v4 coverAnimationSourcePrepareForLibraryAsset:v3];
}

- (void)coverAnimationSourceFinalize
{
  id v4 = [(BKLibraryBookOpenAnimatingSourceProxy *)self coverHost];
  id v3 = [(BKLibraryBookOpenAnimatingSourceProxy *)self libraryAsset];
  [v4 coverAnimationSourceFinalizeForLibraryAsset:v3];
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
}

- (BKLibraryBookOpenCoverHosting)coverHost
{
  return self->_coverHost;
}

- (void)setCoverHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverHost, 0);

  objc_storeStrong((id *)&self->_libraryAsset, 0);
}

@end
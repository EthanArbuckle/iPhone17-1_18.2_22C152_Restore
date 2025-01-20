@interface _UICollectionLayoutSolutionState
- (id)description;
@end

@implementation _UICollectionLayoutSolutionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxillaryRangeIndexerKindDict, 0);
  objc_storeStrong((id *)&self->_preferredSizeGroupingIndexer, 0);
  objc_storeStrong((id *)&self->_itemRangeIndexer, 0);
  objc_storeStrong((id *)&self->_geometricIndexer, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  sectionGeometryTranslator = self->_sectionGeometryTranslator;
  if (sectionGeometryTranslator)
  {
    CGFloat x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
    CGFloat y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
    CGFloat width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
    CGFloat height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  v11 = NSStringFromCGRect(*(CGRect *)&x);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: contentFrameIncludingAuxiliaries=%@; bookmarks=%@>",
    v5,
    self,
    v11,
  v12 = self->_bookmarks);

  return v12;
}

@end
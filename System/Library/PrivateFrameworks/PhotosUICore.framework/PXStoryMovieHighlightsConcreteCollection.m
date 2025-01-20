@interface PXStoryMovieHighlightsConcreteCollection
- (NSString)diagnosticDescription;
- (PXStoryMovieHighlightsConcreteCollection)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)movieHighlightsForDisplayAsset:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
@end

@implementation PXStoryMovieHighlightsConcreteCollection

- (void).cxx_destruct
{
}

- (id)movieHighlightsForDisplayAsset:(id)a3
{
  highlightsByAssetId = self->_highlightsByAssetId;
  v4 = [a3 uuid];
  v5 = [(NSMutableDictionary *)highlightsByAssetId objectForKeyedSubscript:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = +[PXStoryMovieHighlightsConcreteMutableCollection allocWithZone:](PXStoryMovieHighlightsConcreteMutableCollection, "allocWithZone:");
  uint64_t v6 = [(NSMutableDictionary *)self->_highlightsByAssetId mutableCopyWithZone:a3];
  highlightsByAssetId = v5->super._highlightsByAssetId;
  v5->super._highlightsByAssetId = (NSMutableDictionary *)v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[PXStoryMovieHighlightsConcreteCollection allocWithZone:](PXStoryMovieHighlightsConcreteCollection, "allocWithZone:");
  uint64_t v6 = [(NSMutableDictionary *)self->_highlightsByAssetId mutableCopyWithZone:a3];
  highlightsByAssetId = v5->_highlightsByAssetId;
  v5->_highlightsByAssetId = (NSMutableDictionary *)v6;

  return v5;
}

- (NSString)diagnosticDescription
{
  return (NSString *)[NSString stringWithFormat:@"-- %lu Movie Highlights --\n\n%@\n", -[PXStoryMovieHighlightsConcreteCollection count](self, "count"), self->_highlightsByAssetId];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p count:%lu highlights: %@>", objc_opt_class(), self, -[PXStoryMovieHighlightsConcreteCollection count](self, "count"), self->_highlightsByAssetId];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p count:%lu>", objc_opt_class(), self, -[PXStoryMovieHighlightsConcreteCollection count](self, "count")];
}

- (int64_t)count
{
  return [(NSMutableDictionary *)self->_highlightsByAssetId count];
}

- (PXStoryMovieHighlightsConcreteCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryMovieHighlightsConcreteCollection;
  v2 = [(PXStoryMovieHighlightsConcreteCollection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    highlightsByAssetId = v2->_highlightsByAssetId;
    v2->_highlightsByAssetId = v3;
  }
  return v2;
}

@end
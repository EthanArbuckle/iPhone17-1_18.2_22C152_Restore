@interface PUSceneDebugInspectorSceneViewModel
- (BOOL)isIndexed;
- (NSArray)synonyms;
- (NSString)keyword;
- (PUSceneDebugInspectorSceneViewModel)initWithKeyword:(id)a3 synonyms:(id)a4 sceneIdentifier:(unint64_t)a5 indexed:(BOOL)a6 threshold:(double)a7;
- (double)libraryCoverage;
- (double)threshold;
- (id)concatenatedSynonyms;
- (id)description;
- (unint64_t)count;
- (unint64_t)highConfidenceCount;
- (unint64_t)sceneIdentifier;
- (void)setCount:(unint64_t)a3;
- (void)setHighConfidenceCount:(unint64_t)a3;
- (void)setLibraryCoverage:(double)a3;
@end

@implementation PUSceneDebugInspectorSceneViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)setLibraryCoverage:(double)a3
{
  self->_libraryCoverage = a3;
}

- (double)libraryCoverage
{
  return self->_libraryCoverage;
}

- (void)setHighConfidenceCount:(unint64_t)a3
{
  self->_highConfidenceCount = a3;
}

- (unint64_t)highConfidenceCount
{
  return self->_highConfidenceCount;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (double)threshold
{
  return self->_threshold;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"keyword: %@\n", self->_keyword];
  objc_msgSend(v3, "appendFormat:", @"sceneIdentifier: %llu\n", self->_sceneIdentifier);
  objc_msgSend(v3, "appendFormat:", @"count: %lu\n", self->_count);
  objc_msgSend(v3, "appendFormat:", @"libraryCoverage: %f\n", *(void *)&self->_libraryCoverage);
  if (self->_isIndexed) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 appendFormat:@"isIndexed: %@\n", v4];
  objc_msgSend(v3, "appendFormat:", @"threshold: %f\n", *(void *)&self->_threshold);
  [v3 appendFormat:@"synonyms: %@\n", self->_synonyms];
  return v3;
}

- (id)concatenatedSynonyms
{
  v2 = [(PUSceneDebugInspectorSceneViewModel *)self synonyms];
  if ([v2 count])
  {
    v3 = [v2 componentsJoinedByString:@" | "];
  }
  else
  {
    v3 = &stru_1F06BE7B8;
  }

  return v3;
}

- (PUSceneDebugInspectorSceneViewModel)initWithKeyword:(id)a3 synonyms:(id)a4 sceneIdentifier:(unint64_t)a5 indexed:(BOOL)a6 threshold:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUSceneDebugInspectorSceneViewModel;
  v14 = [(PUSceneDebugInspectorSceneViewModel *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    keyword = v14->_keyword;
    v14->_keyword = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    synonyms = v14->_synonyms;
    v14->_synonyms = (NSArray *)v17;

    v14->_sceneIdentifier = a5;
    v14->_isIndexed = a6;
    v14->_threshold = a7;
  }

  return v14;
}

@end
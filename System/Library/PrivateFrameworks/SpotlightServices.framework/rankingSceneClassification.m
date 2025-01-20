@interface rankingSceneClassification
- (BOOL)exactSceneMatch;
- (NSArray)boundingBox;
- (NSArray)synonyms;
- (NSArray)synonymsIndexes;
- (NSDictionary)sceneReferenceDictionary;
- (NSNumber)identifier;
- (SSPommesPhotosRanker)rankerReference;
- (SSTokenizedString)label;
- (double)boundingBoxRatio;
- (double)confidence;
- (double)matchedBoundingBoxScore;
- (double)matchedConfidenceScore;
- (double)matchedSceneLabelRatio;
- (double)matchedSceneSynonymsRatio;
- (id)convertToLabelIndexWithSynonymCount:(id)a3 synonymsIndex:(id)a4;
- (int)sceneMatchedType;
- (unint64_t)totalLabels;
- (unint64_t)totalSynonyms;
- (void)matchScoreFromMatchInfo:(id)a3 userQueryToken:(id)a4;
- (void)matchScoreWhenLabelMatched:(id)a3 userQueryToken:(id)a4;
- (void)matchScoreWhenSynonymsMatched:(id)a3 userQueryToken:(id)a4;
- (void)setBoundingBox:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setExactSceneMatch:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMatchedBoundingBoxScore:(double)a3;
- (void)setMatchedConfidenceScore:(double)a3;
- (void)setMatchedSceneLabelRatio:(double)a3;
- (void)setMatchedSceneSynonymsRatio:(double)a3;
- (void)setRankerReference:(id)a3;
- (void)setSceneMatchedType:(int)a3;
- (void)setSceneReferenceDictionary:(id)a3;
- (void)setSynonyms:(id)a3;
- (void)setSynonymsIndexes:(id)a3;
- (void)setTotalLabels:(unint64_t)a3;
- (void)setTotalSynonyms:(unint64_t)a3;
- (void)updateBoundingBoxOfDetector;
@end

@implementation rankingSceneClassification

- (void)updateBoundingBoxOfDetector
{
  v3 = [(SSPommesPhotosRanker *)self->_rankerReference sceneTaxonomy];
  v4 = [(rankingSceneClassification *)self identifier];
  uint64_t v5 = objc_msgSend(v3, "nodeRefForSceneClassId:", objc_msgSend(v4, "unsignedIntValue"));

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  v7 = 0;
  v7 = self;
  if (v5) {
    PFSceneTaxonomyNodeVisitDetectors();
  }
  _Block_object_dispose(v6, 8);
}

- (double)boundingBoxRatio
{
  v3 = [(NSArray *)self->_boundingBox objectAtIndexedSubscript:2];
  [v3 doubleValue];
  double v5 = v4;
  v6 = [(NSArray *)self->_boundingBox objectAtIndexedSubscript:3];
  [v6 doubleValue];
  double v8 = v5 * v7;

  return v8;
}

- (void)matchScoreFromMatchInfo:(id)a3 userQueryToken:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int sceneMatchedType = self->_sceneMatchedType;
  if ((sceneMatchedType | 2) == 3)
  {
    double v8 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F23340]];
    if (v8) {
      [(rankingSceneClassification *)self matchScoreWhenLabelMatched:v8 userQueryToken:v6];
    }

    int sceneMatchedType = self->_sceneMatchedType;
  }
  if ((sceneMatchedType & 0xFFFFFFFE) == 2)
  {
    v9 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F23350]];
    if (v9) {
      [(rankingSceneClassification *)self matchScoreWhenSynonymsMatched:v9 userQueryToken:v6];
    }
  }
}

- (void)matchScoreWhenLabelMatched:(id)a3 userQueryToken:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__rankingSceneClassification_matchScoreWhenLabelMatched_userQueryToken___block_invoke;
  v8[3] = &unk_1E634D370;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

- (void)matchScoreWhenSynonymsMatched:(id)a3 userQueryToken:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke;
  v8[3] = &unk_1E634D370;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

- (id)convertToLabelIndexWithSynonymCount:(id)a3 synonymsIndex:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      if (v10 >= [v6 count]) {
        break;
      }
      v11 = [v6 objectAtIndexedSubscript:v10];
      unsigned int v12 = [v11 unsignedIntValue];

      if (v8 <= v12)
      {
        v14 = [v5 objectAtIndexedSubscript:v9];
        v8 += [v14 unsignedIntValue];

        ++v9;
      }
      else
      {
        v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v9 - 1];
        [v7 addObject:v13];

        ++v10;
      }
    }
    while (v9 < [v5 count]);
  }
  else
  {
    unint64_t v10 = 0;
  }
  while (v10 < [v6 count])
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - 1);
    [v7 addObject:v15];

    ++v10;
  }

  return v7;
}

- (SSTokenizedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSArray)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)matchedBoundingBoxScore
{
  return self->_matchedBoundingBoxScore;
}

- (void)setMatchedBoundingBoxScore:(double)a3
{
  self->_matchedBoundingBoxScore = a3;
}

- (double)matchedConfidenceScore
{
  return self->_matchedConfidenceScore;
}

- (void)setMatchedConfidenceScore:(double)a3
{
  self->_matchedConfidenceScore = a3;
}

- (double)matchedSceneLabelRatio
{
  return self->_matchedSceneLabelRatio;
}

- (void)setMatchedSceneLabelRatio:(double)a3
{
  self->_matchedSceneLabelRatio = a3;
}

- (double)matchedSceneSynonymsRatio
{
  return self->_matchedSceneSynonymsRatio;
}

- (void)setMatchedSceneSynonymsRatio:(double)a3
{
  self->_matchedSceneSynonymsRatio = a3;
}

- (BOOL)exactSceneMatch
{
  return self->_exactSceneMatch;
}

- (void)setExactSceneMatch:(BOOL)a3
{
  self->_exactSceneMatch = a3;
}

- (unint64_t)totalLabels
{
  return self->_totalLabels;
}

- (void)setTotalLabels:(unint64_t)a3
{
  self->_totalLabels = a3;
}

- (unint64_t)totalSynonyms
{
  return self->_totalSynonyms;
}

- (void)setTotalSynonyms:(unint64_t)a3
{
  self->_totalSynonyms = a3;
}

- (SSPommesPhotosRanker)rankerReference
{
  return self->_rankerReference;
}

- (void)setRankerReference:(id)a3
{
}

- (NSDictionary)sceneReferenceDictionary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneReferenceDictionary);
  return (NSDictionary *)WeakRetained;
}

- (void)setSceneReferenceDictionary:(id)a3
{
}

- (int)sceneMatchedType
{
  return self->_sceneMatchedType;
}

- (void)setSceneMatchedType:(int)a3
{
  self->_int sceneMatchedType = a3;
}

- (NSArray)synonymsIndexes
{
  return self->_synonymsIndexes;
}

- (void)setSynonymsIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymsIndexes, 0);
  objc_destroyWeak((id *)&self->_sceneReferenceDictionary);
  objc_storeStrong((id *)&self->_rankerReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
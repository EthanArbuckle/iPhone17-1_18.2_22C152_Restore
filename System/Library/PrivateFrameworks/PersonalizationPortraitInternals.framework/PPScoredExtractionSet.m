@interface PPScoredExtractionSet
- (BOOL)cloudSync;
- (NSArray)entities;
- (NSArray)topics;
- (NSMutableArray)topicsExactMatchesInSourceText;
- (NSMutableDictionary)locations;
- (PPSource)source;
- (double)decayRate;
- (double)sentimentScore;
- (id)description;
- (id)numberOfExtractions;
- (unint64_t)_donateLocationsWithContextualNamedEntities:(id)a3;
- (unint64_t)entityAlgorithm;
- (unint64_t)topicAlgorithm;
- (void)addLocation:(id)a3 algorithm:(unsigned __int16)a4;
- (void)flushWrites;
- (void)setCloudSync:(BOOL)a3;
- (void)setDecayRate:(double)a3;
- (void)setEntities:(id)a3;
- (void)setEntityAlgorithm:(unint64_t)a3;
- (void)setLocations:(id)a3;
- (void)setSentimentScore:(double)a3;
- (void)setSource:(id)a3;
- (void)setTopicAlgorithm:(unint64_t)a3;
- (void)setTopics:(id)a3;
- (void)setTopicsExactMatchesInSourceText:(id)a3;
- (void)writeSynchronous;
@end

@implementation PPScoredExtractionSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_topicsExactMatchesInSourceText, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

- (void)setSentimentScore:(double)a3
{
  self->_sentimentScore = a3;
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setCloudSync:(BOOL)a3
{
  self->_cloudSync = a3;
}

- (BOOL)cloudSync
{
  return self->_cloudSync;
}

- (void)setTopicAlgorithm:(unint64_t)a3
{
  self->_topicAlgorithm = a3;
}

- (unint64_t)topicAlgorithm
{
  return self->_topicAlgorithm;
}

- (void)setEntityAlgorithm:(unint64_t)a3
{
  self->_entityAlgorithm = a3;
}

- (unint64_t)entityAlgorithm
{
  return self->_entityAlgorithm;
}

- (void)setSource:(id)a3
{
}

- (PPSource)source
{
  return self->_source;
}

- (void)setLocations:(id)a3
{
}

- (NSMutableDictionary)locations
{
  return self->_locations;
}

- (void)setTopicsExactMatchesInSourceText:(id)a3
{
}

- (NSMutableArray)topicsExactMatchesInSourceText
{
  return self->_topicsExactMatchesInSourceText;
}

- (void)setTopics:(id)a3
{
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setEntities:(id)a3
{
}

- (NSArray)entities
{
  return self->_entities;
}

- (id)numberOfExtractions
{
  v3 = [(NSMutableDictionary *)self->_locations allValues];
  v4 = objc_msgSend(v3, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F256A058, &__block_literal_global_23220);

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_topics, "count")+ -[NSArray count](self->_entities, "count")+ (int)objc_msgSend(v4, "intValue"));

  return v5;
}

uint64_t __44__PPScoredExtractionSet_numberOfExtractions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  int v6 = [a2 intValue];
  uint64_t v7 = [v5 count];

  return [v4 numberWithUnsignedInteger:v7 + v6];
}

- (void)flushWrites
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[PPLocalNamedEntityStore defaultStore];
  id v13 = 0;
  int v3 = [v2 flushDonationsWithError:&v13];
  id v4 = v13;

  id v5 = pp_default_log_handle();
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet flushed named entity donations", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to flush named entity donations: %@", buf, 0xCu);
  }

  uint64_t v7 = +[PPLocalTopicStore defaultStore];
  id v12 = 0;
  int v8 = [v7 flushDonationsWithError:&v12];
  id v9 = v12;

  v10 = pp_default_log_handle();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet flushed topic donations", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v9;
    _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to flush topic donations: %@", buf, 0xCu);
  }
}

- (void)writeSynchronous
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_entities count])
  {
    int v3 = +[PPLocalNamedEntityStore defaultStore];
    entities = self->_entities;
    source = self->_source;
    unint64_t entityAlgorithm = self->_entityAlgorithm;
    BOOL cloudSync = self->_cloudSync;
    double sentimentScore = self->_sentimentScore;
    id v43 = 0;
    char v9 = [v3 donateNamedEntities:entities source:source algorithm:entityAlgorithm cloudSync:cloudSync sentimentScore:&v43 error:sentimentScore];
    id v10 = v43;

    if ((v9 & 1) == 0)
    {
      v11 = pp_default_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v10;
        _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate named entities: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  if ([(NSArray *)self->_topics count])
  {

    id v12 = +[PPLocalTopicStore defaultStore];
    id v13 = self->_source;
    unint64_t topicAlgorithm = self->_topicAlgorithm;
    BOOL v15 = self->_cloudSync;
    double v16 = self->_sentimentScore;
    topics = self->_topics;
    topicsExactMatchesInSourceText = self->_topicsExactMatchesInSourceText;
    id v42 = 0;
    char v19 = [v12 donateTopics:topics source:v13 algorithm:topicAlgorithm cloudSync:v15 sentimentScore:topicsExactMatchesInSourceText exactMatchesInSourceText:&v42 error:v16];
    id v10 = v42;

    if ((v19 & 1) == 0)
    {
      v20 = pp_default_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v10;
        _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate topics: %@", buf, 0xCu);
      }
    }
  }
  v21 = objc_opt_new();
  v22 = (void *)MEMORY[0x1CB79D060]();
  v23 = self->_entities;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __41__PPScoredExtractionSet_writeSynchronous__block_invoke;
  v40[3] = &unk_1E65DB2C8;
  id v24 = v21;
  id v41 = v24;
  [(NSArray *)v23 enumerateObjectsUsingBlock:v40];
  locations = self->_locations;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __41__PPScoredExtractionSet_writeSynchronous__block_invoke_2;
  v38 = &unk_1E65DB318;
  id v26 = v24;
  id v39 = v26;
  [(NSMutableDictionary *)locations enumerateKeysAndObjectsUsingBlock:&v35];
  if ((unint64_t)objc_msgSend(v26, "count", v35, v36, v37, v38) >= 0xB)
  {

    id v26 = 0;
  }

  unint64_t v27 = [(PPScoredExtractionSet *)self _donateLocationsWithContextualNamedEntities:v26];
  v28 = pp_default_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(PPSource *)self->_source documentId];
    v30 = [(PPSource *)self->_source bundleId];
    unint64_t v32 = self->_entityAlgorithm;
    unint64_t v31 = self->_topicAlgorithm;
    NSUInteger v33 = [(NSArray *)self->_entities count];
    NSUInteger v34 = [(NSArray *)self->_topics count];
    *(_DWORD *)buf = 138413826;
    id v45 = v29;
    __int16 v46 = 2112;
    v47 = v30;
    __int16 v48 = 2048;
    unint64_t v49 = v32;
    __int16 v50 = 2048;
    unint64_t v51 = v31;
    __int16 v52 = 2048;
    NSUInteger v53 = v33;
    __int16 v54 = 2048;
    NSUInteger v55 = v34;
    __int16 v56 = 2048;
    unint64_t v57 = v27;
    _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPScoredExtractionSet(%@:%@ alg:%tu/%tu) wrote %tu entities, %tu topics, and %tu locations", buf, 0x48u);
  }
}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 item];
  int v3 = [v4 name];
  [v2 addObject:v3];
}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PPScoredExtractionSet_writeSynchronous__block_invoke_3;
  v4[3] = &unk_1E65DB2F0;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v4];
}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = [a2 location];
  id v4 = [v3 placemark];
  id v6 = [v4 name];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) removeObject:v6];
    id v5 = v6;
  }
}

- (void)addLocation:(id)a3 algorithm:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v17 = a3;
  locations = self->_locations;
  if (!locations)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
    int v8 = self->_locations;
    self->_locations = v7;

    locations = self->_locations;
  }
  char v9 = [NSNumber numberWithUnsignedShort:v4];
  id v10 = [(NSMutableDictionary *)locations objectForKeyedSubscript:v9];

  if (!v10)
  {
    v11 = objc_opt_new();
    id v12 = self->_locations;
    id v13 = [NSNumber numberWithUnsignedShort:v4];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  v14 = self->_locations;
  BOOL v15 = [NSNumber numberWithUnsignedShort:v4];
  double v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  [v16 addObject:v17];
}

- (unint64_t)_donateLocationsWithContextualNamedEntities:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_locations count])
  {
    uint64_t v18 = 0;
    char v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v5 = +[PPConfiguration sharedInstance];
    id v6 = [(PPSource *)self->_source bundleId];
    uint64_t v7 = [(PPSource *)self->_source language];
    int v8 = [v5 extractionAlgorithmsForBundleId:v6 sourceLanguage:v7 conservative:0 domain:2];

    locations = self->_locations;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PPScoredExtractionSet__donateLocationsWithContextualNamedEntities___block_invoke;
    v13[3] = &unk_1E65DB2A0;
    id v10 = v8;
    id v14 = v10;
    BOOL v15 = self;
    id v16 = v4;
    id v17 = &v18;
    [(NSMutableDictionary *)locations enumerateKeysAndObjectsUsingBlock:v13];
    unint64_t v11 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

void __69__PPScoredExtractionSet__donateLocationsWithContextualNamedEntities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    id v12 = pp_default_log_handle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    id v13 = [*(id *)(*(void *)(a1 + 40) + 48) bundleId];
    *(_DWORD *)buf = 138412546;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet: Suppressing donation from %@ using algorithm %@ as it is not enabled.", buf, 0x16u);
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v7 = +[PPLocalLocationStore defaultStore];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 48);
  unsigned __int16 v10 = [v5 intValue];
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 8);
  id v14 = 0;
  LOBYTE(v9) = [v7 donateLocations:v6 source:v9 contextualNamedEntities:v8 algorithm:v10 cloudSync:v11 error:&v14];
  id v12 = v14;

  if ((v9 & 1) == 0)
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate derived locations: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v6 count];
LABEL_9:
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(PPSource *)self->_source documentId];
  id v5 = (void *)[v3 initWithFormat:@"<PPScoredExtractionSet doc:%@ n:%tu na:%tu t:%tu ta:%tu l:%tu>", v4, -[NSArray count](self->_entities, "count"), self->_entityAlgorithm, -[NSArray count](self->_topics, "count"), self->_topicAlgorithm, -[NSMutableDictionary count](self->_locations, "count")];

  return v5;
}

@end
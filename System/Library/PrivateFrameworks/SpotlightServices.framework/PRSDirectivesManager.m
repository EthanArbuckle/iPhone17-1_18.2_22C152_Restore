@interface PRSDirectivesManager
+ (void)initialize;
- (PRSDirectivesManager)init;
- (PRSL2FeatureVectorProcessingContext)processingContext;
- (double)weightX;
- (double)weightY;
- (unint64_t)getDirectiveTypeFromString:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)getAllDirectivesArraysForTesting:(void *)a3;
- (void)processDirectives:(id)a3;
- (void)processL2FeatureVector:(id)a3 populatingValues:(float *)a4 scoreValue:(char *)a5 count:(int)a6;
- (void)processResultSetValuesWithMap:(id)a3 serverFeatures:(id)a4;
- (void)setProcessingContext:(id)a3;
- (void)setWeightX:(double)a3;
- (void)setWeightY:(double)a3;
@end

@implementation PRSDirectivesManager

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = (void *)sLocalRSFeatureNameToBundleFeatureMappings;
    sLocalRSFeatureNameToBundleFeatureMappings = (uint64_t)&unk_1F1864920;
  }
}

- (PRSDirectivesManager)init
{
  if (init_onceToken_0 != -1) {
    dispatch_once(&init_onceToken_0, &__block_literal_global_238);
  }
  return self;
}

uint64_t __28__PRSDirectivesManager_init__block_invoke()
{
  featuresInOrder = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  if (self->indexOfIdMapping >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      directive_id_mapping = self->directive_id_mapping;
      var3 = directive_id_mapping[v3].var3;
      if (var3)
      {
        free(var3);
        self->directive_id_mapping[v3].var3 = 0;
        directive_id_mapping = self->directive_id_mapping;
      }
      var0 = directive_id_mapping[v3].var2.var0;
      if (var0)
      {
        CFRelease(var0);
        self->directive_id_mapping[v3].var2.var0 = 0;
      }
      ++v4;
      ++v3;
    }
    while (v4 < self->indexOfIdMapping);
  }
  if (self->indexOfResultSetIdMapping >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      v11 = directive_resultset_id_mapping[v8].var3;
      if (v11)
      {
        free(v11);
        self->directive_resultset_id_mapping[v8].var3 = 0;
        directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      }
      v12 = directive_resultset_id_mapping[v8].var2.var0;
      if (v12)
      {
        CFRelease(v12);
        self->directive_resultset_id_mapping[v8].var2.var0 = 0;
        directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      }
      var4 = directive_resultset_id_mapping[v8].var4;
      if (var4)
      {
        free(var4);
        self->directive_resultset_id_mapping[v8].var4 = 0;
      }
      ++v9;
      ++v8;
    }
    while (v9 < self->indexOfResultSetIdMapping);
  }
  if (self->indexOfResultSetIdScoreMapping >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 40;
    do
    {
      directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      v18 = directive_resultset_id_score_mapping[v14].var4;
      if (v18)
      {
        free(v18);
        *(unint64_t *)((char *)&self->directive_resultset_id_mapping->var0 + v16) = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      v19 = directive_resultset_id_score_mapping[v14].var2.var0;
      if (v19)
      {
        CFRelease(v19);
        self->directive_resultset_id_score_mapping[v14].var2.var0 = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      v20 = directive_resultset_id_score_mapping[v14].var3;
      if (v20)
      {
        CFRelease(v20);
        self->directive_resultset_id_score_mapping[v14].var3 = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      var5 = directive_resultset_id_score_mapping[v14].var5;
      if (var5)
      {
        free(var5);
        self->directive_resultset_id_score_mapping[v14].var5 = 0;
      }
      ++v15;
      ++v14;
      v16 += 56;
    }
    while (v15 < self->indexOfResultSetIdScoreMapping);
  }
  int indexOfQuantize = self->indexOfQuantize;
  if (indexOfQuantize >= 1)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 16;
    do
    {
      v25 = *(void **)((char *)&self->directive_quantize->var0 + v24);
      if (v25)
      {
        free(v25);
        *(unint64_t *)((char *)&self->directive_quantize->var0 + v24) = 0;
        int indexOfQuantize = self->indexOfQuantize;
      }
      ++v23;
      v24 += 32;
    }
    while (v23 < indexOfQuantize);
  }
  mapping = self->directive_local_resultset_id_values_mapping.mapping;
  if (mapping) {
    CFRelease(mapping);
  }
  v27 = self->directive_parsec_resultset_id_values_mapping.mapping;
  if (v27) {
    CFRelease(v27);
  }
  score_vector = self->directive_local_resultset_id_values_mapping.score_vector;
  if (score_vector) {
    free(score_vector);
  }
  v29 = self->directive_parsec_resultset_id_values_mapping.score_vector;
  if (v29) {
    free(v29);
  }
  PRSRankingBundleFeatureOrder = self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder;
  if (PRSRankingBundleFeatureOrder) {
    free(PRSRankingBundleFeatureOrder);
  }
  free(self->directive_replace_if);
  free(self->directive_as_is);
  free(self->directive_as_is_range);
  free(self->directive_id_mapping);
  free(self->directive_is_populated);
  free(self->directive_replace_then_min);
  free(self->directive_value_if_not_exist);
  free(self->directive_resultset_id_mapping);
  free(self->directive_resultset_id_score_mapping);
  free(self->directive_quantize);
  v31.receiver = self;
  v31.super_class = (Class)PRSDirectivesManager;
  [(PRSDirectivesManager *)&v31 dealloc];
}

- (unint64_t)getDirectiveTypeFromString:(id)a3
{
  uint64_t v3 = getDirectiveTypeFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&getDirectiveTypeFromString__onceToken, &__block_literal_global_241);
  }
  v5 = [(id)directiveStringToEnumMapping objectForKey:v4];

  unint64_t v6 = [v5 integerValue];
  return v6;
}

void __51__PRSDirectivesManager_getDirectiveTypeFromString___block_invoke()
{
  v0 = (void *)directiveStringToEnumMapping;
  directiveStringToEnumMapping = (uint64_t)&unk_1F1864948;
}

- (void)getAllDirectivesArraysForTesting:(void *)a3
{
  long long v3 = *(_OWORD *)&self->directive_replace_if;
  long long v4 = *(_OWORD *)&self->directive_value_if_not_exist;
  long long v5 = *(_OWORD *)&self->directive_id_mapping;
  long long v6 = *(_OWORD *)&self->directive_resultset_id_score_mapping;
  directive_quantize = self->directive_quantize;
  *(_OWORD *)a3 = *(_OWORD *)&self->directive_as_is;
  *((_OWORD *)a3 + 1) = v3;
  *((_OWORD *)a3 + 2) = v4;
  *((_OWORD *)a3 + 3) = v5;
  *((_OWORD *)a3 + 4) = v6;
  *((void *)a3 + 10) = directive_quantize;
}

- (void)processDirectives:(id)a3
{
  uint64_t v363 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  disabledFeatureIndices = self->disabledFeatureIndices;
  self->disabledFeatureIndices = 0;

  long long v6 = (NSMutableDictionary *)objc_opt_new();
  mapInflatedIndexToSize = self->mapInflatedIndexToSize;
  self->mapInflatedIndexToSize = v6;

  long long v352 = 0u;
  long long v353 = 0u;
  long long v350 = 0u;
  long long v351 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v350 objects:v362 count:16];
  v10 = &processResultSetValuesWithMap_serverFeatures__onceToken;
  if (!v9)
  {
    v290 = 0;
    goto LABEL_184;
  }
  uint64_t v11 = v9;
  v290 = 0;
  id obj = v8;
  uint64_t v312 = *(void *)v351;
  v320 = self;
  do
  {
    uint64_t v12 = 0;
    uint64_t v291 = v11;
    do
    {
      if (*(void *)v351 != v312) {
        objc_enumerationMutation(obj);
      }
      uint64_t v313 = v12;
      v13 = *(void **)(*((void *)&v350 + 1) + 8 * v12);
      uint64_t v14 = [v13 objectForKey:@"names"];
      uint64_t v15 = [v13 objectForKey:@"name"];
      uint64_t v16 = v15;
      if (v14) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v15 == 0;
      }
      if (v17)
      {
        v316 = (void *)v14;
LABEL_12:
        int v18 = 0;
        goto LABEL_18;
      }
      char v19 = [v15 isEqualToString:@"output"];
      if (v19)
      {
        int v18 = 1;
      }
      else
      {
        if (([v16 isEqualToString:@"model_weights"] & 1) == 0)
        {
          v361 = v16;
          v316 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v361 count:1];
          goto LABEL_12;
        }
        int v18 = 0;
      }
      v316 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:
      v20 = [v13 objectForKey:@"type"];
      v315 = v16;
      id v317 = (id)[(id)v10[353] count];
      if (v18)
      {
        if (v20) {
          [(PRSDirectivesManager *)self getDirectiveTypeFromString:v20];
        }
        unint64_t v21 = 0x7FFFFFFFLL;
        v22 = v316;
      }
      else
      {
        uint64_t v23 = [(id)v10[353] count];
        unint64_t v21 = cumulativeInflatedFeaturesCount + v23;
        v22 = v316;
        [(id)v10[353] addObjectsFromArray:v316];
      }
      v314 = [v13 objectForKey:@"excluded_values"];
      uint64_t v24 = [v13 objectForKey:@"values"];
      v25 = [v13 objectForKey:@"value"];
      id v26 = v24;
      id v27 = v26;
      if (v26) {
        BOOL v28 = 1;
      }
      else {
        BOOL v28 = v25 == 0;
      }
      v321 = v26;
      if (!v28) {
        id v27 = v25;
      }
      v29 = v315;
      if (v20)
      {
        switch([(PRSDirectivesManager *)self getDirectiveTypeFromString:v20])
        {
          case 0uLL:
            unsigned int sizeOfAsIs = self->sizeOfAsIs;
            int indexOfAsIs = self->indexOfAsIs;
            directive_as_is = self->directive_as_is;
            if (sizeOfAsIs == indexOfAsIs)
            {
              unsigned int v33 = sizeOfAsIs | (sizeOfAsIs >> 1) | ((sizeOfAsIs | (sizeOfAsIs >> 1)) >> 2);
              unsigned int v34 = v33 | (v33 >> 4) | ((v33 | (v33 >> 4)) >> 8);
              int v35 = (v34 | HIWORD(v34)) + 1;
              self->unsigned int sizeOfAsIs = v35;
              directive_as_is = (_as_is *)malloc_type_realloc(directive_as_is, 16 * v35, 0x1000040451B5BE8uLL);
              self->directive_as_is = directive_as_is;
              int indexOfAsIs = self->indexOfAsIs;
            }
            uint64_t v36 = v313;
            directive_as_is[indexOfAsIs].var0 = v21;
            uint64_t v37 = [v22 count];
            uint64_t v38 = self->indexOfAsIs;
            self->directive_as_is[v38].var1 = v37 + v21;
            self->int indexOfAsIs = v38 + 1;
            break;
          case 1uLL:
            v300 = v25;
            v42 = v20;
            unsigned int sizeOfAsIsRange = self->sizeOfAsIsRange;
            if (sizeOfAsIsRange == self->indexOfAsIsRange)
            {
              unsigned int v44 = sizeOfAsIsRange | (sizeOfAsIsRange >> 1) | ((sizeOfAsIsRange | (sizeOfAsIsRange >> 1)) >> 2);
              unsigned int v45 = v44 | (v44 >> 4) | ((v44 | (v44 >> 4)) >> 8);
              int v46 = (v45 | HIWORD(v45)) + 1;
              self->unsigned int sizeOfAsIsRange = v46;
              self->directive_as_is_range = (_as_is_range *)malloc_type_realloc(self->directive_as_is_range, 24 * v46, 0x1000040504FFAC1uLL);
            }
            v47 = [v27 objectForKey:@"count"];
            self->directive_as_is_range[self->indexOfAsIsRange].var0 = v21;
            v22 = v316;
            self->directive_as_is_range[self->indexOfAsIsRange].var1 = [v316 count] + v21;
            unint64_t v48 = [v47 integerValue];
            int indexOfAsIsRange = self->indexOfAsIsRange;
            self->directive_as_is_range[indexOfAsIsRange].var2 = v48;
            self->int indexOfAsIsRange = indexOfAsIsRange + 1;

            uint64_t v36 = v313;
            v20 = v42;
            v25 = v300;
            break;
          case 2uLL:
            unsigned int sizeOfReplaceIf = self->sizeOfReplaceIf;
            int indexOfReplaceIf = self->indexOfReplaceIf;
            directive_replace_if = self->directive_replace_if;
            if (sizeOfReplaceIf == indexOfReplaceIf)
            {
              unsigned int v53 = sizeOfReplaceIf | (sizeOfReplaceIf >> 1) | ((sizeOfReplaceIf | (sizeOfReplaceIf >> 1)) >> 2);
              unsigned int v54 = v53 | (v53 >> 4) | ((v53 | (v53 >> 4)) >> 8);
              int v55 = (v54 | HIWORD(v54)) + 1;
              self->unsigned int sizeOfReplaceIf = v55;
              directive_replace_if = (_replace_if *)malloc_type_realloc(directive_replace_if, 40 * v55, 0x10000400A747E1EuLL);
              self->directive_replace_if = directive_replace_if;
              int indexOfReplaceIf = self->indexOfReplaceIf;
            }
            directive_replace_if[indexOfReplaceIf].var0 = v21;
            uint64_t v214 = [v316 count];
            v215 = self->directive_replace_if;
            int v216 = self->indexOfReplaceIf;
            v215[v216].var1 = v214 + v21;
            v39 = v321;
            if (v321)
            {
              id v309 = v27;
              v298 = v20;
              long long v348 = 0u;
              long long v349 = 0u;
              long long v346 = 0u;
              long long v347 = 0u;
              id v318 = [v321 allKeys];
              uint64_t v217 = [v318 countByEnumeratingWithState:&v346 objects:v360 count:16];
              v305 = v25;
              if (v217)
              {
                uint64_t v218 = v217;
                int v219 = 0;
                int v220 = 0;
                uint64_t v221 = *(void *)v347;
                do
                {
                  uint64_t v222 = 0;
                  uint64_t v223 = v219;
                  uint64_t v224 = v220;
                  do
                  {
                    if (*(void *)v347 != v221) {
                      objc_enumerationMutation(v318);
                    }
                    v225 = *(void **)(*((void *)&v346 + 1) + 8 * v222);
                    [v225 floatValue];
                    int v220 = v224 + 1;
                    v320->directive_replace_if[v320->indexOfReplaceIf].var2[v224] = v226;
                    v227 = [v321 objectForKey:v225];
                    [v227 floatValue];
                    int v219 = v223 + 1;
                    v320->directive_replace_if[v320->indexOfReplaceIf].var3[v223] = v228;

                    ++v222;
                    ++v224;
                    ++v223;
                  }
                  while (v218 != v222);
                  uint64_t v218 = [v318 countByEnumeratingWithState:&v346 objects:v360 count:16];
                }
                while (v218);
              }
              else
              {
                int v220 = 0;
              }

              self = v320;
              v39 = v321;
              v215 = v320->directive_replace_if;
              int v216 = v320->indexOfReplaceIf;
              int v246 = v216;
              uint64_t v11 = v291;
              v20 = v298;
              v29 = v315;
              v25 = v305;
              id v27 = v309;
            }
            else
            {
              int v220 = 0;
              int v246 = v216;
            }
            v215[v246].var4 = v220;
            self->int indexOfReplaceIf = v216 + 1;
            v10 = &processResultSetValuesWithMap_serverFeatures__onceToken;
            goto LABEL_173;
          case 3uLL:
            unsigned int sizeOfReplaceThenMin = self->sizeOfReplaceThenMin;
            int indexOfReplaceThenMin = self->indexOfReplaceThenMin;
            directive_replace_then_min = self->directive_replace_then_min;
            if (sizeOfReplaceThenMin == indexOfReplaceThenMin)
            {
              unsigned int v59 = sizeOfReplaceThenMin | (sizeOfReplaceThenMin >> 1) | ((sizeOfReplaceThenMin | (sizeOfReplaceThenMin >> 1)) >> 2);
              unsigned int v60 = v59 | (v59 >> 4) | ((v59 | (v59 >> 4)) >> 8);
              int v61 = (v60 | HIWORD(v60)) + 1;
              self->unsigned int sizeOfReplaceThenMin = v61;
              directive_replace_then_min = (_replace_then_min *)malloc_type_realloc(directive_replace_then_min, 72 * v61, 0x1000040811A10F9uLL);
              self->directive_replace_then_min = directive_replace_then_min;
              int indexOfReplaceThenMin = self->indexOfReplaceThenMin;
            }
            v299 = v20;
            directive_replace_then_min[indexOfReplaceThenMin].var0 = v21;
            uint64_t v229 = [v22 count];
            v230 = self;
            self->directive_replace_then_min[self->indexOfReplaceThenMin].var1 = v229 + v21;
            v231 = [v27 objectForKey:@"replace"];
            id v310 = v27;
            v286 = [v27 objectForKey:@"min"];
            long long v338 = 0u;
            long long v339 = 0u;
            long long v340 = 0u;
            long long v341 = 0u;
            id v319 = [v231 allKeys];
            uint64_t v232 = [v319 countByEnumeratingWithState:&v338 objects:v358 count:16];
            v306 = v25;
            v289 = v231;
            if (v232)
            {
              uint64_t v233 = v232;
              int v234 = 0;
              int v235 = 0;
              uint64_t v236 = *(void *)v339;
              do
              {
                uint64_t v237 = 0;
                uint64_t v238 = v234;
                uint64_t v239 = v235;
                do
                {
                  if (*(void *)v339 != v236) {
                    objc_enumerationMutation(v319);
                  }
                  v240 = *(void **)(*((void *)&v338 + 1) + 8 * v237);
                  [v240 floatValue];
                  int v235 = v239 + 1;
                  v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var2[v239] = v241;
                  v242 = [v321 objectForKey:v240];
                  [v242 floatValue];
                  int v234 = v238 + 1;
                  v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var3[v238] = v243;

                  ++v237;
                  ++v239;
                  ++v238;
                }
                while (v233 != v237);
                uint64_t v233 = [v319 countByEnumeratingWithState:&v338 objects:v358 count:16];
              }
              while (v233);
            }
            else
            {
              int v235 = 0;
            }

            v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var5 = v235;
            [v286 floatValue];
            int v247 = v230->indexOfReplaceThenMin;
            self = v230;
            v230->directive_replace_then_min[v247].var4 = v248;
            v230->int indexOfReplaceThenMin = v247 + 1;

            v10 = &processResultSetValuesWithMap_serverFeatures__onceToken;
            uint64_t v11 = v291;
            v20 = v299;
            uint64_t v36 = v313;
            v29 = v315;
            v22 = v316;
            v25 = v306;
            id v27 = v310;
            break;
          case 4uLL:
            unsigned int sizeOfValueIfNotExist = self->sizeOfValueIfNotExist;
            int indexOfValueIfNotExist = self->indexOfValueIfNotExist;
            directive_value_if_not_exist = self->directive_value_if_not_exist;
            if (sizeOfValueIfNotExist == indexOfValueIfNotExist)
            {
              unsigned int v65 = sizeOfValueIfNotExist | (sizeOfValueIfNotExist >> 1) | ((sizeOfValueIfNotExist | (sizeOfValueIfNotExist >> 1)) >> 2);
              unsigned int v66 = v65 | (v65 >> 4) | ((v65 | (v65 >> 4)) >> 8);
              int v67 = (v66 | HIWORD(v66)) + 1;
              self->unsigned int sizeOfValueIfNotExist = v67;
              directive_value_if_not_exist = (_value_if_not_exist *)malloc_type_realloc(directive_value_if_not_exist, 24 * v67, 0x10000400CE834B2uLL);
              self->directive_value_if_not_exist = directive_value_if_not_exist;
              int indexOfValueIfNotExist = self->indexOfValueIfNotExist;
            }
            uint64_t v36 = v313;
            directive_value_if_not_exist[indexOfValueIfNotExist].var0 = v21;
            self->directive_value_if_not_exist[self->indexOfValueIfNotExist].var1 = [v22 count] + v21;
            [v25 floatValue];
            int v244 = self->indexOfValueIfNotExist;
            v22 = v316;
            self->directive_value_if_not_exist[v244].var2 = v245;
            self->int indexOfValueIfNotExist = v244 + 1;
            break;
          case 5uLL:
            unsigned int sizeOfIsPopulated = self->sizeOfIsPopulated;
            int indexOfIsPopulated = self->indexOfIsPopulated;
            directive_is_populated = self->directive_is_populated;
            if (sizeOfIsPopulated == indexOfIsPopulated)
            {
              unsigned int v71 = sizeOfIsPopulated | (sizeOfIsPopulated >> 1) | ((sizeOfIsPopulated | (sizeOfIsPopulated >> 1)) >> 2);
              unsigned int v72 = v71 | (v71 >> 4) | ((v71 | (v71 >> 4)) >> 8);
              int v73 = (v72 | HIWORD(v72)) + 1;
              self->unsigned int sizeOfIsPopulated = v73;
              directive_is_populated = (_is_populated *)malloc_type_realloc(directive_is_populated, (uint64_t)v73 << 6, 0x1000040FA0F61DDuLL);
              self->directive_is_populated = directive_is_populated;
              int indexOfIsPopulated = self->indexOfIsPopulated;
            }
            directive_is_populated[(uint64_t)indexOfIsPopulated].var0 = v21;
            uint64_t v74 = [v22 count];
            v75 = self->directive_is_populated;
            int v76 = self->indexOfIsPopulated;
            uint64_t v77 = v76;
            v75[(uint64_t)v76].var1 = v74 + v21;
            if (v321)
            {
              id v307 = v27;
              v292 = v20;
              long long v344 = 0u;
              long long v345 = 0u;
              long long v342 = 0u;
              long long v343 = 0u;
              v78 = [v321 allKeys];
              uint64_t v79 = [v78 countByEnumeratingWithState:&v342 objects:v359 count:16];
              v301 = v25;
              if (v79)
              {
                uint64_t v80 = v79;
                int v81 = 0;
                int v82 = 0;
                uint64_t v83 = *(void *)v343;
                do
                {
                  uint64_t v84 = 0;
                  uint64_t v85 = v81;
                  uint64_t v86 = v82;
                  do
                  {
                    if (*(void *)v343 != v83) {
                      objc_enumerationMutation(v78);
                    }
                    v87 = *(void **)(*((void *)&v342 + 1) + 8 * v84);
                    int v82 = v86 + 1;
                    self->directive_is_populated[(uint64_t)self->indexOfIsPopulated].var2[v86] = (float)[v87 BOOLValue];
                    v88 = [v321 objectForKey:v87];
                    [v88 floatValue];
                    int v81 = v85 + 1;
                    self->directive_is_populated[(uint64_t)self->indexOfIsPopulated].var3[v85] = v89;

                    ++v84;
                    ++v86;
                    ++v85;
                  }
                  while (v80 != v84);
                  uint64_t v80 = [v78 countByEnumeratingWithState:&v342 objects:v359 count:16];
                }
                while (v80);
              }
              else
              {
                int v82 = 0;
              }

              v75 = self->directive_is_populated;
              int v76 = self->indexOfIsPopulated;
              uint64_t v77 = v76;
              v10 = &processResultSetValuesWithMap_serverFeatures__onceToken;
              uint64_t v11 = v291;
              v20 = v292;
              v29 = v315;
              v22 = v316;
              v25 = v301;
              id v27 = v307;
            }
            else
            {
              int v82 = 0;
            }
            v75[v77].var4 = v82;
            self->int indexOfIsPopulated = v76 + 1;
            goto LABEL_160;
          case 6uLL:
            unsigned int sizeOfIdMapping = self->sizeOfIdMapping;
            int indexOfIdMapping = self->indexOfIdMapping;
            if (sizeOfIdMapping == indexOfIdMapping)
            {
              unsigned int v92 = sizeOfIdMapping | (sizeOfIdMapping >> 1) | ((sizeOfIdMapping | (sizeOfIdMapping >> 1)) >> 2);
              unsigned int v93 = v92 | (v92 >> 4) | ((v92 | (v92 >> 4)) >> 8);
              int v94 = (v93 | HIWORD(v93)) + 1;
              self->unsigned int sizeOfIdMapping = v94;
              self->directive_id_mapping = (_id_mapping *)malloc_type_realloc(self->directive_id_mapping, 48 * v94, 0x1072040C780C59AuLL);
              int indexOfIdMapping = self->indexOfIdMapping;
            }
            if (v321)
            {
              self->directive_id_mapping[indexOfIdMapping].var0 = v21;
              self->directive_id_mapping[self->indexOfIdMapping].var1 = [v321 count] + v21;
              uint64_t v95 = [v321 count];
              cumulativeInflatedFeaturesCount = v95 + cumulativeInflatedFeaturesCount - 1;
              id v96 = [v316 firstObject];
              v97 = (const char *)[v96 UTF8String];

              v98 = strdup(v97);
              uint64_t v99 = self->indexOfIdMapping;
              self->directive_id_mapping[self->indexOfIdMapping].var3 = v98;
              self->directive_id_mapping[v99].var2.var0 = 0;
              v100 = &self->directive_id_mapping[self->indexOfIdMapping];
              v100->var2.var0 = 0;
              *(void *)&v100->var2.var1[2] = 0;
              v100->var2.var1[4] = 0;
              v101 = [v321 allKeys];
              v102 = [v101 objectAtIndexedSubscript:0];
              uint64_t v103 = [v102 integerValue];

              v39 = v321;
              if (v103)
              {
                long long v336 = 0u;
                long long v337 = 0u;
                long long v334 = 0u;
                long long v335 = 0u;
                id v104 = [v321 allKeys];
                uint64_t v105 = [v104 countByEnumeratingWithState:&v334 objects:v357 count:16];
                if (v105)
                {
                  uint64_t v106 = v105;
                  v293 = v20;
                  v302 = v25;
                  int v107 = 0;
                  uint64_t v108 = *(void *)v335;
                  do
                  {
                    uint64_t v109 = 0;
                    uint64_t v110 = v107;
                    do
                    {
                      if (*(void *)v335 != v108) {
                        objc_enumerationMutation(v104);
                      }
                      int v107 = v110 + 1;
                      self->directive_id_mapping[self->indexOfIdMapping].var2.var1[v110++] = [*(id *)(*((void *)&v334 + 1) + 8 * v109++) intValue];
                    }
                    while (v106 != v109);
                    uint64_t v106 = [v104 countByEnumeratingWithState:&v334 objects:v357 count:16];
                  }
                  while (v106);
                  v20 = v293;
                  v25 = v302;
                  v39 = v321;
                }
              }
              else
              {
                v256 = (void *)MEMORY[0x1E4F1C0F8];
                v257 = lowercase_keys(v321);
                v258 = [v256 dictionaryWithDictionary:v257];

                id v104 = v258;
                self->directive_id_mapping[self->indexOfIdMapping].var2.var0 = (__CFDictionary *)v104;
              }

              v259 = self->mapInflatedIndexToSize;
              v260 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v261 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v317];
              [(NSMutableDictionary *)v259 setObject:v260 forKey:v261];

              int indexOfIdMapping = self->indexOfIdMapping;
              uint64_t v11 = v291;
              v29 = v315;
            }
            else
            {
              v39 = 0;
            }
            self->int indexOfIdMapping = indexOfIdMapping + 1;
            goto LABEL_173;
          case 7uLL:
            unsigned int sizeOfResultSetIdMapping = self->sizeOfResultSetIdMapping;
            int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
            if (sizeOfResultSetIdMapping == indexOfResultSetIdMapping)
            {
              unsigned int v113 = sizeOfResultSetIdMapping | (sizeOfResultSetIdMapping >> 1) | ((sizeOfResultSetIdMapping | (sizeOfResultSetIdMapping >> 1)) >> 2);
              unsigned int v114 = v113 | (v113 >> 4) | ((v113 | (v113 >> 4)) >> 8);
              int v115 = (v114 | HIWORD(v114)) + 1;
              self->unsigned int sizeOfResultSetIdMapping = v115;
              self->directive_resultset_id_mapping = (_resultset_id_mapping *)malloc_type_realloc(self->directive_resultset_id_mapping, 56 * v115, 0x10F20409CFFA869uLL);
              int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
            }
            if (v321)
            {
              self->directive_resultset_id_mapping[indexOfResultSetIdMapping].var0 = v21;
              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var1 = [v321 count]
                                                                                         + v21;
              uint64_t v116 = [v321 count];
              cumulativeInflatedFeaturesCount = v116 + cumulativeInflatedFeaturesCount - 1;
              id v117 = [v316 firstObject];
              v118 = (const char *)[v117 UTF8String];

              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var3 = strdup(v118);
              v119 = [v321 allKeys];
              v120 = [v119 objectAtIndexedSubscript:0];
              uint64_t v121 = [v120 integerValue];

              v39 = v321;
              if (v121)
              {
                v294 = v20;
                v303 = v25;
                long long v332 = 0u;
                long long v333 = 0u;
                long long v330 = 0u;
                long long v331 = 0u;
                v122 = [v321 allKeys];
                uint64_t v123 = [v122 countByEnumeratingWithState:&v330 objects:v356 count:16];
                if (v123)
                {
                  uint64_t v124 = v123;
                  int v125 = 0;
                  uint64_t v126 = *(void *)v331;
                  do
                  {
                    uint64_t v127 = 0;
                    uint64_t v128 = v125;
                    do
                    {
                      if (*(void *)v331 != v126) {
                        objc_enumerationMutation(v122);
                      }
                      int v125 = v128 + 1;
                      self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var1[v128++] = [*(id *)(*((void *)&v330 + 1) + 8 * v127++) intValue];
                    }
                    while (v124 != v127);
                    uint64_t v124 = [v122 countByEnumeratingWithState:&v330 objects:v356 count:16];
                  }
                  while (v124);
                }

                self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var0 = 0;
                uint64_t v11 = v291;
                v20 = v294;
                v25 = v303;
                v39 = v321;
              }
              else
              {
                v249 = (void *)MEMORY[0x1E4F1C0F8];
                v250 = lowercase_keys(v321);
                v251 = [v249 dictionaryWithDictionary:v250];

                v252 = v251;
                self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var0 = v252;

                uint64_t v11 = v291;
              }
              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var4 = 0;
              v253 = self->mapInflatedIndexToSize;
              v254 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v255 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v317];
              [(NSMutableDictionary *)v253 setObject:v254 forKey:v255];

              int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
              v29 = v315;
            }
            else
            {
              v39 = 0;
            }
            self->int indexOfResultSetIdMapping = indexOfResultSetIdMapping + 1;
LABEL_173:
            uint64_t v36 = v313;
            v22 = v316;
            goto LABEL_162;
          case 8uLL:
            unsigned int sizeOfResultSetIdScoreMapping = self->sizeOfResultSetIdScoreMapping;
            int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
            if (sizeOfResultSetIdScoreMapping == indexOfResultSetIdScoreMapping)
            {
              unsigned int v131 = sizeOfResultSetIdScoreMapping | (sizeOfResultSetIdScoreMapping >> 1) | ((sizeOfResultSetIdScoreMapping | (sizeOfResultSetIdScoreMapping >> 1)) >> 2);
              unsigned int v132 = v131 | (v131 >> 4) | ((v131 | (v131 >> 4)) >> 8);
              int v133 = (v132 | HIWORD(v132)) + 1;
              self->unsigned int sizeOfResultSetIdScoreMapping = v133;
              self->directive_resultset_id_score_mapping = (_resultset_id_score_mapping *)malloc_type_realloc(self->directive_resultset_id_score_mapping, (uint64_t)v133 << 6, 0x10F2040D14D0496uLL);
              int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
            }
            if (v321)
            {
              self->directive_resultset_id_score_mapping[(uint64_t)indexOfResultSetIdScoreMapping].var0 = v21;
              self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var1 = [v321 count] + v21;
              uint64_t v134 = [v321 count];
              cumulativeInflatedFeaturesCount = v134 + cumulativeInflatedFeaturesCount - 1;
              id v135 = [v22 firstObject];
              v136 = (const char *)[v135 UTF8String];

              self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var4 = strdup(v136);
              v137 = [v321 allKeys];
              v138 = [v137 objectAtIndexedSubscript:0];
              uint64_t v139 = [v138 integerValue];

              v39 = v321;
              if (v139)
              {
                v295 = v20;
                v304 = v25;
                long long v328 = 0u;
                long long v329 = 0u;
                long long v326 = 0u;
                long long v327 = 0u;
                v140 = [v321 allKeys];
                uint64_t v141 = [v140 countByEnumeratingWithState:&v326 objects:v355 count:16];
                if (v141)
                {
                  uint64_t v142 = v141;
                  int v143 = 0;
                  uint64_t v144 = *(void *)v327;
                  do
                  {
                    uint64_t v145 = 0;
                    uint64_t v146 = v143;
                    do
                    {
                      if (*(void *)v327 != v144) {
                        objc_enumerationMutation(v140);
                      }
                      int v143 = v146 + 1;
                      self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var1[v146++] = [*(id *)(*((void *)&v326 + 1) + 8 * v145++) intValue];
                    }
                    while (v142 != v145);
                    uint64_t v142 = [v140 countByEnumeratingWithState:&v326 objects:v355 count:16];
                  }
                  while (v142);
                }

                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var0 = 0;
                v20 = v295;
                v25 = v304;
                v39 = v321;
              }
              else
              {
                v262 = (void *)MEMORY[0x1E4F1C0F8];
                v263 = lowercase_keys(v321);
                v264 = [v262 dictionaryWithDictionary:v263];

                v265 = v264;
                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var0 = v265;
              }
              uint64_t v11 = v291;
              if (v314)
              {
                v266 = (void *)MEMORY[0x1E4F1C0F8];
                v267 = lowercase_keys(v314);
                v268 = [v266 dictionaryWithDictionary:v267];

                v269 = v268;
                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var3 = v269;

                uint64_t v270 = self->indexOfResultSetIdScoreMapping;
              }
              else
              {
                uint64_t v270 = self->indexOfResultSetIdScoreMapping;
                self->directive_resultset_id_score_mapping[v270].var3 = 0;
              }
              self->directive_resultset_id_score_mapping[v270].var5 = 0;
              v271 = self->mapInflatedIndexToSize;
              v272 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v273 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v317];
              [(NSMutableDictionary *)v271 setObject:v272 forKey:v273];

              int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
              v29 = v315;
              v22 = v316;
            }
            else
            {
              v39 = 0;
            }
            self->int indexOfResultSetIdScoreMapping = indexOfResultSetIdScoreMapping + 1;
            goto LABEL_180;
          case 9uLL:
            id v147 = v22;

            v290 = v147;
            v22 = v316;
            goto LABEL_160;
          case 10uLL:
            unsigned int sizeOfOneSidedInverse = self->sizeOfOneSidedInverse;
            int indexOfOneSidedInverse = self->indexOfOneSidedInverse;
            directive_one_sided_inverse = self->directive_one_sided_inverse;
            if (sizeOfOneSidedInverse == indexOfOneSidedInverse)
            {
              unsigned int v151 = sizeOfOneSidedInverse | (sizeOfOneSidedInverse >> 1) | ((sizeOfOneSidedInverse | (sizeOfOneSidedInverse >> 1)) >> 2);
              unsigned int v152 = v151 | (v151 >> 4) | ((v151 | (v151 >> 4)) >> 8);
              int v153 = (v152 | HIWORD(v152)) + 1;
              self->unsigned int sizeOfOneSidedInverse = v153;
              directive_one_sided_inverse = (_one_sided_inverse *)malloc_type_realloc(directive_one_sided_inverse, 16 * v153, 0x1000040451B5BE8uLL);
              self->directive_one_sided_inverse = directive_one_sided_inverse;
              int indexOfOneSidedInverse = self->indexOfOneSidedInverse;
            }
            uint64_t v36 = v313;
            directive_one_sided_inverse[indexOfOneSidedInverse].var0 = v21;
            uint64_t v154 = [v22 count];
            uint64_t v155 = self->indexOfOneSidedInverse;
            self->directive_one_sided_inverse[v155].var1 = v154 + v21;
            self->int indexOfOneSidedInverse = v155 + 1;
            break;
          case 11uLL:
            unsigned int sizeOfQuantize = self->sizeOfQuantize;
            if (sizeOfQuantize == self->indexOfQuantize)
            {
              unsigned int v157 = sizeOfQuantize | (sizeOfQuantize >> 1) | ((sizeOfQuantize | (sizeOfQuantize >> 1)) >> 2);
              unsigned int v158 = v157 | (v157 >> 4) | ((v157 | (v157 >> 4)) >> 8);
              int v159 = (v158 | HIWORD(v158)) + 1;
              self->unsigned int sizeOfQuantize = v159;
              self->directive_quantize = (_quantize *)malloc_type_realloc(self->directive_quantize, 32 * v159, 0x10800403A84FC25uLL);
            }
            uint64_t v36 = v313;
            if (!v321)
            {
              v39 = 0;
              goto LABEL_162;
            }
            v160 = [v321 objectForKey:@"bins"];
            v161 = v160;
            if (v160 && [v160 count])
            {
              unint64_t v162 = [v161 count];
              self->directive_quantize[self->indexOfQuantize].var3 = v162;
              self->directive_quantize[self->indexOfQuantize].var2 = (float *)malloc_type_calloc(v162, 4uLL, 0x100004052888210uLL);
              if ([v161 count])
              {
                unint64_t v163 = 0;
                do
                {
                  v164 = [v161 objectAtIndex:v163];
                  [v164 floatValue];
                  self->directive_quantize[self->indexOfQuantize].var2[v163] = v165;

                  ++v163;
                }
                while ([v161 count] > v163);
              }
              self->directive_quantize[self->indexOfQuantize].var0 = v21;
              self->directive_quantize[self->indexOfQuantize].var1 = [v316 count] + v21;
              unint64_t v166 = [v161 count];
              uint64_t indexOfQuantize = self->indexOfQuantize;
              self->directive_quantize[indexOfQuantize].var3 = v166;
              self->uint64_t indexOfQuantize = indexOfQuantize + 1;
              uint64_t v36 = v313;
              v29 = v315;
            }

            goto LABEL_126;
          case 12uLL:
            id v308 = v27;
            v168 = v321;
            if (!v321) {
              goto LABEL_130;
            }
            v169 = [v13 objectForKey:@"features"];
            unint64_t v296 = [v169 count];
            uint64_t v170 = [v321 count];
            self->directive_local_resultset_id_values_mapping.start_idx = v21;
            self->directive_local_resultset_id_values_mapping.end_idx = v170 * v296 + v21;
            uint64_t v171 = v170 * v296 - 1;
            cumulativeInflatedFeaturesCount += v171;
            v172 = (void *)MEMORY[0x1E4F1C0F8];
            v173 = lowercase_keys(v321);
            v174 = [v172 dictionaryWithDictionary:v173];

            v287 = v174;
            self->directive_local_resultset_id_values_mapping.mapping = v287;
            v175 = self->mapInflatedIndexToSize;
            v176 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v171];
            v177 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v317];
            [(NSMutableDictionary *)v175 setObject:v176 forKey:v177];

            self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder = (unint64_t *)malloc_type_malloc(8 * v296, 0x100004000313F17uLL);
            self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers = (id *)malloc_type_malloc(8 * [v169 count], 0x80040B8603338uLL);
            id v27 = v308;
            if ([v169 count])
            {
              unint64_t v178 = 0;
              do
              {
                v179 = [v169 objectAtIndexedSubscript:v178];
                unint64_t v180 = [v179 count];

                if (v180 >= 4)
                {
                  v181 = [v169 objectAtIndexedSubscript:v178];
                  v182 = [v181 objectAtIndexedSubscript:3];

                  v183 = [v169 objectAtIndexedSubscript:v178];
                  v184 = [v183 objectAtIndexedSubscript:4];

                  v185 = [(id)sLocalRSFeatureNameToBundleFeatureMappings objectForKeyedSubscript:v182];
                  self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder[v178] = [v185 unsignedIntegerValue];

                  int v186 = [v184 isEqualToString:@"min"];
                  v187 = (id *)&sMinPicker;
                  if (!v186) {
                    v187 = (id *)&sMaxPicker;
                  }
                  self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v178] = *v187;
                }
                ++v178;
              }
              while (v178 < [v169 count]);
            }
            self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures = v296;
            self->directive_local_resultset_id_values_mapping.mapSize = 0;

            uint64_t v11 = v291;
            uint64_t v36 = v313;
            v29 = v315;
            goto LABEL_126;
          case 13uLL:
            id v308 = v27;
            v168 = v321;
            if (!v321)
            {
LABEL_130:
              uint64_t v36 = v313;
              v39 = v168;
              id v27 = v308;
              goto LABEL_162;
            }
            v188 = [v13 objectForKey:@"features"];
            unint64_t v189 = [v188 count];
            uint64_t v190 = [v321 count];
            self->directive_parsec_resultset_id_values_mapping.start_idx = v21;
            self->directive_parsec_resultset_id_values_mapping.end_idx = v190 * v189 + v21;
            unint64_t v297 = v190 * v189;
            uint64_t v191 = v190 * v189 - 1;
            cumulativeInflatedFeaturesCount += v191;
            v192 = (void *)MEMORY[0x1E4F1C0F8];
            v193 = lowercase_keys(v321);
            v194 = [v192 dictionaryWithDictionary:v193];

            v288 = v194;
            self->directive_parsec_resultset_id_values_mapping.mapping = v288;
            v195 = self->mapInflatedIndexToSize;
            v196 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v191];
            v197 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v317];
            [(NSMutableDictionary *)v195 setObject:v196 forKey:v197];

            self->directive_parsec_resultset_id_values_mapping.numFeatures = v189;
            self->directive_parsec_resultset_id_values_mapping.PRSRankingBundleFeaturePickers = (id *)malloc_type_malloc(8 * v189, 0x80040B8603338uLL);
            id v27 = v308;
            if ([v188 count])
            {
              unint64_t v198 = 0;
              do
              {
                v199 = [v188 objectAtIndexedSubscript:v198];
                unint64_t v200 = [v199 count];

                if (v200 >= 4)
                {
                  v201 = [v188 objectAtIndexedSubscript:v198];
                  v202 = [v201 objectAtIndexedSubscript:4];

                  int v203 = [v202 isEqualToString:@"min"];
                  v204 = (id *)&sMinPicker;
                  if (!v203) {
                    v204 = (id *)&sMaxPicker;
                  }
                  self->directive_parsec_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v198] = *v204;
                }
                ++v198;
              }
              while (v198 < [v188 count]);
            }
            v205 = (float *)malloc_type_malloc(4 * v297, 0x100004052888210uLL);
            self->directive_parsec_resultset_id_values_mapping.score_vector = v205;
            self->directive_parsec_resultset_id_values_mapping.mapSize = 4 * v297;
            uint64_t v11 = v291;
            v29 = v315;
            if (v297) {
              memset_pattern16(v205, &unk_1BDC5D330, 4 * v297);
            }

            uint64_t v36 = v313;
LABEL_126:
            v22 = v316;
            break;
          case 14uLL:
            v39 = v321;
            if ([v321 count])
            {
              v40 = [v321 objectForKey:@"model_weight_x"];
              v41 = [v321 objectForKey:@"model_weight_y"];
              [v40 doubleValue];
              -[PRSDirectivesManager setWeightX:](self, "setWeightX:");
              [v41 doubleValue];
              -[PRSDirectivesManager setWeightY:](self, "setWeightY:");

              v22 = v316;
            }
LABEL_180:
            uint64_t v36 = v313;
            goto LABEL_162;
          case 15uLL:
            unsigned int sizeOfFanOutValue = self->sizeOfFanOutValue;
            int indexOfFanOutValue = self->indexOfFanOutValue;
            directive_fan_out = self->directive_fan_out;
            if (sizeOfFanOutValue == indexOfFanOutValue)
            {
              unsigned int v209 = sizeOfFanOutValue | (sizeOfFanOutValue >> 1) | ((sizeOfFanOutValue | (sizeOfFanOutValue >> 1)) >> 2);
              unsigned int v210 = v209 | (v209 >> 4) | ((v209 | (v209 >> 4)) >> 8);
              int v211 = (v210 | HIWORD(v210)) + 1;
              self->unsigned int sizeOfFanOutValue = v211;
              directive_fan_out = (fan_out_value *)malloc_type_realloc(directive_fan_out, 16 * v211, 0x1000040451B5BE8uLL);
              self->directive_fan_out = directive_fan_out;
              int indexOfFanOutValue = self->indexOfFanOutValue;
            }
            uint64_t v36 = v313;
            directive_fan_out[indexOfFanOutValue].var0 = v21;
            uint64_t v212 = [v22 count];
            uint64_t v213 = self->indexOfFanOutValue;
            self->directive_fan_out[v213].var1 = v212 + v21;
            cumulativeInflatedFeaturesCount += 95;
            self->int indexOfFanOutValue = v213 + 1;
            break;
          default:
            goto LABEL_160;
        }
      }
      else
      {
LABEL_160:
        uint64_t v36 = v313;
      }
      v39 = v321;
LABEL_162:

      uint64_t v12 = v36 + 1;
    }
    while (v12 != v11);
    id v8 = obj;
    uint64_t v274 = [obj countByEnumeratingWithState:&v350 objects:v362 count:16];
    uint64_t v11 = v274;
  }
  while (v274);
LABEL_184:

  if ([(id)v10[353] count])
  {
    v275 = +[PRSL2FeatureVector contextWithFeatureOrder:v10[353] withInflation:cumulativeInflatedFeaturesCount withInflatedIndexToSize:self->mapInflatedIndexToSize];
    [(PRSDirectivesManager *)self setProcessingContext:v275];
  }
  v276 = v290;
  if (v290)
  {
    id v277 = v8;
    v278 = (NSMutableIndexSet *)objc_opt_new();
    v279 = self->disabledFeatureIndices;
    self->disabledFeatureIndices = v278;

    long long v324 = 0u;
    long long v325 = 0u;
    long long v322 = 0u;
    long long v323 = 0u;
    id v280 = v290;
    uint64_t v281 = [v280 countByEnumeratingWithState:&v322 objects:v354 count:16];
    if (v281)
    {
      uint64_t v282 = v281;
      uint64_t v283 = *(void *)v323;
      do
      {
        for (uint64_t i = 0; i != v282; ++i)
        {
          if (*(void *)v323 != v283) {
            objc_enumerationMutation(v280);
          }
          uint64_t v285 = [(id)v10[353] indexOfObject:*(void *)(*((void *)&v322 + 1) + 8 * i)];
          if (v285 != 0x7FFFFFFFFFFFFFFFLL) {
            [(NSMutableIndexSet *)self->disabledFeatureIndices addIndex:v285];
          }
        }
        uint64_t v282 = [v280 countByEnumeratingWithState:&v322 objects:v354 count:16];
      }
      while (v282);
    }

    id v8 = v277;
    v276 = v290;
  }
  cumulativeInflatedFeaturesCount = 0;
  [(id)v10[353] removeAllObjects];
}

- (void)processResultSetValuesWithMap:(id)a3 serverFeatures:(id)a4
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v142 = a4;
  id v133 = v6;
  id v143 = (id)[v6 copy];
  int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
  v137 = self;
  if (indexOfResultSetIdScoreMapping >= 1)
  {
    id v8 = 0;
    do
    {
      uint64_t v9 = self->directive_resultset_id_score_mapping[(void)v8].var2.var0;
      uint64_t v141 = self->directive_resultset_id_score_mapping[(void)v8].var3;
      v10 = [(__CFDictionary *)v9 allKeys];
      uint64_t v11 = malloc_type_malloc(4 * [v10 count], 0x100004052888210uLL);

      uint64_t v12 = [(__CFDictionary *)v9 allKeys];
      uint64_t v13 = [v12 count];

      if (v13) {
        memset_pattern16(v11, &unk_1BDC5D330, 4 * v13);
      }
      self->directive_resultset_id_score_mapping[(void)v8].var5 = (float *)v11;
      if (([v143 count] || objc_msgSend(v142, "count"))
        && !strcmp("resultset_bundle_id_score", self->directive_resultset_id_score_mapping[(void)v8].var4))
      {
        v140 = v11;
        v138 = v8;
        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        id v139 = [v143 keyEnumerator];
        uint64_t v14 = [v139 countByEnumeratingWithState:&v168 objects:v178 count:16];
        uint64_t v15 = v141;
        if (v14)
        {
          uint64_t v16 = v14;
          uint64_t v17 = *(void *)v169;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v169 != v17) {
                objc_enumerationMutation(v139);
              }
              char v19 = *(void **)(*((void *)&v168 + 1) + 8 * i);
              v20 = [v19 lowercaseString];
              unint64_t v21 = [(__CFDictionary *)v9 objectForKey:v20];
              v22 = [v143 objectForKey:v19];
              uint64_t v23 = [v22 objectAtIndexedSubscript:0];

              uint64_t v24 = [(__CFDictionary *)v15 objectForKey:v20];

              if (!v24)
              {
                if (v21)
                {
                  unint64_t v25 = [v21 unsignedIntegerValue];
                }
                else
                {
                  id v26 = [(__CFDictionary *)v9 objectForKey:@"__none_of_the_above__"];
                  unint64_t v25 = [v26 unsignedIntegerValue];
                }
                id v27 = [(__CFDictionary *)v9 allKeys];
                if (v25 >= [v27 count]) {
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.6();
                }

                [v23 floatValue];
                v140[v25] = v28;
                uint64_t v15 = v141;
              }
            }
            uint64_t v16 = [v139 countByEnumeratingWithState:&v168 objects:v178 count:16];
          }
          while (v16);
        }

        long long v166 = 0u;
        long long v167 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        id v139 = [v142 keyEnumerator];
        uint64_t v29 = [v139 countByEnumeratingWithState:&v164 objects:v177 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v165;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v165 != v31) {
                objc_enumerationMutation(v139);
              }
              unsigned int v33 = *(void **)(*((void *)&v164 + 1) + 8 * j);
              unsigned int v34 = [v33 lowercaseString];
              int v35 = [(__CFDictionary *)v9 objectForKey:v34];
              uint64_t v36 = [v142 objectForKey:v33];
              uint64_t v37 = [v36 maxScore];

              uint64_t v38 = [(__CFDictionary *)v15 objectForKey:v34];

              if (!v38)
              {
                if (v35)
                {
                  unint64_t v39 = [v35 unsignedIntegerValue];
                }
                else
                {
                  v40 = [(__CFDictionary *)v9 objectForKey:@"__none_of_the_above__"];
                  unint64_t v39 = [v40 unsignedIntegerValue];
                }
                v41 = [(__CFDictionary *)v9 allKeys];
                if (v39 >= [v41 count]) {
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.5();
                }

                [v37 floatValue];
                v140[v39] = v42;
                uint64_t v15 = v141;
              }
            }
            uint64_t v30 = [v139 countByEnumeratingWithState:&v164 objects:v177 count:16];
          }
          while (v30);
        }

        self = v137;
        id v8 = v138;
      }

      id v8 = (__CFDictionary *)((char *)v8 + 1);
    }
    while ((uint64_t)v8 < self->indexOfResultSetIdScoreMapping);
  }
  v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v143, "count"));
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  unsigned int v44 = [v143 keyEnumerator];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v160 objects:v176 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v161;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v161 != v47) {
          objc_enumerationMutation(v44);
        }
        [v43 addObject:*(void *)(*((void *)&v160 + 1) + 8 * k)];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v160 objects:v176 count:16];
    }
    while (v46);
  }

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  v49 = [v142 keyEnumerator];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v156 objects:v175 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v157;
    do
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v157 != v52) {
          objc_enumerationMutation(v49);
        }
        [v43 addObject:*(void *)(*((void *)&v156 + 1) + 8 * m)];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v156 objects:v175 count:16];
    }
    while (v51);
  }

  int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
  uint64_t v134 = v43;
  if (indexOfResultSetIdMapping >= 1)
  {
    uint64_t v55 = 0;
    do
    {
      v56 = self->directive_resultset_id_mapping[v55].var2.var0;
      v57 = [(__CFDictionary *)v56 allKeys];
      v58 = (float *)malloc_type_calloc([v57 count], 4uLL, 0x100004052888210uLL);

      self->directive_resultset_id_mapping[v55].var4 = v58;
      if ([v43 count] && !strcmp("resultset_bundle_id", self->directive_resultset_id_mapping[v55].var3))
      {
        v140 = (_DWORD *)v55;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        uint64_t v141 = v43;
        uint64_t v59 = [(__CFDictionary *)v141 countByEnumeratingWithState:&v152 objects:v174 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = *(void *)v153;
          do
          {
            for (uint64_t n = 0; n != v60; ++n)
            {
              if (*(void *)v153 != v61) {
                objc_enumerationMutation(v141);
              }
              v63 = [*(id *)(*((void *)&v152 + 1) + 8 * n) lowercaseString];
              v64 = [(__CFDictionary *)v56 objectForKey:v63];
              if (v64)
              {
                unsigned int v65 = [(__CFDictionary *)v56 objectForKey:v63];
                uint64_t v66 = [v65 unsignedIntegerValue];
              }
              else
              {
                unsigned int v65 = [(__CFDictionary *)v56 objectForKey:@"__none_of_the_above__"];
                uint64_t v66 = [v65 integerValue];
              }
              unint64_t v67 = v66;

              v68 = [(__CFDictionary *)v56 allKeys];
              if (v67 >= [v68 count]) {
                -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.4();
              }

              v58[v67] = 1.0;
            }
            uint64_t v60 = [(__CFDictionary *)v141 countByEnumeratingWithState:&v152 objects:v174 count:16];
          }
          while (v60);
        }

        self = v137;
        v43 = v134;
        uint64_t v55 = (uint64_t)v140;
      }

      ++v55;
    }
    while (v55 < self->indexOfResultSetIdMapping);
  }
  if ([v143 count])
  {
    mapping = self->directive_local_resultset_id_values_mapping.mapping;
    if (mapping)
    {
      v70 = mapping;
      uint64_t v71 = [(__CFDictionary *)v70 count];
      unint64_t numPRSRankingBundleFeatures = self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures;
      unint64_t v132 = v71;
      v140 = (_DWORD *)(4 * v71 * numPRSRankingBundleFeatures);
      if (self->directive_local_resultset_id_values_mapping.mapSize < (unint64_t)v140)
      {
        unint64_t v73 = (unint64_t)v140;
        self->directive_local_resultset_id_values_mapping.score_vector = (float *)malloc_type_realloc(self->directive_local_resultset_id_values_mapping.score_vector, (size_t)v140, 0x43D5FDC6uLL);
        self->directive_local_resultset_id_values_mapping.mapSize = v73;
        unint64_t numPRSRankingBundleFeatures = self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures;
      }
      score_vector = self->directive_local_resultset_id_values_mapping.score_vector;
      if (numPRSRankingBundleFeatures * v132) {
        memset_pattern16(self->directive_local_resultset_id_values_mapping.score_vector, &unk_1BDC5D330, 4 * numPRSRankingBundleFeatures * v132);
      }
      if ((unint64_t)v140 < 4
                                  * (self->directive_local_resultset_id_values_mapping.end_idx
                                   - self->directive_local_resultset_id_values_mapping.start_idx))
        -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]();
      if (numPRSRankingBundleFeatures)
      {
        v75 = 0;
        do
        {
          PRSRankingBundleFeatureOrder = self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder;
          id v135 = v75;
          uint64_t v141 = (__CFDictionary *)PRSRankingBundleFeatureOrder[(void)v75];
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v136 = [v143 keyEnumerator];
          uint64_t v77 = [v136 countByEnumeratingWithState:&v148 objects:v173 count:16];
          if (v77)
          {
            uint64_t v78 = v77;
            uint64_t v79 = *(void **)v149;
            v138 = (__CFDictionary *)((void)v135 * v132);
            id v139 = v79;
            do
            {
              for (iuint64_t i = 0; ii != v78; ++ii)
              {
                if (*(id *)v149 != v139) {
                  objc_enumerationMutation(v136);
                }
                int v81 = score_vector;
                int v82 = *(void **)(*((void *)&v148 + 1) + 8 * ii);
                uint64_t v83 = [v143 objectForKey:v82];
                uint64_t v84 = [v82 lowercaseString];
                uint64_t v85 = [(__CFDictionary *)v70 objectForKey:v84];

                if (v85)
                {
                  uint64_t v86 = [(__CFDictionary *)v70 objectForKey:v84];
                  uint64_t v87 = [v86 unsignedIntegerValue];

                  v88 = [v83 objectAtIndexedSubscript:v141];
                  [v88 floatValue];
                  float v90 = v89;

                  unint64_t v91 = (unint64_t)v138 + v87;
                }
                else
                {
                  unsigned int v92 = [(__CFDictionary *)v70 objectForKey:@"__none_of_the_above__"];
                  uint64_t v93 = [v92 integerValue];

                  unint64_t v91 = (unint64_t)v138 + v93;
                  int v94 = (float (**)(id))v137->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[(void)v135];
                  uint64_t v95 = [v83 objectAtIndexedSubscript:v141];
                  [v95 floatValue];
                  float v90 = v94[2](v94);
                }
                if (v91 >= (unint64_t)v140) {
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]();
                }
                score_vector = v81;
                v81[v91] = v90;
              }
              uint64_t v78 = [v136 countByEnumeratingWithState:&v148 objects:v173 count:16];
            }
            while (v78);
          }

          v75 = (float *)((char *)v135 + 1);
          self = v137;
        }
        while ((unint64_t)v135 + 1 < v137->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures);
      }

      v43 = v134;
    }
  }
  if ([v142 count])
  {
    id v96 = self->directive_parsec_resultset_id_values_mapping.mapping;
    v97 = (float *)[(__CFDictionary *)v96 count];
    unint64_t numFeatures = self->directive_parsec_resultset_id_values_mapping.numFeatures;
    id v135 = v97;
    unint64_t v105 = numFeatures * (void)v97;
    uint64_t v141 = (__CFDictionary *)(4 * numFeatures * (void)v97);
    if (self->directive_parsec_resultset_id_values_mapping.mapSize < (unint64_t)v141)
    {
      uint64_t v106 = v141;
      v97 = (float *)malloc_type_realloc(self->directive_parsec_resultset_id_values_mapping.score_vector, (size_t)v141, 0xB319E144uLL);
      self->directive_parsec_resultset_id_values_mapping.score_vector = v97;
      self->directive_parsec_resultset_id_values_mapping.mapSize = (unint64_t)v106;
    }
    int v107 = self->directive_parsec_resultset_id_values_mapping.score_vector;
    if (v105) {
      memset_pattern16(self->directive_parsec_resultset_id_values_mapping.score_vector, &unk_1BDC5D330, (size_t)v141);
    }
    id v139 = v107;
    if (processResultSetValuesWithMap_serverFeatures__onceToken != -1) {
      dispatch_once(&processResultSetValuesWithMap_serverFeatures__onceToken, &__block_literal_global_354);
    }
    v131[1] = v131;
    MEMORY[0x1F4188790](v97, 8 * numFeatures, v98, v99, v100, v101, v102, v103);
    v140 = (_DWORD *)((char *)v131 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v140, v108);
    if (numFeatures)
    {
      uint64_t v109 = 0;
      uint64_t v110 = v140;
      do
      {
        v111 = [(id)processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors objectAtIndexedSubscript:v109];
        *(void *)&v110[2 * v109] = NSSelectorFromString(v111);

        ++v109;
      }
      while (numFeatures != v109);
      uint64_t v112 = 0;
      v138 = v96;
      unint64_t v132 = numFeatures;
      do
      {
        long long v146 = 0u;
        long long v147 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        id v136 = [v142 keyEnumerator];
        uint64_t v113 = [v136 countByEnumeratingWithState:&v144 objects:v172 count:16];
        if (v113)
        {
          uint64_t v114 = v113;
          uint64_t v115 = *(void *)v145;
          uint64_t v116 = v112 * (void)v135;
          do
          {
            for (juint64_t j = 0; jj != v114; ++jj)
            {
              if (*(void *)v145 != v115) {
                objc_enumerationMutation(v136);
              }
              v118 = *(void **)(*((void *)&v144 + 1) + 8 * jj);
              v119 = [v142 objectForKey:v118];
              objc_msgSend((id)objc_msgSend(v119, "performSelector:", *(void *)&v140[2 * v112]), "floatValue");
              float v121 = v120;
              v122 = [v118 lowercaseString];
              uint64_t v123 = [(__CFDictionary *)v96 objectForKey:v122];

              if (v123)
              {
                uint64_t v124 = [(__CFDictionary *)v96 objectForKey:v122];
                uint64_t v125 = [v124 unsignedIntegerValue];

                unint64_t v126 = v125 + v116;
                uint64_t v127 = (float *)v139;
              }
              else
              {
                uint64_t v128 = [(__CFDictionary *)v96 objectForKey:@"__none_of_the_above__"];
                uint64_t v129 = [v128 integerValue];

                unint64_t v126 = v129 + v116;
                uint64_t v127 = (float *)v139;
                float v121 = (*((float (**)(float, float))v137->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v112]
                        + 2))(v121, *((float *)v139 + v126));
              }
              if (v126 >= (unint64_t)v141) {
                -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]();
              }
              v127[v126] = v121;

              id v96 = v138;
            }
            uint64_t v114 = [v136 countByEnumeratingWithState:&v144 objects:v172 count:16];
          }
          while (v114);
        }

        ++v112;
      }
      while (v112 != v132);
    }
    v43 = v134;
LABEL_119:

    goto LABEL_120;
  }
  if (self->directive_parsec_resultset_id_values_mapping.mapSize)
  {
    id v96 = self->directive_parsec_resultset_id_values_mapping.mapping;
    unint64_t v130 = self->directive_parsec_resultset_id_values_mapping.numFeatures * [(__CFDictionary *)v96 count];
    if (v130) {
      memset_pattern16(self->directive_parsec_resultset_id_values_mapping.score_vector, &unk_1BDC5D330, 4 * v130);
    }
    goto LABEL_119;
  }
LABEL_120:
}

void __69__PRSDirectivesManager_processResultSetValuesWithMap_serverFeatures___block_invoke()
{
  v13[11] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = NSStringFromSelector(sel_numResults);
  v13[0] = v12;
  v0 = NSStringFromSelector(sel_maxScoreAbsRank);
  v13[1] = v0;
  v1 = NSStringFromSelector(sel_maxScoreRelRank);
  v13[2] = v1;
  uint64_t v2 = NSStringFromSelector(sel_originalOrderAbsRank);
  v13[3] = v2;
  long long v3 = NSStringFromSelector(sel_originalOrderRelRank);
  v13[4] = v3;
  id v4 = NSStringFromSelector(sel_maxCEPAbsRank);
  v13[5] = v4;
  long long v5 = NSStringFromSelector(sel_maxCEPRelRank);
  v13[6] = v5;
  id v6 = NSStringFromSelector("cep");
  v13[7] = v6;
  v7 = NSStringFromSelector(sel_cepMaxRatio);
  v13[8] = v7;
  id v8 = NSStringFromSelector(sel_cepAllMaxRatio);
  v13[9] = v8;
  uint64_t v9 = NSStringFromSelector(sel_blockIdValue);
  v13[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:11];
  uint64_t v11 = (void *)processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors;
  processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors = v10;
}

- (void)cleanup
{
  int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
  if (indexOfResultSetIdMapping >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 48;
    do
    {
      id v6 = *(void **)((char *)&self->directive_resultset_id_mapping->var0 + v5);
      if (v6)
      {
        free(v6);
        *(unint64_t *)((char *)&self->directive_resultset_id_mapping->var0 + v5) = 0;
        int indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
      }
      ++v4;
      v5 += 56;
    }
    while (v4 < indexOfResultSetIdMapping);
  }
  int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
  if (indexOfResultSetIdScoreMapping >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 56;
    do
    {
      uint64_t v10 = *(void **)((char *)&self->directive_resultset_id_score_mapping->var0 + v9);
      if (v10)
      {
        free(v10);
        *(unint64_t *)((char *)&self->directive_resultset_id_score_mapping->var0 + v9) = 0;
        int indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
      }
      ++v8;
      v9 += 64;
    }
    while (v8 < indexOfResultSetIdScoreMapping);
  }
}

- (void)processL2FeatureVector:(id)a3 populatingValues:(float *)a4 scoreValue:(char *)a5 count:(int)a6
{
  uint64_t v6 = ((uint64_t (*)(PRSDirectivesManager *, SEL, id, float *, char *, void))MEMORY[0x1F4188790])(self, a2, a3, a4, a5, *(void *)&a6);
  int v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = v6;
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v15 = v14;
  uint64_t v16 = [(id)v13 processingContext];
  uint64_t v17 = [v16 expandedFeatureExecutionOrder];

  uint64_t v18 = v13;
  bzero(v157, 0x328CuLL);
  long long v152 = v15;
  uint64_t v19 = [v15 getAllScores:v157];
  uint64_t v20 = v19;
  uint64_t v21 = *(unsigned int *)(v13 + 8);
  if ((int)v21 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)(v13 + 104);
    do
    {
      uint64_t v24 = (unint64_t *)(v23 + 16 * v22);
      unint64_t v26 = *v24;
      unint64_t v25 = v24[1];
      BOOL v27 = v25 > v26;
      unint64_t v28 = v25 - v26;
      if (v27)
      {
        uint64_t v29 = (_DWORD *)(v12 + 4 * v26);
        uint64_t v30 = (unsigned __int16 *)(v17 + 2 * v26);
        do
        {
          unsigned int v31 = *v30++;
          *v29++ = *(_DWORD *)(v19 + 4 * v31);
          --v28;
        }
        while (v28);
      }
      ++v22;
    }
    while (v22 != v21);
  }
  uint64_t v32 = *(unsigned int *)(v13 + 16);
  if ((int)v32 >= 1)
  {
    uint64_t v33 = 0;
    uint64_t v34 = *(void *)(v13 + 120);
    int v35 = (float *)(v34 + 24);
    do
    {
      uint64_t v36 = (unint64_t *)(v34 + 40 * v33);
      unint64_t v37 = *v36;
      unint64_t v38 = v36[1];
      if (v37 < v38)
      {
        uint64_t v39 = *(void *)(v34 + 40 * v33 + 32);
        do
        {
          if (v39)
          {
            float v40 = *(float *)(v19 + 4 * *(unsigned __int16 *)(v17 + 2 * v37));
            uint64_t v41 = v39;
            int v42 = v35;
            do
            {
              float v43 = v40;
              if (v40 == *(v42 - 2)) {
                float v43 = *v42;
              }
              *(float *)(v12 + 4 * v37) = v43;
              ++v42;
              --v41;
            }
            while (v41);
          }
          ++v37;
        }
        while (v37 != v38);
      }
      ++v33;
      v35 += 10;
    }
    while (v33 != v32);
  }
  uint64_t v44 = *(unsigned int *)(v13 + 52);
  if ((int)v44 >= 1)
  {
    uint64_t v45 = 0;
    uint64_t v46 = *(void *)(v13 + 192);
    do
    {
      uint64_t v47 = (unint64_t *)(v46 + 16 * v45);
      unint64_t v48 = *v47;
      unint64_t v49 = v47[1];
      if (v48 < v49)
      {
        uint64_t v50 = (float *)(v12 + 4 * v48);
        do
        {
          uint64_t v51 = v8;
          uint64_t v52 = v10;
          unsigned int v53 = v50;
          if (v8 >= 1)
          {
            do
            {
              int v54 = *v52++;
              *v53++ = (float)v54;
              --v51;
            }
            while (v51);
          }
          ++v48;
          ++v50;
        }
        while (v48 != v49);
      }
      ++v45;
    }
    while (v45 != v44);
  }
  uint64_t v55 = *(int *)(v13 + 20);
  if (v55)
  {
    uint64_t v56 = 0;
    uint64_t v57 = *(void *)(v13 + 128);
    v58 = (float *)(v57 + 36);
    do
    {
      uint64_t v59 = (unint64_t *)(v57 + 72 * v56);
      unint64_t v60 = *v59;
      unint64_t v61 = v59[1];
      if (v60 < v61)
      {
        uint64_t v62 = v57 + 72 * v56;
        uint64_t v63 = *(void *)(v62 + 64);
        v64 = (float *)(v62 + 56);
        do
        {
          if (v63)
          {
            float v65 = *(float *)(v20 + 4 * *(unsigned __int16 *)(v17 + 2 * v60));
            uint64_t v66 = v63;
            unint64_t v67 = v58;
            do
            {
              float v68 = v65;
              if (v65 == *(v67 - 5)) {
                float v68 = *v67;
              }
              if (v68 < *v64) {
                float v68 = *v64;
              }
              *(float *)(v12 + 4 * v60) = v68;
              ++v67;
              --v66;
            }
            while (v66);
          }
          ++v60;
        }
        while (v60 != v61);
      }
      ++v56;
      v58 += 18;
    }
    while (v56 != v55);
  }
  uint64_t v155 = v13;
  if (*(int *)(v13 + 28) >= 1)
  {
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    long long v149 = @"com.apple.CoreSuggestions";
    do
    {
      uint64_t v71 = (uint64_t *)(*(void *)(v18 + 152) + v69);
      uint64_t v72 = *v71;
      bzero((void *)(v12 + 4 * *v71), 4 * (v71[1] - *v71));
      unint64_t v73 = [NSString stringWithUTF8String:*(void *)(*(void *)(v18 + 152) + v69 + 40)];
      if ([v73 isEqualToString:@"bundle_id"])
      {
        long long v153 = v73;
        id v74 = *(id *)(*(void *)(v18 + 152) + v69 + 16);
        v75 = [v152 bundleID];
        int v76 = [v75 lowercaseString];

        uint64_t v77 = [v74 objectForKey:v76];
        if (!v77) {
          goto LABEL_45;
        }
        uint64_t v78 = (void *)v77;
        [v74 objectForKey:v76];
        id v150 = v74;
        uint64_t v79 = v72;
        v81 = uint64_t v80 = v76;
        uint64_t v82 = [v81 integerValue];

        int v76 = v80;
        uint64_t v72 = v79;
        id v74 = v150;

        if (v82 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_45:
          objc_msgSend(v152, "scoreForFeature:", 372, v149);
          float v84 = v83;
          uint64_t v85 = [(__CFString *)v149 lowercaseString];
          long long v151 = v76;
          char v86 = [v76 isEqualToString:v85];

          uint64_t v87 = @"__third_party_none_of_the_above__";
          if ((v86 & 1) == 0)
          {
            uint64_t v87 = @"__parsec_none_of_the_above__";
            if (v84 == 0.0 && ([v151 hasPrefix:@"com.apple.parsec"] & 1) == 0)
            {
              if ([v151 hasPrefix:@"com.apple."]) {
                uint64_t v87 = 0;
              }
              else {
                uint64_t v87 = @"__third_party_none_of_the_above__";
              }
            }
          }
          uint64_t v88 = [v74 objectForKey:v87];
          if (!v88
            || (float v89 = (void *)v88,
                [v74 objectForKey:v87],
                float v90 = objc_claimAutoreleasedReturnValue(),
                uint64_t v82 = [v90 integerValue],
                v90,
                v89,
                v82 == 0x7FFFFFFFFFFFFFFFLL))
          {
            unint64_t v91 = [v74 objectForKey:@"__none_of_the_above__"];
            uint64_t v82 = [v91 integerValue];
          }
          int v76 = v151;
          if (!v82) {
            -[PRSDirectivesManager processL2FeatureVector:populatingValues:scoreValue:count:]();
          }
        }

        unint64_t v73 = v153;
        uint64_t v18 = v155;
      }
      else if ([v73 isEqualToString:@"device_type"])
      {
        id v92 = *(id *)(*(void *)(v18 + 152) + v69 + 16);
        objc_msgSend(v152, "device_type");
        uint64_t v93 = v154 = v73;
        int v94 = [v92 objectForKey:v93];

        uint64_t v18 = v155;
        uint64_t v82 = [v94 unsignedIntegerValue];

        unint64_t v73 = v154;
      }
      else if ([v73 isEqualToString:@"query_terms"])
      {
        uint64_t v82 = *(int *)(*(void *)(v18 + 152) + 4 * (unint64_t)*(float *)(v20 + 1452) + v69 + 16);
      }
      else
      {
        uint64_t v82 = 0;
      }
      *(_DWORD *)(v12 + 4 * (v82 + v72)) = 1065353216;

      ++v70;
      v69 += 48;
    }
    while (v70 < *(int *)(v18 + 28));
  }
  if (*(int *)(v18 + 32) >= 1)
  {
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    do
    {
      v97 = (uint64_t *)(*(void *)(v18 + 160) + v95);
      uint64_t v98 = *v97;
      uint64_t v99 = v97[1];
      uint64_t v100 = objc_msgSend(NSString, "stringWithUTF8String:", v97[5], v149);
      uint64_t v101 = *(const void **)(*(void *)(v18 + 160) + v95 + 48);
      if ([v100 isEqualToString:@"resultset_bundle_id"]) {
        BOOL v102 = v101 == 0;
      }
      else {
        BOOL v102 = 1;
      }
      if (!v102) {
        memcpy((void *)(v12 + 4 * v98), v101, 4 * (v99 - v98));
      }

      ++v96;
      uint64_t v18 = v155;
      v95 += 56;
    }
    while (v96 < *(int *)(v155 + 32));
  }
  uint64_t v103 = *(const void **)(v18 + 248);
  if (v103) {
    memcpy((void *)(v12 + 4 * *(void *)(v18 + 200)), v103, 4 * (*(void *)(v18 + 208) - *(void *)(v18 + 200)));
  }
  id v104 = *(const void **)(v18 + 304);
  if (v104) {
    memcpy((void *)(v12 + 4 * *(void *)(v18 + 264)), v104, 4 * (*(void *)(v18 + 272) - *(void *)(v18 + 264)));
  }
  if (*(int *)(v18 + 36) >= 1)
  {
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    do
    {
      int v107 = (uint64_t *)(*(void *)(v18 + 168) + v105);
      uint64_t v108 = *v107;
      uint64_t v109 = v107[1];
      uint64_t v110 = objc_msgSend(NSString, "stringWithUTF8String:", v107[6], v149);
      v111 = *(const void **)(*(void *)(v18 + 168) + v105 + 56);
      if ([v110 isEqualToString:@"resultset_bundle_id_score"]) {
        BOOL v112 = v111 == 0;
      }
      else {
        BOOL v112 = 1;
      }
      if (!v112) {
        memcpy((void *)(v12 + 4 * v108), v111, 4 * (v109 - v108));
      }

      ++v106;
      uint64_t v18 = v155;
      v105 += 64;
    }
    while (v106 < *(int *)(v155 + 36));
  }
  uint64_t v113 = *(unsigned int *)(v18 + 24);
  if ((int)v113 >= 1)
  {
    uint64_t v114 = 0;
    uint64_t v115 = *(void *)(v18 + 144);
    uint64_t v116 = (float *)(v115 + 36);
    do
    {
      id v117 = (unint64_t *)(v115 + (v114 << 6));
      unint64_t v118 = *v117;
      unint64_t v119 = v117[1];
      if (*v117 < v119)
      {
        unint64_t v120 = v117[7];
        do
        {
          if (v120)
          {
            float v121 = *(float *)(v20 + 4 * *(unsigned __int16 *)(v17 + 2 * v118));
            unint64_t v122 = v120;
            uint64_t v123 = v116;
            do
            {
              float v124 = v121;
              if (v121 == *(v123 - 5)) {
                float v124 = *v123;
              }
              *(float *)(v12 + 4 * v118) = v124;
              ++v123;
              --v122;
            }
            while (v122);
          }
          ++v118;
        }
        while (v118 != v119);
      }
      ++v114;
      v116 += 16;
    }
    while (v114 != v113);
  }
  uint64_t v125 = *(unsigned int *)(v18 + 40);
  if ((int)v125 >= 1)
  {
    uint64_t v126 = 0;
    uint64_t v127 = *(void *)(v18 + 136);
    do
    {
      uint64_t v128 = (unint64_t *)(v127 + 24 * v126);
      unint64_t v130 = *v128;
      unint64_t v129 = v128[1];
      BOOL v27 = v129 > v130;
      unint64_t v131 = v129 - v130;
      if (v27)
      {
        unint64_t v132 = (float *)(v12 + 4 * v130);
        id v133 = (unsigned __int16 *)(v17 + 2 * v130);
        do
        {
          unsigned int v134 = *v133++;
          float v135 = *(float *)(v20 + 4 * v134);
          if (v135 == -1.0) {
            float v135 = *(float *)(v127 + 24 * v126 + 16);
          }
          *v132++ = v135;
          --v131;
        }
        while (v131);
      }
      ++v126;
    }
    while (v126 != v125);
  }
  id v136 = *(void **)(v18 + 320);
  if (v136)
  {
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke;
    v156[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
    v156[4] = v12;
    [v136 enumerateIndexesUsingBlock:v156];
  }
  uint64_t v137 = *(unsigned int *)(v18 + 44);
  if ((int)v137 >= 1)
  {
    uint64_t v138 = 0;
    uint64_t v139 = *(void *)(v18 + 176);
    do
    {
      v140 = (unint64_t *)(v139 + 16 * v138);
      unint64_t v142 = *v140;
      unint64_t v141 = v140[1];
      BOOL v27 = v141 > v142;
      unint64_t v143 = v141 - v142;
      if (v27)
      {
        long long v144 = (float *)(v12 + 4 * v142);
        long long v145 = (unsigned __int16 *)(v17 + 2 * v142);
        do
        {
          unsigned int v146 = *v145++;
          float v147 = *(float *)(v20 + 4 * v146);
          if (v147 <= 0.0) {
            float v148 = 0.0;
          }
          else {
            float v148 = 1.0 / v147;
          }
          *v144++ = v148;
          --v143;
        }
        while (v143);
      }
      ++v138;
    }
    while (v138 != v137);
  }
  if (processL2FeatureVector_populatingValues_scoreValue_count__onceToken != -1) {
    dispatch_once(&processL2FeatureVector_populatingValues_scoreValue_count__onceToken, &__block_literal_global_408);
  }
}

uint64_t __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 4 * a2) = 0;
  return result;
}

uint64_t __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke_2()
{
  [@"com.apple.searchd" UTF8String];
  return os_variant_has_internal_diagnostics();
}

- (PRSL2FeatureVectorProcessingContext)processingContext
{
  return self->_processingContext;
}

- (void)setProcessingContext:(id)a3
{
}

- (double)weightX
{
  return self->_weightX;
}

- (void)setWeightX:(double)a3
{
  self->_weightX = a3;
}

- (double)weightY
{
  return self->_weightY;
}

- (void)setWeightY:(double)a3
{
  self->_weightY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingContext, 0);
  objc_storeStrong((id *)&self->mapInflatedIndexToSize, 0);
  objc_storeStrong((id *)&self->disabledFeatureIndices, 0);
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.1()
{
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.2()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 850, "expandedSize >= ((directive_local_resultset_id_values_mapping.end_idx - directive_local_resultset_id_values_mapping.start_idx) * sizeof(prs_ranking_score_t))");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.3()
{
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.4()
{
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.5()
{
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.6()
{
}

- (void)processL2FeatureVector:populatingValues:scoreValue:count:.cold.1()
{
  __assert_rtn("-[PRSDirectivesManager processL2FeatureVector:populatingValues:scoreValue:count:]", "PRSDirectivesManager.m", 1065, "index != 0");
}

@end
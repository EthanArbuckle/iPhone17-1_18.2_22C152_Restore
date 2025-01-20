@interface PGGraphMemoryNode
+ (MARelation)featureOfMemory;
+ (MARelation)momentOfMemory;
+ (id)allMemoryTypeStrings;
+ (id)filter;
+ (id)filterWithMemoryCategories:(id)a3;
+ (id)filterWithMemoryCategory:(unint64_t)a3;
+ (id)filterWithUniqueMemoryIdentifier:(id)a3;
+ (id)filterWithUniqueMemoryIdentifierArray:(id)a3;
+ (id)filterWithUniqueMemoryIdentifiers:(id)a3;
+ (id)fullMemoryTypeStringWithMemoryCategorySubcategory:(unint64_t)a3 featureNodes:(id)a4;
+ (id)fullyQualifiedMemoryTypeForMemoryType:(id)a3 withPrefix:(id)a4;
+ (id)uniqueMemoryIdentifierWithMemoryLabel:(id)a3 featureNodes:(id)a4;
- (BOOL)generatedWithFallbackRequirements;
- (BOOL)hasProperties:(id)a3;
- (NSString)description;
- (NSString)uniqueMemoryIdentifier;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMemoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5;
- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5 generatedWithFallbackRequirements:(BOOL)a6;
- (PGGraphMemoryNodeCollection)collection;
- (PGGraphMomentNodeCollection)memoryMomentNodes;
- (id)label;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (id)propertyDictionary;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (unsigned)domain;
@end

@implementation PGGraphMemoryNode

+ (id)fullyQualifiedMemoryTypeForMemoryType:(id)a3 withPrefix:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (__CFString *)a4;
  if ([(__CFString *)v6 length])
  {
    v7 = v6;
  }
  else
  {
    v8 = +[PGLogging sharedLogging];
    v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "[PGGraphMemoryNode] qualifier prefix for MemoryTypeString: %@ is nil", (uint8_t *)&v12, 0xCu);
    }

    v7 = @"Unknown";
  }
  v10 = [(__CFString *)v7 stringByAppendingString:v5];

  return v10;
}

+ (id)allMemoryTypeStrings
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
  v4 = +[PGTrendsMemoryGenerator allTrendSceneFeatureLabels];
  id v5 = @"None";
  [v2 addObject:@"None"];

  v6 = @"MomentsSingleMoment";
  [v2 addObject:@"MomentsSingleMoment"];

  v7 = @"PersonYear";
  [v2 addObject:@"PersonYear"];

  v8 = @"PersonSeason";
  [v2 addObject:@"PersonSeason"];

  v9 = @"PersonOverTheYears";
  [v2 addObject:@"PersonOverTheYears"];

  v10 = @"PersonEarlyMoments";
  [v2 addObject:@"PersonEarlyMoments"];

  v11 = @"PersonExcitingMomentsYear";
  [v2 addObject:@"PersonExcitingMomentsYear"];

  int v12 = @"PersonExcitingMomentsOverTheYears";
  [v2 addObject:@"PersonExcitingMomentsOverTheYears"];

  id v13 = @"SocialGroupYear";
  [v2 addObject:@"SocialGroupYear"];

  uint64_t v14 = @"SocialGroupOverTheYears";
  [v2 addObject:@"SocialGroupOverTheYears"];

  v15 = @"HomeLastMonth";
  [v2 addObject:@"HomeLastMonth"];

  v16 = @"InReviewYear";
  [v2 addObject:@"InReviewYear"];

  v17 = @"InReviewRecents";
  [v2 addObject:@"InReviewRecents"];

  v18 = @"FoodieGenericYear";
  [v2 addObject:@"FoodieGenericYear"];

  v19 = @"FoodieGenericOverTheYears";
  [v2 addObject:@"FoodieGenericOverTheYears"];

  v20 = @"FoodiePersonYear";
  [v2 addObject:@"FoodiePersonYear"];

  v21 = @"FoodiePersonOverTheYears";
  [v2 addObject:@"FoodiePersonOverTheYears"];

  v22 = @"FoodieCityYear";
  [v2 addObject:@"FoodieCityYear"];

  v23 = @"FoodieCityOverTheYears";
  [v2 addObject:@"FoodieCityOverTheYears"];

  v24 = @"FoodieRestaurantYear";
  [v2 addObject:@"FoodieRestaurantYear"];

  v25 = @"FoodieRestaurantOverTheYears";
  [v2 addObject:@"FoodieRestaurantOverTheYears"];

  v26 = @"FoodieHomeYear";
  [v2 addObject:@"FoodieHomeYear"];

  v27 = @"FoodieHomeOverTheYears";
  [v2 addObject:@"FoodieHomeOverTheYears"];

  v28 = @"FoodieTrip";
  [v2 addObject:@"FoodieTrip"];

  v29 = @"PetYear";
  [v2 addObject:@"PetYear"];

  v30 = @"PetSeason";
  [v2 addObject:@"PetSeason"];

  v31 = @"PetOverTheYears";
  [v2 addObject:@"PetOverTheYears"];

  v32 = @"PetWithPersonOverTheYears";
  [v2 addObject:@"PetWithPersonOverTheYears"];

  v33 = @"PetOutdoorYear";
  [v2 addObject:@"PetOutdoorYear"];

  v34 = @"PetOutdoorOverTheYears";
  [v2 addObject:@"PetOutdoorOverTheYears"];

  v35 = @"BabyYear";
  [v2 addObject:@"BabyYear"];

  v36 = @"BabyOverTheYears";
  [v2 addObject:@"BabyOverTheYears"];

  v37 = @"LocationCityYear";
  [v2 addObject:@"LocationCityYear"];

  v38 = @"LocationCityOverTheYears";
  [v2 addObject:@"LocationCityOverTheYears"];

  v39 = @"LocationAreaYear";
  [v2 addObject:@"LocationAreaYear"];

  v40 = @"LocationAreaOverTheYears";
  [v2 addObject:@"LocationAreaOverTheYears"];

  v41 = @"ROIYear";
  [v2 addObject:@"ROIYear"];

  v42 = @"ROIOverTheYears";
  [v2 addObject:@"ROIOverTheYears"];

  v43 = @"MeaningfulEventSingleEvent";
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  id v44 = v3;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v218 objects:v236 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v219;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v219 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventSingleEvent" withPrefix:*(void *)(*((void *)&v218 + 1) + 8 * i)];
        [v2 addObject:v49];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v218 objects:v236 count:16];
    }
    while (v46);
  }

  v50 = @"MeaningfulEventGenericYear";
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v51 = v44;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v214 objects:v235 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v215;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v215 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventGenericYear" withPrefix:*(void *)(*((void *)&v214 + 1) + 8 * j)];
        [v2 addObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v214 objects:v235 count:16];
    }
    while (v53);
  }

  v57 = @"MeaningfulEventGenericOverTheYears";
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  id v58 = v51;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v210 objects:v234 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v211;
    do
    {
      for (uint64_t k = 0; k != v60; ++k)
      {
        if (*(void *)v211 != v61) {
          objc_enumerationMutation(v58);
        }
        v63 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventGenericOverTheYears" withPrefix:*(void *)(*((void *)&v210 + 1) + 8 * k)];
        [v2 addObject:v63];
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v210 objects:v234 count:16];
    }
    while (v60);
  }

  v64 = @"MeaningfulEventSocialGroupYear";
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id v65 = v58;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v206 objects:v233 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v207;
    do
    {
      for (uint64_t m = 0; m != v67; ++m)
      {
        if (*(void *)v207 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventSocialGroupYear" withPrefix:*(void *)(*((void *)&v206 + 1) + 8 * m)];
        [v2 addObject:v70];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v206 objects:v233 count:16];
    }
    while (v67);
  }

  v71 = @"MeaningfulEventSocialGroupOverTheYears";
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  id v72 = v65;
  uint64_t v73 = [v72 countByEnumeratingWithState:&v202 objects:v232 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v203;
    do
    {
      for (uint64_t n = 0; n != v74; ++n)
      {
        if (*(void *)v203 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventSocialGroupOverTheYears" withPrefix:*(void *)(*((void *)&v202 + 1) + 8 * n)];
        [v2 addObject:v77];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v202 objects:v232 count:16];
    }
    while (v74);
  }

  v78 = @"MeaningfulEventAreaYear";
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id v79 = v72;
  uint64_t v80 = [v79 countByEnumeratingWithState:&v198 objects:v231 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v199;
    do
    {
      for (iuint64_t i = 0; ii != v81; ++ii)
      {
        if (*(void *)v199 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventAreaYear" withPrefix:*(void *)(*((void *)&v198 + 1) + 8 * ii)];
        [v2 addObject:v84];
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v198 objects:v231 count:16];
    }
    while (v81);
  }

  v85 = @"MeaningfulEventAreaOverTheYears";
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id v86 = v79;
  uint64_t v87 = [v86 countByEnumeratingWithState:&v194 objects:v230 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v195;
    do
    {
      for (juint64_t j = 0; jj != v88; ++jj)
      {
        if (*(void *)v195 != v89) {
          objc_enumerationMutation(v86);
        }
        v91 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventAreaOverTheYears" withPrefix:*(void *)(*((void *)&v194 + 1) + 8 * jj)];
        [v2 addObject:v91];
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v194 objects:v230 count:16];
    }
    while (v88);
  }

  v92 = @"MeaningfulEventCityYear";
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v93 = v86;
  uint64_t v94 = [v93 countByEnumeratingWithState:&v190 objects:v229 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v191;
    do
    {
      for (kuint64_t k = 0; kk != v95; ++kk)
      {
        if (*(void *)v191 != v96) {
          objc_enumerationMutation(v93);
        }
        v98 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventCityYear" withPrefix:*(void *)(*((void *)&v190 + 1) + 8 * kk)];
        [v2 addObject:v98];
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v190 objects:v229 count:16];
    }
    while (v95);
  }

  v99 = @"MeaningfulEventCityOverTheYears";
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id v100 = v93;
  uint64_t v101 = [v100 countByEnumeratingWithState:&v186 objects:v228 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v187;
    do
    {
      for (muint64_t m = 0; mm != v102; ++mm)
      {
        if (*(void *)v187 != v103) {
          objc_enumerationMutation(v100);
        }
        v105 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"MeaningfulEventCityOverTheYears" withPrefix:*(void *)(*((void *)&v186 + 1) + 8 * mm)];
        [v2 addObject:v105];
      }
      uint64_t v102 = [v100 countByEnumeratingWithState:&v186 objects:v228 count:16];
    }
    while (v102);
  }

  v106 = @"TripTrip";
  [v2 addObject:@"TripTrip"];

  v107 = @"TripRecurrent";
  [v2 addObject:@"TripRecurrent"];

  v108 = @"TripOngoingTrip";
  [v2 addObject:@"TripOngoingTrip"];

  v109 = @"SupersetPast";
  [v2 addObject:@"SupersetPast"];

  v110 = @"SeasonSingleSeason";
  [v2 addObject:@"SeasonSingleSeason"];

  v111 = @"ChildActivityYear";
  [v2 addObject:@"ChildActivityYear"];

  v112 = @"ChildActivityOverTheYears";
  [v2 addObject:@"ChildActivityOverTheYears"];

  v113 = @"ChildWithPersonYear";
  [v2 addObject:@"ChildWithPersonYear"];

  v114 = @"ChildWithPersonOverTheYears";
  [v2 addObject:@"ChildWithPersonOverTheYears"];

  v115 = @"ChildOutdoorYear";
  [v2 addObject:@"ChildOutdoorYear"];

  v116 = @"ChildOutdoorOverTheYears";
  [v2 addObject:@"ChildOutdoorOverTheYears"];

  v117 = @"TrendsGenericYear";
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v118 = v4;
  uint64_t v119 = [v118 countByEnumeratingWithState:&v182 objects:v227 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v183;
    do
    {
      for (nuint64_t n = 0; nn != v120; ++nn)
      {
        if (*(void *)v183 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"TrendsGenericYear" withPrefix:*(void *)(*((void *)&v182 + 1) + 8 * nn)];
        [v2 addObject:v123];
      }
      uint64_t v120 = [v118 countByEnumeratingWithState:&v182 objects:v227 count:16];
    }
    while (v120);
  }

  v124 = @"TrendsGenericOverTheYears";
  long long v178 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  id v125 = v118;
  uint64_t v126 = [v125 countByEnumeratingWithState:&v178 objects:v226 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v179;
    do
    {
      for (uint64_t i1 = 0; i1 != v127; ++i1)
      {
        if (*(void *)v179 != v128) {
          objc_enumerationMutation(v125);
        }
        v130 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"TrendsGenericOverTheYears" withPrefix:*(void *)(*((void *)&v178 + 1) + 8 * i1)];
        [v2 addObject:v130];
      }
      uint64_t v127 = [v125 countByEnumeratingWithState:&v178 objects:v226 count:16];
    }
    while (v127);
  }

  v131 = @"TrendsPersonYear";
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v132 = v125;
  uint64_t v133 = [v132 countByEnumeratingWithState:&v174 objects:v225 count:16];
  if (v133)
  {
    uint64_t v134 = v133;
    uint64_t v135 = *(void *)v175;
    do
    {
      for (uint64_t i2 = 0; i2 != v134; ++i2)
      {
        if (*(void *)v175 != v135) {
          objc_enumerationMutation(v132);
        }
        v137 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"TrendsPersonYear" withPrefix:*(void *)(*((void *)&v174 + 1) + 8 * i2)];
        [v2 addObject:v137];
      }
      uint64_t v134 = [v132 countByEnumeratingWithState:&v174 objects:v225 count:16];
    }
    while (v134);
  }

  v138 = @"TrendsPersonOverTheYears";
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id v139 = v132;
  uint64_t v140 = [v139 countByEnumeratingWithState:&v170 objects:v224 count:16];
  if (v140)
  {
    uint64_t v141 = v140;
    uint64_t v142 = *(void *)v171;
    do
    {
      for (uint64_t i3 = 0; i3 != v141; ++i3)
      {
        if (*(void *)v171 != v142) {
          objc_enumerationMutation(v139);
        }
        v144 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"TrendsPersonOverTheYears" withPrefix:*(void *)(*((void *)&v170 + 1) + 8 * i3)];
        [v2 addObject:v144];
      }
      uint64_t v141 = [v139 countByEnumeratingWithState:&v170 objects:v224 count:16];
    }
    while (v141);
  }

  v145 = @"TrendsCityYear";
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v146 = v139;
  uint64_t v147 = [v146 countByEnumeratingWithState:&v166 objects:v223 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v167;
    do
    {
      for (uint64_t i4 = 0; i4 != v148; ++i4)
      {
        if (*(void *)v167 != v149) {
          objc_enumerationMutation(v146);
        }
        v151 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:@"TrendsCityYear" withPrefix:*(void *)(*((void *)&v166 + 1) + 8 * i4)];
        [v2 addObject:v151];
      }
      uint64_t v148 = [v146 countByEnumeratingWithState:&v166 objects:v223 count:16];
    }
    while (v148);
  }

  v152 = @"TrendsCityOverTheYears";
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v153 = v146;
  uint64_t v154 = [v153 countByEnumeratingWithState:&v162 objects:v222 count:16];
  if (v154)
  {
    uint64_t v155 = v154;
    uint64_t v156 = *(void *)v163;
    do
    {
      for (uint64_t i5 = 0; i5 != v155; ++i5)
      {
        if (*(void *)v163 != v156) {
          objc_enumerationMutation(v153);
        }
        v158 = objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", @"TrendsCityOverTheYears", *(void *)(*((void *)&v162 + 1) + 8 * i5), (void)v162);
        [v2 addObject:v158];
      }
      uint64_t v155 = [v153 countByEnumeratingWithState:&v162 objects:v222 count:16];
    }
    while (v155);
  }

  v159 = @"MomentsDayInHistoryAggregation";
  [v2 addObject:@"MomentsDayInHistoryAggregation"];

  v160 = @"ContentCreationToolOverTime";
  [v2 addObject:@"ContentCreationToolOverTime"];

  return v2;
}

+ (id)fullMemoryTypeStringWithMemoryCategorySubcategory:(unint64_t)a3 featureNodes:(id)a4
{
  id v5 = a4;
  v6 = PGStringForMemoryCategorySubcategory(a3);
  if (a3 - 11001 >= 9)
  {
    if (a3 - 16001 >= 6) {
      goto LABEL_6;
    }
    v7 = +[PGGraphNodeCollection subsetInCollection:v5];
    v8 = [v7 labels];
  }
  else
  {
    v7 = +[PGGraphNodeCollection subsetInCollection:v5];
    v8 = [v7 meaningLabels];
  }
  v9 = v8;
  v10 = [v8 anyObject];

  uint64_t v11 = [(id)objc_opt_class() fullyQualifiedMemoryTypeForMemoryType:v6 withPrefix:v10];

  v6 = (void *)v11;
LABEL_6:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (NSString)uniqueMemoryIdentifier
{
  return self->_uniqueMemoryIdentifier;
}

- (id)label
{
  return self->_label;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  id v2 = [(PGGraphMemoryNode *)self collection];
  v3 = [v2 featureNodes];

  return (PGGraphFeatureNodeCollection *)v3;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  v3 = [(PGGraphMemoryNode *)self collection];
  v4 = [v3 featureNodes];

  return v4;
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  id v2 = [(PGGraphMemoryNode *)self collection];
  v3 = [v2 momentNodes];

  return (PGGraphMomentNodeCollection *)v3;
}

- (unint64_t)memoryCategory
{
  return +[PGGraphBuilder memoryCategoryForLabel:self->_label];
}

- (PGGraphMemoryNodeCollection)collection
{
  id v2 = [(MANodeCollection *)[PGGraphMemoryNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)description
{
  v3 = NSString;
  label = self->_label;
  id v5 = PGStringForMemoryCategorySubcategory(self->_memoryCategorySubcategory);
  v6 = [v3 stringWithFormat:@"PGGraphMemoryNode - (%@, %@, %@)", label, v5, self->_uniqueMemoryIdentifier];

  return (NSString *)v6;
}

- (id)propertyDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  [v3 setObject:self->_uniqueMemoryIdentifier forKeyedSubscript:@"memid"];
  v4 = [NSNumber numberWithUnsignedInteger:self->_memoryCategorySubcategory];
  [v3 setObject:v4 forKeyedSubscript:@"subcategory"];

  id v5 = [NSNumber numberWithBool:self->_generatedWithFallbackRequirements];
  [v3 setObject:v5 forKeyedSubscript:@"generatedWithFallbackRequirements"];

  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"memid"];
    v7 = v6;
    if (v6 && ![v6 isEqual:self->_uniqueMemoryIdentifier]) {
      goto LABEL_11;
    }

    v8 = [v5 objectForKeyedSubscript:@"subcategory"];
    v7 = v8;
    if (v8)
    {
      if ([v8 unsignedIntegerValue] != self->_memoryCategorySubcategory) {
        goto LABEL_11;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"generatedWithFallbackRequirements"];
    v7 = v9;
    if (v9 && self->_generatedWithFallbackRequirements != [v9 BOOLValue]) {
LABEL_11:
    }
      BOOL v10 = 0;
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (unsigned)domain
{
  return 1100;
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [v7 objectForKeyedSubscript:@"memid"];
  BOOL v10 = [v7 objectForKeyedSubscript:@"subcategory"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  int v12 = [v7 objectForKeyedSubscript:@"generatedWithFallbackRequirements"];

  uint64_t v13 = [v12 BOOLValue];
  uint64_t v14 = [(PGGraphMemoryNode *)self initWithLabel:v8 memoryCategorySubcategory:v11 uniqueMemoryIdentifier:v9 generatedWithFallbackRequirements:v13];

  return v14;
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5
{
  return [(PGGraphMemoryNode *)self initWithLabel:a3 memoryCategorySubcategory:a4 uniqueMemoryIdentifier:a5 generatedWithFallbackRequirements:0];
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5 generatedWithFallbackRequirements:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphMemoryNode;
  int v12 = [(PGGraphNode *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    objc_storeStrong((id *)&v12->_uniqueMemoryIdentifier, a5);
    v12->_memoryCategorySubcategory = a4;
    v12->_generatedWithFallbackRequirements = a6;
  }

  return v12;
}

+ (id)uniqueMemoryIdentifierWithMemoryLabel:(id)a3 featureNodes:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 featureIdentifiers];
  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
    v14[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v9 = [v6 sortedArrayUsingDescriptors:v8];

    id v10 = NSString;
    id v11 = [v9 componentsJoinedByString:@"|"];
    int v12 = [v10 stringWithFormat:@"%@|%@", v5, v11];
  }
  else
  {
    int v12 = [NSString stringWithFormat:@"%@", v5];
  }

  return v12;
}

+ (MARelation)momentOfMemory
{
  id v2 = +[PGGraphMemoryContainsAssetsFromEdge filter];
  v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)featureOfMemory
{
  id v2 = +[PGGraphMemoryFeaturesEdge filter];
  v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)filterWithUniqueMemoryIdentifierArray:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  v9 = @"memid";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithUniqueMemoryIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  v9 = @"memid";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithUniqueMemoryIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  v9 = @"memid";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithMemoryCategories:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __48__PGGraphMemoryNode_filterWithMemoryCategories___block_invoke;
  v10[3] = &unk_1E68F0470;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateIndexesUsingBlock:v10];

  id v7 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v8 = (void *)[v7 initWithLabels:v6 domain:1100 properties:MEMORY[0x1E4F1CC08]];

  return v8;
}

void __48__PGGraphMemoryNode_filterWithMemoryCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = +[PGGraphBuilder memoryLabelForCategory:a2];
  if ([v4 isEqualToString:@"Unknown"])
  {
    id v5 = +[PGLogging sharedLogging];
    id v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v2;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[PGGraphMemoryNode filterWithMemoryCategories:] passed an unsupported category %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

+ (id)filterWithMemoryCategory:(unint64_t)a3
{
  v3 = +[PGGraphBuilder memoryLabelForCategory:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:v3 domain:1100];

  return v4;
}

+ (id)filter
{
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:1100];
  return v2;
}

@end
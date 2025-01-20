@interface _DPMLRuntimeRecipe
+ (id)DSLSupportedClassesSet;
+ (id)recipeWithTrialClient:(id)a3 error:(id *)a4;
+ (int64_t)dataRecorderTypeEnumFromString:(id)a3;
- (BMDSL)graphDSL;
- (BOOL)isUnknownDictionaryCase;
- (NSArray)cohortNameList;
- (NSDictionary)dataTypeContent;
- (NSDictionary)recordMetadata;
- (NSDictionary)sqlAccessTable;
- (NSString)clientIdentifier;
- (NSString)recipeIdentifier;
- (NSString)sqlQuery;
- (_DPMLRuntimeLegacyRecordParameters)recordParameters;
- (_DPMLRuntimeRecipe)initWithTrialClient:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 dataTypeContent:(id)a7 sqlQuery:(id)a8 sqlAccessTable:(id)a9 cohortNameList:(id)a10 isUnknownDictionaryCase:(BOOL)a11;
- (_DPMLRuntimeRecipe)initWithTrialClient:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 graphDSL:(id)a7 dataRecorderType:(int64_t)a8 dataTypeContent:(id)a9 recordParameters:(id)a10 cohortNameList:(id)a11;
- (_DPMLRuntimeTrialClient)trialClient;
- (id)recordDataArray:(id)a3 error:(id *)a4;
- (id)recordDataArray:(id)a3 metadata:(id)a4 error:(id *)a5;
- (id)runRecipeWithError:(id *)a3;
- (int64_t)dataRecorderType;
- (unint64_t)recipeType;
- (void)setCohortNameList:(id)a3;
- (void)setDataTypeContent:(id)a3;
- (void)setGraphDSL:(id)a3;
- (void)setIsUnknownDictionaryCase:(BOOL)a3;
- (void)setRecipeType:(unint64_t)a3;
- (void)setRecordMetadata:(id)a3;
- (void)setRecordParameters:(id)a3;
- (void)setSqlAccessTable:(id)a3;
- (void)setSqlQuery:(id)a3;
@end

@implementation _DPMLRuntimeRecipe

- (void)setRecipeType:(unint64_t)a3
{
  self->_recipeType = a3;
  graphDSL = self->_graphDSL;
  self->_graphDSL = 0;

  recordParameters = self->_recordParameters;
  self->_recordParameters = 0;

  dataTypeContent = self->_dataTypeContent;
  self->_dataTypeContent = 0;

  sqlQuery = self->_sqlQuery;
  self->_sqlQuery = 0;

  sqlAccessTable = self->_sqlAccessTable;
  self->_sqlAccessTable = 0;

  cohortNameList = self->_cohortNameList;
  self->_cohortNameList = 0;
}

- (_DPMLRuntimeRecipe)initWithTrialClient:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 graphDSL:(id)a7 dataRecorderType:(int64_t)a8 dataTypeContent:(id)a9 recordParameters:(id)a10 cohortNameList:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v17 = a9;
  id v25 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)_DPMLRuntimeRecipe;
  v19 = [(_DPMLRuntimeRecipe *)&v31 init];
  v20 = v19;
  if (v19)
  {
    [(_DPMLRuntimeRecipe *)v19 setRecipeType:1];
    objc_storeStrong((id *)&v20->_recipeIdentifier, a4);
    objc_storeStrong((id *)&v20->_clientIdentifier, a5);
    objc_storeStrong((id *)&v20->_recordMetadata, a6);
    objc_storeStrong((id *)&v20->_graphDSL, a7);
    objc_storeStrong((id *)&v20->_trialClient, a3);
    v20->_dataRecorderType = a8;
    objc_storeStrong((id *)&v20->_cohortNameList, a11);
    if ((id)[(_DPMLRuntimeRecipe *)v20 dataRecorderType] == (id)6) {
      v21 = (NSDictionary *)v17;
    }
    else {
      v21 = 0;
    }
    dataTypeContent = v20->_dataTypeContent;
    v20->_dataTypeContent = v21;

    objc_storeStrong((id *)&v20->_recordParameters, a10);
  }

  return v20;
}

- (_DPMLRuntimeRecipe)initWithTrialClient:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 dataTypeContent:(id)a7 sqlQuery:(id)a8 sqlAccessTable:(id)a9 cohortNameList:(id)a10 isUnknownDictionaryCase:(BOOL)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)_DPMLRuntimeRecipe;
  v19 = [(_DPMLRuntimeRecipe *)&v29 init];
  v20 = v19;
  if (v19)
  {
    [(_DPMLRuntimeRecipe *)v19 setRecipeType:2];
    objc_storeStrong((id *)&v20->_recipeIdentifier, a4);
    objc_storeStrong((id *)&v20->_clientIdentifier, a5);
    objc_storeStrong((id *)&v20->_recordMetadata, a6);
    objc_storeStrong((id *)&v20->_dataTypeContent, a7);
    objc_storeStrong((id *)&v20->_sqlQuery, a8);
    objc_storeStrong((id *)&v20->_trialClient, a3);
    objc_storeStrong((id *)&v20->_sqlAccessTable, a9);
    objc_storeStrong((id *)&v20->_cohortNameList, a10);
    v20->_isUnknownDictionaryCase = a11;
  }

  return v20;
}

+ (id)recipeWithTrialClient:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 recipeDictionary];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKey:@"useCaseEncoding"];
    if ([v8 length])
    {
      BOOL v9 = 1;
    }
    else
    {
      v11 = [v7 objectForKey:@"unknownDictionary"];
      BOOL v9 = v11 != 0;
    }
    v12 = [v7 objectForKey:@"version"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a4)
      {
        +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe is missing version string"];
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_125;
    }
    v13 = [v7 objectForKey:@"recipeIdentifier"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a4)
      {
        +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe is missing recipe identifier string"];
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_124;
    }
    v14 = [v7 objectForKey:@"clientIdentifier"];
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a4)
      {
        +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe is missing client identifier string"];
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_123;
    }
    v102 = v13;
    uint64_t v15 = [v5 namespaceIdentifier];
    v16 = v14;
    id v17 = (void *)v15;
    uint64_t v117 = 0;
    v103 = v16;
    id v18 = +[_DPMLRecipeIDValidator checkClientIdentifier:againstNamespaceIdentifier:error:](_DPMLRecipeIDValidator, "checkClientIdentifier:againstNamespaceIdentifier:error:");
    id v100 = 0;

    v101 = v18;
    if (v18)
    {
      if ([v18 BOOLValue])
      {
        uint64_t v19 = [v7 objectForKey:@"dataRecorderType"];
        v99 = (void *)v19;
        if (!v19 || (uint64_t v20 = v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v13 = v102;
          v14 = v103;
          if (a4)
          {
            +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe is missing data recorder type string"];
            v10 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_48:
            v10 = 0;
          }
LABEL_120:
          id v28 = v100;
          goto LABEL_121;
        }
        int64_t v21 = +[_DPMLRuntimeRecipe dataRecorderTypeEnumFromString:v20];
        id v22 = 0;
        int64_t v88 = v21;
        v13 = v102;
        v14 = v103;
        id v23 = 0;
        switch(v21)
        {
          case -1:
            if (a4)
            {
              v32 = +[NSString stringWithFormat:@"The data recorder type \"%@\" is not supported", v99];
              *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v32];

              v13 = v102;
              v14 = v103;
            }
            goto LABEL_48;
          case 0:
          case 5:
            id v24 = [v7 objectForKey:@"numBucket"];
            if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (a4)
              {
                objc_super v31 = +[NSString stringWithFormat:@"key %@ missing from recipe", @"numBucket"];
                *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v31];
              }
              goto LABEL_119;
            }
            v96 = v24;
            id v25 = [v7 objectForKey:@"minValue"];
            if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v93 = v25;
              id v26 = [v7 objectForKey:@"maxValue"];
              if (v26)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v83 = [[_DPMLRuntimeLegacyRecordParameters alloc] initWithNumBucket:v96 minValue:v93 maxValue:v26];

                  id v27 = v96;
                  v86 = 0;
                  goto LABEL_52;
                }
              }
              if (a4)
              {
                v64 = +[NSString stringWithFormat:@"key %@ missing from recipe", @"maxValue"];
                *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v64];
              }
            }
            else
            {
              if (a4)
              {
                v43 = +[NSString stringWithFormat:@"key %@ missing from recipe", @"minValue"];
                *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v43];
              }
            }
            v63 = v96;
            goto LABEL_118;
          case 6:
            uint64_t v33 = [v7 objectForKey:@"dataTypeContent"];
            if (v33)
            {
              v34 = (void *)v33;
              v35 = [v5 namespaceIdentifier];
              v86 = v34;
              uint64_t v36 = sub_100019384(v35, v34);

              if (v36)
              {
                id v27 = (void *)v36;
                v83 = 0;
LABEL_52:
                v13 = v102;
                v14 = v103;

                id v23 = v86;
                id v22 = v83;
LABEL_53:
                v84 = v22;
                v87 = v23;
                v85 = [v7 objectForKey:@"cohorts"];
                if (v85)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v42 = v85;
                    if (a4)
                    {
                      +[_DPMLRuntimeError errorWithCode:100 description:@"Cohorts must be a list of strings."];
                      v10 = 0;
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v10 = 0;
                    }
                    id v28 = v100;
                    goto LABEL_190;
                  }
                  long long v115 = 0u;
                  long long v116 = 0u;
                  long long v113 = 0u;
                  long long v114 = 0u;
                  id obj = v85;
                  v97 = (char *)[obj countByEnumeratingWithState:&v113 objects:v123 count:16];
                  if (v97)
                  {
                    uint64_t v94 = *(void *)v114;
                    while (2)
                    {
                      for (i = 0; i != v97; ++i)
                      {
                        if (*(void *)v114 != v94) {
                          objc_enumerationMutation(obj);
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (a4)
                          {
                            *a4 = +[_DPMLRuntimeError errorWithCode:100 description:@"Cohorts must be a list of strings."];
                          }

                          v10 = 0;
                          v13 = v102;
                          v14 = v103;
                          id v28 = v100;
                          v42 = v85;
                          goto LABEL_190;
                        }
                      }
                      v97 = (char *)[obj countByEnumeratingWithState:&v113 objects:v123 count:16];
                      if (v97) {
                        continue;
                      }
                      break;
                    }
                  }
                }
                uint64_t v38 = kDPMetadataVersionHash;
                uint64_t v121 = kDPMetadataVersionHash;
                CFStringRef v122 = &stru_100031ED0;
                v98 = +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
                uint64_t v39 = kDPMetadataDediscoTaskConfig;
                uint64_t v40 = [v7 objectForKey:kDPMetadataDediscoTaskConfig];
                v95 = (void *)v40;
                if (v40)
                {
                  v119[0] = v38;
                  v119[1] = v39;
                  v120[0] = &stru_100031ED0;
                  v120[1] = v40;
                  uint64_t v41 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:2];

                  v98 = (void *)v41;
                }
                if ([v12 isEqualToString:@"legacy"])
                {
                  id obja = [v7 objectForKey:@"graphDSL"];
                  if (obja && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v45 = +[_PFLLog extension];
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
                      sub_100020498(obja, v45);
                    }

                    id v78 = [objc_alloc((Class)NSData) initWithBase64EncodedString:obja options:1];
                    v46 = +[_PFLLog extension];
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                      sub_10002040C(v78, v46);
                    }

                    v47 = +[BMDSLClasses allowed];
                    id v112 = 0;
                    v80 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v47 fromData:v78 error:&v112];
                    id v76 = v112;

                    v48 = +[_PFLLog extension];
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
                      sub_100020380(v80, v48);
                    }

                    if (v80)
                    {
                      v49 = +[NSBundle bundleForClass:objc_opt_class()];
                      v50 = [v5 namespaceIdentifier];
                      v73 = v49;
                      uint64_t v51 = [v49 pathForResource:v50 ofType:@"plist"];

                      id v111 = 0;
                      v74 = (void *)v51;
                      uint64_t v52 = +[NSData dataWithContentsOfFile:v51 options:1 error:&v111];
                      id v75 = v111;
                      v53 = (void *)v52;
                      if (v52)
                      {
                        v54 = +[_DPMLRuntimeRecipe DSLSupportedClassesSet];
                        id v110 = 0;
                        v55 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v54 fromData:v52 error:&v110];
                        id v72 = v110;

                        if (v55)
                        {
                          id v109 = 0;
                          unsigned __int8 v56 = [v55 validateGraph:v80 error:&v109];
                          id v57 = v109;
                          if (v56)
                          {
                            v10 = [[_DPMLRuntimeRecipe alloc] initWithTrialClient:v5 recipeIdentifier:v102 clientIdentifier:v103 recordMetadata:v98 graphDSL:v80 dataRecorderType:v88 dataTypeContent:v87 recordParameters:v84 cohortNameList:v85];
                          }
                          else if (a4)
                          {
                            +[_DPMLRuntimeError errorWithCode:100 underlyingError:v57 description:@"Failed to validate DSL graph"];
                            v10 = 0;
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v10 = 0;
                          }
                        }
                        else if (a4)
                        {
                          +[_DPMLRuntimeError errorWithCode:100 underlyingError:v72 description:@"Failed to load validator from plist"];
                          v10 = 0;
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v10 = 0;
                        }
                      }
                      else if (a4)
                      {
                        +[_DPMLRuntimeError errorWithCode:100 underlyingError:v75 description:@"No valid DSL allow list found for current Namespace"];
                        v10 = 0;
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v10 = 0;
                      }
                    }
                    else if (a4)
                    {
                      +[_DPMLRuntimeError errorWithCode:100 underlyingError:v76 description:@"Could not construct DSL graph"];
                      v10 = 0;
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v10 = 0;
                    }
                  }
                  else if (a4)
                  {
                    +[_DPMLRuntimeError errorWithCode:100 description:@"Graph DSL description missing in recipe"];
                    v10 = 0;
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v10 = 0;
                  }
                  v13 = v102;
                  v14 = v103;
                  id v28 = v100;
                  v42 = v85;

                  goto LABEL_189;
                }
                if ([v12 isEqualToString:@"sql+dtc"])
                {
                  if (v87)
                  {
                    v58 = [v7 objectForKey:@"sqlParameters"];
                    if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      if (a4)
                      {
                        +[_DPMLRuntimeError errorWithCode:100 description:@"SQL parameters dictionary are missing"];
                        v10 = 0;
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v10 = 0;
                      }
                      goto LABEL_187;
                    }
                    id objb = [v58 objectForKey:@"accessControl"];
                    if (!objb || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      if (a4)
                      {
                        +[_DPMLRuntimeError errorWithCode:100 description:@"SQL parameters dictionary is missing access controls"];
                        v10 = 0;
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v10 = 0;
                      }
                      goto LABEL_186;
                    }
                    v89 = [v58 objectForKey:@"query"];
                    if (v89)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v59 = v89;
                        goto LABEL_99;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v107 = 0u;
                        long long v108 = 0u;
                        long long v105 = 0u;
                        long long v106 = 0u;
                        id v77 = v89;
                        v82 = (char *)[v77 countByEnumeratingWithState:&v105 objects:v118 count:16];
                        if (v82)
                        {
                          uint64_t v79 = *(void *)v106;
                          while (2)
                          {
                            for (j = 0; j != v82; ++j)
                            {
                              if (*(void *)v106 != v79) {
                                objc_enumerationMutation(v77);
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (a4)
                                {
                                  *a4 = +[_DPMLRuntimeError errorWithCode:100 description:@"If SQL query is an array, all entries must be strings"];
                                }

                                goto LABEL_178;
                              }
                            }
                            v82 = (char *)[v77 countByEnumeratingWithState:&v105 objects:v118 count:16];
                            if (v82) {
                              continue;
                            }
                            break;
                          }
                        }

                        id v59 = [v77 componentsJoinedByString:@" "];
LABEL_99:
                        v81 = v59;
                        v60 = +[_PFLLog extension];
                        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
                          sub_10002051C();
                        }

                        id v104 = 0;
                        v61 = [v5 namespaceIdentifier];
                        v62 = +[_DPMLSQLQueryValidator isValidSQLQuery:v81 forNamespaceID:v61 possibleError:&v104];

                        if (v62)
                        {
                          if ([v62 BOOLValue])
                          {
                            if (sub_1000195C4(v81, v103, v95))
                            {
                              LOBYTE(v71) = v9;
                              v10 = [[_DPMLRuntimeRecipe alloc] initWithTrialClient:v5 recipeIdentifier:v102 clientIdentifier:v103 recordMetadata:v98 dataTypeContent:v87 sqlQuery:v81 sqlAccessTable:objb cohortNameList:v85 isUnknownDictionaryCase:v71];
LABEL_184:

                              goto LABEL_185;
                            }
                            if (a4)
                            {
                              CFStringRef v70 = @"Cannot validate recipe for Private Relay usage";
                              goto LABEL_181;
                            }
                          }
                          else if (a4)
                          {
                            CFStringRef v70 = @"SQL query not valid";
LABEL_181:
                            v69 = +[_DPMLRuntimeError errorWithCode:100 description:v70];
                            goto LABEL_182;
                          }
                        }
                        else if (a4)
                        {
                          v69 = +[_DPMLRuntimeError errorWithCode:100 underlyingError:v104 description:@"Cannot validate SQL query"];
LABEL_182:
                          v10 = 0;
                          *a4 = v69;
                          goto LABEL_184;
                        }
                        v10 = 0;
                        goto LABEL_184;
                      }
                      if (a4)
                      {
                        CFStringRef v67 = @"SQL query should either be an array of strings or a single string";
                        goto LABEL_170;
                      }
                    }
                    else if (a4)
                    {
                      CFStringRef v67 = @"SQL parameters dictionary is missing SQL query";
LABEL_170:
                      +[_DPMLRuntimeError errorWithCode:100 description:v67];
                      v10 = 0;
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_185:

LABEL_186:
LABEL_187:

                      goto LABEL_188;
                    }
LABEL_178:
                    v10 = 0;
                    goto LABEL_185;
                  }
                  if (a4)
                  {
                    v66 = +[NSString stringWithFormat:@"key %@ is required for SQL queries", @"dataTypeContent"];
                    *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v66];
                  }
                }
                else if (a4)
                {
                  +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe version not supported"];
                  v10 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_188:
                  v13 = v102;
                  v14 = v103;
                  id v28 = v100;
                  v42 = v85;
LABEL_189:

LABEL_190:
LABEL_121:

                  goto LABEL_122;
                }
                v10 = 0;
                goto LABEL_188;
              }
              if (a4)
              {
                *a4 = +[_DPMLRuntimeError errorWithCode:100 description:@"Data type content contains factor field(s) that are not allowed"];
              }
              v63 = v86;
LABEL_118:
            }
            else if (a4)
            {
              v44 = +[NSString stringWithFormat:@"key %@ missing from recipe", @"dataTypeContent"];
              *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v44];
            }
LABEL_119:
            v10 = 0;
            v13 = v102;
            v14 = v103;
            goto LABEL_120;
          default:
            goto LABEL_53;
        }
      }
      if (a4)
      {
        objc_super v29 = [v5 namespaceIdentifier];
        id v30 = +[NSString stringWithFormat:@"The client identifier \"%@\" is not allowed for the Trial namespace \"%@\"", v103, v29];
        v14 = v103;
        *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v30];

        v10 = 0;
        v13 = v102;
LABEL_40:
        id v28 = v100;
        goto LABEL_122;
      }
    }
    else if (a4)
    {
      id v28 = v100;
      +[_DPMLRuntimeError errorWithCode:100 underlyingError:v100 description:@"Cannot perform recipe ID check"];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v102;
      v14 = v103;
LABEL_122:

LABEL_123:
LABEL_124:

LABEL_125:
      goto LABEL_126;
    }
    v10 = 0;
    v13 = v102;
    v14 = v103;
    goto LABEL_40;
  }
  if (a4)
  {
    +[_DPMLRuntimeError errorWithCode:100 description:@"Trial client cannot provide the recipe"];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_126:

  return v10;
}

- (id)runRecipeWithError:(id *)a3
{
  unint64_t v5 = [(_DPMLRuntimeRecipe *)self recipeType];
  if (v5 == 2)
  {
    uint64_t v15 = [_DPMLRuntimeSQL alloc];
    v16 = [(_DPMLRuntimeRecipe *)self sqlAccessTable];
    id v17 = [(_DPMLRuntimeRecipe *)self recipeIdentifier];
    id v37 = 0;
    id v18 = [(_DPMLRuntimeSQL *)v15 initWithSQLAccessTable:v16 forRecipeIdentifier:v17 withError:&v37];
    id v19 = v37;

    if (!v18)
    {
      if (a3)
      {
        +[_DPMLRuntimeError errorWithCode:400 underlyingError:v19 description:@"SQL Constructor Error"];
        v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_45;
    }
    uint64_t v20 = [(_DPMLRuntimeRecipe *)self sqlQuery];
    id v36 = v19;
    int64_t v21 = [(_DPMLRuntimeSQL *)v18 runQuery:v20 withError:&v36];
    id v22 = v36;

    if (v21)
    {
      if (![v21 count])
      {
        id v25 = +[_PFLLog extension];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_100020810();
        }

        v14 = &off_100034790;
        goto LABEL_44;
      }
      if ([(_DPMLRuntimeRecipe *)self isUnknownDictionaryCase])
      {
        uint64_t v23 = +[UnknownDictionary runWithRecipe:self data:v21 error:a3];
        if ((v23 & 0x80000000) == 0)
        {
          uint64_t v24 = +[NSNumber numberWithInt:v23];
LABEL_33:
          v14 = (_UNKNOWN **)v24;
          goto LABEL_44;
        }
      }
      else
      {
        id v26 = [(_DPMLRuntimeRecipe *)self trialClient];
        id v27 = [v26 namespaceIdentifier];
        unsigned int v28 = [&off_100034640 containsObject:v27];

        if (!v28)
        {
          id v35 = v22;
          v14 = [(_DPMLRuntimeRecipe *)self recordDataArray:v21 error:&v35];
          id v31 = v35;

          if (v14)
          {
            if (v31)
            {
              v32 = +[_PFLLog extension];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                sub_100020844();
              }
            }
            uint64_t v33 = v14;
          }
          else if (a3)
          {
            *a3 = +[_DPMLRuntimeError errorWithCode:400 underlyingError:v31 description:@"SQL Query Recording Error"];
          }

          id v22 = v31;
          goto LABEL_44;
        }
        objc_super v29 = [(_DPMLRuntimeRecipe *)self trialClient];
        uint64_t v30 = +[DPMLRuntimeKeyboard runWithTrialClient:v29 error:a3];

        if ((v30 & 0x80000000) == 0)
        {
          uint64_t v24 = +[NSNumber numberWithInt:v30];
          goto LABEL_33;
        }
      }
    }
    else if (a3)
    {
      +[_DPMLRuntimeError errorWithCode:400 underlyingError:v22 description:@"SQL Query Running Error"];
      v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

      id v19 = v22;
LABEL_45:

      goto LABEL_46;
    }
    v14 = 0;
    goto LABEL_44;
  }
  if (v5 == 1)
  {
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = sub_100019FB4;
    v50 = sub_100019FC4;
    id v51 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100019FB4;
    v44 = sub_100019FC4;
    id v45 = 0;
    v6 = +[_PFLLog extension];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(_DPMLRuntimeRecipe *)self graphDSL];
      v8 = [v7 description];
      sub_1000207B8(v8, (uint64_t)v57, v6, v7);
    }

    BOOL v9 = [(_DPMLRuntimeRecipe *)self graphDSL];
    v10 = [v9 bpsPublisher];

    v11 = +[_PFLLog extension];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v10 debugDescription];
      sub_100020768(v12, (uint64_t)v56, v11);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100019FCC;
    v39[3] = &unk_100030910;
    v39[4] = self;
    v39[5] = &v46;
    v39[6] = &v40;
    v39[7] = &v52;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001A190;
    v38[3] = &unk_100030938;
    v38[4] = &v40;
    id v13 = [v10 sinkWithBookmark:0 completion:v39 receiveInput:v38];
    if (v41[5])
    {
      v14 = +[NSNumber numberWithUnsignedInteger:v53[3]];
    }
    else if (a3)
    {
      +[_DPMLRuntimeError errorWithCode:200 underlyingError:v47[5] description:@"DSL Recording Error"];
      v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
  }
  else if (a3)
  {
    +[_DPMLRuntimeError errorWithCode:100 description:@"Recipe version not supported"];
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_46:
  return v14;
}

- (id)recordDataArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(_DPMLRuntimeRecipe *)self recordMetadata];
  v8 = [(_DPMLRuntimeRecipe *)self recordDataArray:v6 metadata:v7 error:a4];

  return v8;
}

- (id)recordDataArray:(id)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v202 = a4;
  v200 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[_DPMLRuntimeError errorWithCode:400 description:@"Received nil data array"];
      id v72 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v72 = 0;
    }
    goto LABEL_204;
  }
  if (![v8 count])
  {
    id v72 = &off_100034790;
    goto LABEL_204;
  }
  BOOL v9 = [(_DPMLRuntimeRecipe *)self clientIdentifier];
  v277[0] = v9;
  v10 = [(_DPMLRuntimeRecipe *)self recipeIdentifier];
  v277[1] = v10;
  v11 = +[NSArray arrayWithObjects:v277 count:2];

  v199 = v11;
  v205 = [v11 componentsJoinedByString:@":"];
  v12 = [(_DPMLRuntimeRecipe *)self dataTypeContent];

  if (!v12)
  {
    v73 = [v200 firstObject];
    v74 = &BiomeLibrary_ptr;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v76 = [(_DPMLRuntimeRecipe *)self recordParameters];
      id v77 = [v76 minValue];
      id v78 = [v77 intValue];
      uint64_t v79 = [(_DPMLRuntimeRecipe *)self recordParameters];
      v80 = [v79 maxValue];
      id v81 = [v80 intValue];
      v82 = [(_DPMLRuntimeRecipe *)self recordParameters];
      v83 = [v82 numBucket];
      unsigned int v84 = +[_DPMLRuntimeResultRecorderNumber recordData:forKey:minValue:maxValue:numBucket:metadata:error:](_DPMLRuntimeResultRecorderNumber, "recordData:forKey:minValue:maxValue:numBucket:metadata:error:", v200, v205, v78, v81, [v83 unsignedIntValue], v202, a5);

      v74 = &BiomeLibrary_ptr;
LABEL_70:

LABEL_197:
      v179 = +[_PFLLog extension];
      if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG)) {
        sub_100020968(v84, (uint64_t)v205, v179);
      }

      v180 = v74[146];
      id v181 = [v200 count];
      if (v84) {
        id v182 = v181;
      }
      else {
        id v182 = 0;
      }
      id v72 = [v180 numberWithUnsignedInteger:v182];
      goto LABEL_203;
    }
    v162 = [v200 firstObject];
    objc_opt_class();
    char v163 = objc_opt_isKindOfClass();

    if (v163)
    {
      v164 = _DPMLRuntimeResultRecorderString;
    }
    else
    {
      v177 = [v200 firstObject];
      objc_opt_class();
      char v178 = objc_opt_isKindOfClass();

      if ((v178 & 1) == 0)
      {
        v184 = [v200 firstObject];
        objc_opt_class();
        char v185 = objc_opt_isKindOfClass();

        if ((v185 & 1) == 0)
        {
          if (a5)
          {
            +[_DPMLRuntimeError errorWithCode:400 description:@"Unsupported data type"];
            id v72 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v72 = 0;
          }
          goto LABEL_203;
        }
        v186 = [v200 firstObject];
        id v76 = [v186 objectEnumerator];

        id v77 = [v76 nextObject];
        if (v77 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v239 = [(_DPMLRuntimeRecipe *)self recordParameters];
          v187 = [v239 minValue];
          id v188 = [v187 intValue];
          v189 = [(_DPMLRuntimeRecipe *)self recordParameters];
          v190 = [v189 maxValue];
          id v191 = [v190 intValue];
          v192 = [(_DPMLRuntimeRecipe *)self recordParameters];
          v193 = [v192 numBucket];
          unsigned int v84 = +[_DPMLRuntimeResultRecorderNumber recordMultipleKeysData:forBaseKey:minValue:maxValue:numBucket:metadata:error:](_DPMLRuntimeResultRecorderNumber, "recordMultipleKeysData:forBaseKey:minValue:maxValue:numBucket:metadata:error:", v200, v205, v188, v191, [v193 unsignedIntValue], v202, a5);

          v74 = &BiomeLibrary_ptr;
        }
        else
        {
          unsigned int v84 = +[_DPMLRuntimeResultRecorderBitVector recordMultipleKeysData:v200 forBaseKey:v205 metadata:v202 error:a5];
        }
        goto LABEL_70;
      }
      v164 = _DPMLRuntimeResultRecorderBitVector;
    }
    unsigned int v84 = [(__objc2_class *)v164 recordData:v200 forKey:v205 metadata:v202 error:a5];
    goto LABEL_197;
  }
  id v13 = [(_DPMLRuntimeRecipe *)self trialClient];
  v14 = [v13 namespaceIdentifier];

  uint64_t v15 = [(_DPMLRuntimeRecipe *)self dataTypeContent];
  v16 = sub_100019384(v14, v15);

  if (!v16)
  {
    if (a5)
    {
      +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot generate factor names. Check the logs for details"];
      id v72 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v72 = 0;
    }
    goto LABEL_193;
  }
  id v17 = [(_DPMLRuntimeRecipe *)self cohortNameList];
  id v18 = v200;
  v198 = v14;
  id v19 = v14;
  id v20 = v17;
  v197 = v16;
  id v234 = v16;
  int64_t v21 = +[NSMutableDictionary dictionary];
  long long v291 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  id obj = v18;
  v238 = self;
  v213 = v21;
  id v222 = [obj countByEnumeratingWithState:&v291 objects:v295 count:16];
  if (!v222) {
    goto LABEL_46;
  }
  id v22 = &selRef_initWithStartDate_endDate_maxEvents_lastN_reversed_;
  uint64_t v220 = *(void *)v292;
  id v208 = v19;
  id v210 = v20;
  do
  {
    for (i = 0; i != v222; i = (char *)i + 1)
    {
      if (*(void *)v292 != v220) {
        objc_enumerationMutation(obj);
      }
      id v24 = [*(id *)(*((void *)&v291 + 1) + 8 * i) mutableCopy];
      id v268 = 0;
      id v25 = [v22 + 369 keysForCohorts:v20 namespaceID:v19 parameters:v24 possibleError:&v268];
      id v26 = v25;
      if (v25)
      {
        v230 = i;
        v228 = v25;
        if ([v25 count])
        {
          id v27 = [v26 componentsJoinedByString:@"|"];
          [v24 removeObjectsForKeys:v20];
        }
        else
        {
          unsigned int v28 = +[_PFLLog extension];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_100020B60(&v266, v267, v28);
          }

          id v27 = @"N/A";
        }
        objc_super v29 = [v234 allKeys];
        uint64_t v30 = +[NSMutableSet setWithArray:v29];

        id v31 = [v24 allKeys];
        v32 = +[NSSet setWithArray:v31];
        [v30 intersectSet:v32];

        uint64_t v33 = +[_PFLLog extension];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100020AE4((uint64_t)v280, (uint64_t)v30);
        }

        v225 = v30;
        if ([v30 count])
        {
          v34 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v30 count]);
          long long v287 = 0u;
          long long v288 = 0u;
          long long v289 = 0u;
          long long v290 = 0u;
          id v35 = v30;
          id v36 = [v35 countByEnumeratingWithState:&v287 objects:&v283 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v288;
            v217 = v27;
            while (2)
            {
              for (j = 0; j != v37; j = (char *)j + 1)
              {
                if (*(void *)v288 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = *(void *)(*((void *)&v287 + 1) + 8 * (void)j);
                uint64_t v41 = [v234 objectForKey:v40];
                uint64_t v42 = [v24 objectForKey:v41];
                if (!v42)
                {
                  uint64_t v46 = +[_PFLLog extension];
                  int64_t v21 = v213;
                  id v27 = v217;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v282 = v41;
                    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "This data point is missing a value for '%@' required for factor level. Skipping", buf, 0xCu);
                  }

                  goto LABEL_33;
                }
                v43 = (void *)v42;
                *(void *)&long long v279 = v40;
                *((void *)&v279 + 1) = v42;
                v44 = +[NSArray arrayWithObjects:&v279 count:2];
                id v45 = [v44 componentsJoinedByString:@"+"];
                [v34 addObject:v45];

                [v24 removeObjectForKey:v41];
              }
              id v37 = [v35 countByEnumeratingWithState:&v287 objects:&v283 count:16];
              int64_t v21 = v213;
              id v27 = v217;
              if (v37) {
                continue;
              }
              break;
            }
          }
LABEL_33:

          id v47 = [v34 count];
          if (v47 == [v35 count])
          {
            uint64_t v48 = [v34 componentsJoinedByString:@"|"];

            id v19 = v208;
            id v20 = v210;
            id v22 = &selRef_initWithStartDate_endDate_maxEvents_lastN_reversed_;
            goto LABEL_36;
          }
          uint64_t v48 = @"N/A";
          id v19 = v208;
          id v20 = v210;
          id v22 = &selRef_initWithStartDate_endDate_maxEvents_lastN_reversed_;
        }
        else
        {
          uint64_t v48 = @"N/A";
LABEL_36:
          v278[0] = v27;
          v278[1] = v48;
          v49 = +[NSArray arrayWithObjects:v278 count:2];
          v34 = [v49 componentsJoinedByString:@":"];

          v50 = +[_PFLLog extension];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v282 = v34;
            _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "collectionKey = %@", buf, 0xCu);
          }

          id v51 = [v21 objectForKey:v34];
          uint64_t v52 = v51;
          if (v51)
          {
            [v51 addObject:v24];
          }
          else
          {
            +[NSMutableArray arrayWithObject:v24];
            uint64_t v54 = v53 = v27;
            [v21 setObject:v54 forKey:v34];

            id v27 = v53;
          }
        }
        i = v230;

        id v26 = v228;
        goto LABEL_44;
      }
      id v27 = +[_PFLLog extension];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v282 = v268;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cannot create cohort keys, using placeholder. Error: %@", buf, 0xCu);
      }
LABEL_44:
    }
    id v222 = [obj countByEnumeratingWithState:&v291 objects:v295 count:16];
  }
  while (v222);
LABEL_46:

  id v55 = [v21 allKeys];
  unsigned __int8 v56 = +[NSMutableSet set];
  long long v291 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  id v231 = v55;
  id v57 = [v231 countByEnumeratingWithState:&v291 objects:v295 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v292;
    do
    {
      for (k = 0; k != v58; k = (char *)k + 1)
      {
        if (*(void *)v292 != v59) {
          objc_enumerationMutation(v231);
        }
        v61 = [*(id *)(*((void *)&v291 + 1) + 8 * (void)k) componentsSeparatedByString:@":"];
        v62 = [v61 lastObject];

        long long v290 = 0u;
        long long v289 = 0u;
        long long v288 = 0u;
        long long v287 = 0u;
        v63 = [v62 componentsSeparatedByString:@"|"];
        id v64 = [v63 countByEnumeratingWithState:&v287 objects:&v283 count:16];
        if (v64)
        {
          id v65 = v64;
          uint64_t v66 = *(void *)v288;
          do
          {
            for (m = 0; m != v65; m = (char *)m + 1)
            {
              if (*(void *)v288 != v66) {
                objc_enumerationMutation(v63);
              }
              [v56 addObject:*(void *)(*((void *)&v287 + 1) + 8 * (void)m)];
            }
            id v65 = [v63 countByEnumeratingWithState:&v287 objects:&v283 count:16];
          }
          while (v65);
        }
      }
      id v58 = [v231 countByEnumeratingWithState:&v291 objects:v295 count:16];
    }
    while (v58);
  }

  if ([v56 count] != (id)1
    || ([v56 allObjects],
        v68 = objc_claimAutoreleasedReturnValue(),
        [v68 firstObject],
        v69 = objc_claimAutoreleasedReturnValue(),
        unsigned int v70 = [v69 isEqualToString:@"N/A"],
        v69,
        v68,
        !v70))
  {
    uint64_t v85 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v56 count]);
    long long v262 = 0u;
    long long v263 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    uint64_t v71 = v56;
    v229 = (void *)v85;
    id v221 = [v71 countByEnumeratingWithState:&v262 objects:v276 count:16];
    if (!v221) {
      goto LABEL_104;
    }
    uint64_t v86 = *(void *)v263;
    uint64_t obja = *(void *)v263;
    v218 = v71;
    while (1)
    {
      v87 = 0;
      do
      {
        if (*(void *)v263 != v86) {
          objc_enumerationMutation(v71);
        }
        int64_t v88 = [*(id *)(*((void *)&v262 + 1) + 8 * (void)v87) componentsSeparatedByString:@"+"];
        v89 = [v88 firstObject];
        v90 = [v234 objectForKey:v89];

        if (v90)
        {
          v91 = [v88 lastObject];
          v92 = [(_DPMLRuntimeRecipe *)v238 trialClient];
          id v261 = 0;
          v93 = [v92 downloadFactor:v91 error:&v261];
          id v226 = v261;

          if (v93)
          {
            v223 = v88;
            uint64_t v94 = [v229 objectForKey:v89];
            v95 = v94;
            if (v94)
            {
              v96 = [v94 objectForKey:v91];

              uint64_t v71 = v218;
              if (!v96)
              {
                v97 = +[NSURL fileURLWithPath:v93];
                [v95 setObject:v97 forKey:v91];
                goto LABEL_97;
              }
            }
            else
            {
              v97 = +[NSURL fileURLWithPath:v93];
              long long v105 = +[NSMutableDictionary dictionaryWithObject:v97 forKey:v91];
              [v229 setObject:v105 forKey:v89];

              uint64_t v71 = v218;
LABEL_97:

              uint64_t v86 = obja;
            }
            int64_t v88 = v223;
          }
          else
          {
            v98 = +[_PFLLog extension];
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v295 = 138412290;
              v296 = v91;
              _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "Cannot download Trial factor %@. Error: ", v295, 0xCu);
            }

            long long v259 = 0u;
            long long v260 = 0u;
            long long v257 = 0u;
            long long v258 = 0u;
            v95 = [v226 describe];
            id v99 = [v95 countByEnumeratingWithState:&v257 objects:v275 count:16];
            if (v99)
            {
              id v100 = v99;
              v211 = v89;
              v224 = v88;
              uint64_t v101 = *(void *)v258;
              do
              {
                for (n = 0; n != v100; n = (char *)n + 1)
                {
                  if (*(void *)v258 != v101) {
                    objc_enumerationMutation(v95);
                  }
                  v103 = *(NSObject **)(*((void *)&v257 + 1) + 8 * (void)n);
                  id v104 = +[_PFLLog extension];
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v295 = 138412290;
                    v296 = v103;
                    _os_log_debug_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "%@", v295, 0xCu);
                  }
                }
                id v100 = [v95 countByEnumeratingWithState:&v257 objects:v275 count:16];
              }
              while (v100);
              uint64_t v71 = v218;
              uint64_t v86 = obja;
              int64_t v88 = v224;
              v93 = 0;
              v89 = v211;
            }
            else
            {
              uint64_t v86 = obja;
            }
          }

          goto LABEL_100;
        }
        v91 = +[_PFLLog extension];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v295 = 138412290;
          v296 = v89;
          _os_log_fault_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_FAULT, "Categorical type '%@' is not using a factor.", v295, 0xCu);
        }
LABEL_100:

        v87 = (char *)v87 + 1;
      }
      while (v87 != v221);
      id v106 = [v71 countByEnumeratingWithState:&v262 objects:v276 count:16];
      id v221 = v106;
      if (!v106) {
        goto LABEL_104;
      }
    }
  }
  uint64_t v71 = +[_PFLLog extension];
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    sub_100020AB0();
  }
  v229 = 0;
LABEL_104:

  long long v107 = +[_PFLLog extension];
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
    sub_100020A44();
  }

  long long v108 = [(_DPMLRuntimeRecipe *)v238 trialClient];
  uint64_t v109 = [v108 experimentIdentifier];

  if (v109) {
    CFStringRef v110 = (const __CFString *)v109;
  }
  else {
    CFStringRef v110 = @"NoTrialExperimentIdentifier";
  }
  id v111 = [(_DPMLRuntimeRecipe *)v238 trialClient];
  uint64_t v112 = [v111 deploymentIdentifier];

  if (v112) {
    CFStringRef v113 = (const __CFString *)v112;
  }
  else {
    CFStringRef v113 = @"NoTrialDeploymentIdentifier";
  }
  long long v114 = [(_DPMLRuntimeRecipe *)v238 trialClient];
  uint64_t v115 = [v114 treatmentIdentifier];

  CFStringRef v116 = @"NoTrialTreatmentIdentifier";
  if (v115) {
    CFStringRef v116 = (const __CFString *)v115;
  }
  v195 = (__CFString *)v113;
  v196 = (__CFString *)v110;
  v274[0] = v110;
  v274[1] = v113;
  v194 = (__CFString *)v116;
  v274[2] = v116;
  uint64_t v117 = +[NSArray arrayWithObjects:v274 count:3];
  v204 = [v117 componentsJoinedByString:@":"];

  long long v255 = 0u;
  long long v256 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  id v207 = v213;
  id v206 = [v207 countByEnumeratingWithState:&v253 objects:v273 count:16];
  if (v206)
  {
    uint64_t v201 = 0;
    uint64_t v203 = *(void *)v254;
    do
    {
      for (id ii = 0; ii != v206; id ii = v161 + 1)
      {
        if (*(void *)v254 != v203) {
          objc_enumerationMutation(v207);
        }
        v214 = (char *)ii;
        v119 = *(void **)(*((void *)&v253 + 1) + 8 * (void)ii);
        v212 = [v207 objectForKey:v119];
        v272[0] = v205;
        v272[1] = v119;
        v272[2] = v204;
        v120 = +[NSArray arrayWithObjects:v272 count:3];
        uint64_t v209 = [v120 componentsJoinedByString:@":"];

        uint64_t v121 = [v119 componentsSeparatedByString:@":"];
        CFStringRef v122 = [v121 lastObject];
        v123 = [v122 componentsSeparatedByString:@"|"];

        v124 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v123 count]);
        long long v249 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        long long v252 = 0u;
        id v219 = v123;
        id v235 = [v219 countByEnumeratingWithState:&v249 objects:v271 count:16];
        if (v235)
        {
          uint64_t v125 = *(void *)v250;
          uint64_t v232 = *(void *)v250;
LABEL_121:
          uint64_t v126 = 0;
          while (1)
          {
            if (*(void *)v250 != v125) {
              objc_enumerationMutation(v219);
            }
            v127 = *(NSObject **)(*((void *)&v249 + 1) + 8 * v126);
            v128 = +[_PFLLog extension];
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v295 = 138412290;
              v296 = v127;
              _os_log_debug_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEBUG, "Attempting to process \"%@\"", v295, 0xCu);
            }

            v129 = [v127 componentsSeparatedByString:@"+"];
            v130 = [v129 firstObject];
            v131 = [v229 objectForKey:v130];
            if (v131)
            {
              v132 = [v129 lastObject];
              v133 = [v131 objectForKey:v132];
              if (v133)
              {
                [v124 setObject:v133 forKey:v130];
                int v134 = 0;
              }
              else
              {
                v135 = v124;
                v136 = +[_PFLLog extension];
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v295 = 138412546;
                  v296 = v130;
                  __int16 v297 = 2112;
                  v298 = v132;
                  _os_log_error_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "No level URL found for data type \"%@\" and level \"%@\"", v295, 0x16u);
                }

                int v134 = 8;
                v124 = v135;
                uint64_t v125 = v232;
              }
            }
            else
            {
              v132 = +[_PFLLog extension];
              if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v295 = 138412290;
                v296 = v130;
                _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "No level URLs found for data type \"%@\"", v295, 0xCu);
              }
              int v134 = 8;
            }

            if (v134) {
              break;
            }
            if (v235 == (id)++v126)
            {
              id v235 = [v219 countByEnumeratingWithState:&v249 objects:v271 count:16];
              if (v235) {
                goto LABEL_121;
              }
              break;
            }
          }
        }

        id v137 = [(_DPMLRuntimeRecipe *)v238 dataTypeContent];
        id v233 = v124;
        id v227 = [v137 mutableCopy];
        long long v283 = 0u;
        long long v284 = 0u;
        long long v285 = 0u;
        long long v286 = 0u;
        id v138 = v137;
        id v139 = [v138 countByEnumeratingWithState:&v283 objects:v295 count:16];
        if (v139)
        {
          id v140 = v139;
          id v236 = *(id *)v284;
          while (2)
          {
            for (jj = 0; jj != v140; jj = (char *)jj + 1)
            {
              if (*(id *)v284 != v236) {
                objc_enumerationMutation(v138);
              }
              uint64_t v142 = *(void *)(*((void *)&v283 + 1) + 8 * (void)jj);
              v143 = [v138 objectForKey:v142];
              v144 = [v143 objectForKey:@"dataType"];
              int64_t v145 = +[FedStatsDataTypeFactory dataTypeFromString:v144];

              if (v145 == 3)
              {
                v146 = [v143 objectForKey:@"categoryFile"];
                if (v146)
                {
                  v147 = +[_PFLLog extension];
                  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                  {
                    LODWORD(v279) = 138412290;
                    *(void *)((char *)&v279 + 4) = v142;
                    _os_log_debug_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEBUG, "categoryFileDesc = %@", (uint8_t *)&v279, 0xCu);
                  }

                  uint64_t v148 = [v233 objectForKey:v142];
                  if (!v148)
                  {
                    v155 = +[_PFLLog extension];
                    if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v279) = 138412290;
                      *(void *)((char *)&v279 + 4) = v142;
                      _os_log_error_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_ERROR, "No URL for '%@'", (uint8_t *)&v279, 0xCu);
                    }

                    v153 = 0;
                    v154 = v209;
                    v152 = v227;
                    goto LABEL_157;
                  }
                  v149 = (void *)v148;
                  *(void *)&long long v287 = @"dataType";
                  v150 = +[FedStatsDataTypeFactory stringFromDataType:3];
                  *((void *)&v287 + 1) = @"categoryFile";
                  *(void *)&long long v291 = v150;
                  *((void *)&v291 + 1) = v149;
                  v151 = +[NSDictionary dictionaryWithObjects:&v291 forKeys:&v287 count:2];
                  [v227 setObject:v151 forKey:v142];
                }
              }
            }
            id v140 = [v138 countByEnumeratingWithState:&v283 objects:v295 count:16];
            if (v140) {
              continue;
            }
            break;
          }
        }

        v152 = v227;
        v153 = v227;
        v154 = v209;
LABEL_157:

        v156 = +[_PFLLog extension];
        BOOL v157 = os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG);
        if (v153)
        {
          if (v157)
          {
            *(_DWORD *)v295 = 138412290;
            v296 = v153;
            _os_log_debug_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEBUG, "dataTypeContent = %@", v295, 0xCu);
          }

          id v248 = 0;
          unsigned __int8 v158 = +[FedStatsDataEncoder encodeDataArrayAndRecord:v212 dataTypeContent:v153 metadata:v202 baseKey:v154 errorOut:&v248];
          v156 = v248;
          v159 = +[_PFLLog extension];
          v160 = v159;
          if (v158)
          {
            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG)) {
              sub_1000209F4((uint64_t)v278, (uint64_t)v212);
            }

            v201 += (uint64_t)[v212 count];
          }
          else
          {
            if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v295 = 138412290;
              v296 = v156;
              _os_log_error_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_ERROR, "Cannot decode and record some data: %@", v295, 0xCu);
            }
          }
          v161 = v214;
        }
        else
        {
          v161 = v214;
          if (v157)
          {
            *(_DWORD *)v295 = 138412290;
            v296 = v154;
            _os_log_debug_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEBUG, "Skipping the base key '%@' since the factor level is invalid", v295, 0xCu);
          }
        }
      }
      id v206 = [v207 countByEnumeratingWithState:&v253 objects:v273 count:16];
    }
    while (v206);
  }
  else
  {
    uint64_t v201 = 0;
  }

  long long v246 = 0u;
  long long v247 = 0u;
  long long v244 = 0u;
  long long v245 = 0u;
  id v237 = [v229 allValues];
  id v165 = [v237 countByEnumeratingWithState:&v244 objects:v270 count:16];
  if (v165)
  {
    id v166 = v165;
    uint64_t v167 = *(void *)v245;
    do
    {
      for (kk = 0; kk != v166; kk = (char *)kk + 1)
      {
        if (*(void *)v245 != v167) {
          objc_enumerationMutation(v237);
        }
        v169 = *(void **)(*((void *)&v244 + 1) + 8 * (void)kk);
        long long v240 = 0u;
        long long v241 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        v170 = [v169 allKeys];
        id v171 = [v170 countByEnumeratingWithState:&v240 objects:v269 count:16];
        if (v171)
        {
          id v172 = v171;
          uint64_t v173 = *(void *)v241;
          do
          {
            for (mm = 0; mm != v172; mm = (char *)mm + 1)
            {
              if (*(void *)v241 != v173) {
                objc_enumerationMutation(v170);
              }
              uint64_t v175 = *(void *)(*((void *)&v240 + 1) + 8 * (void)mm);
              v176 = [(_DPMLRuntimeRecipe *)v238 trialClient];
              [v176 removeFactor:v175];
            }
            id v172 = [v170 countByEnumeratingWithState:&v240 objects:v269 count:16];
          }
          while (v172);
        }
      }
      id v166 = [v237 countByEnumeratingWithState:&v244 objects:v270 count:16];
    }
    while (v166);
  }

  id v72 = +[NSNumber numberWithUnsignedInteger:v201];

  v16 = v197;
  v14 = v198;
LABEL_193:

LABEL_203:
LABEL_204:

  return v72;
}

+ (int64_t)dataRecorderTypeEnumFromString:(id)a3
{
  v8[0] = @"numericType";
  v8[1] = @"bitVectorType";
  v9[0] = &off_1000347A8;
  v9[1] = &off_1000347C0;
  v8[2] = @"stringType";
  v8[3] = @"wordType";
  v9[2] = &off_1000347D8;
  v9[3] = &off_1000347F0;
  v8[4] = @"multipleKeysBitVectorType";
  v8[5] = @"multipleKeysNumberType";
  v9[4] = &off_100034808;
  v9[5] = &off_100034820;
  v8[6] = @"dataContentType";
  v9[6] = &off_100034838;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:7];
  unint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (v5) {
    int64_t v6 = (int64_t)[v5 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

+ (id)DSLSupportedClassesSet
{
  if (qword_10003DD20 != -1) {
    dispatch_once(&qword_10003DD20, &stru_100030958);
  }
  v2 = (void *)qword_10003DD18;
  return v2;
}

- (_DPMLRuntimeTrialClient)trialClient
{
  return self->_trialClient;
}

- (NSString)recipeIdentifier
{
  return self->_recipeIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)recipeType
{
  return self->_recipeType;
}

- (int64_t)dataRecorderType
{
  return self->_dataRecorderType;
}

- (NSDictionary)recordMetadata
{
  return self->_recordMetadata;
}

- (void)setRecordMetadata:(id)a3
{
}

- (BMDSL)graphDSL
{
  return self->_graphDSL;
}

- (void)setGraphDSL:(id)a3
{
}

- (_DPMLRuntimeLegacyRecordParameters)recordParameters
{
  return self->_recordParameters;
}

- (void)setRecordParameters:(id)a3
{
}

- (NSDictionary)dataTypeContent
{
  return self->_dataTypeContent;
}

- (void)setDataTypeContent:(id)a3
{
}

- (NSString)sqlQuery
{
  return self->_sqlQuery;
}

- (void)setSqlQuery:(id)a3
{
}

- (NSDictionary)sqlAccessTable
{
  return self->_sqlAccessTable;
}

- (void)setSqlAccessTable:(id)a3
{
}

- (NSArray)cohortNameList
{
  return self->_cohortNameList;
}

- (void)setCohortNameList:(id)a3
{
}

- (BOOL)isUnknownDictionaryCase
{
  return self->_isUnknownDictionaryCase;
}

- (void)setIsUnknownDictionaryCase:(BOOL)a3
{
  self->_isUnknownDictionaryCase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortNameList, 0);
  objc_storeStrong((id *)&self->_sqlAccessTable, 0);
  objc_storeStrong((id *)&self->_sqlQuery, 0);
  objc_storeStrong((id *)&self->_dataTypeContent, 0);
  objc_storeStrong((id *)&self->_recordParameters, 0);
  objc_storeStrong((id *)&self->_graphDSL, 0);
  objc_storeStrong((id *)&self->_recordMetadata, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeIdentifier, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
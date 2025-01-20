@interface MOClusteringUtility
+ (unint64_t)getTheBestPersonRelationtshipTagFor:(id)a3;
@end

@implementation MOClusteringUtility

+ (unint64_t)getTheBestPersonRelationtshipTagFor:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 personRelationships];
  id v6 = [v5 count];

  if (!v6)
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:](v3);
    }
    unint64_t v23 = 0;
    goto LABEL_45;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v7 = [v3 personRelationships];
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v8) {
    goto LABEL_25;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v31;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if ([v12 relationship] == (id)4)
      {
        [v12 score];
        if (v13 >= 0.927661)
        {
          [v12 score];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v19 = v4;
          v20 = v18;
          v21 = &off_1000B6B70;
          goto LABEL_22;
        }
      }
      if ([v12 relationship] == (id)15)
      {
        [v12 score];
        if (v14 >= 0.959)
        {
          [v12 score];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v19 = v4;
          v20 = v18;
          v21 = &off_1000B6B88;
          goto LABEL_22;
        }
      }
      if ([v12 relationship] == (id)27)
      {
        [v12 score];
        if (v15 >= 1.0)
        {
          [v12 score];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v19 = v4;
          v20 = v18;
          v21 = &off_1000B6BA0;
          goto LABEL_22;
        }
      }
      if ([v12 relationship] == (id)21)
      {
        [v12 score];
        if (v16 >= 0.949924)
        {
          [v12 score];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v19 = v4;
          v20 = v18;
          v21 = &off_1000B6BB8;
          goto LABEL_22;
        }
      }
      if ([v12 relationship] == (id)22)
      {
        [v12 score];
        if (v17 >= 0.96)
        {
          [v12 score];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v19 = v4;
          v20 = v18;
          v21 = &off_1000B6BD0;
LABEL_22:
          [v19 setObject:v20 forKeyedSubscript:v21];

          continue;
        }
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v9);
LABEL_25:

  if ([v4 count])
  {
    v22 = [v4 keysOfEntriesPassingTest:&__block_literal_global_4];
    if (![v22 count]) {
      goto LABEL_41;
    }
    if ([v22 containsObject:&off_1000B6B88]) {
      goto LABEL_44;
    }
    if ([v22 containsObject:&off_1000B6BA0]) {
      goto LABEL_29;
    }
    if ([v22 containsObject:&off_1000B6BB8])
    {
LABEL_37:
      unint64_t v23 = 21;
      goto LABEL_45;
    }
    if ([v22 containsObject:&off_1000B6BD0])
    {
      unint64_t v23 = 22;
      goto LABEL_45;
    }
    if ([v22 containsObject:&off_1000B6B70])
    {
LABEL_42:
      unint64_t v23 = 4;
      goto LABEL_45;
    }
LABEL_41:
    v24 = [v4 objectForKey:&off_1000B6B70];

    if (v24) {
      goto LABEL_42;
    }
    v25 = [v4 objectForKey:&off_1000B6B88];

    if (v25)
    {
LABEL_44:
      unint64_t v23 = 15;
      goto LABEL_45;
    }
    v27 = [v4 objectForKey:&off_1000B6BA0];

    if (v27)
    {
LABEL_29:
      unint64_t v23 = 27;
    }
    else
    {
      v28 = [v4 objectForKey:&off_1000B6BB8];

      if (v28) {
        goto LABEL_37;
      }
      v29 = [v4 objectForKey:&off_1000B6BD0];

      if (v29) {
        unint64_t v23 = 22;
      }
      else {
        unint64_t v23 = 1;
      }
    }
  }
  else
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:](v3);
    }
    unint64_t v23 = 1;
  }
LABEL_45:

  return v23;
}

BOOL __59__MOClusteringUtility_getTheBestPersonRelationtshipTagFor___block_invoke(id a1, id a2, id a3, BOOL *a4)
{
  [a3 floatValue];
  return v4 >= 1.0;
}

+ (void)getTheBestPersonRelationtshipTagFor:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  v2 = [v1 mask];
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v3, v4, "No personalRelationship is available for person %@", v5, v6, v7, v8, 2u);
}

+ (void)getTheBestPersonRelationtshipTagFor:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  v2 = [v1 mask];
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v3, v4, "None of personalRelationships are confident enough to generate the best relationship tag for person %@", v5, v6, v7, v8, 2u);
}

@end
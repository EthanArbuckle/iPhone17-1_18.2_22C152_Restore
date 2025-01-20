@interface APOdmlSearchResultsExtension
- (id)performTask:(id)a3 outError:(id *)a4;
- (void)stop;
@end

@implementation APOdmlSearchResultsExtension

- (id)performTask:(id)a3 outError:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v88 = a4;
  id v87 = objc_alloc_init((Class)APOdmlRecipeParser);
  id v4 = objc_alloc((Class)APOdmlRecipe);
  id v86 = [v4 initWithMLRTask:location[0]];
  id v45 = [location[0] attachments];
  id v85 = [v45 attachmentURLs];

  id v84 = 0;
  id v83 = (id)OdmlLogForCategory();
  os_log_type_t v82 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEFAULT))
  {
    log = v83;
    os_log_type_t type = v82;
    __os_log_helper_16_0_0(v81);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Starting DES recipe evaluation", v81, 2u);
  }
  objc_storeStrong(&v83, 0);
  if (v86)
  {
    id v6 = objc_alloc((Class)APOdmlTrainingSetBuilder);
    id v75 = [v6 initWithLocalRecords:0 recipe:v86];
    id v73 = v84;
    id v39 = [v87 formatRecipe:v86 attachments:v85 error:&v73];
    objc_storeStrong(&v84, v73);
    id v74 = v39;
    if (v39)
    {
      id v10 = objc_alloc((Class)APOdmlEspressoEvaluator);
      id v69 = [v10 initWithTrainingRowBuilder:v75 recipe:v86 netURL:v74];
      id v68 = 0;
      id v66 = 0;
      id v34 = [v69 evaluate:&v66];
      objc_storeStrong(&v68, v66);
      id v67 = v34;
      if ([v69 trainingSetSize])
      {
        if (v67 && !v68)
        {
          id v17 = +[APOdmlLogUtility printModelDeltasInSegments:v67 isPlugin:1];
          id v25 = [v67 objectForKey:kAPOdmlDESPluginMetricsKey];
          id v59 = [v25 copy];

          id v58 = [v67 objectForKey:kAPOdmlDESPluginDeltasKey];
          id v57 = +[APOdmlPFLUtilities convertToFloat:v58];
          id v56 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v57, 4 * (void)[v58 count], 1);
          if (+[NSJSONSerialization isValidJSONObject:v59])
          {
            id v55 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:v59 unprivatizedVector:v56];
            os_log_t v54 = (os_log_t)(id)OdmlLogForCategory();
            os_log_type_t v53 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_3_1_8_65((uint64_t)v93, (uint64_t)v55);
              _os_log_impl((void *)&_mh_execute_header, v54, v53, "MLRTaskResult: %{private}@", v93, 0xCu);
            }
            objc_storeStrong((id *)&v54, 0);
            os_log_t v52 = (os_log_t)(id)OdmlLogForCategory();
            os_log_type_t v51 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v55 JSONResult];
              __os_log_helper_16_3_1_8_65((uint64_t)v92, (uint64_t)v24);
              _os_log_impl((void *)&_mh_execute_header, v52, v51, "MLRTaskResult JSONResult: %{private}@", v92, 0xCu);
            }
            objc_storeStrong((id *)&v52, 0);
            os_log_t v50 = (os_log_t)(id)OdmlLogForCategory();
            os_log_type_t v49 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              id v23 = [v55 vector];
              __os_log_helper_16_3_1_8_65((uint64_t)v91, (uint64_t)v23);
              _os_log_impl((void *)&_mh_execute_header, v50, v49, "MLRTaskResult Vector: %{private}@", v91, 0xCu);
            }
            objc_storeStrong((id *)&v50, 0);
            id v22 = [v86 isCounterfactual];
            +[APOdmlAnalyticsModelTraining sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:](APOdmlAnalyticsModelTraining, "sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:", 0, 0, 0, v22 != 0, [v69 trainingSetSize], 9.22337204e18);

            id v90 = v55;
            int v76 = 1;
            objc_storeStrong(&v55, 0);
          }
          else
          {
            os_log_t v48 = (os_log_t)(id)OdmlLogForCategory();
            os_log_type_t v47 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v20 = v48;
              os_log_type_t v21 = v47;
              __os_log_helper_16_0_0(v46);
              _os_log_impl((void *)&_mh_execute_header, v20, v21, "Metrics JSON was invalid; returning nil.", v46, 2u);
            }
            objc_storeStrong((id *)&v48, 0);
            id v90 = 0;
            int v76 = 1;
          }
          objc_storeStrong(&v56, 0);
          objc_storeStrong(&v58, 0);
          objc_storeStrong(&v59, 0);
        }
        else
        {
          os_log_t v62 = (os_log_t)(id)OdmlLogForCategory();
          os_log_type_t v61 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v28 = v62;
            os_log_type_t v29 = v61;
            __os_log_helper_16_0_0(v60);
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "Model Evaluation failed", v60, 2u);
          }
          objc_storeStrong((id *)&v62, 0);
          if (!v68)
          {
            v14 = +[NSError errorWithDomain:kAPODMLDESPluginErrorDomain code:kAPODMLDESPluginUnknownEvaluationError userInfo:0];
            id v15 = v68;
            id v68 = v14;
          }
          id v26 = v68;
          id v27 = [v86 isCounterfactual];
          +[APOdmlAnalyticsModelTraining sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:](APOdmlAnalyticsModelTraining, "sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:", v26, 0, 0, v27 != 0, [v69 trainingSetSize], 9.22337204e18);

          id v16 = v68;
          id *v88 = v16;
          id v90 = 0;
          int v76 = 1;
        }
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)OdmlLogForCategory();
        os_log_type_t v64 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v32 = oslog;
          os_log_type_t v33 = v64;
          __os_log_helper_16_0_0(v63);
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Evaluator did not have any valid rows.", v63, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        if (!v68)
        {
          v11 = +[NSError errorWithDomain:kAPODMLDESPluginErrorDomain code:kAPODMLDESPluginNoValidRows userInfo:0];
          id v12 = v68;
          id v68 = v11;
        }
        id v30 = v68;
        id v31 = [v86 isCounterfactual];
        +[APOdmlAnalyticsModelTraining sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:](APOdmlAnalyticsModelTraining, "sendEvent:additionalDetails:info:isCounterfactual:numOfRows:normDelta:", v30, 0, 0, v31 != 0, [v69 trainingSetSize], 9.22337204e18);

        id v13 = v68;
        id *v88 = v13;
        id v90 = 0;
        int v76 = 1;
      }
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, 0);
      objc_storeStrong(&v69, 0);
    }
    else
    {
      id v72 = (id)OdmlLogForCategory();
      char v71 = 16;
      if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
      {
        v37 = v72;
        os_log_type_t v38 = v71;
        __os_log_helper_16_0_0(v70);
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Evaluator formatting error.", v70, 2u);
      }
      objc_storeStrong(&v72, 0);
      if (!v84)
      {
        v7 = +[NSError errorWithDomain:kAPODMLDESPluginErrorDomain code:kAPODMLDESPluginUnknownFormattingError userInfo:0];
        id v8 = v84;
        id v84 = v7;
      }
      id v35 = v84;
      id v36 = [v86 isCounterfactual];
      +[APOdmlAnalyticsModelTraining sendEvent:v35 additionalDetails:0 info:0 isCounterfactual:v36 != 0 numOfRows:0x7FFFFFFFFFFFFFFFLL normDelta:9.22337204e18];

      id v9 = v84;
      id *v88 = v9;
      id v90 = 0;
      int v76 = 1;
    }
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v75, 0);
  }
  else
  {
    id v80 = (id)OdmlLogForCategory();
    char v79 = 16;
    if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
    {
      v40 = v80;
      os_log_type_t v41 = v79;
      __os_log_helper_16_0_0(v78);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Recipe is nil", v78, 2u);
    }
    objc_storeStrong(&v80, 0);
    v77 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAPODMLDESPluginErrorDomain, kAPODMLDESPluginErrorMissingRecipe);
    +[APOdmlAnalyticsModelTraining sendEvent:v77 additionalDetails:0 info:0 isCounterfactual:0 numOfRows:0x7FFFFFFFFFFFFFFFLL normDelta:9.22337204e18];
    v5 = v77;
    id *v88 = v5;
    id v90 = 0;
    int v76 = 1;
    objc_storeStrong((id *)&v77, 0);
  }
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(location, 0);
  v18 = v90;

  return v18;
}

- (void)stop
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)OdmlLogForCategory();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_impl((void *)&_mh_execute_header, log, type, "MLRTaskPerforming stop method called.", v4, 2u);
  }
  objc_storeStrong(location, 0);
}

@end
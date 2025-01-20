@interface CHRemoteRecognitionRequestHandler
+ (id)_maxStrokeLimitErrorWithInputDrawingStrokeCount:(int64_t)a3;
- (BOOL)isValidRemoteRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (CHRemoteRecognitionRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5;
- (id)_buildMultiLingualResultForRequest:(id)a3 recognitionLocales:(id)a4 recognizersByLocale:(id)a5 statisticsByLocale:(id)a6;
- (id)_computeTextRecognitionResultsForRequest:(id)a3 recognizer:(id)a4 recognizerCachingKey:(id)a5 isTopLocale:(BOOL)a6 writingStatistics:(id)a7;
- (id)_queueForRequest:(id)a3;
- (id)generateRecognitionOptionsFromRequest:(id)a3 isTopLocale:(BOOL)a4 cachedPrefixResult:(id)a5 cachedPrefixColumnRangeToKeep:(_NSRange)a6;
- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRangeToKeep:(_NSRange *)a5 strokesToRecognize:(id *)a6;
- (void)_handleValidRecognitionMathRequest:(id)a3 withReply:(id)a4;
- (void)_handleValidRecognitionRequest:(id)a3 withReply:(id)a4;
- (void)_handleValidRecognitionTextRequest:(id)a3 withReply:(id)a4;
- (void)_handleValidSketchRecognitionRequest:(id)a3 withReply:(id)a4;
- (void)dealloc;
- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)handleSketchRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)optimizeResourceUsage;
- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5 bundleIdentifier:(id)a6;
@end

@implementation CHRemoteRecognitionRequestHandler

- (CHRemoteRecognitionRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHRemoteRecognitionRequestHandler;
  v11 = [(CHRemoteProcessingRequestHandler *)&v21 initWithServerQueue:v8 lowPriorityQueue:v9 highPriorityQueue:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    recognizerManager = v11->_recognizerManager;
    v11->_recognizerManager = (CHCachedRecognizerManager *)v12;

    uint64_t v14 = objc_opt_new();
    recognizerInferenceCache = v11->_recognizerInferenceCache;
    v11->_recognizerInferenceCache = (CHRecognizerInferenceCache *)v14;

    uint64_t v16 = objc_opt_new();
    recognizerResultsCache = v11->_recognizerResultsCache;
    v11->_recognizerResultsCache = (CHRecognizerResultCache *)v16;

    v11->_openRequestCount = 0;
    if (_os_feature_enabled_impl())
    {
      uint64_t v18 = +[CHStrokeClassificationModel modelWithModelName:@"script_classification.bundle"];
      scriptClassifier = v11->_scriptClassifier;
      v11->_scriptClassifier = (CHStrokeClassificationModel *)v18;
    }
    else
    {
      scriptClassifier = v11->_scriptClassifier;
      v11->_scriptClassifier = 0;
    }
  }
  return v11;
}

- (void)dealloc
{
  recognizerManager = self->_recognizerManager;
  self->_recognizerManager = 0;

  lexiconManager = self->_lexiconManager;
  self->_lexiconManager = 0;

  recognizerInferenceCache = self->_recognizerInferenceCache;
  self->_recognizerInferenceCache = 0;

  scriptClassifier = self->_scriptClassifier;
  self->_scriptClassifier = 0;

  v7.receiver = self;
  v7.super_class = (Class)CHRemoteRecognitionRequestHandler;
  [(CHRemoteRecognitionRequestHandler *)&v7 dealloc];
}

- (id)_queueForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 priority];
  if (!v5) {
    goto LABEL_4;
  }
  if (v5 == (id)1)
  {
    uint64_t v6 = [(CHRemoteProcessingRequestHandler *)self highPriorityQueue];
    goto LABEL_6;
  }
  if (v5 == (id)2)
  {
LABEL_4:
    uint64_t v6 = [(CHRemoteProcessingRequestHandler *)self lowPriorityQueue];
LABEL_6:
    objc_super v7 = (void *)v6;
    goto LABEL_12;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v8 = (id)qword_10002B138;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid recognition request priority specified", v10, 2u);
  }

  objc_super v7 = 0;
LABEL_12:

  return v7;
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B034;
  v15[3] = &unk_100024BD0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

+ (id)_maxStrokeLimitErrorWithInputDrawingStrokeCount:(int64_t)a3
{
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"The number of strokes in the input drawing exceeds the maximum number permitted for remote recognition (%ld strokes)" value:&stru_1000257A0 table:0];

  uint64_t v6 = +[NSBundle mainBundle];
  objc_super v7 = [v6 localizedStringForKey:@"Remote recognition cannot handle the input drawing (%ld strokes) because its stroke count exceeds the limit" value:&stru_1000257A0 table:0];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Submit drawings that do not exceed the stroke limit of remote recognition" value:&stru_1000257A0 table:0];

  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, [(id)objc_opt_class() absoluteMaxStrokeCountPerRequest], NSLocalizedDescriptionKey);
  v16[0] = v10;
  v15[1] = NSLocalizedFailureReasonErrorKey;
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, a3);
  v15[2] = NSLocalizedRecoverySuggestionErrorKey;
  v16[1] = v11;
  v16[2] = v9;
  id v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v13 = +[NSError errorWithDomain:@"com.apple.corehandwriting" code:-1000 userInfo:v12];

  return v13;
}

- (BOOL)isValidRemoteRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [a4 lowercaseString];
  unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.compose"];

  if (v7)
  {
    id v10 = [v7 drawing];

    if (v10)
    {
      v11 = [v7 drawing];
      id v12 = [v11 strokeCount];

      if (v12)
      {
        if ((v9 & 1) != 0
          || ([v7 drawing],
              id v13 = objc_claimAutoreleasedReturnValue(),
              id v14 = [v13 strokeCount],
              id v15 = [(id)objc_opt_class() absoluteMaxStrokeCountPerRequest],
              v13,
              v14 <= v15))
        {
          id v18 = 0;
          BOOL v19 = 1;
          if (!a5) {
            goto LABEL_15;
          }
        }
        else
        {
          id v16 = objc_opt_class();
          id v17 = [v7 drawing];
          id v18 = [v16 _maxStrokeLimitErrorWithInputDrawingStrokeCount:[v17 strokeCount]];

          BOOL v19 = 0;
          if (!a5) {
            goto LABEL_15;
          }
        }
        goto LABEL_14;
      }
      v30 = +[NSBundle mainBundle];
      objc_super v21 = [v30 localizedStringForKey:@"The input drawing is empty (contains no strokes)" value:&stru_1000257A0 table:0];

      v31 = +[NSBundle mainBundle];
      v23 = [v31 localizedStringForKey:@"Recognition cannot be performed on empty drawings" value:&stru_1000257A0 table:0];

      v32 = +[NSBundle mainBundle];
      v25 = [v32 localizedStringForKey:@"Submit drawings containing at least one stroke for recognition" value:&stru_1000257A0 table:0];

      uint64_t v26 = [(id)objc_opt_class() invalidInputErrorWithDescription:v21 failureReason:v23 recoverySuggestion:v25 errorCode:-1001];
    }
    else
    {
      v27 = +[NSBundle mainBundle];
      objc_super v21 = [v27 localizedStringForKey:@"The input drawing is invalid" value:&stru_1000257A0 table:0];

      v28 = +[NSBundle mainBundle];
      v23 = [v28 localizedStringForKey:@"Remote recognition cannot handle empty input drawings" value:&stru_1000257A0 table:0];

      v29 = +[NSBundle mainBundle];
      v25 = [v29 localizedStringForKey:@"Submit valid drawings with one or more strokes for recognition" value:&stru_1000257A0 table:0];

      uint64_t v26 = [(id)objc_opt_class() invalidInputErrorWithDescription:v21 failureReason:v23 recoverySuggestion:v25 errorCode:-1001];
    }
  }
  else
  {
    v20 = +[NSBundle mainBundle];
    objc_super v21 = [v20 localizedStringForKey:@"The recognition request is invalid" value:&stru_1000257A0 table:0];

    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"Remote recognition cannot process an empty recognition request" value:&stru_1000257A0 table:0];

    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"Submit a new valid recognition request" value:&stru_1000257A0 table:0];

    uint64_t v26 = [(id)objc_opt_class() invalidInputErrorWithDescription:v21 failureReason:v23 recoverySuggestion:v25 errorCode:-1002];
  }
  id v18 = (void *)v26;

  BOOL v19 = 0;
  if (a5) {
LABEL_14:
  }
    *a5 = v18;
LABEL_15:

  return v19;
}

- (id)_buildMultiLingualResultForRequest:(id)a3 recognitionLocales:(id)a4 recognizersByLocale:(id)a5 statisticsByLocale:(id)a6
{
  id v9 = a3;
  id v78 = a4;
  id v88 = a5;
  id v87 = a6;
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v10 = (id)qword_10002B150;
  os_signpost_id_t spid = os_signpost_id_generate(v10);

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v11 = (id)qword_10002B150;
  id v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHRemoteRecognitionServerComputeMultilocaleResult", "", buf, 2u);
  }

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v13 = (id)qword_10002B118;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerComputeMultilocaleResult\"", buf, 2u);
  }

  v89 = v9;
  v81 = +[NSMutableArray array];
  lexiconManager = self->_lexiconManager;
  id v15 = [v9 customLexiconEntries];
  id v84 = [(CHInputContextLexiconManager *)lexiconManager transientLexiconWithCustomEntries:v15];

  v80 = +[NSMutableArray array];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v78;
  id v16 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v16)
  {
    v82 = 0;
    char v17 = 1;
    uint64_t v85 = *(void *)v102;
    id v86 = v16;
    while (1)
    {
      if (*(void *)v102 != v85) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = **((void **)&v101 + 1);
      BOOL v19 = [v88 objectForKeyedSubscript:**((void **)&v101 + 1)];
      v20 = [v87 objectForKeyedSubscript:v18];
      if (v17)
      {
        uint64_t v21 = [v19 recognitionEngineCachingKey];

        v82 = (void *)v21;
      }
      unsigned __int8 v22 = +[CHRecognizerConfiguration isSupportedLatinScriptLocale:withMode:](CHRecognizerConfiguration, "isSupportedLatinScriptLocale:withMode:", v18, [v9 recognitionMode]);
      id v9 = v89;
      if (v17 & 1 | ((v22 & 1) == 0)) {
        goto LABEL_104;
      }
      recognizerInferenceCache = self->_recognizerInferenceCache;
      v24 = [v89 drawing];
      v25 = [(CHRecognizerInferenceCache *)recognizerInferenceCache retrieveActivationMatrixForDrawing:v24 recognitionEngineCachingKey:v82 outStrokeIndexMapping:0 outStrokeEndings:0];

      LOBYTE(recognizerInferenceCache) = [v25 unlikelyHasLatinContents];
      if ((recognizerInferenceCache & 1) == 0)
      {
LABEL_104:
        id v26 = [(CHInputContextLexiconManager *)self->_lexiconManager transientPhraseLexicon];
        id v27 = [(CHInputContextLexiconManager *)self->_lexiconManager vocabulary];
        v28 = [(CHInputContextLexiconManager *)self->_lexiconManager textReplacements];
        v29 = [(CHInputContextLexiconManager *)self->_lexiconManager addressBookLexicon];
        +[CHCachedRecognizerManager configureRecognizer:v19 forRequest:v89 locale:v18 transientLexicon:v84 transientPhraseLexicon:v26 vocabulary:v27 textReplacements:v28 addressBookLexicon:v29];

        id v9 = v89;
        v30 = [v89 recognizerConfigurationKeyWithLocale:v18];
        v31 = [(CHRemoteRecognitionRequestHandler *)self _computeTextRecognitionResultsForRequest:v89 recognizer:v19 recognizerCachingKey:v30 isTopLocale:v17 & 1 writingStatistics:v20];

        v32 = +[CHTokenizedTextResult resultRestoringRawPathInResult:v31];

        v33 = v32;
        if (v32)
        {
          [v81 addObject:v32];
          [v80 addObject:v18];
        }
        unsigned __int8 v34 = [v32 isMinimalDrawingResult];

        if (v34) {
          break;
        }
      }

      if ((unint64_t)v86 >= 2)
      {
        uint64_t v35 = 1;
        do
        {
          if (*(void *)v102 != v85) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = *(void *)(*((void *)&v101 + 1) + 8 * v35);
          BOOL v19 = [v88 objectForKeyedSubscript:v36];
          v20 = [v87 objectForKeyedSubscript:v36];
          unsigned __int8 v37 = +[CHRecognizerConfiguration isSupportedLatinScriptLocale:withMode:](CHRecognizerConfiguration, "isSupportedLatinScriptLocale:withMode:", v36, [v9 recognitionMode]);
          id v9 = v89;
          if ((v37 & 1) == 0) {
            goto LABEL_105;
          }
          v38 = self->_recognizerInferenceCache;
          v39 = [v89 drawing];
          v40 = [(CHRecognizerInferenceCache *)v38 retrieveActivationMatrixForDrawing:v39 recognitionEngineCachingKey:v82 outStrokeIndexMapping:0 outStrokeEndings:0];

          LOBYTE(v38) = [v40 unlikelyHasLatinContents];
          if ((v38 & 1) == 0)
          {
LABEL_105:
            id v41 = [(CHInputContextLexiconManager *)self->_lexiconManager transientPhraseLexicon];
            id v42 = [(CHInputContextLexiconManager *)self->_lexiconManager vocabulary];
            v43 = [(CHInputContextLexiconManager *)self->_lexiconManager textReplacements];
            v44 = [(CHInputContextLexiconManager *)self->_lexiconManager addressBookLexicon];
            +[CHCachedRecognizerManager configureRecognizer:v19 forRequest:v89 locale:v36 transientLexicon:v84 transientPhraseLexicon:v41 vocabulary:v42 textReplacements:v43 addressBookLexicon:v44];

            id v9 = v89;
            v45 = [v89 recognizerConfigurationKeyWithLocale:v36];
            v46 = [(CHRemoteRecognitionRequestHandler *)self _computeTextRecognitionResultsForRequest:v89 recognizer:v19 recognizerCachingKey:v45 isTopLocale:0 writingStatistics:v20];

            v47 = +[CHTokenizedTextResult resultRestoringRawPathInResult:v46];

            v48 = v47;
            if (v47)
            {
              [v81 addObject:v47];
              [v80 addObject:v36];
            }
            unsigned __int8 v49 = [v47 isMinimalDrawingResult];

            if (v49) {
              goto LABEL_35;
            }
          }
        }
        while (v86 != (id)++v35);
      }
      char v17 = 0;
      int v50 = 0;
      id v86 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
      if (!v86) {
        goto LABEL_37;
      }
    }
LABEL_35:

    int v50 = 1;
  }
  else
  {
    int v50 = 0;
    v82 = 0;
  }
LABEL_37:

  if (![v81 count] || !objc_msgSend(v80, "count"))
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v55 = (id)qword_10002B118;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
    {
      id v56 = [v81 count];
      *(_DWORD *)buf = 138412802;
      id v106 = obj;
      __int16 v107 = 2112;
      v108 = v80;
      __int16 v109 = 2048;
      id v110 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "Unexpected empty array with original Recognition Locales = %@, recognitionLocalesWithResults = %@, resultsByLocaleCount = %ld", buf, 0x20u);
    }
    v54 = 0;
    goto LABEL_94;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v51 = (id)qword_10002B150;
  v52 = v51;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, spid, "CHRemoteRecognitionServerComputeMultilocaleResult", "", buf, 2u);
  }

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v53 = (id)qword_10002B118;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerComputeMultilocaleResult\"", buf, 2u);
  }

  if (v50)
  {
    v54 = [v81 firstObject];
    goto LABEL_95;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v57 = (id)qword_10002B150;
  os_signpost_id_t v58 = os_signpost_id_generate(v57);

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v59 = (id)qword_10002B150;
  v60 = v59;
  unint64_t v61 = v58 - 1;
  if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "CHRemoteRecognitionServerPostprocessingBlock", "", buf, 2u);
  }

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v62 = (id)qword_10002B118;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerPostprocessingBlock\"", buf, 2u);
  }

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10000C934;
  v96[3] = &unk_100024B80;
  v63 = v88;
  v97 = v63;
  id v64 = v9;
  id v98 = v64;
  v99 = self;
  id v100 = v84;
  v65 = objc_retainBlock(v96);
  if (qword_10002B188 == -1)
  {
    v66 = (id)qword_10002B150;
    if (v61 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_70;
    }
  }
  else
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v66 = (id)qword_10002B150;
    if (v61 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_70;
    }
  }
  if (os_signpost_enabled(v66))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, v58, "CHRemoteRecognitionServerPostprocessingBlock", "", buf, 2u);
  }
LABEL_70:

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v67 = (id)qword_10002B118;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerPostprocessingBlock\"", buf, 2u);
  }

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10000CB40;
  v91[3] = &unk_100024B80;
  v92 = v63;
  id v93 = v64;
  v94 = self;
  id v95 = v84;
  v68 = objc_retainBlock(v91);
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v69 = (id)qword_10002B150;
  os_signpost_id_t v70 = os_signpost_id_generate(v69);

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v71 = (id)qword_10002B150;
  v72 = v71;
  unint64_t v73 = v70 - 1;
  if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_BEGIN, v70, "CHRemoteRecognitionServerMergingBlock", "", buf, 2u);
  }

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v74 = (id)qword_10002B118;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerMergingBlock\"", buf, 2u);
  }

  v54 = +[CHMultiLocaleResultProcessor combineMultiLocaleResults:v81 locales:v80 topLocaleIndex:0 mergedResultPostprocessingBlock:v65 changeableColumnCountBlock:v68];
  if (qword_10002B188 == -1)
  {
    v75 = (id)qword_10002B150;
    if (v73 <= 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_87;
    }
  }
  else
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v75 = (id)qword_10002B150;
    if (v73 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_87:
      if (os_signpost_enabled(v75))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v75, OS_SIGNPOST_INTERVAL_END, v70, "CHRemoteRecognitionServerMergingBlock", "", buf, 2u);
      }
    }
  }

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v76 = (id)qword_10002B118;
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerMergingBlock\"", buf, 2u);
  }

  v55 = v97;
LABEL_94:

LABEL_95:

  return v54;
}

- (void)_handleValidRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!self->_lexiconManager)
    {
      id v8 = (CHInputContextLexiconManager *)objc_alloc_init((Class)CHInputContextLexiconManager);
      lexiconManager = self->_lexiconManager;
      self->_lexiconManager = v8;
    }
    [(CHRemoteRecognitionRequestHandler *)self _handleValidRecognitionTextRequest:v6 withReply:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CHRemoteRecognitionRequestHandler *)self _handleValidRecognitionMathRequest:v6 withReply:v7];
    }
    else
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      id v10 = (id)qword_10002B118;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Invalid recognition request class", v11, 2u);
      }
    }
  }
}

- (void)_handleValidRecognitionTextRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  id obj = objc_alloc_init((Class)NSArray);
  unsigned __int8 v34 = +[NSMutableDictionary dictionary];
  id v7 = +[NSMutableDictionary dictionary];
  if (self->_scriptClassifier && [v6 recognitionMode] == 4)
  {
    scriptClassifier = self->_scriptClassifier;
    id v9 = [v6 drawing];
    id v10 = [(CHStrokeClassificationModel *)scriptClassifier predictedScriptsForDrawing:v9 maxNumberOfLocales:1];

    v11 = objc_opt_class();
    id v12 = [v6 locales];
    id v13 = [v11 localesForScriptClassification:v12 selectedScriptCodepoints:v10];

    if ([v13 count]) {
      goto LABEL_7;
    }
    id v14 = objc_opt_class();
    id v15 = [v6 locales];
    uint64_t v16 = [v14 effectiveRecognitionLocales:v15 recognitionMode:[v6 recognitionMode]];

    id v13 = (void *)v16;
  }
  else
  {
    char v17 = objc_opt_class();
    id v10 = [v6 locales];
    id v13 = [v17 effectiveRecognitionLocales:v10 recognitionMode:[v6 recognitionMode]];
    id v15 = obj;
  }

LABEL_7:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obja = v13;
  id v18 = [obja countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v43;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(obja);
        }
        uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        unsigned __int8 v22 = [(CHCachedRecognizerManager *)self->_recognizerManager checkOutRecognizerForTextRequest:v6 locale:v21];
        [v34 setObject:v22 forKeyedSubscript:v21];
        v23 = [(CHCachedRecognizerManager *)self->_recognizerManager writingStatsForRequest:v6 locale:v21];
        [v7 setObject:v23 forKeyedSubscript:v21];
      }
      id v18 = [obja countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v18);
  }

  [(CHRemoteBasicRequestHandler *)self setDirty];
  ++self->_openRequestCount;
  v24 = [(CHRemoteRecognitionRequestHandler *)self _queueForRequest:v6];
  if (!v24)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v25 = (id)qword_10002B118;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D39C;
  block[3] = &unk_100024BA8;
  block[4] = self;
  id v36 = v6;
  id v37 = obja;
  id v38 = v34;
  id v39 = v7;
  id v40 = v31;
  id v26 = v31;
  id v27 = v7;
  id v28 = v34;
  id v29 = obja;
  id v30 = v6;
  dispatch_async(v24, block);
}

- (void)_handleValidRecognitionMathRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CHCachedRecognizerManager *)self->_recognizerManager checkOutRecognizerForMathRequest:v6];
  [(CHRemoteBasicRequestHandler *)self setDirty];
  ++self->_openRequestCount;
  id v9 = [(CHRemoteRecognitionRequestHandler *)self _queueForRequest:v6];
  if (!v9)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v10 = (id)qword_10002B118;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D898;
  v14[3] = &unk_100024BD0;
  id v15 = v8;
  id v16 = v6;
  char v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  dispatch_async(v9, v14);
}

- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRangeToKeep:(_NSRange *)a5 strokesToRecognize:(id *)a6
{
  id v31 = a6;
  id v9 = a3;
  id v33 = a4;
  id v10 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, [v9 strokeCount]);
  long long v34 = xmmword_10001AC40;
  id v11 = [(CHRecognizerResultCache *)self->_recognizerResultsCache retrievePartialResultsForDrawing:v9 recognitionEngineCachingKey:v33 matchingColumnRange:&v34];
  int64_t v12 = *((void *)&v34 + 1);
  if (v12 <= (uint64_t)[v11 tokenColumnCount])
  {
    id v13 = [v11 strokeIndexes];
    id v14 = [v13 count];
    id v15 = [v9 strokeCount];

    if (v14 < v15)
    {
      uint64_t v16 = (uint64_t)fmin((double)(uint64_t)[v11 tokenColumnCount], 2.0);
      if (v16 < 1)
      {
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 1;
        while (1)
        {
          v20 = [v11 tokenColumns:v31];
          uint64_t v21 = [v20 objectAtIndexedSubscript:(char *)[v11 tokenColumnCount] - v19];

          unsigned __int8 v22 = [v21 strokeIndexes];
          v17 += (uint64_t)[v22 count];

          if (v17 >= 21) {
            break;
          }
          ++v18;
          ++v19;
          if (v18 == v16)
          {
            uint64_t v18 = v16;
            break;
          }
        }
      }
      int64_t v12 = (uint64_t)fmax((double)(*((void *)&v34 + 1) - v18), 0.0);
    }
  }
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      v24 = [v11 tokenColumns:v31];
      v25 = [v24 objectAtIndexedSubscript:i];
      id v26 = [v25 strokeIndexes];
      [v10 removeIndexes:v26];
    }
  }
  if (objc_msgSend(v10, "count", v31))
  {
    id v27 = [v10 count];
    id v28 = [v10 lastIndex];
    if (v27 != (id)(v28 - (unsigned char *)[v10 firstIndex] + 1))
    {
      uint64_t v29 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, [v9 strokeCount]);

      id v11 = 0;
      id v10 = (void *)v29;
    }
  }
  if (v32) {
    void *v32 = v10;
  }
  if (a5)
  {
    a5->location = 0;
    a5->length = v12;
  }

  return v11;
}

- (id)_computeTextRecognitionResultsForRequest:(id)a3 recognizer:(id)a4 recognizerCachingKey:(id)a5 isTopLocale:(BOOL)a6 writingStatistics:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v33 = a4;
  id v34 = a5;
  id v32 = a7;
  int64_t v12 = [v11 drawing];
  id v13 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, [v12 strokeCount]);

  long long v37 = xmmword_10001AC40;
  id v14 = [v11 drawing];
  if ([v11 enableStrokeReordering])
  {
    id v36 = 0;
    uint64_t v15 = [v14 sortedDrawingUsingStrokeMidPoint:&v36];
    id v16 = v36;

    id v14 = (void *)v15;
  }
  else
  {
    id v16 = 0;
  }
  if ([v11 enableCachingIfAvailable])
  {
    id v35 = v13;
    uint64_t v17 = [(CHRemoteRecognitionRequestHandler *)self retrievePartialResultsForDrawing:v14 recognitionEngineCachingKey:v34 matchingColumnRangeToKeep:&v37 strokesToRecognize:&v35];
    id v18 = v35;

    if ([v18 firstIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = (uint64_t)[v18 firstIndex];
    }
    v20 = (void *)v17;
    id v13 = v18;
  }
  else
  {
    v20 = 0;
    uint64_t v19 = 0;
  }
  if ([v13 count])
  {
    id v30 = [v14 drawingWithStrokesFromIndexSet:v13];
    uint64_t v21 = [(CHRemoteRecognitionRequestHandler *)self generateRecognitionOptionsFromRequest:v11 isTopLocale:v8 cachedPrefixResult:v20 cachedPrefixColumnRangeToKeep:v37];
    unsigned __int8 v22 = [v33 textRecognitionResultForDrawing:v30 options:v21 writingStatistics:v32 shouldCancel:0];
    id v23 = [v22 mutableCopy];

    if (v19 >= 1) {
      [v23 offsetAllStrokeIndexesBy:v19];
    }
    if ([v11 enableCachingIfAvailable]) {
      [v23 adjustColumns];
    }
    if (v20)
    {
      v24 = [v20 tokenColumns];
      v25 = [v24 subarrayWithRange:v37];

      id v26 = [v20 transcriptionPaths];
      id v27 = [v26 objectAtIndexedSubscript:0];
      [v23 prependTokenColumns:v25 prefixTopPath:v27];

      id v28 = (char *)[v23 tokenColumnCount];
      [v23 setChangeableTokenColumnCount:&v28[-*((void *)&v37 + 1)]];
    }
  }
  else
  {
    id v23 = [v20 subResultWithColumnRange:v37];
  }
  if ([v11 enableCachingIfAvailable]) {
    [(CHRecognizerResultCache *)self->_recognizerResultsCache cacheTextResult:v23 drawing:v14 recognitionEngineCachingKey:v34];
  }
  if (v16) {
    [v23 remapAllStrokeIndexesWithArray:v16];
  }

  return v23;
}

- (id)generateRecognitionOptionsFromRequest:(id)a3 isTopLocale:(BOOL)a4 cachedPrefixResult:(id)a5 cachedPrefixColumnRangeToKeep:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v8 = a4;
  id v11 = a5;
  int64_t v12 = [a3 options];
  id v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

  [v13 setObject:self->_recognizerInferenceCache forKeyedSubscript:CHRecognitionOptionInferenceCache];
  id v14 = +[NSNumber numberWithBool:!v8];
  [v13 setObject:v14 forKeyedSubscript:CHRecognitionOptionIsRunningSecondaryLocale];

  if (v11 && length)
  {
    uint64_t v15 = [v13 objectForKeyedSubscript:CHRecognitionOptionTextBefore];
    if (v15)
    {
      id v16 = [v13 objectForKeyedSubscript:CHRecognitionOptionTextBefore];
    }
    else
    {
      id v16 = &stru_1000257A0;
    }

    uint64_t v17 = [v11 transcriptionPaths];
    id v18 = [v17 objectAtIndexedSubscript:0];
    uint64_t v19 = [v11 transcriptionWithPath:v18 columnRange:location length:length filterLowConfidence:0];

    v20 = [v11 precedingSeparatorForTopTranscriptionPath];
    uint64_t v21 = [(__CFString *)v16 stringByAppendingFormat:@"%@%@", v20, v19];
    [v13 setObject:v21 forKeyedSubscript:CHRecognitionOptionTextBefore];
  }
  unsigned __int8 v22 = [v13 allKeys];
  unsigned __int8 v23 = [v22 containsObject:CHRecognitionOptionPrecedingSpaceBehavior];

  if ((v23 & 1) == 0) {
    [v13 setObject:&off_100025ED0 forKeyedSubscript:CHRecognitionOptionPrecedingSpaceBehavior];
  }

  return v13;
}

- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5 bundleIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CHRemoteRecognitionRequestHandler *)self _queueForRequest:v11];
  if (!v14)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v15 = (id)qword_10002B118;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "A valid queue is required for building transcription paths", buf, 2u);
    }
  }
  id v16 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000E9FC;
  v22[3] = &unk_100024BA8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v13;
  id v25 = v14;
  id v26 = v10;
  id v27 = v12;
  id v17 = v12;
  id v18 = v10;
  id v19 = v14;
  id v20 = v13;
  id v21 = v11;
  dispatch_sync(v16, v22);
}

- (void)handleSketchRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F030;
  void v15[3] = &unk_100024BD0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

- (void)_handleValidSketchRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CHCachedRecognizerManager *)self->_recognizerManager checkOutRecognizerForSketchRequest:v6];
  [(CHRemoteBasicRequestHandler *)self setDirty];
  id v9 = [(CHRemoteRecognitionRequestHandler *)self _queueForRequest:v6];
  if (!v9)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v10 = (id)qword_10002B118;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000F288;
  v14[3] = &unk_100024BD0;
  id v15 = v8;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  dispatch_async(v9, v14);
}

- (void)optimizeResourceUsage
{
  v3 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F690;
  block[3] = &unk_100024B10;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerResultsCache, 0);
  objc_storeStrong((id *)&self->_recognizerInferenceCache, 0);
  objc_storeStrong((id *)&self->_scriptClassifier, 0);
  objc_storeStrong((id *)&self->_lexiconManager, 0);

  objc_storeStrong((id *)&self->_recognizerManager, 0);
}

@end
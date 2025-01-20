@interface PGSurveyQuestionFactory
- (BOOL)ignoreExistingQuestions;
- (BOOL)questionAlreadyExists:(id)a3;
- (BOOL)shouldAddQuestion:(id)a3 toAlreadyGeneratedQuestions:(id)a4;
- (CLSCurationSession)curationSession;
- (NSArray)collidingQuestionTypes;
- (NSDictionary)existingQuestionsByEntityIdentifier;
- (PGManagerWorkingContext)workingContext;
- (PGSurveyQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4;
- (id)_assetFromAssets:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5;
- (id)_questionsByEntityIdentifierFromQuestions:(id)a3;
- (id)assetFromMomentNode:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5 curationContext:(id)a6;
- (id)assetsFromMomentNode:(id)a3 curationContext:(id)a4;
- (id)curatedAssetsFromMomentNode:(id)a3 curationContext:(id)a4;
- (id)existingQuestionsForEntityIdentifier:(id)a3;
- (id)fetchExistingQuestions;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (id)representativeAssetsFromMomentNode:(id)a3 curationContext:(id)a4;
- (int64_t)questionOptions;
- (signed)questionVersion;
- (unsigned)questionType;
- (void)setCurationSession:(id)a3;
- (void)setExistingQuestionsByEntityIdentifier:(id)a3;
- (void)setIgnoreExistingQuestions:(BOOL)a3;
@end

@implementation PGSurveyQuestionFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_existingQuestionsByEntityIdentifier, 0);
}

- (void)setCurationSession:(id)a3
{
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (void)setIgnoreExistingQuestions:(BOOL)a3
{
  self->_ignoreExistingQuestions = a3;
}

- (BOOL)ignoreExistingQuestions
{
  return self->_ignoreExistingQuestions;
}

- (signed)questionVersion
{
  return self->_questionVersion;
}

- (PGManagerWorkingContext)workingContext
{
  return (PGManagerWorkingContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExistingQuestionsByEntityIdentifier:(id)a3
{
}

- (id)representativeAssetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA80] set];
  v9 = v8;
  if (v6)
  {
    v10 = [v6 addressEdges];
    if ([v10 count])
    {
      v47 = v9;
      id v44 = v7;
      id v45 = v6;
      v49 = [(PGSurveyQuestionFactory *)self assetsFromMomentNode:v6 curationContext:v7];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v43 = v10;
      obuint64_t j = v10;
      uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v50)
      {
        uint64_t v48 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v58 != v48) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            uint64_t v55 = 0;
            uint64_t v56 = 0;
            v13 = [v12 photoLocation];
            [v13 coordinate];
            uint64_t v55 = v14;
            uint64_t v56 = v15;

            v16 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v17 = [v12 universalStartDate];
            if (v17
              && (v18 = (void *)v17,
                  [v12 universalEndDate],
                  v19 = objc_claimAutoreleasedReturnValue(),
                  v19,
                  v18,
                  v19))
            {
              id v20 = objc_alloc(MEMORY[0x1E4F28C18]);
              v21 = [v12 universalStartDate];
              v22 = [v12 universalEndDate];
              v23 = (void *)[v20 initWithStartDate:v21 endDate:v22];
            }
            else
            {
              v24 = +[PGLogging sharedLogging];
              v21 = [v24 loggingConnection];

              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v37 = [v12 universalStartDate];
                v38 = [v12 universalEndDate];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v37;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v38;
                _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGSurveyQuestionFactory] AddressEdge has invalid date. StartDate:%@, EndDate: %@", buf, 0x16u);
              }
              v23 = 0;
            }

            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v25 = v49;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v61 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v52;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v52 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                  v31 = [v30 creationDate];
                  if (v23)
                  {
                    if ([v23 containsDate:v31])
                    {
                      *(void *)buf = 0;
                      *(void *)&buf[8] = 0;
                      v32 = [v30 location];
                      [v32 coordinate];
                      *(void *)buf = v33;
                      *(void *)&buf[8] = v34;

                      CLLocationCoordinate2DGetDistanceFrom();
                      if (v35 < 150.0) {
                        [v16 addObject:v30];
                      }
                    }
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v61 count:16];
              }
              while (v27);
            }

            if ([v16 count])
            {
              v36 = objc_msgSend(v16, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v16, "count")));
              [v47 addObject:v36];
            }
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v50);
      }

      v9 = v47;
      id v39 = v47;

      id v7 = v44;
      id v6 = v45;
      v10 = v43;
    }
    else
    {
      id v41 = v9;
    }
  }
  else
  {
    id v40 = v8;
  }

  return v9;
}

- (id)_assetFromAssets:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  CLLocationCoordinate2D v36 = a4;
  id v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = a3;
  v8 = [v6 sortDescriptorWithKey:@"creationDate" ascending:1];
  v38[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v38[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v11 = [v7 sortedArrayUsingDescriptors:v10];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    v16 = 0;
    double v17 = *MEMORY[0x1E4F1E568];
    uint64_t v18 = *(void *)v33;
    double v19 = *MEMORY[0x1E4F1E568];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v12);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_msgSend(v21, "locationCoordinate", 0, 0, (void)v32);
        CLLocationCoordinate2D v31 = v39;
        if (CLLocationCoordinate2DIsValid(v39))
        {
          CLLocationCoordinate2DGetDistanceFrom();
          double v23 = v22;
          if ((v22 <= a5 || a5 == 0.0) && v22 < v17)
          {
            id v26 = v21;

            uint64_t v15 = v26;
            double v17 = v23;
          }
          if (v23 < v19)
          {
            id v27 = v21;

            v16 = v27;
            double v19 = v23;
          }
        }
      }
      uint64_t v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16, *(void *)&v31.latitude, *(void *)&v31.longitude);
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
    v16 = 0;
  }

  if (v15) {
    uint64_t v28 = v15;
  }
  else {
    uint64_t v28 = v16;
  }
  id v29 = v28;

  return v29;
}

- (id)assetFromMomentNode:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5 curationContext:(id)a6
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v11 = a3;
  if (!v11)
  {
    id v19 = 0;
    goto LABEL_14;
  }
  id v12 = [(PGSurveyQuestionFactory *)self curatedAssetsFromMomentNode:v11 curationContext:a6];
  uint64_t v13 = -[PGSurveyQuestionFactory _assetFromAssets:closestToLocationCoordinate:radius:](self, "_assetFromAssets:closestToLocationCoordinate:radius:", v12, latitude, longitude, a5);
  uint64_t v14 = v13;
  if (!v13)
  {
    double v18 = 1.79769313e308;
LABEL_8:
    id v20 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    v21 = [v11 fetchAssetCollectionInPhotoLibrary:v20];

    double v22 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    double v23 = [v22 librarySpecificFetchOptions];

    v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v21 options:v23];
    id v25 = [v24 fetchedObjects];
    id v26 = -[PGSurveyQuestionFactory _assetFromAssets:closestToLocationCoordinate:radius:](self, "_assetFromAssets:closestToLocationCoordinate:radius:", v25, a4.latitude, a4.longitude, a5);

    if (v26 && ([v26 locationCoordinate], CLLocationCoordinate2DGetDistanceFrom(), v27 + 10.0 < v18)) {
      id v28 = v26;
    }
    else {
      id v28 = v14;
    }
    id v19 = v28;

    goto LABEL_13;
  }
  [v13 locationCoordinate];
  uint64_t v30 = v15;
  uint64_t v31 = v16;
  CLLocationCoordinate2DGetDistanceFrom();
  if (a5 != 0.0)
  {
    double v18 = v17;
    if (v17 > a5) {
      goto LABEL_8;
    }
  }
  id v19 = v14;
LABEL_13:

LABEL_14:
  return v19;
}

- (id)curatedAssetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  workingContext = self->_workingContext;
  id v7 = a4;
  id v8 = a3;
  v9 = [(PGManagerWorkingContext *)workingContext photoLibrary];
  v10 = [v8 fetchAssetCollectionInPhotoLibrary:v9];

  id v11 = +[PGCurationOptions defaultOptions];
  id v12 = [(PGManagerWorkingContext *)self->_workingContext curationManager];
  uint64_t v13 = [v12 curatedAssetsForAssetCollection:v10 options:v11 curationContext:v7 progressBlock:0];

  return v13;
}

- (id)assetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  id v7 = [v5 fetchAssetCollectionInPhotoLibrary:v6];

  id v8 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v9 = [v8 librarySpecificFetchOptions];

  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v26[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v9 setSortDescriptors:v11];

  id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v9];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v19, "clsIsScreenshotOrScreenRecording", (void)v21) & 1) == 0) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v13;
}

- (id)_questionsByEntityIdentifierFromQuestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "entityIdentifier", (void)v14);
        id v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = [MEMORY[0x1E4F1CA48] array];
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSDictionary)existingQuestionsByEntityIdentifier
{
  existingQuestionsByEntityIdentifier = self->_existingQuestionsByEntityIdentifier;
  if (!existingQuestionsByEntityIdentifier)
  {
    v4 = [(PGSurveyQuestionFactory *)self fetchExistingQuestions];
    id v5 = [(PGSurveyQuestionFactory *)self _questionsByEntityIdentifierFromQuestions:v4];
    uint64_t v6 = self->_existingQuestionsByEntityIdentifier;
    self->_existingQuestionsByEntityIdentifier = v5;

    existingQuestionsByEntityIdentifier = self->_existingQuestionsByEntityIdentifier;
  }
  return existingQuestionsByEntityIdentifier;
}

- (id)fetchExistingQuestions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [(PGSurveyQuestionFactory *)self collidingQuestionTypes];
  uint64_t v7 = [v5 predicateWithFormat:@"type in %@", v6];
  [v4 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v4 validQuestionsOnly:0];
  int v9 = [v8 count];
  v10 = +[PGLogging sharedLogging];
  id v11 = [v10 loggingConnection];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 67109378;
    int v16 = v9;
    __int16 v17 = 2112;
    double v18 = v13;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "%d existing questions found for factory %@", buf, 0x12u);
  }
  return v8;
}

- (BOOL)shouldAddQuestion:(id)a3 toAlreadyGeneratedQuestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PGSurveyQuestionFactory *)self questionAlreadyExists:v6]) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [v7 containsObject:v6] ^ 1;
  }

  return v8;
}

- (id)existingQuestionsForEntityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PGSurveyQuestionFactory *)self existingQuestionsByEntityIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)questionAlreadyExists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PGSurveyQuestionFactory *)self ignoreExistingQuestions])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [v4 entityIdentifier];
    id v7 = [(PGSurveyQuestionFactory *)self existingQuestionsByEntityIdentifier];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v9 = v8;
      uint64_t v5 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(v4, "isEquivalentToPersistedQuestion:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
            {
              LOBYTE(v5) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v5 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  id v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  id v11 = NSStringFromSelector(a2);
  id v12 = [v8 stringWithFormat:@"%@ must implement %@", v10, v11];
  long long v13 = (void *)[v6 initWithName:v7 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (int64_t)questionOptions
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  uint64_t v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSArray)collidingQuestionTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PGSurveyQuestionFactory questionType](self, "questionType"));
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (unsigned)questionType
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  uint64_t v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (PGSurveyQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSurveyQuestionFactory;
  id v8 = [(PGSurveyQuestionFactory *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workingContext, a3);
    v9->_questionVersion = a4;
  }

  return v9;
}

@end
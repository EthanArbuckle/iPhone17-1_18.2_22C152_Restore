@interface PXUserDefaults
+ (PXUserDefaults)standardUserDefaults;
- (NSDate)lastSurveyQuestionsRadarPromptDate;
- (NSDate)surveyQuestionsHideDate;
- (NSNumber)allPhotosAspectFit;
- (NSNumber)allPhotosAspectFitInCompact;
- (NSNumber)allPhotosCaptionsVisible;
- (NSNumber)allPhotosColumns;
- (NSNumber)allPhotosLemonadePreferredIndividualItemsColumns;
- (NSNumber)axExposeAllVisibleElements;
- (NSNumber)curatedLibraryZoomLevel;
- (NSNumber)daysMarginScale;
- (NSNumber)didShowCompletedCurationFooterAnimation;
- (NSNumber)didShowCurationFooter;
- (NSNumber)includeScreenshots;
- (NSNumber)includeSharedWithYou;
- (NSNumber)infoPanelLastSnappedPosition;
- (NSNumber)lastRadarPromptAnsweredQuestionCount;
- (NSNumber)photosGridAspectFit;
- (NSNumber)photosGridAspectFitInCompact;
- (NSNumber)photosGridColumns;
- (NSNumber)photosGridPreferredIndividualItemsColumns;
- (NSString)infoPanelLastSnappedWidgetIdentifier;
- (PXUserDefaults)init;
- (PXUserDefaults)initWithDataSource:(id)a3;
- (PXUserDefaultsDataSource)dataSource;
- (PXZoomablePhotosUserDefaults)curatedLibraryUserDefaults;
- (PXZoomablePhotosUserDefaults)photosGridsUserDefaults;
- (void)setAllPhotosAspectFit:(id)a3;
- (void)setAllPhotosAspectFitInCompact:(id)a3;
- (void)setAllPhotosCaptionsVisible:(id)a3;
- (void)setAllPhotosColumns:(id)a3;
- (void)setAllPhotosLemonadePreferredIndividualItemsColumns:(id)a3;
- (void)setAxExposeAllVisibleElements:(id)a3;
- (void)setCuratedLibraryZoomLevel:(id)a3;
- (void)setDaysMarginScale:(id)a3;
- (void)setDidShowCompletedCurationFooterAnimation:(id)a3;
- (void)setDidShowCurationFooter:(id)a3;
- (void)setIncludeScreenshots:(id)a3;
- (void)setIncludeSharedWithYou:(id)a3;
- (void)setInfoPanelLastSnappedPosition:(id)a3;
- (void)setInfoPanelLastSnappedWidgetIdentifier:(id)a3;
- (void)setLastRadarPromptAnsweredQuestionCount:(id)a3;
- (void)setLastSurveyQuestionsRadarPromptDate:(id)a3;
- (void)setPhotosGridAspectFit:(id)a3;
- (void)setPhotosGridAspectFitInCompact:(id)a3;
- (void)setPhotosGridColumns:(id)a3;
- (void)setPhotosGridPreferredIndividualItemsColumns:(id)a3;
- (void)setSurveyQuestionsHideDate:(id)a3;
- (void)setallPhotosAspectFitInCompact:(id)a3;
@end

@implementation PXUserDefaults

- (NSNumber)includeScreenshots
{
  if (self->_includeScreenshots) {
    return self->_includeScreenshots;
  }
  else {
    return (NSNumber *)MEMORY[0x1E4F1CC38];
  }
}

- (NSNumber)includeSharedWithYou
{
  if (self->_includeSharedWithYou) {
    return self->_includeSharedWithYou;
  }
  else {
    return (NSNumber *)MEMORY[0x1E4F1CC38];
  }
}

- (NSNumber)axExposeAllVisibleElements
{
  return self->_axExposeAllVisibleElements;
}

- (NSNumber)allPhotosCaptionsVisible
{
  return self->_allPhotosCaptionsVisible;
}

- (void)setAllPhotosLemonadePreferredIndividualItemsColumns:(id)a3
{
  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosLemonadePreferredIndividualItemsColumns;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    v7 = (NSNumber *)[(NSNumber *)v9 copy];
    allPhotosLemonadePreferredIndividualItemsColumns = self->_allPhotosLemonadePreferredIndividualItemsColumns;
    self->_allPhotosLemonadePreferredIndividualItemsColumns = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_allPhotosLemonadePreferredIndividualItemsColumns forKey:@"allPhotosLemonadePreferredIndividualItemsColumns"];
  }

LABEL_5:
}

- (NSNumber)allPhotosLemonadePreferredIndividualItemsColumns
{
  return self->_allPhotosLemonadePreferredIndividualItemsColumns;
}

+ (PXUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_onceToken != -1) {
    dispatch_once(&standardUserDefaults_onceToken, &__block_literal_global_254042);
  }
  v2 = (void *)standardUserDefaults_standardUserDefaults;
  return (PXUserDefaults *)v2;
}

- (NSNumber)allPhotosAspectFit
{
  return self->_allPhotosAspectFit;
}

- (PXZoomablePhotosUserDefaults)curatedLibraryUserDefaults
{
  v2 = [(_PXZoomablePhotosUserDefaultsImp *)[_PXZoomablePhotosUserDefaultsCuratedLibrary alloc] initWithUserDefaults:self];
  return (PXZoomablePhotosUserDefaults *)v2;
}

- (NSNumber)daysMarginScale
{
  return self->_daysMarginScale;
}

void __38__PXUserDefaults_standardUserDefaults__block_invoke()
{
  uint64_t v0 = +[PXUserDefaultsStandardDataSource sharedInstance];
  v1 = (void *)standardUserDefaults_dataSource;
  standardUserDefaults_dataSource = v0;

  v2 = [PXUserDefaults alloc];
  uint64_t v3 = [(PXUserDefaults *)v2 initWithDataSource:standardUserDefaults_dataSource];
  v4 = (void *)standardUserDefaults_standardUserDefaults;
  standardUserDefaults_standardUserDefaults = v3;
}

- (PXUserDefaults)initWithDataSource:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PXUserDefaults;
  v5 = [(PXUserDefaults *)&v50 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = [v4 persistedValueForKey:@"curatedLibraryInitialNavigationVersion"];
    uint64_t v8 = [v7 integerValue];

    if (v8 != 2)
    {
      v9 = [NSNumber numberWithInteger:2];
      [v4 setPersistedValue:v9 forKey:@"curatedLibraryInitialNavigationVersion"];

      [v4 setPersistedValue:0 forKey:@"curatedLibraryZoomLevel"];
      [v4 setPersistedValue:0 forKey:@"daysMarginScale"];
      [v4 setPersistedValue:0 forKey:@"allPhotosColumns"];
      [v4 setPersistedValue:0 forKey:@"allPhotosColumnsDate"];
      [v4 setPersistedValue:0 forKey:@"allPhotosLemonadePreferredIndividualItemsColumns"];
      [v4 setPersistedValue:0 forKey:@"allPhotosGridAspectFitInCompact"];
    }
    v10 = [v4 persistedValueForKey:@"userDefaultsPhotosGridVersion"];
    uint64_t v11 = [v10 integerValue];

    if (v11 != 3)
    {
      v12 = [NSNumber numberWithInteger:3];
      [v4 setPersistedValue:v12 forKey:@"userDefaultsPhotosGridVersion"];

      [v4 setPersistedValue:0 forKey:@"allPhotosAspectFit"];
      [v4 setPersistedValue:0 forKey:@"photosGridColumns"];
      [v4 setPersistedValue:0 forKey:@"photosGridPreferredIndividualItemsColumns"];
      [v4 setPersistedValue:0 forKey:@"photosGridAspectFit"];
      [v4 setPersistedValue:0 forKey:@"photosGridAspectFitInCompact"];
    }
    uint64_t v13 = [v4 persistedValueForKey:@"curatedLibraryZoomLevel"];
    curatedLibraryZoomLevel = v6->_curatedLibraryZoomLevel;
    v6->_curatedLibraryZoomLevel = (NSNumber *)v13;

    uint64_t v15 = [v4 persistedValueForKey:@"daysMarginScale"];
    daysMarginScale = v6->_daysMarginScale;
    v6->_daysMarginScale = (NSNumber *)v15;

    uint64_t v17 = [v4 persistedValueForKey:@"allPhotosColumns"];
    allPhotosColumns = v6->_allPhotosColumns;
    v6->_allPhotosColumns = (NSNumber *)v17;

    uint64_t v19 = [v4 persistedValueForKey:@"allPhotosLemonadePreferredIndividualItemsColumns"];
    allPhotosLemonadePreferredIndividualItemsColumns = v6->_allPhotosLemonadePreferredIndividualItemsColumns;
    v6->_allPhotosLemonadePreferredIndividualItemsColumns = (NSNumber *)v19;

    uint64_t v21 = [v4 persistedValueForKey:@"allPhotosAspectFit"];
    allPhotosAspectFit = v6->_allPhotosAspectFit;
    v6->_allPhotosAspectFit = (NSNumber *)v21;

    uint64_t v23 = [v4 persistedValueForKey:@"allPhotosAspectFitInCompact"];
    allPhotosAspectFitInCompact = v6->_allPhotosAspectFitInCompact;
    v6->_allPhotosAspectFitInCompact = (NSNumber *)v23;

    uint64_t v25 = [v4 persistedValueForKey:@"photosGridColumns"];
    photosGridColumns = v6->_photosGridColumns;
    v6->_photosGridColumns = (NSNumber *)v25;

    uint64_t v27 = [v4 persistedValueForKey:@"photosGridPreferredIndividualItemsColumns"];
    photosGridPreferredIndividualItemsColumns = v6->_photosGridPreferredIndividualItemsColumns;
    v6->_photosGridPreferredIndividualItemsColumns = (NSNumber *)v27;

    uint64_t v29 = [v4 persistedValueForKey:@"photosGridAspectFit"];
    photosGridAspectFit = v6->_photosGridAspectFit;
    v6->_photosGridAspectFit = (NSNumber *)v29;

    uint64_t v31 = [v4 persistedValueForKey:@"photosGridAspectFitInCompact"];
    photosGridAspectFitInCompact = v6->_photosGridAspectFitInCompact;
    v6->_photosGridAspectFitInCompact = (NSNumber *)v31;

    uint64_t v33 = [v4 persistedValueForKey:@"didShowCurationFooter"];
    didShowCurationFooter = v6->_didShowCurationFooter;
    v6->_didShowCurationFooter = (NSNumber *)v33;

    uint64_t v35 = [v4 persistedValueForKey:@"didShowCompletedCurationFooterAnimation"];
    didShowCompletedCurationFooterAnimation = v6->_didShowCompletedCurationFooterAnimation;
    v6->_didShowCompletedCurationFooterAnimation = (NSNumber *)v35;

    uint64_t v37 = [v4 persistedValueForKey:@"IncludeScreenshots"];
    includeScreenshots = v6->_includeScreenshots;
    v6->_includeScreenshots = (NSNumber *)v37;

    uint64_t v39 = [v4 persistedValueForKey:@"IncludeSharedWithYou"];
    includeSharedWithYou = v6->_includeSharedWithYou;
    v6->_includeSharedWithYou = (NSNumber *)v39;

    uint64_t v41 = [v4 persistedValueForKey:@"lastRadarPromptAnsweredQuestionCount"];
    lastRadarPromptAnsweredQuestionCount = v6->_lastRadarPromptAnsweredQuestionCount;
    v6->_lastRadarPromptAnsweredQuestionCount = (NSNumber *)v41;

    uint64_t v43 = [v4 persistedValueForKey:@"lastSurveyQuestionsRadarPromptDate"];
    lastSurveyQuestionsRadarPromptDate = v6->_lastSurveyQuestionsRadarPromptDate;
    v6->_lastSurveyQuestionsRadarPromptDate = (NSDate *)v43;

    uint64_t v45 = [v4 persistedValueForKey:@"surveyQuestionsHideDate"];
    surveyQuestionsHideDate = v6->_surveyQuestionsHideDate;
    v6->_surveyQuestionsHideDate = (NSDate *)v45;

    uint64_t v47 = [v4 persistedValueForKey:@"axExposeAllVisibleElements"];
    axExposeAllVisibleElements = v6->_axExposeAllVisibleElements;
    v6->_axExposeAllVisibleElements = (NSNumber *)v47;
  }
  return v6;
}

- (NSDate)surveyQuestionsHideDate
{
  return self->_surveyQuestionsHideDate;
}

- (PXZoomablePhotosUserDefaults)photosGridsUserDefaults
{
  v2 = [(_PXZoomablePhotosUserDefaultsImp *)[_PXZoomablePhotosUserDefaultPhotosGrids alloc] initWithUserDefaults:self];
  return (PXZoomablePhotosUserDefaults *)v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_infoPanelLastSnappedPosition, 0);
  objc_storeStrong((id *)&self->_infoPanelLastSnappedWidgetIdentifier, 0);
  objc_storeStrong((id *)&self->_axExposeAllVisibleElements, 0);
  objc_storeStrong((id *)&self->_surveyQuestionsHideDate, 0);
  objc_storeStrong((id *)&self->_lastSurveyQuestionsRadarPromptDate, 0);
  objc_storeStrong((id *)&self->_lastRadarPromptAnsweredQuestionCount, 0);
  objc_storeStrong((id *)&self->_didShowCompletedCurationFooterAnimation, 0);
  objc_storeStrong((id *)&self->_didShowCurationFooter, 0);
  objc_storeStrong((id *)&self->_photosGridAspectFitInCompact, 0);
  objc_storeStrong((id *)&self->_photosGridAspectFit, 0);
  objc_storeStrong((id *)&self->_photosGridPreferredIndividualItemsColumns, 0);
  objc_storeStrong((id *)&self->_photosGridColumns, 0);
  objc_storeStrong((id *)&self->_allPhotosAspectFitInCompact, 0);
  objc_storeStrong((id *)&self->_allPhotosAspectFit, 0);
  objc_storeStrong((id *)&self->_allPhotosLemonadePreferredIndividualItemsColumns, 0);
  objc_storeStrong((id *)&self->_allPhotosCaptionsVisible, 0);
  objc_storeStrong((id *)&self->_daysMarginScale, 0);
  objc_storeStrong((id *)&self->_curatedLibraryZoomLevel, 0);
  objc_storeStrong((id *)&self->_allPhotosColumns, 0);
  objc_storeStrong((id *)&self->_includeSharedWithYou, 0);
  objc_storeStrong((id *)&self->_includeScreenshots, 0);
}

- (PXUserDefaultsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PXUserDefaultsDataSource *)WeakRetained;
}

- (NSNumber)infoPanelLastSnappedPosition
{
  return self->_infoPanelLastSnappedPosition;
}

- (NSString)infoPanelLastSnappedWidgetIdentifier
{
  return self->_infoPanelLastSnappedWidgetIdentifier;
}

- (NSDate)lastSurveyQuestionsRadarPromptDate
{
  return self->_lastSurveyQuestionsRadarPromptDate;
}

- (NSNumber)lastRadarPromptAnsweredQuestionCount
{
  return self->_lastRadarPromptAnsweredQuestionCount;
}

- (NSNumber)didShowCompletedCurationFooterAnimation
{
  return self->_didShowCompletedCurationFooterAnimation;
}

- (NSNumber)didShowCurationFooter
{
  return self->_didShowCurationFooter;
}

- (NSNumber)photosGridAspectFitInCompact
{
  return self->_photosGridAspectFitInCompact;
}

- (NSNumber)photosGridAspectFit
{
  return self->_photosGridAspectFit;
}

- (NSNumber)photosGridPreferredIndividualItemsColumns
{
  return self->_photosGridPreferredIndividualItemsColumns;
}

- (NSNumber)photosGridColumns
{
  return self->_photosGridColumns;
}

- (void)setAllPhotosAspectFitInCompact:(id)a3
{
}

- (NSNumber)allPhotosAspectFitInCompact
{
  return self->_allPhotosAspectFitInCompact;
}

- (void)setAllPhotosCaptionsVisible:(id)a3
{
}

- (NSNumber)curatedLibraryZoomLevel
{
  return self->_curatedLibraryZoomLevel;
}

- (NSNumber)allPhotosColumns
{
  return self->_allPhotosColumns;
}

- (void)setAxExposeAllVisibleElements:(id)a3
{
  uint64_t v8 = (NSNumber *)a3;
  v5 = self->_axExposeAllVisibleElements;
  char v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(NSNumber *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_axExposeAllVisibleElements, a3);
    char v6 = [(PXUserDefaults *)self dataSource];
    [v6 setPersistedValue:self->_axExposeAllVisibleElements forKey:@"axExposeAllVisibleElements"];
  }

LABEL_5:
}

- (void)setInfoPanelLastSnappedPosition:(id)a3
{
  uint64_t v8 = (NSNumber *)a3;
  v5 = self->_infoPanelLastSnappedPosition;
  char v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(NSNumber *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_infoPanelLastSnappedPosition, a3);
    char v6 = [(PXUserDefaults *)self dataSource];
    [v6 setPersistedValue:self->_infoPanelLastSnappedPosition forKey:@"infoPanelLastSnappedPosition"];
  }

LABEL_5:
}

- (void)setInfoPanelLastSnappedWidgetIdentifier:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  v5 = self->_infoPanelLastSnappedWidgetIdentifier;
  char v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(NSString *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_infoPanelLastSnappedWidgetIdentifier, a3);
    char v6 = [(PXUserDefaults *)self dataSource];
    [v6 setPersistedValue:self->_infoPanelLastSnappedWidgetIdentifier forKey:@"infoPanelLastSnappedWidgetIdentifier"];
  }

LABEL_5:
}

- (void)setSurveyQuestionsHideDate:(id)a3
{
  v9 = (NSDate *)a3;
  id v4 = self->_surveyQuestionsHideDate;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSDate *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSDate *)[(NSDate *)v9 copy];
    surveyQuestionsHideDate = self->_surveyQuestionsHideDate;
    self->_surveyQuestionsHideDate = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_surveyQuestionsHideDate forKey:@"surveyQuestionsHideDate"];
  }

LABEL_5:
}

- (void)setLastSurveyQuestionsRadarPromptDate:(id)a3
{
  v9 = (NSDate *)a3;
  id v4 = self->_lastSurveyQuestionsRadarPromptDate;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSDate *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSDate *)[(NSDate *)v9 copy];
    lastSurveyQuestionsRadarPromptDate = self->_lastSurveyQuestionsRadarPromptDate;
    self->_lastSurveyQuestionsRadarPromptDate = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_lastSurveyQuestionsRadarPromptDate forKey:@"lastSurveyQuestionsRadarPromptDate"];
  }

LABEL_5:
}

- (void)setLastRadarPromptAnsweredQuestionCount:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_lastRadarPromptAnsweredQuestionCount;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    lastRadarPromptAnsweredQuestionCount = self->_lastRadarPromptAnsweredQuestionCount;
    self->_lastRadarPromptAnsweredQuestionCount = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_lastRadarPromptAnsweredQuestionCount forKey:@"lastRadarPromptAnsweredQuestionCount"];
  }

LABEL_5:
}

- (void)setIncludeSharedWithYou:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_includeSharedWithYou;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    includeSharedWithYou = self->_includeSharedWithYou;
    self->_includeSharedWithYou = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:v9 forKey:@"IncludeSharedWithYou"];
  }

LABEL_5:
}

- (void)setIncludeScreenshots:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_includeScreenshots;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    includeScreenshots = self->_includeScreenshots;
    self->_includeScreenshots = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:v9 forKey:@"IncludeScreenshots"];
  }

LABEL_5:
}

- (void)setDidShowCompletedCurationFooterAnimation:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_didShowCompletedCurationFooterAnimation;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    didShowCompletedCurationFooterAnimation = self->_didShowCompletedCurationFooterAnimation;
    self->_didShowCompletedCurationFooterAnimation = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_didShowCompletedCurationFooterAnimation forKey:@"didShowCompletedCurationFooterAnimation"];
  }

LABEL_5:
}

- (void)setDidShowCurationFooter:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_didShowCurationFooter;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    didShowCurationFooter = self->_didShowCurationFooter;
    self->_didShowCurationFooter = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_didShowCurationFooter forKey:@"didShowCurationFooter"];
  }

LABEL_5:
}

- (void)setPhotosGridAspectFitInCompact:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_photosGridAspectFitInCompact;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    photosGridAspectFitInCompact = self->_photosGridAspectFitInCompact;
    self->_photosGridAspectFitInCompact = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_photosGridAspectFitInCompact forKey:@"photosGridAspectFitInCompact"];
  }

LABEL_5:
}

- (void)setPhotosGridAspectFit:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_photosGridAspectFit;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    photosGridAspectFit = self->_photosGridAspectFit;
    self->_photosGridAspectFit = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_photosGridAspectFit forKey:@"photosGridAspectFit"];
  }

LABEL_5:
}

- (void)setPhotosGridPreferredIndividualItemsColumns:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_photosGridPreferredIndividualItemsColumns;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    photosGridPreferredIndividualItemsColumns = self->_photosGridPreferredIndividualItemsColumns;
    self->_photosGridPreferredIndividualItemsColumns = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_photosGridPreferredIndividualItemsColumns forKey:@"photosGridPreferredIndividualItemsColumns"];
  }

LABEL_5:
}

- (void)setPhotosGridColumns:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_photosGridColumns;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    v5 = [(PXUserDefaults *)self dataSource];
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    photosGridColumns = self->_photosGridColumns;
    self->_photosGridColumns = v7;

    [v5 setPersistedValue:self->_photosGridColumns forKey:@"photosGridColumns"];
  }

LABEL_5:
}

- (void)setallPhotosAspectFitInCompact:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_allPhotosAspectFitInCompact;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    allPhotosAspectFitInCompact = self->_allPhotosAspectFitInCompact;
    self->_allPhotosAspectFitInCompact = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_allPhotosAspectFitInCompact forKey:@"allPhotosAspectFitInCompact"];
  }

LABEL_5:
}

- (void)setAllPhotosAspectFit:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_allPhotosAspectFit;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    allPhotosAspectFit = self->_allPhotosAspectFit;
    self->_allPhotosAspectFit = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_allPhotosAspectFit forKey:@"allPhotosAspectFit"];
  }

LABEL_5:
}

- (void)setAllPhotosColumns:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_allPhotosColumns;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    v5 = [(PXUserDefaults *)self dataSource];
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    allPhotosColumns = self->_allPhotosColumns;
    self->_allPhotosColumns = v7;

    [v5 setPersistedValue:self->_allPhotosColumns forKey:@"allPhotosColumns"];
  }

LABEL_5:
}

- (void)setDaysMarginScale:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_daysMarginScale;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    daysMarginScale = self->_daysMarginScale;
    self->_daysMarginScale = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_daysMarginScale forKey:@"daysMarginScale"];
  }

LABEL_5:
}

- (void)setCuratedLibraryZoomLevel:(id)a3
{
  v9 = (NSNumber *)a3;
  id v4 = self->_curatedLibraryZoomLevel;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSNumber *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    char v7 = (NSNumber *)[(NSNumber *)v9 copy];
    curatedLibraryZoomLevel = self->_curatedLibraryZoomLevel;
    self->_curatedLibraryZoomLevel = v7;

    v5 = [(PXUserDefaults *)self dataSource];
    [v5 setPersistedValue:self->_curatedLibraryZoomLevel forKey:@"curatedLibraryZoomLevel"];
  }

LABEL_5:
}

- (PXUserDefaults)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUserDefaults.m", 38, @"%s is not available as initializer", "-[PXUserDefaults init]");

  abort();
}

@end
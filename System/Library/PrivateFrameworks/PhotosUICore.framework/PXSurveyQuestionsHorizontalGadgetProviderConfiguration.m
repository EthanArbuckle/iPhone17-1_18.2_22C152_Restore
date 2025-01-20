@interface PXSurveyQuestionsHorizontalGadgetProviderConfiguration
+ (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)generalConfiguration;
- (NSString)customInfoAlertActionTitle;
- (NSString)hideDateDefaultsKey;
- (NSString)hideForeverAlertMessage;
- (NSString)identifier;
- (NSString)infoAlertMessage;
- (NSString)infoAlertTitle;
- (NSString)radarPromptAnsweredQuestionCountDefaultsKey;
- (NSString)radarPromptDateDefaultsKey;
- (NSString)sectionTitle;
- (PXRadarConfiguration)radarConfiguration;
- (PXSurveyQuestionsGadgetProvider)gadgetProvider;
- (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)init;
- (id)_initWithCategory:(int64_t)a3 gadgetProvider:(id)a4;
- (id)customInfoAlertActionViewController:(id *)a3;
@end

@implementation PXSurveyQuestionsHorizontalGadgetProviderConfiguration

- (NSString)sectionTitle
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSectionTitle_General", @"PhotosUICore");
  }
  return (NSString *)v2;
}

- (NSString)identifier
{
  if (self->_category) {
    return 0;
  }
  else {
    return (NSString *)@"PXSurveyQuestionsHorizontalGadgetProviderConfiguration:General";
  }
}

- (PXSurveyQuestionsGadgetProvider)gadgetProvider
{
  return self->_gadgetProvider;
}

- (id)_initWithCategory:(int64_t)a3 gadgetProvider:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSurveyQuestionsHorizontalGadgetProviderConfiguration.m", 73, @"Invalid parameter not satisfying: %@", @"gadgetProvider" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProviderConfiguration;
  v9 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_category = a3;
    objc_storeStrong((id *)&v9->_gadgetProvider, a4);
  }

  return v10;
}

+ (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)generalConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", 9);
  v5 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v4];
  [v3 addObject:v5];

  v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  id v7 = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  if (v8)
  {
    v9 = [[PXSurveyQuestionsDataSource alloc] initWithPhotoLibrary:v8 predicate:v7];
    v10 = [[PXSurveyQuestionsGadgetProvider alloc] initWithDataSource:v9 gadgetType:1];
  }
  else
  {
    v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Failed to open the app photo library", buf, 2u);
    }

    v10 = 0;
  }

  if (v10) {
    v12 = (void *)[objc_alloc((Class)a1) _initWithCategory:0 gadgetProvider:v10];
  }
  else {
    v12 = 0;
  }

  return (PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetProvider, 0);
  objc_storeStrong((id *)&self->_radarKeywordIDs, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong(&self->_customInfoAlertActionViewControllerProvider, 0);
}

- (PXRadarConfiguration)radarConfiguration
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = PXSurveyQuestionRadarConfiguration(@"Photos Challenge Submission", MEMORY[0x1E4F1CBF0]);
  }
  return (PXRadarConfiguration *)v2;
}

- (id)customInfoAlertActionViewController:(id *)a3
{
  return 0;
}

- (NSString)customInfoAlertActionTitle
{
  return 0;
}

- (NSString)hideDateDefaultsKey
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = NSStringFromSelector(sel_surveyQuestionsHideDate);
  }
  return (NSString *)v2;
}

- (NSString)radarPromptDateDefaultsKey
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = NSStringFromSelector(sel_lastSurveyQuestionsRadarPromptDate);
  }
  return (NSString *)v2;
}

- (NSString)radarPromptAnsweredQuestionCountDefaultsKey
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = NSStringFromSelector(sel_lastRadarPromptAnsweredQuestionCount);
  }
  return (NSString *)v2;
}

- (NSString)hideForeverAlertMessage
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForeverActionMessage_General", @"PhotosUICore");
  }
  return (NSString *)v2;
}

- (NSString)infoAlertMessage
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = PXLocalizedStringFromTable(@"SURVEY_QUESTIONS_PHOTOS_WELCOME_BODY_GENERAL", @"PhotosUICore");
  }
  return (NSString *)v2;
}

- (NSString)infoAlertTitle
{
  if (self->_category)
  {
    v2 = 0;
  }
  else
  {
    v2 = PXLocalizedStringFromTable(@"SURVEY_QUESTIONS_PHOTOS_WELCOME_TITLE_GENERAL", @"PhotosUICore");
  }
  return (NSString *)v2;
}

- (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionsHorizontalGadgetProviderConfiguration.m", 69, @"%s is not available as initializer", "-[PXSurveyQuestionsHorizontalGadgetProviderConfiguration init]");

  abort();
}

@end
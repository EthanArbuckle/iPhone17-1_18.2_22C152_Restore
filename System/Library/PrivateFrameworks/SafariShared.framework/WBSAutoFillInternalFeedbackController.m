@interface WBSAutoFillInternalFeedbackController
+ (NSString)informativeText;
+ (NSString)isRegressionOptionText;
+ (NSString)knownWorkingBuildPlaceholderText;
+ (NSString)titleText;
+ (id)placeholderForFeedbackDetailType:(id)a3;
+ (id)titleForAttachmentsType:(unint64_t)a3;
+ (id)titleForFeedbackCategory:(unint64_t)a3;
+ (id)titleForFeedbackDetailType:(id)a3;
- (BOOL)canContinueInTapToRadar;
- (BOOL)isRegression;
- (NSOrderedSet)detailTypesForSelectedFeedbackCategory;
- (NSString)attachmentDetailsText;
- (NSString)knownWorkingBuild;
- (NSURL)continueInTapToRadarURL;
- (WBSAutoFillInternalFeedbackController)initWithDiagnosticsData:(id)a3;
- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData;
- (id)_radarTitleComponentForDetails;
- (id)responseForDetailType:(id)a3;
- (unint64_t)selectedAttachmentsType;
- (unint64_t)selectedFeedbackCategory;
- (void)setKnownWorkingBuild:(id)a3;
- (void)setRegression:(BOOL)a3;
- (void)setResponse:(id)a3 forDetailType:(id)a4;
- (void)setSelectedAttachmentsType:(unint64_t)a3;
- (void)setSelectedFeedbackCategory:(unint64_t)a3;
@end

@implementation WBSAutoFillInternalFeedbackController

+ (NSString)titleText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)informativeText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)isRegressionOptionText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)knownWorkingBuildPlaceholderText
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)titleForFeedbackCategory:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      _WBSLocalizedString();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return a1;
}

+ (id)titleForFeedbackDetailType:(id)a3
{
  return titleForFeedbackDetailType(a3, 1);
}

+ (id)placeholderForFeedbackDetailType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedFormPurpose"]|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes")|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedFormPurpose")|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes")|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling")
    || [v3 isEqualToString:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields"]|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataExpectedFilledData")|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields")|| objc_msgSend(v3, "isEqualToString:", @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatExpectedFormat"))
  {
    _WBSLocalizedString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EFBE3CF8;
    if (([v3 isEqualToString:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue"] & 1) == 0
      && ![v3 isEqualToString:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues"])
    {
      v4 = @"unknown detail type placeholder";
    }
  }

  return v4;
}

+ (id)titleForAttachmentsType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    _WBSLocalizedString();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (WBSAutoFillInternalFeedbackController)initWithDiagnosticsData:(id)a3
{
  id v5 = a3;
  result = (WBSAutoFillInternalFeedbackController *)[MEMORY[0x1E4F97EA0] isInternalInstall];
  if (result)
  {
    v12.receiver = self;
    v12.super_class = (Class)WBSAutoFillInternalFeedbackController;
    v7 = [(WBSAutoFillInternalFeedbackController *)&v12 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_diagnosticsData, a3);
      v8->_selectedFeedbackCategory = 0;
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      detailResponses = v8->_detailResponses;
      v8->_detailResponses = (NSMutableDictionary *)v9;

      v8->_selectedAttachmentsType = 1;
      v11 = v8;
    }

    return v8;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

- (NSOrderedSet)detailTypesForSelectedFeedbackCategory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  switch(self->_selectedFeedbackCategory)
  {
    case 0uLL:
      v2 = [MEMORY[0x1E4F1CAA0] orderedSet];
      break;
    case 1uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v18 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedFormPurpose";
      v19 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v18;
      goto LABEL_8;
    case 2uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v16 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedFormPurpose";
      v17 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v16;
      goto LABEL_8;
    case 3uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v15 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v15;
      goto LABEL_11;
    case 4uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v13 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields";
      v14 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataExpectedFilledData";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v13;
      goto LABEL_8;
    case 5uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v11 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields";
      objc_super v12 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatExpectedFormat";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v11;
LABEL_8:
      uint64_t v6 = 2;
      goto LABEL_12;
    case 6uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      v10 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v10;
      goto LABEL_11;
    case 7uLL:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v9 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues";
      v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v9;
LABEL_11:
      uint64_t v6 = 1;
LABEL_12:
      v7 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
      v2 = [v3 orderedSetWithArray:v7];

      break;
    default:
      break;
  }
  return (NSOrderedSet *)v2;
}

- (NSString)attachmentDetailsText
{
  uint64_t v3 = NSString;
  v4 = _WBSLocalizedString();
  id v5 = [(WBSAutoFillInternalFeedbackController *)self diagnosticsData];
  uint64_t v6 = [v5 url];
  v7 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (BOOL)canContinueInTapToRadar
{
  if (!self->_selectedFeedbackCategory) {
    return 0;
  }
  uint64_t v3 = [(WBSAutoFillInternalFeedbackController *)self detailTypesForSelectedFeedbackCategory];
  v4 = [v3 set];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WBSAutoFillInternalFeedbackController_canContinueInTapToRadar__block_invoke;
  v7[3] = &unk_1E5C8C440;
  v7[4] = self;
  char v5 = objc_msgSend(v4, "safari_allObjectsPassTest:", v7);

  return v5;
}

BOOL __64__WBSAutoFillInternalFeedbackController_canContinueInTapToRadar__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_radarTitleComponentForDetails
{
  switch(self->_selectedFeedbackCategory)
  {
    case 1uLL:
      v2 = NSString;
      BOOL v3 = [(NSMutableDictionary *)self->_detailResponses objectForKeyedSubscript:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes"];
      [v2 stringWithFormat:@"Expected: %@", v3];
      goto LABEL_9;
    case 2uLL:
      char v5 = NSString;
      BOOL v3 = [(NSMutableDictionary *)self->_detailResponses objectForKeyedSubscript:@"WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes"];
      [v5 stringWithFormat:@"Unexpected: %@", v3];
      goto LABEL_9;
    case 3uLL:
      uint64_t v6 = NSString;
      detailResponses = self->_detailResponses;
      v8 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling";
      goto LABEL_8;
    case 4uLL:
      uint64_t v6 = NSString;
      detailResponses = self->_detailResponses;
      v8 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields";
      goto LABEL_8;
    case 5uLL:
      uint64_t v6 = NSString;
      detailResponses = self->_detailResponses;
      v8 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields";
LABEL_8:
      BOOL v3 = [(NSMutableDictionary *)detailResponses objectForKeyedSubscript:v8];
      [v6 stringWithFormat:@"Fields: %@", v3];
LABEL_9:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 6uLL:
      uint64_t v9 = self->_detailResponses;
      v10 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue";
      goto LABEL_12;
    case 7uLL:
      uint64_t v9 = self->_detailResponses;
      v10 = @"WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues";
LABEL_12:
      v4 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];
      break;
    default:
      v4 = &stru_1EFBE3CF8;
      break;
  }
  return v4;
}

- (NSURL)continueInTapToRadarURL
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (self->_regression)
  {
    if ([(NSString *)self->_knownWorkingBuild length])
    {
      BOOL v3 = [NSString stringWithFormat:@"REGRESSION(last worked in %@) ", self->_knownWorkingBuild];
      v4 = [NSString stringWithFormat:@"Marked as regression by filer as last working in %@.", self->_knownWorkingBuild];
    }
    else
    {
      BOOL v3 = @"REGRESSION ";
      v4 = @"Marked as regression by filer with no last known working version.";
    }
  }
  else
  {
    v4 = 0;
    BOOL v3 = &stru_1EFBE3CF8;
  }
  char v5 = NSString;
  unint64_t v6 = self->_selectedFeedbackCategory - 1;
  v46 = v4;
  if (v6 > 6) {
    v7 = @"No issue";
  }
  else {
    v7 = off_1E5C8C480[v6];
  }
  v8 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)self->_diagnosticsData url];
  uint64_t v9 = [v8 host];
  v10 = [(WBSAutoFillInternalFeedbackController *)self _radarTitleComponentForDetails];
  v47 = v3;
  v45 = [v5 stringWithFormat:@"Safari AutoFill [in-app feedback]: %@%@ on %@ (%@)", v3, v7, v9, v10];

  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  objc_super v12 = self;
  id obj = [(WBSAutoFillInternalFeedbackController *)self detailTypesForSelectedFeedbackCategory];
  uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v18 = NSString;
        v19 = titleForFeedbackDetailType(v17, 0);
        uint64_t v20 = [v18 stringWithFormat:@" * %@", v19];
        [v11 addObject:v20];

        v21 = NSString;
        v22 = [(NSMutableDictionary *)v12->_detailResponses objectForKeyedSubscript:v17];
        v23 = [v21 stringWithFormat:@"%@\n", v22];
        [v11 addObject:v23];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v14);
  }

  v24 = NSString;
  v25 = v12;
  v26 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)v12->_diagnosticsData url];
  v27 = [v24 stringWithFormat:@"URL: %@\n", v26];
  [v11 addObject:v27];

  if (v46) {
    [v11 addObject:v46];
  }
  v28 = [MEMORY[0x1E4F1CA48] array];
  if (v25->_selectedAttachmentsType == 1)
  {
    v29 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)v25->_diagnosticsData writeTemporaryFileWithFormMetadata];
    if (v29)
    {
      [v28 addObject:v29];
      v30 = @"Form metadata attached.";
    }
    else
    {
      v30 = @"Safari was unable to attach form metadata for this issue.";
    }
    [v11 addObject:v30];
  }
  v31 = NSString;
  v32 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)v25->_diagnosticsData creationDateString];
  v33 = [v31 stringWithFormat:@"Diagnostics collection was triggered at %@", v32];
  [v11 addObject:v33];

  v34 = [v11 componentsJoinedByString:@"\n"];
  unint64_t v35 = v25->_selectedFeedbackCategory - 1;
  if (v35 > 6) {
    v36 = @"1723118";
  }
  else {
    v36 = off_1E5C8C4B8[v35];
  }
  v53 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v38 = (void *)[v37 mutableCopy];

  if (v25->_regression) {
    [v38 addObject:@"1804822"];
  }
  v39 = [WBSInternalFeedbackRadar alloc];
  v40 = +[WBSInternalFeedbackRadarComponent safariAutoFill];
  v41 = [(WBSInternalFeedbackRadar *)v39 initWithComponent:v40 title:v45 descriptionTemplate:v34];

  [(WBSInternalFeedbackRadar *)v41 setClassification:@"Serious Bug"];
  [(WBSInternalFeedbackRadar *)v41 setReproducibility:@"Not Applicable"];
  [(WBSInternalFeedbackRadar *)v41 setKeywords:v38];
  v42 = objc_msgSend(v28, "safari_mapObjectsUsingBlock:", &__block_literal_global_1);
  [(WBSInternalFeedbackRadar *)v41 setAttachmentPaths:v42];

  v43 = [(WBSInternalFeedbackRadar *)v41 continueInTapToRadarURL];

  return (NSURL *)v43;
}

uint64_t __64__WBSAutoFillInternalFeedbackController_continueInTapToRadarURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 path];
}

- (id)responseForDetailType:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_detailResponses objectForKeyedSubscript:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)setResponse:(id)a3 forDetailType:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_detailResponses setObject:v7 forKeyedSubscript:v6];
}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return self->_diagnosticsData;
}

- (unint64_t)selectedFeedbackCategory
{
  return self->_selectedFeedbackCategory;
}

- (void)setSelectedFeedbackCategory:(unint64_t)a3
{
  self->_selectedFeedbackCategory = a3;
}

- (BOOL)isRegression
{
  return self->_regression;
}

- (void)setRegression:(BOOL)a3
{
  self->_regression = a3;
}

- (NSString)knownWorkingBuild
{
  return self->_knownWorkingBuild;
}

- (void)setKnownWorkingBuild:(id)a3
{
}

- (unint64_t)selectedAttachmentsType
{
  return self->_selectedAttachmentsType;
}

- (void)setSelectedAttachmentsType:(unint64_t)a3
{
  self->_selectedAttachmentsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownWorkingBuild, 0);
  objc_storeStrong((id *)&self->_diagnosticsData, 0);
  objc_storeStrong((id *)&self->_detailResponses, 0);
}

@end
@interface RAPLookAroundQuestion
- (BOOL)isAnonymous;
- (NSArray)initialItems;
- (NSArray)initialItemsMinusPrivacy;
- (NSArray)privacyItems;
- (NSString)localizedDetailsNavigationTitle;
- (NSString)localizedPrivacyNavigationTitle;
- (RAPCommentQuestion)commentQuestion;
- (RAPLookAroundQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPPlaceCorrectableAddress)addressCorrectableString;
- (RAPPlaceCorrectableString)emailAddressCorrectableString;
- (UIImage)thumbnailImage;
- (id)_labelItems;
- (id)localizedDescription;
- (id)localizedTitle;
- (int)analyticTarget;
- (unint64_t)selectedQuestionType;
- (void)_clearFields;
- (void)_fillSubmissionParameters:(id)a3;
- (void)_initCorrectableFields;
- (void)_resolveCompleteness;
- (void)setSelectedQuestionType:(unint64_t)a3;
@end

@implementation RAPLookAroundQuestion

- (RAPLookAroundQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)RAPLookAroundQuestion;
  v4 = [(RAPQuestion *)&v12 initWithReport:a3 parentQuestion:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RAPQuestion *)v4 _context];
    v7 = [v6 reportedLookAroundContext];

    v8 = [v7 lookAroundSnapshotImageData];
    uint64_t v9 = +[UIImage imageWithData:v8];
    thumbnailImage = v5->_thumbnailImage;
    v5->_thumbnailImage = (UIImage *)v9;

    v5->_labelsEnabled = [v7 lookAroundLabelsEnabled];
    [(RAPLookAroundQuestion *)v5 _initCorrectableFields];
  }
  return v5;
}

- (void)_initCorrectableFields
{
  sub_100521AB8();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [RAPPlaceCorrectableString alloc];
  v4 = [(RAPPlaceCorrectableString *)v3 initWithKind:qword_1015E1AD8 originalValue:&stru_101324E70];
  emailAddressCorrectableString = self->_emailAddressCorrectableString;
  self->_emailAddressCorrectableString = v4;

  [(RAPPlaceCorrectableString *)self->_emailAddressCorrectableString setValue:v13];
  [(RAPPlaceCorrectableString *)self->_emailAddressCorrectableString addObserver:self changeHandler:&stru_1012EA938];
  if (self->_selectedQuestionType == 4) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 2;
  }
  v7 = [RAPCommentQuestion alloc];
  v8 = [(RAPQuestion *)self report];
  uint64_t v9 = [(RAPCommentQuestion *)v7 initWithReport:v8 parentQuestion:self title:&stru_101324E70 placeholderText:&stru_101324E70 emphasis:v6];
  commentQuestion = self->_commentQuestion;
  self->_commentQuestion = v9;

  [(RAPCommentQuestion *)self->_commentQuestion setPhotoType:5];
  [(RAPQuestion *)self->_commentQuestion addObserver:self changeHandler:&stru_1012EA978];
  v11 = +[RAPPlaceCorrectableAddress emptyCorrectableAddress];
  addressCorrectableString = self->_addressCorrectableString;
  self->_addressCorrectableString = v11;

  [(RAPPlaceCorrectableAddress *)self->_addressCorrectableString addObserver:self changeHandler:&stru_1012EA9B8];
}

- (id)localizedTitle
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (v3 == (id)5) {
    CFStringRef v6 = @"Report an Issue with Look Around [LookAround RAP]";
  }
  else {
    CFStringRef v6 = @"Report an Issue";
  }
  v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return v7;
}

- (id)localizedDescription
{
  v2 = &stru_101324E70;
  switch(self->_selectedQuestionType)
  {
    case 0uLL:
      id v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Image Quality Description [LookAround RAP]";
      goto LABEL_7;
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Street Labels Description [LookAround RAP]";
      goto LABEL_7;
    case 2uLL:
      id v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Store Labels Description [LookAround RAP]";
      goto LABEL_7;
    case 4uLL:
      id v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Remove Imagery Description [LookAround RAP]";
      goto LABEL_7;
    case 6uLL:
      id v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Something Else Description [LookAround RAP]";
LABEL_7:
      v2 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v2;
}

- (NSString)localizedDetailsNavigationTitle
{
  id v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  unint64_t selectedQuestionType = self->_selectedQuestionType;
  CFStringRef v6 = &stru_101324E70;
  if (v4 == (id)5)
  {
    switch(selectedQuestionType)
    {
      case 0uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Image Quality Should Be Better [LookAround RAP]";
        goto LABEL_15;
      case 1uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Incorrect Street Labels [LookAround RAP]";
        goto LABEL_15;
      case 2uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Incorrect Store Labels [LookAround RAP]";
        goto LABEL_15;
      case 4uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Blur Personal Information [LookAround RAP]";
        goto LABEL_15;
      case 5uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Remove Imagery of My Home [LookAround RAP]";
        goto LABEL_15;
      case 6uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Something Else Needs Fixing [LookAround RAP]";
        goto LABEL_15;
      default:
        break;
    }
  }
  else
  {
    switch(selectedQuestionType)
    {
      case 0uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Image Quality [LookAround RAP]";
        goto LABEL_15;
      case 1uLL:
      case 2uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Incorrect Labels [LookAround RAP]";
        goto LABEL_15;
      case 4uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Blur Information [LookAround RAP]";
        goto LABEL_15;
      case 5uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Remove Imagery [LookAround RAP]";
        goto LABEL_15;
      case 6uLL:
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Something Else [LookAround RAP]";
LABEL_15:
        CFStringRef v6 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

        break;
      default:
        break;
    }
  }

  return (NSString *)v6;
}

- (NSString)localizedPrivacyNavigationTitle
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[RAP LookAround] Privacy Concerns" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (void)setSelectedQuestionType:(unint64_t)a3
{
  if (self->_selectedQuestionType != a3) {
    self->_unint64_t selectedQuestionType = a3;
  }
  [(RAPLookAroundQuestion *)self _clearFields];

  [(RAPLookAroundQuestion *)self _resolveCompleteness];
}

- (BOOL)isAnonymous
{
  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundQuestion;
  BOOL v3 = [(RAPQuestion *)&v5 isAnonymous];
  if (v3) {
    LOBYTE(v3) = self->_selectedQuestionType != 5;
  }
  return v3;
}

- (void)_clearFields
{
  [(RAPPlaceCorrectableAddress *)self->_addressCorrectableString removeObserver:self];
  [(RAPPlaceCorrectableString *)self->_emailAddressCorrectableString removeObserver:self];
  [(RAPQuestion *)self->_commentQuestion removeObserver:self];
  [(RAPLookAroundQuestion *)self _initCorrectableFields];
  [(RAPQuestion *)self _setComplete:0];
  id v3 = [(RAPQuestion *)self report];
  [v3 _questionDidChange:self];
}

- (NSArray)initialItems
{
  id v3 = [[RAPLookAroundCategoryItem alloc] initWithType:0];
  objc_super v12 = v3;
  id v4 = +[NSArray arrayWithObjects:&v12 count:1];

  if (self->_labelsEnabled)
  {
    objc_super v5 = [(RAPLookAroundQuestion *)self _labelItems];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    id v4 = (void *)v6;
  }
  v7 = [[RAPLookAroundCategoryItem alloc] initWithType:3];
  v8 = [v4 arrayByAddingObject:v7];

  CFStringRef v9 = [[RAPLookAroundCategoryItem alloc] initWithType:6];
  v10 = [v8 arrayByAddingObject:v9];

  return (NSArray *)v10;
}

- (NSArray)initialItemsMinusPrivacy
{
  id v3 = [[RAPLookAroundCategoryItem alloc] initWithType:0];
  v10 = v3;
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];

  if (self->_labelsEnabled)
  {
    objc_super v5 = [(RAPLookAroundQuestion *)self _labelItems];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    id v4 = (void *)v6;
  }
  v7 = [[RAPLookAroundCategoryItem alloc] initWithType:6];
  v8 = [v4 arrayByAddingObject:v7];

  return (NSArray *)v8;
}

- (id)_labelItems
{
  v2 = [[RAPLookAroundCategoryItem alloc] initWithType:1];
  id v3 = [[RAPLookAroundCategoryItem alloc] initWithType:2];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ((GEOConfigGetBOOL() & 1) == 0) {
    [v4 addObject:v3];
  }
  if ((GEOConfigGetBOOL() & 1) == 0) {
    [v4 addObject:v2];
  }
  id v5 = [v4 copy];

  return v5;
}

- (NSArray)privacyItems
{
  v2 = +[GEOCountryConfiguration sharedConfiguration];
  id v3 = [v2 countryCode];
  unsigned int v4 = [v3 isEqualToString:@"KR"];

  id v5 = [[RAPLookAroundCategoryItem alloc] initWithType:4];
  uint64_t v6 = v5;
  if (v4)
  {
    v11 = v5;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v8 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 5, v5);
    v10[1] = v8;
    v7 = +[NSArray arrayWithObjects:v10 count:2];
  }

  return (NSArray *)v7;
}

- (void)_resolveCompleteness
{
  BOOL v3 = 0;
  unint64_t selectedQuestionType = self->_selectedQuestionType;
  if (selectedQuestionType <= 6)
  {
    if (((1 << selectedQuestionType) & 0x57) != 0)
    {
      BOOL v3 = [(RAPQuestion *)self->_commentQuestion isComplete];
    }
    else if (selectedQuestionType == 5)
    {
      id v5 = [(RAPPlaceCorrectableString *)self->_emailAddressCorrectableString value];
      BOOL v6 = sub_10044EC98(v5);

      v7 = [(RAPPlaceCorrectableAddress *)self->_addressCorrectableString freeformAddress];
      v8 = [v7 value];
      BOOL v9 = sub_10044EC98(v8);

      BOOL v3 = v6 & v9;
    }
  }

  [(RAPQuestion *)self _setComplete:v3];
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 details];

  if (!v5)
  {
    BOOL v6 = objc_opt_new();
    [v4 setDetails:v6];
  }
  v7 = [v4 details];
  v8 = [v7 groundViewFeedback];

  if (!v8)
  {
    BOOL v9 = objc_opt_new();
    v10 = [v4 details];
    [v10 setGroundViewFeedback:v9];
  }
  v11 = [v4 details];
  objc_super v12 = [v11 groundViewFeedback];
  id v13 = [v12 groundViewContext];

  if (!v13)
  {
    id v13 = objc_opt_new();
    v14 = [v4 details];
    v15 = [v14 groundViewFeedback];
    [v15 setGroundViewContext:v13];
  }
  v16 = [(RAPQuestion *)self _context];
  v17 = [v16 reportedLookAroundContext];

  v18 = [v17 reportedMuninViewState];
  [v13 setViewState:v18];

  [v13 setMetadataTileBuildId:[v17 muninMetadataTileBuildId]];
  [v13 setImdataId:[v17 muninImageDataId]];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v19 = [v17 reportedVisibleMUIDs];
  id v20 = [v19 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v72;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(v13, "addVisiblePlaceMuid:", objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * i), "unsignedLongLongValue"));
      }
      id v21 = [v19 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v21);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v24 = [v17 reportedMuninImageResources];
  id v25 = [v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v68;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v68 != v27) {
          objc_enumerationMutation(v24);
        }
        [v13 addOnscreenImageResource:*(void *)(*((void *)&v67 + 1) + 8 * (void)j)];
      }
      id v26 = [v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v26);
  }
  v62 = self;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v29 = [v17 reportedMuninRoadLabels];
  id v30 = [v29 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v64;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v64 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)k) featureHandles];
        v35 = [v34 firstObject];
        v36 = sub_100581B2C(v35);

        if (v36) {
          [v13 addVisibleFeatureHandle:v36];
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v31);
  }

  v37 = [v4 details];
  v38 = [v37 groundViewFeedback];
  v39 = [v38 groundViewCorrections];

  if (!v39)
  {
    v39 = objc_opt_new();
    v40 = [v4 details];
    v41 = [v40 groundViewFeedback];
    [v41 setGroundViewCorrections:v39];
  }
  unint64_t selectedQuestionType = v62->_selectedQuestionType;
  if (selectedQuestionType <= 6 && ((0x77u >> selectedQuestionType) & 1) != 0)
  {
    [v39 setCorrectionType:dword_100F6F5E4[selectedQuestionType]];
    unint64_t selectedQuestionType = v62->_selectedQuestionType;
  }
  if (selectedQuestionType != 5)
  {
    v52 = [(RAPLookAroundQuestion *)v62 commentQuestion];
    [v52 _fillSubmissionParameters:v4];
    goto LABEL_41;
  }
  id v43 = objc_alloc_init((Class)GEORPFeedbackAddressFields);
  [v39 setAddressToCensor:v43];

  v44 = [(RAPPlaceCorrectableAddress *)v62->_addressCorrectableString freeformAddress];
  v45 = [v44 value];
  BOOL v46 = sub_10044EC98(v45);

  if (v46)
  {
    v47 = [(RAPPlaceCorrectableAddress *)v62->_addressCorrectableString freeformAddress];
    v48 = [v47 value];
    v49 = [v39 addressToCensor];
    [v49 setAddressBasic:v48];
  }
  v50 = [(RAPPlaceCorrectableString *)v62->_emailAddressCorrectableString value];
  BOOL v51 = sub_10044EC98(v50);

  if (v51)
  {
    v52 = [(RAPPlaceCorrectableString *)v62->_emailAddressCorrectableString value];
    v53 = [(RAPQuestion *)v62 report];
    [v53 setPreferredEmailAddress:v52];

LABEL_41:
  }
  v54 = [v17 lookAroundSnapshotImageData];

  if (v54)
  {
    v55 = [RAPPhoto alloc];
    v56 = [v17 lookAroundSnapshotImageData];
    v57 = +[UIImage imageWithData:v56];
    v58 = +[NSDate date];
    v59 = [(RAPPhoto *)v55 initWithPhoto:v57 date:v58 location:0];

    v60 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v59 photoType:5];
    v61 = [(RAPQuestion *)v62 report];
    [v61 addPhotoWithMetadata:v60];
  }
}

- (int)analyticTarget
{
  unint64_t selectedQuestionType = self->_selectedQuestionType;
  if (selectedQuestionType > 6) {
    return 0;
  }
  else {
    return dword_100F6F600[selectedQuestionType];
  }
}

- (RAPPlaceCorrectableString)emailAddressCorrectableString
{
  return self->_emailAddressCorrectableString;
}

- (RAPPlaceCorrectableAddress)addressCorrectableString
{
  return self->_addressCorrectableString;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (unint64_t)selectedQuestionType
{
  return self->_selectedQuestionType;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_addressCorrectableString, 0);

  objc_storeStrong((id *)&self->_emailAddressCorrectableString, 0);
}

@end
@interface RAPCommentQuestion
+ (id)_localizedInformationTitle;
+ (id)_localizedMoreInformationTitle;
+ (id)_localizedOptionalInformationTitle;
+ (id)validatedComment:(id)a3;
+ (unint64_t)maximumCommentLength;
- (BOOL)_isNowComplete;
- (BOOL)canAddPhoto;
- (BOOL)removePhotoForIdentifier:(id)a3;
- (BOOL)shouldShowEmail;
- (NSArray)photos;
- (NSString)comment;
- (NSString)commentsPlaceholderText;
- (NSString)commentsTitle;
- (NSString)localizedPhotosPickerExplanation;
- (NSString)localizedPhotosPickerLabel;
- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7;
- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7 localizedPhotosPickerExplanation:(id)a8;
- (RAPPlaceCorrectableString)correctableEmail;
- (id)photoAtIndex:(unint64_t)a3;
- (int64_t)emphasis;
- (int64_t)photoType;
- (unint64_t)maximumNumberOfPhotos;
- (unint64_t)remainingCharacters;
- (void)_fillSubmissionParameters:(id)a3;
- (void)_prepareForSubmission;
- (void)_setCommentsTitle:(id)a3 placeholderText:(id)a4;
- (void)_setLocalizedPhotosPickerExplanation:(id)a3;
- (void)_setPlaceholderText:(id)a3;
- (void)addPhoto:(id)a3;
- (void)removeAllPhotos;
- (void)removePhotoAtIndex:(unint64_t)a3;
- (void)setComment:(id)a3;
- (void)setEmphasis:(int64_t)a3;
- (void)setPhotoType:(int64_t)a3;
- (void)setPhotos:(id)a3;
- (void)setShouldShowEmail:(BOOL)a3;
@end

@implementation RAPCommentQuestion

+ (id)_localizedInformationTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Information" value:@"localized string not found" table:0];

  return v3;
}

+ (id)_localizedMoreInformationTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"More Information" value:@"localized string not found" table:0];

  return v3;
}

+ (id)_localizedOptionalInformationTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Optional Information" value:@"localized string not found" table:0];

  return v3;
}

- (NSString)localizedPhotosPickerLabel
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Details [Report a Problem photos]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedPhotosPickerExplanation
{
  localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  if (!localizedPhotosPickerExplanation)
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Submit a Photo [Report an Issue photos]" value:@"localized string not found" table:0];
    v6 = self->_localizedPhotosPickerExplanation;
    self->_localizedPhotosPickerExplanation = v5;

    localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  }

  return localizedPhotosPickerExplanation;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Comments" value:@"localized string not found" table:0];
  v10 = [(RAPCommentQuestion *)self initWithReport:v7 parentQuestion:v6 title:v9 placeholderText:0 emphasis:0];

  return v10;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7 localizedPhotosPickerExplanation:(id)a8
{
  id v14 = a8;
  v15 = [(RAPCommentQuestion *)self initWithReport:a3 parentQuestion:a4 title:a5 placeholderText:a6 emphasis:a7];
  if (v15)
  {
    v16 = (NSString *)[v14 copy];
    localizedPhotosPickerExplanation = v15->_localizedPhotosPickerExplanation;
    v15->_localizedPhotosPickerExplanation = v16;
  }
  return v15;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v33.receiver = self;
  v33.super_class = (Class)RAPCommentQuestion;
  v16 = [(RAPQuestion *)&v33 initWithReport:v12 parentQuestion:v13];
  if (v16)
  {
    v17 = (NSString *)[v14 copy];
    commentsTitle = v16->_commentsTitle;
    v16->_commentsTitle = v17;

    v19 = (NSString *)[v15 copy];
    commentsPlaceholderText = v16->_commentsPlaceholderText;
    v16->_commentsPlaceholderText = v19;

    v16->_emphasis = a7;
    v16->_photoType = 1;
    v16->_shouldShowEmail = 0;
    v21 = [RAPPlaceCorrectableString alloc];
    v22 = [(RAPPlaceCorrectableString *)v21 initWithKind:qword_1015E1AD8 originalValue:&stru_101324E70];
    correctableEmail = v16->_correctableEmail;
    v16->_correctableEmail = v22;

    v24 = sub_100521AB8();
    [(RAPPlaceCorrectableString *)v16->_correctableEmail setValue:v24];

    objc_initWeak(&location, v16);
    v25 = v16->_correctableEmail;
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_10075409C;
    v30 = &unk_1012F7708;
    objc_copyWeak(&v31, &location);
    [(RAPPlaceCorrectableString *)v25 addObserver:v16 changeHandler:&v27];
    if (v16->_emphasis == 5) {
      -[RAPQuestion _setComplete:allowInvokingDidChange:](v16, "_setComplete:allowInvokingDidChange:", 1, 0, v27, v28, v29, v30);
    }
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_setCommentsTitle:(id)a3 placeholderText:(id)a4
{
  id v8 = a4;
  id v6 = (NSString *)[a3 copy];
  commentsTitle = self->_commentsTitle;
  self->_commentsTitle = v6;

  [(RAPCommentQuestion *)self _setPlaceholderText:v8];
}

- (void)_setPlaceholderText:(id)a3
{
  v4 = (NSString *)[a3 copy];
  commentsPlaceholderText = self->_commentsPlaceholderText;
  self->_commentsPlaceholderText = v4;

  [(RAPQuestion *)self _didChange];
}

- (void)_setLocalizedPhotosPickerExplanation:(id)a3
{
  v4 = (NSString *)[a3 copy];
  localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  self->_localizedPhotosPickerExplanation = v4;

  [(RAPQuestion *)self _didChange];
}

+ (unint64_t)maximumCommentLength
{
  return 1000;
}

- (unint64_t)maximumNumberOfPhotos
{
  return 3;
}

- (unint64_t)remainingCharacters
{
  unint64_t v3 = +[RAPCommentQuestion maximumCommentLength];
  return v3 - [(NSString *)self->_comment _rap_charactersCount];
}

+ (id)validatedComment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _rap_charactersCount];
  if (v4 > (id)+[RAPCommentQuestion maximumCommentLength])
  {
    uint64_t v5 = [v3 _rap_substringWithNumberOfCharacters:[RAPCommentQuestion maximumCommentLength]];

    id v3 = (id)v5;
  }

  return v3;
}

- (void)setComment:(id)a3
{
  if (self->_comment != a3)
  {
    +[RAPCommentQuestion validatedComment:](RAPCommentQuestion, "validatedComment:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v4 = [(NSString *)self->_comment _rap_charactersCount];
    id v5 = [v9 _rap_charactersCount];
    id v6 = (NSString *)[v9 copy];
    comment = self->_comment;
    self->_comment = v6;

    BOOL v8 = [(RAPCommentQuestion *)self _isNowComplete];
    if ((id)v4 == v5)
    {
      [(RAPQuestion *)self _setComplete:v8 allowInvokingDidChange:1];
    }
    else
    {
      [(RAPQuestion *)self _setComplete:v8 allowInvokingDidChange:0];
      [(RAPQuestion *)self _didChange];
    }
  }
}

- (void)addPhoto:(id)a3
{
  if (self->_photos)
  {
    id v4 = a3;
    id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:self->_photos];
    [v5 addObject:v4];
    id v6 = +[NSArray arrayWithArray:v5];
    photos = self->_photos;
    self->_photos = v6;
  }
  else
  {
    id v11 = a3;
    id v8 = a3;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    v10 = self->_photos;
    self->_photos = v9;
  }
  [(RAPQuestion *)self _setComplete:[(RAPCommentQuestion *)self _isNowComplete] allowInvokingDidChange:0];
  [(RAPQuestion *)self _didChange];
}

- (void)removePhotoAtIndex:(unint64_t)a3
{
  photos = self->_photos;
  if (photos && [(NSArray *)photos count] > a3)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithArray:self->_photos];
    [v6 removeObjectAtIndex:a3];
    id v7 = +[NSArray arrayWithArray:v6];
    id v8 = self->_photos;
    self->_photos = v7;
  }
  [(RAPQuestion *)self _setComplete:[(RAPCommentQuestion *)self _isNowComplete] allowInvokingDidChange:0];

  [(RAPQuestion *)self _didChange];
}

- (BOOL)removePhotoForIdentifier:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = self;
  id v5 = self->_photos;
  id v6 = (char *)[(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      v10 = 0;
      id v11 = &v8[(void)v7];
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v10) identifier];
        unsigned __int8 v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v11 = &v10[(void)v8];
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      id v7 = (char *)[(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_12:

  NSUInteger v14 = [(NSArray *)v16->_photos count];
  if ((unint64_t)v11 < v14) {
    [(RAPCommentQuestion *)v16 removePhotoAtIndex:v11];
  }

  return (unint64_t)v11 < v14;
}

- (void)removeAllPhotos
{
  photos = self->_photos;
  self->_photos = (NSArray *)&__NSArray0__struct;
}

- (id)photoAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_photos count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_photos objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)setPhotos:(id)a3
{
  if (self->_photos != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    photos = self->_photos;
    self->_photos = v4;

    BOOL v6 = [(RAPCommentQuestion *)self _isNowComplete];
    [(RAPQuestion *)self _setComplete:v6];
  }
}

- (BOOL)canAddPhoto
{
  unint64_t v3 = [(NSArray *)self->_photos count];
  return v3 < [(RAPCommentQuestion *)self maximumNumberOfPhotos];
}

- (BOOL)_isNowComplete
{
  if ([(RAPCommentQuestion *)self shouldShowEmail])
  {
    unint64_t v3 = [(RAPPlaceCorrectableString *)self->_correctableEmail value];
    id v4 = [v3 length];

    if (!v4) {
      return 0;
    }
  }
  id v5 = [(RAPCommentQuestion *)self comment];
  BOOL v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  unint64_t v8 = (unint64_t)[v7 length];
  BOOL v9 = v8 != 0;

  v10 = [(RAPCommentQuestion *)self photos];
  unint64_t v11 = (unint64_t)[v10 count];

  unint64_t v12 = [(RAPCommentQuestion *)self emphasis];
  if (v12 < 2) {
    return (v8 | v11) != 0;
  }
  if (v12 == 4) {
    return v11 != 0;
  }
  if (v12 == 5) {
    return 1;
  }
  return v9;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v13 = a3;
  id v4 = [v13 commonCorrections];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
    [v13 setCommonCorrections:v5];
  }
  BOOL v6 = [(RAPCommentQuestion *)self comment];
  id v7 = [v13 commonCorrections];
  [v7 setComments:v6];

  unint64_t v8 = [v13 commonContext];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v13 setCommonContext:v9];
  }
  if ([(RAPCommentQuestion *)self shouldShowEmail])
  {
    v10 = [(RAPPlaceCorrectableString *)self->_correctableEmail value];
    unint64_t v11 = [(RAPQuestion *)self report];
    [v11 setPreferredEmailAddress:v10];
  }
  unint64_t v12 = [v13 commonContext];
  [v12 addUserPath:10];
}

- (void)_prepareForSubmission
{
  v14.receiver = self;
  v14.super_class = (Class)RAPCommentQuestion;
  [(RAPQuestion *)&v14 _prepareForSubmission];
  if ((id)[(RAPCommentQuestion *)self emphasis] != (id)3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v3 = [(RAPCommentQuestion *)self photos];
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v8 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7) photoType:self->_photoType];
          id v9 = [(RAPQuestion *)self report];
          [v9 addPhotoWithMetadata:v8];

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (NSString)commentsTitle
{
  return self->_commentsTitle;
}

- (NSString)commentsPlaceholderText
{
  return self->_commentsPlaceholderText;
}

- (int64_t)emphasis
{
  return self->_emphasis;
}

- (void)setEmphasis:(int64_t)a3
{
  self->_emphasis = a3;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSArray)photos
{
  return self->_photos;
}

- (int64_t)photoType
{
  return self->_photoType;
}

- (void)setPhotoType:(int64_t)a3
{
  self->_photoType = a3;
}

- (BOOL)shouldShowEmail
{
  return self->_shouldShowEmail;
}

- (void)setShouldShowEmail:(BOOL)a3
{
  self->_shouldShowEmail = a3;
}

- (RAPPlaceCorrectableString)correctableEmail
{
  return self->_correctableEmail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableEmail, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_localizedPhotosPickerExplanation, 0);
  objc_storeStrong((id *)&self->_commentsPlaceholderText, 0);

  objc_storeStrong((id *)&self->_commentsTitle, 0);
}

@end
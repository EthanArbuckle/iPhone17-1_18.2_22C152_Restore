@interface RAPPlacecardImageryQuestion
- (BOOL)isAnonymous;
- (BOOL)isComplete;
- (NSArray)issueItems;
- (NSString)localizedTitle;
- (RAPCommentQuestion)commentQuestion;
- (RAPPlacecardImageryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 supportedIssueItems:(id)a5;
- (id)placeholderText;
- (unint64_t)issueType;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setIssueType:(unint64_t)a3;
@end

@implementation RAPPlacecardImageryQuestion

- (RAPPlacecardImageryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 supportedIssueItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlacecardImageryQuestion;
  v11 = [(RAPQuestion *)&v16 initWithReport:v8 parentQuestion:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_issueItems, a5);
    v13 = [[RAPCommentQuestion alloc] initWithReport:v8 parentQuestion:v9];
    commentQuestion = v12->_commentQuestion;
    v12->_commentQuestion = v13;

    [(RAPCommentQuestion *)v12->_commentQuestion setEmphasis:3];
    [(RAPQuestion *)v12->_commentQuestion addObserver:v12 changeHandler:&stru_101312FA0];
  }

  return v12;
}

- (void)setIssueType:(unint64_t)a3
{
  if (self->_issueType != a3)
  {
    self->_issueType = a3;
    commentQuestion = self->_commentQuestion;
    v5 = [(RAPPlacecardImageryQuestion *)self placeholderText];
    [(RAPCommentQuestion *)commentQuestion _setPlaceholderText:v5];

    [(RAPCommentQuestion *)self->_commentQuestion setShouldShowEmail:(self->_issueType & 0xFFFFFFFFFFFFFFFELL) == 6];
    BOOL v6 = [(RAPPlacecardImageryQuestion *)self isComplete];
    [(RAPQuestion *)self _setComplete:v6 allowInvokingDidChange:1];
  }
}

- (BOOL)isComplete
{
  BOOL result = 0;
  unint64_t issueType = self->_issueType;
  if (issueType <= 8)
  {
    if (((1 << issueType) & 0x13C) != 0)
    {
      return 1;
    }
    else if (((1 << issueType) & 0xC2) != 0)
    {
      return [(RAPQuestion *)self->_commentQuestion isComplete];
    }
  }
  return result;
}

- (id)placeholderText
{
  unint64_t issueType = self->_issueType;
  v3 = &stru_101324E70;
  if (issueType <= 8)
  {
    if (((1 << issueType) & 0x13C) != 0)
    {
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Optional details [RAP]";
    }
    else
    {
      if (((1 << issueType) & 0xC2) == 0) {
        goto LABEL_7;
      }
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Details [RAP]";
    }
    v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];
  }
LABEL_7:

  return v3;
}

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"What's wrong with this photo? [UGC]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (BOOL)isAnonymous
{
  v5.receiver = self;
  v5.super_class = (Class)RAPPlacecardImageryQuestion;
  BOOL v3 = [(RAPQuestion *)&v5 isAnonymous];
  if (v3) {
    LOBYTE(v3) = (self->_issueType & 0xFFFFFFFFFFFFFFFELL) != 6;
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)GEORPPoiImageFeedbackCorrections);
  id v21 = v5;
  if (self->_issueType - 1 < 8) {
    uint64_t issueType_low = LODWORD(self->_issueType);
  }
  else {
    uint64_t issueType_low = 0;
  }
  [v5 setCorrectionType:issueType_low];
  id v7 = objc_alloc_init((Class)GEORPPoiImageFeedbackContext);
  id v8 = [(RAPQuestion *)self _context];
  id v9 = [v8 placecardImageryContext];

  id v10 = [v9 reportedPlace];
  [v7 setPlace:v10];

  id v11 = objc_alloc_init((Class)GEORPFeedbackClientImageInfo);
  v12 = [v9 photoURL];
  [v11 setImageUrl:v12];

  v13 = [v9 photoIdentifier];
  [v11 setProviderImageId:v13];

  [v7 setImageInfo:v11];
  [v4 setType:13];
  id v14 = objc_alloc_init((Class)GEORPFeedbackDetails);
  [v4 setDetails:v14];

  id v15 = objc_alloc_init((Class)GEORPPoiImageFeedback);
  objc_super v16 = [v4 details];
  [v16 setPoiImageFeedback:v15];

  v17 = [v4 details];
  v18 = [v17 poiImageFeedback];
  [v18 setPoiImageCorrections:v21];

  v19 = [v4 details];
  v20 = [v19 poiImageFeedback];
  [v20 setPoiImageContext:v7];

  [(RAPCommentQuestion *)self->_commentQuestion _fillSubmissionParameters:v4];
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (unint64_t)issueType
{
  return self->_issueType;
}

- (NSArray)issueItems
{
  return self->_issueItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueItems, 0);

  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
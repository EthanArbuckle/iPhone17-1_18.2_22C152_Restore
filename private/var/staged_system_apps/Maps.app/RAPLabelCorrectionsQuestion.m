@interface RAPLabelCorrectionsQuestion
- ($C79183323B9A0D5602617FF3BE5395AC)initialLabelMarkerPickingMapRect;
- (BOOL)isComplete;
- (BOOL)isNameCorrectionRequired;
- (NSString)localizedDescription;
- (NSString)localizedLabelMarkerPickingPrompt;
- (NSString)localizedServerControlledDescription;
- (NSString)localizedTitle;
- (NSString)originalName;
- (RAPCommentQuestion)commentQuestion;
- (RAPMapStateProtocol)labelMarkerPickingMapContext;
- (RAPPlaceCorrectableFlag)removeLabelCorrectableFlag;
- (RAPPlaceCorrectableString)correctableName;
- (UIImage)image;
- (VKLabelMarker)labelMarker;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (unint64_t)coordinatePickingMapType;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setCorrectedName:(id)a3;
- (void)setLabelMarker:(id)a3;
- (void)setLabelMarkerPickingMapContext:(id)a3;
- (void)setLocalizedServerControlledDescription:(id)a3;
@end

@implementation RAPLabelCorrectionsQuestion

- (NSString)localizedLabelMarkerPickingPrompt
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Choose a road or place to rename [Report a Problem iOS]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Map Labels [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Map Description [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (UIImage)image
{
  v2 = +[GEOFeatureStyleAttributes addressMarkerStyleAttributes];
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  v4 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v2, 3, 0);

  if (!v4)
  {
    v4 = +[UIImage imageNamed:@"RAPMapErrors"];
  }

  return (UIImage *)v4;
}

- (int)analyticTarget
{
  return 1127;
}

- (int64_t)questionCategory
{
  return 8;
}

- ($C79183323B9A0D5602617FF3BE5395AC)initialLabelMarkerPickingMapRect
{
  v2 = [(RAPQuestion *)self _context];
  double v3 = sub_1005817B0(v2);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (BOOL)isNameCorrectionRequired
{
  return 0;
}

- (NSString)originalName
{
  v2 = [(RAPLabelCorrectionsQuestion *)self labelMarker];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setCorrectedName:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPLabelCorrectionsQuestion *)self correctableName];
  [v5 setValue:v4];
}

- (RAPPlaceCorrectableString)correctableName
{
  correctableName = self->_correctableName;
  if (!correctableName)
  {
    id v4 = [(RAPLabelCorrectionsQuestion *)self labelMarker];
    if (v4)
    {
      id v5 = [(RAPLabelCorrectionsQuestion *)self labelMarker];
      double v6 = [v5 text];
    }
    else
    {
      double v6 = 0;
    }

    double v7 = [[RAPPlaceCorrectableString alloc] initWithKind:0 originalValue:v6];
    double v8 = self->_correctableName;
    self->_correctableName = v7;

    [(RAPPlaceCorrectableString *)self->_correctableName addObserver:self changeHandler:&stru_1012EA768];
    correctableName = self->_correctableName;
  }

  return correctableName;
}

- (RAPPlaceCorrectableFlag)removeLabelCorrectableFlag
{
  removeLabelCorrectableFlag = self->_removeLabelCorrectableFlag;
  if (!removeLabelCorrectableFlag)
  {
    id v4 = [RAPPlaceCorrectableFlag alloc];
    id v5 = [(RAPPlaceCorrectableFlag *)v4 initWithKind:qword_1015E1AD8 originalValue:0];
    double v6 = self->_removeLabelCorrectableFlag;
    self->_removeLabelCorrectableFlag = v5;

    [(RAPPlaceCorrectableFlag *)self->_removeLabelCorrectableFlag addObserver:self changeHandler:&stru_1012EA788];
    removeLabelCorrectableFlag = self->_removeLabelCorrectableFlag;
  }

  return removeLabelCorrectableFlag;
}

- (void)setLabelMarker:(id)a3
{
  id v5 = (VKLabelMarker *)a3;
  if (self->_labelMarker != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_labelMarker, a3);
    correctableName = self->_correctableName;
    self->_correctableName = 0;

    [(RAPQuestion *)self _didChange];
    id v5 = v7;
  }
}

- (void)setLabelMarkerPickingMapContext:(id)a3
{
  id v5 = (RAPMapStateProtocol *)a3;
  if (self->_labelMarkerPickingMapContext != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_labelMarkerPickingMapContext, a3);
    id v5 = v6;
  }
}

- (BOOL)isComplete
{
  uint64_t v3 = [(RAPLabelCorrectionsQuestion *)self labelMarker];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(RAPLabelCorrectionsQuestion *)self labelMarkerPickingMapContext];

    if (v5)
    {
      double v6 = [(RAPLabelCorrectionsQuestion *)self correctableName];
      uint64_t v7 = [v6 value];
      double v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      double v9 = [(id)v7 stringByTrimmingCharactersInSet:v8];
      id v10 = [v9 length];
      LOBYTE(v5) = v10 != 0;

      double v11 = [(RAPLabelCorrectionsQuestion *)self removeLabelCorrectableFlag];
      LOBYTE(v7) = [v11 value];

      if ((v7 & 1) == 0)
      {
        double v12 = [(RAPLabelCorrectionsQuestion *)self correctableName];
        unsigned __int8 v13 = [v12 isEdited];
        if (v10) {
          unsigned __int8 v14 = v13;
        }
        else {
          unsigned __int8 v14 = 0;
        }

        v15 = [(RAPLabelCorrectionsQuestion *)self commentQuestion];
        id v5 = [v15 comment];
        v16 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        v17 = [v5 stringByTrimmingCharactersInSet:v16];
        if ([v17 length])
        {
          BOOL v18 = 1;
        }
        else
        {
          v19 = [(RAPLabelCorrectionsQuestion *)self commentQuestion];
          v20 = [v19 photos];
          BOOL v18 = [v20 count] != 0;
        }
        LOBYTE(v5) = v14 | v18;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v24 = a3;
  id v4 = [v24 commonContext];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [v24 setCommonContext:v5];
  }
  double v6 = [v24 commonContext];
  [v6 addUserPath:6];

  uint64_t v7 = [v24 commonContext];
  [v7 addUserPath:4];

  double v8 = [v24 details];

  if (!v8)
  {
    double v9 = objc_opt_new();
    [v24 setDetails:v9];
  }
  [v24 setType:5];
  id v10 = [v24 details];
  double v11 = [v10 tileFeedback];

  if (!v11)
  {
    double v11 = objc_opt_new();
    double v12 = [v24 details];
    [v12 setTileFeedback:v11];
  }
  id v13 = [v11 label];
  if (!v13)
  {
    id v13 = objc_alloc_init((Class)GEORPCorrectedLabel);
    [v11 setLabel:v13];
  }
  unsigned __int8 v14 = [(RAPLabelCorrectionsQuestion *)self labelMarker];
  [v13 populateWithLabelMarker:v14];

  v15 = [(RAPLabelCorrectionsQuestion *)self correctableName];
  v16 = [v15 originalValue];
  [v13 setOriginalValue:v16];

  v17 = [(RAPLabelCorrectionsQuestion *)self correctableName];
  LODWORD(v16) = [v17 isEdited];

  if (v16)
  {
    BOOL v18 = [(RAPLabelCorrectionsQuestion *)self correctableName];
    v19 = [v18 value];
    [v13 setCorrectedValue:v19];
  }
  v20 = [(RAPLabelCorrectionsQuestion *)self removeLabelCorrectableFlag];
  unsigned int v21 = [v20 value];

  if (v21) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  [v11 setType:v22];
  v23 = [(RAPLabelCorrectionsQuestion *)self commentQuestion];
  [v23 _fillSubmissionParameters:v24];
}

- (RAPCommentQuestion)commentQuestion
{
  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    id v4 = [RAPCommentQuestion alloc];
    id v5 = [(RAPQuestion *)self report];
    double v6 = +[RAPCommentQuestion _localizedOptionalInformationTitle];
    uint64_t v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"Add more information about the incorrect label" value:@"localized string not found" table:0];
    double v9 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:0];
    id v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }

  return commentQuestion;
}

- (unint64_t)coordinatePickingMapType
{
  v2 = [(RAPQuestion *)self _context];
  id v3 = [v2 mapType];

  return (unint64_t)v3;
}

- (int)userAction
{
  return 10116;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (RAPMapStateProtocol)labelMarkerPickingMapContext
{
  return self->_labelMarkerPickingMapContext;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeLabelCorrectableFlag, 0);
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickingMapContext, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);

  objc_storeStrong((id *)&self->_correctableName, 0);
}

@end
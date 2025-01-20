@interface THWReviewInfo
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)questions;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (NSString)reviewID;
- (THWReviewInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6;
- (THWStageGeometry)stageGeometry;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (TSUColor)primaryColor;
- (TSWPParagraphStyle)questionNumberStyle;
- (TSWWidgetStyle)style;
- (double)contentPadding;
- (id)childEnumerator;
- (id)questionAtIndex:(unint64_t)a3;
- (unint64_t)indexOfQuestion:(id)a3;
- (void)addQuestion:(id)a3;
- (void)dealloc;
- (void)setAdornmentInfo:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setQuestionNumberStyle:(id)a3;
- (void)updateWithUniqueID:(id)a3 contentNodeGUID:(id)a4;
@end

@implementation THWReviewInfo

- (THWReviewInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)THWReviewInfo;
  v8 = [(THWReviewInfo *)&v10 initWithContext:a3 geometry:a4];
  if (v8)
  {
    v8->_style = (TSWWidgetStyle *)a5;
    v8->_stageGeometry = (THWStageGeometry *)a6;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewInfo;
  [(THWReviewInfo *)&v3 dealloc];
}

- (void)addQuestion:(id)a3
{
  if (a3)
  {
    questions = self->_questions;
    if (!questions)
    {
      questions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_questions = questions;
    }
    [(NSMutableArray *)questions addObject:a3];
  }
}

- (id)questionAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_questions count] <= a3) {
    return 0;
  }
  questions = self->_questions;

  return [(NSMutableArray *)questions objectAtIndex:a3];
}

- (unint64_t)indexOfQuestion:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_questions indexOfObjectIdenticalTo:a3];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (TSUColor)primaryColor
{
  return 0;
}

- (void)updateWithUniqueID:(id)a3 contentNodeGUID:(id)a4
{
  id v7 = objc_alloc((Class)NSString);
  self->_reviewID = (NSString *)[v7 initWithFormat:@"%@%@:%@", kTHWReviewWidgetInfoIDPrefix, a4, a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_questions;
  id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) setQuestionID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@:%@:%lu", kTHWReviewWidgetInfoQuestionDescriptionIDPrefix, a4, a3, -[NSMutableArray indexOfObjectIdenticalTo:](self->_questions, "indexOfObjectIdenticalTo:", *(void *)(*((void *)&v13 + 1) + 8 * i)))];
      }
      id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_adornmentInfo) {
    [v3 addObject:];
  }

  return [v4 objectEnumerator];
}

- (NSArray)questions
{
  return &self->_questions->super;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

- (TSWPParagraphStyle)questionNumberStyle
{
  return self->_questionNumberStyle;
}

- (void)setQuestionNumberStyle:(id)a3
{
}

- (NSString)reviewID
{
  return self->_reviewID;
}

@end
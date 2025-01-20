@interface TSWReviewQuestionDescription
+ (id)createQuestionDescriptionForQuestionType:(id)a3 withContext:(id)a4;
- (BOOL)questionShuffle;
- (CGSize)questionReferenceContentSizeHint;
- (NSMutableArray)choiceDescriptions;
- (NSString)questionCategoryName;
- (NSString)questionFeedbackIfCorrect;
- (NSString)questionFeedbackIfIncorrect;
- (NSString)questionFeedbackIfPartiallyCorrect;
- (NSString)questionGeneralFeedback;
- (NSString)questionID;
- (NSString)questionPromptAlternateText;
- (NSString)questionReferenceContentAlternateText;
- (NSString)questionReferenceContentType;
- (NSString)questionType;
- (TSPObject)questionReferenceContent;
- (TSWPStorage)questionChoiceNumberStyle;
- (TSWPStorage)questionPrompt;
- (TSWReviewQuestionDescription)initWithContext:(id)a3;
- (id)choiceAtIndex:(unint64_t)a3;
- (int)questionReferenceContentPlacementHint;
- (int64_t)numberOfChoices;
- (int64_t)questionCardinality;
- (int64_t)questionCardinality_original;
- (unint64_t)indexOfChoice:(id)a3;
- (void)addChoice:(id)a3;
- (void)dealloc;
- (void)setChoiceDescriptions:(id)a3;
- (void)setQuestionCardinality:(int64_t)a3;
- (void)setQuestionCategoryName:(id)a3;
- (void)setQuestionChoiceNumberStyle:(id)a3;
- (void)setQuestionFeedbackIfCorrect:(id)a3;
- (void)setQuestionFeedbackIfIncorrect:(id)a3;
- (void)setQuestionFeedbackIfPartiallyCorrect:(id)a3;
- (void)setQuestionGeneralFeedback:(id)a3;
- (void)setQuestionID:(id)a3;
- (void)setQuestionPrompt:(id)a3;
- (void)setQuestionPromptAlternateText:(id)a3;
- (void)setQuestionReferenceContent:(id)a3;
- (void)setQuestionReferenceContentAlternateText:(id)a3;
- (void)setQuestionReferenceContentPlacementHint:(int)a3;
- (void)setQuestionReferenceContentSizeHint:(CGSize)a3;
- (void)setQuestionReferenceContentType:(id)a3;
- (void)setQuestionShuffle:(BOOL)a3;
- (void)setQuestionType:(id)a3;
@end

@implementation TSWReviewQuestionDescription

- (int64_t)questionCardinality_original
{
  return self->mCardinality;
}

- (void)setQuestionCardinality:(int64_t)a3
{
  self->mCardinality = a3;
}

- (NSString)questionCategoryName
{
  return self->mCategoryName;
}

- (void)setQuestionCategoryName:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mCategoryName = (NSString *)a3;
}

- (NSString)questionGeneralFeedback
{
  return self->mGeneralFeedback;
}

- (void)setQuestionGeneralFeedback:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mGeneralFeedback = (NSString *)a3;
}

- (NSString)questionID
{
  return self->mID;
}

- (void)setQuestionID:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mID = (NSString *)a3;
}

- (TSWPStorage)questionPrompt
{
  return self->mPrompt;
}

- (void)setQuestionPrompt:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mPrompt = (TSWPStorage *)a3;
}

- (NSString)questionPromptAlternateText
{
  return self->mPromptAlternateText;
}

- (void)setQuestionPromptAlternateText:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mPromptAlternateText = (NSString *)a3;
}

- (TSPObject)questionReferenceContent
{
  return self->mReferenceContent;
}

- (void)setQuestionReferenceContent:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mReferenceContent = (TSPObject *)a3;
}

- (int)questionReferenceContentPlacementHint
{
  return self->mReferenceContentPlacement;
}

- (void)setQuestionReferenceContentPlacementHint:(int)a3
{
  self->mReferenceContentPlacement = a3;
}

- (CGSize)questionReferenceContentSizeHint
{
  double width = self->mReferenceContentSize.width;
  double height = self->mReferenceContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setQuestionReferenceContentSizeHint:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(TSWReviewQuestionDescription *)self willModify];
  self->mReferenceContentSize.CGFloat width = width;
  self->mReferenceContentSize.CGFloat height = height;
}

- (NSString)questionReferenceContentType
{
  return self->mReferenceContentType;
}

- (void)setQuestionReferenceContentType:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mReferenceContentType = (NSString *)a3;
}

- (NSString)questionReferenceContentAlternateText
{
  return self->mReferenceContentAlternateText;
}

- (void)setQuestionReferenceContentAlternateText:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mReferenceContentAlternateText = (NSString *)a3;
}

- (BOOL)questionShuffle
{
  return self->mShuffle;
}

- (void)setQuestionShuffle:(BOOL)a3
{
  self->mShuffle = a3;
}

- (NSString)questionType
{
  return self->mType;
}

- (void)setQuestionType:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mType = (NSString *)a3;
}

- (NSMutableArray)choiceDescriptions
{
  return self->mChoiceDescriptions;
}

- (void)setChoiceDescriptions:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mChoiceDescriptions = (NSMutableArray *)a3;
}

- (TSWPStorage)questionChoiceNumberStyle
{
  return self->mChoiceNumberStyle;
}

- (void)setQuestionChoiceNumberStyle:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mChoiceNumberStyle = (TSWPStorage *)a3;
}

- (NSString)questionFeedbackIfCorrect
{
  return self->mFeedbackCorrect;
}

- (void)setQuestionFeedbackIfCorrect:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mFeedbackCorrect = (NSString *)a3;
}

- (NSString)questionFeedbackIfPartiallyCorrect
{
  return self->mFeedbackPartial;
}

- (void)setQuestionFeedbackIfPartiallyCorrect:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mFeedbackPartial = (NSString *)a3;
}

- (NSString)questionFeedbackIfIncorrect
{
  return self->mFeedbackIncorrect;
}

- (void)setQuestionFeedbackIfIncorrect:(id)a3
{
  [(TSWReviewQuestionDescription *)self willModify];
  id v5 = a3;

  self->mFeedbackIncorrect = (NSString *)a3;
}

+ (id)createQuestionDescriptionForQuestionType:(id)a3 withContext:(id)a4
{
  if (([a3 isEqualToString:TSWReviewQuestionDescriptionTypeMultiChoiceValue] & 1) == 0
    && ([a3 isEqualToString:TSWReviewQuestionDescriptionTypeMultiChoiceImageValue] & 1) == 0
    && ([a3 isEqualToString:TSWReviewQuestionDescriptionTypeAssociativeTokenValue] & 1) == 0
    && ![a3 isEqualToString:TSWReviewQuestionDescriptionTypeAssociativeImageValue]
    || (v6 = [[TSWReviewQuestionDescription alloc] initWithContext:a4], [(TSWReviewQuestionDescription *)v6 setValue:a3 forKey:TSWReviewQuestionDescriptionTypeKey], !v6))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSWReviewQuestionDescription createQuestionDescriptionForQuestionType:withContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewQuestionDescription.m") lineNumber:106 description:@"Unknown question type: %@", a3];
    return 0;
  }
  return v6;
}

- (TSWReviewQuestionDescription)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWReviewQuestionDescription;
  v3 = [(TSWReviewQuestionDescription *)&v5 initWithContext:a3];
  if (v3) {
    [(TSWReviewQuestionDescription *)v3 setChoiceDescriptions:+[NSMutableArray array]];
  }
  return v3;
}

- (void)addChoice:(id)a3
{
  v4 = [(TSWReviewQuestionDescription *)self choiceDescriptions];

  [(NSMutableArray *)v4 addObject:a3];
}

- (void)dealloc
{
  self->mCategoryName = 0;
  self->mReferenceContent = 0;

  self->mReferenceContentType = 0;
  self->mReferenceContentAlternateText = 0;

  self->mGeneralFeedback = 0;
  self->mID = 0;

  self->mPrompt = 0;
  self->mPromptAlternateText = 0;

  self->mType = 0;
  self->mChoiceDescriptions = 0;

  self->mChoiceNumberStyle = 0;
  self->mFeedbackCorrect = 0;

  self->mFeedbackPartial = 0;
  self->mFeedbackIncorrect = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewQuestionDescription;
  [(TSWReviewQuestionDescription *)&v3 dealloc];
}

- (id)choiceAtIndex:(unint64_t)a3
{
  v4 = [(TSWReviewQuestionDescription *)self choiceDescriptions];

  return [(NSMutableArray *)v4 objectAtIndex:a3];
}

- (unint64_t)indexOfChoice:(id)a3
{
  v4 = [(TSWReviewQuestionDescription *)self choiceDescriptions];

  return (unint64_t)[(NSMutableArray *)v4 indexOfObjectIdenticalTo:a3];
}

- (int64_t)numberOfChoices
{
  v2 = [(TSWReviewQuestionDescription *)self choiceDescriptions];

  return (int64_t)[(NSMutableArray *)v2 count];
}

- (int64_t)questionCardinality
{
  if (![(TSWReviewQuestionDescription *)self questionCardinality_original])
  {
    objc_super v3 = [(TSWReviewQuestionDescription *)self questionType];
    if (v3 == TSWReviewQuestionDescriptionTypeAssociativeTokenValue
      || (v4 = [(TSWReviewQuestionDescription *)self questionType],
          v4 == TSWReviewQuestionDescriptionTypeAssociativeImageValue))
    {
      v7 = +[NSNumber numberWithInteger:3];
      [(TSWReviewQuestionDescription *)self setValue:v7 forKey:TSWReviewQuestionDescriptionCardinalityKey];
    }
    else
    {
      objc_super v5 = [(TSWReviewQuestionDescription *)self questionType];
      if (v5 == TSWReviewQuestionDescriptionTypeMultiChoiceValue
        || (v6 = [(TSWReviewQuestionDescription *)self questionType],
            v6 == TSWReviewQuestionDescriptionTypeMultiChoiceImageValue))
      {
        v10[0] = 0;
        v10[1] = v10;
        v10[2] = 0x2020000000;
        v10[3] = 0;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1DEEC0;
        v9[3] = &unk_45B2D0;
        v9[4] = self;
        v9[5] = v10;
        [(NSMutableArray *)[(TSWReviewQuestionDescription *)self choiceDescriptions] enumerateObjectsUsingBlock:v9];
        _Block_object_dispose(v10, 8);
      }
    }
  }
  return [(TSWReviewQuestionDescription *)self questionCardinality_original];
}

@end
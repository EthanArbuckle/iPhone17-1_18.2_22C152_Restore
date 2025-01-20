@interface TSWReviewChoiceDescription
+ (id)createChoiceDescriptionForQuestionType:(id)a3 withContext:(id)a4;
- (BOOL)choiceFixed;
- (NSString)choiceAlternateText;
- (NSString)choiceContentType;
- (NSString)choiceFeedback;
- (NSString)choiceTargetAlternateText;
- (TSDBezierPath)choiceTargetRegion;
- (TSPObject)choiceContent;
- (TSWReviewChoiceDescription)initWithContext:(id)a3;
- (float)choiceFraction;
- (int)choicePlacardPlacementHint;
- (void)dealloc;
- (void)setChoiceAlternateText:(id)a3;
- (void)setChoiceContent:(id)a3;
- (void)setChoiceContentType:(id)a3;
- (void)setChoiceFeedback:(id)a3;
- (void)setChoiceFixed:(BOOL)a3;
- (void)setChoiceFraction:(float)a3;
- (void)setChoicePlacardPlacementHint:(int)a3;
- (void)setChoiceTargetAlternateText:(id)a3;
- (void)setChoiceTargetRegion:(id)a3;
@end

@implementation TSWReviewChoiceDescription

- (NSString)choiceAlternateText
{
  return self->mAlternateText;
}

- (void)setChoiceAlternateText:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mAlternateText = (NSString *)a3;
}

- (NSString)choiceTargetAlternateText
{
  return self->mTargetAlternateText;
}

- (void)setChoiceTargetAlternateText:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mTargetAlternateText = (NSString *)a3;
}

- (NSString)choiceFeedback
{
  return self->mFeedback;
}

- (void)setChoiceFeedback:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mFeedback = (NSString *)a3;
}

- (BOOL)choiceFixed
{
  return self->mFixed;
}

- (void)setChoiceFixed:(BOOL)a3
{
  self->mFixed = a3;
}

- (float)choiceFraction
{
  return self->mFraction;
}

- (void)setChoiceFraction:(float)a3
{
  self->mFraction = a3;
}

- (TSPObject)choiceContent
{
  return self->mContent;
}

- (void)setChoiceContent:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mContent = (TSPObject *)a3;
}

- (NSString)choiceContentType
{
  return self->mContentType;
}

- (void)setChoiceContentType:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mContentType = (NSString *)a3;
}

- (int)choicePlacardPlacementHint
{
  return self->mPlacardPlacementHint;
}

- (void)setChoicePlacardPlacementHint:(int)a3
{
  self->mPlacardPlacementHint = a3;
}

- (TSDBezierPath)choiceTargetRegion
{
  return self->mTargetRegion;
}

- (void)setChoiceTargetRegion:(id)a3
{
  [(TSWReviewChoiceDescription *)self willModify];
  id v5 = a3;

  self->mTargetRegion = (TSDBezierPath *)a3;
}

- (TSWReviewChoiceDescription)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWReviewChoiceDescription;
  return [(TSWReviewChoiceDescription *)&v4 initWithContext:a3];
}

+ (id)createChoiceDescriptionForQuestionType:(id)a3 withContext:(id)a4
{
  if (([a3 isEqualToString:TSWReviewQuestionDescriptionTypeMultiChoiceValue] & 1) == 0
    && ([a3 isEqualToString:TSWReviewQuestionDescriptionTypeMultiChoiceImageValue] & 1) == 0
    && ([a3 isEqualToString:TSWReviewQuestionDescriptionTypeAssociativeTokenValue] & 1) == 0
    && ![a3 isEqualToString:TSWReviewQuestionDescriptionTypeAssociativeImageValue]
    || (id result = [[TSWReviewChoiceDescription alloc] initWithContext:a4]) == 0)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSWReviewChoiceDescription createChoiceDescriptionForQuestionType:withContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewChoiceDescription.m") lineNumber:84 description:@"Unknown question type: %@", a3];
    return 0;
  }
  return result;
}

- (void)dealloc
{
  self->mAlternateText = 0;
  self->mTargetAlternateText = 0;

  self->mFeedback = 0;
  self->mContent = 0;

  self->mContentType = 0;
  self->mTargetRegion = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewChoiceDescription;
  [(TSWReviewChoiceDescription *)&v3 dealloc];
}

@end
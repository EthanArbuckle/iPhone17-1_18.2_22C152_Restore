@interface TSWReviewDescription
- (NSMutableArray)questionDescriptions;
- (TSWPStorage)reviewQuestionNumberStyle;
- (TSWReviewDescription)initWithContext:(id)a3;
- (id)questionAtIndex:(unint64_t)a3;
- (int64_t)numberOfQuestions;
- (unint64_t)indexOfQuestion:(id)a3;
- (void)addQuestion:(id)a3;
- (void)dealloc;
- (void)setQuestionDescriptions:(id)a3;
- (void)setReviewQuestionNumberStyle:(id)a3;
@end

@implementation TSWReviewDescription

- (NSMutableArray)questionDescriptions
{
  return self->mQuestionDescriptions;
}

- (void)setQuestionDescriptions:(id)a3
{
  [(TSWReviewDescription *)self willModify];
  id v5 = a3;

  self->mQuestionDescriptions = (NSMutableArray *)a3;
}

- (TSWPStorage)reviewQuestionNumberStyle
{
  return self->mQuestionNumberStyle;
}

- (void)setReviewQuestionNumberStyle:(id)a3
{
  [(TSWReviewDescription *)self willModify];
  id v5 = a3;

  self->mQuestionNumberStyle = (TSWPStorage *)a3;
}

- (TSWReviewDescription)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWReviewDescription;
  v3 = [(TSWReviewDescription *)&v5 initWithContext:a3];
  if (v3) {
    [(TSWReviewDescription *)v3 setQuestionDescriptions:+[NSMutableArray array]];
  }
  return v3;
}

- (void)dealloc
{
  self->mQuestionDescriptions = 0;
  self->mQuestionNumberStyle = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewDescription;
  [(TSWReviewDescription *)&v3 dealloc];
}

- (void)addQuestion:(id)a3
{
  v4 = [(TSWReviewDescription *)self questionDescriptions];

  [(NSMutableArray *)v4 addObject:a3];
}

- (id)questionAtIndex:(unint64_t)a3
{
  v4 = [(TSWReviewDescription *)self questionDescriptions];

  return [(NSMutableArray *)v4 objectAtIndex:a3];
}

- (unint64_t)indexOfQuestion:(id)a3
{
  v4 = [(TSWReviewDescription *)self questionDescriptions];

  return (unint64_t)[(NSMutableArray *)v4 indexOfObjectIdenticalTo:a3];
}

- (int64_t)numberOfQuestions
{
  v2 = [(TSWReviewDescription *)self questionDescriptions];

  return (int64_t)[(NSMutableArray *)v2 count];
}

@end
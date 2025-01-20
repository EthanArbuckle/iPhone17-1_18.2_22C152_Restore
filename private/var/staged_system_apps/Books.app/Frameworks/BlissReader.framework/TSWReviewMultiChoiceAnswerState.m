@interface TSWReviewMultiChoiceAnswerState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUserSelected;
- (NSIndexSet)selectedChoices;
- (TSWReviewMultiChoiceAnswerState)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedChoices:(id)a3;
@end

@implementation TSWReviewMultiChoiceAnswerState

- (void)dealloc
{
  self->mSelectedChoices = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  [(TSWReviewMultiChoiceAnswerState *)&v3 dealloc];
}

- (TSWReviewMultiChoiceAnswerState)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v6, "initWithCoder:");
  if (v4) {
    v4->mSelectedChoices = (NSIndexSet *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"TSWReviewAnswerStateSelectedChoices"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  [a3 encodeObject:self->mSelectedChoices forKey:@"TSWReviewAnswerStateSelectedChoices"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSIndexSet)selectedChoices
{
  result = self->mSelectedChoices;
  if (!result)
  {
    result = (NSIndexSet *)objc_alloc_init((Class)NSIndexSet);
    self->mSelectedChoices = result;
  }
  return result;
}

- (BOOL)hasUserSelected
{
  return [(NSIndexSet *)self->mSelectedChoices count] != 0;
}

- (void)setSelectedChoices:(id)a3
{
}

@end
@interface TSWReviewAnswerState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUserSelected;
- (TSWReviewAnswerState)init;
- (TSWReviewAnswerState)initWithCoder:(id)a3;
@end

@implementation TSWReviewAnswerState

- (TSWReviewAnswerState)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewAnswerState;
  result = [(TSWReviewAnswerState *)&v3 init];
  if (result) {
    result->mVersion = 0;
  }
  return result;
}

- (TSWReviewAnswerState)initWithCoder:(id)a3
{
  v4 = [(TSWReviewAnswerState *)self init];
  if (v4 && [a3 containsValueForKey:@"TSWReviewAnswerStateVersion"]) {
    v4->mVersion = (unint64_t)objc_msgSend(objc_msgSend(a3, "valueForKey:", @"TSWReviewAnswerStateVersion"), "unsignedIntegerValue");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasUserSelected
{
  return 0;
}

@end
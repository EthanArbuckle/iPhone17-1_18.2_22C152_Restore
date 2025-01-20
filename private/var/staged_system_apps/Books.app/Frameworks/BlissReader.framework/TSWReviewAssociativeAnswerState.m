@interface TSWReviewAssociativeAnswerState
+ (BOOL)supportsSecureCoding;
- (TSWReviewAssociativeAnswerState)initWithCoder:(id)a3;
- (id)choicesForTargetIndex:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChoices:(id)a3 forTargetIndex:(unint64_t)a4;
@end

@implementation TSWReviewAssociativeAnswerState

- (void)dealloc
{
  self->mChoicesForTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewAssociativeAnswerState;
  [(TSWReviewAssociativeAnswerState *)&v3 dealloc];
}

- (TSWReviewAssociativeAnswerState)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSWReviewAssociativeAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v8, "initWithCoder:");
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v4->mChoicesForTarget = (NSMutableDictionary *)[a3 decodeObjectOfClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0) forKey:@"TSWReviewAnswerStateChoicesForTarget"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWReviewAssociativeAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  [a3 encodeObject:self->mChoicesForTarget forKey:@"TSWReviewAnswerStateChoicesForTarget"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)choicesForTargetIndex:(unint64_t)a3
{
  mChoicesForTarget = self->mChoicesForTarget;
  if (!mChoicesForTarget)
  {
    mChoicesForTarget = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mChoicesForTarget = mChoicesForTarget;
  }
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:a3];

  return [(NSMutableDictionary *)mChoicesForTarget objectForKey:v6];
}

- (void)setChoices:(id)a3 forTargetIndex:(unint64_t)a4
{
  mChoicesForTarget = self->mChoicesForTarget;
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:a4];

  [(NSMutableDictionary *)mChoicesForTarget setObject:a3 forKey:v6];
}

@end
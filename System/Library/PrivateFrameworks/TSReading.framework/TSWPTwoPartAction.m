@interface TSWPTwoPartAction
+ (id)actionWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5;
- (BOOL)performImmediately;
- (TSWPTwoPartAction)initWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)performFinishAction;
- (void)performStartAction;
- (void)setPerformImmediately:(BOOL)a3;
@end

@implementation TSWPTwoPartAction

- (TSWPTwoPartAction)initWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPTwoPartAction;
  v8 = [(TSWPTwoPartAction *)&v10 init];
  if (v8)
  {
    v8->_startAction = (id)[a3 copy];
    v8->_cancelAction = (id)[a4 copy];
    v8->_finishAction = (id)[a5 copy];
  }
  return v8;
}

+ (id)actionWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartAction:a3 cancelAction:a4 finishAction:a5];

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTwoPartAction;
  [(TSWPTwoPartAction *)&v3 dealloc];
}

- (void)performStartAction
{
}

- (void)performFinishAction
{
}

- (void)cancel
{
}

- (BOOL)performImmediately
{
  return self->_performImmediately;
}

- (void)setPerformImmediately:(BOOL)a3
{
  self->_performImmediately = a3;
}

@end
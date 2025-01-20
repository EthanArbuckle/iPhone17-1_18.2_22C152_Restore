@interface CSDConversationLeaveContext
+ (id)greenTeaLeaveContext;
- (CSDConversationLeaveContext)initWithLeaveReason:(unint64_t)a3;
- (id)description;
- (unint64_t)leaveReason;
- (void)setLeaveReason:(unint64_t)a3;
@end

@implementation CSDConversationLeaveContext

- (CSDConversationLeaveContext)initWithLeaveReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSDConversationLeaveContext;
  result = [(CSDConversationLeaveContext *)&v5 init];
  if (result) {
    result->_leaveReason = a3;
  }
  return result;
}

+ (id)greenTeaLeaveContext
{
  v2 = [[CSDConversationLeaveContext alloc] initWithLeaveReason:2];

  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector("leaveReason");
  [v3 appendFormat:@"%@=%lu", v4, -[CSDConversationLeaveContext leaveReason](self, "leaveReason")];

  [v3 appendFormat:@">"];
  id v5 = [v3 copy];

  return v5;
}

- (unint64_t)leaveReason
{
  return self->_leaveReason;
}

- (void)setLeaveReason:(unint64_t)a3
{
  self->_leaveReason = a3;
}

@end
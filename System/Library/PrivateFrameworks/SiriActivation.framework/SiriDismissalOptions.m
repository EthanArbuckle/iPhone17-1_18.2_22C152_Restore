@interface SiriDismissalOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)animated;
- (BOOL)shouldTurnScreenOff;
- (SiriDismissalOptions)initWithCoder:(id)a3;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 dismissalReason:(int64_t)a5;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6;
- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6 shouldTurnScreenOff:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dismissalReason;
- (int64_t)reason;
- (unint64_t)deactivationOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriDismissalOptions

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3
{
  return [(SiriDismissalOptions *)self initWithDeactivationOptions:a3 animated:1 requestCancellationReason:0];
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4
{
  return [(SiriDismissalOptions *)self initWithDeactivationOptions:a3 animated:a4 requestCancellationReason:0];
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 dismissalReason:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t CancellationReason = SASDismissalReasonGetCancellationReason(a5);
  return [(SiriDismissalOptions *)self initWithDeactivationOptions:a3 animated:v6 requestCancellationReason:CancellationReason dismissalReason:a5 shouldTurnScreenOff:0];
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5
{
  return [(SiriDismissalOptions *)self initWithDeactivationOptions:a3 animated:a4 requestCancellationReason:a5 dismissalReason:0 shouldTurnScreenOff:0];
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6
{
  return [(SiriDismissalOptions *)self initWithDeactivationOptions:a3 animated:a4 requestCancellationReason:a5 dismissalReason:a6 shouldTurnScreenOff:0];
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6 shouldTurnScreenOff:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SiriDismissalOptions;
  result = [(SiriDismissalOptions *)&v13 init];
  if (result)
  {
    result->_animated = a4;
    result->_deactivationOptions = a3;
    result->_reason = a5;
    result->_dismissalReason = a6;
    result->_shouldTurnScreenOff = a7;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(SiriDismissalOptions *)self deactivationOptions];
  [(SiriDismissalOptions *)self animated];
  v5 = NSStringFromBOOL();
  int64_t v6 = [(SiriDismissalOptions *)self reason];
  v7 = SASDismissalReasonGetName([(SiriDismissalOptions *)self dismissalReason]);
  [(SiriDismissalOptions *)self shouldTurnScreenOff];
  v8 = NSStringFromBOOL();
  v9 = [v3 stringWithFormat:@"deactivationOptions:%lu, animated:%@, request cancellation reason %ld, dismissal reason %@, shouldTurnScreenOff %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [SiriDismissalOptions alloc];
  BOOL animated = self->_animated;
  unint64_t deactivationOptions = self->_deactivationOptions;
  int64_t reason = self->_reason;
  int64_t dismissalReason = self->_dismissalReason;
  BOOL shouldTurnScreenOff = self->_shouldTurnScreenOff;
  return [(SiriDismissalOptions *)v4 initWithDeactivationOptions:deactivationOptions animated:animated requestCancellationReason:reason dismissalReason:dismissalReason shouldTurnScreenOff:shouldTurnScreenOff];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriDismissalOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriDismissalOptions;
  v5 = [(SiriDismissalOptions *)&v7 init];
  if (v5)
  {
    v5->_unint64_t deactivationOptions = [v4 decodeIntegerForKey:@"deactivationOptions"];
    v5->_BOOL animated = [v4 decodeBoolForKey:@"animated"];
    v5->_int64_t reason = [v4 decodeIntegerForKey:@"requestCancellationReason"];
    v5->_int64_t dismissalReason = [v4 decodeIntegerForKey:@"dismissalReason"];
    v5->_BOOL shouldTurnScreenOff = [v4 decodeBoolForKey:@"shouldTurnScreenOff"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions deactivationOptions](self, "deactivationOptions"), @"deactivationOptions");
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriDismissalOptions animated](self, "animated"), @"animated");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions reason](self, "reason"), @"requestCancellationReason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions dismissalReason](self, "dismissalReason"), @"dismissalReason");
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriDismissalOptions shouldTurnScreenOff](self, "shouldTurnScreenOff"), @"shouldTurnScreenOff");
}

- (unint64_t)deactivationOptions
{
  return self->_deactivationOptions;
}

- (BOOL)animated
{
  return self->_animated;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)shouldTurnScreenOff
{
  return self->_shouldTurnScreenOff;
}

@end
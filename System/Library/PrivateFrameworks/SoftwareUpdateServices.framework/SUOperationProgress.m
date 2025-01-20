@interface SUOperationProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isDone;
- (NSString)phase;
- (SUOperationProgress)initWithCoder:(id)a3;
- (double)timeRemaining;
- (float)normalizedPercentComplete;
- (float)percentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setNormalizedPercentComplete:(float)a3;
- (void)setPercentComplete:(float)a3;
- (void)setPhase:(id)a3;
- (void)setTimeRemaining:(double)a3;
@end

@implementation SUOperationProgress

- (SUOperationProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUOperationProgress *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    [(SUOperationProgress *)v5 setPhase:v6];

    [v4 decodeFloatForKey:@"percentComplete"];
    -[SUOperationProgress setPercentComplete:](v5, "setPercentComplete:");
    [v4 decodeFloatForKey:@"normalizedPercentComplete"];
    -[SUOperationProgress setNormalizedPercentComplete:](v5, "setNormalizedPercentComplete:");
    [v4 decodeDoubleForKey:@"timeRemaining"];
    -[SUOperationProgress setTimeRemaining:](v5, "setTimeRemaining:");
    -[SUOperationProgress setIsDone:](v5, "setIsDone:", [v4 decodeBoolForKey:@"isDone"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SUOperationProgress *)self phase];
  [v5 encodeObject:v4 forKey:@"phase"];

  [(SUOperationProgress *)self percentComplete];
  objc_msgSend(v5, "encodeFloat:forKey:", @"percentComplete");
  [(SUOperationProgress *)self normalizedPercentComplete];
  objc_msgSend(v5, "encodeFloat:forKey:", @"normalizedPercentComplete");
  [(SUOperationProgress *)self timeRemaining];
  objc_msgSend(v5, "encodeDouble:forKey:", @"timeRemaining");
  objc_msgSend(v5, "encodeBool:forKey:", -[SUOperationProgress isDone](self, "isDone"), @"isDone");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(SUOperationProgress *)self phase];
  [v4 setPhase:v5];

  [(SUOperationProgress *)self percentComplete];
  objc_msgSend(v4, "setPercentComplete:");
  [(SUOperationProgress *)self normalizedPercentComplete];
  objc_msgSend(v4, "setNormalizedPercentComplete:");
  [(SUOperationProgress *)self timeRemaining];
  objc_msgSend(v4, "setTimeRemaining:");
  objc_msgSend(v4, "setIsDone:", -[SUOperationProgress isDone](self, "isDone"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUOperationProgress *)self phase];
  id v5 = (void *)MEMORY[0x263F08A30];
  v6 = NSNumber;
  [(SUOperationProgress *)self percentComplete];
  v7 = objc_msgSend(v6, "numberWithFloat:");
  v8 = [v5 localizedStringFromNumber:v7 numberStyle:1];
  v9 = (void *)MEMORY[0x263F08A30];
  v10 = NSNumber;
  [(SUOperationProgress *)self normalizedPercentComplete];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  v12 = [v9 localizedStringFromNumber:v11 numberStyle:1];
  v13 = (void *)MEMORY[0x263F08A30];
  v14 = NSNumber;
  [(SUOperationProgress *)self timeRemaining];
  *(float *)&double v15 = v15;
  v16 = [v14 numberWithFloat:v15];
  v17 = [v13 localizedStringFromNumber:v16 numberStyle:1];
  v18 = [v3 stringWithFormat:@"\n            \tPhase: %@\n            \tPercentComplete: %@\n            \tNormalizedPercentComplete: %@\n            \tTimeRemaining: %@", v4, v8, v12, v17];

  return v18;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (float)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(float)a3
{
  self->_percentComplete = a3;
}

- (float)normalizedPercentComplete
{
  return self->_normalizedPercentComplete;
}

- (void)setNormalizedPercentComplete:(float)a3
{
  self->_normalizedPercentComplete = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (void).cxx_destruct
{
}

@end
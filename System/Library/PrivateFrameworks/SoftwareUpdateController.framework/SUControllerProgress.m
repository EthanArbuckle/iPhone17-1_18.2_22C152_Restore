@interface SUControllerProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isDone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7 isStalled:(BOOL)a8;
- (NSString)actionText;
- (NSString)phase;
- (SUControllerProgress)init;
- (SUControllerProgress)initWithCoder:(id)a3;
- (SUControllerProgress)initWithPhase:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6;
- (double)estimatedTimeRemaining;
- (float)portionComplete;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionText:(id)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setPhase:(id)a3;
- (void)setPortionComplete:(float)a3;
@end

@implementation SUControllerProgress

- (SUControllerProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUControllerProgress;
  v2 = [(SUControllerProgress *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [[NSString alloc] initWithFormat:@"%@", @"None"];
    phase = v2->_phase;
    v2->_phase = (NSString *)v3;

    v2->_portionComplete = -1.0;
    v2->_isDone = 0;
    actionText = v2->_actionText;
    v2->_estimatedTimeRemaining = -1.0;
    v2->_actionText = 0;

    v2->_isStalled = 0;
  }
  return v2;
}

- (SUControllerProgress)initWithPhase:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUControllerProgress;
  v11 = [(SUControllerProgress *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [[NSString alloc] initWithFormat:@"%@", v10];
    phase = v11->_phase;
    v11->_phase = (NSString *)v12;

    v11->_portionComplete = a4;
    v11->_estimatedTimeRemaining = a5;
    v11->_isDone = a6;
  }

  return v11;
}

- (SUControllerProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUControllerProgress;
  v5 = [(SUControllerProgress *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    phase = v5->_phase;
    v5->_phase = (NSString *)v6;

    [v4 decodeFloatForKey:@"portionComplete"];
    v5->_portionComplete = v8;
    [v4 decodeFloatForKey:@"estimatedTimeRemaining"];
    v5->_estimatedTimeRemaining = v9;
    v5->_isDone = [v4 decodeBoolForKey:@"isDone"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionText"];
    actionText = v5->_actionText;
    v5->_actionText = (NSString *)v10;

    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(SUControllerProgress *)self phase];
  [v7 encodeObject:v4 forKey:@"phase"];

  [(SUControllerProgress *)self portionComplete];
  objc_msgSend(v7, "encodeFloat:forKey:", @"portionComplete");
  [(SUControllerProgress *)self estimatedTimeRemaining];
  *(float *)&double v5 = v5;
  [v7 encodeFloat:@"estimatedTimeRemaining" forKey:v5];
  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isDone](self, "isDone"), @"isDone");
  uint64_t v6 = [(SUControllerProgress *)self actionText];
  [v7 encodeObject:v6 forKey:@"actionText"];

  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isStalled](self, "isStalled"), @"isStalled");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = [(SUControllerProgress *)self phase];
  int v12 = [v10 isEqualToString:v11];

  if (v12
    && ([(SUControllerProgress *)self portionComplete], v13 == a4)
    && ([(SUControllerProgress *)self estimatedTimeRemaining], v14 == a5))
  {
    int v15 = [(SUControllerProgress *)self isDone] ^ v6 ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a3;
  double v14 = [(SUControllerProgress *)self phase];
  int v15 = [v13 isEqualToString:v14];

  if (v15
    && ([(SUControllerProgress *)self portionComplete], v16 == a4)
    && ([(SUControllerProgress *)self estimatedTimeRemaining], v17 == a5)
    && [(SUControllerProgress *)self isDone] == v7)
  {
    char v18 = [v12 isEqualToString:v12];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7 isStalled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = a3;
  float v16 = [(SUControllerProgress *)self phase];
  int v17 = [v15 isEqualToString:v16];

  if (v17
    && ([(SUControllerProgress *)self portionComplete], v18 == a4)
    && ([(SUControllerProgress *)self estimatedTimeRemaining], v19 == a5)
    && [(SUControllerProgress *)self isDone] == v9
    && [(SUControllerProgress *)self isStalled] == v8)
  {
    char v20 = [v14 isEqualToString:v14];
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  uint64_t v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUControllerProgress *)a3;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      BOOL v6 = [(SUControllerProgress *)v5 phase];
      BOOL v7 = [(SUControllerProgress *)self phase];
      if (![v6 isEqualToString:v7]) {
        goto LABEL_8;
      }
      [(SUControllerProgress *)v5 portionComplete];
      float v9 = v8;
      [(SUControllerProgress *)self portionComplete];
      if (v9 != v10) {
        goto LABEL_8;
      }
      [(SUControllerProgress *)v5 estimatedTimeRemaining];
      double v12 = v11;
      [(SUControllerProgress *)self estimatedTimeRemaining];
      if (v12 == v13
        && (BOOL v14 = [(SUControllerProgress *)v5 isDone], v14 == [(SUControllerProgress *)self isDone])
        && (BOOL v15 = [(SUControllerProgress *)v5 isStalled],
            v15 == [(SUControllerProgress *)self isStalled]))
      {
        float v18 = [(SUControllerProgress *)v5 actionText];
        double v19 = [(SUControllerProgress *)self actionText];
        char v16 = [v18 isEqualToString:v19];
      }
      else
      {
LABEL_8:
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  uint64_t v3 = [(SUControllerProgress *)self actionText];

  id v4 = NSString;
  double v5 = [(SUControllerProgress *)self phase];
  [(SUControllerProgress *)self portionComplete];
  double v7 = v6;
  [(SUControllerProgress *)self estimatedTimeRemaining];
  uint64_t v9 = v8;
  float v10 = @"NO";
  if ([(SUControllerProgress *)self isDone]) {
    double v11 = @"YES";
  }
  else {
    double v11 = @"NO";
  }
  if ([(SUControllerProgress *)self isStalled]) {
    float v10 = @"YES";
  }
  if (v3)
  {
    double v12 = [(SUControllerProgress *)self actionText];
    double v13 = [v4 stringWithFormat:@"Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@\nActionText: %@", v5, *(void *)&v7, v9, v11, v10, v12];
  }
  else
  {
    double v13 = [v4 stringWithFormat:@"Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@", v5, *(void *)&v7, v9, v11, v10];
  }

  return v13;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionText, 0);

  objc_storeStrong((id *)&self->_phase, 0);
}

@end
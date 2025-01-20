@interface SUCoreProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)disableVerboseLogging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6;
- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6 actionText:(id)a7;
- (NSString)actionText;
- (NSString)phase;
- (NSString)taskDescription;
- (SUCoreProgress)initWithCoder:(id)a3;
- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6;
- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6 actionText:(id)a7;
- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8;
- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 actionText:(id)a9 taskDescription:(id)a10;
- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 taskDescription:(id)a9;
- (double)estimatedTimeRemaining;
- (float)portionComplete;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)totalExpectedBytes;
- (int64_t)totalWrittenBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setActionText:(id)a3;
- (void)setDisableVerboseLogging:(BOOL)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setPhase:(id)a3;
- (void)setPortionComplete:(float)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTotalExpectedBytes:(int64_t)a3;
- (void)setTotalWrittenBytes:(int64_t)a3;
@end

@implementation SUCoreProgress

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, 0, 0, 0, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6 actionText:(id)a7
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, 0, 0, a7, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, a6, a7, 0, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 taskDescription:(id)a9
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, a6, a7, 0, a9);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 actionText:(id)a9 taskDescription:(id)a10
{
  id v19 = a3;
  id v20 = a9;
  id v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SUCoreProgress;
  v22 = [(SUCoreProgress *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_phase, a3);
    v23->_isStalled = a4;
    v23->_portionComplete = a5;
    v23->_totalWrittenBytes = a6;
    v23->_totalExpectedBytes = a7;
    v23->_estimatedTimeRemaining = a8;
    objc_storeStrong((id *)&v23->_actionText, a9);
    v23->_disableVerboseLogging = 0;
    objc_storeStrong((id *)&v23->_taskDescription, a10);
  }

  return v23;
}

- (SUCoreProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUCoreProgress;
  v5 = [(SUCoreProgress *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    phase = v5->_phase;
    v5->_phase = (NSString *)v6;

    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
    [v4 decodeFloatForKey:@"portionComplete"];
    v5->_portionComplete = v8;
    v5->_totalWrittenBytes = [v4 decodeInt64ForKey:@"totalWrittenBytes"];
    v5->_totalExpectedBytes = [v4 decodeInt64ForKey:@"totalExpectedBytes"];
    [v4 decodeFloatForKey:@"estimatedTimeRemaining"];
    v5->_estimatedTimeRemaining = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionText"];
    actionText = v5->_actionText;
    v5->_actionText = (NSString *)v10;

    v5->_disableVerboseLogging = [v4 decodeBoolForKey:@"disableVerboseLogging"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskDescription"];
    taskDescription = v5->_taskDescription;
    v5->_taskDescription = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUCoreProgress *)self phase];
  [v4 encodeObject:v5 forKey:@"phase"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreProgress isStalled](self, "isStalled"), @"isStalled");
  [(SUCoreProgress *)self portionComplete];
  objc_msgSend(v4, "encodeFloat:forKey:", @"portionComplete");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes"), @"totalWrittenBytes");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"), @"totalExpectedBytes");
  [(SUCoreProgress *)self estimatedTimeRemaining];
  *(float *)&double v6 = v6;
  [v4 encodeFloat:@"estimatedTimeRemaining" forKey:v6];
  v7 = [(SUCoreProgress *)self actionText];
  [v4 encodeObject:v7 forKey:@"actionText"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreProgress disableVerboseLogging](self, "disableVerboseLogging"), @"disableVerboseLogging");
  id v8 = [(SUCoreProgress *)self taskDescription];
  [v4 encodeObject:v8 forKey:@"taskDescription"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v11 = [(SUCoreProgress *)self phase];
  BOOL v12 = +[SUCore stringIsEqual:v10 to:v11];

  if (v12
    && [(SUCoreProgress *)self isStalled] == v8
    && ([(SUCoreProgress *)self portionComplete], v13 == a5))
  {
    [(SUCoreProgress *)self estimatedTimeRemaining];
    BOOL v15 = v14 == a6;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6 actionText:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  double v14 = [(SUCoreProgress *)self phase];
  BOOL v15 = +[SUCore stringIsEqual:v13 to:v14];

  if (v15
    && [(SUCoreProgress *)self isStalled] == v9
    && ([(SUCoreProgress *)self portionComplete], v16 == a5)
    && ([(SUCoreProgress *)self estimatedTimeRemaining], v17 == a6))
  {
    v18 = [(SUCoreProgress *)self actionText];
    BOOL v19 = +[SUCore stringIsEqual:v12 to:v18];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)copy
{
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreProgress *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double v6 = [(SUCoreProgress *)self phase];
      v7 = [(SUCoreProgress *)v5 phase];
      if (!+[SUCore stringIsEqual:v6 to:v7]) {
        goto LABEL_13;
      }
      BOOL v8 = [(SUCoreProgress *)v5 isStalled];
      if (v8 != [(SUCoreProgress *)self isStalled]) {
        goto LABEL_13;
      }
      [(SUCoreProgress *)v5 portionComplete];
      float v10 = v9;
      [(SUCoreProgress *)self portionComplete];
      if (v10 != v11) {
        goto LABEL_13;
      }
      uint64_t v12 = [(SUCoreProgress *)v5 totalWrittenBytes];
      if (v12 == [(SUCoreProgress *)self totalWrittenBytes]
        && (uint64_t v13 = [(SUCoreProgress *)v5 totalExpectedBytes],
            v13 == [(SUCoreProgress *)self totalExpectedBytes])
        && ([(SUCoreProgress *)v5 estimatedTimeRemaining],
            double v15 = v14,
            [(SUCoreProgress *)self estimatedTimeRemaining],
            v15 == v16))
      {
        double v17 = [(SUCoreProgress *)self actionText];
        v18 = [(SUCoreProgress *)v5 actionText];
        if (+[SUCore stringIsEqual:v17 to:v18])
        {
          BOOL v19 = [(SUCoreProgress *)self taskDescription];
          id v20 = [(SUCoreProgress *)v5 taskDescription];
          BOOL v21 = +[SUCore stringIsEqual:v19 to:v20];
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
LABEL_13:
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SUCoreProgress *)self phase];
  if ([(SUCoreProgress *)self isStalled]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [(SUCoreProgress *)self portionComplete];
  double v7 = v6;
  int64_t v8 = [(SUCoreProgress *)self totalWrittenBytes];
  int64_t v9 = [(SUCoreProgress *)self totalExpectedBytes];
  [(SUCoreProgress *)self estimatedTimeRemaining];
  uint64_t v11 = v10;
  uint64_t v12 = [(SUCoreProgress *)self actionText];
  if ([(SUCoreProgress *)self disableVerboseLogging]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  double v14 = [(SUCoreProgress *)self taskDescription];
  if (v14)
  {
    double v15 = [(SUCoreProgress *)self taskDescription];
    double v16 = (void *)[v3 initWithFormat:@"phase:%@ stalled:%@ portionComplete:%f totalWrittenBytes:%lld totalExpectedBytes:%lld estimatedTimeRemaining:%f actionText:%@ disableVerboseLogging:%@ CFNetworkTask:%@", v4, v5, *(void *)&v7, v8, v9, v11, v12, v13, v15];
  }
  else
  {
    double v16 = (void *)[v3 initWithFormat:@"phase:%@ stalled:%@ portionComplete:%f totalWrittenBytes:%lld totalExpectedBytes:%lld estimatedTimeRemaining:%f actionText:%@ disableVerboseLogging:%@ CFNetworkTask:%@", v4, v5, *(void *)&v7, v8, v9, v11, v12, v13, @"NO"];
  }

  return v16;
}

- (id)summary
{
  if ([(SUCoreProgress *)self totalWrittenBytes]
    || [(SUCoreProgress *)self totalExpectedBytes])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"totalWrittenBytes:%lld totalExpectedBytes:%lld ", -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes"), -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"));
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = &stru_1F0D92C90;
  }
  id v4 = [NSString alloc];
  v5 = [(SUCoreProgress *)self phase];
  if ([(SUCoreProgress *)self isStalled]) {
    float v6 = @"YES";
  }
  else {
    float v6 = @"NO";
  }
  [(SUCoreProgress *)self portionComplete];
  double v8 = v7;
  [(SUCoreProgress *)self estimatedTimeRemaining];
  uint64_t v10 = v9;
  uint64_t v11 = [(SUCoreProgress *)self taskDescription];
  uint64_t v12 = [(SUCoreProgress *)self actionText];
  uint64_t v13 = (void *)[v4 initWithFormat:@"phase:%@ stalled:%@ portionComplete:%f %@estimatedTimeRemaining:%f task:%@ actionText:%@", v5, v6, *(void *)&v8, v3, v10, v11, v12];

  return v13;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
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

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (int64_t)totalWrittenBytes
{
  return self->_totalWrittenBytes;
}

- (void)setTotalWrittenBytes:(int64_t)a3
{
  self->_totalWrittenBytes = a3;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_totalExpectedBytes = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
}

- (BOOL)disableVerboseLogging
{
  return self->_disableVerboseLogging;
}

- (void)setDisableVerboseLogging:(BOOL)a3
{
  self->_disableVerboseLogging = a3;
}

- (NSString)taskDescription
{
  return self->_taskDescription;
}

- (void)setTaskDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_phase, 0);
}

@end
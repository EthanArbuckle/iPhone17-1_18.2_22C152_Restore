@interface SVXServiceCommandResult
+ (SVXServiceCommandResult)resultWithCommand:(id)a3;
+ (SVXServiceCommandResult)resultWithResults:(id)a3;
+ (id)resultFailureWithErrorCode:(int64_t)a3 reason:(id)a4;
+ (id)resultIgnored;
+ (id)resultSuccess;
- (BOOL)handleResultUsingIgnoredBlock:(id)a3 successBlock:(id)a4 failureBlock:(id)a5 commandBlock:(id)a6;
- (id)_initWithType:(int64_t)a3 failureErrorCode:(int64_t)a4 failureReason:(id)a5 command:(id)a6 results:(id)a7;
- (id)_optimalResult;
@end

@implementation SVXServiceCommandResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_command, 0);

  objc_storeStrong((id *)&self->_failureReason, 0);
}

- (id)_optimalResult
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_type != 4)
  {
    v12 = self;
LABEL_16:
    v6 = v12;
    goto LABEL_19;
  }
  if (![(NSArray *)self->_results count])
  {
    v12 = +[SVXServiceCommandResult resultIgnored];
    goto LABEL_16;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_results;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_optimalResult", (void)v14);
        v10 = v9;
        if (!v6 || v9[1] > v6->_type)
        {
          v11 = v9;

          v6 = v11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

LABEL_19:

  return v6;
}

- (id)_initWithType:(int64_t)a3 failureErrorCode:(int64_t)a4 failureReason:(id)a5 command:(id)a6 results:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SVXServiceCommandResult;
  long long v15 = [(SVXServiceCommandResult *)&v24 init];
  long long v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_failureErrorCode = a4;
    uint64_t v17 = [v12 copy];
    failureReason = v16->_failureReason;
    v16->_failureReason = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    command = v16->_command;
    v16->_command = (SAAceCommand *)v19;

    uint64_t v21 = [v14 copy];
    results = v16->_results;
    v16->_results = (NSArray *)v21;
  }
  return v16;
}

- (BOOL)handleResultUsingIgnoredBlock:(id)a3 successBlock:(id)a4 failureBlock:(id)a5 commandBlock:(id)a6
{
  v10 = (void (**)(void))a3;
  v11 = (void (**)(void))a4;
  id v12 = (void (**)(id, int64_t, NSString *))a5;
  id v13 = a6;
  id v14 = v13;
  switch(self->_type)
  {
    case 0:
      if (v10) {
        v10[2](v10);
      }
      goto LABEL_13;
    case 1:
      if (v12) {
        v12[2](v12, self->_failureErrorCode, self->_failureReason);
      }
      goto LABEL_13;
    case 2:
      if (v11) {
        v11[2](v11);
      }
      goto LABEL_13;
    case 3:
      if (v13) {
        (*((void (**)(id, SAAceCommand *))v13 + 2))(v13, self->_command);
      }
      goto LABEL_13;
    case 4:
      long long v16 = [(SVXServiceCommandResult *)self _optimalResult];
      [v16 handleResultUsingIgnoredBlock:v10 successBlock:v11 failureBlock:v12 commandBlock:v14];

LABEL_13:
      BOOL v15 = 1;
      break;
    default:
      BOOL v15 = 0;
      break;
  }

  return v15;
}

+ (SVXServiceCommandResult)resultWithResults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithType:4 failureErrorCode:0 failureReason:0 command:0 results:v3];

  return (SVXServiceCommandResult *)v4;
}

+ (SVXServiceCommandResult)resultWithCommand:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithType:3 failureErrorCode:0 failureReason:0 command:v3 results:0];

  return (SVXServiceCommandResult *)v4;
}

+ (id)resultFailureWithErrorCode:(int64_t)a3 reason:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithType:1 failureErrorCode:a3 failureReason:v5 command:0 results:0];

  return v6;
}

+ (id)resultSuccess
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithType:2 failureErrorCode:0 failureReason:0 command:0 results:0];

  return v2;
}

+ (id)resultIgnored
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithType:0 failureErrorCode:0 failureReason:0 command:0 results:0];

  return v2;
}

@end
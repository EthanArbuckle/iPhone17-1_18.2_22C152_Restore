@interface SRUIFDialogPhase
+ (BOOL)supportsSecureCoding;
+ (id)_dialogPhaseWithType:(int64_t)a3;
+ (id)acknowledgementDialogPhase;
+ (id)cancelledDialogPhase;
+ (id)clarificationDialogPhase;
+ (id)completionDialogPhase;
+ (id)confirmationDialogPhase;
+ (id)confirmedDialogPhase;
+ (id)dialogPhaseForAceDialogPhase:(id)a3;
+ (id)errorDialogPhase;
+ (id)reflectionDialogPhase;
+ (id)statusDialogPhase;
+ (id)summaryDialogPhase;
+ (id)userRequestDialogPhase;
- (BOOL)isCancelledDialogPhase;
- (BOOL)isClarificationDialogPhase;
- (BOOL)isCompletionDialogPhase;
- (BOOL)isConfirmationDialogPhase;
- (BOOL)isConfirmedDialogPhase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDialogPhase:(id)a3;
- (BOOL)isErrorDialogPhase;
- (BOOL)isExpository;
- (BOOL)isPossiblyPartOfMultiTurnRequest;
- (BOOL)isReflectionDialogPhase;
- (BOOL)isSummaryDialogPhase;
- (BOOL)isTemporary;
- (BOOL)isUserRequestDialogPhase;
- (BOOL)replacesPreviousSnippetContents;
- (NSString)aceDialogPhaseValue;
- (SRUIFDialogPhase)initWithCoder:(id)a3;
- (id)_initWithType:(int64_t)a3;
- (id)description;
- (int64_t)_type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRUIFDialogPhase

+ (id)dialogPhaseForAceDialogPhase:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F65DC8]])
  {
    uint64_t v4 = +[SRUIFDialogPhase acknowledgementDialogPhase];
LABEL_21:
    v5 = (void *)v4;
    goto LABEL_22;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65E00]])
  {
    uint64_t v4 = +[SRUIFDialogPhase reflectionDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65E08]])
  {
    uint64_t v4 = +[SRUIFDialogPhase statusDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DD8]])
  {
    uint64_t v4 = +[SRUIFDialogPhase clarificationDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65E10]])
  {
    uint64_t v4 = +[SRUIFDialogPhase summaryDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DE8]])
  {
    uint64_t v4 = +[SRUIFDialogPhase confirmationDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DE0]])
  {
    uint64_t v4 = +[SRUIFDialogPhase completionDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DF8]])
  {
    uint64_t v4 = +[SRUIFDialogPhase errorDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DF0]])
  {
    uint64_t v4 = +[SRUIFDialogPhase confirmedDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F65DD0]])
  {
    uint64_t v4 = +[SRUIFDialogPhase cancelledDialogPhase];
    goto LABEL_21;
  }
  v5 = 0;
LABEL_22:

  return v5;
}

+ (id)acknowledgementDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:1];
}

+ (id)reflectionDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:2];
}

+ (id)statusDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:3];
}

+ (id)clarificationDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:4];
}

+ (id)summaryDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:5];
}

+ (id)confirmationDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:6];
}

+ (id)completionDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:7];
}

+ (id)errorDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:8];
}

+ (id)confirmedDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:9];
}

+ (id)cancelledDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:10];
}

+ (id)userRequestDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:11];
}

+ (id)_dialogPhaseWithType:(int64_t)a3
{
  id v3 = [[SRUIFDialogPhase alloc] _initWithType:a3];
  return v3;
}

- (id)_initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SRUIFDialogPhase;
  id result = [(SRUIFDialogPhase *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SRUIFDialogPhase _type](self, "_type"), @"SRUIFDialogPhaseType");
}

- (SRUIFDialogPhase)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SRUIFDialogPhase;
  objc_super v5 = [(SRUIFDialogPhase *)&v7 init];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"SRUIFDialogPhaseType"];
  }

  return v5;
}

- (BOOL)isEqualToDialogPhase:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SRUIFDialogPhase *)self _type];
  uint64_t v6 = [v4 _type];

  return v5 == v6;
}

- (NSString)aceDialogPhaseValue
{
  int64_t v3 = [(SRUIFDialogPhase *)self _type] - 1;
  id v4 = 0;
  int64_t v5 = (id *)MEMORY[0x263F65DC8];
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      int64_t v5 = (id *)MEMORY[0x263F65E00];
      goto LABEL_11;
    case 2:
      int64_t v5 = (id *)MEMORY[0x263F65E08];
      goto LABEL_11;
    case 3:
      int64_t v5 = (id *)MEMORY[0x263F65DD8];
      goto LABEL_11;
    case 4:
      int64_t v5 = (id *)MEMORY[0x263F65E10];
      goto LABEL_11;
    case 5:
      int64_t v5 = (id *)MEMORY[0x263F65DE8];
      goto LABEL_11;
    case 6:
      int64_t v5 = (id *)MEMORY[0x263F65DE0];
      goto LABEL_11;
    case 7:
      int64_t v5 = (id *)MEMORY[0x263F65DF8];
      goto LABEL_11;
    case 8:
      int64_t v5 = (id *)MEMORY[0x263F65DF0];
      goto LABEL_11;
    case 9:
      int64_t v5 = (id *)MEMORY[0x263F65DD0];
LABEL_11:
      id v4 = *v5;
      break;
    case 10:
      break;
    default:
      objc_super v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF498];
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected value for _type: %ld", -[SRUIFDialogPhase _type](self, "_type"));
      id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

      objc_exception_throw(v10);
  }
  return (NSString *)v4;
}

- (BOOL)replacesPreviousSnippetContents
{
  unint64_t v2 = [(SRUIFDialogPhase *)self _type];
  return (v2 < 8) & (0xB0u >> v2);
}

- (BOOL)isTemporary
{
  unint64_t v2 = [(SRUIFDialogPhase *)self _type];
  return (v2 < 9) & (0x14Eu >> v2);
}

- (BOOL)isExpository
{
  return (unint64_t)([(SRUIFDialogPhase *)self _type] - 1) < 3;
}

- (BOOL)isConfirmationDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 6;
}

- (BOOL)isReflectionDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 2;
}

- (BOOL)isClarificationDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 4;
}

- (BOOL)isConfirmedDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 9;
}

- (BOOL)isCancelledDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 10;
}

- (BOOL)isUserRequestDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 11;
}

- (BOOL)isErrorDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 8;
}

- (BOOL)isCompletionDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 7;
}

- (BOOL)isSummaryDialogPhase
{
  return [(SRUIFDialogPhase *)self _type] == 5;
}

- (BOOL)isPossiblyPartOfMultiTurnRequest
{
  unint64_t v2 = [(SRUIFDialogPhase *)self _type];
  return (v2 < 0xC) & (0x850u >> v2);
}

- (id)description
{
  int64_t v3 = +[SRUIFDialogPhase acknowledgementDialogPhase];
  BOOL v4 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v3];

  if (v4)
  {
    int64_t v5 = @"acknowledgementDialogPhase";
  }
  else
  {
    uint64_t v6 = +[SRUIFDialogPhase reflectionDialogPhase];
    BOOL v7 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v6];

    if (v7)
    {
      int64_t v5 = @"reflectionDialogPhase";
    }
    else
    {
      uint64_t v8 = +[SRUIFDialogPhase statusDialogPhase];
      BOOL v9 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v8];

      if (v9)
      {
        int64_t v5 = @"statusDialogPhase";
      }
      else
      {
        id v10 = +[SRUIFDialogPhase clarificationDialogPhase];
        BOOL v11 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v10];

        if (v11)
        {
          int64_t v5 = @"clarificationDialogPhase";
        }
        else
        {
          v12 = +[SRUIFDialogPhase summaryDialogPhase];
          BOOL v13 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v12];

          if (v13)
          {
            int64_t v5 = @"summaryDialogPhase";
          }
          else
          {
            v14 = +[SRUIFDialogPhase confirmationDialogPhase];
            BOOL v15 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v14];

            if (v15)
            {
              int64_t v5 = @"confirmationDialogPhase";
            }
            else
            {
              v16 = +[SRUIFDialogPhase completionDialogPhase];
              BOOL v17 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v16];

              if (v17)
              {
                int64_t v5 = @"completionDialogPhase";
              }
              else
              {
                v18 = +[SRUIFDialogPhase errorDialogPhase];
                BOOL v19 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v18];

                if (v19)
                {
                  int64_t v5 = @"errorDialogPhase";
                }
                else
                {
                  v20 = +[SRUIFDialogPhase confirmedDialogPhase];
                  BOOL v21 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v20];

                  if (v21)
                  {
                    int64_t v5 = @"confirmedDialogPhase";
                  }
                  else
                  {
                    v22 = +[SRUIFDialogPhase cancelledDialogPhase];
                    BOOL v23 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v22];

                    if (v23)
                    {
                      int64_t v5 = @"cancelledDialogPhase";
                    }
                    else
                    {
                      v24 = +[SRUIFDialogPhase userRequestDialogPhase];
                      BOOL v25 = [(SRUIFDialogPhase *)self isEqualToDialogPhase:v24];

                      if (v25) {
                        int64_t v5 = @"userRequestDialogPhase";
                      }
                      else {
                        int64_t v5 = @"unknown dialogPhase";
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return (id)[NSString stringWithFormat:@"<%@ %@>", objc_opt_class(), v5];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (SRUIFDialogPhase *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SRUIFDialogPhase *)self isEqualToDialogPhase:v4];
  }

  return v5;
}

- (int64_t)_type
{
  return self->_type;
}

@end
@interface WFVerdict
+ (id)verdictWithRestriction:(BOOL)a3 URL:(id)a4 evidence:(int)a5 LSMEvaluationResult:(id)a6 message:(id)a7;
- (BOOL)restricted;
- (id)LSMEvaluationResult;
- (id)URL;
- (id)description;
- (id)message;
- (int)evidence;
- (void)dealloc;
- (void)setEvidence:(int)a3;
- (void)setLSMEvaluationResult:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation WFVerdict

+ (id)verdictWithRestriction:(BOOL)a3 URL:(id)a4 evidence:(int)a5 LSMEvaluationResult:(id)a6 message:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  BOOL v11 = a3;
  v12 = objc_opt_new();
  [v12 setRestricted:v11];
  [v12 setURL:a4];
  [v12 setEvidence:v9];
  [v12 setLSMEvaluationResult:a6];
  [v12 setMessage:a7];
  return v12;
}

- (BOOL)restricted
{
  return self->restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->restricted = a3;
}

- (id)LSMEvaluationResult
{
  return self->LSMEvaluationResult;
}

- (void)setLSMEvaluationResult:(id)a3
{
  id v5 = a3;

  self->LSMEvaluationResult = (WFLSMResult *)a3;
}

- (id)message
{
  return self->message;
}

- (void)setMessage:(id)a3
{
  id v5 = a3;

  self->message = (NSString *)a3;
}

- (id)URL
{
  return self->URL;
}

- (void)setURL:(id)a3
{
  id v5 = a3;

  self->URL = (NSString *)a3;
}

- (int)evidence
{
  return self->evidence;
}

- (void)setEvidence:(int)a3
{
  self->evidence = a3;
}

- (id)description
{
  return (id)[MEMORY[0x263F089D8] stringWithFormat:@"%@ | %@ | %@", objc_msgSend(-[WFVerdict LSMEvaluationResult](self, "LSMEvaluationResult"), "debugDescription"), -[WFVerdict message](self, "message"), -[WFVerdict URL](self, "URL")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFVerdict;
  [(WFVerdict *)&v3 dealloc];
}

@end
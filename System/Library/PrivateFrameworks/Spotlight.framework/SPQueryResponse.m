@interface SPQueryResponse
- (NSArray)resultSections;
- (NSDictionary)ecrGroundedOutput;
- (NSString)sessionEntityString;
- (SPQueryResponse)init;
- (SPQueryResponse)initWithTask:(id)a3;
- (SPQueryTask)task;
- (id)copy;
- (id)description;
- (unint64_t)kind;
- (unint64_t)state;
- (void)setEcrGroundedOutput:(id)a3;
- (void)setKind:(unint64_t)a3;
- (void)setResultSections:(id)a3;
- (void)setSessionEntityString:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTask:(id)a3;
@end

@implementation SPQueryResponse

- (NSArray)resultSections
{
  return self->_resultSections;
}

- (unint64_t)state
{
  return self->_state;
}

- (SPQueryTask)task
{
  return self->_task;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityString, 0);
  objc_storeStrong((id *)&self->_ecrGroundedOutput, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_resultSections, 0);
}

- (void)setResultSections:(id)a3
{
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setSessionEntityString:(id)a3
{
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSString)sessionEntityString
{
  return self->_sessionEntityString;
}

- (SPQueryResponse)initWithTask:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPQueryResponse;
  v5 = [(SPQueryResponse *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SPQueryResponse *)v5 setTask:v4];
  }

  return v6;
}

- (void)setTask:(id)a3
{
}

- (SPQueryResponse)init
{
  return [(SPQueryResponse *)self initWithTask:0];
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(SPQueryResponse *)self kind];
  unint64_t v5 = [(SPQueryResponse *)self state];
  v6 = [(SPQueryResponse *)self task];
  v7 = [(SPQueryResponse *)self resultSections];
  objc_super v8 = [v3 stringWithFormat:@"kind:%lu state:%luu task:%@ sections:%@", v4, v5, v6, v7];

  return v8;
}

- (id)copy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  unint64_t v4 = [(SPQueryResponse *)self task];
  unint64_t v5 = (void *)[v3 initWithTask:v4];

  v6 = [(SPQueryResponse *)self resultSections];
  [v5 setResultSections:v6];

  v7 = [(SPQueryResponse *)self sessionEntityString];
  [v5 setSessionEntityString:v7];

  objc_msgSend(v5, "setState:", -[SPQueryResponse state](self, "state"));
  objc_msgSend(v5, "setKind:", -[SPQueryResponse kind](self, "kind"));
  objc_super v8 = [(SPQueryResponse *)self ecrGroundedOutput];
  [v5 setEcrGroundedOutput:v8];

  return v5;
}

- (NSDictionary)ecrGroundedOutput
{
  return self->_ecrGroundedOutput;
}

- (void)setEcrGroundedOutput:(id)a3
{
}

@end
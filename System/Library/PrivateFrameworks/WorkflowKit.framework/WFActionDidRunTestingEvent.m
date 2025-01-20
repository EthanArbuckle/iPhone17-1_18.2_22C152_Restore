@interface WFActionDidRunTestingEvent
- (NSError)error;
- (WFActionDidRunTestingEvent)initWithAction:(id)a3 output:(id)a4 error:(id)a5;
- (WFContentCollection)output;
- (id)description;
@end

@implementation WFActionDidRunTestingEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

- (NSError)error
{
  return self->_error;
}

- (WFContentCollection)output
{
  return self->_output;
}

- (id)description
{
  v3 = [(WFContentCollection *)self->_output description];
  if ((unint64_t)[v3 length] >= 0x33)
  {
    v4 = [v3 substringToIndex:50];
    uint64_t v5 = [v4 stringByAppendingString:@"…"];

    v3 = (void *)v5;
  }
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@: %p, output: %@, error: %@>", v8, self, v3, self->_error];

  return v9;
}

- (WFActionDidRunTestingEvent)initWithAction:(id)a3 output:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFActionDidRunTestingEvent;
  v11 = [(WFActionTestingEvent *)&v15 initWithAction:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_output, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    v13 = v12;
  }

  return v12;
}

@end
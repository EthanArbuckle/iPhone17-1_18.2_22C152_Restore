@interface _TUIElementActionObjectBuilder
- (NSMutableDictionary)arguments;
- (NSString)behavior;
- (NSString)refId;
- (NSString)trigger;
- (void)setActionData:(id)a3 forKey:(id)a4;
- (void)setArguments:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setRefId:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation _TUIElementActionObjectBuilder

- (void)setActionData:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  [(NSMutableDictionary *)arguments setObject:v10 forKeyedSubscript:v6];
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
}

- (NSMutableDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
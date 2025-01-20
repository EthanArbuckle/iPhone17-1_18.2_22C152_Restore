@interface _MFIMAPCommandParameters
- (MFIMAPResponseConsumer)responseConsumer;
- (NSArray)arguments;
- (NSMutableArray)untaggedResponses;
- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3;
- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3 arguments:(id)a4;
- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3 sequenceNumber:(unint64_t)a4;
- (int64_t)command;
- (unint64_t)sequenceNumber;
- (void)setArguments:(id)a3;
- (void)setCommand:(int64_t)a3;
- (void)setResponseConsumer:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setUntaggedResponses:(id)a3;
@end

@implementation _MFIMAPCommandParameters

- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MFIMAPCommandParameters;
  result = [(_MFIMAPCommandParameters *)&v5 init];
  if (result) {
    result->_command = a3;
  }
  return result;
}

- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3 arguments:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MFIMAPCommandParameters;
  v8 = [(_MFIMAPCommandParameters *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_command = a3;
    objc_storeStrong((id *)&v8->_arguments, a4);
  }

  return v9;
}

- (_MFIMAPCommandParameters)initWithCommand:(int64_t)a3 sequenceNumber:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MFIMAPCommandParameters;
  result = [(_MFIMAPCommandParameters *)&v7 init];
  if (result)
  {
    result->_command = a3;
    result->_sequenceNumber = a4;
  }
  return result;
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSMutableArray)untaggedResponses
{
  return self->_untaggedResponses;
}

- (void)setUntaggedResponses:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (MFIMAPResponseConsumer)responseConsumer
{
  return self->_responseConsumer;
}

- (void)setResponseConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConsumer, 0);
  objc_storeStrong((id *)&self->_untaggedResponses, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
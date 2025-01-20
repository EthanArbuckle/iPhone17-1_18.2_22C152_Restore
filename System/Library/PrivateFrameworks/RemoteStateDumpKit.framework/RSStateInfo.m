@interface RSStateInfo
- (RSStateInfo)initWithType:(unint64_t)a3 revision:(int64_t)a4;
- (int64_t)actionRevision;
- (unint64_t)stateType;
- (void)setActionRevision:(int64_t)a3;
- (void)setStateType:(unint64_t)a3;
@end

@implementation RSStateInfo

- (RSStateInfo)initWithType:(unint64_t)a3 revision:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RSStateInfo;
  result = [(RSStateInfo *)&v7 init];
  if (result)
  {
    result->_stateType = a3;
    result->_actionRevision = a4;
  }
  return result;
}

- (unint64_t)stateType
{
  return self->_stateType;
}

- (void)setStateType:(unint64_t)a3
{
  self->_stateType = a3;
}

- (int64_t)actionRevision
{
  return self->_actionRevision;
}

- (void)setActionRevision:(int64_t)a3
{
  self->_actionRevision = a3;
}

@end
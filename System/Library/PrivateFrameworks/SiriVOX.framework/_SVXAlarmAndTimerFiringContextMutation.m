@interface _SVXAlarmAndTimerFiringContextMutation
- (_SVXAlarmAndTimerFiringContextMutation)init;
- (_SVXAlarmAndTimerFiringContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setHasOtherRunningTimers:(BOOL)a3;
- (void)setOrderedFiringAlarms:(id)a3;
- (void)setOrderedFiringTimers:(id)a3;
@end

@implementation _SVXAlarmAndTimerFiringContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFiringTimers, 0);
  objc_storeStrong((id *)&self->_orderedFiringAlarms, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if (*(unsigned char *)&self->_mutationFlags)
    {
      if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
      {
        v6 = self->_orderedFiringAlarms;
      }
      else
      {
        v6 = [(SVXAlarmAndTimerFiringContext *)baseModel orderedFiringAlarms];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
        v8 = self->_orderedFiringTimers;
      }
      else
      {
        v8 = [(SVXAlarmAndTimerFiringContext *)self->_baseModel orderedFiringTimers];
      }
      v9 = v8;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
        BOOL hasOtherRunningTimers = self->_hasOtherRunningTimers;
      }
      else {
        BOOL hasOtherRunningTimers = [(SVXAlarmAndTimerFiringContext *)self->_baseModel hasOtherRunningTimers];
      }
      v5 = [[SVXAlarmAndTimerFiringContext alloc] initWithOrderedFiringAlarms:v7 orderedFiringTimers:v9 hasOtherRunningTimers:hasOtherRunningTimers];

      goto LABEL_16;
    }
    v4 = (SVXAlarmAndTimerFiringContext *)[(SVXAlarmAndTimerFiringContext *)baseModel copy];
  }
  else
  {
    v4 = [[SVXAlarmAndTimerFiringContext alloc] initWithOrderedFiringAlarms:self->_orderedFiringAlarms orderedFiringTimers:self->_orderedFiringTimers hasOtherRunningTimers:self->_hasOtherRunningTimers];
  }
  v5 = v4;
LABEL_16:

  return v5;
}

- (void)setHasOtherRunningTimers:(BOOL)a3
{
  self->_BOOL hasOtherRunningTimers = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setOrderedFiringTimers:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setOrderedFiringAlarms:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXAlarmAndTimerFiringContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXAlarmAndTimerFiringContextMutation;
  v6 = [(_SVXAlarmAndTimerFiringContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXAlarmAndTimerFiringContextMutation)init
{
  return [(_SVXAlarmAndTimerFiringContextMutation *)self initWithBaseModel:0];
}

@end
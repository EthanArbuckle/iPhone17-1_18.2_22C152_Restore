@interface _UIUpdateHIDInput
- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4;
- (void)addEvent:(__IOHIDEvent *)a3;
- (void)removeEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIUpdateHIDInput

- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4
{
  return 0;
}

- (void)removeEvent:(__IOHIDEvent *)a3
{
  [(NSMutableArray *)self->_events removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_events count] && self->_input._state.mode)
  {
    self->_input._state.mode = 0;
    set = self->_input._set;
    _UIUpdateInputSetInputChanged(set, (uint64_t)&self->_input);
  }
}

- (void)addEvent:(__IOHIDEvent *)a3
{
  [(NSMutableArray *)self->_events addObject:a3];
  if (self->_input._state.mode != 2)
  {
    self->_input._state.mode = 2;
    set = self->_input._set;
    _UIUpdateInputSetInputChanged(set, (uint64_t)&self->_input);
  }
}

- (void).cxx_destruct
{
}

@end
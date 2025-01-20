@interface _UIGenericGestureHIDEventDescriptor
+ (_UIGenericGestureHIDEventDescriptor)descriptorWithEvent:(__IOHIDEvent *)a3;
- (BOOL)isEqual:(id)a3;
- (_UIGenericGestureHIDEventDescriptor)init;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _UIGenericGestureHIDEventDescriptor

+ (_UIGenericGestureHIDEventDescriptor)descriptorWithEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType();
  if (a3 && Type == 39)
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    unsigned int IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v9 = IOHIDEventGetIntegerValue();
    v10 = [_UIGenericGestureHIDEventDescriptor alloc];
    if (v10)
    {
      v13.receiver = v10;
      v13.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
      v10 = objc_msgSendSuper2(&v13, sel_initWithSenderID_eventType_, SenderID, 39);
      if (v10)
      {
        v10->_gestureint Type = IntegerValue;
        v10->_tapCount = v9;
      }
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"_UIGenericGestureHIDEventDescriptor.m", 25, @"Invalid event for %@: %@", a1, a3 object file lineNumber description];

    v10 = 0;
  }
  return v10;
}

- (_UIGenericGestureHIDEventDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIGenericGestureHIDEventDescriptor.m", 36, @"%s: init is not allowed on %@", "-[_UIGenericGestureHIDEventDescriptor init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
  BOOL v5 = -[_UIHIDEventSenderDescriptor isEqual:](&v7, sel_isEqual_);
  if (v5) {
    LOBYTE(v5) = self->_gestureType == *((_DWORD *)a3 + 6) && self->_tapCount == *((void *)a3 + 4);
  }
  return v5;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
  unint64_t v3 = [(_UIHIDEventSenderDescriptor *)&v10 hash];
  v4 = [NSNumber numberWithUnsignedInt:self->_gestureType];
  uint64_t v5 = [v4 hash] ^ v3;

  v6 = [NSNumber numberWithLong:self->_tapCount];
  unint64_t v7 = v5 ^ [v6 hash];

  unint64_t v8 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
  return v8 ^ (v8 >> 31);
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  v2 = [(_UIGenericGestureHIDEventDescriptor *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(_UIGenericGestureHIDEventDescriptor *)self appendDescriptionToFormatter:v3];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(_UIGenericGestureHIDEventDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68___UIGenericGestureHIDEventDescriptor_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E52D9F98;
  v3[4] = a3;
  v3[5] = self;
  [a3 appendProem:self block:v3];
}

@end
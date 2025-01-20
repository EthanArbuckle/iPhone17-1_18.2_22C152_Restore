@interface _UIHIDEventSenderDescriptor
+ (id)descriptorWithEvent:(__IOHIDEvent *)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHIDEventSenderDescriptor)init;
- (_UIHIDEventSenderDescriptor)initWithSenderID:(unint64_t)a3 eventType:(unsigned int)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _UIHIDEventSenderDescriptor

+ (id)descriptorWithEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    v5 = [[_UIHIDEventSenderDescriptor alloc] initWithSenderID:SenderID eventType:IOHIDEventGetType()];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (_UIHIDEventSenderDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHIDEventSenderDescriptor.m", 32, @"%s: init is not allowed on %@", "-[_UIHIDEventSenderDescriptor init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIHIDEventSenderDescriptor)initWithSenderID:(unint64_t)a3 eventType:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHIDEventSenderDescriptor;
  result = [(_UIHIDEventSenderDescriptor *)&v7 init];
  if (result)
  {
    result->_senderID = a3;
    result->_eventType = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || !_NSIsNSObject()) {
    return 0;
  }
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  BOOL v8 = v6 == objc_opt_class()
    && (unint64_t v7 = -[_UIHIDEventSenderDescriptor hash](self, "hash"), v7 == [v5 hash])
    && self->_senderID == *((void *)v5 + 2)
    && self->_eventType == *((_DWORD *)v5 + 2);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:self->_senderID];
  uint64_t v4 = [v3 hash];

  id v5 = [NSNumber numberWithUnsignedInt:self->_eventType];
  unint64_t v6 = [v5 hash] ^ v4;

  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  return v7 ^ (v7 >> 31);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  v2 = [(_UIHIDEventSenderDescriptor *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(_UIHIDEventSenderDescriptor *)self appendDescriptionToFormatter:v3];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIHIDEventSenderDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___UIHIDEventSenderDescriptor_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E52D9F98;
  v3[4] = a3;
  v3[5] = self;
  [a3 appendProem:self block:v3];
}

@end
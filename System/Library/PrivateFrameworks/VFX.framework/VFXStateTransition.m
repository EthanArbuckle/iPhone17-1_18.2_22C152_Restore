@interface VFXStateTransition
+ (BOOL)supportsSecureCoding;
- (VFXState)sourceState;
- (VFXState)targetState;
- (VFXStateTransition)initWithCoder:(id)a3;
- (VFXStateTransition)initWithSource:(id)a3 andTarget:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VFXStateTransition

- (VFXStateTransition)initWithSource:(id)a3 andTarget:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VFXStateTransition;
  v6 = [(VFXStateTransition *)&v8 init];
  if (v6)
  {
    v6->_sourceState = (VFXState *)a3;
    v6->_targetState = (VFXState *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXStateTransition;
  [(VFXStateTransition *)&v3 dealloc];
}

- (VFXStateTransition)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXStateTransition;
  v4 = [(VFXStateTransition *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_sourceState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"sourceState");
    uint64_t v7 = objc_opt_class();
    v4->_targetState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"targetState");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_sourceState, @"sourceState");
  targetState = self->_targetState;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)targetState, @"targetState");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXState)sourceState
{
  return self->_sourceState;
}

- (VFXState)targetState
{
  return self->_targetState;
}

@end
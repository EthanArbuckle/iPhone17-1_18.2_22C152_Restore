@interface _UIRIPReceiver
- (BOOL)isEqual:(id)a3;
- (Class)clazz;
- (UIPress)press;
- (UIResponder)responder;
- (_UIRIPReceiver)initWithResponder:(id)a3 class:(Class)a4 press:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7;
- (id)description;
- (int64_t)phase;
- (unint64_t)hash;
@end

@implementation _UIRIPReceiver

- (_UIRIPReceiver)initWithResponder:(id)a3 class:(Class)a4 press:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_UIRIPReceiver;
  v16 = [(_UIRIPReceiver *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_responder, a3);
    objc_storeStrong((id *)&v17->_clazz, a4);
    objc_storeStrong((id *)&v17->_press, a5);
    v17->_phase = a6;
    objc_storeStrong((id *)&v17->_event, a7);
  }

  return v17;
}

- (unint64_t)hash
{
  return [(UIResponder *)self->_responder hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = self->_responder == (UIResponder *)v5[2] && self->_clazz == (Class)v5[3] && self->_press == (UIPress *)v5[5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  responder = self->_responder;
  v7 = NSStringFromClass(self->_clazz);
  v8 = [v3 stringWithFormat:@"[%@:%p:%@]", v5, responder, v7];

  return v8;
}

- (UIResponder)responder
{
  return self->_responder;
}

- (Class)clazz
{
  return self->_clazz;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIPress)press
{
  return self->_press;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_press, 0);
  objc_storeStrong((id *)&self->_clazz, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
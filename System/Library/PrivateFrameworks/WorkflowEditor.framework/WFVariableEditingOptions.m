@interface WFVariableEditingOptions
- (BOOL)isEqual:(id)a3;
- (WFVariableEditingAnchor)anchor;
- (WFVariableEditingOptions)initWithAnchor:(id)a3 resultType:(unint64_t)a4 onChange:(id)a5 onFinish:(id)a6;
- (id)onChange;
- (id)onFinish;
- (unint64_t)hash;
- (unint64_t)resultType;
- (void)finishEditingReturningToKeyboard:(BOOL)a3;
- (void)setOnChange:(id)a3;
- (void)setOnFinish:(id)a3;
- (void)variableDidChange:(id)a3;
@end

@implementation WFVariableEditingOptions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onFinish, 0);
  objc_storeStrong(&self->_onChange, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)setOnFinish:(id)a3
{
}

- (id)onFinish
{
  return self->_onFinish;
}

- (void)setOnChange:(id)a3
{
}

- (id)onChange
{
  return self->_onChange;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (WFVariableEditingAnchor)anchor
{
  return self->_anchor;
}

- (void)finishEditingReturningToKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WFVariableEditingOptions *)self onFinish];

  if (v5)
  {
    v6 = [(WFVariableEditingOptions *)self onFinish];
    v6[2](v6, v3);
  }
  [(WFVariableEditingOptions *)self setOnChange:0];
  [(WFVariableEditingOptions *)self setOnFinish:0];
}

- (void)variableDidChange:(id)a3
{
  id v6 = a3;
  v4 = [(WFVariableEditingOptions *)self onChange];

  if (v4)
  {
    v5 = [(WFVariableEditingOptions *)self onChange];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFVariableEditingOptions *)self anchor];
      id v6 = [v4 anchor];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        if (!v7 || !v8)
        {

LABEL_12:
          BOOL v11 = 0;
          goto LABEL_13;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10) {
          goto LABEL_12;
        }
      }
      unint64_t v12 = [(WFVariableEditingOptions *)self resultType];
      BOOL v11 = v12 == [v4 resultType];
LABEL_13:

      goto LABEL_14;
    }
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  return self->_resultType ^ [(WFVariableEditingAnchor *)self->_anchor hash];
}

- (WFVariableEditingOptions)initWithAnchor:(id)a3 resultType:(unint64_t)a4 onChange:(id)a5 onFinish:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 67, @"Invalid parameter not satisfying: %@", @"onChange" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 66, @"Invalid parameter not satisfying: %@", @"anchor" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 68, @"Invalid parameter not satisfying: %@", @"onFinish" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)WFVariableEditingOptions;
  v15 = [(WFVariableEditingOptions *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a3);
    v16->_resultType = a4;
    uint64_t v17 = [v13 copy];
    id onChange = v16->_onChange;
    v16->_id onChange = (id)v17;

    uint64_t v19 = [v14 copy];
    id onFinish = v16->_onFinish;
    v16->_id onFinish = (id)v19;

    v21 = v16;
  }

  return v16;
}

@end
@interface WFVariableSubstitutableParameterState
+ (Class)processingValueClass;
+ (NSArray)processingValueClasses;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSString)debugDescription;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariable)variable;
- (WFVariableSubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableSubstitutableParameterState)initWithValue:(id)a3;
- (WFVariableSubstitutableParameterState)initWithVariable:(id)a3;
- (id)value;
- (unint64_t)hash;
- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFVariableSubstitutableParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong(&self->_value, 0);
}

- (WFVariableSubstitutableParameterState)initWithValue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFVariableSubstitutableParameterState.m", 49, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFVariableSubstitutableParameterState.m" lineNumber:50 description:@"Cannot initialize an abstract class"];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFVariableSubstitutableParameterState;
  v7 = [(WFVariableSubstitutableParameterState *)&v14 init];
  if (v7)
  {
    if ([v5 conformsToProtocol:&unk_1F231B878]) {
      id v8 = (id)[v5 copy];
    }
    else {
      id v8 = v5;
    }
    id value = v7->_value;
    v7->_id value = v8;

    v10 = v7;
  }

  return v7;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v3)
  {
    v4 = [(WFVariableSubstitutableParameterState *)self variable];
    WFSerializedVariableObject(v4);
  }
  else
  {
    id v5 = objc_opt_class();
    v4 = [(WFVariableSubstitutableParameterState *)self value];
    [v5 serializedRepresentationFromValue:v4];
  uint64_t v6 = };

  return (WFPropertyListObject *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFVariableSubstitutableParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFVariableSubstitutableParameterState *)self value];
      uint64_t v6 = [(WFVariableSubstitutableParameterState *)v4 value];
      if ([v5 isEqual:v6])
      {

LABEL_8:
        v9 = [(WFVariableSubstitutableParameterState *)self variable];
        if (v9
          || ([(WFVariableSubstitutableParameterState *)v4 variable],
              (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v10 = [(WFVariableSubstitutableParameterState *)self variable];
          v11 = [(WFVariableSubstitutableParameterState *)v4 variable];
          char v7 = [v10 isEqual:v11];

          if (v9)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
          char v7 = 1;
        }

        goto LABEL_14;
      }
      id v8 = [(WFVariableSubstitutableParameterState *)self value];

      if (!v8) {
        goto LABEL_8;
      }
    }
    char v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)value
{
  return self->_value;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (WFVariableSubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"WFVariableSubstitutableParameterState.m" lineNumber:73 description:@"Cannot initialize an abstract class"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  v13 = WFDeserializedVariableObject(v9, v10, v11);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v14 = [(WFVariableSubstitutableParameterState *)self initWithVariable:v13];
LABEL_12:
    self = v14;
    v17 = self;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v13 representsSingleContentVariable])
  {

LABEL_10:
    v13 = [(id)objc_opt_class() valueFromSerializedRepresentation:v9 variableProvider:v10 parameter:v11];
    if (!v13)
    {
      v17 = 0;
      goto LABEL_14;
    }
    objc_super v14 = [(WFVariableSubstitutableParameterState *)self initWithValue:v13];
    goto LABEL_12;
  }
  v15 = [v13 stringsAndVariables];
  v16 = [v15 firstObject];
  self = [(WFVariableSubstitutableParameterState *)self initWithVariable:v16];

  v17 = self;
LABEL_14:

  return v17;
}

- (NSString)debugDescription
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];

  if (v3)
  {
    v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    char v7 = [(WFVariableSubstitutableParameterState *)self value];
    [v4 stringWithFormat:@"<%@: %p, value: %@>", v6, self, v7];
    id v11 = LABEL_5:;

    goto LABEL_6;
  }
  id v8 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v8)
  {
    id v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v10);
    char v7 = [(WFVariableSubstitutableParameterState *)self variable];
    [v9 stringWithFormat:@"<%@: %p, variable: %@>", v6, self, v7];
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)WFVariableSubstitutableParameterState;
  id v11 = [(WFVariableSubstitutableParameterState *)&v13 debugDescription];
LABEL_6:
  return (NSString *)v11;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  id v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    uint64_t v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      objc_super v14 = (void *)[(id)objc_opt_class() processingValueClass];
      if ([v14 isEqual:objc_opt_class()])
      {
        v15 = [(WFVariableSubstitutableParameterState *)self variable];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __98__WFVariableSubstitutableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v17[3] = &unk_1E6552A90;
        id v18 = v10;
        [v15 getFileRepresentationWithContext:v8 completionHandler:v17];
      }
      else
      {
        [(WFVariableSubstitutableParameterState *)self getObjectRepresentationOfVariableWithContext:v8 processingValueClass:v14 valueHandler:v10];
      }
    }
  }
  else
  {
    v16 = [(WFVariableSubstitutableParameterState *)self value];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v16, 0);
  }
}

uint64_t __98__WFVariableSubstitutableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(WFVariableSubstitutableParameterState *)self variable];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__WFVariableSubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
  v12[3] = &unk_1E6552A68;
  id v13 = v8;
  id v11 = v8;
  [v10 getObjectRepresentationForClass:a4 context:v9 completionHandler:v12];
}

uint64_t __120__WFVariableSubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)containedVariables
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
  v4 = [(WFVariableSubstitutableParameterState *)self variable];
  id v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  return (NSArray *)v5;
}

- (unint64_t)hash
{
  id v3 = [(WFVariableSubstitutableParameterState *)self value];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFVariableSubstitutableParameterState *)self variable];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (WFVariableSubstitutableParameterState)initWithVariable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFVariableSubstitutableParameterState.m", 61, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFVariableSubstitutableParameterState.m" lineNumber:62 description:@"Cannot initialize an abstract class"];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFVariableSubstitutableParameterState;
  id v8 = [(WFVariableSubstitutableParameterState *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_variable, a3);
    id v10 = v9;
  }

  return v9;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"+serializedRepresentationFromValue is unimplemented" userInfo:0];
  objc_exception_throw(v4);
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"+valueFromSerializedRepresentation is unimplemented" userInfo:0];
  objc_exception_throw(v10);
}

+ (NSArray)processingValueClasses
{
  v13[1] = *MEMORY[0x1E4F143B8];
  Class = object_getClass(a1);
  MethodImplementation = class_getMethodImplementation(Class, sel_processingValueClass);
  id v5 = objc_opt_class();
  id v6 = object_getClass(v5);
  if (MethodImplementation == class_getMethodImplementation(v6, sel_processingValueClass))
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3A8];
    id v11 = [NSString stringWithFormat:@"(%@) both +processingValueClass and +processingValueClasses are unimplemented. You must implement at least one of them", a1];
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  v13[0] = [a1 processingValueClass];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  return (NSArray *)v7;
}

+ (Class)processingValueClass
{
  Class = object_getClass(a1);
  IMP MethodImplementation = class_getMethodImplementation(Class, sel_processingValueClasses);
  id v5 = objc_opt_class();
  id v6 = object_getClass(v5);
  IMP v7 = class_getMethodImplementation(v6, sel_processingValueClasses);
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3A8];
  if (MethodImplementation == v7) {
    [NSString stringWithFormat:@"(%@) both +processingValueClass and +processingValueClasses are unimplemented. You must implement at least one of them", a1];
  }
  else {
  uint64_t v10 = [NSString stringWithFormat:@"(%@) +processingValueClasses is implemented and you should use that", a1];
  }
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

@end
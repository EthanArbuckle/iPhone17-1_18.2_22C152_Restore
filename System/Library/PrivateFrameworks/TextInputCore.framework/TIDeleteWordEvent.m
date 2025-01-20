@interface TIDeleteWordEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)allKeyboardInputs;
- (NSArray)allTouches;
- (NSArray)candidatesOffered;
- (NSArray)touchLayouts;
- (NSMutableArray)allKeyboardInputsM;
- (NSMutableArray)allTouchesM;
- (NSMutableArray)candidatesOfferedM;
- (NSMutableArray)touchLayoutsM;
- (TIDeleteWordEvent)initWithCoder:(id)a3;
- (TIDeleteWordEvent)initWithTIKeyboardState:(id)a3;
- (void)addCandidatesOffered:(id)a3;
- (void)addKeyInput:(id)a3;
- (void)addKeyInputs:(id)a3;
- (void)addTouches:(id)a3 withLayoutIDs:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllKeyboardInputsM:(id)a3;
- (void)setAllTouchesM:(id)a3;
- (void)setCandidatesOfferedM:(id)a3;
- (void)setTouchLayoutsM:(id)a3;
@end

@implementation TIDeleteWordEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchLayoutsM, 0);
  objc_storeStrong((id *)&self->_candidatesOfferedM, 0);
  objc_storeStrong((id *)&self->_allTouchesM, 0);

  objc_storeStrong((id *)&self->_allKeyboardInputsM, 0);
}

- (void)setTouchLayoutsM:(id)a3
{
}

- (NSMutableArray)touchLayoutsM
{
  return self->_touchLayoutsM;
}

- (void)setCandidatesOfferedM:(id)a3
{
}

- (NSMutableArray)candidatesOfferedM
{
  return self->_candidatesOfferedM;
}

- (void)setAllTouchesM:(id)a3
{
}

- (NSMutableArray)allTouchesM
{
  return self->_allTouchesM;
}

- (void)setAllKeyboardInputsM:(id)a3
{
}

- (NSMutableArray)allKeyboardInputsM
{
  return self->_allKeyboardInputsM;
}

- (NSArray)touchLayouts
{
  v2 = [(TIDeleteWordEvent *)self touchLayoutsM];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)candidatesOffered
{
  v2 = [(TIDeleteWordEvent *)self candidatesOfferedM];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allTouches
{
  v2 = [(TIDeleteWordEvent *)self allTouchesM];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allKeyboardInputs
{
  v2 = [(TIDeleteWordEvent *)self allKeyboardInputsM];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addTouches:(id)a3 withLayoutIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TIDeleteWordEvent *)self allTouchesM];
  [v8 addObjectsFromArray:v7];

  id v9 = [(TIDeleteWordEvent *)self touchLayoutsM];
  [v9 addObjectsFromArray:v6];
}

- (void)addCandidatesOffered:(id)a3
{
  id v4 = a3;
  id v5 = [(TIDeleteWordEvent *)self candidatesOfferedM];
  [v5 addObjectsFromArray:v4];
}

- (void)addKeyInputs:(id)a3
{
  id v4 = a3;
  id v5 = [(TIDeleteWordEvent *)self allKeyboardInputsM];
  [v5 addObjectsFromArray:v4];
}

- (void)addKeyInput:(id)a3
{
  id v4 = a3;
  id v5 = [(TIDeleteWordEvent *)self allKeyboardInputsM];
  [v5 addObject:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIDeleteWordEvent;
  id v4 = a3;
  [(TIUserAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_allKeyboardInputsM, @"allKeyboardInputsM", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_allTouchesM forKey:@"allTouchesM"];
  [v4 encodeObject:self->_touchLayoutsM forKey:@"touchLayoutsM"];
  [v4 encodeObject:self->_candidatesOfferedM forKey:@"candidatesOfferedM"];
}

- (TIDeleteWordEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIDeleteWordEvent;
  objc_super v5 = [(TIUserAction *)&v27 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"allKeyboardInputsM"];
    allKeyboardInputsM = v5->_allKeyboardInputsM;
    v5->_allKeyboardInputsM = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"allTouchesM"];
    allTouchesM = v5->_allTouchesM;
    v5->_allTouchesM = (NSMutableArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"touchLayoutsM"];
    touchLayoutsM = v5->_touchLayoutsM;
    v5->_touchLayoutsM = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"candidatesOffered"];
    candidatesOfferedM = v5->_candidatesOfferedM;
    v5->_candidatesOfferedM = (NSMutableArray *)v24;

    [(TIUserAction *)v5 setActionType:1];
  }

  return v5;
}

- (TIDeleteWordEvent)initWithTIKeyboardState:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TIDeleteWordEvent;
  v3 = [(TIUserAction *)&v13 initWithTIKeyboardState:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    allKeyboardInputsM = v3->_allKeyboardInputsM;
    v3->_allKeyboardInputsM = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    allTouchesM = v3->_allTouchesM;
    v3->_allTouchesM = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    candidatesOfferedM = v3->_candidatesOfferedM;
    v3->_candidatesOfferedM = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    touchLayoutsM = v3->_touchLayoutsM;
    v3->_touchLayoutsM = (NSMutableArray *)v10;

    [(TIUserAction *)v3 setActionType:1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface SBUIButtonAction
- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3;
- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3 withHandler:(id)a4;
- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4;
- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
- (unint64_t)buttonEvents;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)sendResponseWithUnHandledButtonEvents:(unint64_t)a3;
@end

@implementation SBUIButtonAction

- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3
{
  return [(SBUIButtonAction *)self initWithButtonEvents:a3 withHandler:&__block_literal_global_8];
}

- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBUIButtonAction.m", 69, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forSetting:1];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__SBUIButtonAction_initWithButtonEvents_withHandler___block_invoke;
  v15[3] = &unk_1E5CCD158;
  id v16 = v7;
  unint64_t v17 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIButtonAction;
  id v10 = v7;
  v11 = [(SBUIButtonAction *)&v14 initWithInfo:v8 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v15 withHandler:10.0];

  return v11;
}

void __53__SBUIButtonAction_initWithButtonEvents_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v11 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v11;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (([v6 unHandledButtonEvents] & ~v7) == 0) {
      goto LABEL_14;
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4F600] code:4 userInfo:0];
    uint64_t v9 = +[BSActionResponse responseForError:v8];

    id v6 = (id)v9;
  }
  else
  {
    id v10 = [v11 error];

    if (v10) {
      [v11 error];
    }
    else {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4F600] code:4 userInfo:0];
    }
    id v6 = +[BSActionResponse responseForError:v8];
  }

LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBUIButtonAction.m" lineNumber:93 description:@"SBUIButtonAction responses must be SBUIButtonActionResponse instances"];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBUIButtonAction;
  [(SBUIButtonAction *)&v10 sendResponse:v7 withCompletion:v8];
}

- (unint64_t)buttonEvents
{
  v2 = [(SBUIButtonAction *)self info];
  id v3 = [v2 objectForSetting:1];
  unint64_t v4 = __eventsFromObject(v3);

  return v4;
}

- (void)sendResponseWithUnHandledButtonEvents:(unint64_t)a3
{
  if ((a3 & ~[(SBUIButtonAction *)self buttonEvents]) != 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBUIButtonAction.m", 111, @"sendResponseWithUnHandledEvents: cannot be passed events that you were not originally given %d", a3);
  }
  if ([(SBUIButtonAction *)self _expectsResponse])
  {
    id v6 = [[SBUIButtonActionResponse alloc] initWithUnHandledButtonEvents:a3];
    v8.receiver = self;
    v8.super_class = (Class)SBUIButtonAction;
    [(SBUIButtonAction *)&v8 sendResponse:v6];
  }
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  if (a4 == 1) {
    return @"events";
  }
  else {
    return 0;
  }
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  if (a6 == 1)
  {
    uint64_t v7 = __eventsFromObject(a5);
    objc_super v8 = SBUIServiceButtonEventDescription(v7);
  }
  else
  {
    objc_super v8 = 0;
  }
  return v8;
}

@end
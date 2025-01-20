@interface _UISceneMaskingClientComponent
- (id)performIntentTransition:(id)a3;
- (id)performWhileMasked:(id)a3 reason:(int64_t)a4;
@end

@implementation _UISceneMaskingClientComponent

- (id)performIntentTransition:(id)a3
{
  return [(_UISceneMaskingClientComponent *)self performWhileMasked:a3 reason:1];
}

- (id)performWhileMasked:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke;
  v19[3] = &unk_1E52F31C8;
  id v20 = v6;
  id v7 = v6;
  v8 = +[_UISceneMaskingAction actionForBeginMaskingWithReason:a4 continuation:v19];
  v9 = [(FBSSceneComponent *)self scene];
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v9 sendPrivateActions:v10];

  ++_UISceneMaskingNewInvalidatableIdentifier_invalidationTokenIndex;
  v11 = NSString;
  v12 = self;
  v13 = (objc_class *)objc_opt_class();
  v14 = objc_msgSend(v11, "stringWithFormat:", @"%s-%p-%lu", class_getName(v13), v12, _UISceneMaskingNewInvalidatableIdentifier_invalidationTokenIndex);

  v15 = [_UIDeallocInvalidatable alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_3;
  v18[3] = &unk_1E52F31F0;
  v18[4] = v12;
  id v16 = -[_UIDeallocInvalidatable initWithIdentifier:faultForDeallocInvalidation:invalidationBlock:](v15, v14, 1, v18);

  return v16;
}

@end
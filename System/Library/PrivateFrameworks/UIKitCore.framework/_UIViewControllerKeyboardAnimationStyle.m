@interface _UIViewControllerKeyboardAnimationStyle
+ (_UIViewControllerKeyboardAnimationStyle)animationStyleWithContext:(id)a3 useCustomTransition:(BOOL)a4;
- (BOOL)allowCustomTransition;
- (BOOL)canDismissWithScrollView;
- (BOOL)canTakeSnapshot;
- (BOOL)disableAlongsideView;
- (BOOL)isAnimationCompleted;
- (BOOL)isEqual:(id)a3;
- (_UIViewControllerKeyboardAnimationStyle)initWithContext:(id)a3;
- (_UIViewControllerKeyboardAnimationStyleInfo)info;
- (_UIViewControllerTransitionContext)context;
- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7;
- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7;
- (void)setAllowCustomTransition:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDisableAlongsideView:(BOOL)a3;
@end

@implementation _UIViewControllerKeyboardAnimationStyle

- (void)setContext:(id)a3
{
}

+ (_UIViewControllerKeyboardAnimationStyle)animationStyleWithContext:(id)a3 useCustomTransition:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[_UIViewControllerKeyboardAnimationStyle alloc] initWithContext:v5];
  -[UIInputViewAnimationStyle setAnimated:](v6, "setAnimated:", [v5 isAnimated]);
  v7 = [v5 _animator];
  [v7 transitionDuration:v5];
  -[UIInputViewAnimationStyle setDuration:](v6, "setDuration:");

  [(UIInputViewAnimationStyle *)v6 setExtraOptions:96];
  v8 = [v5 _animator];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v5 _animator];
    int v10 = [v9 _allowKeyboardToAnimateAlongside:v5];
  }
  else
  {
    int v10 = [v5 isInteractive];
  }

  if (v10) {
    uint64_t v11 = 196608;
  }
  else {
    uint64_t v11 = 458752;
  }
  [(UIInputViewAnimationStyle *)v6 setExtraOptions:[(UIInputViewAnimationStyle *)v6 extraOptions] | v11];
  [(_UIViewControllerKeyboardAnimationStyle *)v6 setDisableAlongsideView:v10 ^ 1u];
  [(_UIViewControllerKeyboardAnimationStyle *)v6 setAllowCustomTransition:v4];
  [(UIInputViewAnimationStyleDirectional *)v6 setOutDirection:0];
  if (v4)
  {
    v12 = [v5 _animator];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [v5 _animator];
      uint64_t v15 = [v14 transition];

      [(UIInputViewAnimationStyleDirectional *)v6 setOutDirection:+[UIViewController _keyboardDirectionForTransition:v15]];
    }
  }

  return v6;
}

- (void)setDisableAlongsideView:(BOOL)a3
{
  self->_allowCustomTransition = a3;
}

- (void)setAllowCustomTransition:(BOOL)a3
{
  *(&self->_allowCustomTransition + 1) = a3;
}

- (_UIViewControllerKeyboardAnimationStyle)initWithContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  v6 = [(_UIViewControllerKeyboardAnimationStyle *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_alloc_init(_UIViewControllerKeyboardAnimationStyleInfo);
    objc_storeStrong((id *)&v7->_info, v8);
    *(&v7->_allowCustomTransition + 1) = 1;
    v9 = [(_UIViewControllerKeyboardAnimationStyle *)v7 context];
    int v10 = [v9 _willCompleteHandler];
    [(_UIViewControllerKeyboardAnimationStyleInfo *)v7->_info setPreviousCompleteHandler:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59___UIViewControllerKeyboardAnimationStyle_initWithContext___block_invoke;
    v14[3] = &unk_1E52EA9D8;
    uint64_t v15 = v8;
    uint64_t v11 = v8;
    v12 = [(_UIViewControllerKeyboardAnimationStyle *)v7 context];
    [v12 _setWillCompleteHandler:v14];
  }
  return v7;
}

- (_UIViewControllerTransitionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)isAnimationCompleted
{
  v2 = [(_UIViewControllerKeyboardAnimationStyle *)self info];
  char v3 = [v2 isAnimationCompleting];

  return v3;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(UIInputViewAnimationStyle *)self animated])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __111___UIViewControllerKeyboardAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v16[3] = &unk_1E52EAA00;
    v16[4] = self;
    id v18 = v12;
    id v19 = v13;
    id v20 = v14;
    id v17 = v15;
    BOOL v21 = v7;
    +[UIView _performWithAnimation:v16];
  }
  else
  {
    [(_UIViewControllerKeyboardAnimationStyle *)self _launchAnimation:v12 afterStarted:v13 completion:v14 forHost:v15 fromCurrentPosition:v7];
  }
}

- (void)_launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = (void (**)(void))a3;
  id v13 = (void (**)(void))a4;
  id v14 = a5;
  id v15 = a6;
  objc_super v16 = [(_UIViewControllerKeyboardAnimationStyle *)self info];
  [v16 setIsAnimationCompleting:0];

  if (+[UIView areAnimationsEnabled])
  {
    id v17 = +[UIDevice currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      goto LABEL_6;
    }
    if ([(_UIViewControllerKeyboardAnimationStyle *)self disableAlongsideView]) {
      goto LABEL_6;
    }
    if (![(UIInputViewAnimationStyle *)self animated]) {
      goto LABEL_6;
    }
    id v19 = [(_UIViewControllerKeyboardAnimationStyle *)self context];
    id v20 = [v19 _auxContext];
    BOOL v21 = [v15 transitioningView];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v26[3] = &unk_1E52EAA28;
    v27 = v12;
    v28 = v13;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2;
    v24[3] = &unk_1E52E79C0;
    v24[4] = self;
    id v25 = v14;
    char v22 = [v20 animateAlongsideTransitionInView:v21 animation:v26 completion:v24];

    if ((v22 & 1) == 0)
    {
LABEL_6:
      v23.receiver = self;
      v23.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
      [(UIInputViewAnimationStyle *)&v23 launchAnimation:v12 afterStarted:v13 completion:v14 forHost:v15 fromCurrentPosition:v7];
    }
  }
  else
  {
    v12[2](v12);
    v13[2](v13);
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
}

- (BOOL)canDismissWithScrollView
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  id v4 = [(UIInputViewAnimationStyleDirectional *)&v8 copyWithZone:a3];
  uint64_t v5 = [(_UIViewControllerKeyboardAnimationStyle *)self context];
  v6 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v5;

  objc_storeStrong((id *)v4 + 9, self->_info);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  if ([(UIInputViewAnimationStyleDirectional *)&v9 isEqual:v4])
  {
    uint64_t v5 = [(_UIViewControllerKeyboardAnimationStyle *)self context];
    v6 = [v4 context];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIViewControllerKeyboardAnimationStyle *)self allowCustomTransition]
    && ([(_UIViewControllerKeyboardAnimationStyle *)self context],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        [v8 _animator],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    uint64_t v11 = [(_UIViewControllerKeyboardAnimationStyle *)self context];
    id v12 = +[UIInputViewAnimationControllerViewController controllerWithContext:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
    id v12 = [(UIInputViewAnimationStyleDirectional *)&v14 controllerForStartPlacement:v6 endPlacement:v7];
  }

  return v12;
}

- (BOOL)canTakeSnapshot
{
  return 1;
}

- (BOOL)disableAlongsideView
{
  return self->_allowCustomTransition;
}

- (_UIViewControllerKeyboardAnimationStyleInfo)info
{
  return self->_info;
}

- (BOOL)allowCustomTransition
{
  return *(&self->_allowCustomTransition + 1);
}

@end
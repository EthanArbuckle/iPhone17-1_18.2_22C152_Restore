@interface _UIUserNotificationAlertView
+ (void)initialize;
- (BOOL)isVisible;
- (id)textFieldAtIndex:(int64_t)a3;
- (int64_t)addButtonWithTitle:(id)a3;
- (void)_cancelUserNotification;
- (void)_removeObservervations;
- (void)cancelAlertView;
- (void)dealloc;
- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setHostedWindow:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)show;
@end

@implementation _UIUserNotificationAlertView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    v3 = (void *)_MergedGlobals_1_29;
    _MergedGlobals_1_29 = v2;
  }
}

- (void)show
{
  if (!self->_userNotification)
  {
    v3 = [(UIAlertView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 willPresentAlertView:self];
    }
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(UIAlertView *)self title];

    if (v5)
    {
      v6 = [(UIAlertView *)self title];
      [v4 setObject:v6 forKey:*MEMORY[0x1E4F1D990]];
    }
    v7 = [(UIAlertView *)self message];

    if (v7)
    {
      v8 = [(UIAlertView *)self message];
      [v4 setObject:v8 forKey:*MEMORY[0x1E4F1D9A8]];
    }
    v9 = [(UIAlertView *)self buttonTitleAtIndex:[(UIAlertView *)self numberOfButtons] - 1];
    [v4 setObject:v9 forKey:*MEMORY[0x1E4F1D9E0]];

    if ([(UIAlertView *)self numberOfButtons] >= 2)
    {
      v10 = [(UIAlertView *)self buttonTitleAtIndex:0];
      [v4 setObject:v10 forKey:*MEMORY[0x1E4F1D9D0]];

      if ([(UIAlertView *)self numberOfButtons] == 3)
      {
        v11 = [(UIAlertView *)self buttonTitleAtIndex:1];
        [v4 setObject:v11 forKey:*MEMORY[0x1E4F1DA10]];
      }
    }
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    v12 = (void *)qword_1EB25BF98;
    uint64_t v54 = qword_1EB25BF98;
    if (!qword_1EB25BF98)
    {
      *(void *)error = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      v48 = __getSBUserNotificationAllowMenuButtonDismissalSymbolLoc_block_invoke;
      v49 = &unk_1E52D9900;
      v50 = &v51;
      v13 = SpringBoardServicesLibrary_2();
      v52[3] = (uint64_t)dlsym(v13, "SBUserNotificationAllowMenuButtonDismissal");
      qword_1EB25BF98 = *(void *)(v50[1] + 24);
      v12 = (void *)v52[3];
    }
    _Block_object_dispose(&v51, 8);
    if (v12)
    {
      uint64_t v14 = *MEMORY[0x1E4F1CFD0];
      [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*v12];
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2020000000;
      v15 = (void *)qword_1EB25BFA0;
      uint64_t v54 = qword_1EB25BFA0;
      if (!qword_1EB25BFA0)
      {
        *(void *)error = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        v48 = __getSBUserNotificationDismissOnLockSymbolLoc_block_invoke;
        v49 = &unk_1E52D9900;
        v50 = &v51;
        v16 = SpringBoardServicesLibrary_2();
        v52[3] = (uint64_t)dlsym(v16, "SBUserNotificationDismissOnLock");
        qword_1EB25BFA0 = *(void *)(v50[1] + 24);
        v15 = (void *)v52[3];
      }
      _Block_object_dispose(&v51, 8);
      if (v15)
      {
        id obj = v3;
        [v4 setObject:v14 forKey:*v15];
        v17 = [MEMORY[0x1E4F1CA48] array];
        v18 = [MEMORY[0x1E4F1CA48] array];
        v19 = [MEMORY[0x1E4F1CA48] array];
        v20 = [MEMORY[0x1E4F1CA48] array];
        v21 = [MEMORY[0x1E4F1CA48] array];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __36___UIUserNotificationAlertView_show__block_invoke;
        aBlock[3] = &unk_1E530DAB8;
        id v22 = v17;
        id v40 = v22;
        id v23 = v18;
        id v41 = v23;
        id v24 = v19;
        id v42 = v24;
        id v25 = v20;
        id v43 = v25;
        id v26 = v21;
        id v44 = v26;
        id v27 = v4;
        id v45 = v27;
        v28 = (void (**)(void *, void *))_Block_copy(aBlock);
        CFOptionFlags v29 = 3;
        switch([(UIAlertView *)self alertViewStyle])
        {
          case UIAlertViewStyleDefault:
            goto LABEL_22;
          case UIAlertViewStyleSecureTextInput:
            CFOptionFlags v29 = 65539;
            goto LABEL_19;
          case UIAlertViewStylePlainTextInput:
LABEL_19:
            v30 = [(_UIUserNotificationAlertView *)self textFieldAtIndex:0];
            v28[2](v28, v30);
            goto LABEL_21;
          case UIAlertViewStyleLoginAndPasswordInput:
            v31 = [(_UIUserNotificationAlertView *)self textFieldAtIndex:0];
            v28[2](v28, v31);

            v30 = [(_UIUserNotificationAlertView *)self textFieldAtIndex:1];
            v28[2](v28, v30);
            CFOptionFlags v29 = 131075;
LABEL_21:

LABEL_22:
            v37 = v22;
            error[0] = 0;
            v32 = CFUserNotificationCreate(0, 0.0, v29, error, (CFDictionaryRef)v27);
            self->_userNotification = v32;
            if (error[0] || (userNotification = v32) == 0)
            {
              objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to create CFUserNotification: %ld (you may need to add permission to send to com.apple.SBUserNotification)", error[0], v22);
              userNotification = self->_userNotification;
            }
            [(id)_MergedGlobals_1_29 setObject:self forKey:userNotification];
            objc_storeStrong(&self->_retainedSelf, self);
            objc_storeStrong(&self->_strongDelegate, obj);
            self->_userNotificationRunLoopSource = CFUserNotificationCreateRunLoopSource(0, self->_userNotification, (CFUserNotificationCallBack)__userNotificationCallback_0, 0);
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
            if (objc_opt_respondsToSelector()) {
              [obj didPresentAlertView:self];
            }

            return;
          default:
            goto LABEL_32;
        }
      }
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationDismissOnLock(void)"];
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"UIAlertView_ViewServiceSupport.m", 29, @"%s", dlerror());
    }
    else
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationAllowMenuButtonDismissal(void)"];
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"UIAlertView_ViewServiceSupport.m", 28, @"%s", dlerror());
    }

    __break(1u);
LABEL_32:
    abort();
  }
}

- (BOOL)isVisible
{
  return self->_userNotification != 0;
}

- (id)textFieldAtIndex:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIUserNotificationAlertView;
  v3 = [(UIAlertView *)&v6 textFieldAtIndex:a3];
  v4 = +[_UIUserNotificationAlertViewRestrictedTextField restrictedProxyForTextField:v3];

  return v4;
}

- (int64_t)addButtonWithTitle:(id)a3
{
  id v4 = a3;
  if ([(UIAlertView *)self numberOfButtons] == 3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"UIAlertViews displayed from view services may have at most three buttons"];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIUserNotificationAlertView;
  id v5 = [(UIAlertView *)&v7 addButtonWithTitle:v4];

  return (int64_t)v5;
}

- (void)setHostedWindow:(id)a3
{
  id v5 = a3;
  [(_UIUserNotificationAlertView *)self _removeObservervations];
  if (v5)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_cancelAlertView name:0x1ED1802C0 object:v5];
  }
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = a3;
  [(_UIUserNotificationAlertView *)self _removeObservervations];
  if (v5)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_cancelAlertView name:@"_UIViewServiceRemoteViewControllerWillDisconnectNotification" object:v5];
  }
}

- (void)cancelAlertView
{
  id v3 = [(UIAlertView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v3 alertViewCancel:self];
    [(_UIUserNotificationAlertView *)self _cancelUserNotification];
  }
  else
  {
    [(_UIUserNotificationAlertView *)self dismissWithClickedButtonIndex:[(UIAlertView *)self cancelButtonIndex] animated:0];
  }
}

- (void)_cancelUserNotification
{
  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    [(id)_MergedGlobals_1_29 removeObjectForKey:self->_userNotification];
    CFRelease(self->_userNotification);
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotification = 0;
    id v5 = self->_retainedSelf;
    id v6 = self->_strongDelegate;
    id retainedSelf = self->_retainedSelf;
    self->_id retainedSelf = 0;

    id strongDelegate = self->_strongDelegate;
    self->_id strongDelegate = 0;
  }
}

- (void)_removeObservervations
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED1802C0 object:0];
  [v3 removeObserver:self name:@"_UIViewServiceRemoteViewControllerWillDisconnectNotification" object:0];
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  id v6 = [(UIAlertView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 alertView:self willDismissWithButtonIndex:a3];
  }
  [(_UIUserNotificationAlertView *)self _cancelUserNotification];
  if (objc_opt_respondsToSelector()) {
    [v6 alertView:self didDismissWithButtonIndex:a3];
  }
}

- (void)dealloc
{
  [(_UIUserNotificationAlertView *)self _removeObservervations];
  if (self->_userNotification) {
    [(_UIUserNotificationAlertView *)self cancelAlertView];
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIUserNotificationAlertView;
  [(UIAlertView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainedSelf, 0);
  objc_storeStrong(&self->_strongDelegate, 0);
}

@end
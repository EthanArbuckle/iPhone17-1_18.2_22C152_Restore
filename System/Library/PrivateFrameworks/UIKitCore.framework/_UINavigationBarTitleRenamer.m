@interface _UINavigationBarTitleRenamer
+ (id)renameServer;
- (BOOL)_session:(id)a3 textFieldShouldEndRenamingWithTitle:(id)a4;
- (NSMutableSet)trackedSessions;
- (_UINavigationBarTitleRenamer)init;
- (_UINavigationBarTitleRenamerDelegate)delegate;
- (id)_session:(id)a3 textFieldWillBeginRenamingWithTitle:(id)a4 selectedRange:(_NSRange *)a5;
- (id)description;
- (id)sessionWithIdentifier:(id)a3;
- (void)_session:(id)a3 fileRenameDidEnd:(id)a4;
- (void)_session:(id)a3 fileRenameDidFail:(id)a4;
- (void)_sessionDidCancel:(id)a3;
- (void)_sessionTextFieldDidEndEditing:(id)a3;
- (void)dealloc;
- (void)endSession:(id)a3;
- (void)sceneWillDeactivateNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSession:(id)a3;
@end

@implementation _UINavigationBarTitleRenamer

+ (id)renameServer
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44___UINavigationBarTitleRenamer_renameServer__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (qword_1EB262440 != -1) {
    dispatch_once(&qword_1EB262440, v4);
  }
  v2 = (void *)_MergedGlobals_1196;
  return v2;
}

- (_UINavigationBarTitleRenamer)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTitleRenamer;
  v2 = [(_UINavigationBarTitleRenamer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(unsigned char *)&v2->_flags &= ~1u;
    uint64_t v4 = objc_opt_new();
    trackedSessions = v3->_trackedSessions;
    v3->_trackedSessions = (NSMutableSet *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_sceneWillDeactivateNotification_ name:@"UISceneWillDeactivateNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamer;
  [(_UINavigationBarTitleRenamer *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; active sessions: %@>", v5, self, self->_trackedSessions];

  return v6;
}

- (void)sceneWillDeactivateNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 object];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 existingRenamerContentView];
        v13 = v12;
        if (v12)
        {
          v14 = [v12 _window];
          v15 = [v14 windowScene];

          if (v15 == v4) {
            [v11 cancelSession];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)startSession:(id)a3
{
  id v14 = a3;
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v5 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
      uint64_t v9 = [v8 anyObject];
      [v7 handleFailureInMethod:a2, self, @"_UINavigationBarTitleRenamer.m", 84, @"Unable to start session. Session already in progress: %@", v9 object file lineNumber description];
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v10 = [v14 sessionIdentifier];
    v11 = [(_UINavigationBarTitleRenamer *)self sessionWithIdentifier:v10];

    if (v11)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTitleRenamer.m" lineNumber:90 description:@"Renamer is already tracking a session with this identifier."];
    }
  }
  v12 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
  [v12 addObject:v14];

  [v14 sessionDidStartInRenamer:self];
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  [v4 sessionDidEnd];
  id v5 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
  [v5 removeObject:v4];
}

- (id)sessionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___UINavigationBarTitleRenamer_sessionWithIdentifier___block_invoke;
  v10[3] = &unk_1E5302018;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_filter:", v10);
  uint64_t v8 = [v7 anyObject];

  return v8;
}

- (id)_session:(id)a3 textFieldWillBeginRenamingWithTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  id v8 = a4;
  id v9 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v9);
  v10 = [(_UINavigationBarTitleRenamer *)self delegate];
  id v11 = [v10 titleRenamer:self session:v9 willBeginRenamingWithTitle:v8 selectedRange:a5];

  return v11;
}

- (BOOL)_session:(id)a3 textFieldShouldEndRenamingWithTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  id v8 = [(_UINavigationBarTitleRenamer *)self delegate];
  LOBYTE(self) = [v8 titleRenamer:self session:v7 shouldEndRenamingWithTitle:v6];

  return (char)self;
}

- (void)_sessionTextFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  id v6 = [(_UINavigationBarTitleRenamer *)self delegate];
  id v5 = [v4 title];
  [v6 titleRenamer:self session:v4 didEndRenamingWithTitle:v5];
}

- (void)_sessionDidCancel:(id)a3
{
  id v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  id v5 = [(_UINavigationBarTitleRenamer *)self trackedSessions];
  [v5 removeObject:v4];

  id v6 = [(_UINavigationBarTitleRenamer *)self delegate];
  [v6 titleRenamer:self didCancelSession:v4];
}

- (void)_session:(id)a3 fileRenameDidFail:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  id v8 = [(_UINavigationBarTitleRenamer *)self delegate];
  [v8 titleRenamer:self session:v7 fileRenameDidFail:v6];
}

- (void)_session:(id)a3 fileRenameDidEnd:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  id v8 = [(_UINavigationBarTitleRenamer *)self delegate];
  [v8 titleRenamer:self session:v7 fileRenameDidEnd:v6];
}

- (_UINavigationBarTitleRenamerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationBarTitleRenamerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)trackedSessions
{
  return self->_trackedSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedSessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
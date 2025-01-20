@interface UserNavigationDropInteraction
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (UserNavigationDropInteraction)initWithOpensNewTab:(BOOL)a3 tabOrder:(int64_t)a4 navigationHandler:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
@end

@implementation UserNavigationDropInteraction

- (void).cxx_destruct
{
}

- (UserNavigationDropInteraction)initWithOpensNewTab:(BOOL)a3 tabOrder:(int64_t)a4 navigationHandler:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UserNavigationDropInteraction;
  v9 = [(UIDropInteraction *)&v14 initWithDelegate:self];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x1E4E42950](v8);
    id navigationHandler = v9->_navigationHandler;
    v9->_id navigationHandler = (id)v10;

    v9->_opensNewTab = a3;
    v9->_tabOrder = a4;
    v12 = v9;
  }

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return [MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:a4];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];
  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F78598];
  id v6 = a4;
  v7 = [v5 builder];
  [v7 setPrefersOpenInNewTab:self->_opensNewTab];
  [v7 setPreferredTabOrder:self->_tabOrder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__UserNavigationDropInteraction_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E6D78D20;
  v8[4] = self;
  [v7 buildNavigationIntentForDropSession:v6 completionHandler:v8];
}

uint64_t __61__UserNavigationDropInteraction_dropInteraction_performDrop___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(result + 32) + 80) + 16))();
  }
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

@end
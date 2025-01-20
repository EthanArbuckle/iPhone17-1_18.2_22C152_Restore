@interface TUApplicationWorkspace
+ (id)shared;
- (LSApplicationWorkspace)applicationWorkspace;
- (TUApplicationWorkspace)initWithApplicationWorkspace:(id)a3;
- (void)openSensitiveURL:(id)a3 options:(id)a4;
@end

@implementation TUApplicationWorkspace

+ (id)shared
{
  if (shared_onceToken[0] != -1) {
    dispatch_once(shared_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)shared_instance;
  return v2;
}

void __32__TUApplicationWorkspace_shared__block_invoke()
{
  v0 = [TUApplicationWorkspace alloc];
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v1 = [(TUApplicationWorkspace *)v0 initWithApplicationWorkspace:v3];
  v2 = (void *)shared_instance;
  shared_instance = v1;
}

- (TUApplicationWorkspace)initWithApplicationWorkspace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUApplicationWorkspace;
  v6 = [(TUApplicationWorkspace *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationWorkspace, a3);
  }

  return v7;
}

- (void)openSensitiveURL:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUApplicationWorkspace *)self applicationWorkspace];
  [v8 openSensitiveURL:v7 withOptions:v6];
}

- (LSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void).cxx_destruct
{
}

@end
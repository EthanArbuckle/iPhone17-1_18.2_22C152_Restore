@interface PKExternalProviders
- (PKExternalProviders)init;
- (PKExternalProviders)initWithLaunchServicesProvider:(id)a3;
- (PKFilesystemProvider)filesystem;
- (PKLaunchProvider)launch;
- (PKLaunchServicesProvider)ls;
- (PKRunningBoardProvider)runningboard;
- (PKSandboxProvider)sandbox;
- (PKSystemProvider)sys;
@end

@implementation PKExternalProviders

- (PKExternalProviders)init
{
  v16.receiver = self;
  v16.super_class = (Class)PKExternalProviders;
  v2 = [(PKExternalProviders *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    ls = v2->_ls;
    v2->_ls = (PKLaunchServicesProvider *)v3;

    uint64_t v5 = objc_opt_new();
    filesystem = v2->_filesystem;
    v2->_filesystem = (PKFilesystemProvider *)v5;

    uint64_t v7 = objc_opt_new();
    launch = v2->_launch;
    v2->_launch = (PKLaunchProvider *)v7;

    uint64_t v9 = objc_opt_new();
    sandbox = v2->_sandbox;
    v2->_sandbox = (PKSandboxProvider *)v9;

    uint64_t v11 = objc_opt_new();
    runningboard = v2->_runningboard;
    v2->_runningboard = (PKRunningBoardProvider *)v11;

    uint64_t v13 = objc_opt_new();
    sys = v2->_sys;
    v2->_sys = (PKSystemProvider *)v13;
  }
  return v2;
}

- (PKLaunchServicesProvider)ls
{
  return self->_ls;
}

- (PKExternalProviders)initWithLaunchServicesProvider:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKExternalProviders;
  v6 = [(PKExternalProviders *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ls, a3);
    uint64_t v8 = objc_opt_new();
    filesystem = v7->_filesystem;
    v7->_filesystem = (PKFilesystemProvider *)v8;

    uint64_t v10 = objc_opt_new();
    launch = v7->_launch;
    v7->_launch = (PKLaunchProvider *)v10;

    uint64_t v12 = objc_opt_new();
    sandbox = v7->_sandbox;
    v7->_sandbox = (PKSandboxProvider *)v12;

    uint64_t v14 = objc_opt_new();
    runningboard = v7->_runningboard;
    v7->_runningboard = (PKRunningBoardProvider *)v14;

    uint64_t v16 = objc_opt_new();
    sys = v7->_sys;
    v7->_sys = (PKSystemProvider *)v16;
  }
  return v7;
}

- (PKFilesystemProvider)filesystem
{
  return self->_filesystem;
}

- (PKLaunchProvider)launch
{
  return self->_launch;
}

- (PKSandboxProvider)sandbox
{
  return self->_sandbox;
}

- (PKRunningBoardProvider)runningboard
{
  return self->_runningboard;
}

- (PKSystemProvider)sys
{
  return self->_sys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sys, 0);
  objc_storeStrong((id *)&self->_runningboard, 0);
  objc_storeStrong((id *)&self->_sandbox, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_ls, 0);
}

@end
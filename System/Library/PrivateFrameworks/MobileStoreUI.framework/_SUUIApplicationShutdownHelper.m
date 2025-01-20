@interface _SUUIApplicationShutdownHelper
- (_SUUIApplicationShutdownHelper)initWithApplicationController:(id)a3;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation _SUUIApplicationShutdownHelper

- (_SUUIApplicationShutdownHelper)initWithApplicationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUUIApplicationShutdownHelper;
  v6 = [(_SUUIApplicationShutdownHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationController, a3);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_taskID != *MEMORY[0x263F833E0])
  {
    v3 = [MEMORY[0x263F82438] sharedApplication];
    [v3 endBackgroundTask:self->_taskID];
  }
  v4.receiver = self;
  v4.super_class = (Class)_SUUIApplicationShutdownHelper;
  [(_SUUIApplicationShutdownHelper *)&v4 dealloc];
}

- (void)start
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___SUUIApplicationShutdownHelper_start__block_invoke;
  v4[3] = &unk_265400980;
  v4[4] = self;
  self->_taskID = [v3 beginBackgroundTaskWithExpirationHandler:v4];
}

- (void)stop
{
  applicationController = self->_applicationController;
  self->_applicationController = 0;

  unint64_t v4 = *MEMORY[0x263F833E0];
  if (self->_taskID != *MEMORY[0x263F833E0])
  {
    id v5 = [MEMORY[0x263F82438] sharedApplication];
    [v5 endBackgroundTask:self->_taskID];

    self->_taskID = v4;
  }
}

- (void).cxx_destruct
{
}

@end
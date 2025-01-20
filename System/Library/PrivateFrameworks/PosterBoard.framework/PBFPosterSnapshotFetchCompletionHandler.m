@interface PBFPosterSnapshotFetchCompletionHandler
- (PBFPosterSnapshotFetchCompletionHandler)initWithRequest:(id)a3 completionHandler:(id)a4;
- (PBFPosterSnapshotRequest)request;
- (id)completionHandler;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)finishWithSuccess:(id)a3;
@end

@implementation PBFPosterSnapshotFetchCompletionHandler

- (PBFPosterSnapshotFetchCompletionHandler)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completionHandler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotFetchCompletionHandler initWithRequest:completionHandler:](a2, (uint64_t)self, (uint64_t)v18);
    }
LABEL_11:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32763CCLL);
  }
  if (!v8)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"request"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotFetchCompletionHandler initWithRequest:completionHandler:](a2, (uint64_t)self, (uint64_t)v18);
    }
    goto LABEL_11;
  }
  v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)PBFPosterSnapshotFetchCompletionHandler;
  v11 = [(PBFPosterSnapshotFetchCompletionHandler *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    uint64_t v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    didFireCompletionHandler = v12->_didFireCompletionHandler;
    v12->_didFireCompletionHandler = (BSAtomicFlag *)v15;
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_FAULT, "Completion handler deallocated without being fired! Request: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)finishWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(BSAtomicFlag *)self->_didFireCompletionHandler setFlag:1];
  v6 = PBFLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      request = self->_request;
      int v10 = 138543362;
      v11 = request;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_INFO, "Fired ERROR completion handler for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    if (v7)
    {
      id v9 = self->_request;
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_INFO, "Already fired completion handler for %{public}@; bailing",
        (uint8_t *)&v10,
        0xCu);
    }
  }
}

- (void)finishWithSuccess:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(BSAtomicFlag *)self->_didFireCompletionHandler setFlag:1];
  v6 = PBFLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      request = self->_request;
      int v10 = 138543362;
      v11 = request;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_INFO, "Fired SUCCESS completion handler for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    if (v7)
    {
      id v9 = self->_request;
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_INFO, "Already fired completion handler for %{public}@; bailing",
        (uint8_t *)&v10,
        0xCu);
    }
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_didFireCompletionHandler, 0);
}

- (void)initWithRequest:(uint64_t)a3 completionHandler:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  int v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PBFPosterSnapshotFetchCompletionHandler.m";
  __int16 v10 = 1024;
  int v11 = 21;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithRequest:(uint64_t)a3 completionHandler:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  int v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PBFPosterSnapshotFetchCompletionHandler.m";
  __int16 v10 = 1024;
  int v11 = 22;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end
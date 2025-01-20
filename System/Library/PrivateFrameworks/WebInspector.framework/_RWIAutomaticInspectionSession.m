@interface _RWIAutomaticInspectionSession
- (BOOL)matchesPageId:(id)a3 applicationIdentifier:(id)a4;
- (BOOL)receivedRejectResponse;
- (NSArray)debuggers;
- (NSString)identifier;
- (_RWIAutomaticInspectionSession)initWithPageId:(id)a3 applicationIdentifier:(id)a4 applicationPID:(int)a5 debuggers:(id)a6;
- (void)_sendQuery;
- (void)start;
@end

@implementation _RWIAutomaticInspectionSession

- (_RWIAutomaticInspectionSession)initWithPageId:(id)a3 applicationIdentifier:(id)a4 applicationPID:(int)a5 debuggers:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_RWIAutomaticInspectionSession;
  v13 = [(_RWIAutomaticInspectionSession *)&v26 init];
  if (v13)
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    uint64_t v16 = [v15 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    debuggers = v13->_debuggers;
    v13->_debuggers = (NSArray *)v18;

    uint64_t v20 = [v10 copy];
    pageId = v13->_pageId;
    v13->_pageId = (NSNumber *)v20;

    uint64_t v22 = [v11 copy];
    applicationIdentifier = v13->_applicationIdentifier;
    v13->_applicationIdentifier = (NSString *)v22;

    v13->_applicationPID = a5;
    v13->_currentDebuggerIndex = 0;
    v24 = v13;
  }

  return v13;
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = RWIDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pageId = self->_pageId;
    applicationIdentifier = self->_applicationIdentifier;
    identifier = self->_identifier;
    int v7 = [(NSArray *)self->_debuggers count];
    int v8 = 138544130;
    v9 = identifier;
    __int16 v10 = 2114;
    id v11 = pageId;
    __int16 v12 = 2114;
    v13 = applicationIdentifier;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_226FA0000, v3, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate START : Session (%{public}@) PageId (%{public}@) Application (%{public}@) Debuggers (%u)", (uint8_t *)&v8, 0x26u);
  }

  [(_RWIAutomaticInspectionSession *)self _sendQuery];
}

- (BOOL)receivedRejectResponse
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t currentDebuggerIndex = self->_currentDebuggerIndex;
  NSUInteger v4 = [(NSArray *)self->_debuggers count] - 1;
  v5 = RWIDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (currentDebuggerIndex == v4)
  {
    if (v6)
    {
      identifier = self->_identifier;
      int v10 = 138543362;
      id v11 = identifier;
      _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : Final Rejection Session (%{public}@)", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      int v8 = self->_identifier;
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : Continuing Session (%{public}@)", (uint8_t *)&v10, 0xCu);
    }

    ++self->_currentDebuggerIndex;
    [(_RWIAutomaticInspectionSession *)self _sendQuery];
  }
  return currentDebuggerIndex == v4;
}

- (void)_sendQuery
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(NSArray *)self->_debuggers objectAtIndex:self->_currentDebuggerIndex];
  long long v6 = *(_OWORD *)&self->_pageId;
  v5[0] = @"WIRPageIdentifierKey";
  v5[1] = @"WIRApplicationIdentifierKey";
  v5[2] = @"WIRAutomaticInspectionSessionIdentifierKey";
  identifier = self->_identifier;
  NSUInteger v4 = [NSDictionary dictionaryWithObjects:&v6 forKeys:v5 count:3];
  objc_msgSend(v3, "_rpc_reportAutomaticInspectionCandidate:", v4);
}

- (BOOL)matchesPageId:(id)a3 applicationIdentifier:(id)a4
{
  id v6 = a4;
  if ([(NSNumber *)self->_pageId isEqualToNumber:a3]) {
    BOOL v7 = [(NSString *)self->_applicationIdentifier isEqualToString:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)debuggers
{
  return self->_debuggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_debuggers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
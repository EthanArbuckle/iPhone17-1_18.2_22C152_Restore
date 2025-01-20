@interface MLDMutableDiagnostic
- (void)setActiveClients:(id)a3;
- (void)setActiveImportOperations:(id)a3;
- (void)setActiveTransactions:(id)a3;
- (void)setActiveXPCTransactions:(id)a3;
- (void)setDatabaseFileDiagnostics:(id)a3;
- (void)setDate:(id)a3;
- (void)setEnqueuedConcurrentOperations:(id)a3;
- (void)setEnqueuedLimitedQueueOperations:(id)a3;
- (void)setEnqueuedSerialOperations:(id)a3;
- (void)setLastImportError:(id)a3;
- (void)setLibraryConnectionDiagnostics:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setSuspendedImportOperations:(id)a3;
- (void)setWriterSuspended:(BOOL)a3;
@end

@implementation MLDMutableDiagnostic

- (void)setLibraryConnectionDiagnostics:(id)a3
{
  if (self->super._libraryConnectionDiagnostics != a3)
  {
    self->super._libraryConnectionDiagnostics = (NSDictionary *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setSuspendedImportOperations:(id)a3
{
  if (self->super._suspendedImportOperations != a3)
  {
    self->super._suspendedImportOperations = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setActiveImportOperations:(id)a3
{
  if (self->super._activeImportOperations != a3)
  {
    self->super._activeImportOperations = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setLastImportError:(id)a3
{
  v5 = (NSError *)a3;
  lastImportError = self->super._lastImportError;
  p_lastImportError = &self->super._lastImportError;
  if (lastImportError != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_lastImportError, a3);
    v5 = v8;
  }
}

- (void)setEnqueuedLimitedQueueOperations:(id)a3
{
  if (self->super._enqueuedLimitedQueueOperations != a3)
  {
    self->super._enqueuedLimitedQueueOperations = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setEnqueuedSerialOperations:(id)a3
{
  if (self->super._enqueuedSerialOperations != a3)
  {
    self->super._enqueuedSerialOperations = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setEnqueuedConcurrentOperations:(id)a3
{
  if (self->super._enqueuedConcurrentOperations != a3)
  {
    self->super._enqueuedConcurrentOperations = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setActiveTransactions:(id)a3
{
  if (self->super._activeTransactions != a3)
  {
    self->super._activeTransactions = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setWriterSuspended:(BOOL)a3
{
  self->super._writerSuspended = a3;
}

- (void)setDatabaseFileDiagnostics:(id)a3
{
  if (self->super._databaseFileDiagnostics != a3)
  {
    self->super._databaseFileDiagnostics = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setActiveXPCTransactions:(id)a3
{
  if (self->super._activeXPCTransactions != a3)
  {
    self->super._activeXPCTransactions = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setActiveClients:(id)a3
{
  if (self->super._activeClients != a3)
  {
    self->super._activeClients = (NSArray *)[a3 copy];
    _objc_release_x1();
  }
}

- (void)setLocked:(BOOL)a3
{
  if (self->super._locked != a3) {
    self->super._locked = a3;
  }
}

- (void)setDate:(id)a3
{
  v5 = (NSDate *)a3;
  date = self->super._date;
  p_date = &self->super._date;
  if (date != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_date, a3);
    v5 = v8;
  }
}

@end
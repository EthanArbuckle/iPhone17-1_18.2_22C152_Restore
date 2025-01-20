@interface MLDDiagnostic
- (BOOL)locked;
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (BOOL)writerSuspended;
- (MLDDiagnostic)init;
- (MLDDiagnostic)initWithReason:(id)a3;
- (NSArray)activeClients;
- (NSArray)activeImportOperations;
- (NSArray)activeTransactions;
- (NSArray)activeXPCTransactions;
- (NSArray)databaseFileDiagnostics;
- (NSArray)enqueuedConcurrentOperations;
- (NSArray)enqueuedLimitedQueueOperations;
- (NSArray)enqueuedSerialOperations;
- (NSArray)suspendedImportOperations;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)libraryConnectionDiagnostics;
- (NSError)lastImportError;
- (NSString)reason;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6;
@end

@implementation MLDDiagnostic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_libraryConnectionDiagnostics, 0);
  objc_storeStrong((id *)&self->_suspendedImportOperations, 0);
  objc_storeStrong((id *)&self->_activeImportOperations, 0);
  objc_storeStrong((id *)&self->_lastImportError, 0);
  objc_storeStrong((id *)&self->_enqueuedLimitedQueueOperations, 0);
  objc_storeStrong((id *)&self->_enqueuedSerialOperations, 0);
  objc_storeStrong((id *)&self->_enqueuedConcurrentOperations, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_databaseFileDiagnostics, 0);
  objc_storeStrong((id *)&self->_activeXPCTransactions, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (NSDictionary)libraryConnectionDiagnostics
{
  return self->_libraryConnectionDiagnostics;
}

- (NSArray)suspendedImportOperations
{
  return self->_suspendedImportOperations;
}

- (NSArray)activeImportOperations
{
  return self->_activeImportOperations;
}

- (NSError)lastImportError
{
  return self->_lastImportError;
}

- (NSArray)enqueuedLimitedQueueOperations
{
  return self->_enqueuedLimitedQueueOperations;
}

- (NSArray)enqueuedSerialOperations
{
  return self->_enqueuedSerialOperations;
}

- (NSArray)enqueuedConcurrentOperations
{
  return self->_enqueuedConcurrentOperations;
}

- (NSArray)activeTransactions
{
  return self->_activeTransactions;
}

- (BOOL)writerSuspended
{
  return self->_writerSuspended;
}

- (NSArray)databaseFileDiagnostics
{
  return self->_databaseFileDiagnostics;
}

- (NSArray)activeXPCTransactions
{
  return self->_activeXPCTransactions;
}

- (NSArray)activeClients
{
  return self->_activeClients;
}

- (BOOL)locked
{
  return self->_locked;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)date
{
  return self->_date;
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  for (id i = objc_alloc_init((Class)NSMutableString); a6; --a6)
    [i appendString:@"    "];
  [v10 appendFormat:@"%@%@:", i, v11];
  if ([v9 count])
  {
    id v20 = v11;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v18 longDescription];
          }
          else {
          v19 = [v18 description];
          }
          [v10 appendFormat:@"\n%@%@", i, v19];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    id v11 = v20;
  }
  else
  {
    [v10 appendFormat:@"\n%@(None)", i];
  }
  [v10 appendString:@"\n"];
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  v5 = (id *)objc_alloc_init(a4);
  objc_storeStrong(v5 + 1, self->_date);
  *((unsigned char *)v5 + 16) = self->_locked;
  id v6 = [(NSArray *)self->_activeClients copy];
  id v7 = v5[3];
  v5[3] = v6;

  id v8 = [(NSArray *)self->_activeXPCTransactions copy];
  id v9 = v5[4];
  v5[4] = v8;

  id v10 = [(NSArray *)self->_databaseFileDiagnostics copy];
  id v11 = v5[5];
  v5[5] = v10;

  *((unsigned char *)v5 + 48) = self->_writerSuspended;
  id v12 = [(NSArray *)self->_activeTransactions copy];
  id v13 = v5[7];
  v5[7] = v12;

  id v14 = [(NSArray *)self->_enqueuedConcurrentOperations copy];
  id v15 = v5[8];
  v5[8] = v14;

  id v16 = [(NSArray *)self->_enqueuedSerialOperations copy];
  id v17 = v5[9];
  v5[9] = v16;

  id v18 = [(NSArray *)self->_enqueuedLimitedQueueOperations copy];
  id v19 = v5[10];
  v5[10] = v18;

  objc_storeStrong(v5 + 11, self->_lastImportError);
  id v20 = [(NSArray *)self->_activeImportOperations copy];
  id v21 = v5[12];
  v5[12] = v20;

  id v22 = [(NSArray *)self->_suspendedImportOperations copy];
  id v23 = v5[13];
  v5[13] = v22;

  id v24 = [(NSDictionary *)self->_libraryConnectionDiagnostics copy];
  id v25 = v5[14];
  v5[14] = v24;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MLDDiagnostic *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MLDDiagnostic *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MLDDiagnostic *)self description];
  LOBYTE(a4) = [v7 writeToFile:v6 atomically:1 encoding:4 error:a4];

  return (char)a4;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendString:@"MediaLibrary Diagnostic\n"];
  [v3 appendFormat:@"Collected at %@\n", self->_date];
  if (self->_reason) {
    [v3 appendFormat:@"Reason: %@\n", self->_reason];
  }
  [v3 appendString:@"\n"];
  if (self->_locked) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  [v3 appendFormat:@"Locked: %@\n\n", v4];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_activeClients toString:v3 withTitle:@"Active Clients"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_activeXPCTransactions toString:v3 withTitle:@"Active XPC Transactions"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_databaseFileDiagnostics toString:v3 withTitle:@"Database Files"];
  [v3 appendString:@"\n"];
  if (self->_writerSuspended) {
    CFStringRef v5 = @"SUSPENDED";
  }
  else {
    CFStringRef v5 = @"ACTIVE";
  }
  [v3 appendFormat:@"Writer State: %@\n\n", v5];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_activeTransactions toString:v3 withTitle:@"Active Transactions"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_enqueuedConcurrentOperations toString:v3 withTitle:@"Enqueued Concurrent Operations"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_enqueuedSerialOperations toString:v3 withTitle:@"Enqueued Serial Operations"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_enqueuedLimitedQueueOperations toString:v3 withTitle:@"Enqueue Limited Size Queue Operatons"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"Last Importer Error: %@\n\n", self->_lastImportError];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_activeImportOperations toString:v3 withTitle:@"Active Import Operations"];
  [v3 appendString:@"\n"];
  [(MLDDiagnostic *)self _appendDescribableArray:self->_suspendedImportOperations toString:v3 withTitle:@"Suspended Import Operations"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"Database Connections:\n"];
  libraryConnectionDiagnostics = self->_libraryConnectionDiagnostics;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C098;
  v10[3] = &unk_10002CE40;
  id v7 = v3;
  id v11 = v7;
  id v12 = self;
  [(NSDictionary *)libraryConnectionDiagnostics enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = v7;

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  date = self->_date;
  v17[0] = @"_date";
  v17[1] = @"_reason";
  CFStringRef reason = (const __CFString *)self->_reason;
  if (!reason) {
    CFStringRef reason = @"@";
  }
  v18[0] = date;
  v18[1] = reason;
  v17[2] = @"_locked";
  CFStringRef v5 = +[NSNumber numberWithBool:self->_locked];
  long long v19 = *(_OWORD *)&self->_activeClients;
  v17[3] = @"_activeClients";
  v17[4] = @"_activeXPCTransactions";
  databaseFileDiagnostics = self->_databaseFileDiagnostics;
  v18[2] = v5;
  id v20 = databaseFileDiagnostics;
  v17[5] = @"_databaseFileDiagnostics";
  v17[6] = @"_writerSuspended";
  id v7 = +[NSNumber numberWithBool:self->_writerSuspended];
  id v21 = v7;
  v17[7] = @"_activeTransactions";
  id v8 = [(NSArray *)self->_activeTransactions debugDescription];
  long long v23 = *(_OWORD *)&self->_enqueuedConcurrentOperations;
  v17[8] = @"_enqueuedConcurrentOperations";
  v17[9] = @"_enqueuedSerialOperations";
  enqueuedLimitedQueueOperations = self->_enqueuedLimitedQueueOperations;
  lastImportError = self->_lastImportError;
  id v22 = v8;
  id v24 = enqueuedLimitedQueueOperations;
  v17[10] = @"_enqueuedLimitedSizeQueueOperations";
  v17[11] = @"_lastImportError";
  if (lastImportError) {
    CFStringRef v11 = (const __CFString *)lastImportError;
  }
  else {
    CFStringRef v11 = @"@";
  }
  activeImportOperations = self->_activeImportOperations;
  suspendedImportOperations = self->_suspendedImportOperations;
  CFStringRef v25 = v11;
  v26 = activeImportOperations;
  v17[12] = @"_activeImportOperations";
  v17[13] = @"_suspendedImportOperations";
  v17[14] = @"_libraryConnectionDiagnostics";
  libraryConnectionDiagnostics = self->_libraryConnectionDiagnostics;
  v27 = suspendedImportOperations;
  v28 = libraryConnectionDiagnostics;
  id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:15];

  return (NSDictionary *)v15;
}

- (MLDDiagnostic)init
{
  return [(MLDDiagnostic *)self initWithReason:0];
}

- (MLDDiagnostic)initWithReason:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLDDiagnostic;
  CFStringRef v5 = [(MLDDiagnostic *)&v11 init];
  if (v5)
  {
    id v6 = (NSDate *)objc_alloc_init((Class)NSDate);
    date = v5->_date;
    v5->_date = v6;

    id v8 = (NSString *)[v4 copy];
    CFStringRef reason = v5->_reason;
    v5->_CFStringRef reason = v8;
  }
  return v5;
}

@end
@interface NMLogActionsCoalescer
- (NMLogActionsCoalescer)initWithIdentifier:(id)a3 logCategory:(id)a4;
- (NSString)prefix;
- (id)_logMessageFromPendingLogActions:(id)a3 includingPartNumber:(BOOL)a4;
- (unint64_t)messageBufferLimit;
- (void)_addAction:(id)a3 toPendingActions:(id)a4 limit:(unint64_t)a5;
- (void)_writeLogMessageFromActions:(id)a3 includingPartNumber:(BOOL)a4;
- (void)addLogAction:(id)a3;
- (void)flush;
- (void)setMessageBufferLimit:(unint64_t)a3;
- (void)setPrefix:(id)a3;
@end

@implementation NMLogActionsCoalescer

- (NMLogActionsCoalescer)initWithIdentifier:(id)a3 logCategory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMLogActionsCoalescer;
  v9 = [(NMLogActionsCoalescer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_category, a4);
    v10->_messageBufferLimit = 300;
    uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:300];
    pendingLogActions = v10->_pendingLogActions;
    v10->_pendingLogActions = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)setMessageBufferLimit:(unint64_t)a3
{
  if (self->_messageBufferLimit != a3)
  {
    self->_messageBufferLimit = a3;
    if ([(NSMutableArray *)self->_pendingLogActions count]) {
      [(NMLogActionsCoalescer *)self _writeLogMessageFromActions:self->_pendingLogActions includingPartNumber:1];
    }
    self->_pendingLogActions = [MEMORY[0x263EFF980] arrayWithCapacity:self->_messageBufferLimit];
    MEMORY[0x270F9A758]();
  }
}

- (void)addLogAction:(id)a3
{
}

- (void)flush
{
  [(NMLogActionsCoalescer *)self _writeLogMessageFromActions:self->_pendingLogActions includingPartNumber:self->_partNumber != 0];
  [(NSMutableArray *)self->_pendingLogActions removeAllObjects];
  self->_partNumber = 0;
}

- (void)_addAction:(id)a3 toPendingActions:(id)a4 limit:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if ([v8 count] == a5)
  {
    [(NMLogActionsCoalescer *)self _writeLogMessageFromActions:v8 includingPartNumber:1];
    [v8 removeAllObjects];
  }
  [v8 addObject:v9];
}

- (id)_logMessageFromPendingLogActions:(id)a3 includingPartNumber:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (part #%lu) ", self->_partNumber);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &stru_26D512A48;
  }
  id v8 = [v6 valueForKey:@"logMessage"];
  id v9 = [v8 componentsJoinedByString:@"\n"];

  v10 = [NSString stringWithFormat:@"%@ - %@%@: <\n%@\n>", self->_prefix, self->_identifier, v7, v9];

  return v10;
}

- (void)_writeLogMessageFromActions:(id)a3 includingPartNumber:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = category;
    id v9 = [(NMLogActionsCoalescer *)self _logMessageFromPendingLogActions:v6 includingPartNumber:v4];
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (v4) {
    ++self->_partNumber;
  }
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (unint64_t)messageBufferLimit
{
  return self->_messageBufferLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong(&self->_identifier, 0);

  objc_storeStrong((id *)&self->_pendingLogActions, 0);
}

@end
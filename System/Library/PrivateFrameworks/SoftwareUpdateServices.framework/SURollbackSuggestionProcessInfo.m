@interface SURollbackSuggestionProcessInfo
+ (BOOL)supportsSecureCoding;
- (NSError)rollbackSuggestionError;
- (NSString)processID;
- (NSString)processName;
- (SURollbackSuggestionProcessInfo)init;
- (SURollbackSuggestionProcessInfo)initWithCoder:(id)a3;
- (SURollbackSuggestionProcessInfo)initWithProcessID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessID:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setRollbackSuggestionError:(id)a3;
@end

@implementation SURollbackSuggestionProcessInfo

- (SURollbackSuggestionProcessInfo)init
{
  return [(SURollbackSuggestionProcessInfo *)self initWithProcessID:0];
}

- (SURollbackSuggestionProcessInfo)initWithProcessID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SURollbackSuggestionProcessInfo;
  v6 = [(SURollbackSuggestionProcessInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processID, a3);
    processName = v7->_processName;
    v7->_processName = 0;

    rollbackSuggestionError = v7->_rollbackSuggestionError;
    v7->_rollbackSuggestionError = 0;
  }
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\n                ProcessID: %@\n                ProcessName: %@\n                RollbackSuggestionError: %@\n", self->_processID, self->_processName, self->_rollbackSuggestionError];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)processName
{
  processName = self->_processName;
  if (processName) {
    goto LABEL_2;
  }
  if (!self->_processID)
  {
    processName = 0;
LABEL_2:
    v3 = processName;
    goto LABEL_3;
  }
  v6 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:");
  if (!v6)
  {
    processName = self->_processName;
    goto LABEL_2;
  }
  v7 = v6;
  v3 = [v6 objectForInfoDictionaryKey:*MEMORY[0x263EFFB50]];

LABEL_3:
  return v3;
}

- (SURollbackSuggestionProcessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SURollbackSuggestionProcessInfo;
  id v5 = [(SURollbackSuggestionProcessInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProcessID"];
    [(SURollbackSuggestionProcessInfo *)v5 setProcessID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProcessName"];
    [(SURollbackSuggestionProcessInfo *)v5 setProcessName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RollbackSuggestionError"];
    [(SURollbackSuggestionProcessInfo *)v5 setRollbackSuggestionError:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SURollbackSuggestionProcessInfo *)self processID];
  [v4 encodeObject:v5 forKey:@"ProcessID"];

  v6 = [(SURollbackSuggestionProcessInfo *)self processName];
  [v4 encodeObject:v6 forKey:@"ProcessName"];

  id v7 = [(SURollbackSuggestionProcessInfo *)self rollbackSuggestionError];
  [v4 encodeObject:v7 forKey:@"RollbackSuggestionError"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SURollbackSuggestionProcessInfo alloc];
  id v5 = [(SURollbackSuggestionProcessInfo *)self processID];
  v6 = [(SURollbackSuggestionProcessInfo *)v4 initWithProcessID:v5];

  id v7 = [(SURollbackSuggestionProcessInfo *)self processName];
  [(SURollbackSuggestionProcessInfo *)v6 setProcessName:v7];

  v8 = [(SURollbackSuggestionProcessInfo *)self rollbackSuggestionError];
  [(SURollbackSuggestionProcessInfo *)v6 setRollbackSuggestionError:v8];

  return v6;
}

- (NSString)processID
{
  return self->_processID;
}

- (void)setProcessID:(id)a3
{
}

- (void)setProcessName:(id)a3
{
}

- (NSError)rollbackSuggestionError
{
  return self->_rollbackSuggestionError;
}

- (void)setRollbackSuggestionError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackSuggestionError, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processID, 0);
}

@end
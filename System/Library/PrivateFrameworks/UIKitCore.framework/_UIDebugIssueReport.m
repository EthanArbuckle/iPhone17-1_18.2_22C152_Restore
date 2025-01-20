@interface _UIDebugIssueReport
- (NSArray)issues;
- (_UIDebugIssueReport)init;
- (void)addIssue:(id)a3;
@end

@implementation _UIDebugIssueReport

- (_UIDebugIssueReport)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDebugIssueReport;
  v2 = [(_UIDebugIssueReport *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableIssues = v2->_mutableIssues;
    v2->_mutableIssues = v3;
  }
  return v2;
}

- (NSArray)issues
{
  v2 = (void *)[(NSMutableArray *)self->_mutableIssues copy];
  return (NSArray *)v2;
}

- (void)addIssue:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIDebugIssueReport.m", 91, @"Invalid parameter not satisfying: %@", @"issue" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableArray *)self->_mutableIssues addObject:v5];
}

- (void).cxx_destruct
{
}

@end
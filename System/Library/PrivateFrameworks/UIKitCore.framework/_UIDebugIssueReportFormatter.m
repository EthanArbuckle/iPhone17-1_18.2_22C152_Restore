@interface _UIDebugIssueReportFormatter
- (NSString)defaultIssuePrefix;
- (NSString)footer;
- (NSString)header;
- (NSString)noIssuesDescription;
- (_UIDebugIssueReportFormatter)init;
- (id)_componentsFromReport:(id)a3;
- (id)stringFromReport:(id)a3;
- (void)setDefaultIssuePrefix:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setNoIssuesDescription:(id)a3;
@end

@implementation _UIDebugIssueReportFormatter

- (_UIDebugIssueReportFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDebugIssueReportFormatter;
  v2 = [(_UIDebugReportFormatter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSString *)&stru_1ED0E84C0;

    footer = v3->_footer;
    v3->_footer = (NSString *)&stru_1ED0E84C0;

    noIssuesDescription = v3->_noIssuesDescription;
    v3->_noIssuesDescription = (NSString *)&stru_1ED0E84C0;
  }
  return v3;
}

- (NSString)defaultIssuePrefix
{
  defaultIssuePrefix = self->_defaultIssuePrefix;
  if (!defaultIssuePrefix)
  {
    self->_defaultIssuePrefix = (NSString *)@" - ISSUE: ";
    defaultIssuePrefix = self->_defaultIssuePrefix;
  }
  return defaultIssuePrefix;
}

- (id)_componentsFromReport:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIDebugIssueReport.m", 129, @"Invalid parameter not satisfying: %@", @"report" object file lineNumber description];
  }
  v6 = [v5 issues];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    objc_super v8 = [MEMORY[0x1E4F28E78] string];
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__89;
    v21[4] = __Block_byref_object_dispose__89;
    id v22 = 0;
    v9 = [v5 issues];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54___UIDebugIssueReportFormatter__componentsFromReport___block_invoke;
    v17[3] = &unk_1E52EE2D8;
    v17[4] = self;
    id v10 = v8;
    id v18 = v10;
    v19 = v21;
    uint64_t v20 = v7;
    [v9 enumerateObjectsUsingBlock:v17];

    v11 = objc_alloc_init(_UIDebugReportComponents);
    v12 = [(_UIDebugIssueReportFormatter *)self header];
    [(_UIDebugReportComponents *)v11 setHeader:v12];

    v13 = [(_UIDebugIssueReportFormatter *)self footer];
    [(_UIDebugReportComponents *)v11 setFooter:v13];

    [(_UIDebugReportComponents *)v11 setBody:v10];
    _Block_object_dispose(v21, 8);
  }
  else
  {
    v11 = objc_alloc_init(_UIDebugReportComponents);
    v14 = [(_UIDebugIssueReportFormatter *)self noIssuesDescription];
    [(_UIDebugReportComponents *)v11 setBody:v14];
  }
  return v11;
}

- (id)stringFromReport:(id)a3
{
  v4 = [(_UIDebugIssueReportFormatter *)self _componentsFromReport:a3];
  id v5 = [(_UIDebugReportFormatter *)self stringFromReportComponents:v4];

  return v5;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)noIssuesDescription
{
  return self->_noIssuesDescription;
}

- (void)setNoIssuesDescription:(id)a3
{
}

- (void)setDefaultIssuePrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIssuePrefix, 0);
  objc_storeStrong((id *)&self->_noIssuesDescription, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
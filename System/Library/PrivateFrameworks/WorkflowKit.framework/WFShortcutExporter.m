@interface WFShortcutExporter
- (WFShortcutExporter)initWithWorkflow:(id)a3 sharingOptions:(id)a4;
- (WFShortcutExporter)initWithWorkflowRecord:(id)a3;
- (WFWorkflowRecord)workflowRecord;
@end

@implementation WFShortcutExporter

- (void).cxx_destruct
{
}

- (WFWorkflowRecord)workflowRecord
{
  return self->_workflowRecord;
}

- (WFShortcutExporter)initWithWorkflowRecord:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutExporter;
  v6 = [(WFShortcutExporter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflowRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (WFShortcutExporter)initWithWorkflow:(id)a3 sharingOptions:(id)a4
{
  id v5 = [a3 prepareForSharingWithOptions:a4];
  v6 = [(WFShortcutExporter *)self initWithWorkflowRecord:v5];

  return v6;
}

@end
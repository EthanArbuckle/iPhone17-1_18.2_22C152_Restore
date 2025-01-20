@interface WFWorkflowPrepareForSharingOptions
- (BOOL)clearsImportQuestionData;
- (NSSet)quickActionSurfaces;
- (WFWorkflowPrepareForSharingOptions)init;
- (void)setClearsImportQuestionData:(BOOL)a3;
- (void)setQuickActionSurfaces:(id)a3;
@end

@implementation WFWorkflowPrepareForSharingOptions

- (void).cxx_destruct
{
}

- (void)setQuickActionSurfaces:(id)a3
{
}

- (NSSet)quickActionSurfaces
{
  return self->_quickActionSurfaces;
}

- (void)setClearsImportQuestionData:(BOOL)a3
{
  self->_clearsImportQuestionData = a3;
}

- (BOOL)clearsImportQuestionData
{
  return self->_clearsImportQuestionData;
}

- (WFWorkflowPrepareForSharingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowPrepareForSharingOptions;
  v2 = [(WFWorkflowPrepareForSharingOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WFWorkflowPrepareForSharingOptions *)v2 setClearsImportQuestionData:1];
    v4 = v3;
  }

  return v3;
}

@end
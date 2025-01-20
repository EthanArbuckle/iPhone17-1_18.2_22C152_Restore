@interface WFWorkflowFileActivity
+ (id)activityType;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (CGRect)sourceRect;
- (NSArray)activityItems;
- (UIBarButtonItem)barButtonItem;
- (UIView)sourceView;
- (WFFileRepresentation)workflowFile;
- (WFPopoverModel)popoverModel;
- (WFWorkflowFileActivity)initWithPopoverModel:(id)a3;
- (WFWorkflowFileActivity)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)createViewController;
- (unint64_t)arrowDirection;
- (void)performActivity;
- (void)setActivityItems:(id)a3;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setBarButtonItem:(id)a3;
- (void)setPopoverModel:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation WFWorkflowFileActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverModel, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_workflowFile, 0);
}

- (void)setPopoverModel:(id)a3
{
}

- (WFPopoverModel)popoverModel
{
  return self->_popoverModel;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setActivityItems:(id)a3
{
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (id)createViewController
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [(WFWorkflowFileActivity *)self workflowFile];
  v4 = [v3 fileURL];

  id v5 = objc_alloc(MEMORY[0x263F6BC98]);
  v12[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  uint64_t v11 = *MEMORY[0x263F6BD00];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v7 setExcludedActivityTypes:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__WFWorkflowFileActivity_createViewController__block_invoke;
  v10[3] = &unk_2649CB778;
  v10[4] = self;
  [v7 setCompletionWithItemsHandler:v10];

  return v7;
}

uint64_t __46__WFWorkflowFileActivity_createViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:");
}

- (id)activityViewController
{
  if (self->_popoverModel)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(WFWorkflowFileActivity *)self createViewController];
    v4 = [v2 popoverPresentationController];
    id v5 = [(WFWorkflowFileActivity *)self sourceView];
    [v4 setSourceView:v5];

    [(WFWorkflowFileActivity *)self sourceRect];
    objc_msgSend(v4, "setSourceRect:");
    v6 = [(WFWorkflowFileActivity *)self barButtonItem];
    [v4 setBarButtonItem:v6];

    objc_msgSend(v4, "setPermittedArrowDirections:", -[WFWorkflowFileActivity arrowDirection](self, "arrowDirection"));
  }
  return v2;
}

- (void)performActivity
{
  popoverModel = self->_popoverModel;
  if (popoverModel)
  {
    id v3 = [(WFWorkflowFileActivity *)self createViewController];
    [(WFPopoverModel *)popoverModel displayFileActivityWith:v3];
  }
}

- (WFFileRepresentation)workflowFile
{
  workflowFile = self->_workflowFile;
  if (!workflowFile)
  {
    v4 = [(WFWorkflowFileActivity *)self activityItems];
    id v5 = [v4 objectsMatchingClass:objc_opt_class()];
    v6 = [v5 firstObject];

    v7 = [v6 record];
    v8 = [v7 fileRepresentation];
    v9 = [v8 writeToDiskWithError:0];
    v10 = self->_workflowFile;
    self->_workflowFile = v9;

    workflowFile = self->_workflowFile;
  }
  return workflowFile;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F86E70] shortcutFileSharingEnabled])
  {
    v4 = [v3 objectsMatchingClass:objc_opt_class()];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_systemImageName
{
  return @"doc";
}

- (id)activityTitle
{
  return WFLocalizedString(@"Share as File");
}

- (id)activityType
{
  v2 = objc_opt_class();
  return (id)[v2 activityType];
}

- (WFWorkflowFileActivity)initWithPopoverModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowFileActivity;
  v6 = [(UIActivity *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_popoverModel, a3);
    v8 = v7;
  }

  return v7;
}

- (WFWorkflowFileActivity)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowFileActivity;
  v14 = [(UIActivity *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceView, a3);
    objc_storeStrong((id *)&v15->_barButtonItem, a5);
    v15->_sourceRect.origin.CGFloat x = x;
    v15->_sourceRect.origin.CGFloat y = y;
    v15->_sourceRect.size.CGFloat width = width;
    v15->_sourceRect.size.CGFloat height = height;
    v16 = v15;
  }

  return v15;
}

+ (id)activityType
{
  return @"is.workflow.my.filesharer";
}

@end
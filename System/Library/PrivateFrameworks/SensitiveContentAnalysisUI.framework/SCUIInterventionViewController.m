@interface SCUIInterventionViewController
+ (id)viewControllerWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6;
+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4;
+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5;
- (NSDictionary)contextDictionary;
- (SCUIInterventionViewController)initWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6 type:(int64_t)a7;
- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5;
- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6;
- (SCUIInterventionViewControllerDelegate)interventionDelegate;
- (id)rootScreenWithContainer:(id)a3;
- (int64_t)options;
- (int64_t)type;
- (int64_t)workflow;
- (void)setInterventionDelegate:(id)a3;
@end

@implementation SCUIInterventionViewController

- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v8 = a4;
  v9 = [(SCUIInterventionViewController *)self initWithWorkflow:a3 contextDictionary:v8 options:a5 type:SCUICurrentInterventionType()];

  return v9;
}

+ (id)viewControllerWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithAnalysis:v11 workflow:a4 contextDictionary:v10 options:a6 type:SCUICurrentInterventionType()];

  return v12;
}

- (SCUIInterventionViewController)initWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6 type:(int64_t)a7
{
  return [(SCUIInterventionViewController *)self initWithWorkflow:a4 contextDictionary:a5 options:a6 type:a7];
}

- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6
{
  self->_workflow = a3;
  v9 = (NSDictionary *)[a4 copy];
  contextDictionary = self->_contextDictionary;
  self->_contextDictionary = v9;

  self->_options = a5;
  self->_type = a6;
  id v11 = [(SCUIInterventionViewController *)self rootScreenWithContainer:self];
  v20.receiver = self;
  v20.super_class = (Class)SCUIInterventionViewController;
  v12 = [(SCUIInterventionViewController *)&v20 initWithRootViewController:v11];

  if (v12)
  {
    v13 = [(SCUIInterventionViewController *)v12 navigationBar];
    v14 = [v13 standardAppearance];
    v15 = (void *)[v14 copy];

    [v15 configureWithTransparentBackground];
    v16 = [(SCUIInterventionViewController *)v12 navigationBar];
    [v16 setScrollEdgeAppearance:v15];

    v17 = [(SCUIInterventionViewController *)v12 navigationBar];
    [v17 setStandardAppearance:v15];

    v18 = [(SCUIInterventionViewController *)v12 navigationBar];
    [v18 setCompactAppearance:v15];
  }
  return v12;
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4
{
  return (id)[a1 viewControllerWithWorkflow:a3 contextDictionary:a4 options:0];
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWorkflow:a3 contextDictionary:v7 options:a5];

  return v8;
}

- (id)rootScreenWithContainer:(id)a3
{
  v3 = [[SCUIInterventionScreenViewController alloc] initWithContainer:self contentScreen:0 options:[(SCUIInterventionViewController *)self options] | 1];

  return v3;
}

- (int64_t)workflow
{
  return self->_workflow;
}

- (SCUIInterventionViewControllerDelegate)interventionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interventionDelegate);

  return (SCUIInterventionViewControllerDelegate *)WeakRetained;
}

- (void)setInterventionDelegate:(id)a3
{
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDictionary, 0);

  objc_destroyWeak((id *)&self->_interventionDelegate);
}

@end
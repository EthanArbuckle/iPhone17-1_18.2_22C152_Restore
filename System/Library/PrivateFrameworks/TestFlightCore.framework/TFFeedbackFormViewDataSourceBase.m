@interface TFFeedbackFormViewDataSourceBase
- (TFFeedbackFormPresenter)presenter;
- (TFFeedbackFormViewDataSourceBase)initWithPresenter:(id)a3 refreshCallback:(id)a4;
- (id)refreshCallback;
- (unint64_t)screenshotCount;
- (void)addScreenshots:(id)a3;
- (void)removeScreenshot:(id)a3;
- (void)resetScreenshots:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setRefreshCallback:(id)a3;
@end

@implementation TFFeedbackFormViewDataSourceBase

- (TFFeedbackFormViewDataSourceBase)initWithPresenter:(id)a3 refreshCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackFormViewDataSourceBase;
  v9 = [(TFFeedbackFormViewDataSourceBase *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    uint64_t v11 = MEMORY[0x223CADBF0](v8);
    id refreshCallback = v10->_refreshCallback;
    v10->_id refreshCallback = (id)v11;
  }
  return v10;
}

- (unint64_t)screenshotCount
{
  v2 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v3 = [v2 feedbackDataSource];
  v4 = [v3 imageCollectionForIdentifer:@"c"];

  unint64_t v5 = [v4 count];
  return v5;
}

- (void)addScreenshots:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v6 = [v5 feedbackDataSource];
  id v11 = [v6 imageCollectionForIdentifer:@"c"];

  id v7 = [v11 arrayByAddingObjectsFromArray:v4];

  id v8 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v9 = [v8 session];
  [v9 associateScreenshotImages:v7];

  v10 = [(TFFeedbackFormViewDataSourceBase *)self refreshCallback];
  v10[2]();
}

- (void)removeScreenshot:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v6 = [v5 feedbackDataSource];
  id v7 = [v6 imageCollectionForIdentifer:@"c"];
  id v11 = (id)[v7 mutableCopy];

  [v11 removeObject:v4];
  id v8 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v9 = [v8 session];
  [v9 associateScreenshotImages:v11];

  v10 = [(TFFeedbackFormViewDataSourceBase *)self refreshCallback];
  v10[2]();
}

- (void)resetScreenshots:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TFFeedbackFormViewDataSourceBase *)self presenter];
  v6 = [v5 session];
  [v6 associateScreenshotImages:v4];

  id v7 = [(TFFeedbackFormViewDataSourceBase *)self refreshCallback];
  v7[2]();
}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (id)refreshCallback
{
  return self->_refreshCallback;
}

- (void)setRefreshCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshCallback, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
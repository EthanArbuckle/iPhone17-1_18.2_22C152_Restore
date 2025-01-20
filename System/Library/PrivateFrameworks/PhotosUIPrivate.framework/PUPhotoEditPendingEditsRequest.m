@interface PUPhotoEditPendingEditsRequest
+ (BOOL)canPerformEditsWithRootViewController:(id)a3;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
- (NSArray)adjustments;
- (PUPhotoEditPendingEditsRequest)initWithAdjustments:(id)a3 rootViewController:(id)a4;
- (UIViewController)rootViewController;
- (id)completionHandler;
- (unint64_t)state;
- (void)finishedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)submitWithCompletionHandler:(id)a3;
@end

@implementation PUPhotoEditPendingEditsRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_adjustments, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setRootViewController:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (void)finishedWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if ([(PUPhotoEditPendingEditsRequest *)self state] == 1)
  {
    [(PUPhotoEditPendingEditsRequest *)self setState:2];
    v6 = [(PUPhotoEditPendingEditsRequest *)self completionHandler];

    if (v6)
    {
      v7 = [(PUPhotoEditPendingEditsRequest *)self completionHandler];
      ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);
    }
  }
}

- (void)submitWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  if ([(PUPhotoEditPendingEditsRequest *)self state])
  {
    id v10 = +[PUPhotoEditPendingEditsRequest errorWithCode:4 debugDescription:@"Calling submit while state is not initial"];
    v4[2](v4, 0, v10);
  }
  else
  {
    [(PUPhotoEditPendingEditsRequest *)self setState:1];
    [(PUPhotoEditPendingEditsRequest *)self setCompletionHandler:v4];

    v5 = [(PUPhotoEditPendingEditsRequest *)self rootViewController];
    objc_msgSend(v5, "px_descendantViewControllerWithClass:", objc_opt_class());
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v7 = [(PUPhotoEditPendingEditsRequest *)self rootViewController];
      id v8 = objc_msgSend(v7, "px_descendantViewControllerWithClass:", objc_opt_class());

      if (v8)
      {
        v9 = [v8 actionsController];
        [v9 performPendingEditsActionWithRequest:self];
      }
      else
      {
        v9 = +[PUPhotoEditPendingEditsRequest errorWithCode:1 debugDescription:@"Not in 1up"];
        [(PUPhotoEditPendingEditsRequest *)self finishedWithSuccess:0 error:v9];
      }

      v6 = 0;
      goto LABEL_6;
    }
    [v10 fulfillPendingEditsRequest:self];
  }
  v6 = v10;
LABEL_6:
}

- (PUPhotoEditPendingEditsRequest)initWithAdjustments:(id)a3 rootViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUPhotoEditPendingEditsRequest.m", 42, @"Invalid parameter not satisfying: %@", @"adjustments.count" object file lineNumber description];
  }
  if (!+[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:v8])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUPhotoEditPendingEditsRequest.m", 43, @"Invalid parameter not satisfying: %@", @"[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:rootViewController]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditPendingEditsRequest;
  v9 = [(PUPhotoEditPendingEditsRequest *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    adjustments = v9->_adjustments;
    v9->_adjustments = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_rootViewController, a4);
  }

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"PUPhotoEditPendingEditsRequestErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (BOOL)canPerformEditsWithRootViewController:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class());
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class());
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7 != 0;
}

@end
@interface _UIDICActivityViewController
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (BOOL)hidesSystemActivities;
- (BOOL)isPerformingActivity;
- (NSString)openActivityTargetApplicationIdentifier;
- (_UIDICActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 options:(unint64_t)a5;
- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegate;
- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegateRetained;
- (unint64_t)options;
- (void)_handleDidFinishPerformingActivityType:(id)a3 completed:(BOOL)a4 resultItems:(id)a5 activityError:(id)a6;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3;
- (void)_willPerformInServiceActivityType:(id)a3 activitySpecificMetadata:(id)a4;
- (void)setDocumentInteractionActivityDelegate:(id)a3;
- (void)setDocumentInteractionActivityDelegateRetained:(id)a3;
- (void)setIsPerformingActivity:(BOOL)a3;
- (void)setOpenActivityTargetApplicationIdentifier:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _UIDICActivityViewController

- (_UIDICActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 options:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDICActivityViewController;
  v6 = [(UIActivityViewController *)&v9 initWithActivityItems:a3 applicationActivities:a4];
  v7 = v6;
  if (v6)
  {
    v6->_options = a5;
    [(UIActivityViewController *)v6 setIsContentManaged:a5 & 1];
  }
  return v7;
}

- (void)setDocumentInteractionActivityDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_documentInteractionActivityDelegate, v4);
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71___UIDICActivityViewController_setDocumentInteractionActivityDelegate___block_invoke;
  v5[3] = &unk_1E5A237F8;
  objc_copyWeak(&v6, &location);
  [(UIActivityViewController *)self setCompletionWithItemsHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)hidesSystemActivities
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return ![(_UIDICActivityViewController *)self hidesSystemActivities];
}

- (void)_prepareActivity:(id)a3
{
  id v11 = a3;
  id v4 = [v11 activityType];
  int v5 = [v4 isEqualToString:@"com.apple.UIKit.activity.Mail"];

  id v6 = v11;
  if (v5)
  {
    id v7 = v11;
    v8 = [v7 subject];

    if (!v8)
    {
      objc_super v9 = [(_UIDICActivityViewController *)self documentInteractionActivityDelegate];
      v10 = [v9 name];
      [v7 setSubject:v10];
    }
    id v6 = v11;
  }
}

- (void)_performActivity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDICActivityViewController;
  [(UIActivityViewController *)&v5 _performActivity:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentInteractionActivityDelegate);
  [(_UIDICActivityViewController *)self setDocumentInteractionActivityDelegateRetained:WeakRetained];

  [(_UIDICActivityViewController *)self setIsPerformingActivity:1];
}

- (void)_willPerformInServiceActivityType:(id)a3 activitySpecificMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_UIActivityOpenInApplicationTypeForActivityType(v6))
  {
    v8 = [v7 objectForKeyedSubscript:@"applicationIdentifier"];
    openActivityTargetApplicationIdentifier = self->_openActivityTargetApplicationIdentifier;
    self->_openActivityTargetApplicationIdentifier = v8;
  }
  if ([(NSString *)self->_openActivityTargetApplicationIdentifier length])
  {
    v10 = [(_UIDICActivityViewController *)self documentInteractionActivityDelegate];
    [v10 activityViewController:self openActivityWillBeginSendingToApplication:self->_openActivityTargetApplicationIdentifier];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIDICActivityViewController;
  [(UIActivityViewController *)&v11 _willPerformInServiceActivityType:v6 activitySpecificMetadata:v7];
}

- (void)_handleDidFinishPerformingActivityType:(id)a3 completed:(BOOL)a4 resultItems:(id)a5 activityError:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [(_UIDICActivityViewController *)self documentInteractionActivityDelegate];
  [v12 activityViewController:self didFinishPresentingActivityType:v14];
  if ([(_UIDICActivityViewController *)self isPerformingActivity])
  {
    [(_UIDICActivityViewController *)self setIsPerformingActivity:0];
    [(_UIDICActivityViewController *)self setDocumentInteractionActivityDelegateRetained:0];
  }
  [v12 activityViewController:self didFinishPerformingActivityType:v14 completed:v8 items:v10 error:v11];
  if (self->_openActivityTargetApplicationIdentifier)
  {
    objc_msgSend(v12, "activityViewController:openActivityDidEndSendingToApplication:", self);
    openActivityTargetApplicationIdentifier = self->_openActivityTargetApplicationIdentifier;
    self->_openActivityTargetApplicationIdentifier = 0;
  }
}

- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentInteractionActivityDelegate);
  return (_UIDICActivityViewControllerDelegate *)WeakRetained;
}

- (BOOL)isPerformingActivity
{
  return self->_isPerformingActivity;
}

- (void)setIsPerformingActivity:(BOOL)a3
{
  self->_isPerformingActivity = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegateRetained
{
  return self->_documentInteractionActivityDelegateRetained;
}

- (void)setDocumentInteractionActivityDelegateRetained:(id)a3
{
}

- (NSString)openActivityTargetApplicationIdentifier
{
  return self->_openActivityTargetApplicationIdentifier;
}

- (void)setOpenActivityTargetApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openActivityTargetApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_documentInteractionActivityDelegateRetained, 0);
  objc_destroyWeak((id *)&self->_documentInteractionActivityDelegate);
}

@end
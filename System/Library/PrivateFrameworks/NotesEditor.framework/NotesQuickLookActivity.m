@interface NotesQuickLookActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)sourceIsManaged;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (NotesQuickLookActivityItem)item;
- (id)_beforeActivity;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_cleanup;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)presentPreviewController;
- (void)setItem:(id)a3;
- (void)setSourceIsManaged:(BOOL)a3;
@end

@implementation NotesQuickLookActivity

- (id)activityType
{
  return @"com.apple.UIKit.activity.Quicklook";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"QUICK_LOOK" value:@"Quick Look" table:@"Localizable"];

  return v3;
}

- (id)_systemImageName
{
  return @"eye";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x263F6BD48];
}

- (void)setItem:(id)a3
{
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[NotesQuickLookActivity setItem:](self, "setItem:", v10, (void)v14);

          goto LABEL_15;
        }
        if (!v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v7 = v10;
          }
          else {
            id v7 = 0;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_15:
    id v7 = 0;
  }

  v11 = [(NotesQuickLookActivity *)self item];

  if (!v11 && v7)
  {
    v12 = objc_alloc_init(NotesQuickLookActivityItem);
    id v18 = v7;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [(NotesQuickLookActivityItem *)v12 setPreviewItems:v13];

    [(NotesQuickLookActivity *)self setItem:v12];
  }
}

- (void)performActivity
{
}

- (void)_cleanup
{
  v3.receiver = self;
  v3.super_class = (Class)NotesQuickLookActivity;
  [(UIActivity *)&v3 _cleanup];
  [(NotesQuickLookActivity *)self presentPreviewController];
}

- (void)presentPreviewController
{
  id object = objc_alloc_init(MEMORY[0x263F16098]);
  [object setDataSource:self];
  [object setDelegate:self];
  objc_msgSend(object, "setIsContentManaged:", -[NotesQuickLookActivity sourceIsManaged](self, "sourceIsManaged"));
  objc_super v3 = [(NotesQuickLookActivity *)self item];
  uint64_t v4 = [v3 firstItemIndex];

  [object setCurrentPreviewItemIndex:v4];
  uint64_t v5 = (id *)MEMORY[0x263F83300];
  uint64_t v6 = [(id)*MEMORY[0x263F83300] keyWindow];
  id v7 = objc_msgSend(v6, "ic_viewControllerManager");
  uint64_t v8 = [v7 window];
  v9 = objc_msgSend(v8, "ic_topmostPresentedViewController");
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [*v5 keyWindow];
    id v11 = [v12 rootViewController];
  }
  [v11 presentViewController:object animated:1 completion:0];
  objc_setAssociatedObject(object, &NotesQuickLookActivityLifeLine, self, (void *)1);
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  objc_super v3 = [(NotesQuickLookActivity *)self item];
  uint64_t v4 = [v3 previewItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  int64_t v5 = [(NotesQuickLookActivity *)self item];
  uint64_t v6 = [v5 previewItems];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  return v7;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(NotesQuickLookActivity *)self item];
  id v11 = [v10 delegate];
  v12 = [(NotesQuickLookActivity *)self item];
  [v11 notesQuickLookActivityItem:v12 rectForPreviewItem:v8 inView:a5 previewController:v9];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(NotesQuickLookActivity *)self item];
  v10 = [v9 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(NotesQuickLookActivity *)self item];
    double v13 = [v12 delegate];
    double v14 = [(NotesQuickLookActivity *)self item];
    double v15 = [v13 notesQuickLookActivityItem:v14 transitionImageForPreviewItem:v8 previewController:v7];
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NotesQuickLookActivity *)self item];
  id v9 = [v8 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(NotesQuickLookActivity *)self item];
    v12 = [v11 delegate];
    double v13 = [(NotesQuickLookActivity *)self item];
    double v14 = [v12 notesQuickLookActivityItem:v13 transitionViewForPreviewItem:v7 previewController:v6];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (NotesQuickLookActivityItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
}

@end
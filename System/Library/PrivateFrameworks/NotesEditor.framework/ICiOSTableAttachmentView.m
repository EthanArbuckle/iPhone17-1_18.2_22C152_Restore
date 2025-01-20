@interface ICiOSTableAttachmentView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)tableAttachmentViewController;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)didMoveToSuperview;
- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
@end

@implementation ICiOSTableAttachmentView

- (id)tableAttachmentViewController
{
  id v2 = [(ICiOSTableAttachmentView *)self nextResponder];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 nextResponder];

      id v2 = (id)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentView;
  id v4 = a3;
  [(ICiOSTableAttachmentView *)&v6 setHighlightPatternRegexFinder:v4];
  v5 = [(ICiOSTableAttachmentView *)self tableAttachmentViewController];
  [v5 setHighlightPatternRegexFinder:v4];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentView;
  [(ICiOSTableAttachmentView *)&v4 didMoveToSuperview];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v3 = [(ICiOSTableAttachmentView *)self tableAttachmentViewController];
    [v3 hideColumnRowButtons];
  }
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(ICiOSTableAttachmentView *)self nextResponder];
    v8 = [v7 targetForAction:a3 withSender:v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICiOSTableAttachmentView;
    v8 = [(ICAttachmentView *)&v10 targetForAction:a3 withSender:v6];
  }

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICiOSTableAttachmentView;
  if (-[ICiOSTableAttachmentView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(ICTableAttachmentView *)self outsideViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v14 isDescendantOfView:self])
          {
            if (([v14 isHidden] & 1) == 0)
            {
              -[ICiOSTableAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
              if (objc_msgSend(v14, "pointInside:withEvent:", v7))
              {
                BOOL v8 = 1;
                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_15:
  }
  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)setHighlightColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentView;
  id v4 = a3;
  [(ICiOSTableAttachmentView *)&v6 setHighlightColor:v4];
  v5 = [(ICiOSTableAttachmentView *)self tableAttachmentViewController];
  [v5 setHighlightColor:v4];
}

- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Table attachment" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityElements
{
  uint64_t v3 = [(ICiOSTableAttachmentView *)self tableAttachmentViewController];
  [v3 initializeTableAccessibilityControllerIfNecessary];

  id v4 = [(ICiOSTableAttachmentView *)self tableAttachmentViewController];
  v5 = [v4 tableAXController];

  objc_super v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v5 tableElement];
  objc_msgSend(v6, "ic_addNonNilObject:", v7);

  BOOL v8 = (void *)[v6 copy];

  return v8;
}

@end
@interface UIView
+ (Class)be_wkContentViewClass;
+ (Class)bepageCurlViewClass;
+ (void)be_enablePageCurlHacks;
+ (void)be_enableWKContentViewOverrides;
- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate;
- (BOOL)be_curlContentViewPointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)be_constraintsToFillSuperview;
- (id)be_ancestorViewOfClass:(Class)a3;
- (id)be_passthroughViewDelegate;
- (void)be_continueContextMenuInteraction:(id)a3;
- (void)be_setUpTextSelectionAssistant;
- (void)setBEPassthroughViewDelegate:(id)a3;
@end

@implementation UIView

- (BOOL)be_curlContentViewPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(UIView *)self be_passthroughViewDelegate];
  v9 = v8;
  if (v8) {
    LODWORD(self) = [v8 passThroughView:self shouldPassthroughHitAtPoint:x, y] ^ 1;
  }
  else {
    LOBYTE(self) = -[UIView be_curlContentViewPointInside:withEvent:](self, "be_curlContentViewPointInside:withEvent:", v7, x, y);
  }

  return (char)self;
}

+ (Class)bepageCurlViewClass
{
  if (qword_409AE8 != -1) {
    dispatch_once(&qword_409AE8, &stru_3C0630);
  }
  v2 = (void *)qword_409AE0;

  return (Class)v2;
}

+ (void)be_enablePageCurlHacks
{
  if (qword_409AF0 != -1) {
    dispatch_once(&qword_409AF0, &stru_3C0650);
  }
}

+ (void)be_enableWKContentViewOverrides
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15654;
  block[3] = &unk_3C07E0;
  block[4] = a1;
  if (qword_409B38 != -1) {
    dispatch_once(&qword_409B38, block);
  }
}

+ (Class)be_wkContentViewClass
{
  if (qword_409B48 != -1) {
    dispatch_once(&qword_409B48, &stru_3C0850);
  }
  v2 = (void *)qword_409B40;

  return (Class)v2;
}

- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate
{
  v2 = [(UIView *)self be_ancestorViewOfClass:objc_opt_class()];
  v3 = [v2 be_textInteractionAssistantDelegate];

  return (BEUIWKTextInteractionAssistantDelegate *)v3;
}

- (void)be_setUpTextSelectionAssistant
{
  [(UIView *)self be_setUpTextSelectionAssistant];
  v3 = [(UIView *)self be_ancestorViewOfClass:objc_opt_class()];
  v4 = [v3 be_textInteractionDelegate];
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    v5 = [v3 be_textInputChild];
    v6 = [v5 interactions];

    id v7 = (char *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          v11 = BUDynamicCast();
          if (v11)
          {
            v12 = v11;
            v13 = [v11 root];
            [v13 setDelegate:v4];

            goto LABEL_12;
          }
        }
        v8 = (char *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)be_continueContextMenuInteraction:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_159C8;
  v5[3] = &unk_3C0878;
  id v6 = a3;
  id v4 = v6;
  [(UIView *)self be_continueContextMenuInteraction:v5];
}

- (NSArray)be_constraintsToFillSuperview
{
  v3 = [(UIView *)self superview];
  long long v17 = [(UIView *)self leadingAnchor];
  long long v16 = [v3 leadingAnchor];
  long long v15 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v15;
  id v4 = [(UIView *)self trailingAnchor];
  v5 = [v3 trailingAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];
  v18[1] = v6;
  id v7 = [(UIView *)self topAnchor];
  v8 = [v3 topAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v18[2] = v9;
  v10 = [(UIView *)self bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v18[3] = v12;
  id v14 = +[NSArray arrayWithObjects:v18 count:4];

  return (NSArray *)v14;
}

- (id)be_ancestorViewOfClass:(Class)a3
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    id v4 = (void *)v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 superview];

      id v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (void)setBEPassthroughViewDelegate:(id)a3
{
}

- (id)be_passthroughViewDelegate
{
  v2 = objc_getAssociatedObject(self, off_3FD1B8);
  uint64_t v3 = BUProtocolCast();

  return v3;
}

@end
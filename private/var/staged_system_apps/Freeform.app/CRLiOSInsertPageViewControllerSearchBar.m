@interface CRLiOSInsertPageViewControllerSearchBar
- (BOOL)resignFirstResponder;
- (void)enableCancelButton;
- (void)p_recursivelyEnableButtonsInView:(id)a3;
- (void)scribbleInteractionDidFinishWriting:(id)a3;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
@end

@implementation CRLiOSInsertPageViewControllerSearchBar

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewControllerSearchBar;
  BOOL v3 = [(CRLiOSInsertPageViewControllerSearchBar *)&v5 resignFirstResponder];
  [(CRLiOSInsertPageViewControllerSearchBar *)self p_recursivelyEnableButtonsInView:self];
  return v3;
}

- (void)enableCancelButton
{
}

- (void)p_recursivelyEnableButtonsInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);
  v7 = v6;
  if (v6)
  {
    [v6 setEnabled:1];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = [v4 subviews];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [(CRLiOSInsertPageViewControllerSearchBar *)self p_recursivelyEnableButtonsInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass"), "instancesRespondToSelector:", a2))
  {
    v9.super_class = (Class)[(CRLiOSInsertPageViewControllerSearchBar *)self superclass];
    [super a2:v5];
  }
  v6 = [(CRLiOSInsertPageViewControllerSearchBar *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CRLiOSInsertPageViewControllerSearchBar *)self delegate];
    [v8 performSelector:"scribbleInteractionWillBeginWriting:" withObject:v5];
  }
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass"), "instancesRespondToSelector:", a2))
  {
    v9.super_class = (Class)[(CRLiOSInsertPageViewControllerSearchBar *)self superclass];
    [super a2:v5];
  }
  v6 = [(CRLiOSInsertPageViewControllerSearchBar *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CRLiOSInsertPageViewControllerSearchBar *)self delegate];
    [v8 performSelector:"scribbleInteractionDidFinishWriting:" withObject:v5];
  }
}

@end
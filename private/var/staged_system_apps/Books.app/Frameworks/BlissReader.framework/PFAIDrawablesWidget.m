@interface PFAIDrawablesWidget
- (BOOL)mapStartElementWithState:(id)a3;
- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3;
@end

@implementation PFAIDrawablesWidget

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 0);
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", 1);
  [a3 setPaginatedAsCurrent];
  v7.receiver = self;
  v7.super_class = (Class)PFAIDrawablesWidget;
  return [(PFXDrawablesWidget *)&v7 mapStartElementWithState:a3];
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  return 1;
}

@end
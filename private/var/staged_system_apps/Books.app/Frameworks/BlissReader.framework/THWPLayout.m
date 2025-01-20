@interface THWPLayout
- (void)willBeAddedToLayoutController:(id)a3;
@end

@implementation THWPLayout

- (void)willBeAddedToLayoutController:(id)a3
{
  id v4 = [(THWPLayout *)self info];
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THWPLayout sectionLayout](self, "sectionLayout"), "info"), "pageController"), "needsAnnotationSourceForLayout:", self))
  {
    id v5 = [[-[THWPLayout sectionLayout](self, "sectionLayout") info] contentNode];
    [v4 updateAnnotationSourceWithContentNode:v5];
  }
}

@end
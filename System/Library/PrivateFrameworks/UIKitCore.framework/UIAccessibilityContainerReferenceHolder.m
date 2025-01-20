@interface UIAccessibilityContainerReferenceHolder
- (id)referencedContainer;
- (void)setReferencedContainer:(id)a3;
@end

@implementation UIAccessibilityContainerReferenceHolder

- (void)setReferencedContainer:(id)a3
{
}

- (id)referencedContainer
{
  id WeakRetained = objc_loadWeakRetained(&self->_referencedContainer);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end
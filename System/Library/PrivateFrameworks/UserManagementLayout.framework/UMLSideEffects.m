@interface UMLSideEffects
@end

@implementation UMLSideEffects

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_aks, 0);
}

@end
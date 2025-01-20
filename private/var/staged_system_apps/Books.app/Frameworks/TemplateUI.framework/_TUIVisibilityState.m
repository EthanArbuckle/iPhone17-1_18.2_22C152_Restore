@interface _TUIVisibilityState
@end

@implementation _TUIVisibilityState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesMap, 0);

  objc_storeStrong((id *)&self->_visible, 0);
}

@end
@interface TUIAXModel
- (BOOL)flipsHorizontal;
- (BOOL)hasAccessibleDescendants;
- (BOOL)hasContextMenu;
- (BOOL)hidden;
- (BOOL)isControl;
- (BOOL)isEditableControl;
- (BOOL)shouldScrollHorizontally;
- (BOOL)shouldScrollVertically;
- (BOOL)shouldVendControlView;
- (CGRect)accessibilityFrameRelativeToScrollAncestor;
- (NSArray)children;
- (NSArray)resolvedCustomActions;
- (NSString)stateName;
- (TUIAXAttributes)axAttributes;
- (TUIAXModel)init;
- (TUIAXModel)initWithIdentifier:(id)a3 boxType:(id)a4;
- (TUIIdentifier)identifier;
- (TUIIdentifier)liveTransformAncestorIdentifier;
- (TUIIdentifier)scrollAncestorIdentifier;
- (id)boxType;
- (id)description;
- (unint64_t)liveTransformKind;
- (void)setAccessibilityFrameRelativeToScrollAncestor:(CGRect)a3;
- (void)setAxAttributes:(id)a3;
- (void)setChildren:(id)a3;
- (void)setFlipsHorizontal:(BOOL)a3;
- (void)setHasContextMenu:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsControl:(BOOL)a3;
- (void)setIsEditableControl:(BOOL)a3;
- (void)setLiveTransformAncestorIdentifier:(id)a3;
- (void)setLiveTransformKind:(unint64_t)a3;
- (void)setResolvedCustomActions:(id)a3;
- (void)setScrollAncestorIdentifier:(id)a3;
- (void)setShouldScrollHorizontally:(BOOL)a3;
- (void)setShouldScrollVertically:(BOOL)a3;
- (void)setShouldVendControlView:(BOOL)a3;
- (void)setStateName:(id)a3;
@end

@implementation TUIAXModel

- (TUIAXModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIAXModel;
  return [(TUIAXModel *)&v3 init];
}

- (TUIAXModel)initWithIdentifier:(id)a3 boxType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(TUIAXModel *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (NSString *)[v8 copy];
    boxType = v10->_boxType;
    v10->_boxType = v11;
  }
  return v10;
}

- (id)boxType
{
  return self->_boxType;
}

- (id)description
{
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(TUIAXModel *)self boxType];
  id v7 = [(TUIAXModel *)self identifier];
  if (v7)
  {
    v17 = [(TUIAXModel *)self identifier];
    +[NSString stringWithFormat:@" identifier=%@", v17];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_257BF0;
  }
  v9 = [(TUIAXModel *)self stateName];
  if (v9)
  {
    v2 = [(TUIAXModel *)self stateName];
    +[NSString stringWithFormat:@" state=%@;", v2];
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_257BF0;
  }
  v11 = [(TUIAXModel *)self children];
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
  v16 = self;
  v13 = (void *)v5;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; %@;%@%@ #children=%@>",
    v5,
    v16,
    v6,
    v8,
    v10,
  v14 = v12);

  if (v9)
  {
  }
  if (v7)
  {
  }

  return v14;
}

- (BOOL)hasAccessibleDescendants
{
  objc_super v3 = [(TUIAXModel *)self axAttributes];
  if ([v3 isAXElement])
  {

LABEL_4:
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  unsigned __int8 v4 = [(TUIAXModel *)self shouldVendControlView];

  if (v4) {
    goto LABEL_4;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v6 = [(TUIAXModel *)self children];
  id v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasAccessibleDescendants])
        {
          LOBYTE(v5) = 1;
          goto LABEL_15;
        }
      }
      id v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v5;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)flipsHorizontal
{
  return self->_flipsHorizontal;
}

- (void)setFlipsHorizontal:(BOOL)a3
{
  self->_flipsHorizontal = a3;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)shouldVendControlView
{
  return self->_shouldVendControlView;
}

- (void)setShouldVendControlView:(BOOL)a3
{
  self->_shouldVendControlView = a3;
}

- (BOOL)hasContextMenu
{
  return self->_hasContextMenu;
}

- (void)setHasContextMenu:(BOOL)a3
{
  self->_hasContextMenu = a3;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (void)setAxAttributes:(id)a3
{
}

- (NSArray)resolvedCustomActions
{
  return self->_resolvedCustomActions;
}

- (void)setResolvedCustomActions:(id)a3
{
}

- (TUIIdentifier)scrollAncestorIdentifier
{
  return self->_scrollAncestorIdentifier;
}

- (void)setScrollAncestorIdentifier:(id)a3
{
}

- (CGRect)accessibilityFrameRelativeToScrollAncestor
{
  double x = self->_accessibilityFrameRelativeToScrollAncestor.origin.x;
  double y = self->_accessibilityFrameRelativeToScrollAncestor.origin.y;
  double width = self->_accessibilityFrameRelativeToScrollAncestor.size.width;
  double height = self->_accessibilityFrameRelativeToScrollAncestor.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAccessibilityFrameRelativeToScrollAncestor:(CGRect)a3
{
  self->_accessibilityFrameRelativeToScrollAncestor = a3;
}

- (BOOL)shouldScrollHorizontally
{
  return self->_shouldScrollHorizontally;
}

- (void)setShouldScrollHorizontally:(BOOL)a3
{
  self->_shouldScrollHorizontalldouble y = a3;
}

- (BOOL)shouldScrollVertically
{
  return self->_shouldScrollVertically;
}

- (void)setShouldScrollVertically:(BOOL)a3
{
  self->_shouldScrollVerticalldouble y = a3;
}

- (TUIIdentifier)liveTransformAncestorIdentifier
{
  return self->_liveTransformAncestorIdentifier;
}

- (void)setLiveTransformAncestorIdentifier:(id)a3
{
}

- (unint64_t)liveTransformKind
{
  return self->_liveTransformKind;
}

- (void)setLiveTransformKind:(unint64_t)a3
{
  self->_liveTransformKind = a3;
}

- (BOOL)isControl
{
  return self->_isControl;
}

- (void)setIsControl:(BOOL)a3
{
  self->_isControl = a3;
}

- (BOOL)isEditableControl
{
  return self->_isEditableControl;
}

- (void)setIsEditableControl:(BOOL)a3
{
  self->_isEditableControl = a3;
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_liveTransformAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedCustomActions, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_boxType, 0);
}

@end
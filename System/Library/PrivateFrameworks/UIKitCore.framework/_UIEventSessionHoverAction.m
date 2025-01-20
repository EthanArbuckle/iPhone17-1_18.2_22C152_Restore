@interface _UIEventSessionHoverAction
- (id)copyWithZone:(_NSZone *)a3;
- (id)typeEncoding;
- (int64_t)actionType;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)numFingers;
- (int64_t)tapDragState;
- (void)setNumFingers:(int64_t)a3;
- (void)setTapDragState:(int64_t)a3;
@end

@implementation _UIEventSessionHoverAction

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionHoverAction;
  id result = [(_UIEventSessionAction *)&v5 copyWithZone:a3];
  *((void *)result + 9) = self->_tapDragState;
  *((void *)result + 10) = self->_numFingers;
  return result;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uiInterfaceOrientation];
  if (v5 == [(_UIEventSessionAction *)self uiInterfaceOrientation]
    && (uint64_t v6 = [v4 hardwareKeyboardState],
        v6 == [(_UIEventSessionAction *)self hardwareKeyboardState])
    && (uint64_t v7 = [v4 magicKeyboardState],
        v7 == [(_UIEventSessionAction *)self magicKeyboardState]))
  {
    v8 = [v4 asHover];
    uint64_t v9 = [v4 source];
    int64_t v10 = 0;
    if (v9 == [(_UIEventSessionAction *)self source] && v8)
    {
      uint64_t v11 = [v8 numFingers];
      if (v11 == [(_UIEventSessionHoverAction *)self numFingers])
      {
        if (os_variant_has_internal_diagnostics())
        {
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &mergeActionIfPossible____s_category_326);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            v14 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Successfully merged actions", v15, 2u);
            }
          }
        }
        -[_UIEventSessionAction setActionCountFromMergedActions:](self, "setActionCountFromMergedActions:", -[_UIEventSessionAction actionCountFromMergedActions](self, "actionCountFromMergedActions")+ [v4 actionCount]);
        int64_t v10 = 1;
      }
      else
      {
        int64_t v10 = 0;
      }
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)typeEncoding
{
  return @"Hover";
}

- (int64_t)actionType
{
  if ([(_UIEventSessionAction *)self source] == 4)
  {
    int64_t numFingers = self->_numFingers;
    int64_t v5 = 13;
    if (numFingers != 2) {
      int64_t v5 = 14;
    }
    if (numFingers == 1) {
      return 12;
    }
    else {
      return v5;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIEventSessionAction.m" lineNumber:498 description:@"Received hover event of unsupported source"];

    return 28;
  }
}

- (int64_t)tapDragState
{
  return self->_tapDragState;
}

- (void)setTapDragState:(int64_t)a3
{
  self->_tapDragState = a3;
}

- (int64_t)numFingers
{
  return self->_numFingers;
}

- (void)setNumFingers:(int64_t)a3
{
  self->_int64_t numFingers = a3;
}

@end
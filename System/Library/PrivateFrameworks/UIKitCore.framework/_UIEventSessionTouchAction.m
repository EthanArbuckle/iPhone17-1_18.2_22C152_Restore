@interface _UIEventSessionTouchAction
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeEncoding;
- (int64_t)actionType;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)numFingers;
- (int64_t)tapDragState;
- (int64_t)windowSection;
- (void)setNumFingers:(int64_t)a3;
- (void)setTapDragState:(int64_t)a3;
- (void)setWindowSection:(int64_t)a3;
@end

@implementation _UIEventSessionTouchAction

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionTouchAction;
  id result = [(_UIEventSessionAction *)&v5 copyWithZone:a3];
  *((void *)result + 9) = self->_tapDragState;
  *((void *)result + 10) = self->_numFingers;
  *((void *)result + 11) = self->_windowSection;
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
    v8 = [v4 asTouch];
    uint64_t v9 = [v4 source];
    int64_t v10 = 0;
    if (v9 == [(_UIEventSessionAction *)self source] && v8)
    {
      uint64_t v11 = [v8 numFingers];
      if (v11 == [(_UIEventSessionTouchAction *)self numFingers]
        && (uint64_t v12 = [v8 tapDragState],
            v12 == [(_UIEventSessionTouchAction *)self tapDragState])
        && ([v8 numFingers] != 1
         || [v8 tapDragState] != 1
         || (uint64_t v13 = [v8 windowSection],
             v13 == [(_UIEventSessionTouchAction *)self windowSection])))
      {
        if (os_variant_has_internal_diagnostics())
        {
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &mergeActionIfPossible____s_category_231);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            v16 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v17 = 0;
              _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Successfully merged actions", v17, 2u);
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

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UIEventSessionTouchAction;
  v3 = [(_UIEventSessionAction *)&v11 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @" tapDragState = %lu", -[_UIEventSessionTouchAction tapDragState](self, "tapDragState"));
  [v4 addObject:v5];

  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @" numFingers = %lu", -[_UIEventSessionTouchAction numFingers](self, "numFingers"));
  [v4 addObject:v6];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @" windowSection = %lu", -[_UIEventSessionTouchAction windowSection](self, "windowSection"));
  [v4 addObject:v7];

  if ([v4 count])
  {
    v8 = [v4 componentsJoinedByString:@", "];
    uint64_t v9 = [v3 stringByAppendingFormat:@" %@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (id)typeEncoding
{
  return @"Touch";
}

- (int64_t)actionType
{
  int64_t v3 = [(_UIEventSessionAction *)self source];
  if (v3 == 4)
  {
    int64_t numFingers = self->_numFingers;
    if (numFingers == 2) {
      return 19;
    }
    if (numFingers != 1) {
      return 20;
    }
    int64_t windowSection = self->_windowSection;
    unint64_t v10 = windowSection - 1;
    int64_t v5 = windowSection + 14;
    BOOL v6 = v10 >= 3;
    int64_t v7 = 18;
LABEL_11:
    if (v6) {
      return v7;
    }
    else {
      return v5;
    }
  }
  if (v3 != 1) {
    return 21;
  }
  int64_t v4 = self->_numFingers;
  switch(v4)
  {
    case 3:
      BOOL v12 = self->_tapDragState == 1;
      int64_t v13 = 8;
      break;
    case 2:
      BOOL v12 = self->_tapDragState == 1;
      int64_t v13 = 6;
      break;
    case 1:
      if (self->_tapDragState != 1) {
        return 5;
      }
      int64_t v5 = self->_windowSection;
      BOOL v6 = (unint64_t)(v5 - 1) >= 3;
      int64_t v7 = 4;
      goto LABEL_11;
    default:
      BOOL v12 = self->_tapDragState == 1;
      int64_t v13 = 10;
      break;
  }
  if (v12) {
    return v13;
  }
  else {
    return v13 + 1;
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

- (int64_t)windowSection
{
  return self->_windowSection;
}

- (void)setWindowSection:(int64_t)a3
{
  self->_int64_t windowSection = a3;
}

@end
@interface LookAroundPIPStateMachine
- (BOOL)canSetStateTo:(unint64_t)a3;
- (BOOL)isActive;
- (BOOL)isCancellingPendingMove;
- (BOOL)isMoving;
- (BOOL)isPanning;
- (BOOL)showStateChanges;
- (unint64_t)state;
- (void)setShowStateChanges:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateTo:(unint64_t)a3;
@end

@implementation LookAroundPIPStateMachine

- (BOOL)isActive
{
  return self->_state != 0;
}

- (BOOL)isCancellingPendingMove
{
  return self->_state == 1;
}

- (BOOL)isMoving
{
  return self->_state == 3;
}

- (BOOL)isPanning
{
  return self->_state == 4;
}

- (BOOL)canSetStateTo:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      return 1;
    case 1uLL:
      BOOL v7 = self->_state == 3;
      goto LABEL_13;
    case 3uLL:
      unint64_t state = self->_state;
      BOOL v7 = state == 2 || state == 4;
      goto LABEL_13;
    case 4uLL:
    case 5uLL:
      unint64_t v4 = self->_state;
      BOOL v5 = v4 >= 7;
      unsigned int v6 = (0x46u >> v4) & 1;
      if (v5) {
        return 0;
      }
      else {
        return v6;
      }
    case 6uLL:
      BOOL v7 = self->_state == 5;
      goto LABEL_13;
    case 7uLL:
      BOOL v7 = self->_state == 6;
LABEL_13:
      BOOL result = v7;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)setStateTo:(unint64_t)a3
{
  if (-[LookAroundPIPStateMachine canSetStateTo:](self, "canSetStateTo:"))
  {
    if (a3 && self->_showStateChanges)
    {
      BOOL v5 = sub_1005764AC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unint64_t state = self->_state;
        if (state > 7) {
          CFStringRef v7 = &stru_101324E70;
        }
        else {
          CFStringRef v7 = off_10131B2F0[state];
        }
        if (a3 > 7) {
          CFStringRef v8 = &stru_101324E70;
        }
        else {
          CFStringRef v8 = off_10131B2B8[a3 - 1];
        }
        int v9 = 138412546;
        CFStringRef v10 = v7;
        __int16 v11 = 2112;
        CFStringRef v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "State: %@ -> %@", (uint8_t *)&v9, 0x16u);
      }
    }
    self->_unint64_t state = a3;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (BOOL)showStateChanges
{
  return self->_showStateChanges;
}

- (void)setShowStateChanges:(BOOL)a3
{
  self->_showStateChanges = a3;
}

@end
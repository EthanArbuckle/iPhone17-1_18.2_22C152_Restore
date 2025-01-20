@interface UIPress
- (BOOL)_isAbandoningForwardingRecord;
- (BOOL)_isAnalogStickPress;
- (BOOL)_isDirectionalPress;
- (BOOL)_isSynthetic;
- (BOOL)isDelayed;
- (BOOL)isLongClick;
- (BOOL)sentPressesEnded;
- (CGFloat)force;
- (NSArray)gestureRecognizers;
- (NSString)description;
- (NSTimeInterval)timestamp;
- (SEL)_responderSelectorForPhase:(int64_t)a3;
- (UIKey)key;
- (UIPressPhase)phase;
- (UIPressType)type;
- (UIResponder)responder;
- (UIWindow)window;
- (_UIEventComponentPhaseValue)_eventComponentPhase;
- (id)_eventComponentPhaseForValue:(int64_t)a3;
- (id)_forwardingRecord;
- (id)_mutableForwardingRecord;
- (id)_phaseDescription;
- (int64_t)modifierFlags;
- (unint64_t)_eventComponentType;
- (unint64_t)_gameControllerComponent;
- (unint64_t)_source;
- (unint64_t)clickCount;
- (unsigned)contextID;
- (void)_abandonForwardingRecord;
- (void)_loadStateFromPress:(id)a3;
- (void)_loadStateFromPressInfo:(id)a3;
- (void)_removeGestureRecognizer:(id)a3;
- (void)_setEventComponentPhase:(id)a3;
- (void)_setGameControllerComponent:(unint64_t)a3;
- (void)_setSource:(unint64_t)a3;
- (void)setClickCount:(unint64_t)a3;
- (void)setForce:(double)a3;
- (void)setGestureRecognizers:(id)a3;
- (void)setIsDelayed:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLongClick:(BOOL)a3;
- (void)setModifierFlags:(int64_t)a3;
- (void)setPhase:(int64_t)a3;
- (void)setResponder:(id)a3;
- (void)setSentPressesEnded:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation UIPress

- (NSArray)gestureRecognizers
{
  return (NSArray *)(id)[(NSMutableArray *)self->_gestureRecognizers copy];
}

- (void)setGestureRecognizers:(id)a3
{
  if (self->_gestureRecognizers != a3)
  {
    v4 = (NSMutableArray *)[a3 mutableCopy];
    gestureRecognizers = self->_gestureRecognizers;
    self->_gestureRecognizers = v4;
  }
}

- (void)_removeGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_gestureRecognizers, "containsObject:")) {
    [(NSMutableArray *)self->_gestureRecognizers removeObject:v4];
  }
}

- (id)_mutableForwardingRecord
{
  forwardingRecord = self->_forwardingRecord;
  if (!forwardingRecord)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_forwardingRecord;
    self->_forwardingRecord = v4;

    forwardingRecord = self->_forwardingRecord;
  }
  return forwardingRecord;
}

- (BOOL)_isAbandoningForwardingRecord
{
  return self->_abandonForwardingRecord;
}

- (void)_abandonForwardingRecord
{
  self->_abandonForwardingRecord = 1;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;
}

- (id)_forwardingRecord
{
  return self->_forwardingRecord;
}

- (SEL)_responderSelectorForPhase:(int64_t)a3
{
  if (a3 == 4) {
    return sel_pressesCancelled_withEvent_;
  }
  if (a3 == 3) {
    return sel_pressesEnded_withEvent_;
  }
  if (a3) {
    return 0;
  }
  return sel_pressesBegan_withEvent_;
}

- (BOOL)_isDirectionalPress
{
  return self->_type < 4uLL;
}

- (BOOL)_isAnalogStickPress
{
  return (self->_gameControllerComponent & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  UIPressPhase v5 = [(UIPress *)self phase];
  UIPressType v6 = [(UIPress *)self type];
  [(UIPress *)self force];
  return (NSString *)[v3 stringWithFormat:@"<%@: %p phase=%ld type=%ld force=%f>", v4, self, v5, v6, v7];
}

- (id)_phaseDescription
{
  unint64_t phase = self->_phase;
  if (phase > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5304370[phase];
  }
}

- (BOOL)_isSynthetic
{
  unint64_t source = self->_source;
  return self->_type == 4 && source == 2 || source == 3;
}

- (unint64_t)_eventComponentType
{
  return 1;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  int64_t phase = self->_phase;
  v3 = _eventComponentPhaseMapping_0();
  uint64_t v4 = _eventComponentPhaseForUnderlyingValue(phase, v3);

  return (_UIEventComponentPhaseValue *)v4;
}

- (void)_setEventComponentPhase:(id)a3
{
  self->_int64_t phase = [a3 underlyingValue];
}

- (id)_eventComponentPhaseForValue:(int64_t)a3
{
  uint64_t v4 = _eventComponentPhaseMapping_0();
  UIPressPhase v5 = _eventComponentPhaseForValue(a3, v4);

  return v5;
}

- (void)_loadStateFromPress:(id)a3
{
  self->_timestamp = *((double *)a3 + 4);
  self->_int64_t phase = *((void *)a3 + 5);
  self->_type = *((void *)a3 + 6);
  self->_force = *((double *)a3 + 9);
  self->_unint64_t source = *((void *)a3 + 12);
  self->_gameControllerComponent = *((void *)a3 + 13);
  self->_isDelayed = *((unsigned char *)a3 + 25);
  self->_sentPressesEnded = *((unsigned char *)a3 + 26);
  UIPressPhase v5 = (UIResponder *)*((id *)a3 + 8);
  responder = self->_responder;
  self->_responder = v5;
  id v7 = a3;

  objc_storeStrong((id *)&self->_window, *((id *)v7 + 7));
  self->_clickCount = *((void *)v7 + 14);
  self->_longClick = *((unsigned char *)v7 + 27);
  LODWORD(responder) = *((_DWORD *)v7 + 7);

  self->_contextID = responder;
}

- (void)_loadStateFromPressInfo:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  self->_timestamp = v5;
  self->_int64_t phase = [v4 phase];
  self->_type = [v4 type];
  [v4 force];
  self->_force = v6;
  self->_unint64_t source = [v4 source];
  self->_gameControllerComponent = [v4 gameControllerComponent];
  self->_clickCount = [v4 clickCount];
  self->_longClick = [v4 isLongClick];
  self->_contextID = [v4 contextID];
  id v7 = [v4 key];
  key = self->_key;
  self->_key = v7;

  int64_t v9 = [v4 modifierFlags];
  self->_modifierFlags = v9;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (UIPressPhase)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_int64_t phase = a3;
}

- (UIPressType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
}

- (CGFloat)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (UIKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (unint64_t)_source
{
  return self->_source;
}

- (void)_setSource:(unint64_t)a3
{
  self->_unint64_t source = a3;
}

- (unint64_t)_gameControllerComponent
{
  return self->_gameControllerComponent;
}

- (void)_setGameControllerComponent:(unint64_t)a3
{
  self->_gameControllerComponent = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_isDelayed = a3;
}

- (BOOL)sentPressesEnded
{
  return self->_sentPressesEnded;
}

- (void)setSentPressesEnded:(BOOL)a3
{
  self->_sentPressesEnded = a3;
}

- (unint64_t)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(unint64_t)a3
{
  self->_clickCount = a3;
}

- (BOOL)isLongClick
{
  return self->_longClick;
}

- (void)setLongClick:(BOOL)a3
{
  self->_longClick = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_forwardingRecord, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end
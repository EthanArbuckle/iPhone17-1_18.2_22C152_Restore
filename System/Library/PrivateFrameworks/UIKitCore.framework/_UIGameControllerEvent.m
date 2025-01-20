@interface _UIGameControllerEvent
- (BOOL)_determineInputTypeAndProcess:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (BOOL)_processDPad:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (BOOL)_processLeftStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (BOOL)_processRightStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (BOOL)_processShoulder:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (BOOL)_processStandardButtons:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5;
- (CGPoint)_leftStickPosition;
- (int64_t)subtype;
- (int64_t)type;
- (void)_maybeConvertAndSendAsPressesEvent;
- (void)_reset;
- (void)_sendEventToResponder:(id)a3;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIGameControllerEvent

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIGameControllerEvent;
  -[UIEvent _setHIDEvent:](&v8, sel__setHIDEvent_);
  if (!self->_responderDeliveryPolicy)
  {
    v4 = _UIEventHIDUIWindowForHIDEvent();
    v5 = [v4 windowScene];
    v6 = _UIFocusBehaviorForScene(v5);

    if ([v6 supportsGameControllers]) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    self->_responderDeliveryPolicy = v7;
  }
}

- (int64_t)type
{
  return 8;
}

- (int64_t)subtype
{
  return 0;
}

- (void)_sendEventToResponder:(id)a3
{
}

- (void)_reset
{
  *(_OWORD *)&self->_previousState.senderID = 0u;
  *(_OWORD *)&self->_previousState.controllerState[1] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[3] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[5] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[7] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[9] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[11] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[13] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[15] = 0u;
  *(_OWORD *)&self->_previousState.normalizedLeftStickState[1] = 0u;
  *(_OWORD *)&self->_previousState.normalizedLeftStickState[3] = 0u;
  *(_OWORD *)&self->_previousState.normalizedRightStickState[1] = 0u;
  *(_OWORD *)&self->_previousState.normalizedRightStickState[3] = 0u;
  *(_OWORD *)&self->_previousState.normalizedShoulderButtonState[1] = 0u;
  self->_previousState.normalizedShoulderButtonState[3] = 0.0;
  self->_activeComponent = 0;
}

- (void)_maybeConvertAndSendAsPressesEvent
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(UIEvent *)self _hidEvent];
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  double v5 = _UIMediaTimeForMachTime(TimeStamp);
  long long v33 = xmmword_186B9BDB8;
  long long v34 = unk_186B9BDC8;
  long long v35 = xmmword_186B9BDD8;
  long long v36 = unk_186B9BDE8;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int8x16_t v24 = 0u;
  memset(v25, 0, sizeof(v25));
  *(void *)&long long v26 = 0;
  IOHIDEventGetFloatMultiple();
  *(void *)&long long v19 = IOHIDEventGetSenderID();
  *((void *)&v26 + 1) = fmax(0.0, 0.0);
  float64x2_t v27 = vmaxnmq_f64(vnegq_f64((float64x2_t)vextq_s8(*(int8x16_t *)((char *)v25 + 8), *(int8x16_t *)((char *)v25 + 8), 8uLL)), (float64x2_t)0);
  *(void *)&long long v28 = *((void *)&v26 + 1);
  *((void *)&v28 + 1) = *((void *)&v26 + 1);
  float64x2_t v29 = vmaxnmq_f64(vnegq_f64((float64x2_t)vextq_s8((int8x16_t)0, (int8x16_t)0, 8uLL)), (float64x2_t)0);
  *(void *)&long long v30 = *((void *)&v26 + 1);
  *((void *)&v30 + 1) = *((void *)&v26 + 1);
  float64x2_t v31 = vmaxnmq_f64((float64x2_t)vextq_s8(v24, v24, 8uLL), (float64x2_t)0);
  double v32 = *((double *)&v26 + 1);
  if ((void)v19 == self->_previousState.senderID || !self->_activeComponent)
  {
    if (self->_responderDeliveryPolicy == 1)
    {
      v6 = (void *)UIApp;
      int v7 = _UIEventHIDUIWindowForHIDEvent();
      id v8 = (id)[v6 _pressesEventForWindow:v7];

      [v8 _setHIDEvent:v3];
      objc_msgSend(v8, "_setGSEvent:", -[UIEvent _gsEvent](self, "_gsEvent"));
      BOOL v9 = [(_UIGameControllerEvent *)self _processStandardButtons:&v19 pressesEvent:v8 timestamp:v5];
      BOOL v10 = v9;
      switch(self->_activeComponent)
      {
        case 0uLL:
          BOOL v11 = [(_UIGameControllerEvent *)self _determineInputTypeAndProcess:&v19 pressesEvent:v8 timestamp:v5];
          goto LABEL_12;
        case 1uLL:
          BOOL v11 = [(_UIGameControllerEvent *)self _processDPad:&v19 pressesEvent:v8 timestamp:v5];
          goto LABEL_12;
        case 2uLL:
          BOOL v11 = [(_UIGameControllerEvent *)self _processLeftStick:&v19 pressesEvent:v8 timestamp:v5];
          goto LABEL_12;
        case 3uLL:
          BOOL v11 = [(_UIGameControllerEvent *)self _processRightStick:&v19 pressesEvent:v8 timestamp:v5];
          goto LABEL_12;
        case 5uLL:
          BOOL v11 = [(_UIGameControllerEvent *)self _processShoulder:&v19 pressesEvent:v8 timestamp:v5];
LABEL_12:
          if (v10 || v11) {
            goto LABEL_13;
          }
          break;
        default:
          if (!v9) {
            break;
          }
LABEL_13:
          objc_msgSend((id)UIApp, "sendEvent:", v8, (void)v19);
          [(id)UIApp _finishButtonEvent:v8];
          break;
      }
    }
    float64x2_t v12 = v31;
    *(_OWORD *)&self->_previousState.normalizedRightStickState[3] = v30;
    *(float64x2_t *)&self->_previousState.normalizedShoulderButtonState[1] = v12;
    self->_previousState.normalizedShoulderButtonState[3] = v32;
    float64x2_t v13 = v27;
    *(_OWORD *)&self->_previousState.controllerState[15] = v26;
    *(float64x2_t *)&self->_previousState.normalizedLeftStickState[1] = v13;
    float64x2_t v14 = v29;
    *(_OWORD *)&self->_previousState.normalizedLeftStickState[3] = v28;
    *(float64x2_t *)&self->_previousState.normalizedRightStickState[1] = v14;
    int8x16_t v15 = v24;
    *(_OWORD *)&self->_previousState.controllerState[7] = v23;
    *(int8x16_t *)&self->_previousState.controllerState[9] = v15;
    long long v16 = v25[1];
    *(_OWORD *)&self->_previousState.controllerState[11] = v25[0];
    *(_OWORD *)&self->_previousState.controllerState[13] = v16;
    long long v17 = v20;
    *(_OWORD *)&self->_previousState.senderID = v19;
    *(_OWORD *)&self->_previousState.controllerState[1] = v17;
    long long v18 = v22;
    *(_OWORD *)&self->_previousState.controllerState[3] = v21;
    *(_OWORD *)&self->_previousState.controllerState[5] = v18;
  }
}

- (CGPoint)_leftStickPosition
{
  double v2 = self->_previousState.controllerState[12];
  double v3 = self->_previousState.controllerState[13];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_determineInputTypeAndProcess:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  id v8 = a4;
  char v15 = 0;
  _UIAppGameControllerProcessDPad((double *)&self->_previousState.senderID, (double *)&a3->var0, v8, &v15, 0, a5);
  if (v15)
  {
    BOOL v9 = 1;
    self->_activeComponent = 1;
    goto LABEL_8;
  }
  char v14 = 0;
  _UIAppGameControllerProcessGenericStick(2, self->_previousState.normalizedLeftStickState, a3->var2, v8, &v14, 0, a5);
  if (v14)
  {
    unint64_t v10 = 2;
LABEL_7:
    self->_activeComponent = v10;
    BOOL v9 = 1;
    goto LABEL_8;
  }
  char v13 = 0;
  _UIAppGameControllerProcessGenericStick(3, self->_previousState.normalizedRightStickState, a3->var3, v8, &v13, 0, a5);
  if (v13)
  {
    unint64_t v10 = 3;
    goto LABEL_7;
  }
  char v12 = 0;
  _UIAppGameControllerProcessShoulders((double *)&self->_previousState.senderID, (double *)&a3->var0, v8, &v12, 0, a5);
  BOOL v9 = v12 != 0;
  if (v12) {
    self->_activeComponent = 5;
  }
LABEL_8:

  return v9;
}

- (BOOL)_processStandardButtons:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  id v8 = a4;
  [v8 _hidEvent];
  BOOL v9 = BKSHIDEventGetBaseAttributes();
  uint64_t v10 = [v9 contextID];

  p_previousState = &self->_previousState;
  uint64_t v12 = _UIAppGameControllerPressInfoForState(4, 4, v10, self->_previousState.controllerState[4], a3->var1[4], a5);
  uint64_t v13 = _UIAppGameControllerPressInfoForState(5, 4, v10, p_previousState->controllerState[5], a3->var1[5], a5);
  uint64_t v14 = _UIAppGameControllerPressInfoForState(6, 4, v10, p_previousState->controllerState[6], a3->var1[6], a5);
  if (v12) {
    [(id)UIApp _prepareButtonEvent:v8 withPressInfo:v12];
  }
  if (v13) {
    [(id)UIApp _prepareButtonEvent:v8 withPressInfo:v13];
  }
  if (v14) {
    [(id)UIApp _prepareButtonEvent:v8 withPressInfo:v14];
  }

  return (v12 | v13 | v14) != 0;
}

- (BOOL)_processDPad:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7 = 0;
  _UIAppGameControllerProcessDPad((double *)&self->_previousState.senderID, (double *)&a3->var0, a4, (unsigned char *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7) {
    self->_activeComponent = 0;
  }
  return HIBYTE(v7);
}

- (BOOL)_processLeftStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7 = 0;
  _UIAppGameControllerProcessGenericStick(2, self->_previousState.normalizedLeftStickState, a3->var2, a4, (unsigned char *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7) {
    self->_activeComponent = 0;
  }
  return HIBYTE(v7);
}

- (BOOL)_processRightStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7 = 0;
  _UIAppGameControllerProcessGenericStick(3, self->_previousState.normalizedRightStickState, a3->var3, a4, (unsigned char *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7) {
    self->_activeComponent = 0;
  }
  return HIBYTE(v7);
}

- (BOOL)_processShoulder:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7 = 0;
  _UIAppGameControllerProcessShoulders((double *)&self->_previousState.senderID, (double *)&a3->var0, a4, (unsigned char *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7) {
    self->_activeComponent = 0;
  }
  return HIBYTE(v7);
}

@end
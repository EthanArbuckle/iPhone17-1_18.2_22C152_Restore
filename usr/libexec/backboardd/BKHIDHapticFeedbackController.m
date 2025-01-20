@interface BKHIDHapticFeedbackController
+ (id)sharedInstance;
- (BKHIDHapticFeedbackController)initWithHIDHapticFeedbackInterface:(id)a3;
- (BOOL)_validateHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4;
- (BOOL)_validatePencilHapticFeedbackRequest:(id)a3 forPID:(int)a4;
- (BOOL)_validateTrackpadHapticFeedbackRequest:(id)a3 forPID:(int)a4;
- (void)postHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4;
@end

@implementation BKHIDHapticFeedbackController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDHapticFeedbackInterface, 0);
  objc_storeStrong((id *)&self->_genericGestureFocusObserver, 0);

  objc_storeStrong((id *)&self->_mousePointerController, 0);
}

- (BOOL)_validateTrackpadHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  mousePointerController = self->_mousePointerController;
  if (!mousePointerController)
  {
    v7 = +[BKHIDEventProcessorRegistry sharedInstance];
    v8 = [v7 eventProcessorOfClass:objc_opt_class()];
    v9 = [v8 mousePointerController];
    v10 = self->_mousePointerController;
    self->_mousePointerController = v9;

    mousePointerController = self->_mousePointerController;
  }

  return [(BKMousePointerController *)mousePointerController destinationPIDMatchesHapticFeedbackRequestPID:v4];
}

- (BOOL)_validatePencilHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  genericGestureFocusObserver = self->_genericGestureFocusObserver;
  if (!genericGestureFocusObserver)
  {
    v7 = +[BKTouchDeliveryGenericGestureFocusObserver sharedInstance];
    v8 = self->_genericGestureFocusObserver;
    self->_genericGestureFocusObserver = v7;

    genericGestureFocusObserver = self->_genericGestureFocusObserver;
  }

  return [(BKTouchDeliveryGenericGestureFocusObserver *)genericGestureFocusObserver destinationPIDMatchesHapticFeedbackRequestPID:v4];
}

- (BOOL)_validateHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = BSPIDForAuditToken();
  v8 = [v6 powerSourceID];
  id v9 = [v6 deviceType];
  unsigned __int8 v10 = +[BKSecurityManager hasEntitlement:BKRequestHapticFeedbackEntitlement forAuditToken:a4];
  if (!v8)
  {
    if (v9)
    {
      if (v9 == (id)1
        && [(BKHIDHapticFeedbackController *)self _validateTrackpadHapticFeedbackRequest:v6 forPID:v7])
      {
        goto LABEL_3;
      }
    }
    else if ([(BKHIDHapticFeedbackController *)self _validatePencilHapticFeedbackRequest:v6 forPID:v7])
    {
      goto LABEL_3;
    }
    v12 = sub_10005FE20();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v6;
      __int16 v17 = 1024;
      int v18 = v7;
      v13 = "Haptic feedback request %{public}@ from pid %d could not be validated due to destination mismatch";
      goto LABEL_15;
    }
LABEL_12:

    BOOL v11 = 0;
    goto LABEL_13;
  }
  if ((v10 & 1) == 0)
  {
    v12 = sub_10005FE20();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v6;
      __int16 v17 = 1024;
      int v18 = v7;
      v13 = "Haptic feedback request %{public}@ from pid %d could not be validated due to missing entitlement";
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_3:
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (void)postHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v5 = a3;
  if (-[BKHIDHapticFeedbackController _validateHapticFeedbackRequest:forAuditToken:](self, "_validateHapticFeedbackRequest:forAuditToken:"))
  {
    [(BKHIDHapticFeedbackInterface *)self->_HIDHapticFeedbackInterface playHapticFeedbackRequest:v5];
  }
}

- (BKHIDHapticFeedbackController)initWithHIDHapticFeedbackInterface:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDHapticFeedbackController;
  id v6 = [(BKHIDHapticFeedbackController *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_HIDHapticFeedbackInterface, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000753A8;
  block[3] = &unk_1000F7D08;
  block[4] = a1;
  if (qword_100123078 != -1) {
    dispatch_once(&qword_100123078, block);
  }
  v2 = (void *)qword_100123080;

  return v2;
}

@end
@interface BKDirectTouchState
- (BKDirectTouchState)init;
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)invalidate;
@end

@implementation BKDirectTouchState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateEvents, 0);
  objc_storeStrong((id *)&self->_hitTestRegions, 0);
  objc_storeStrong((id *)&self->_latentSystemGestureDestinations, 0);
  objc_storeStrong((id *)&self->_centroidPerUserIdentifier, 0);
  objc_storeStrong((id *)&self->_contactsByContextID, 0);
  objc_storeStrong((id *)&self->_destinationsByContextID, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_eventSystemInterface, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_touchLifecycleObservers, 0);
  objc_storeStrong((id *)&self->_touchDeliveryObservationManager, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_suppressTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_hitTester, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)invalidate
{
  v3 = BKLogTouchEvents();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidate: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  sub_10000D21C(self, 0, 0);
  sub_10000C820((uint64_t)self, 0, 0);
  [(BKDirectTouchStateHitTester *)self->_hitTester invalidate];
  hitTester = self->_hitTester;
  self->_hitTester = 0;

  [(BKDirectTouchUpdateEvents *)self->_updateEvents invalidate];
  updateEvents = self->_updateEvents;
  self->_updateEvents = 0;

  [(BSCompoundAssertion *)self->_suppressTouchesAssertion invalidate];
  suppressTouchesAssertion = self->_suppressTouchesAssertion;
  self->_suppressTouchesAssertion = 0;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B500;
  v3[3] = &unk_1000F8E50;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (BKDirectTouchState)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v6 = +[NSString stringWithFormat:@"Subclasses not allowed"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      CFStringRef v18 = @"BKDirectTouchState.mm";
      __int16 v19 = 1024;
      int v20 = 183;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10008C188);
  }
  v10.receiver = self;
  v10.super_class = (Class)BKDirectTouchState;
  return [(BKDirectTouchState *)&v10 init];
}

@end
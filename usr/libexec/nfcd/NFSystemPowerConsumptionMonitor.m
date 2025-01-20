@interface NFSystemPowerConsumptionMonitor
- (NFSystemPowerConsumptionMonitor)init;
@end

@implementation NFSystemPowerConsumptionMonitor

- (NFSystemPowerConsumptionMonitor)init
{
  v22.receiver = self;
  v22.super_class = (Class)NFSystemPowerConsumptionMonitor;
  v2 = [(NFSystemPowerConsumptionMonitor *)&v22 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_readerStarted = 0;
    uint64_t v4 = objc_opt_new();
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableArray *)v4;

    if ((sub_1001AD10C((uint64_t)v3) & 1) == 0)
    {
      objc_initWeak(&location, v3);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v3);
        if (class_isMetaClass(Class)) {
          uint64_t v8 = 43;
        }
        else {
          uint64_t v8 = 45;
        }
        ClassName = object_getClassName(v3);
        Name = sel_getName("initCoreDuet");
        Logger(6, "%c[%{public}s %{public}s]:%i Using CoreDuet", v8, ClassName, Name, 408);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = object_getClass(v3);
        if (class_isMetaClass(v12)) {
          int v13 = 43;
        }
        else {
          int v13 = 45;
        }
        v14 = object_getClassName(v3);
        v15 = sel_getName("initCoreDuet");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v13;
        *(_WORD *)v26 = 2082;
        *(void *)&v26[2] = v14;
        *(_WORD *)&v26[10] = 2082;
        *(void *)&v26[12] = v15;
        *(_WORD *)&v26[20] = 1024;
        *(_DWORD *)&v26[22] = 408;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using CoreDuet", buf, 0x22u);
      }

      id v23 = 0;
      uint64_t v16 = +[PPMClient sharedInstanceWithClientRepresentation:@"com.apple.duet.ppm-attr.stck" error:&v23];
      id v17 = v23;
      ppmSharedInstance = v3->_ppmSharedInstance;
      v3->_ppmSharedInstance = (PPMClient *)v16;

      v19 = v3->_ppmSharedInstance;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)v26 = 3221225472;
      *(void *)&v26[8] = sub_1001ACC70;
      *(void *)&v26[16] = &unk_1003068A8;
      objc_copyWeak((id *)&v26[24], &location);
      [(PPMClient *)v19 registerForNotificationsWithError:0 handler:buf];
      objc_destroyWeak((id *)&v26[24]);
      objc_destroyWeak(&location);
    }
  }
  v20 = v3;

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalDelegateQueue, 0);
  objc_destroyWeak((id *)&self->_thermalDelegate);
  objc_storeStrong((id *)&self->_maxApprovedBudget, 0);
  objc_storeStrong((id *)&self->_currentThermalBudget, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_powerConsumer, 0);
  objc_storeStrong((id *)&self->_cpmsdescription, 0);

  objc_storeStrong((id *)&self->_ppmSharedInstance, 0);
}

@end
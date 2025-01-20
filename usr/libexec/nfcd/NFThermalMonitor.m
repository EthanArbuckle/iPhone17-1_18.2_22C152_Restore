@interface NFThermalMonitor
- (void)thermalStateChanged:(unint64_t)a3;
@end

@implementation NFThermalMonitor

- (void)thermalStateChanged:(unint64_t)a3
{
  v5 = self;
  objc_sync_enter(v5);
  switch(a3)
  {
    case 2uLL:
      if (v5->_state != 4)
      {
        if (NFThermalMonitorProvidedBySMC())
        {
          temperaturePollingHandler = (void (**)(void))v5->_temperaturePollingHandler;
          if (temperaturePollingHandler) {
            temperaturePollingHandler[2]();
          }
        }
      }
      uint64_t v7 = 4;
      goto LABEL_11;
    case 1uLL:
      uint64_t v7 = 2;
LABEL_11:
      v5->_unint64_t state = v7;
      break;
    case 0uLL:
      v5->_unint64_t state = 0;
      break;
  }
  objc_sync_exit(v5);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v5);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i New state : %lx", v14, ClassName, Name, 202, v5->_state);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(v5);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    v18 = object_getClassName(v5);
    v19 = sel_getName(a2);
    unint64_t state = v5->_state;
    *(_DWORD *)buf = 67110146;
    int v23 = v17;
    __int16 v24 = 2082;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = v19;
    __int16 v28 = 1024;
    int v29 = 202;
    __int16 v30 = 2048;
    unint64_t v31 = state;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New state : %lx", buf, 0x2Cu);
  }

  handler = (void (**)(id, unint64_t))v5->_handler;
  if (handler) {
    handler[2](handler, v5->_state);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_temperaturePollingHandler, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_powerMonitor, 0);
}

@end
@interface PDWatchExpressModeStateController
- (BOOL)isInLostMode;
- (NSSet)expressPassConfigurations;
- (PDWatchExpressModeStateController)initWithExpressPassConfigurations:(id)a3 inLostMode:(BOOL)a4;
- (PDWatchExpressModeStateControllerDelegate)delegate;
- (unint64_t)expressStatus;
- (unint64_t)lastSuggestedExpressStatus;
- (void)_logControllerState;
- (void)_registerForExpressAvailabilityChanges;
- (void)_requestUpdateExpressStatus:(unint64_t)a3;
- (void)_unregisterForExpressAvailabilityChanges;
- (void)_updateExpressAvailabilityListeners;
- (void)_updateExpressModeEnablement;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExpressModeAllowed:(BOOL)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setExpressStatus:(unint64_t)a3;
- (void)setInLostMode:(BOOL)a3;
- (void)setLastSuggestedExpressStatus:(unint64_t)a3;
@end

@implementation PDWatchExpressModeStateController

- (PDWatchExpressModeStateController)initWithExpressPassConfigurations:(id)a3 inLostMode:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDWatchExpressModeStateController;
  v8 = [(PDWatchExpressModeStateController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_expressStatus = 0;
    v8->_lastSuggestedExpressStatus = 0;
    objc_storeStrong((id *)&v8->_expressPassConfigurations, a3);
    v9->_inLostMode = a4;
    [(PDWatchExpressModeStateController *)v9 _logControllerState];
    v10 = PDDefaultQueue();
    PDXPCEventStreamRegisterObserver(v9, @"com.apple.NanoPassbookEvents", v10);

    [(PDWatchExpressModeStateController *)v9 _updateExpressAvailabilityListeners];
  }

  return v9;
}

- (void)setExpressStatus:(unint64_t)a3
{
  if (self->_expressStatus != a3)
  {
    self->_expressStatus = a3;
    [(PDWatchExpressModeStateController *)self _logControllerState];
    [(PDWatchExpressModeStateController *)self _updateExpressModeEnablement];
  }
}

- (void)setExpressModeAllowed:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 3;
  }
  [(PDWatchExpressModeStateController *)self setExpressStatus:v3];
}

- (void)setExpressPassConfigurations:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_expressPassConfigurations, a3);
    [(PDWatchExpressModeStateController *)self _logControllerState];
    [(PDWatchExpressModeStateController *)self _updateExpressAvailabilityListeners];
    [(PDWatchExpressModeStateController *)self _updateExpressModeEnablement];
  }
}

- (void)setInLostMode:(BOOL)a3
{
  if (self->_inLostMode != a3)
  {
    self->_inLostMode = a3;
    [(PDWatchExpressModeStateController *)self _logControllerState];
    [(PDWatchExpressModeStateController *)self _updateExpressModeEnablement];
  }
}

- (void)_registerForExpressAvailabilityChanges
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering for watch express availability changes", v4, 2u);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "Event", "ExpressModeEvent");
  xpc_set_event();
}

- (void)_unregisterForExpressAvailabilityChanges
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unregistering for watch express availability changes", v3, 2u);
  }

  xpc_set_event();
}

- (void)_logControllerState
{
  xpc_object_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = PKWatchExpressStatusToString([(PDWatchExpressModeStateController *)self expressStatus]);
    unsigned int v5 = [(PDWatchExpressModeStateController *)self isInLostMode];
    v6 = "is not";
    if (v5) {
      v6 = "is";
    }
    int v7 = 138412546;
    v8 = v4;
    __int16 v9 = 2080;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Express mode state: express status is %@; device %s in lost mode",
      (uint8_t *)&v7,
      0x16u);
  }
}

- (void)_requestUpdateExpressStatus:(unint64_t)a3
{
  if ([(PDWatchExpressModeStateController *)self lastSuggestedExpressStatus] != a3)
  {
    switch(a3)
    {
      case 0uLL:
        unsigned int v5 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "Suggesting that express status is unknown";
        break;
      case 1uLL:
        unsigned int v5 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "Suggesting that express should be enabled";
        break;
      case 2uLL:
        unsigned int v5 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "Suggesting that express grace period should become active";
        break;
      case 3uLL:
        unsigned int v5 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "Suggesting that express should be disabled";
        break;
      default:
        goto LABEL_13;
    }
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_12:

LABEL_13:
    [(PDWatchExpressModeStateController *)self setLastSuggestedExpressStatus:a3];
    int v7 = PDDefaultQueue();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003ADF30;
    v8[3] = &unk_10072F840;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(v7, v8);
  }
}

- (void)_updateExpressAvailabilityListeners
{
  xpc_object_t v3 = [(PDWatchExpressModeStateController *)self expressPassConfigurations];
  id v4 = [v3 count];

  if (v4)
  {
    [(PDWatchExpressModeStateController *)self _registerForExpressAvailabilityChanges];
  }
  else
  {
    [(PDWatchExpressModeStateController *)self _unregisterForExpressAvailabilityChanges];
  }
}

- (void)_updateExpressModeEnablement
{
  unint64_t v3 = [(PDWatchExpressModeStateController *)self expressStatus];
  if (!v3) {
    goto LABEL_7;
  }
  unint64_t v4 = v3;
  unsigned int v5 = [(PDWatchExpressModeStateController *)self expressPassConfigurations];
  if (![v5 count])
  {

LABEL_7:
    uint64_t v7 = 3;
    goto LABEL_8;
  }
  unsigned int v6 = [(PDWatchExpressModeStateController *)self isInLostMode];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v4;
  }
LABEL_8:
  [(PDWatchExpressModeStateController *)self _requestUpdateExpressStatus:v7];
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  id v6 = a3;
  if (![a4 isEqualToString:@"com.apple.NanoPassbookEvents"]) {
    goto LABEL_21;
  }
  string = xpc_dictionary_get_string(v6, _xpc_event_key_name);
  if (!string)
  {
    v8 = 0;
    if (v6) {
      goto LABEL_4;
    }
LABEL_6:
    __int16 v9 = 0;
    goto LABEL_7;
  }
  v8 = +[NSString stringWithUTF8String:string];
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  __int16 v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
LABEL_7:
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Express mode state: Received XPC events stream handler callback for NanoPassbook event name %@ dict %@", (uint8_t *)&v22, 0x16u);
  }

  v11 = +[NSString stringWithUTF8String:"ExpressModeEvent"];
  unsigned int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    v13 = +[NSString stringWithUTF8String:"ExpressModeStatus"];
    uint64_t v14 = [v9 objectForKey:v13];
    v15 = [(id)v14 stringValue];

    v16 = +[NSString stringWithUTF8String:"ExpressModeAllowed"];
    LOBYTE(v14) = [v15 isEqualToString:v16];

    if (v14)
    {
      uint64_t v17 = 1;
    }
    else
    {
      v18 = +[NSString stringWithUTF8String:"ExpressGracePeriodActive"];
      unsigned __int8 v19 = [v15 isEqualToString:v18];

      if (v19)
      {
        uint64_t v17 = 2;
      }
      else
      {
        v20 = +[NSString stringWithUTF8String:"ExpressModeForbidden"];
        unsigned __int8 v21 = [v15 isEqualToString:v20];

        if (v21)
        {
          uint64_t v17 = 3;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 138412290;
            v23 = v15;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Express mode state: Received unrecognized express status: %@", (uint8_t *)&v22, 0xCu);
          }

          uint64_t v17 = 0;
        }
      }
    }
    [(PDWatchExpressModeStateController *)self setExpressStatus:v17];
  }
LABEL_21:
}

- (NSSet)expressPassConfigurations
{
  return self->_expressPassConfigurations;
}

- (BOOL)isInLostMode
{
  return self->_inLostMode;
}

- (PDWatchExpressModeStateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDWatchExpressModeStateControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)expressStatus
{
  return self->_expressStatus;
}

- (unint64_t)lastSuggestedExpressStatus
{
  return self->_lastSuggestedExpressStatus;
}

- (void)setLastSuggestedExpressStatus:(unint64_t)a3
{
  self->_lastSuggestedExpressStatus = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
}

@end
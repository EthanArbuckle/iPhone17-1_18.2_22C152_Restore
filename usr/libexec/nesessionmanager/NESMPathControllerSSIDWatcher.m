@interface NESMPathControllerSSIDWatcher
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NESMPathControllerSSIDWatcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSession);
  objc_storeStrong((id *)&self->_monitorTransaction, 0);
  objc_storeStrong((id *)&self->_ssid, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

- (void)dealloc
{
  sub_10008DD94((id *)&self->super.isa, a2);
  v3.receiver = self;
  v3.super_class = (Class)NESMPathControllerSSIDWatcher;
  [(NESMPathControllerSSIDWatcher *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  if (v14 != v10)
  {

    goto LABEL_14;
  }
  unsigned int v15 = [v9 isEqualToString:@"status"];

  if (!v15) {
    goto LABEL_14;
  }
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id v30 = objc_getProperty(self, v17, 16, 1);
    }
    else {
      id v30 = 0;
    }
    id v31 = [v30 status];
    v32 = @"Invalid";
    if (v31 == (id)2) {
      v32 = @"Not Available";
    }
    if (v31 == (id)1) {
      v32 = @"Available";
    }
    *(_DWORD *)v34 = 138412290;
    *(void *)&v34[4] = v32;
    v33 = v32;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "SSID status changed to %@", v34, 0xCu);
  }
  if (self) {
    id v19 = objc_getProperty(self, v18, 16, 1);
  }
  else {
    id v19 = 0;
  }
  if (objc_msgSend(v19, "status", *(_OWORD *)v34) == (id)1)
  {
    if (self)
    {
      self->_hasBeenAssociated = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
      id v23 = objc_getProperty(self, v22, 24, 1);
    }
    else
    {
      id WeakRetained = 0;
      id v23 = 0;
    }
    sub_10008E104(WeakRetained, v23, 1);
LABEL_13:

    goto LABEL_14;
  }
  if (self) {
    id v24 = objc_getProperty(self, v20, 16, 1);
  }
  else {
    id v24 = 0;
  }
  if ([v24 status] == (id)2 && self && self->_hasBeenAssociated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
    id v26 = objc_getProperty(self, v25, 24, 1);
    sub_10008E104(WeakRetained, v26, 0);
    sub_10008DD94((id *)&self->super.isa, v27);
    if (WeakRetained) {
      id v29 = objc_getProperty(WeakRetained, v28, 400, 1);
    }
    else {
      id v29 = 0;
    }
    [v29 removeObject:self];
    goto LABEL_13;
  }
LABEL_14:
}

@end
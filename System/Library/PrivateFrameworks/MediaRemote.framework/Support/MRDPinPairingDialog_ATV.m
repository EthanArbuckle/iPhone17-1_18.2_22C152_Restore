@interface MRDPinPairingDialog_ATV
- (MRDPinPairingDialog_ATV)init;
- (void)closeAll;
- (void)closeForClient:(id)a3;
- (void)closeForClient:(id)a3 userCancelled:(BOOL)a4;
- (void)dealloc;
- (void)showWithPin:(id)a3 forClient:(id)a4;
@end

@implementation MRDPinPairingDialog_ATV

- (MRDPinPairingDialog_ATV)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRDPinPairingDialog_ATV;
  v2 = [(MRDPinPairingDialog_ATV *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MRDPinPairingDialog_ATV *)self closeAll];
  v3.receiver = self;
  v3.super_class = (Class)MRDPinPairingDialog_ATV;
  [(MRDPinPairingDialog_ATV *)&v3 dealloc];
}

- (void)showWithPin:(id)a3 forClient:(id)a4
{
  id v16 = a3;
  if (!self->_titleKey)
  {
    MSVWeakLinkStringConstant();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    titleKey = self->_titleKey;
    self->_titleKey = v5;

    MSVWeakLinkStringConstant();
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    pinKey = self->_pinKey;
    self->_pinKey = v7;

    MSVWeakLinkStringConstant();
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    messageKey = self->_messageKey;
    self->_messageKey = v9;

    MSVWeakLinkStringConstant();
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    timeoutKey = self->_timeoutKey;
    self->_timeoutKey = v11;
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = MRLocalizedString();
  [v13 setObject:v14 forKey:self->_titleKey];

  [v13 setObject:v16 forKey:self->_pinKey];
  v15 = MRLocalizedString();
  [v13 setObject:v15 forKey:self->_messageKey];

  [v13 setObject:&off_100437CE0 forKey:self->_timeoutKey];
}

- (void)closeForClient:(id)a3
{
}

- (void)closeForClient:(id)a3 userCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_clients;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v7);
      }
      if (*(id *)(*((void *)&v13 + 1) + 8 * v10) == v6) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v8 = v6;

    if (v8)
    {
      -[NSMutableArray removeObject:](self->_clients, "removeObject:", v8, (void)v13);
      [v8 pinPairingToken];

      v11 = [(MRDPinPairingDialog *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v7 = [(MRDPinPairingDialog *)self delegate];
        [(NSMutableArray *)v7 pinPairingDialogDidClose:self forClient:v8 userCancelled:v4];
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
  }
}

- (void)closeAll
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_clients;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setPinPairingToken:", 0, (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_clients removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutKey, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_pinKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end
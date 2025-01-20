@interface NRApplicationServiceClient
- (NSString)description;
- (void)dealloc;
- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4;
@end

@implementation NRApplicationServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asNamesForIncomingResolveRequests, 0);
  objc_storeStrong((id *)&self->_asNamesForResolving, 0);

  objc_storeStrong((id *)&self->_asNamesForBrowsing, 0);
}

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (v6)
    {
      if (!v6->_cancelled
        && [(NSMutableArray *)v6->_asNamesForIncomingResolveRequests containsObject:v9])
      {
        id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
        [WeakRetained didCompleteIncomingResolveRequestForASName:v9 asClient:p_isa];
      }
    }
    else
    {
      id WeakRetained = 0;
      if ([0 containsObject:v9]) {
        goto LABEL_6;
      }
    }
  }
}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (v6)
    {
      if (!v6->_cancelled
        && [(NSMutableArray *)v6->_asNamesForResolving containsObject:v9])
      {
        [p_isa[3] removeObject:v9];
        id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
        [WeakRetained didStopResolveRequestForASName:v9 asClient:p_isa];
      }
    }
    else if ([0 containsObject:v9])
    {
      [0 removeObject:v9];
      id WeakRetained = 0;
      goto LABEL_6;
    }
  }
}

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (v6)
    {
      if (v6->_cancelled) {
        goto LABEL_8;
      }
      if (([(NSMutableArray *)v6->_asNamesForResolving containsObject:v9] & 1) == 0) {
        [p_isa[3] addObject:v9];
      }
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
    }
    else
    {
      id WeakRetained = 0;
      if (([0 containsObject:v9] & 1) == 0)
      {
        [0 addObject:v9];
        id WeakRetained = 0;
      }
    }
    [WeakRetained didStartResolveRequestForASName:v9 asClient:p_isa];
  }
LABEL_8:
}

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (v6)
    {
      if (!v6->_cancelled
        && [(NSMutableArray *)v6->_asNamesForBrowsing containsObject:v9])
      {
        [p_isa[2] removeObject:v9];
        id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
        [WeakRetained didStopBrowseRequestForASName:v9 asClient:p_isa];
      }
    }
    else if ([0 containsObject:v9])
    {
      [0 removeObject:v9];
      id WeakRetained = 0;
      goto LABEL_6;
    }
  }
}

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v11 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (v6)
    {
      if (v6->_cancelled) {
        goto LABEL_10;
      }
      if ([(NSMutableArray *)v6->_asNamesForBrowsing containsObject:v11]) {
        goto LABEL_5;
      }
      [p_isa[2] addObject:v11];
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
    }
    else
    {
      if ([0 containsObject:v11])
      {
LABEL_5:
        v8 = (void *)_NRCopyLogObjectForNRUUID();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (!IsLevelEnabled) {
          goto LABEL_10;
        }
        id WeakRetained = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
        goto LABEL_9;
      }
      [0 addObject:v11];
      id WeakRetained = 0;
    }
    [WeakRetained didStartBrowseRequestForASName:v11 asClient:p_isa];
LABEL_9:
  }
LABEL_10:
}

- (void)dealloc
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    v6 = nrUUID;
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  sub_10010273C(self);
  v8.receiver = self;
  v8.super_class = (Class)NRApplicationServiceClient;
  [(NRApplicationServiceClient *)&v8 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  if (self)
  {
    if (self->_started)
    {
      v4 = "started";
    }
    else if (self->_cancelled)
    {
      v4 = "cancelled";
    }
    else
    {
      v4 = "";
    }
    id v5 = [v3 initWithFormat:@"NRASClient[%llu %s ", self->_identifier, v4];
    [v5 appendFormat:@"browsing: %@ ", self->_asNamesForBrowsing];
    [v5 appendFormat:@"resolving: %@ ", self->_asNamesForResolving];
    asNamesForIncomingResolveRequests = self->_asNamesForIncomingResolveRequests;
  }
  else
  {
    id v5 = [[v3 initWithFormat:@"NRASClient[%llu %s ", 0, ""]
    [v5 appendFormat:@"browsing: %@ ", 0];
    [v5 appendFormat:@"resolving: %@ ", 0];
    asNamesForIncomingResolveRequests = 0;
  }
  [v5 appendFormat:@"incoming-requests: %@ ", asNamesForIncomingResolveRequests];
  [v5 appendString:@"]"];

  return (NSString *)v5;
}

@end
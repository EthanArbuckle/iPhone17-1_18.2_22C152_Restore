@interface NRNWActivityReporter
- (id)description;
- (void)dealloc;
@end

@implementation NRNWActivityReporter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
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
    v7 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v13 = 63;
    v14 = self;
    v11 = "";
    v12 = "-[NRNWActivityReporter dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    self->_started = 0;
    objc_setProperty_nonatomic_copy(self, v5, 0, 40);
    v9 = self->_nrUUID;
    v10 = [(NRNWActivityReporter *)self description];
    sub_10012F648(v9, 40003, v10, 0);
  }
  v15.receiver = self;
  v15.super_class = (Class)NRNWActivityReporter;
  [(NRNWActivityReporter *)&v15 dealloc];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self->_started) {
    v4 = "";
  }
  else {
    v4 = "!";
  }
  id v5 = [v3 initWithFormat:@"[%llu %sreporting %@]", self->_identifier, v4, self->_nrUUID];

  return v5;
}

@end
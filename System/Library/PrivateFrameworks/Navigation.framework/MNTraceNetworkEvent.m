@interface MNTraceNetworkEvent
- (BOOL)cellEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)nlcEnabled;
- (BOOL)wifiEnabled;
- (NSString)nlcProfile;
- (double)timestamp;
- (void)setCellEnabled:(BOOL)a3;
- (void)setNlcEnabled:(BOOL)a3;
- (void)setNlcProfile:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setWifiEnabled:(BOOL)a3;
@end

@implementation MNTraceNetworkEvent

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_cellEnabled == v5[8] && self->_wifiEnabled == v5[9] && self->_nlcEnabled == v5[10]) {
      char v7 = [(NSString *)self->_nlcProfile isEqual:*((void *)v5 + 3)];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)cellEnabled
{
  return self->_cellEnabled;
}

- (void)setCellEnabled:(BOOL)a3
{
  self->_cellEnabled = a3;
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
}

- (BOOL)nlcEnabled
{
  return self->_nlcEnabled;
}

- (void)setNlcEnabled:(BOOL)a3
{
  self->_nlcEnabled = a3;
}

- (NSString)nlcProfile
{
  return self->_nlcProfile;
}

- (void)setNlcProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
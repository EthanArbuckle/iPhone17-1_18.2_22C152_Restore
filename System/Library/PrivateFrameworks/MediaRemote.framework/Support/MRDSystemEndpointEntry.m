@interface MRDSystemEndpointEntry
- (BOOL)demoteWhenSyncingToCompanion;
- (BOOL)supportsIdleReset;
- (NSDate)date;
- (NSString)eventReason;
- (NSString)outputDeviceUID;
- (NSString)selectionReason;
- (id)description;
- (int64_t)changeType;
- (int64_t)event;
- (int64_t)type;
- (void)setChangeType:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3;
- (void)setEvent:(int64_t)a3;
- (void)setEventReason:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setSelectionReason:(id)a3;
- (void)setSupportsIdleReset:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRDSystemEndpointEntry

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(MRDSystemEndpointEntry *)self outputDeviceUID];
  [(MRDSystemEndpointEntry *)self type];
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
  [(MRDSystemEndpointEntry *)self changeType];
  v6 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
  v7 = [(MRDSystemEndpointEntry *)self date];
  v8 = [(MRDSystemEndpointEntry *)self eventReason];
  v9 = [(MRDSystemEndpointEntry *)self selectionReason];
  id v10 = [v3 initWithFormat:@"%@-%@-%@-%@-%@-%@", v4, active, v6, v7, v8, v9];

  return v10;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (NSString)eventReason
{
  return self->_eventReason;
}

- (void)setEventReason:(id)a3
{
}

- (NSString)selectionReason
{
  return self->_selectionReason;
}

- (void)setSelectionReason:(id)a3
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (BOOL)demoteWhenSyncingToCompanion
{
  return self->_demoteWhenSyncingToCompanion;
}

- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3
{
  self->_demoteWhenSyncingToCompanion = a3;
}

- (BOOL)supportsIdleReset
{
  return self->_supportsIdleReset;
}

- (void)setSupportsIdleReset:(BOOL)a3
{
  self->_supportsIdleReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionReason, 0);
  objc_storeStrong((id *)&self->_eventReason, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
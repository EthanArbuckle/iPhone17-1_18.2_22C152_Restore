@interface SMSessionMonitorState
+ (BOOL)supportsSecureCoding;
+ (id)regionStateToString:(unint64_t)a3;
- (BOOL)dirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)triggerConfirmed;
- (BOOL)triggerPending;
- (NSDate)date;
- (NSUUID)sessionIdentifier;
- (SMSessionMonitorState)initWithCoder:(id)a3;
- (SMSessionMonitorState)initWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)currentRegionState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)markDirty;
- (void)setCurrentRegionState:(unint64_t)a3;
- (void)setDirty:(BOOL)a3;
- (void)setTriggerConfirmed:(BOOL)a3;
- (void)setTriggerPending:(BOOL)a3;
@end

@implementation SMSessionMonitorState

- (SMSessionMonitorState)initWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SMSessionMonitorState;
  v15 = [(SMSessionMonitorState *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionIdentifier, a3);
    v16->_currentRegionState = a4;
    v16->_triggerPending = a5;
    v16->_triggerConfirmed = a6;
    objc_storeStrong((id *)&v16->_date, a7);
    v16->_dirty = 1;
  }

  return v16;
}

- (void)markDirty
{
  v3 = [MEMORY[0x263EFF910] date];
  date = self->_date;
  self->_date = v3;

  self->_dirty = 1;
}

- (void)setCurrentRegionState:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_currentRegionState != a3)
  {
    self->_currentRegionState = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = +[SMSessionMonitorState regionStateToString:self->_currentRegionState];
      int v6 = 136315394;
      v7 = "-[SMSessionMonitorState setCurrentRegionState:]";
      __int16 v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, currentRegionState, %@", (uint8_t *)&v6, 0x16u);
    }
    [(SMSessionMonitorState *)self markDirty];
  }
}

- (void)setTriggerPending:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_triggerPending != a3)
  {
    self->_BOOL triggerPending = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL triggerPending = self->_triggerPending;
      int v6 = 136315394;
      v7 = "-[SMSessionMonitorState setTriggerPending:]";
      __int16 v8 = 1024;
      BOOL v9 = triggerPending;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, triggerPending, %d", (uint8_t *)&v6, 0x12u);
    }

    [(SMSessionMonitorState *)self markDirty];
  }
}

- (void)setTriggerConfirmed:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_triggerConfirmed != a3)
  {
    self->_BOOL triggerConfirmed = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL triggerConfirmed = self->_triggerConfirmed;
      int v6 = 136315394;
      v7 = "-[SMSessionMonitorState setTriggerConfirmed:]";
      __int16 v8 = 1024;
      BOOL v9 = triggerConfirmed;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, triggerConfirmed, %d", (uint8_t *)&v6, 0x12u);
    }

    [(SMSessionMonitorState *)self markDirty];
  }
}

+ (id)regionStateToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_265499000[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionMonitorState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionMonitorStateSessionIdentifierKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"__kSMSessionMonitorStateCurrentRegionStateKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"__kSMSessionMonitorStateTriggerPendingKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"__kSMSessionMonitorStateTriggerConfirmedKey"];
  BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionMonitorStateDateKey"];

  uint64_t v10 = [(SMSessionMonitorState *)self initWithSessionIdentifier:v5 currentRegionState:v6 triggerPending:v7 triggerConfirmed:v8 date:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"__kSMSessionMonitorStateSessionIdentifierKey"];
  [v5 encodeInteger:self->_currentRegionState forKey:@"__kSMSessionMonitorStateCurrentRegionStateKey"];
  [v5 encodeBool:self->_triggerPending forKey:@"__kSMSessionMonitorStateTriggerPendingKey"];
  [v5 encodeBool:self->_triggerConfirmed forKey:@"__kSMSessionMonitorStateTriggerConfirmedKey"];
  [v5 encodeObject:self->_date forKey:@"__kSMSessionMonitorStateDateKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SMSessionMonitorState allocWithZone:a3];
  id v5 = [(SMSessionMonitorState *)self sessionIdentifier];
  unint64_t v6 = [(SMSessionMonitorState *)self currentRegionState];
  BOOL v7 = [(SMSessionMonitorState *)self triggerPending];
  BOOL v8 = [(SMSessionMonitorState *)self triggerConfirmed];
  BOOL v9 = [(SMSessionMonitorState *)self date];
  uint64_t v10 = [(SMSessionMonitorState *)v4 initWithSessionIdentifier:v5 currentRegionState:v6 triggerPending:v7 triggerConfirmed:v8 date:v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SMSessionMonitorState *)self sessionIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SMSessionMonitorState *)self currentRegionState] ^ v4;
  unint64_t v6 = v5 ^ [(SMSessionMonitorState *)self triggerPending];
  uint64_t v7 = [(SMSessionMonitorState *)self triggerConfirmed];
  BOOL v8 = [(SMSessionMonitorState *)self date];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SMSessionMonitorState *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [(SMSessionMonitorState *)self sessionIdentifier];
      uint64_t v7 = [(SMSessionMonitorState *)v5 sessionIdentifier];
      if ((void *)v6 == v7)
      {
        char v11 = 0;
      }
      else
      {
        BOOL v8 = [(SMSessionMonitorState *)self sessionIdentifier];
        unint64_t v9 = [(SMSessionMonitorState *)v5 sessionIdentifier];
        char v10 = [v8 isEqual:v9];

        char v11 = v10 ^ 1;
      }

      unint64_t v13 = [(SMSessionMonitorState *)self currentRegionState];
      uint64_t v14 = [(SMSessionMonitorState *)v5 currentRegionState];
      BOOL v15 = [(SMSessionMonitorState *)self triggerPending];
      LODWORD(v6) = v15 ^ [(SMSessionMonitorState *)v5 triggerPending];
      BOOL v16 = [(SMSessionMonitorState *)self triggerConfirmed];
      int v17 = v16 ^ [(SMSessionMonitorState *)v5 triggerConfirmed];
      objc_super v18 = [(SMSessionMonitorState *)self date];
      v19 = [(SMSessionMonitorState *)v5 date];
      if (v18 == v19)
      {
        char v24 = 1;
      }
      else
      {
        [(SMSessionMonitorState *)self date];
        unint64_t v28 = v13;
        v20 = char v27 = v11;
        [(SMSessionMonitorState *)v5 date];
        char v21 = v17;
        char v22 = v6;
        v23 = uint64_t v6 = v14;
        char v24 = [v20 isEqual:v23];

        uint64_t v14 = v6;
        LOBYTE(v6) = v22;
        LOBYTE(v17) = v21;

        char v11 = v27;
        unint64_t v13 = v28;
      }

      if (v13 == v14) {
        char v25 = v11;
      }
      else {
        char v25 = 1;
      }
      char v12 = v24 & ~(v25 | v6 | v17);
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(SMSessionMonitorState *)self sessionIdentifier];
  unint64_t v5 = [(SMSessionMonitorState *)self date];
  uint64_t v6 = [v5 stringFromDate];
  uint64_t v7 = +[SMSessionMonitorState regionStateToString:[(SMSessionMonitorState *)self currentRegionState]];
  BOOL v8 = [v3 stringWithFormat:@"sessionIdenfier, %@, date, %@, currentRegionState, %@, triggerPending, %d, triggerConfirmed, %d", v4, v6, v7, -[SMSessionMonitorState triggerPending](self, "triggerPending"), -[SMSessionMonitorState triggerConfirmed](self, "triggerConfirmed")];

  return v8;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)currentRegionState
{
  return self->_currentRegionState;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)triggerPending
{
  return self->_triggerPending;
}

- (BOOL)triggerConfirmed
{
  return self->_triggerConfirmed;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
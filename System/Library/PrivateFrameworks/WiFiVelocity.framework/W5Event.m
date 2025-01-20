@interface W5Event
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (NSDictionary)info;
- (W5Event)initWithCoder:(id)a3;
- (W5Peer)peer;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEventID:(int64_t)a3;
- (void)setInfo:(id)a3;
- (void)setPeer:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation W5Event

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5Event;
  [(W5Event *)&v3 dealloc];
}

- (void)setInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    uint64_t v35 = 0;
    if (!a3
      || (uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v35]) == 0)
    {
      OSLog = W5GetOSLog();
      if (!os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v36 = 136315906;
      v37 = "-[W5Event setInfo:]";
      __int16 v38 = 2080;
      v39 = "W5Event.m";
      __int16 v40 = 1024;
      int v41 = 41;
      __int16 v42 = 2114;
      uint64_t v43 = v35;
      goto LABEL_9;
    }
    uint64_t v33 = v6;
    v34 = (void *)MEMORY[0x263F08928];
    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    self->_info = (NSDictionary *)objc_retain((id)objc_msgSend(v34, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v32, "setWithObjects:", v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18,
                                                      v7,
                                                      v8,
                                                      v9,
                                                      v10,
                                                      v11,
                                                      v12,
                                                      v13,
                                                      v14,
                                                      v15,
                                                      objc_opt_class(),
                                                      0),
                                                    v33,
                                                    &v35));
    if (v35)
    {
      v16 = W5GetOSLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315906;
        v37 = "-[W5Event setInfo:]";
        __int16 v38 = 2080;
        v39 = "W5Event.m";
        __int16 v40 = 1024;
        int v41 = 36;
        __int16 v42 = 2114;
        uint64_t v43 = v35;
LABEL_9:
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"[%@] ", W5DescriptionForEventID(self->_eventID)];
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateStyle:0];
  [v4 setTimeStyle:2];
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"));
  uint64_t v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_timestamp];
  if (v5) {
    [v3 appendFormat:@"Timestamp=%@, ", objc_msgSend(v4, "stringFromDate:", v5)];
  }
  if (self->_peer) {
    [v3 appendFormat:@"Peer=%@, ", self->_peer];
  }
  if (self->_info) {
    [v3 appendFormat:@"Info=%@, ", self->_info];
  }
  if ([v3 hasSuffix:@", "]) {
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  }
  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5Event;
  if (-[W5Event conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToEvent:(id)a3
{
  int64_t eventID = self->_eventID;
  if (eventID != [a3 eventID]) {
    goto LABEL_9;
  }
  uint64_t v6 = (void *)[NSNumber numberWithDouble:self->_timestamp];
  uint64_t v7 = NSNumber;
  [a3 timestamp];
  LODWORD(v8) = objc_msgSend(v6, "isEqual:", objc_msgSend(v7, "numberWithDouble:"));
  if (!v8) {
    return v8;
  }
  peer = self->_peer;
  if (peer == (W5Peer *)[a3 peer])
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  if (!self->_peer)
  {
LABEL_9:
    LOBYTE(v8) = 0;
    return v8;
  }
  uint64_t v8 = [a3 peer];
  if (v8)
  {
    uint64_t v10 = self->_peer;
    uint64_t v11 = [a3 peer];
    LOBYTE(v8) = [(W5Peer *)v10 isEqual:v11];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5Event *)self isEqualToEvent:a3];
}

- (unint64_t)hash
{
  int64_t eventID = self->_eventID;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_timestamp), "hash");
  return v4 ^ eventID ^ [(W5Peer *)self->_peer hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5Event allocWithZone:a3] init];
  [(W5Event *)v4 setEventID:self->_eventID];
  [(W5Event *)v4 setTimestamp:self->_timestamp];
  [(W5Event *)v4 setInfo:self->_info];
  [(W5Event *)v4 setPeer:self->_peer];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_eventID forKey:@"_eventID"];
  [a3 encodeDouble:@"_timestamp" forKey:self->_timestamp];
  [a3 encodeObject:self->_info forKey:@"_info"];
  peer = self->_peer;
  [a3 encodeObject:peer forKey:@"_peer"];
}

- (W5Event)initWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)W5Event;
  uint64_t v4 = [(W5Event *)&v30 init];
  if (v4)
  {
    v4->_int64_t eventID = [a3 decodeIntegerForKey:@"_eventID"];
    [a3 decodeDoubleForKey:@"_timestamp"];
    v4->_timestamp = v5;
    uint64_t v29 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v29, "setWithObjects:", v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v16,
                                          v15,
                                          v6,
                                          v7,
                                          v8,
                                          v9,
                                          v10,
                                          v11,
                                          v12,
                                          v13,
                                          objc_opt_class(),
                                          0),
                                        @"_info"),
                                  "copy");
    v4->_peer = (W5Peer *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), @"_peer"), "copy");
  }
  return v4;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (void)setEventID:(int64_t)a3
{
  self->_int64_t eventID = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

@end
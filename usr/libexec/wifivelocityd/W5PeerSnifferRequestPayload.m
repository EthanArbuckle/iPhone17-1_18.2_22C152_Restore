@interface W5PeerSnifferRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (BOOL)noAutoStop;
- (NSArray)channels;
- (NSNumber)version;
- (NSString)description;
- (NSUUID)uuid;
- (W5PeerSnifferRequestPayload)initWithRequest:(id)a3;
- (double)duration;
- (id)encode;
- (int64_t)rotationInterval;
- (int64_t)type;
- (void)setChannels:(id)a3;
- (void)setDuration:(double)a3;
- (void)setNoAutoStop:(BOOL)a3;
- (void)setRotationInterval:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSnifferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerSnifferRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)W5PeerSnifferRequestPayload;
  v5 = [(W5PeerSnifferRequestPayload *)&v47 init];
  if (v5)
  {
    v6 = sub_10009756C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v60 = 136315906;
      v61 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
      __int16 v62 = 2080;
      v63 = "W5PeerSnifferRequestPayload.m";
      __int16 v64 = 1024;
      int v65 = 36;
      __int16 v66 = 2114;
      id v67 = v4;
      _os_log_send_and_compose_impl();
    }

    v7 = (NSNumber *)[v4 objectForKey:@"version"];
    v5->_version = v7;
    if (!v7)
    {
      id v29 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
      v30 = +[NSBundle mainBundle];
      v44 = [v30 localizedStringForKey:@"nil version" value:&stru_1000E06F0 table:0];
      v59 = v44;
      v31 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v16 = [v29 initWithDomain:@"com.apple.wifivelocty.sniffer" code:-1 userInfo:v31];
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v8 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v8 = [v4 objectForKey:@"type"];
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v46 = 0;
    v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v8 error:&v46];
    id v11 = v46;
    v5->_int64_t type = (int64_t)[v10 integerValue];

    int64_t type = v5->_type;
    if (type != 1)
    {
      if (type != 2)
      {
        if (type)
        {
          v13 = 0;
          v14 = 0;
          v15 = 0;
          id v16 = v11;
LABEL_16:
          v25 = [v4 objectForKey:@"noAutoStop"];
          v5->_noAutoStop = [v25 BOOLValue];

          if (!v5->_noAutoStop)
          {
            v27 = 0;
            goto LABEL_20;
          }
          v26 = [v4 objectForKey:@"rorationInterval"];
          if (v26)
          {
            v27 = v26;
            v5->_rotationInterval = (int)[v26 intValue];
            goto LABEL_20;
          }
          id v34 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
          v43 = +[NSBundle mainBundle];
          v44 = [v43 localizedStringForKey:@"nil rotation interval" value:&stru_1000E06F0 table:0];
          v49 = v44;
          v31 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          id v35 = [v34 initWithDomain:@"com.apple.wifivelocty.sniffer" code:-1 userInfo:v31];

          goto LABEL_29;
        }
        id v32 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
        v33 = +[NSBundle mainBundle];
        v44 = [v33 localizedStringForKey:@"nil type" value:&stru_1000E06F0 table:0];
        v57 = v44;
        v31 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v16 = [v32 initWithDomain:@"com.apple.wifivelocty.sniffer" code:-2 userInfo:v31];

        v30 = v33;
        v13 = 0;
        goto LABEL_24;
      }
      v13 = [v4 objectForKey:@"uuid"];
      if (!v13)
      {
        id v41 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
        v42 = +[NSBundle mainBundle];
        v44 = [v42 localizedStringForKey:@"nil UUID" value:&stru_1000E06F0 table:0];
        v51 = v44;
        v31 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id v16 = [v41 initWithDomain:@"com.apple.wifivelocty.sniffer" code:-1 userInfo:v31];

        v30 = v42;
LABEL_24:
        v14 = 0;
        v15 = 0;
        goto LABEL_30;
      }
      v24 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v13];
      v14 = 0;
      v15 = 0;
      uuid = v5->_uuid;
      v5->_uuid = v24;
      id v16 = v11;
LABEL_15:

      goto LABEL_16;
    }
    v15 = [v4 objectForKey:@"channels"];
    uint64_t v17 = objc_opt_class();
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0);
    id v45 = v11;
    uint64_t v19 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v18 fromData:v15 error:&v45];
    id v16 = v45;

    channels = v5->_channels;
    v5->_channels = (NSArray *)v19;

    if (v5->_channels)
    {
      v21 = [v4 objectForKey:@"duration"];
      if (v21)
      {
        v14 = v21;
        v5->_duration = (double)(uint64_t)[v21 longValue];
        v13 = [v4 objectForKey:@"uuid"];
        if (!v13) {
          goto LABEL_16;
        }
        v22 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v13];
        uuid = v5->_uuid;
        v5->_uuid = v22;
        goto LABEL_15;
      }
      id v39 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      v43 = +[NSBundle mainBundle];
      v44 = [v43 localizedStringForKey:@"nil duration" value:&stru_1000E06F0 table:0];
      v53 = v44;
      v31 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      v37 = v39;
      uint64_t v38 = -1;
    }
    else
    {
      id v36 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      v43 = +[NSBundle mainBundle];
      v44 = [v43 localizedStringForKey:@"nil channel" value:&stru_1000E06F0 table:0];
      v55 = v44;
      v31 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v37 = v36;
      uint64_t v38 = -3;
    }
    id v35 = [v37 initWithDomain:@"com.apple.wifivelocty.sniffer" code:v38 userInfo:v31];

    v13 = 0;
    v14 = 0;
LABEL_29:
    id v16 = v35;
    v30 = v43;
    goto LABEL_30;
  }
  v13 = 0;
  id v16 = 0;
  v14 = 0;
  v15 = 0;
  v8 = 0;
LABEL_31:

  v40 = sub_10009756C();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    int v60 = 136315906;
    v61 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
    __int16 v62 = 2080;
    v63 = "W5PeerSnifferRequestPayload.m";
    __int16 v64 = 1024;
    int v65 = 77;
    __int16 v66 = 2114;
    id v67 = v16;
    _os_log_send_and_compose_impl();
  }

  v27 = 0;
  v5 = 0;
LABEL_20:

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerSnifferRequestPayload *)self version];

  if (!v4) {
    goto LABEL_22;
  }
  v5 = [(W5PeerSnifferRequestPayload *)self version];
  [v3 setObject:v5 forKey:@"version"];

  if (![(W5PeerSnifferRequestPayload *)self type])
  {
    id v4 = 0;
LABEL_22:
    v9 = 0;
    id v10 = 0;
    goto LABEL_17;
  }
  id v6 = [objc_alloc((Class)NSNumber) initWithInteger:-[W5PeerSnifferRequestPayload type](self, "type")];
  id v26 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v26];
  id v7 = v26;

  [v3 setObject:v4 forKey:@"type"];
  if ((id)[(W5PeerSnifferRequestPayload *)self type] != (id)1)
  {
    v9 = 0;
    id v10 = v7;
    goto LABEL_8;
  }
  v8 = [(W5PeerSnifferRequestPayload *)self channels];
  id v25 = v7;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v25];
  id v10 = v25;

  if (v9)
  {
    [v3 setObject:v9 forKey:@"channels"];
    [(W5PeerSnifferRequestPayload *)self duration];
    if (v11 == 0.0) {
      goto LABEL_17;
    }
    [(W5PeerSnifferRequestPayload *)self duration];
    v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v12 forKey:@"duration"];

LABEL_8:
    int64_t v13 = [(W5PeerSnifferRequestPayload *)self type];
    v14 = [(W5PeerSnifferRequestPayload *)self uuid];
    v15 = v14;
    if (v13 == 2)
    {

      if (!v15) {
        goto LABEL_17;
      }
    }
    else
    {

      if (!v15) {
        goto LABEL_13;
      }
    }
    id v16 = [(W5PeerSnifferRequestPayload *)self uuid];
    uint64_t v17 = [v16 UUIDString];
    [v3 setObject:v17 forKey:@"uuid"];

LABEL_13:
    if ([(W5PeerSnifferRequestPayload *)self noAutoStop])
    {
      [v3 setObject:&__kCFBooleanTrue forKey:@"noAutoStop"];
      if ([(W5PeerSnifferRequestPayload *)self rotationInterval])
      {
        v18 = +[NSNumber numberWithInteger:[(W5PeerSnifferRequestPayload *)self rotationInterval]];
        [v3 setObject:v18 forKey:@"rorationInterval"];
      }
    }
    else
    {
      [v3 setObject:&__kCFBooleanFalse forKey:@"noAutoStop"];
    }
    goto LABEL_17;
  }
  v20 = sub_10009756C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315906;
    v28 = "-[W5PeerSnifferRequestPayload encode]";
    __int16 v29 = 2080;
    v30 = "W5PeerSnifferRequestPayload.m";
    __int16 v31 = 1024;
    int v32 = 102;
    __int16 v33 = 2114;
    id v34 = v10;
    LODWORD(v24) = 38;
    v23 = &v27;
    _os_log_send_and_compose_impl();
  }

  v9 = 0;
LABEL_17:
  if (!objc_msgSend(v3, "count", v23, v24))
  {
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerSnifferRequestPayload encode]");
    id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v21 userInfo:0];

    objc_exception_throw(v22);
  }

  return v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Type:%ld, UUID:%@, Channels:%@, Duration:%d, NoAutoStop:%d, RotationInterval:%ld", self->_type, self->_uuid, self->_channels, (int)self->_duration, self->_noAutoStop, self->_rotationInterval];
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)noAutoStop
{
  return self->_noAutoStop;
}

- (void)setNoAutoStop:(BOOL)a3
{
  self->_noAutoStop = a3;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(int64_t)a3
{
  self->_rotationInterval = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_channels, 0);
}

@end
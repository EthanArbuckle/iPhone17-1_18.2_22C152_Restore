@interface SAFSEEvent
+ (id)initWithFSEventString:(id)a3;
- (NSString)eventType;
- (int)dev;
- (int)residency;
- (int)urgency;
- (int)useState;
- (unint64_t)inode;
- (unint64_t)originID;
- (unint64_t)purgeableATime;
- (unint64_t)size;
- (unint64_t)version;
- (void)setDev:(int)a3;
- (void)setEventType:(id)a3;
- (void)setInode:(unint64_t)a3;
- (void)setOriginID:(unint64_t)a3;
- (void)setPurgeableATime:(unint64_t)a3;
- (void)setResidency:(int)a3;
- (void)setSize:(unint64_t)a3;
- (void)setUrgency:(int)a3;
- (void)setUseState:(int)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation SAFSEEvent

+ (id)initWithFSEventString:(id)a3
{
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"/"];
  v5 = v4;
  if (!v4 || (unint64_t)[v4 count] <= 8)
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031FD8();
    }
LABEL_5:

    v6 = 0;
    goto LABEL_6;
  }
  v6 = objc_opt_new();
  v8 = [v5 objectAtIndexedSubscript:0];
  [v6 setEventType:v8];

  v9 = [v5 objectAtIndexedSubscript:1];
  -[NSObject setVersion:](v6, "setVersion:", [v9 longLongValue]);

  v10 = [v5 objectAtIndexedSubscript:2];
  -[NSObject setDev:](v6, "setDev:", [v10 longLongValue]);

  v11 = [v5 objectAtIndexedSubscript:3];
  -[NSObject setInode:](v6, "setInode:", [v11 longLongValue]);

  v12 = [v5 objectAtIndexedSubscript:4];
  -[NSObject setOriginID:](v6, "setOriginID:", [v12 longLongValue]);

  v13 = [v5 objectAtIndexedSubscript:5];
  -[NSObject setPurgeableATime:](v6, "setPurgeableATime:", [v13 longLongValue]);

  v14 = [v5 objectAtIndexedSubscript:6];
  unsigned int v15 = [v14 longLongValue];

  v16 = [v5 objectAtIndexedSubscript:7];
  id v17 = [v16 longLongValue];

  v18 = [v5 objectAtIndexedSubscript:8];
  -[NSObject setSize:](v6, "setSize:", [v18 longLongValue]);

  [v6 setUseState:(unsigned __int16)v15];
  [v6 setResidency:HIWORD(v15)];
  unint64_t v19 = __ROR8__(v17, 9);
  if (v19 < 5 && ((0x17u >> v19) & 1) != 0)
  {
    uint64_t v20 = dword_10003C2C0[v19];
  }
  else if (v17 == (id)0x8000)
  {
    uint64_t v20 = 4;
  }
  else
  {
    uint64_t v20 = 0xFFFFFFFFLL;
  }
  [v6 setUrgency:v20];
  if ([v6 urgency] >= 5)
  {
    v21 = SALog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000320BC(v6);
    }

    v6 = 0;
  }
  if ([v6 useState] >= 7)
  {
    v22 = SALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100032040(v6);
    }

    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (NSString)eventType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEventType:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int)dev
{
  return self->_dev;
}

- (void)setDev:(int)a3
{
  self->_dev = a3;
}

- (unint64_t)inode
{
  return self->_inode;
}

- (void)setInode:(unint64_t)a3
{
  self->_inode = a3;
}

- (int)useState
{
  return self->_useState;
}

- (void)setUseState:(int)a3
{
  self->_useState = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)purgeableATime
{
  return self->_purgeableATime;
}

- (void)setPurgeableATime:(unint64_t)a3
{
  self->_purgeableATime = a3;
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

- (int)residency
{
  return self->_residency;
}

- (void)setResidency:(int)a3
{
  self->_residency = a3;
}

- (unint64_t)originID
{
  return self->_originID;
}

- (void)setOriginID:(unint64_t)a3
{
  self->_originID = a3;
}

- (void).cxx_destruct
{
}

@end
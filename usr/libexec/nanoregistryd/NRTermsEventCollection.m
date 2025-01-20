@interface NRTermsEventCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)_termsEvent:(id)a3 isNewerVersionOfTermsEvent:(id)a4;
- (BOOL)dirty;
- (BOOL)termsTextCleared;
- (NRTermsEventCollection)init;
- (NRTermsEventCollection)initWithCoder:(id)a3;
- (NSMutableArray)events;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (id)reverseObjectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_removeDuplicatesOfTermsEvent:(id)a3;
- (void)addObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setEvents:(id)a3;
- (void)setTermsTextCleared:(BOOL)a3;
@end

@implementation NRTermsEventCollection

- (id)description
{
  id v3 = [@"NRTermsEventCollection {\n" mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_events;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v3 appendString:@"\t" v12];
        v10 = [v9 description];
        [v3 appendString:v10];

        [v3 appendString:@"\n"];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"}\n"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRTermsEventCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)NRTermsEventCollection;
  v2 = [(NRTermsEventCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;
  }
  return v2;
}

- (NRTermsEventCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NRTermsEventCollection *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSMutableArray *)v8;

    v5->_termsTextCleared = [v4 decodeBoolForKey:@"termsTextCleared"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  events = self->_events;
  id v5 = a3;
  [v5 encodeObject:events forKey:@"events"];
  [v5 encodeBool:self->_termsTextCleared forKey:@"termsTextCleared"];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding NRTermsEvent", v12, 2u);
    }
  }
  uint64_t v8 = [v4 termsDigest];

  if (!v8)
  {
    v9 = objc_opt_class();
    v10 = [v4 termsText];
    v11 = [v9 digestFromData:v10];
    [v4 setTermsDigest:v11];
  }
  [v4 saveEventTextToFileIfNeeded];
  [(NRTermsEventCollection *)self _removeDuplicatesOfTermsEvent:v4];
  [(NSMutableArray *)self->_events addObject:v4];
  self->_dirty = 1;
}

- (void)_removeDuplicatesOfTermsEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableIndexSet indexSet];
  BOOL v6 = [(NRTermsEventCollection *)self events];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A3060;
  v10[3] = &unk_100168778;
  v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v10];

  v9 = [(NRTermsEventCollection *)self events];
  [v9 removeObjectsAtIndexes:v7];
}

- (BOOL)_termsEvent:(id)a3 isNewerVersionOfTermsEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 displayDeviceName];
  id v8 = [v5 displayDeviceName];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (!v9) {
    goto LABEL_16;
  }
  v10 = [v6 displayDeviceSerialNumber];
  id v11 = [v5 displayDeviceSerialNumber];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (!v12) {
    goto LABEL_16;
  }
  long long v13 = [v6 acknowledgedDeviceName];
  long long v14 = [v5 acknowledgedDeviceName];
  unsigned int v15 = [v13 isEqualToString:v14];

  if (!v15) {
    goto LABEL_16;
  }
  v16 = [v6 acknowledgedDeviceSerialNumber];
  v17 = [v5 acknowledgedDeviceSerialNumber];
  unsigned int v18 = [v16 isEqualToString:v17];

  if (!v18) {
    goto LABEL_16;
  }
  v19 = [v6 documentationID];
  v20 = [v5 documentationID];
  unsigned int v21 = [v19 isEqualToString:v20];

  if (!v21) {
    goto LABEL_16;
  }
  v22 = [v6 loggingProcessName];
  v23 = [v5 loggingProcessName];
  unsigned int v24 = [v22 isEqualToString:v23];

  if (!v24) {
    goto LABEL_16;
  }
  unsigned int v25 = [v6 eventType];
  if (v25 != [v5 eventType]) {
    goto LABEL_16;
  }
  unsigned int v26 = [v6 presentationLocation];
  if (v26 != [v5 presentationLocation]) {
    goto LABEL_16;
  }
  v27 = [v6 presentationReason];
  if (v27)
  {

    goto LABEL_12;
  }
  v28 = [v5 presentationReason];

  if (v28)
  {
LABEL_12:
    v29 = [v6 presentationReason];
    v30 = [v5 presentationReason];
    unsigned int v31 = [v29 isEqualToString:v30];

    if (v31) {
      goto LABEL_13;
    }
LABEL_16:
    unsigned __int8 v38 = 0;
    goto LABEL_17;
  }
LABEL_13:
  v32 = [v6 termsDigest];

  if (!v32)
  {
    v33 = objc_opt_class();
    v34 = [v6 termsText];
    v35 = [v33 digestFromData:v34];
    [v6 setTermsDigest:v35];
  }
  v36 = [v6 termsDigest];
  v37 = [v5 termsDigest];
  unsigned __int8 v38 = [v36 isEqualToString:v37];

LABEL_17:
  return v38;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_events objectAtIndex:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_events countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_events count];
}

- (id)reverseObjectEnumerator
{
  return [(NSMutableArray *)self->_events reverseObjectEnumerator];
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)termsTextCleared
{
  return self->_termsTextCleared;
}

- (void)setTermsTextCleared:(BOOL)a3
{
  self->_termsTextCleared = a3;
}

- (void).cxx_destruct
{
}

@end
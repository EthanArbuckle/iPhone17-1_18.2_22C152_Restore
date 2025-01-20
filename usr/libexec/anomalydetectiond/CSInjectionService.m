@interface CSInjectionService
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CSInjectionService)init;
- (NSMutableDictionary)classInjectionMap;
- (id)syncgetClassForName:(id)a3;
- (int)mapMissBehavior;
- (void)amendClassReplacementMap:(id)a3 missBehavior:(int)a4;
- (void)beginService;
- (void)setClassReplacementMap:(id)a3 missBehavior:(int)a4;
- (void)setMapMissBehavior:(int)a3;
@end

@implementation CSInjectionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v5 = a4 + 1;
  if (v5 < (unint64_t)[v6 count]) {
    [objc_msgSend(v6, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:v6 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1003DD618 != -1) {
    dispatch_once(&qword_1003DD618, &stru_1003992F8);
  }
  v2 = (void *)qword_1003DD610;

  return v2;
}

- (CSInjectionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSInjectionService;
  result = [(CSInjectionService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CSInjectionServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CSInjectionServiceClientProtocol];
  if (result) {
    result->_mapMissBehavior = 0;
  }
  return result;
}

- (void)beginService
{
  self->_classInjectionMap = (NSMutableDictionary *)objc_opt_new();

  _objc_release_x1();
}

- (void)amendClassReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = [(CSInjectionService *)self classInjectionMap];
  [v6 addEntriesFromDictionary:v7];

  [(CSInjectionService *)self setMapMissBehavior:v4];
}

- (void)setClassReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [(CSInjectionService *)self classInjectionMap];
  [v6 removeAllObjects];

  id v7 = [(CSInjectionService *)self classInjectionMap];
  [v7 addEntriesFromDictionary:v8];

  [(CSInjectionService *)self setMapMissBehavior:v4];
}

- (id)syncgetClassForName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  unint64_t v5 = [(CSInjectionService *)self classInjectionMap];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = NSClassFromString(v6);
LABEL_7:
    v9 = (void *)v7;
    goto LABEL_8;
  }
  unsigned int v8 = [(CSInjectionService *)self mapMissBehavior];
  if (!v8)
  {
    uint64_t v7 = NSClassFromString(v4);
    goto LABEL_7;
  }
  if (v8 != 2)
  {
    v9 = 0;
LABEL_8:

    return v9;
  }
  v11 = sub_1000088CC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289795;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2114;
    v19 = v4;
    __int16 v20 = 2082;
    v21 = "assert";
    __int16 v22 = 2081;
    v23 = "realClass";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  v12 = sub_1000088CC();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 68289795;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2114;
    v19 = v4;
    __int16 v20 = 2082;
    v21 = "assert";
    __int16 v22 = 2081;
    v23 = "realClass";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to find classForName", "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  v13 = sub_1000088CC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289795;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2114;
    v19 = v4;
    __int16 v20 = 2082;
    v21 = "assert";
    __int16 v22 = 2081;
    v23 = "realClass";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  id result = (id)abort_report_np();
  __break(1u);
  return result;
}

- (NSMutableDictionary)classInjectionMap
{
  return self->_classInjectionMap;
}

- (int)mapMissBehavior
{
  return self->_mapMissBehavior;
}

- (void)setMapMissBehavior:(int)a3
{
  self->_mapMissBehavior = a3;
}

- (void).cxx_destruct
{
}

@end
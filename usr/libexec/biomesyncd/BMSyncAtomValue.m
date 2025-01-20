@interface BMSyncAtomValue
+ (BOOL)supportsSecureCoding;
+ (id)atomValueFromData:(id)a3 version:(int64_t)a4;
- (BMStoreEventAtomValue)value;
- (BMSyncAtomValue)initWithAtomType:(unint64_t)a3 value:(id)a4 version:(int64_t)a5;
- (BMSyncAtomValue)initWithCoder:(id)a3;
- (BMSyncAtomValue)initWithProto:(id)a3;
- (BMSyncAtomValue)initWithProtoData:(id)a3;
- (id)encodeAsProto;
- (id)proto;
- (id)serialize;
- (id)serializeProto;
- (int64_t)version;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMSyncAtomValue

- (BMSyncAtomValue)initWithAtomType:(unint64_t)a3 value:(id)a4 version:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSyncAtomValue;
  v10 = [(BMSyncAtomValue *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_value, a4);
    v11->_version = a5;
  }

  return v11;
}

- (id)serializeProto
{
  return [(BMSyncAtomValue *)self encodeAsProto];
}

- (id)encodeAsProto
{
  v2 = [(BMSyncAtomValue *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSyncAtomValue)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (sub_100018D08((uint64_t)v5) && sub_100018E5C((BOOL)v5))
      {
        v6 = [BMStoreEventAtomValue alloc];
        v7 = sub_10001962C((uint64_t)v5);
        v8 = [(BMStoreEventAtomValue *)v6 initWithProto:v7];

        self = [(BMSyncAtomValue *)self initWithAtomType:(int)sub_100018C94((uint64_t)v5) value:v8 version:1];
        id v9 = self;
LABEL_13:

        goto LABEL_14;
      }
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1000460E4();
      }
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10004616C();
      }
    }
    id v9 = 0;
    goto LABEL_13;
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

- (BMSyncAtomValue)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBSyncAtomValue alloc] initWithData:v4];

    self = [(BMSyncAtomValue *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  sub_100018CC0((uint64_t)v3, (int)[(BMSyncAtomValue *)self type]);
  id v4 = [(BMSyncAtomValue *)self value];
  v5 = [v4 proto];

  sub_1000193BC((uint64_t)v3, v5);

  return v3;
}

+ (id)atomValueFromData:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = [objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else if (a4)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000461F4();
    }

    id v7 = 0;
  }
  else
  {
    id v14 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:a1 fromData:v6 error:&v14];
    id v8 = v14;
    if (v8)
    {
      id v9 = __biome_log_for_category();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 16;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100025FB0;
      v13[3] = &unk_10006CAC0;
      v13[4] = &buf;
      if (qword_100080328 != -1) {
        dispatch_once(&qword_100080328, v13);
      }
      os_log_type_t v10 = *(unsigned char *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v9, v10))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "failed to deserialize BMSyncAtomValue with error %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }

  return v7;
}

- (id)serialize
{
  int64_t version = self->_version;
  if (version == 1)
  {
    id v4 = [(BMSyncAtomValue *)self serializeProto];
  }
  else if (version)
  {
    id v8 = __biome_log_for_category();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026298;
    block[3] = &unk_10006CAC0;
    block[4] = &buf;
    if (qword_100080338 != -1) {
      dispatch_once(&qword_100080338, block);
    }
    os_log_type_t v9 = *(unsigned char *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      int64_t v10 = self->_version;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "cannot serialize atom value with version %lu", (uint8_t *)&buf, 0xCu);
    }

    id v4 = 0;
  }
  else
  {
    id v14 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v14];
    id v5 = v14;
    if (v5)
    {
      id v6 = __biome_log_for_category();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 16;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100026284;
      v13[3] = &unk_10006CAC0;
      v13[4] = &buf;
      if (qword_100080330 != -1) {
        dispatch_once(&qword_100080330, v13);
      }
      os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v6, v7))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "failed to serialize BMSyncAtomValue with error %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v6 = a3;
  id v5 = +[NSNumber numberWithUnsignedInteger:type];
  [v6 encodeObject:v5 forKey:@"atomType"];

  [v6 encodeObject:self->_value forKey:@"atomValue"];
}

- (BMSyncAtomValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atomType"];
  id v6 = [v5 unsignedIntegerValue];

  os_log_type_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atomValue"];

  id v8 = [(BMSyncAtomValue *)self initWithAtomType:v6 value:v7 version:0];
  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (BMStoreEventAtomValue)value
{
  return self->_value;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end
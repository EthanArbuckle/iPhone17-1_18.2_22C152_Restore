@interface LogHead
+ (id)descriptor;
- (id)diagnosticsJsonDictionary;
@end

@implementation LogHead

+ (id)descriptor
{
  id v2 = (id)qword_10015B210;
  if (!qword_10015B210)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:LogHead messageName:@"LogHead" fileDescription:&unk_1001560A0 fields:&off_100156198 fieldCount:8 storageSize:64 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A1F0];
    qword_10015B210 = (uint64_t)v2;
  }
  return v2;
}

- (id)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:[(LogHead *)self logBeginningMs]];
  [v3 setObject:v4 forKeyedSubscript:@"logBeginningMs"];

  v5 = +[NSDate dateWithTimeIntervalSince1970:(double)((unint64_t)[(LogHead *)self logBeginningMs] / 0x3E8)];
  v6 = [v5 kt_toISO_8601_UTCString];
  [v3 setObject:v6 forKeyedSubscript:@"logBeginningDateReadable"];

  v7 = +[NSNumber numberWithUnsignedLongLong:[(LogHead *)self logSize]];
  [v3 setObject:v7 forKeyedSubscript:@"logSize"];

  v8 = [(LogHead *)self logHeadHash];
  v9 = [v8 kt_hexString];
  [v3 setObject:v9 forKeyedSubscript:@"logHeadHash"];

  v10 = +[NSNumber numberWithUnsignedLongLong:[(LogHead *)self revision]];
  [v3 setObject:v10 forKeyedSubscript:@"revision"];

  v11 = LogType_EnumDescriptor();
  v12 = [v11 textFormatNameForValue:-[LogHead logType](self, "logType")];
  [v3 setObject:v12 forKeyedSubscript:@"logType"];

  v13 = +[NSNumber numberWithUnsignedLongLong:[(LogHead *)self treeId]];
  [v3 setObject:v13 forKeyedSubscript:@"treeId"];

  v14 = +[NSNumber numberWithUnsignedLongLong:[(LogHead *)self timestampMs]];
  [v3 setObject:v14 forKeyedSubscript:@"timestampMs"];

  v15 = +[NSDate dateWithTimeIntervalSince1970:(double)((unint64_t)[(LogHead *)self timestampMs] / 0x3E8)];
  v16 = [v15 kt_toISO_8601_UTCString];
  [v3 setObject:v16 forKeyedSubscript:@"timestampReadable"];

  if (Application_IsValidValue([(LogHead *)self application]))
  {
    v17 = Application_EnumDescriptor();
    v18 = [v17 textFormatNameForValue:-[LogHead application](self, "application")];
    [v3 setObject:v18 forKeyedSubscript:@"application"];
  }

  return v3;
}

@end
@interface SRDeletionRecord
+ (BOOL)supportsSecureCoding;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5 originatingDeviceIdentifier:(id)a6;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5;
+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5 originatingDeviceIdentifier:(id)a6;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)_originatingDeviceIdentifier;
- (NSString)description;
- (SRAbsoluteTime)endTime;
- (SRAbsoluteTime)startTime;
- (SRDeletionReason)reason;
- (SRDeletionRecord)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRDeletionRecord)initWithCoder:(id)a3;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (int64_t)extendedReason;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setExtendedReason:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)set_originatingDeviceIdentifier:(id)a3;
@end

@implementation SRDeletionRecord

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBA8 = (uint64_t)os_log_create("com.apple.SensorKit", "DeletionRecord");
  }
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5
{
  return [a1 tombstoneWithStartTime:a5 endTime:0 reason:a3 originatingDeviceIdentifier:a4];
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 reason:(int64_t)a5 originatingDeviceIdentifier:(id)a6
{
  v10 = objc_alloc_init(SRDeletionRecord);
  [(SRDeletionRecord *)v10 setStartTime:a3];
  [(SRDeletionRecord *)v10 setEndTime:a4];
  [(SRDeletionRecord *)v10 setReason:a5];
  [(SRDeletionRecord *)v10 set_originatingDeviceIdentifier:a6];

  return v10;
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5
{
  return [a1 tombstoneWithStartTime:a5 endTime:0 extendedReason:a3 originatingDeviceIdentifier:a4];
}

+ (id)tombstoneWithStartTime:(double)a3 endTime:(double)a4 extendedReason:(int64_t)a5 originatingDeviceIdentifier:(id)a6
{
  id v7 = +[SRDeletionRecord tombstoneWithStartTime:4 endTime:a6 reason:a3 originatingDeviceIdentifier:a4];
  [v7 setExtendedReason:a5];
  return v7;
}

- (void)dealloc
{
  [(SRDeletionRecord *)self set_originatingDeviceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDeletionRecord;
  [(SRDeletionRecord *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(SRDeletionRecord *)self startTime];
  double v6 = v5;
  [a3 startTime];
  if (v6 != v7) {
    return 0;
  }
  [(SRDeletionRecord *)self endTime];
  double v9 = v8;
  [a3 endTime];
  if (v9 != v10) {
    return 0;
  }
  id v11 = [(SRDeletionRecord *)self reason];
  if (v11 != [a3 reason]) {
    return 0;
  }
  id v12 = [(SRDeletionRecord *)self extendedReason];
  return v12 == [a3 extendedReason];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRDeletionRecord)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SRDeletionRecord;
  v4 = [(SRDeletionRecord *)&v8 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"SRDeletionRecordStartKey"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"SRDeletionRecordEndKey"];
    v4->_endTime = v6;
    -[SRDeletionRecord setReason:](v4, "setReason:", [a3 decodeIntegerForKey:@"SRDeletionRecordReasonKey"]);
    -[SRDeletionRecord setExtendedReason:](v4, "setExtendedReason:", [a3 decodeIntegerForKey:@"SRDeletionRecordExtendedReasonKey"]);
    -[SRDeletionRecord set_originatingDeviceIdentifier:](v4, "set_originatingDeviceIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SRDeletionRecordOriginatingDeviceIdKey"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"SRDeletionRecordStartKey" forKey:self->_startTime];
  [a3 encodeDouble:@"SRDeletionRecordEndKey" forKey:self->_endTime];
  [a3 encodeInteger:-[SRDeletionRecord reason](self, "reason") forKey:@"SRDeletionRecordReasonKey"];
  [a3 encodeInteger:-[SRDeletionRecord extendedReason](self, "extendedReason") forKey:@"SRDeletionRecordExtendedReasonKey"];
  double v5 = [(SRDeletionRecord *)self _originatingDeviceIdentifier];

  [a3 encodeObject:v5 forKey:@"SRDeletionRecordOriginatingDeviceIdKey"];
}

- (SRDeletionRecord)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  v13.receiver = self;
  v13.super_class = (Class)SRDeletionRecord;
  result = [(SRDeletionRecord *)&v13 init];
  if (result)
  {
    double v7 = result;
    uint64_t v12 = 0;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v12];
    uint64_t v9 = v12;
    if (v12)
    {
      double v10 = qword_10006EBA8;
      if (os_log_type_enabled((os_log_t)qword_10006EBA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to unarchive data because %{public}@", buf, 0xCu);
      }

      return 0;
    }
    else
    {
      id v11 = v8;

      return (SRDeletionRecord *)v11;
    }
  }
  return result;
}

- (id)binarySampleRepresentation
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)sr_dictionaryRepresentation
{
  v4[0] = @"SRDeletionRecordStartKey";
  [(SRDeletionRecord *)self startTime];
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[1] = @"SRDeletionRecordEndKey";
  [(SRDeletionRecord *)self endTime];
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[2] = @"SRDeletionRecordReasonKey";
  v5[2] = +[NSNumber numberWithInteger:[(SRDeletionRecord *)self reason]];
  v4[3] = @"SRDeletionRecordExtendedReasonKey";
  v5[3] = +[NSNumber numberWithInteger:[(SRDeletionRecord *)self extendedReason]];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@ %@", NSStringFromClass(v3), [(SRDeletionRecord *)self sr_dictionaryRepresentation]];
}

- (SRDeletionReason)reason
{
  SRDeletionReason result = atomic_load((unint64_t *)&self->_reason);
  if (result != SRDeletionReasonSystemInitiated) {
    return result;
  }
  if (qword_10006EBB8 != -1)
  {
    dispatch_once(&qword_10006EBB8, &stru_10005D1B8);
    if (byte_10006EBB0) {
      goto LABEL_4;
    }
    return 4;
  }
  if (!byte_10006EBB0) {
    return 4;
  }
LABEL_4:

  return [(SRDeletionRecord *)self extendedReason];
}

- (void)setReason:(int64_t)a3
{
}

- (SRAbsoluteTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (SRAbsoluteTime)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (int64_t)extendedReason
{
  return self->_extendedReason;
}

- (void)setExtendedReason:(int64_t)a3
{
  self->_extendedReason = a3;
}

- (NSString)_originatingDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_originatingDeviceIdentifier:(id)a3
{
}

@end
@interface MBDeviceTransferProgress
+ (BOOL)supportsSecureCoding;
- (MBDeviceTransferProgress)init;
- (MBDeviceTransferProgress)initWithCoder:(id)a3;
- (NSDate)fileTransferStartDate;
- (NSDate)restoreStartDate;
- (NSString)phaseDescription;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)minutesRemaining;
- (unint64_t)bytesTransferred;
- (unint64_t)filesTransferred;
- (unint64_t)phase;
- (unint64_t)totalByteCount;
- (unint64_t)totalFileCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBytesTransferred:(unint64_t)a3;
- (void)setFileTransferStartDate:(id)a3;
- (void)setFilesTransferred:(unint64_t)a3;
- (void)setMinutesRemaining:(int64_t)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPhaseDescription:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRestoreStartDate:(id)a3;
- (void)setTotalByteCount:(unint64_t)a3;
- (void)setTotalFileCount:(unint64_t)a3;
@end

@implementation MBDeviceTransferProgress

- (MBDeviceTransferProgress)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBDeviceTransferProgress;
  v2 = [(MBDeviceTransferProgress *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MBDeviceTransferProgress *)v2 setProgress:0.0];
    [(MBDeviceTransferProgress *)v3 setMinutesRemaining:-1];
    [(MBDeviceTransferProgress *)v3 setFilesTransferred:0];
    [(MBDeviceTransferProgress *)v3 setBytesTransferred:0];
    [(MBDeviceTransferProgress *)v3 setTotalByteCount:0];
    [(MBDeviceTransferProgress *)v3 setTotalFileCount:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferProgress;
  objc_super v5 = [(MBDeviceTransferProgress *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phaseDescription"];
    [(MBDeviceTransferProgress *)v5 setPhaseDescription:v6];

    -[MBDeviceTransferProgress setPhase:](v5, "setPhase:", [v4 decodeIntegerForKey:@"phase"]);
    [v4 decodeDoubleForKey:@"progress"];
    -[MBDeviceTransferProgress setProgress:](v5, "setProgress:");
    -[MBDeviceTransferProgress setMinutesRemaining:](v5, "setMinutesRemaining:", [v4 decodeIntegerForKey:@"minutesRemaining"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileTransferStartDate"];
    [(MBDeviceTransferProgress *)v5 setFileTransferStartDate:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restoreStartDate"];
    [(MBDeviceTransferProgress *)v5 setRestoreStartDate:v8];

    -[MBDeviceTransferProgress setFilesTransferred:](v5, "setFilesTransferred:", [v4 decodeInt64ForKey:@"filesTransferred"]);
    -[MBDeviceTransferProgress setBytesTransferred:](v5, "setBytesTransferred:", [v4 decodeInt64ForKey:@"bytesTransferred"]);
    -[MBDeviceTransferProgress setTotalByteCount:](v5, "setTotalByteCount:", [v4 decodeInt64ForKey:@"totalByteCount"]);
    -[MBDeviceTransferProgress setTotalFileCount:](v5, "setTotalFileCount:", [v4 decodeInt64ForKey:@"totalFileCount"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MBDeviceTransferProgress *)self phaseDescription];
  [v7 encodeObject:v4 forKey:@"phaseDescription"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[MBDeviceTransferProgress phase](self, "phase"), @"phase");
  [(MBDeviceTransferProgress *)self progress];
  objc_msgSend(v7, "encodeDouble:forKey:", @"progress");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MBDeviceTransferProgress minutesRemaining](self, "minutesRemaining"), @"minutesRemaining");
  objc_super v5 = [(MBDeviceTransferProgress *)self fileTransferStartDate];
  [v7 encodeObject:v5 forKey:@"fileTransferStartDate"];

  v6 = [(MBDeviceTransferProgress *)self restoreStartDate];
  [v7 encodeObject:v6 forKey:@"restoreStartDate"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress filesTransferred](self, "filesTransferred"), @"filesTransferred");
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress bytesTransferred](self, "bytesTransferred"), @"bytesTransferred");
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress totalByteCount](self, "totalByteCount"), @"totalByteCount");
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress totalFileCount](self, "totalFileCount"), @"totalFileCount");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = [(MBDeviceTransferProgress *)self phaseDescription];
  v6 = (void *)[v5 copy];
  [v4 setPhaseDescription:v6];

  objc_msgSend(v4, "setPhase:", -[MBDeviceTransferProgress phase](self, "phase"));
  [(MBDeviceTransferProgress *)self progress];
  objc_msgSend(v4, "setProgress:");
  objc_msgSend(v4, "setMinutesRemaining:", -[MBDeviceTransferProgress minutesRemaining](self, "minutesRemaining"));
  id v7 = [(MBDeviceTransferProgress *)self fileTransferStartDate];
  [v4 setFileTransferStartDate:v7];

  v8 = [(MBDeviceTransferProgress *)self restoreStartDate];
  [v4 setRestoreStartDate:v8];

  objc_msgSend(v4, "setFilesTransferred:", -[MBDeviceTransferProgress filesTransferred](self, "filesTransferred"));
  objc_msgSend(v4, "setBytesTransferred:", -[MBDeviceTransferProgress bytesTransferred](self, "bytesTransferred"));
  objc_msgSend(v4, "setTotalByteCount:", -[MBDeviceTransferProgress totalByteCount](self, "totalByteCount"));
  objc_msgSend(v4, "setTotalFileCount:", -[MBDeviceTransferProgress totalFileCount](self, "totalFileCount"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  [(MBDeviceTransferProgress *)self progress];
  uint64_t v7 = v6;
  int64_t v8 = [(MBDeviceTransferProgress *)self minutesRemaining];
  unint64_t v9 = [(MBDeviceTransferProgress *)self filesTransferred];
  unint64_t v10 = [(MBDeviceTransferProgress *)self bytesTransferred];
  unint64_t v11 = [(MBDeviceTransferProgress *)self totalByteCount];
  unint64_t v12 = [(MBDeviceTransferProgress *)self totalFileCount];
  v13 = [(MBDeviceTransferProgress *)self phaseDescription];
  objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; progress=%.2f, minutesRemaining=%ld, filesTransferred=%llu, bytesTransferred=%llu, totalByteCount=%llu, totalFileCount=%llu, phase=\"%@\">",
    Name,
    self,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
  v14 = v13);

  return v14;
}

- (NSString)phaseDescription
{
  return self->_phaseDescription;
}

- (void)setPhaseDescription:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (int64_t)minutesRemaining
{
  return self->_minutesRemaining;
}

- (void)setMinutesRemaining:(int64_t)a3
{
  self->_minutesRemaining = a3;
}

- (NSDate)fileTransferStartDate
{
  return self->_fileTransferStartDate;
}

- (void)setFileTransferStartDate:(id)a3
{
}

- (NSDate)restoreStartDate
{
  return self->_restoreStartDate;
}

- (void)setRestoreStartDate:(id)a3
{
}

- (unint64_t)filesTransferred
{
  return self->_filesTransferred;
}

- (void)setFilesTransferred:(unint64_t)a3
{
  self->_filesTransferred = a3;
}

- (unint64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(unint64_t)a3
{
  self->_bytesTransferred = a3;
}

- (unint64_t)totalByteCount
{
  return self->_totalByteCount;
}

- (void)setTotalByteCount:(unint64_t)a3
{
  self->_totalByteCount = a3;
}

- (unint64_t)totalFileCount
{
  return self->_totalFileCount;
}

- (void)setTotalFileCount:(unint64_t)a3
{
  self->_totalFileCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreStartDate, 0);
  objc_storeStrong((id *)&self->_fileTransferStartDate, 0);
  objc_storeStrong((id *)&self->_phaseDescription, 0);
}

@end
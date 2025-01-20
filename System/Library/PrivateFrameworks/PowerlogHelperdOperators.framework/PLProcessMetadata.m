@interface PLProcessMetadata
- (NSDate)lastActiveStart;
- (NSDate)lastSuspendStart;
- (NSNumber)applicationState;
- (NSString)bundleId;
- (NSString)name;
- (PLCoalitionSample)coalitionSample;
- (PLProcessMetadata)initWithPid:(int)a3;
- (id)description;
- (int)pid;
- (unint64_t)coalitionID;
- (void)setApplicationState:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCoalitionID:(unint64_t)a3;
- (void)setCoalitionSample:(id)a3;
- (void)setLastActiveStart:(id)a3;
- (void)setLastSuspendStart:(id)a3;
- (void)setName:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation PLProcessMetadata

- (PLProcessMetadata)initWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PLProcessMetadata;
  v4 = [(PLProcessMetadata *)&v11 init];
  v5 = v4;
  if (v4)
  {
    [(PLProcessMetadata *)v4 setPid:v3];
    v6 = +[PLUtilities bundleIDFromPid:v3];
    [(PLProcessMetadata *)v5 setBundleId:v6];

    v7 = +[PLUtilities fullProcessNameForPid:v3];
    [(PLProcessMetadata *)v5 setName:v7];

    [(PLProcessMetadata *)v5 setCoalitionID:+[PLUtilities coalitionIDForPid:v3]];
    v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    [(PLProcessMetadata *)v5 setLastActiveStart:v8];

    v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(PLProcessMetadata *)v5 setLastSuspendStart:v9];

    [(PLProcessMetadata *)v5 setApplicationState:0];
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(PLProcessMetadata *)self name];
  uint64_t v5 = [(PLProcessMetadata *)self pid];
  v6 = [(PLProcessMetadata *)self bundleId];
  v7 = [v3 stringWithFormat:@"%@ (%d) bundle=%@ cid=<%llu>", v4, v5, v6, -[PLProcessMetadata coalitionID](self, "coalitionID")];

  return v7;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleId:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (void)setCoalitionID:(unint64_t)a3
{
  self->_coalitionID = a3;
}

- (NSDate)lastActiveStart
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastActiveStart:(id)a3
{
}

- (NSDate)lastSuspendStart
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastSuspendStart:(id)a3
{
}

- (PLCoalitionSample)coalitionSample
{
  return (PLCoalitionSample *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalitionSample:(id)a3
{
}

- (NSNumber)applicationState
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_coalitionSample, 0);
  objc_storeStrong((id *)&self->_lastSuspendStart, 0);
  objc_storeStrong((id *)&self->_lastActiveStart, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
@interface RTStateModelOneVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)isComplete;
- (NSUUID)identifier;
- (RTStateModelEntryExit)EntryExit_s;
- (RTStateModelLocation)location;
- (RTStateModelOneVisit)init;
- (RTStateModelOneVisit)initWithCoder:(id)a3;
- (RTStateModelOneVisit)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5 entryTimestamp:(double)a6 exitTimestamp:(double)a7 numOfDataPts:(int64_t)a8;
- (RTStateModelOneVisit)initWithLocation:(id)a3 entryExit:(id)a4 andNumOfDataPts:(int64_t)a5;
- (id)description;
- (int64_t)numOfDataPts;
- (void)encodeWithCoder:(id)a3;
- (void)setEntryExit_s:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNumOfDataPts:(int64_t)a3;
@end

@implementation RTStateModelOneVisit

- (RTStateModelOneVisit)init
{
  v8.receiver = self;
  v8.super_class = (Class)RTStateModelOneVisit;
  v2 = [(RTStateModelOneVisit *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(RTStateModelLocation);
    [(RTStateModelOneVisit *)v2 setLocation:v3];

    v4 = objc_alloc_init(RTStateModelEntryExit);
    [(RTStateModelOneVisit *)v2 setEntryExit_s:v4];

    [(RTStateModelOneVisit *)v2 setNumOfDataPts:0];
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v5;
  }
  return v2;
}

- (RTStateModelOneVisit)initWithLocation:(id)a3 entryExit:(id)a4 andNumOfDataPts:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RTStateModelOneVisit;
  v10 = [(RTStateModelOneVisit *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(RTStateModelOneVisit *)v10 setLocation:v8];
    [(RTStateModelOneVisit *)v11 setEntryExit_s:v9];
    [(RTStateModelOneVisit *)v11 setNumOfDataPts:a5];
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;
  }
  return v11;
}

- (RTStateModelOneVisit)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5 entryTimestamp:(double)a6 exitTimestamp:(double)a7 numOfDataPts:(int64_t)a8
{
  v25.receiver = self;
  v25.super_class = (Class)RTStateModelOneVisit;
  v14 = [(RTStateModelOneVisit *)&v25 init];
  if (v14)
  {
    objc_super v15 = [RTStateModelLocation alloc];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceReferenceDate];
    uint64_t v18 = [(RTStateModelLocation *)v15 initWithLat:a3 Lon:a4 Uncertainty:a5 confidence:-1.0 andTimestamp_s:v17];
    location = v14->_location;
    v14->_location = (RTStateModelLocation *)v18;

    v20 = [[RTStateModelEntryExit alloc] initWithEntry:a6 exit:a7];
    EntryExit_s = v14->_EntryExit_s;
    v14->_EntryExit_s = v20;

    v14->_numOfDataPts = a8;
    uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v22;
  }
  return v14;
}

- (BOOL)isComplete
{
  v3 = [(RTStateModelOneVisit *)self EntryExit_s];
  [v3 entry_s];
  if (v4 <= -1.0)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v5 = [(RTStateModelOneVisit *)self EntryExit_s];
    [v5 exit_s];
    BOOL v7 = v6 > -1.0;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTStateModelOneVisit *)self location];
  [v4 encodeObject:v5 forKey:@"location"];

  id v6 = [(RTStateModelOneVisit *)self EntryExit_s];
  [v4 encodeObject:v6 forKey:@"EntryExit_s"];
}

- (RTStateModelOneVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateModelOneVisit;
  uint64_t v5 = [(RTStateModelOneVisit *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(RTStateModelOneVisit *)v5 setLocation:v6];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EntryExit_s"];
    [(RTStateModelOneVisit *)v5 setEntryExit_s:v7];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(RTStateModelOneVisit *)self location];
  uint64_t v5 = [(RTStateModelOneVisit *)self EntryExit_s];
  id v6 = [v3 stringWithFormat:@"%@, %@, numDataPts, %ld", v4, v5, -[RTStateModelOneVisit numOfDataPts](self, "numOfDataPts")];

  return v6;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTStateModelEntryExit)EntryExit_s
{
  return self->_EntryExit_s;
}

- (void)setEntryExit_s:(id)a3
{
}

- (int64_t)numOfDataPts
{
  return self->_numOfDataPts;
}

- (void)setNumOfDataPts:(int64_t)a3
{
  self->_numOfDataPts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EntryExit_s, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end
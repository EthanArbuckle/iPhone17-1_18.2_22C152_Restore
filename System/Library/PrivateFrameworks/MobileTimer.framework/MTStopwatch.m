@interface MTStopwatch
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForState:(int64_t)a3;
- (BOOL)_isEqualToStopwatch:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MTStopwatch)init;
- (MTStopwatch)initWithCoder:(id)a3;
- (MTStopwatch)initWithId:(id)a3;
- (NSArray)laps;
- (NSDate)startDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (double)currentInterval;
- (double)offset;
- (double)previousLapsTotalInterval;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)_copyStateOntoStopwatch:(id)a3;
- (void)commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentInterval:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setLaps:(id)a3;
- (void)setOffset:(double)a3;
- (void)setPreviousLapsTotalInterval:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTStopwatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTStopwatch)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = [(MTStopwatch *)self initWithId:v4];

  return v5;
}

- (MTStopwatch)initWithId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStopwatch;
  v5 = [(MTStopwatch *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MTStopwatch *)v5 setIdentifier:v4];
    [(MTStopwatch *)v6 commonInit];
  }

  return v6;
}

- (void)commonInit
{
  [(MTStopwatch *)self setOffset:0.0];
  [(MTStopwatch *)self setCurrentInterval:0.0];
  [(MTStopwatch *)self setPreviousLapsTotalInterval:0.0];
  v3 = objc_opt_new();
  [(MTStopwatch *)self setLaps:v3];

  [(MTStopwatch *)self setState:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MTStopwatch *)self identifier];
  [v8 encodeObject:v4 forKey:@"MTStopwatchIdentifier"];

  v5 = [(MTStopwatch *)self title];
  [v8 encodeObject:v5 forKey:@"MTStopwatchTitle"];

  v6 = [(MTStopwatch *)self startDate];
  [v8 encodeObject:v6 forKey:@"MTStopwatchStartDate"];

  [(MTStopwatch *)self offset];
  objc_msgSend(v8, "encodeDouble:forKey:", @"MTStopwatchOffset");
  [(MTStopwatch *)self currentInterval];
  objc_msgSend(v8, "encodeDouble:forKey:", @"MTStopwatchCurrentInterval");
  [(MTStopwatch *)self previousLapsTotalInterval];
  objc_msgSend(v8, "encodeDouble:forKey:", @"MTStopwatchPreviousLapsTotalInterval");
  v7 = [(MTStopwatch *)self laps];
  [v8 encodeObject:v7 forKey:@"MTStopwatchLaps"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[MTStopwatch state](self, "state"), @"MTStopwatchState");
}

- (MTStopwatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTStopwatch;
  v5 = [(MTStopwatch *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTStopwatchIdentifier"];
    [(MTStopwatch *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTStopwatchTitle"];
    [(MTStopwatch *)v5 setTitle:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTStopwatchStartDate"];
    [(MTStopwatch *)v5 setStartDate:v8];

    [v4 decodeDoubleForKey:@"MTStopwatchOffset"];
    -[MTStopwatch setOffset:](v5, "setOffset:");
    [v4 decodeDoubleForKey:@"MTStopwatchCurrentInterval"];
    -[MTStopwatch setCurrentInterval:](v5, "setCurrentInterval:");
    [v4 decodeDoubleForKey:@"MTStopwatchPreviousLapsTotalInterval"];
    -[MTStopwatch setPreviousLapsTotalInterval:](v5, "setPreviousLapsTotalInterval:");
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"MTStopwatchLaps"];
    [(MTStopwatch *)v5 setLaps:v12];

    -[MTStopwatch setState:](v5, "setState:", [v4 decodeIntegerForKey:@"MTStopwatchState"]);
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(MTStopwatch *)+[MTMutableStopwatch allocWithZone:a3] init];
  v5 = [(MTStopwatch *)self identifier];
  [(MTStopwatch *)v4 setIdentifier:v5];

  [(MTStopwatch *)self _copyStateOntoStopwatch:v4];
  return v4;
}

- (void)_copyStateOntoStopwatch:(id)a3
{
  id v7 = a3;
  id v4 = [(MTStopwatch *)self title];
  [v7 setTitle:v4];

  v5 = [(MTStopwatch *)self startDate];
  [v7 setStartDate:v5];

  [(MTStopwatch *)self offset];
  objc_msgSend(v7, "setOffset:");
  [(MTStopwatch *)self currentInterval];
  objc_msgSend(v7, "setCurrentInterval:");
  [(MTStopwatch *)self previousLapsTotalInterval];
  objc_msgSend(v7, "setPreviousLapsTotalInterval:");
  v6 = [(MTStopwatch *)self laps];
  [v7 setLaps:v6];

  objc_msgSend(v7, "setState:", -[MTStopwatch state](self, "state"));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTStopwatch *)self _isEqualToStopwatch:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isEqualToStopwatch:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  id v7 = [(MTStopwatch *)self identifier];
  if (v6 != v7)
  {
    BOOL v8 = [v5 identifier];
    v9 = [(MTStopwatch *)self identifier];
    if (![v8 isEqual:v9])
    {
      BOOL v14 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v44 = v9;
    v45 = v8;
  }
  uint64_t v10 = [v5 title];
  v11 = [(MTStopwatch *)self title];
  if (v10 == v11)
  {
LABEL_8:
    v15 = [v5 laps];
    v16 = [(MTStopwatch *)self laps];
    if (v15 == v16)
    {
      v40 = v15;
    }
    else
    {
      v17 = [v5 laps];
      v3 = [(MTStopwatch *)self laps];
      if (![v17 isEqual:v3])
      {
        BOOL v14 = 0;
LABEL_27:

LABEL_28:
        v13 = v42;
        v12 = v43;
        if (v10 == v11) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      v39 = v17;
      v40 = v15;
    }
    v18 = [v5 startDate];
    v19 = [(MTStopwatch *)self startDate];
    v41 = v3;
    if (v18 != v19)
    {
      v36 = v11;
      v20 = v18;
      v21 = v10;
      v22 = v16;
      v23 = [v5 startDate];
      v37 = [(MTStopwatch *)self startDate];
      v38 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        BOOL v14 = 0;
        v16 = v22;
        uint64_t v10 = v21;
        v18 = v20;
        v11 = v36;
        goto LABEL_25;
      }
      v16 = v22;
      uint64_t v10 = v21;
      v18 = v20;
      v11 = v36;
    }
    [v5 offset];
    double v25 = v24;
    [(MTStopwatch *)self offset];
    if (v25 == v26
      && ([v5 currentInterval],
          double v28 = v27,
          [(MTStopwatch *)self currentInterval],
          v28 == v29)
      && ([v5 previousLapsTotalInterval],
          double v31 = v30,
          [(MTStopwatch *)self previousLapsTotalInterval],
          v31 == v32))
    {
      uint64_t v33 = [v5 state];
      BOOL v14 = v33 == [(MTStopwatch *)self state];
      BOOL v34 = v14;
    }
    else
    {
      BOOL v14 = 0;
      BOOL v34 = 0;
    }
    if (v18 == v19)
    {

      BOOL v14 = v34;
      goto LABEL_26;
    }
LABEL_25:

LABEL_26:
    v17 = v39;
    v15 = v40;
    v3 = v41;
    if (v40 == v16) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v12 = [v5 title];
  v13 = [(MTStopwatch *)self title];
  if ([v12 isEqual:v13])
  {
    v42 = v13;
    v43 = v12;
    goto LABEL_8;
  }
  BOOL v14 = 0;
LABEL_29:

LABEL_30:
  v9 = v44;
  BOOL v8 = v45;
  if (v6 != v7) {
    goto LABEL_31;
  }
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  v2 = [(MTStopwatch *)self hashString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTStopwatch *)self identifier];
  v6 = objc_msgSend((id)objc_opt_class(), "descriptionForState:", -[MTStopwatch state](self, "state"));
  id v7 = [(MTStopwatch *)self startDate];
  [(MTStopwatch *)self offset];
  uint64_t v9 = v8;
  [(MTStopwatch *)self currentInterval];
  uint64_t v11 = v10;
  [(MTStopwatch *)self previousLapsTotalInterval];
  uint64_t v13 = v12;
  BOOL v14 = [(MTStopwatch *)self laps];
  v15 = [(MTStopwatch *)self title];
  v16 = [v3 stringWithFormat:@"<%@:%p, id:%@, state:%@, startDate:%@, offset:%f, currentInterval:%f, previousLapsTotalInterval:%f, laps:%@, title:%@>", v4, self, v5, v6, v7, v9, v11, v13, v14, v15];

  return (NSString *)v16;
}

+ (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Invalid State";
  }
  else {
    return off_1E5917060[a3];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
}

- (double)previousLapsTotalInterval
{
  return self->_previousLapsTotalInterval;
}

- (void)setPreviousLapsTotalInterval:(double)a3
{
  self->_previousLapsTotalInterval = a3;
}

- (NSArray)laps
{
  return self->_laps;
}

- (void)setLaps:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laps, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
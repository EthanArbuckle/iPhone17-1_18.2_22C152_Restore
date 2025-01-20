@interface PCSMTTPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)success;
- (NSDate)start;
- (NSString)name;
- (PCSMTT)mtt;
- (PCSMTTPoint)initWithCoder:(id)a3;
- (PCSMTTPoint)initWithMTT:(id)a3 name:(id)a4;
- (double)time;
- (id)description;
- (id)jsonDict;
- (void)complete:(BOOL)a3;
- (void)complete:(BOOL)a3 time:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMtt:(id)a3;
- (void)setName:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PCSMTTPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCSMTTPoint)initWithMTT:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PCSMTTPoint;
  v8 = [(PCSMTTPoint *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mtt, v6);
    objc_storeStrong((id *)&v9->_name, a4);
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    start = v9->_start;
    v9->_start = (NSDate *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[MTTPoint:%@:%d:%lf]", self->_name, self->_success, *(void *)&self->_time];
}

- (id)jsonDict
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"name";
  v3 = [(PCSMTTPoint *)self name];
  v10[0] = v3;
  v9[1] = @"success";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PCSMTTPoint success](self, "success"));
  v10[1] = v4;
  v9[2] = @"time";
  v5 = NSNumber;
  [(PCSMTTPoint *)self time];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (void)complete:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:self->_start];
  double v7 = v6;

  [(PCSMTTPoint *)self complete:v3 time:v7];
}

- (void)complete:(BOOL)a3 time:(double)a4
{
  self->_success = a3;
  self->_time = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mtt);
  [WeakRetained completePoint:self];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  double v6 = [NSNumber numberWithBool:self->_success];
  [v5 encodeObject:v6 forKey:@"success"];

  id v7 = [NSNumber numberWithDouble:self->_time];
  [v5 encodeObject:v7 forKey:@"time"];
}

- (PCSMTTPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  double v6 = [(PCSMTTPoint *)self initWithMTT:0 name:v5];
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"success"];
    v6->_success = [v7 BOOLValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    [v8 doubleValue];
    v6->_time = v9;

    uint64_t v10 = v6;
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (double)time
{
  return self->_time;
}

- (BOOL)success
{
  return self->_success;
}

- (PCSMTT)mtt
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mtt);
  return (PCSMTT *)WeakRetained;
}

- (void)setMtt:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_destroyWeak((id *)&self->_mtt);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
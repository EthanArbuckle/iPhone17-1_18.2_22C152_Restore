@interface ICSPeriod
+ (BOOL)supportsSecureCoding;
- (BOOL)isDurationBased;
- (ICSPeriod)initWithCoder:(id)a3;
- (ICSPeriod)initWithStart:(id)a3;
- (ICSPeriod)initWithStart:(id)a3 duration:(id)a4;
- (ICSPeriod)initWithStart:(id)a3 end:(id)a4;
- (id)duration;
- (id)end;
- (id)start;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICSPeriod

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v8 = a4;
  v6 = [(ICSPeriod *)self start];
  [v6 _ICSStringWithOptions:a3 appendingToString:v8];

  [v8 appendString:@"/"];
  if ([(ICSPeriod *)self isDurationBased]) {
    [(ICSPeriod *)self duration];
  }
  else {
  v7 = [(ICSPeriod *)self end];
  }
  [v7 _ICSStringWithOptions:a3 appendingToString:v8];
}

- (ICSPeriod)initWithStart:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSPeriod;
  v6 = [(ICSPeriod *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_start, a3);
  }

  return v7;
}

- (ICSPeriod)initWithStart:(id)a3 end:(id)a4
{
  id v7 = a4;
  id v8 = [(ICSPeriod *)self initWithStart:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_end, a4);
  }

  return v9;
}

- (ICSPeriod)initWithStart:(id)a3 duration:(id)a4
{
  id v7 = a4;
  id v8 = [(ICSPeriod *)self initWithStart:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_duration, a4);
  }

  return v9;
}

- (id)start
{
  return self->_start;
}

- (id)end
{
  return self->_end;
}

- (id)duration
{
  return self->_duration;
}

- (BOOL)isDurationBased
{
  v2 = [(ICSPeriod *)self duration];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  start = self->_start;
  id v5 = a3;
  [v5 encodeObject:start forKey:@"StartDate"];
  [v5 encodeObject:self->_end forKey:@"EndDate"];
  [v5 encodeObject:self->_duration forKey:@"DurationObject"];
}

- (ICSPeriod)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSPeriod;
  id v5 = [(ICSPeriod *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
    start = v5->_start;
    v5->_start = (ICSDateValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
    end = v5->_end;
    v5->_end = (ICSDateValue *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DurationObject"];
    duration = v5->_duration;
    v5->_duration = (ICSDuration *)v10;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
@interface RTStateModelEntryExit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTStateModelEntryExit)init;
- (RTStateModelEntryExit)initWithCoder:(id)a3;
- (RTStateModelEntryExit)initWithEntry:(double)a3 exit:(double)a4;
- (double)entry_s;
- (double)exit_s;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEntry_s:(double)a3;
- (void)setExit_s:(double)a3;
@end

@implementation RTStateModelEntryExit

- (RTStateModelEntryExit)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTStateModelEntryExit;
  v2 = [(RTStateModelEntryExit *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(RTStateModelEntryExit *)v2 setEntry_s:-1.0];
    [(RTStateModelEntryExit *)v3 setExit_s:-1.0];
  }
  return v3;
}

- (RTStateModelEntryExit)initWithEntry:(double)a3 exit:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RTStateModelEntryExit;
  v6 = [(RTStateModelEntryExit *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(RTStateModelEntryExit *)v6 setEntry_s:a3];
    [(RTStateModelEntryExit *)v7 setExit_s:a4];
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
  [(RTStateModelEntryExit *)self entry_s];
  [v4 encodeDouble:entry_s forKey:@"entry_s"];
  [(RTStateModelEntryExit *)self exit_s];
  [v4 encodeDouble:@"exit_s" forKey:x0];
}

- (RTStateModelEntryExit)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RTStateModelEntryExit;
  objc_super v5 = [(RTStateModelEntryExit *)&v7 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"entry_s"];
    -[RTStateModelEntryExit setEntry_s:](v5, "setEntry_s:");
    [v4 decodeDoubleForKey:@"exit_s"];
    -[RTStateModelEntryExit setExit_s:](v5, "setExit_s:");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTStateModelEntryExit *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 == self)
    {
      BOOL v12 = 1;
    }
    else
    {
      objc_super v5 = v4;
      [(RTStateModelEntryExit *)self entry_s];
      double v7 = v6;
      [(RTStateModelEntryExit *)v5 entry_s];
      if (v7 == v8)
      {
        [(RTStateModelEntryExit *)self exit_s];
        double v10 = v9;
        [(RTStateModelEntryExit *)v5 exit_s];
        BOOL v12 = v10 == v11;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  [(RTStateModelEntryExit *)self entry_s];
  double v5 = v4;
  if (v4 == -1.0)
  {
    double v7 = 0;
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1C9C8];
    [(RTStateModelEntryExit *)self entry_s];
    double v7 = [v6 stringFromTimestamp:x0];
  }
  [(RTStateModelEntryExit *)self exit_s];
  if (v8 == -1.0)
  {
    double v11 = [v3 stringWithFormat:@"entry, %@, exit, %@", v7, 0];
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(RTStateModelEntryExit *)self exit_s];
    double v10 = [v9 stringFromTimestamp:x0];
    double v11 = [v3 stringWithFormat:@"entry, %@, exit, %@", v7, v10];
  }
  if (v5 != -1.0) {

  }
  return v11;
}

- (double)entry_s
{
  return self->_entry_s;
}

- (void)setEntry_s:(double)a3
{
  self->_entry_s = a3;
}

- (double)exit_s
{
  return self->_exit_s;
}

- (void)setExit_s:(double)a3
{
  self->_exit_s = a3;
}

@end
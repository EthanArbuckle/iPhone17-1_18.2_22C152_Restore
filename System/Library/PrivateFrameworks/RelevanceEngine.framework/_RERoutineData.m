@interface _RERoutineData
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoutineData:(id)a3;
- (NSArray)locationsOfInterest;
- (int64_t)mode;
- (void)setLocationsOfInterest:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation _RERoutineData

- (BOOL)isEqual:(id)a3
{
  v4 = (_RERoutineData *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_RERoutineData *)self isEqualToRoutineData:v4];
  }

  return v5;
}

- (BOOL)isEqualToRoutineData:(id)a3
{
  v4 = (_RERoutineData *)a3;
  BOOL v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (int64_t v6 = [(_RERoutineData *)self mode], v6 == [(_RERoutineData *)v5 mode]))
  {
    v7 = [(_RERoutineData *)self locationsOfInterest];
    v8 = [(_RERoutineData *)v5 locationsOfInterest];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)locationsOfInterest
{
  return self->_locationsOfInterest;
}

- (void)setLocationsOfInterest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
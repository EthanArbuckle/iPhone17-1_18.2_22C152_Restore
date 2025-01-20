@interface SBWindowHideRequest
+ (id)hideRequestWithWindowLevelRange:(SBWindowLevelRange_struct)a3 reason:(id)a4;
- (NSString)reason;
- (SBWindowLevelRange_struct)windowLevelRange;
- (id)description;
- (void)setReason:(id)a3;
- (void)setWindowLevelRange:(SBWindowLevelRange_struct)a3;
@end

@implementation SBWindowHideRequest

+ (id)hideRequestWithWindowLevelRange:(SBWindowLevelRange_struct)a3 reason:(id)a4
{
  double end = a3.end;
  double start = a3.start;
  id v6 = a4;
  v7 = objc_alloc_init(SBWindowHideRequest);
  -[SBWindowHideRequest setWindowLevelRange:](v7, "setWindowLevelRange:", start, end);
  [(SBWindowHideRequest *)v7 setReason:v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  [(SBWindowHideRequest *)self windowLevelRange];
  id v6 = [NSString stringWithFormat:@"(%.f, %.f)", v4, v5];
  v7 = [(SBWindowHideRequest *)self reason];
  v8 = [v3 stringWithFormat:@"<SBWindowHideRequest: range = %@ reason = %@>", v6, v7];;

  return v8;
}

- (SBWindowLevelRange_struct)windowLevelRange
{
  objc_copyStruct(v4, &self->_windowLevelRange, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double end = v3;
  result.double start = v2;
  return result;
}

- (void)setWindowLevelRange:(SBWindowLevelRange_struct)a3
{
  SBWindowLevelRange_struct v3 = a3;
  objc_copyStruct(&self->_windowLevelRange, &v3, 16, 1, 0);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
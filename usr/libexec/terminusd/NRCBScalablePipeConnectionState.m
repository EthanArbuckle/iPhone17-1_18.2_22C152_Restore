@interface NRCBScalablePipeConnectionState
- (id)description;
@end

@implementation NRCBScalablePipeConnectionState

- (id)description
{
  int state = self->_state;
  if (state == 1)
  {
    uint64_t v4 = 16;
  }
  else
  {
    if (state != 2)
    {
      v12 = @"<unknown>";
      goto LABEL_15;
    }
    uint64_t v4 = 24;
  }
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + v4);
  uint64_t v6 = mach_continuous_time();
  double v9 = 0.0;
  if (v5) {
    BOOL v10 = v6 > v5;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v11 = v6;
    if (qword_1001F4BB8 != -1) {
      dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
    }
    LODWORD(v7) = dword_1001F4BC0;
    LODWORD(v8) = *(_DWORD *)algn_1001F4BC4;
    double v9 = (double)(v11 - v5) * (0.000000001 * (double)v7) / (double)v8;
  }
  v12 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%.2fs", *(void *)&v9];
LABEL_15:
  id v13 = objc_alloc((Class)NSString);
  unint64_t v14 = self->_state;
  if (v14 >= 3) {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"UnknownType(%lld)", v14];
  }
  else {
    id v15 = *(&off_1001C6568 + v14);
  }
  id v16 = [v13 initWithFormat:@"NRBTPipe[%@ %@]", v15, v12];

  return v16;
}

@end
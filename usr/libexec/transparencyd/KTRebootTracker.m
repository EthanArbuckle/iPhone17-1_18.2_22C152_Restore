@interface KTRebootTracker
- (id)getLastRebootTime;
@end

@implementation KTRebootTracker

- (id)getLastRebootTime
{
  v9[0] = 0;
  v9[1] = 0;
  *(void *)v10 = 0x1500000001;
  size_t v7 = 16;
  time_t v8 = 0;
  time(&v8);
  int v2 = sysctl(v10, 2u, v9, &v7, 0, 0);
  if (v9[0]) {
    BOOL v3 = v2 == -1;
  }
  else {
    BOOL v3 = 1;
  }
  double v4 = (double)v9[0];
  if (v3) {
    double v4 = 0.0;
  }
  v5 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v4, v7);

  return v5;
}

@end
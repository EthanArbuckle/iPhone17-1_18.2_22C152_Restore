@interface CRLProgressReporter
- (CRLProgressReporter)initWithTotalUnitCount:(int64_t)a3;
- (NSProgress)progress;
@end

@implementation CRLProgressReporter

- (CRLProgressReporter)initWithTotalUnitCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLProgressReporter;
  v4 = [(CRLProgressReporter *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[NSProgress progressWithTotalUnitCount:a3];
    progress = v4->_progress;
    v4->_progress = (NSProgress *)v5;
  }
  return v4;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end
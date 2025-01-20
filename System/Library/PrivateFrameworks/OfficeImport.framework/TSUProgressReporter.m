@interface TSUProgressReporter
- (NSProgress)progress;
- (TSUProgressReporter)initWithTotalUnitCount:(int64_t)a3;
@end

@implementation TSUProgressReporter

- (TSUProgressReporter)initWithTotalUnitCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSUProgressReporter;
  v4 = [(TSUProgressReporter *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:a3];
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
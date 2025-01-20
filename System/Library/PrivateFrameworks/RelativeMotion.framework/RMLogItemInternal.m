@interface RMLogItemInternal
- (RMLogItemInternal)initWithTimestamp:(double)a3;
@end

@implementation RMLogItemInternal

- (RMLogItemInternal)initWithTimestamp:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMLogItemInternal;
  result = [(RMLogItemInternal *)&v5 init];
  if (result) {
    result->fTimestamp = a3;
  }
  return result;
}

@end
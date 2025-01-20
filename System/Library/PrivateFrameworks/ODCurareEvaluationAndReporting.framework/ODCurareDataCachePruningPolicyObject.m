@interface ODCurareDataCachePruningPolicyObject
- (ODCurareDataCachePruningPolicyObject)initWithMaximumNumberOfDays:(int)a3 maximumNumberOfEvents:(int)a4;
- (int64_t)maximumNumberOfDays;
- (int64_t)maximumNumberOfEvents;
- (void)setMaximumNumberOfDays:(int64_t)a3;
- (void)setMaximumNumberOfEvents:(int64_t)a3;
@end

@implementation ODCurareDataCachePruningPolicyObject

- (ODCurareDataCachePruningPolicyObject)initWithMaximumNumberOfDays:(int)a3 maximumNumberOfEvents:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ODCurareDataCachePruningPolicyObject;
  v6 = [(ODCurareDataCachePruningPolicyObject *)&v10 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  if ((v5 & 0x80000000) != 0)
  {
    NSLog(&cfstr_Odcuraredataca.isa, v5);
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if ((v4 & 0x80000000) != 0)
  {
    NSLog(&cfstr_Odcuraredataca_0.isa, v4);
    goto LABEL_8;
  }
  [(ODCurareDataCachePruningPolicyObject *)v6 setMaximumNumberOfDays:v5];
  [(ODCurareDataCachePruningPolicyObject *)v7 setMaximumNumberOfEvents:v4];
LABEL_5:
  v8 = v7;
LABEL_9:

  return v8;
}

- (int64_t)maximumNumberOfDays
{
  return self->_maximumNumberOfDays;
}

- (void)setMaximumNumberOfDays:(int64_t)a3
{
  self->_maximumNumberOfDays = a3;
}

- (int64_t)maximumNumberOfEvents
{
  return self->_maximumNumberOfEvents;
}

- (void)setMaximumNumberOfEvents:(int64_t)a3
{
  self->_maximumNumberOfEvents = a3;
}

@end
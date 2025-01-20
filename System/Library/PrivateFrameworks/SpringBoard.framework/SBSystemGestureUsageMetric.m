@interface SBSystemGestureUsageMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBSystemGestureUsageMetric)init;
- (unint64_t)currentLocation;
- (void)setCurrentLocation:(unint64_t)a3;
@end

@implementation SBSystemGestureUsageMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 3)
  {
    v12 = [v6 eventPayload];
    v9 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

    self->_currentLocation = SBAnalyticsLayoutLocationForDisplayLayoutElements(v9);
    char v11 = 1;
LABEL_11:

    goto LABEL_12;
  }
  if (a3 == 12)
  {
    v8 = [v6 eventPayload];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA76A8]];

    if (v9)
    {
      id v10 = [(NSMutableDictionary *)self->_typeToMetric objectForKeyedSubscript:v9];
      if (!v10)
      {
        id v10 = -[SBSystemGestureMetric initForType:parentMetric:]([SBSystemGestureMetric alloc], "initForType:parentMetric:", [v9 unsignedIntegerValue], self);
        [(NSMutableDictionary *)self->_typeToMetric setObject:v10 forKeyedSubscript:v9];
      }
      char v11 = [v10 handleEvent:12 withContext:v7];
      if ((unint64_t)([v10 currentState] - 3) <= 2) {
        [(NSMutableDictionary *)self->_typeToMetric removeObjectForKey:v9];
      }

      goto LABEL_11;
    }
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (SBSystemGestureUsageMetric)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemGestureUsageMetric;
  v2 = [(SBSystemGestureUsageMetric *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    typeToMetric = v2->_typeToMetric;
    v2->_typeToMetric = v3;
  }
  return v2;
}

- (unint64_t)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(unint64_t)a3
{
  self->_currentLocation = a3;
}

- (void).cxx_destruct
{
}

@end
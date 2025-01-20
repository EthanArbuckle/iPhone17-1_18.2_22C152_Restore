@interface _BKHIDHumanPresenceSensorRecord
- (BOOL)humanIsPresent;
- (NSMutableArray)services;
- (double)proximityInCentimeters;
- (id)description;
- (unint64_t)status;
- (void)_resetServiceStatus;
- (void)addService:(id)a3;
- (void)removeService:(id)a3;
- (void)setHumanIsPresent:(BOOL)a3;
- (void)setProximityInCentimeters:(double)a3;
- (void)setServices:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation _BKHIDHumanPresenceSensorRecord

- (void).cxx_destruct
{
}

- (void)setServices:(id)a3
{
}

- (NSMutableArray)services
{
  return self->_services;
}

- (BOOL)humanIsPresent
{
  return self->_humanIsPresent;
}

- (double)proximityInCentimeters
{
  return self->_proximityInCentimeters;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)removeService:(id)a3
{
  [(NSMutableArray *)self->_services removeObject:a3];

  [(_BKHIDHumanPresenceSensorRecord *)self _resetServiceStatus];
}

- (void)addService:(id)a3
{
  id v4 = a3;
  services = self->_services;
  id v8 = v4;
  if (!services)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_services;
    self->_services = v6;

    id v4 = v8;
    services = self->_services;
  }
  [(NSMutableArray *)services addObject:v4];
  [(_BKHIDHumanPresenceSensorRecord *)self _resetServiceStatus];
}

- (void)setHumanIsPresent:(BOOL)a3
{
  if (self->_humanIsPresent != a3)
  {
    self->_humanIsPresent = a3;
    self->_status |= 4uLL;
  }
}

- (void)setProximityInCentimeters:(double)a3
{
  if (self->_proximityInCentimeters != a3)
  {
    self->_proximityInCentimeters = a3;
    self->_status |= 8uLL;
  }
}

- (void)_resetServiceStatus
{
  self->_status &= 0xFFFFFFFFFFFFFFFCLL;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_services;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) primaryUsage:v12];
        if (v8 == 17)
        {
          uint64_t v9 = 1;
        }
        else
        {
          if (v8 != 18) {
            continue;
          }
          uint64_t v9 = 2;
        }
        self->_status |= v9;
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  unint64_t status = self->_status;
  unint64_t v11 = status & 0xFFFFFFFFFFFFFFFBLL;
  if ((status & 1) == 0 || (unint64_t v11 = self->_status, (v11 & 2) == 0))
  {
    if ((v11 & 2) == 0) {
      v11 &= ~8uLL;
    }
    self->_unint64_t status = v11;
  }
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = NSStringFromBKSHIDServicesHumanPresenceStatus();
  id v5 = [v3 appendObject:v4 withName:@"status"];

  id v6 = [v3 appendFloat:@"proximityInCentimeters" withName:self->_proximityInCentimeters];
  id v7 = [v3 appendBool:self->_humanIsPresent withName:@"humanIsPresent"];
  unsigned int v8 = [v3 build];

  return v8;
}

@end
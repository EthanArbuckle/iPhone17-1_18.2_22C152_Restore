@interface WiFiP2PAWDLStateMonitorConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)servicesRequiringAvailabilityNotification;
- (WiFiP2PAWDLStateMonitorConfiguration)init;
- (WiFiP2PAWDLStateMonitorConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setServicesRequiringAvailabilityNotification:(id)a3;
@end

@implementation WiFiP2PAWDLStateMonitorConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiP2PAWDLStateMonitorConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)WiFiP2PAWDLStateMonitorConfiguration;
  v2 = [(WiFiP2PAWDLStateMonitorConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    servicesRequiringAvailabilityNotification = v2->_servicesRequiringAvailabilityNotification;
    v2->_options = 0;
    v2->_servicesRequiringAvailabilityNotification = 0;
  }
  return v3;
}

- (WiFiP2PAWDLStateMonitorConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiP2PAWDLStateMonitorConfiguration;
  v5 = [(WiFiP2PAWDLStateMonitorConfiguration *)&v10 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLStateMonitor.optionsKey"];
    v5->_options = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AWDLStateMonitor.services"];
    servicesRequiringAvailabilityNotification = v5->_servicesRequiringAvailabilityNotification;
    v5->_servicesRequiringAvailabilityNotification = (NSArray *)v7;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiP2PAWDLStateMonitorConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  unint64_t v6 = [(WiFiP2PAWDLStateMonitorConfiguration *)self options];
  if (v6 != [(WiFiP2PAWDLStateMonitorConfiguration *)v5 options]) {
    goto LABEL_6;
  }
  uint64_t v7 = [(WiFiP2PAWDLStateMonitorConfiguration *)self servicesRequiringAvailabilityNotification];
  uint64_t v8 = [(WiFiP2PAWDLStateMonitorConfiguration *)v5 servicesRequiringAvailabilityNotification];
  if (v7 == (void *)v8)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  objc_super v10 = [(WiFiP2PAWDLStateMonitorConfiguration *)self servicesRequiringAvailabilityNotification];
  v11 = [(WiFiP2PAWDLStateMonitorConfiguration *)v5 servicesRequiringAvailabilityNotification];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_10;
  }
LABEL_6:
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[WiFiP2PAWDLStateMonitorConfiguration options](self, "options"));
  [v5 encodeObject:v6 forKey:@"AWDLStateMonitor.optionsKey"];

  id v7 = [(WiFiP2PAWDLStateMonitorConfiguration *)self servicesRequiringAvailabilityNotification];
  [v5 encodeObject:v7 forKey:@"AWDLStateMonitor.services"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WiFiP2PAWDLStateMonitorConfiguration);
  [(WiFiP2PAWDLStateMonitorConfiguration *)v4 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)self options]];
  id v5 = [(WiFiP2PAWDLStateMonitorConfiguration *)self servicesRequiringAvailabilityNotification];
  unint64_t v6 = (void *)[v5 copy];
  [(WiFiP2PAWDLStateMonitorConfiguration *)v4 setServicesRequiringAvailabilityNotification:v6];

  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)servicesRequiringAvailabilityNotification
{
  return self->_servicesRequiringAvailabilityNotification;
}

- (void)setServicesRequiringAvailabilityNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
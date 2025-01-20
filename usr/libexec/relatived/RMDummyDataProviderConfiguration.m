@interface RMDummyDataProviderConfiguration
- (NSUUID)identifier;
- (RMDummyDataProviderConfiguration)initWithUniqueIdentifier:(id)a3 updateInterval:(unint64_t)a4;
- (unint64_t)intervalInNanoSeconds;
- (void)setIdentifier:(id)a3;
- (void)setIntervalInNanoSeconds:(unint64_t)a3;
@end

@implementation RMDummyDataProviderConfiguration

- (RMDummyDataProviderConfiguration)initWithUniqueIdentifier:(id)a3 updateInterval:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMDummyDataProviderConfiguration;
  v7 = [(RMDummyDataProviderConfiguration *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(RMDummyDataProviderConfiguration *)v7 setIdentifier:v6];
    [(RMDummyDataProviderConfiguration *)v8 setIntervalInNanoSeconds:a4];
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)intervalInNanoSeconds
{
  return self->_intervalInNanoSeconds;
}

- (void)setIntervalInNanoSeconds:(unint64_t)a3
{
  self->_intervalInNanoSeconds = a3;
}

- (void).cxx_destruct
{
}

@end
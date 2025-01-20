@interface _PSAlter
- (NSString)name;
- (_PSAlter)initWithName:(id)a3;
- (_PSAlter)initWithName:(id)a3 andDistance:(double)a4 andTime:(double)a5;
- (double)distanceToCluster;
- (double)timeSinceLastContact;
- (void)setDistanceToCluster:(double)a3;
- (void)setTimeSinceLastContact:(double)a3;
@end

@implementation _PSAlter

- (_PSAlter)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSAlter;
  v6 = [(_PSAlter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(_OWORD *)&v7->_distanceToCluster = xmmword_1A3265130;
  }

  return v7;
}

- (_PSAlter)initWithName:(id)a3 andDistance:(double)a4 andTime:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSAlter;
  v10 = [(_PSAlter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_distanceToCluster = a4;
    v11->_timeSinceLastContact = a5;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (double)distanceToCluster
{
  return self->_distanceToCluster;
}

- (void)setDistanceToCluster:(double)a3
{
  self->_distanceToCluster = a3;
}

- (double)timeSinceLastContact
{
  return self->_timeSinceLastContact;
}

- (void)setTimeSinceLastContact:(double)a3
{
  self->_timeSinceLastContact = a3;
}

- (void).cxx_destruct
{
}

@end
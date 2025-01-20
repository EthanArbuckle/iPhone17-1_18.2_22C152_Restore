@interface TIUserModelCounter
- (NSDate)creationDate;
- (NSDate)lastUpdateDate;
- (NSNumber)count;
- (NSString)name;
- (TIUserModelCounter)initWithName:(id)a3;
- (TIUserModelCounter)initWithName:(id)a3 initialCount:(id)a4 creationDate:(id)a5 lastUpdateDate:(id)a6;
- (void)add:(int)a3;
- (void)doPersist:(id)a3 forDate:(id)a4;
- (void)reset;
@end

@implementation TIUserModelCounter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)reset
{
  self->_persisted = 0;
  self->_current = 0;
  self->_wasReset = 1;
}

- (void)add:(int)a3
{
  self->_current += a3;
}

- (NSNumber)count
{
  return (NSNumber *)[NSNumber numberWithUnsignedInt:(LODWORD(self->_current) + LODWORD(self->_persisted))];
}

- (void)doPersist:(id)a3 forDate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_wasReset)
  {
    v7 = [(id)kUserModelDatabasePrefix stringByAppendingString:self->_name];
    v8 = [NSNumber numberWithInt:LODWORD(self->_current)];
    [v10 setDurableValue:v8 forKey:v7 forDate:v6];

    self->_persisted = self->_current;
    self->_current = 0;
    self->_wasReset = 0;
  }
  else
  {
    if (!self->_current) {
      goto LABEL_6;
    }
    v7 = [(id)kUserModelDatabasePrefix stringByAppendingString:self->_name];
    v9 = [NSNumber numberWithInt:LODWORD(self->_current)];
    [v10 updateDurableValue:v9 forKey:v7 forDate:v6];

    self->_persisted += self->_current;
    self->_current = 0;
  }

LABEL_6:
}

- (TIUserModelCounter)initWithName:(id)a3 initialCount:(id)a4 creationDate:(id)a5 lastUpdateDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TIUserModelCounter;
  v15 = [(TIUserModelCounter *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_persisted = [v12 unsignedIntegerValue];
    objc_storeStrong((id *)&v16->_creationDate, a5);
    objc_storeStrong((id *)&v16->_lastUpdateDate, a6);
    v16->_wasReset = 0;
  }

  return v16;
}

- (TIUserModelCounter)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIUserModelCounter;
  id v6 = [(TIUserModelCounter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_persisted = 0;
    creationDate = v7->_creationDate;
    v7->_creationDate = 0;

    lastUpdateDate = v7->_lastUpdateDate;
    v7->_lastUpdateDate = 0;

    v7->_wasReset = 0;
  }

  return v7;
}

@end
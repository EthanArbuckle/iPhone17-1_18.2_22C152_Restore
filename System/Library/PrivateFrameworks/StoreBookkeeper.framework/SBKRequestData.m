@interface SBKRequestData
+ (id)propertyListBodyWithTransaction:(id)a3;
- (SBKRequestData)initWithTransaction:(id)a3;
- (SBKTransaction)transaction;
- (id)serializableRequestBodyPropertyList;
- (void)setTransaction:(id)a3;
@end

@implementation SBKRequestData

- (void).cxx_destruct
{
}

- (void)setTransaction:(id)a3
{
}

- (SBKTransaction)transaction
{
  return self->_transaction;
}

- (id)serializableRequestBodyPropertyList
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKRequestData.m" lineNumber:28 description:@"Subclass must implement"];

  return 0;
}

- (SBKRequestData)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKRequestData;
  v6 = [(SBKRequestData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

+ (id)propertyListBodyWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithTransaction:v4];

  v6 = [v5 serializableRequestBodyPropertyList];

  return v6;
}

@end
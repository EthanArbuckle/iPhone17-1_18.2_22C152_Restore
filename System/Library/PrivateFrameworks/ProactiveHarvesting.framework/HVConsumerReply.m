@interface HVConsumerReply
+ (id)failedWithError:(id)a3;
+ (id)ignored;
+ (id)interrupted;
+ (id)successWithNumberOfExtractions:(id)a3;
- (BOOL)success;
- (HVConsumerReply)initWithSuccess:(BOOL)a3 contentWasProcessed:(id)a4 numberOfExtractions:(id)a5 error:(id)a6;
- (NSError)error;
- (NSNumber)contentWasProcessed;
- (NSNumber)numberOfExtractions;
- (void)setContentWasProcessed:(id)a3;
- (void)setError:(id)a3;
- (void)setNumberOfExtractions:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation HVConsumerReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfExtractions, 0);
  objc_storeStrong((id *)&self->_contentWasProcessed, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)ignored
{
  v2 = [HVConsumerReply alloc];
  v3 = [(HVConsumerReply *)v2 initWithSuccess:1 contentWasProcessed:MEMORY[0x263EFFA80] numberOfExtractions:0 error:0];

  return v3;
}

+ (id)successWithNumberOfExtractions:(id)a3
{
  id v3 = a3;
  v4 = [HVConsumerReply alloc];
  v5 = [(HVConsumerReply *)v4 initWithSuccess:1 contentWasProcessed:MEMORY[0x263EFFA88] numberOfExtractions:v3 error:0];

  return v5;
}

- (HVConsumerReply)initWithSuccess:(BOOL)a3 contentWasProcessed:(id)a4 numberOfExtractions:(id)a5 error:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HVConsumerReply;
  v14 = [(HVConsumerReply *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_success = a3;
    objc_storeStrong((id *)&v14->_contentWasProcessed, a4);
    objc_storeStrong((id *)&v15->_numberOfExtractions, a5);
    objc_storeStrong((id *)&v15->_error, a6);
  }

  return v15;
}

- (void)setNumberOfExtractions:(id)a3
{
}

- (NSNumber)numberOfExtractions
{
  return self->_numberOfExtractions;
}

- (void)setContentWasProcessed:(id)a3
{
}

- (NSNumber)contentWasProcessed
{
  return self->_contentWasProcessed;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)success
{
  return self->_success;
}

+ (id)failedWithError:(id)a3
{
  id v3 = a3;
  v4 = [HVConsumerReply alloc];
  v5 = [(HVConsumerReply *)v4 initWithSuccess:0 contentWasProcessed:MEMORY[0x263EFFA80] numberOfExtractions:0 error:v3];

  return v5;
}

+ (id)interrupted
{
  v2 = [HVConsumerReply alloc];
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"kHVConsumerErrorDomain" code:1 userInfo:0];
  v4 = [(HVConsumerReply *)v2 initWithSuccess:0 contentWasProcessed:MEMORY[0x263EFFA80] numberOfExtractions:0 error:v3];

  return v4;
}

@end
@interface SignpostSupportSubsystemCategoryFilterEntry
- (NSString)category;
- (NSString)subsystem;
- (SignpostSupportSubsystemCategoryFilterEntry)initWithSubsystem:(id)a3 category:(id)a4;
@end

@implementation SignpostSupportSubsystemCategoryFilterEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (SignpostSupportSubsystemCategoryFilterEntry)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    -[SignpostSupportSubsystemCategoryFilterEntry initWithSubsystem:category:]();
  }
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)SignpostSupportSubsystemCategoryFilterEntry;
  v10 = [(SignpostSupportSubsystemCategoryFilterEntry *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subsystem, a3);
    objc_storeStrong((id *)&v11->_category, a4);
  }

  return v11;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)initWithSubsystem:category:.cold.1()
{
}

@end
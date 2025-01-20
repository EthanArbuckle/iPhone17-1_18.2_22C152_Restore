@interface RTIInputSystemUIClient
+ (id)_serviceName;
- (BOOL)_canResumeConnection;
- (RTIInputSystemUIClient)initWithUIHostMachName:(id)a3;
- (void)_initializeConnectionWithMachName:(id)a3;
@end

@implementation RTIInputSystemUIClient

- (RTIInputSystemUIClient)initWithUIHostMachName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)RTIInputSystemUIClient;
  v7 = [(RTIInputSystemClient *)&v9 initWithMachNames:v6];

  return v7;
}

- (BOOL)_canResumeConnection
{
  return 0;
}

+ (id)_serviceName
{
  return @"com.apple.inputservice.ui";
}

- (void)_initializeConnectionWithMachName:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = RTILogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[RTIInputSystemUIClient _initializeConnectionWithMachName:]";
    _os_log_impl(&dword_19AFFA000, v5, OS_LOG_TYPE_INFO, "%s  Starting InputUI connection", (uint8_t *)&v10, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E4F50BB8];
  v7 = [(id)objc_opt_class() _serviceName];
  v8 = [v6 endpointForMachName:v4 service:v7 instance:0];

  objc_super v9 = [MEMORY[0x1E4F50BA0] NSXPCConnectionWithEndpoint:v8 configurator:&__block_literal_global_0];
  [(RTIInputSystemClient *)self _didIntializeConnection:v9 withMachName:v4];

  [v9 activate];
}

void __60__RTIInputSystemUIClient__initializeConnectionWithMachName___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F96358];
  id v3 = a2;
  id v4 = [v2 attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setPerMessageAssertionAttributes:v5];
}

@end
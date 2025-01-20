@interface VisionCoreE5RTExecutionBoundPorts
- (BOOL)getPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5;
- (BOOL)recordPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5;
- (NSArray)allPortNames;
- (VisionCoreE5RTExecutionBoundPorts)init;
- (VisionCoreE5RTExecutionBoundPorts)initWithCapacity:(unint64_t)a3;
- (void)dealloc;
- (void)releaseAllPorts;
- (void)releasePortNamed:(id)a3;
@end

@implementation VisionCoreE5RTExecutionBoundPorts

- (void).cxx_destruct
{
}

- (void)releasePortNamed:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_namedPorts objectForKey:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_namedPorts removeObjectForKey:v4];
    [v5 pointerValue];
    e5rt_io_port_release();
  }
}

- (void)releaseAllPorts
{
  v2 = self->_namedPorts;
  [(NSMutableDictionary *)v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1863];
  [(NSMutableDictionary *)v2 removeAllObjects];
}

- (BOOL)getPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(NSMutableDictionary *)self->_namedPorts objectForKey:v8];
  v10 = v9;
  if (v9)
  {
    if (a3) {
      *a3 = (e5rt_io_port *)[v9 pointerValue];
    }
  }
  else if (a5)
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"Port \"%@\" has not been bound", v8];
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
  }
  return v10 != 0;
}

- (BOOL)recordPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_namedPorts objectForKey:v8];
  if (v9)
  {
    if (a5)
    {
      v10 = (void *)[[NSString alloc] initWithFormat:@"Port \"%@\" has already been bound", v8];
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v10];
    }
    v11 = (void *)v9;
  }
  else
  {
    v11 = [MEMORY[0x263F08D40] valueWithPointer:a3];
    [(NSMutableDictionary *)self->_namedPorts setObject:v11 forKey:v8];
  }

  return v9 == 0;
}

- (NSArray)allPortNames
{
  return (NSArray *)[(NSMutableDictionary *)self->_namedPorts allKeys];
}

- (void)dealloc
{
  v3 = self->_namedPorts;
  [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1863];
  [(NSMutableDictionary *)v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)VisionCoreE5RTExecutionBoundPorts;
  [(VisionCoreE5RTExecutionBoundPorts *)&v4 dealloc];
}

- (VisionCoreE5RTExecutionBoundPorts)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreE5RTExecutionBoundPorts;
  objc_super v4 = [(VisionCoreE5RTExecutionBoundPorts *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:a3];
    namedPorts = v4->_namedPorts;
    v4->_namedPorts = (NSMutableDictionary *)v5;
  }
  return v4;
}

- (VisionCoreE5RTExecutionBoundPorts)init
{
  return [(VisionCoreE5RTExecutionBoundPorts *)self initWithCapacity:8];
}

@end
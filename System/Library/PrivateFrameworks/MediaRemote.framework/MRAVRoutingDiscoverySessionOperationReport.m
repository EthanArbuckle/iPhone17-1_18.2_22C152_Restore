@interface MRAVRoutingDiscoverySessionOperationReport
- (NSArray)discoveredOutputDeviceUIDs;
- (NSArray)undiscoveredOutputDeviceUIDs;
- (NSError)error;
- (id)description;
- (void)setDiscoveredOutputDeviceUIDs:(id)a3;
- (void)setError:(id)a3;
- (void)setUndiscoveredOutputDeviceUIDs:(id)a3;
@end

@implementation MRAVRoutingDiscoverySessionOperationReport

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"\n%@\n", objc_opt_class()];
  [v3 appendFormat:@"_________________________\n"];
  if ([(NSArray *)self->_discoveredOutputDeviceUIDs count]) {
    [v3 appendFormat:@"Discovered %lu device(s)s: %@\n", -[NSArray count](self->_discoveredOutputDeviceUIDs, "count"), self->_discoveredOutputDeviceUIDs];
  }
  if ([(NSArray *)self->_undiscoveredOutputDeviceUIDs count]) {
    [v3 appendFormat:@"Undiscovered %lu device(s): %@", -[NSArray count](self->_undiscoveredOutputDeviceUIDs, "count"), self->_undiscoveredOutputDeviceUIDs];
  }

  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)discoveredOutputDeviceUIDs
{
  return self->_discoveredOutputDeviceUIDs;
}

- (void)setDiscoveredOutputDeviceUIDs:(id)a3
{
}

- (NSArray)undiscoveredOutputDeviceUIDs
{
  return self->_undiscoveredOutputDeviceUIDs;
}

- (void)setUndiscoveredOutputDeviceUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undiscoveredOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_discoveredOutputDeviceUIDs, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end
@interface NAFConnectionAvailabilityObserver
- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4;
@end

@implementation NAFConnectionAvailabilityObserver

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
}

void __69__NAFConnectionAvailabilityObserver_networkAvailability_isAvailable___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AFNetworkAvailabilityDidChangeNotification" object:0];
}

@end
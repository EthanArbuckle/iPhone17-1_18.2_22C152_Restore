@interface STConcreteDowntimeService
- (STDowntimeServiceDelegate)delegate;
- (void)isDowntimeEnabledForUserID:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4;
@end

@implementation STConcreteDowntimeService

- (void)isDowntimeEnabledForUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteDowntimeService *)self delegate];
  [v8 isDowntimeEnabledForUserID:v7 completionHandler:v6];
}

- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteDowntimeService *)self delegate];
  [v8 toggleOnDemandDowntimeForUserID:v7 completionHandler:v6];
}

- (STDowntimeServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STDowntimeServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
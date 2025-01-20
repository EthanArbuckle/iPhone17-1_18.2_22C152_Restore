@interface VSAppSettingsViewModelResult
- (NSArray)availableAppViewModels;
- (NSArray)nonChannelAppViewModels;
- (NSArray)subscribedAppViewModels;
- (VSAppSettingsViewModelResult)init;
- (void)setAvailableAppViewModels:(id)a3;
- (void)setNonChannelAppViewModels:(id)a3;
- (void)setSubscribedAppViewModels:(id)a3;
@end

@implementation VSAppSettingsViewModelResult

- (VSAppSettingsViewModelResult)init
{
  v9.receiver = self;
  v9.super_class = (Class)VSAppSettingsViewModelResult;
  v2 = [(VSAppSettingsViewModelResult *)&v9 init];
  v3 = v2;
  if (v2)
  {
    availableAppViewModels = v2->_availableAppViewModels;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_availableAppViewModels = (NSArray *)MEMORY[0x263EFFA68];

    nonChannelAppViewModels = v3->_nonChannelAppViewModels;
    v3->_nonChannelAppViewModels = v5;

    subscribedAppViewModels = v3->_subscribedAppViewModels;
    v3->_subscribedAppViewModels = v5;
  }
  return v3;
}

- (NSArray)availableAppViewModels
{
  return self->_availableAppViewModels;
}

- (void)setAvailableAppViewModels:(id)a3
{
}

- (NSArray)nonChannelAppViewModels
{
  return self->_nonChannelAppViewModels;
}

- (void)setNonChannelAppViewModels:(id)a3
{
}

- (NSArray)subscribedAppViewModels
{
  return self->_subscribedAppViewModels;
}

- (void)setSubscribedAppViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedAppViewModels, 0);
  objc_storeStrong((id *)&self->_nonChannelAppViewModels, 0);
  objc_storeStrong((id *)&self->_availableAppViewModels, 0);
}

@end
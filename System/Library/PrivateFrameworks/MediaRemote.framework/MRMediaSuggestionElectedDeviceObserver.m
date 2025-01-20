@interface MRMediaSuggestionElectedDeviceObserver
- (MRMediaSuggestionElectedDeviceObserver)initWithDelegate:(id)a3;
- (MRMediaSuggestionElectedDeviceObserverDelegate)delegate;
- (NSString)electedDeviceIdentifier;
- (void)deviceAvailableForMediaSuggestionsNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRMediaSuggestionElectedDeviceObserver

- (MRMediaSuggestionElectedDeviceObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRMediaSuggestionElectedDeviceObserver;
  v5 = [(MRMediaSuggestionElectedDeviceObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)start
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_deviceAvailableForMediaSuggestionsNotification_ name:@"_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification" object:0];

  MRMediaRemoteSetWantsRouteChangeNotifications(1);
}

- (void)stop
{
  MRMediaRemoteSetWantsRouteChangeNotifications(0);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification" object:0];
}

- (void)deviceAvailableForMediaSuggestionsNotification:(id)a3
{
  id v4 = [a3 userInfo];
  v13 = [v4 objectForKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];

  v5 = self->_electedDeviceIdentifier;
  v6 = v13;
  if (v5 == v13) {
    goto LABEL_5;
  }
  v7 = v5;
  char v8 = [(NSString *)v5 isEqual:v13];

  if ((v8 & 1) == 0)
  {
    v9 = (NSString *)[(NSString *)v13 copy];
    electedDeviceIdentifier = self->_electedDeviceIdentifier;
    self->_electedDeviceIdentifier = v9;

    v11 = [(MRMediaSuggestionElectedDeviceObserver *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v6 = [(MRMediaSuggestionElectedDeviceObserver *)self delegate];
      [v6 mediaSuggestionElectedDeviceObserverDeviceDidChange:self];
LABEL_5:
    }
  }
}

- (MRMediaSuggestionElectedDeviceObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRMediaSuggestionElectedDeviceObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)electedDeviceIdentifier
{
  return self->_electedDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electedDeviceIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
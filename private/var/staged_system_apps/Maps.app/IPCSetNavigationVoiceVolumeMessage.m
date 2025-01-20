@interface IPCSetNavigationVoiceVolumeMessage
- (IPCSetNavigationVoiceVolumeMessage)initWithDictionary:(id)a3;
- (NSString)requestedVolume;
- (id)description;
- (id)dictionaryValue;
- (void)setRequestedVolume:(id)a3;
@end

@implementation IPCSetNavigationVoiceVolumeMessage

- (IPCSetNavigationVoiceVolumeMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v5 = [(IPCMessageObject *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCSetNavigationVoiceVolumeMessageRequestedVolumeKey"];
    [(IPCSetNavigationVoiceVolumeMessage *)v5 setRequestedVolume:v6];
  }
  return v5;
}

- (id)dictionaryValue
{
  v9.receiver = self;
  v9.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v3 = [(IPCMessageObject *)&v9 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = [(IPCSetNavigationVoiceVolumeMessage *)self requestedVolume];
  id v6 = [v5 copy];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCSetNavigationVoiceVolumeMessageRequestedVolumeKey"];

  id v7 = [v4 copy];

  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v3 = [(IPCSetNavigationVoiceVolumeMessage *)&v7 description];
  id v4 = [(IPCSetNavigationVoiceVolumeMessage *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (NSString)requestedVolume
{
  return self->_requestedVolume;
}

- (void)setRequestedVolume:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
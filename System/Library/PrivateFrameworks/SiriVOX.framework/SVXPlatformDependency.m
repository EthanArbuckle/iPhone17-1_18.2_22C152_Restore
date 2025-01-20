@interface SVXPlatformDependency
- (SVXAudioPowerUpdateListening)audioPowerUpdateListener;
- (SVXAudioStreamingListening)audioStreamingListener;
- (SVXClientAudioSystemServicing)clientAudioSystemService;
- (SVXPlatformDependency)initWithAudioPowerUpdateListener:(id)a3;
- (SVXPlatformDependency)initWithAudioStreamingListener:(id)a3;
- (SVXPlatformDependency)initWithClientAudioSystemService:(id)a3;
- (SVXPlatformDependency)initWithServiceCommandHandler:(id)a3;
- (SVXPlatformDependency)initWithSessionActivityListener:(id)a3;
- (SVXPlatformDependency)initWithSiriModesManager:(id)a3;
- (SVXPlatformDependency)initWithSpeechSynthesisListener:(id)a3;
- (SVXServiceCommandHandling)serviceCommandHandler;
- (SVXSessionActivityListening)activityListener;
- (SVXSiriModesManaging)siriModesManager;
- (SVXSpeechSynthesisListening)speechSynthesisListener;
- (int64_t)type;
@end

@implementation SVXPlatformDependency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAudioSystemService, 0);
  objc_storeStrong((id *)&self->_speechSynthesisListener, 0);
  objc_storeStrong((id *)&self->_audioStreamingListener, 0);
  objc_storeStrong((id *)&self->_siriModesManager, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdateListener, 0);
  objc_storeStrong((id *)&self->_activityListener, 0);

  objc_storeStrong((id *)&self->_serviceCommandHandler, 0);
}

- (SVXClientAudioSystemServicing)clientAudioSystemService
{
  return self->_clientAudioSystemService;
}

- (SVXSpeechSynthesisListening)speechSynthesisListener
{
  return self->_speechSynthesisListener;
}

- (SVXAudioStreamingListening)audioStreamingListener
{
  return self->_audioStreamingListener;
}

- (SVXSiriModesManaging)siriModesManager
{
  return self->_siriModesManager;
}

- (SVXAudioPowerUpdateListening)audioPowerUpdateListener
{
  return self->_audioPowerUpdateListener;
}

- (SVXSessionActivityListening)activityListener
{
  return self->_activityListener;
}

- (SVXServiceCommandHandling)serviceCommandHandler
{
  return self->_serviceCommandHandler;
}

- (int64_t)type
{
  return self->_type;
}

- (SVXPlatformDependency)initWithClientAudioSystemService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 7;
    objc_storeStrong((id *)&v6->_clientAudioSystemService, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithSpeechSynthesisListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 6;
    objc_storeStrong((id *)&v6->_speechSynthesisListener, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithAudioStreamingListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 5;
    objc_storeStrong((id *)&v6->_audioStreamingListener, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithSiriModesManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_siriModesManager, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithAudioPowerUpdateListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_audioPowerUpdateListener, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithSessionActivityListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_activityListener, a3);
  }

  return v7;
}

- (SVXPlatformDependency)initWithServiceCommandHandler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPlatformDependency;
  v6 = [(SVXPlatformDependency *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_serviceCommandHandler, a3);
  }

  return v7;
}

@end
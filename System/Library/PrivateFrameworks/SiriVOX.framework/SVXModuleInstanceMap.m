@interface SVXModuleInstanceMap
- (NSDictionary)dictionaryRepresentation;
- (SVXClientServiceServer)clientServiceServer;
- (SVXDeviceSetupManager)deviceSetupManager;
- (SVXModuleInstanceMap)initWithDictionaryRepresentation:(id)a3;
- (SVXServiceCommandHandler)serviceCommandHandler;
- (SVXSessionManager)sessionManager;
- (SVXSpeechSynthesizer)speechSynthesizer;
- (SVXSynthesisManager)synthesisManager;
- (SVXSystemObserver)systemObserver;
- (id)moduleInstanceWithIdentifier:(id)a3;
@end

@implementation SVXModuleInstanceMap

- (void).cxx_destruct
{
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (SVXSystemObserver)systemObserver
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.system-observation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.system-observation"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXSystemObserver *)v4;
}

- (SVXSpeechSynthesizer)speechSynthesizer
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.speech-synthesis"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.speech-synthesis"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXSpeechSynthesizer *)v4;
}

- (SVXSessionManager)sessionManager
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.session-manager"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.session-manager"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXSessionManager *)v4;
}

- (SVXServiceCommandHandler)serviceCommandHandler
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.service-command"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.service-command"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXServiceCommandHandler *)v4;
}

- (SVXClientServiceServer)clientServiceServer
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.client-service"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.client-service"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXClientServiceServer *)v4;
}

- (SVXSynthesisManager)synthesisManager
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.synthesis-manager"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.synthesis-manager"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXSynthesisManager *)v4;
}

- (SVXDeviceSetupManager)deviceSetupManager
{
  v3 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.device-setup"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:@"com.apple.SiriVOXService.device-setup"];
  }
  else
  {
    v4 = 0;
  }

  return (SVXDeviceSetupManager *)v4;
}

- (id)moduleInstanceWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_dictionaryRepresentation objectForKey:a3];
}

- (SVXModuleInstanceMap)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXModuleInstanceMap;
  v5 = [(SVXModuleInstanceMap *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

@end
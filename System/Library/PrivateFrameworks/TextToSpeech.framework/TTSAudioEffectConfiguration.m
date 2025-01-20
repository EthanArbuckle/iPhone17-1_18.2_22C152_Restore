@interface TTSAudioEffectConfiguration
- (BOOL)enabled;
- (NSDictionary)parameters;
- (NSDictionary)properties;
- (NSString)effectName;
- (NSUUID)identifier;
- (void)setEffectName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation TTSAudioEffectConfiguration

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)effectName
{
  return self->_effectName;
}

- (void)setEffectName:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_effectName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
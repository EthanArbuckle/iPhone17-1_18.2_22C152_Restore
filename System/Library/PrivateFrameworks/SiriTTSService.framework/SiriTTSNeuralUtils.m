@interface SiriTTSNeuralUtils
+ (BOOL)compileANEModel:(id)a3 error:(id *)a4;
+ (BOOL)hasAMX;
+ (BOOL)hasANE;
+ (BOOL)isANEModelCompiled:(id)a3;
+ (BOOL)isANEOnly;
+ (BOOL)isH12Platform;
+ (BOOL)isNaturalPlatform;
+ (BOOL)isNeuralPlatform;
+ (BOOL)isNeuralVoiceReady:(id)a3;
+ (BOOL)shouldUseNeuralVoice:(id)a3;
+ (float)currentSampleRate:(id)a3;
@end

@implementation SiriTTSNeuralUtils

+ (BOOL)compileANEModel:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (NeuralTTSUtils *)[v4 UTF8String];
  NeuralTTSUtils::compile_ane_model(v5, v6);

  return 1;
}

+ (BOOL)isANEModelCompiled:(id)a3
{
  id v3 = a3;
  id v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char is_ane_model_compiled = NeuralTTSUtils::is_ane_model_compiled(v4, v5);

  return is_ane_model_compiled;
}

+ (float)currentSampleRate:(id)a3
{
  id v3 = a3;
  id v4 = (NeuralTTSUtils *)[v3 UTF8String];
  NeuralTTSUtils::current_model_sample_rate(v4, v5);
  float v7 = v6;

  return v7;
}

+ (BOOL)shouldUseNeuralVoice:(id)a3
{
  id v3 = a3;
  id v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char should_use_neural_voice = NeuralTTSUtils::should_use_neural_voice(v4, v5);

  return should_use_neural_voice;
}

+ (BOOL)isNeuralVoiceReady:(id)a3
{
  id v3 = a3;
  id v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char is_neural_voice_ready = NeuralTTSUtils::is_neural_voice_ready(v4, v5);

  return is_neural_voice_ready;
}

+ (BOOL)isH12Platform
{
  return MEMORY[0x1F415A8D8](a1, a2);
}

+ (BOOL)isNaturalPlatform
{
  return MEMORY[0x1F415A918](a1, a2);
}

+ (BOOL)isNeuralPlatform
{
  return MEMORY[0x1F415A910](a1, a2);
}

+ (BOOL)isANEOnly
{
  return MEMORY[0x1F415A8F8](a1, a2);
}

+ (BOOL)hasANE
{
  return MEMORY[0x1F415A8E8](a1, a2);
}

+ (BOOL)hasAMX
{
  return MEMORY[0x1F415A8E0](a1, a2);
}

@end
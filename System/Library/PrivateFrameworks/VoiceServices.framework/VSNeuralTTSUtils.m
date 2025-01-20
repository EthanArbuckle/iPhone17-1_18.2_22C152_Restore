@interface VSNeuralTTSUtils
+ (BOOL)hasAMX;
+ (BOOL)hasANE;
+ (BOOL)hasCompactNeuralFallback:(id)a3;
+ (BOOL)hasOTAANEModel:(id)a3;
+ (BOOL)isANECompilationPlatform;
+ (BOOL)isANEModelCompiled:(id)a3;
+ (BOOL)isNeuralFallbackCondition;
+ (BOOL)isNeuralTTSPlatform;
+ (BOOL)isNeuralVoiceReady:(id)a3;
+ (BOOL)shouldUseNeuralVoice:(id)a3;
+ (void)compileANEModel:(id)a3;
@end

@implementation VSNeuralTTSUtils

+ (BOOL)isANECompilationPlatform
{
  return MEMORY[0x270F71E48](a1, a2);
}

+ (BOOL)isNeuralTTSPlatform
{
  return MEMORY[0x270F71E60](a1, a2);
}

+ (void)compileANEModel:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  NeuralTTSUtils::compile_ane_model(v4, v5);
}

+ (BOOL)isANEModelCompiled:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char is_ane_model_compiled = NeuralTTSUtils::is_ane_model_compiled(v4, v5);

  return is_ane_model_compiled;
}

+ (BOOL)hasOTAANEModel:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char has_ota_ane_model = NeuralTTSUtils::has_ota_ane_model(v4, v5);

  return has_ota_ane_model;
}

+ (BOOL)isNeuralFallbackCondition
{
  return NeuralTTSUtils::check_thermal_critical_conditions((NeuralTTSUtils *)a1);
}

+ (BOOL)hasCompactNeuralFallback:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char has_compact_neural_fallback = NeuralTTSUtils::has_compact_neural_fallback(v4, v5);

  return has_compact_neural_fallback;
}

+ (BOOL)shouldUseNeuralVoice:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char should_use_neural_voice = NeuralTTSUtils::should_use_neural_voice(v4, v5);

  return should_use_neural_voice;
}

+ (BOOL)isNeuralVoiceReady:(id)a3
{
  id v3 = a3;
  v4 = (NeuralTTSUtils *)[v3 UTF8String];
  char is_neural_voice_ready = NeuralTTSUtils::is_neural_voice_ready(v4, v5);

  return is_neural_voice_ready;
}

+ (BOOL)hasANE
{
  return MEMORY[0x270F71E30](a1, a2);
}

+ (BOOL)hasAMX
{
  return MEMORY[0x270F71E28](a1, a2);
}

@end
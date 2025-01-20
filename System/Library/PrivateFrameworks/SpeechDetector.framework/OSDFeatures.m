@interface OSDFeatures
- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6;
- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6 inferenceTime:(unint64_t)a7;
- (double)processedAudioMs;
- (double)silenceDurationMs;
- (double)silenceFramesCountMs;
- (double)silenceProbability;
- (id)description;
- (unint64_t)inferenceTime;
@end

@implementation OSDFeatures

- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)OSDFeatures;
  result = [(OSDFeatures *)&v11 init];
  if (result)
  {
    result->_silenceFramesCountMs = a3;
    result->_silenceProbability = a4;
    result->_silenceDurationMs = a5;
    result->_processedAudioMs = a6;
  }
  return result;
}

- (unint64_t)inferenceTime
{
  return self->_inferenceTime;
}

- (double)processedAudioMs
{
  return self->_processedAudioMs;
}

- (double)silenceDurationMs
{
  return self->_silenceDurationMs;
}

- (double)silenceProbability
{
  return self->_silenceProbability;
}

- (double)silenceFramesCountMs
{
  return self->_silenceFramesCountMs;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"[silenceFramesCountMs = %f]", *(void *)&self->_silenceFramesCountMs);
  objc_msgSend(v3, "appendFormat:", @"[silenceProbability = %f]", *(void *)&self->_silenceProbability);
  objc_msgSend(v3, "appendFormat:", @"[silenceDurationMs = %f]", *(void *)&self->_silenceDurationMs);
  objc_msgSend(v3, "appendFormat:", @"[processedAudioMs = %f]", *(void *)&self->_processedAudioMs);
  return v3;
}

- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6 inferenceTime:(unint64_t)a7
{
  self->_inferenceTime = a7;
  return [(OSDFeatures *)self initWithSilenceFramesCountMs:a3 silenceProbability:a4 silenceDurationMs:a5 processedAudioMs:a6];
}

@end
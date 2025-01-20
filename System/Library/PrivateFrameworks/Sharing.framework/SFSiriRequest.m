@interface SFSiriRequest
- (BOOL)synthesizing;
- (VSSpeechRequest)speechSynthesisRequest;
- (VSSpeechRequest)speechUtteranceRequest;
- (double)delaySecs;
- (id)owner;
- (id)speechCompletion;
- (id)speechStartHandler;
- (unint64_t)startTicks;
- (unsigned)flags;
- (void)setDelaySecs:(double)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setSpeechCompletion:(id)a3;
- (void)setSpeechStartHandler:(id)a3;
- (void)setSpeechSynthesisRequest:(id)a3;
- (void)setSpeechUtteranceRequest:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setSynthesizing:(BOOL)a3;
@end

@implementation SFSiriRequest

- (double)delaySecs
{
  return self->_delaySecs;
}

- (void)setDelaySecs:(double)a3
{
  self->_delaySecs = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (id)speechCompletion
{
  return self->_speechCompletion;
}

- (void)setSpeechCompletion:(id)a3
{
}

- (id)speechStartHandler
{
  return self->_speechStartHandler;
}

- (void)setSpeechStartHandler:(id)a3
{
}

- (VSSpeechRequest)speechSynthesisRequest
{
  return self->_speechSynthesisRequest;
}

- (void)setSpeechSynthesisRequest:(id)a3
{
}

- (VSSpeechRequest)speechUtteranceRequest
{
  return self->_speechUtteranceRequest;
}

- (void)setSpeechUtteranceRequest:(id)a3
{
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (BOOL)synthesizing
{
  return self->_synthesizing;
}

- (void)setSynthesizing:(BOOL)a3
{
  self->_synthesizing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechUtteranceRequest, 0);
  objc_storeStrong((id *)&self->_speechSynthesisRequest, 0);
  objc_storeStrong(&self->_speechStartHandler, 0);
  objc_storeStrong(&self->_speechCompletion, 0);

  objc_storeStrong(&self->_owner, 0);
}

@end
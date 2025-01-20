@interface VMSpeechRecognitionRequestOperation
- (BOOL)forceOfflineRecognition;
- (VMSpeechRecognitionRequest)speechRecognitionRequest;
- (VMSpeechRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3;
- (VMSpeechRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechRecognitionRequest:(id)a4;
- (void)setForceOfflineRecognition:(BOOL)a3;
- (void)setSpeechRecognitionRequest:(id)a3;
@end

@implementation VMSpeechRecognitionRequestOperation

- (VMSpeechRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SFSpeechRecognitionRequest);
  v6 = [(VMSpeechRecognitionRequestOperation *)self initWithSpeechRecognizer:v4 speechRecognitionRequest:v5];

  return v6;
}

- (VMSpeechRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechRecognitionRequest:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VMSpeechRecognitionRequestOperation;
  v8 = [(VMSpeechRecognizerOperation *)&v11 initWithSpeechRecognizer:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_speechRecognitionRequest, a4);
    [(VMSpeechRecognitionRequest *)v9->_speechRecognitionRequest setTaskHint:1002];
  }

  return v9;
}

- (BOOL)forceOfflineRecognition
{
  return self->_forceOfflineRecognition;
}

- (void)setForceOfflineRecognition:(BOOL)a3
{
  self->_forceOfflineRecognition = a3;
}

- (VMSpeechRecognitionRequest)speechRecognitionRequest
{
  return (VMSpeechRecognitionRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSpeechRecognitionRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
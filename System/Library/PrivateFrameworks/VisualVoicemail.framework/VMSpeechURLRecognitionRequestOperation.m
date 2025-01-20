@interface VMSpeechURLRecognitionRequestOperation
- (BOOL)forceOfflineRecognition;
- (VMSpeechURLRecognitionRequestOperation)initWithLocale:(id)a3;
- (VMSpeechURLRecognitionRequestOperation)initWithLocale:(id)a3 URL:(id)a4;
- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3;
- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechRecognitionRequest:(id)a4;
- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechURLRecognitionRequest:(id)a4;
- (id)URL;
- (id)speechURLRecognitionRequest;
- (void)setForceOfflineRecognition:(BOOL)a3;
@end

@implementation VMSpeechURLRecognitionRequestOperation

- (VMSpeechURLRecognitionRequestOperation)initWithLocale:(id)a3
{
  return 0;
}

- (VMSpeechURLRecognitionRequestOperation)initWithLocale:(id)a3 URL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)SFSpeechRecognizer) initWithLocale:v7];

  if (v8)
  {
    id v9 = [objc_alloc((Class)SFSpeechURLRecognitionRequest) initWithURL:v6];
    self = [(VMSpeechURLRecognitionRequestOperation *)self initWithSpeechRecognizer:v8 speechURLRecognitionRequest:v9];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3
{
  return 0;
}

- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechRecognitionRequest:(id)a4
{
  return 0;
}

- (VMSpeechURLRecognitionRequestOperation)initWithSpeechRecognizer:(id)a3 speechURLRecognitionRequest:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VMSpeechURLRecognitionRequestOperation;
  return [(VMSpeechRecognitionRequestOperation *)&v5 initWithSpeechRecognizer:a3 speechRecognitionRequest:a4];
}

- (id)speechURLRecognitionRequest
{
  v3 = [(VMSpeechRecognitionRequestOperation *)self speechRecognitionRequest];

  if (v3)
  {
    v4 = [(VMSpeechRecognitionRequestOperation *)self speechRecognitionRequest];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)forceOfflineRecognition
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(VMSpeechRecognitionRequestOperation *)v2 speechRecognitionRequest];
  unsigned __int8 v4 = [v3 _forceOfflineRecognition];

  objc_sync_exit(v2);
  return v4;
}

- (void)setForceOfflineRecognition:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  unsigned __int8 v4 = [(VMSpeechRecognitionRequestOperation *)obj speechRecognitionRequest];
  [v4 _setForceOfflineRecognition:v3];

  objc_sync_exit(obj);
}

- (id)URL
{
  v2 = [(VMSpeechURLRecognitionRequestOperation *)self speechURLRecognitionRequest];
  BOOL v3 = [v2 URL];

  return v3;
}

@end
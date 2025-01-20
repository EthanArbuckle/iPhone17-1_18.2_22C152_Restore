@interface SRUIFSpeechRecognitionHypothesis
- (AFUserUtterance)userUtterance;
- (AceObject)backingAceObject;
- (BOOL)isFinal;
- (SRUIFSpeechRecognitionHypothesis)initWithUserUtterance:(id)a3 backingAceObject:(id)a4 isFinal:(BOOL)a5;
- (id)description;
@end

@implementation SRUIFSpeechRecognitionHypothesis

- (SRUIFSpeechRecognitionHypothesis)initWithUserUtterance:(id)a3 backingAceObject:(id)a4 isFinal:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFSpeechRecognitionHypothesis;
  v11 = [(SRUIFSpeechRecognitionHypothesis *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userUtterance, a3);
    v12->_final = a5;
    objc_storeStrong((id *)&v12->_backingAceObject, a4);
  }

  return v12;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p:", objc_opt_class(), self];
  [v3 appendString:@" userUtterance="];
  v4 = [(SRUIFSpeechRecognitionHypothesis *)self userUtterance];
  v5 = [v4 description];
  [v3 appendString:v5];

  [v3 appendString:@"; isFinal="];
  if ([(SRUIFSpeechRecognitionHypothesis *)self isFinal]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendString:v6];
  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (AFUserUtterance)userUtterance
{
  return self->_userUtterance;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (AceObject)backingAceObject
{
  return self->_backingAceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAceObject, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
}

@end
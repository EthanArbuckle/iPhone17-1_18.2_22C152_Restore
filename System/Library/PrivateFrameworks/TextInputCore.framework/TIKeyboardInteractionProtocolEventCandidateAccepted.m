@interface TIKeyboardInteractionProtocolEventCandidateAccepted
+ (BOOL)supportsSecureCoding;
- (BOOL)predictionBarHit;
- (BOOL)useCandidateSelection;
- (NSString)context;
- (NSString)description;
- (NSString)inputStem;
- (TIDocumentState)documentState;
- (TIKeyboardCandidate)candWord;
- (TIKeyboardInput)input;
- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCandidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11;
- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCoder:(id)a3;
- (int64_t)candidateIndex;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventCandidateAccepted

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStem, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_input, 0);

  objc_storeStrong((id *)&self->_candWord, 0);
}

- (int64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (BOOL)useCandidateSelection
{
  return self->_useCandidateSelection;
}

- (BOOL)predictionBarHit
{
  return self->_predictionBarHit;
}

- (NSString)inputStem
{
  return self->_inputStem;
}

- (NSString)context
{
  return self->_context;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (TIKeyboardCandidate)candWord
{
  return self->_candWord;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(TIKeyboardCandidate *)self->_candWord candidate];
  v4 = [v2 stringWithFormat:@"<Candidates accepted: %@>", v3];

  return (NSString *)v4;
}

- (void)sendTo:(id)a3
{
  candWord = self->_candWord;
  input = self->_input;
  documentState = self->_documentState;
  context = self->_context;
  inputStem = self->_inputStem;
  BOOL predictionBarHit = self->_predictionBarHit;
  BOOL useCandidateSelection = self->_useCandidateSelection;
  int64_t candidateIndex = self->_candidateIndex;
  id v12 = a3;
  id v14 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  LOBYTE(v13) = useCandidateSelection;
  [v12 candidateAccepted:candWord withInput:input documentState:documentState inputContext:context inputStem:inputStem predictionBarHit:predictionBarHit useCandidateSelection:v13 candidateIndex:candidateIndex keyboardState:v14];
}

- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  v5 = [(TIKeyboardInteractionProtocolBase *)&v34 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candWord"];
    candWord = v5->_candWord;
    v5->_candWord = (TIKeyboardCandidate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    input = v5->_input;
    v5->_input = (TIKeyboardInput *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputStem"];
    inputStem = v5->_inputStem;
    v5->_inputStem = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionBarHit"];
    v5->_BOOL predictionBarHit = [v16 BOOLValue];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCandidateSelection"];
    v5->_BOOL useCandidateSelection = [v17 BOOLValue];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateIndex"];
    v5->_int64_t candidateIndex = [v18 integerValue];
  }
  v19 = v5->_candWord;
  if (v19)
  {
    int v20 = [(TIKeyboardCandidate *)v19 usageTrackingMask];
    unsigned int v21 = [(TIKeyboardCandidate *)v5->_candWord sourceMask];
    if ((v20 & 0x40000) != 0) {
      int v22 = 0x20000;
    }
    else {
      int v22 = 0x8000;
    }
    unsigned int v23 = v21 & 0xFFFFFFFE | v22;
    if ((v20 & 0x40000) != 0) {
      int v24 = 0x40000;
    }
    else {
      int v24 = 0x10000;
    }
    if ((v21 & 1) == 0) {
      unsigned int v23 = v21;
    }
    unsigned int v25 = v23 & 0xFFFFFFFD | v24;
    if ((v23 & 2) != 0) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = v23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v27 = v26 | 4;
    }
    else {
      int v27 = v26;
    }
    if ([(TIKeyboardCandidate *)v5->_candWord isResponseKitCandidate]) {
      unsigned int v28 = v27 | 0x2000;
    }
    else {
      unsigned int v28 = v27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [(TIKeyboardCandidate *)v5->_candWord proactiveTrigger];

      if (v29) {
        v28 |= 0x40u;
      }
    }
    v30 = [(TIKeyboardCandidate *)v5->_candWord candidate];
    int v31 = [v30 _containsEmoji];

    if (v31) {
      uint64_t v32 = v28 | 0x4000;
    }
    else {
      uint64_t v32 = v28;
    }
    [(TIKeyboardCandidate *)v5->_candWord setSourceMask:v32];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candWord, @"candWord", v8.receiver, v8.super_class);
  [v4 encodeObject:self->_input forKey:@"input"];
  [v4 encodeObject:self->_documentState forKey:@"documentState"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_inputStem forKey:@"inputStem"];
  v5 = [NSNumber numberWithBool:self->_predictionBarHit];
  [v4 encodeObject:v5 forKey:@"predictionBarHit"];

  uint64_t v6 = [NSNumber numberWithBool:self->_useCandidateSelection];
  [v4 encodeObject:v6 forKey:@"useCandidateSelection"];

  v7 = [NSNumber numberWithInteger:self->_candidateIndex];
  [v4 encodeObject:v7 forKey:@"candidateIndex"];
}

- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCandidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  id v17 = a3;
  id v25 = a4;
  id v24 = a5;
  id v18 = a6;
  id v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  int v20 = [(TIKeyboardInteractionProtocolBase *)&v26 initWithKeyboardState:a11];
  unsigned int v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_candWord, a3);
    objc_storeStrong((id *)&v21->_input, a4);
    objc_storeStrong((id *)&v21->_documentState, a5);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_inputStem, a7);
    v21->_BOOL predictionBarHit = a8;
    v21->_BOOL useCandidateSelection = a9;
    v21->_int64_t candidateIndex = a10;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface SiriSharedUICompactViewModel
- (NSArray)additionalPlatterTranscriptItems;
- (NSArray)conversationTranscriptItems;
- (NSArray)resultTranscriptItems;
- (NSArray)serverUtterances;
- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis;
- (SiriSharedUICompactViewModel)init;
- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8;
- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 speechRecognitionHypothesis:(id)a4;
- (SiriSharedUILatencyViewModel)latencyViewModel;
- (id)_copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewUtterance:(id)a9;
- (id)_initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewModel:(id)a9;
- (id)copyWithAdditionalPlatterTranscriptItems:(id)a3;
- (id)copyWithConversationTranscriptItems:(id)a3 serverUtterances:(id)a4 speechRecognitionHypothesis:(id)a5 latencyViewUtterance:(id)a6;
- (id)copyWithInputType:(int64_t)a3;
- (id)copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6 speechRecognitionHypothesis:(id)a7;
- (id)copyWithLatencyIntentSummary:(id)a3;
- (id)copyWithLatencyViewModel:(id)a3;
- (id)copyWithResultTranscriptItems:(id)a3;
- (id)copyWithResultTranscriptItems:(id)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 speechRecognitionHypothesis:(id)a6;
- (id)copyWithServerUtterances:(id)a3 speechRecognitionHypothesis:(id)a4 latencyViewUtterance:(id)a5;
- (id)copyWithSpeechRecognitionHypothesis:(id)a3;
- (id)description;
- (int64_t)inputType;
@end

@implementation SiriSharedUICompactViewModel

- (id)_initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewModel:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v34.receiver = self;
  v34.super_class = (Class)SiriSharedUICompactViewModel;
  v21 = [(SiriSharedUICompactViewModel *)&v34 init];
  v22 = v21;
  if (v21)
  {
    v21->_inputType = a3;
    uint64_t v23 = [v15 copy];
    resultTranscriptItems = v22->_resultTranscriptItems;
    v22->_resultTranscriptItems = (NSArray *)v23;

    uint64_t v25 = [v16 copy];
    conversationTranscriptItems = v22->_conversationTranscriptItems;
    v22->_conversationTranscriptItems = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    additionalPlatterTranscriptItems = v22->_additionalPlatterTranscriptItems;
    v22->_additionalPlatterTranscriptItems = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    serverUtterances = v22->_serverUtterances;
    v22->_serverUtterances = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    speechRecognitionHypothesis = v22->_speechRecognitionHypothesis;
    v22->_speechRecognitionHypothesis = (SRUIFSpeechRecognitionHypothesis *)v31;

    objc_storeStrong((id *)&v22->_latencyViewModel, a9);
  }

  return v22;
}

- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [[SiriSharedUILatencyViewModel alloc] initWithUserUtterance:0 shouldSuppress:0];
  id v20 = [(SiriSharedUICompactViewModel *)self _initWithInputType:a3 resultTranscriptItems:v18 conversationTranscriptItems:v17 additionalPlatterTranscriptItems:v16 serverUtterances:v15 speechRecognitionHypothesis:v14 latencyViewModel:v19];

  return v20;
}

- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 speechRecognitionHypothesis:(id)a4
{
  return [(SiriSharedUICompactViewModel *)self initWithInputType:a3 resultTranscriptItems:MEMORY[0x263EFFA68] conversationTranscriptItems:MEMORY[0x263EFFA68] additionalPlatterTranscriptItems:MEMORY[0x263EFFA68] serverUtterances:MEMORY[0x263EFFA68] speechRecognitionHypothesis:a4];
}

- (SiriSharedUICompactViewModel)init
{
  return [(SiriSharedUICompactViewModel *)self initWithInputType:0 resultTranscriptItems:MEMORY[0x263EFFA68] conversationTranscriptItems:MEMORY[0x263EFFA68] additionalPlatterTranscriptItems:MEMORY[0x263EFFA68] serverUtterances:MEMORY[0x263EFFA68] speechRecognitionHypothesis:0];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p:", objc_opt_class(), self];
  [v3 appendString:@" inputType="];
  v4 = SiriSharedUIViewModelInputTypeGetDescription([(SiriSharedUICompactViewModel *)self inputType]);
  [v3 appendString:v4];

  [v3 appendString:@" resultTranscriptItems="];
  v5 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  uint64_t v6 = [v5 description];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"nil";
  }
  [v3 appendString:v8];

  [v3 appendString:@"; conversationTranscriptItem="];
  v9 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  uint64_t v10 = [v9 description];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"nil";
  }
  [v3 appendString:v12];

  [v3 appendString:@"; additionalPlatterTranscriptItems="];
  v13 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  uint64_t v14 = [v13 description];
  id v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = @"nil";
  }
  [v3 appendString:v16];

  [v3 appendString:@"; serverUtterances="];
  id v17 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  uint64_t v18 = [v17 description];
  id v19 = (void *)v18;
  if (v18) {
    id v20 = (__CFString *)v18;
  }
  else {
    id v20 = @"nil";
  }
  [v3 appendString:v20];

  [v3 appendString:@"; speechRecognitionHypothesis="];
  v21 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  uint64_t v22 = [v21 description];
  uint64_t v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"nil";
  }
  [v3 appendString:v24];

  [v3 appendString:@"; latencyViewModel="];
  uint64_t v25 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  uint64_t v26 = [v25 description];
  uint64_t v27 = (void *)v26;
  if (v26) {
    v28 = (__CFString *)v26;
  }
  else {
    v28 = @"nil";
  }
  [v3 appendString:v28];

  [v3 appendString:@">"];
  uint64_t v29 = (void *)[v3 copy];

  return v29;
}

- (id)_copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewUtterance:(id)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (a3 != 1)
  {
    uint64_t v23 = 1;
    goto LABEL_22;
  }
  uint64_t v22 = [v16 count];
  if (v22)
  {
    v9 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
    if (![v16 isEqualToArray:v9])
    {
      uint64_t v23 = 1;
LABEL_21:

      goto LABEL_22;
    }
  }
  uint64_t v34 = [v17 count];
  uint64_t v35 = v22;
  if (!v34
    || ([(SiriSharedUICompactViewModel *)self conversationTranscriptItems],
        v33 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "isEqualToArray:")))
  {
    v32 = [v18 valueForKeyPath:@"@unionOfArrays.self"];
    uint64_t v31 = [v32 count];
    if (v31)
    {
      v30 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
      if ((objc_msgSend(v18, "isEqualToArray:") & 1) == 0)
      {
        uint64_t v23 = 1;
        goto LABEL_17;
      }
      if (![v19 count])
      {
        uint64_t v23 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else if (![v19 count])
    {

      uint64_t v23 = 0;
      goto LABEL_18;
    }
    uint64_t v29 = v9;
    v24 = [(SiriSharedUICompactViewModel *)self serverUtterances];
    uint64_t v23 = [v19 isEqualToArray:v24] ^ 1;

    if (v31)
    {
      v9 = v29;
      goto LABEL_17;
    }

    v9 = v29;
LABEL_18:
    if (!v34) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v23 = 1;
LABEL_19:

LABEL_20:
  if (v35) {
    goto LABEL_21;
  }
LABEL_22:
  id v25 = objc_alloc((Class)objc_opt_class());
  uint64_t v26 = [[SiriSharedUILatencyViewModel alloc] initWithUserUtterance:v21 shouldSuppress:v23];
  uint64_t v27 = (void *)[v25 _initWithInputType:a3 resultTranscriptItems:v16 conversationTranscriptItems:v17 additionalPlatterTranscriptItems:v18 serverUtterances:v19 speechRecognitionHypothesis:v20 latencyViewModel:v26];

  return v27;
}

- (id)copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6 speechRecognitionHypothesis:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v17 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v18 = [v17 userUtterance];
  id v19 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:a3 resultTranscriptItems:v15 conversationTranscriptItems:v14 additionalPlatterTranscriptItems:v16 serverUtterances:v13 speechRecognitionHypothesis:v12 latencyViewUtterance:v18];

  return v19;
}

- (id)copyWithResultTranscriptItems:(id)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 speechRecognitionHypothesis:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int64_t v14 = [(SiriSharedUICompactViewModel *)self inputType];
  id v15 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v16 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v17 = [v16 userUtterance];
  id v18 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:v14 resultTranscriptItems:v13 conversationTranscriptItems:v12 additionalPlatterTranscriptItems:v15 serverUtterances:v11 speechRecognitionHypothesis:v10 latencyViewUtterance:v17];

  return v18;
}

- (id)copyWithConversationTranscriptItems:(id)a3 serverUtterances:(id)a4 speechRecognitionHypothesis:(id)a5 latencyViewUtterance:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int64_t v14 = [(SiriSharedUICompactViewModel *)self inputType];
  id v15 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  id v16 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v17 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:v14 resultTranscriptItems:v15 conversationTranscriptItems:v13 additionalPlatterTranscriptItems:v16 serverUtterances:v12 speechRecognitionHypothesis:v11 latencyViewUtterance:v10];

  return v17;
}

- (id)copyWithInputType:(int64_t)a3
{
  v5 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  uint64_t v6 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  v7 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  v8 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  v9 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  id v10 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v11 = [v10 userUtterance];
  id v12 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:a3 resultTranscriptItems:v5 conversationTranscriptItems:v6 additionalPlatterTranscriptItems:v7 serverUtterances:v8 speechRecognitionHypothesis:v9 latencyViewUtterance:v11];

  return v12;
}

- (id)copyWithResultTranscriptItems:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SiriSharedUICompactViewModel *)self inputType];
  uint64_t v6 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  v7 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  v8 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  v9 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  id v10 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v11 = [v10 userUtterance];
  id v12 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:v5 resultTranscriptItems:v4 conversationTranscriptItems:v6 additionalPlatterTranscriptItems:v7 serverUtterances:v8 speechRecognitionHypothesis:v9 latencyViewUtterance:v11];

  return v12;
}

- (id)copyWithAdditionalPlatterTranscriptItems:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SiriSharedUICompactViewModel *)self inputType];
  uint64_t v6 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  v7 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  v8 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  v9 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  id v10 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v11 = [v10 userUtterance];
  id v12 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:v5 resultTranscriptItems:v6 conversationTranscriptItems:v7 additionalPlatterTranscriptItems:v4 serverUtterances:v8 speechRecognitionHypothesis:v9 latencyViewUtterance:v11];

  return v12;
}

- (id)copyWithSpeechRecognitionHypothesis:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(SiriSharedUICompactViewModel *)self inputType];
  v7 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  v8 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  v9 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v10 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  id v11 = [(SiriSharedUICompactViewModel *)self latencyViewModel];
  id v12 = (void *)[v5 _initWithInputType:v6 resultTranscriptItems:v7 conversationTranscriptItems:v8 additionalPlatterTranscriptItems:v9 serverUtterances:v10 speechRecognitionHypothesis:v4 latencyViewModel:v11];

  return v12;
}

- (id)copyWithServerUtterances:(id)a3 speechRecognitionHypothesis:(id)a4 latencyViewUtterance:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int64_t v11 = [(SiriSharedUICompactViewModel *)self inputType];
  id v12 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  id v13 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  int64_t v14 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v15 = [(SiriSharedUICompactViewModel *)self _copyWithInputType:v11 resultTranscriptItems:v12 conversationTranscriptItems:v13 additionalPlatterTranscriptItems:v14 serverUtterances:v10 speechRecognitionHypothesis:v9 latencyViewUtterance:v8];

  return v15;
}

- (id)copyWithLatencyViewModel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(SiriSharedUICompactViewModel *)self inputType];
  v7 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  id v8 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  id v9 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v10 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  int64_t v11 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  id v12 = (void *)[v5 _initWithInputType:v6 resultTranscriptItems:v7 conversationTranscriptItems:v8 additionalPlatterTranscriptItems:v9 serverUtterances:v10 speechRecognitionHypothesis:v11 latencyViewModel:v4];

  return v12;
}

- (id)copyWithLatencyIntentSummary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(SiriSharedUICompactViewModel *)self inputType];
  v7 = [(SiriSharedUICompactViewModel *)self resultTranscriptItems];
  id v8 = [(SiriSharedUICompactViewModel *)self conversationTranscriptItems];
  id v9 = [(SiriSharedUICompactViewModel *)self additionalPlatterTranscriptItems];
  id v10 = [(SiriSharedUICompactViewModel *)self serverUtterances];
  int64_t v11 = [(SiriSharedUICompactViewModel *)self speechRecognitionHypothesis];
  id v12 = [[SiriSharedUILatencyViewModel alloc] initWithUserUtterance:v4 shouldSuppress:0];

  id v13 = (void *)[v5 _initWithInputType:v6 resultTranscriptItems:v7 conversationTranscriptItems:v8 additionalPlatterTranscriptItems:v9 serverUtterances:v10 speechRecognitionHypothesis:v11 latencyViewModel:v12];
  return v13;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (NSArray)resultTranscriptItems
{
  return self->_resultTranscriptItems;
}

- (NSArray)conversationTranscriptItems
{
  return self->_conversationTranscriptItems;
}

- (NSArray)additionalPlatterTranscriptItems
{
  return self->_additionalPlatterTranscriptItems;
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_additionalPlatterTranscriptItems, 0);
  objc_storeStrong((id *)&self->_conversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_resultTranscriptItems, 0);
}

@end
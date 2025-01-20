@interface UPResultCandidate
+ (id)_buildCandidateEntitiesByStartIndex:(id)a3;
- (NSArray)entities;
- (NSDictionary)_candidateEntitiesByStartIndex;
- (NSNumber)calibratedProbability;
- (NSString)annotatedString;
- (NSString)intent;
- (NSString)utterance;
- (SIRINLUEXTERNALUserParse)protobufRepresentation;
- (SIRINLUUserDialogAct)task;
- (UPModelIdentifier)modelIdentifier;
- (UPResultCandidate)initWithUncalibratedProbability:(double)a3 calibratedProbability:(id)a4 utterance:(id)a5 intent:(id)a6 entities:(id)a7 modelIdentifier:(id)a8 task:(id)a9;
- (UPResultRootNode)rootNodeRepresentation;
- (UPUsoSerializer)usoSerializer;
- (double)bestAvailableProbability;
- (double)probability;
- (double)uncalibratedProbability;
- (id)_intermediateNodeRepresentations:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation UPResultCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoSerializer, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->__candidateEntitiesByStartIndex, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_calibratedProbability, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

- (UPUsoSerializer)usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)_candidateEntitiesByStartIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)entities
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)calibratedProbability
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (double)uncalibratedProbability
{
  return self->_uncalibratedProbability;
}

- (SIRINLUUserDialogAct)task
{
  return (SIRINLUUserDialogAct *)objc_getProperty(self, a2, 16, 1);
}

- (UPModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (double)bestAvailableProbability
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(UPResultCandidate *)self calibratedProbability];

  v4 = SNLPOSLoggerForCategory(3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      [(UPResultCandidate *)self uncalibratedProbability];
      uint64_t v7 = v6;
      v8 = [(UPResultCandidate *)self calibratedProbability];
      int v15 = 134218242;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1C8DA9000, v4, OS_LOG_TYPE_DEBUG, "Result candidate has uncalibrated probability %f and calibrated probability %@. Using calibrated value.", (uint8_t *)&v15, 0x16u);
    }
    v9 = [(UPResultCandidate *)self calibratedProbability];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    if (v5)
    {
      [(UPResultCandidate *)self uncalibratedProbability];
      int v15 = 134217984;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1C8DA9000, v4, OS_LOG_TYPE_DEBUG, "Result candidate has uncalibrated probability %f and no calibrated probability. Using uncalibrated value.", (uint8_t *)&v15, 0xCu);
    }

    [(UPResultCandidate *)self uncalibratedProbability];
    return v13;
  }
  return v11;
}

- (SIRINLUEXTERNALUserParse)protobufRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA29D8]);
  [(UPResultCandidate *)self bestAvailableProbability];
  objc_msgSend(v3, "setProbability:");
  v4 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v5 = (void *)MEMORY[0x1E4FA2AE8];
  uint64_t v6 = [(UPResultCandidate *)self task];
  uint64_t v7 = [v5 convertFromUserDialogAct:v6];
  v8 = [v4 arrayWithObject:v7];
  [v3 setUserDialogActs:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4FA29A8]);
  [v9 setAlgorithm:2];
  [v9 setParserId:6];
  [v3 setParser:v9];

  return (SIRINLUEXTERNALUserParse *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[UPResultCandidate allocWithZone:a3];
  [(UPResultCandidate *)self uncalibratedProbability];
  double v6 = v5;
  uint64_t v7 = [(UPResultCandidate *)self calibratedProbability];
  v8 = [(UPResultCandidate *)self utterance];
  id v9 = [(UPResultCandidate *)self intent];
  double v10 = [(UPResultCandidate *)self entities];
  double v11 = [(UPResultCandidate *)self modelIdentifier];
  uint64_t v12 = [(UPResultCandidate *)self task];
  double v13 = [(UPResultCandidate *)v4 initWithUncalibratedProbability:v7 calibratedProbability:v8 utterance:v9 intent:v10 entities:v11 modelIdentifier:v12 task:v6];

  return v13;
}

- (UPResultRootNode)rootNodeRepresentation
{
  return (UPResultRootNode *)+[UPUtilities rootNodeRepresentationForIntent:self->_intent andEntities:self->_entities];
}

- (id)_intermediateNodeRepresentations:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        double v10 = [v9 higherLevelParentLabel];
        double v11 = [v9 higherLevelChildLabel];
        uint64_t v12 = [UPResultLeafNode alloc];
        double v13 = [v9 text];
        v14 = [v9 semanticValue];
        int v15 = [(UPResultLeafNode *)v12 initWithLabel:v11 andText:v13 andSemanticValue:v14];

        uint64_t v16 = [v4 objectForKey:v10];

        if (!v16)
        {
          __int16 v17 = [MEMORY[0x1E4F1CA60] dictionary];
          [v4 setObject:v17 forKey:v10];
        }
        v18 = [v4 objectForKey:v10];
        uint64_t v19 = [v9 groupId];
        if (v19) {
          [v9 groupId];
        }
        else {
        v20 = [NSNumber numberWithLong:0x7FFFFFFFFFFFFFFFLL];
        }

        v21 = [v18 objectForKey:v20];

        if (!v21)
        {
          v22 = [MEMORY[0x1E4F1CA48] array];
          [v18 setObject:v22 forKey:v20];
        }
        v23 = [v18 objectForKey:v20];
        [v23 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v6);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v38 = v4;
  uint64_t v37 = [v38 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(v38);
        }
        uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        v27 = [v38 objectForKey:v26];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = [v27 objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * k)];
              v33 = [[UPResultIntermediateNode alloc] initWithLabel:v26 andLeafNodes:v32];
              [v24 addObject:v33];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
          }
          while (v29);
        }
      }
      uint64_t v37 = [v38 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v37);
  }

  return v24;
}

- (UPResultCandidate)initWithUncalibratedProbability:(double)a3 calibratedProbability:(id)a4 utterance:(id)a5 intent:(id)a6 entities:(id)a7 modelIdentifier:(id)a8 task:(id)a9
{
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)UPResultCandidate;
  v20 = [(UPResultCandidate *)&v28 init];
  v21 = v20;
  if (v20)
  {
    v20->_uncalibratedProbability = a3;
    objc_storeStrong((id *)&v20->_calibratedProbability, a4);
    objc_storeStrong((id *)&v21->_utterance, a5);
    objc_storeStrong((id *)&v21->_intent, a6);
    objc_storeStrong((id *)&v21->_entities, a7);
    uint64_t v22 = +[UPResultCandidate _buildCandidateEntitiesByStartIndex:v21->_entities];
    candidateEntitiesByStartIndex = v21->__candidateEntitiesByStartIndex;
    v21->__candidateEntitiesByStartIndex = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_modelIdentifier, a8);
    objc_storeStrong((id *)&v21->_task, a9);
  }

  return v21;
}

- (double)probability
{
  calibratedProbability = self->_calibratedProbability;
  if (!calibratedProbability) {
    return self->_uncalibratedProbability;
  }
  [(NSNumber *)calibratedProbability doubleValue];
  return result;
}

- (NSString)annotatedString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  NSUInteger v4 = [(NSString *)self->_utterance length];
  if (v4)
  {
    NSUInteger v5 = v4;
    NSUInteger v6 = 0;
    do
    {
      candidateEntitiesByStartIndex = self->__candidateEntitiesByStartIndex;
      v8 = [NSNumber numberWithUnsignedInteger:v6];
      id v9 = [(NSDictionary *)candidateEntitiesByStartIndex objectForKey:v8];

      if (v9)
      {
        double v10 = [v9 annotatedEntityFragmentString];
        [v3 appendString:v10];

        double v11 = [v9 text];
        uint64_t v12 = [v11 length];
      }
      else
      {
        unichar v15 = 0;
        unichar v15 = [(NSString *)self->_utterance characterAtIndex:v6];
        double v13 = [NSString stringWithCharacters:&v15 length:1];
        [v3 appendString:v13];

        uint64_t v12 = 1;
      }
      v6 += v12;
    }
    while (v6 < v5);
  }
  [v3 appendString:@"\n"];
  [v3 appendString:@"- "];
  [v3 appendString:self->_intent];
  [v3 appendString:@"\n"];
  return (NSString *)v3;
}

+ (id)_buildCandidateEntitiesByStartIndex:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  NSUInteger v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "range", (void)v13));
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
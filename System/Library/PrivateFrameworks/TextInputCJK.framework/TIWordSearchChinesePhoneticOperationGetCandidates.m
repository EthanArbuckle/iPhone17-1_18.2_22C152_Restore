@interface TIWordSearchChinesePhoneticOperationGetCandidates
- (BOOL)regenerateDisambiguationCandidates;
- (NSArray)disambiguationCandidates;
- (TIWordSearchChinesePhoneticOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 disambiguationCandidates:(id)a7 unambiguousSyllableCount:(unint64_t)a8 selectedDisambiguationCandidateIndex:(unint64_t)a9 regenerateDisambiguationCandidates:(BOOL)a10 predictionEnabled:(BOOL)a11 reanalysisMode:(BOOL)a12 target:(id)a13 action:(SEL)a14 geometryModelData:(id)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17;
- (unint64_t)disambiguatedSyllablesCount;
- (unint64_t)selectedDisambiguationCandidateIndex;
- (unint64_t)unambiguousSyllableCount;
@end

@implementation TIWordSearchChinesePhoneticOperationGetCandidates

- (void).cxx_destruct
{
}

- (BOOL)regenerateDisambiguationCandidates
{
  return self->_regenerateDisambiguationCandidates;
}

- (unint64_t)disambiguatedSyllablesCount
{
  return self->_disambiguatedSyllablesCount;
}

- (unint64_t)unambiguousSyllableCount
{
  return self->_unambiguousSyllableCount;
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (TIWordSearchChinesePhoneticOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 disambiguationCandidates:(id)a7 unambiguousSyllableCount:(unint64_t)a8 selectedDisambiguationCandidateIndex:(unint64_t)a9 regenerateDisambiguationCandidates:(BOOL)a10 predictionEnabled:(BOOL)a11 reanalysisMode:(BOOL)a12 target:(id)a13 action:(SEL)a14 geometryModelData:(id)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17
{
  id v28 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIWordSearchChinesePhoneticOperationGetCandidates;
  v22 = [(TIWordSearchOperationGetCandidates *)&v29 initWithWordSearch:a3 inputString:a4 keyboardInput:a5 segmentBreakIndex:a6 predictionEnabled:a11 reanalysisMode:a12 autocapitalizationType:0 target:a13 action:a14 geometryModelData:a15 hardwareKeyboardMode:a16 logger:a17];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_disambiguationCandidates, a7);
    v23->_unambiguousSyllableCount = a8;
    v23->_selectedDisambiguationCandidateIndex = a9;
    v23->_regenerateDisambiguationCandidates = a10;
    [(TIWordSearchOperationGetCandidates *)v23 checkForCachedResults];
  }

  return v23;
}

@end
@interface RDSAPIObjCSpeechAnalyzerTranscriptionToken
- (BOOL)appendedAutoPunctuation;
- (BOOL)hasSpaceAfter;
- (BOOL)hasSpaceBefore;
- (BOOL)isModifiedByAutoPunctuation;
- (BOOL)prependedAutoPunctuation;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)tokenName;
- (RDSAPIObjCSpeechAnalyzerTranscriptionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11;
- (double)confidence;
- (double)end;
- (double)silenceStart;
- (double)start;
- (void)setAppendedAutoPunctuation:(BOOL)a3;
- (void)setConfidence:(double)a3;
- (void)setEnd:(double)a3;
- (void)setHasSpaceAfter:(BOOL)a3;
- (void)setHasSpaceBefore:(BOOL)a3;
- (void)setIpaPhoneSequence:(id)a3;
- (void)setIsModifiedByAutoPunctuation:(BOOL)a3;
- (void)setPhoneSequence:(id)a3;
- (void)setPrependedAutoPunctuation:(BOOL)a3;
- (void)setSilenceStart:(double)a3;
- (void)setStart:(double)a3;
- (void)setTokenName:(id)a3;
@end

@implementation RDSAPIObjCSpeechAnalyzerTranscriptionToken

- (RDSAPIObjCSpeechAnalyzerTranscriptionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11
{
  BOOL v13 = a9;
  BOOL v14 = a8;
  id v20 = a3;
  id v21 = a10;
  id v22 = a11;
  v26.receiver = self;
  v26.super_class = (Class)RDSAPIObjCSpeechAnalyzerTranscriptionToken;
  v23 = [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)&v26 init];
  v24 = v23;
  if (v23)
  {
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v23 setTokenName:v20];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setStart:a4];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setEnd:a5];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setSilenceStart:a6];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setConfidence:a7];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setHasSpaceAfter:v14];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setHasSpaceBefore:v13];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setPhoneSequence:v21];
    [(RDSAPIObjCSpeechAnalyzerTranscriptionToken *)v24 setIpaPhoneSequence:v22];
  }

  return v24;
}

- (NSString)tokenName
{
  return self->_tokenName;
}

- (void)setTokenName:(id)a3
{
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (double)silenceStart
{
  return self->_silenceStart;
}

- (void)setSilenceStart:(double)a3
{
  self->_silenceStart = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (void)setHasSpaceAfter:(BOOL)a3
{
  self->_hasSpaceAfter = a3;
}

- (BOOL)hasSpaceBefore
{
  return self->_hasSpaceBefore;
}

- (void)setHasSpaceBefore:(BOOL)a3
{
  self->_hasSpaceBefore = a3;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setIpaPhoneSequence:(id)a3
{
}

- (BOOL)appendedAutoPunctuation
{
  return self->_appendedAutoPunctuation;
}

- (void)setAppendedAutoPunctuation:(BOOL)a3
{
  self->_appendedAutoPunctuation = a3;
}

- (BOOL)prependedAutoPunctuation
{
  return self->_prependedAutoPunctuation;
}

- (void)setPrependedAutoPunctuation:(BOOL)a3
{
  self->_prependedAutoPunctuation = a3;
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self->_isModifiedByAutoPunctuation;
}

- (void)setIsModifiedByAutoPunctuation:(BOOL)a3
{
  self->_isModifiedByAutoPunctuation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_tokenName, 0);
}

@end
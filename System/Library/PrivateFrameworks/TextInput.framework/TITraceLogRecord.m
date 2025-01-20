@interface TITraceLogRecord
- (NSArray)context;
- (NSArray)finalAutocorrectionCandidates;
- (NSArray)finalCompletionCandidates;
- (NSArray)finalPredictionCandidates;
- (NSArray)parsedSections;
- (NSArray)rawAutocorrectionCandidates;
- (NSArray)rawCompletionCandidates;
- (NSArray)rawPredictionCandidates;
- (NSArray)removedAutocorrectionCandidates;
- (NSArray)removedCompletionCandidates;
- (NSArray)removedPredictionCandidates;
- (NSString)logText;
- (NSString)logTextWithHeader;
- (NSString)recordType;
- (NSString)typedString;
- (NSUUID)recordUUID;
- (TITraceLogRecord)initWithRecordUUID:(id)a3 context:(id)a4 logText:(id)a5 logVersion:(unint64_t)a6;
- (TITraceLogRecord)initWithRecordUUID:(id)a3 logText:(id)a4 logVersion:(unint64_t)a5;
- (unint64_t)logVersion;
- (unint64_t)parse;
- (unint64_t)parsingStatus;
- (void)addParsedSection:(id)a3;
- (void)setContext:(id)a3;
- (void)setFinalAutocorrectionCandidates:(id)a3;
- (void)setFinalCompletionCandidates:(id)a3;
- (void)setFinalPredictionCandidates:(id)a3;
- (void)setLogText:(id)a3;
- (void)setLogVersion:(unint64_t)a3;
- (void)setParsingStatus:(unint64_t)a3;
- (void)setRawAutocorrectionCandidates:(id)a3;
- (void)setRawCompletionCandidates:(id)a3;
- (void)setRawPredictionCandidates:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRecordUUID:(id)a3;
- (void)setRemovedAutocorrectionCandidates:(id)a3;
- (void)setRemovedCompletionCandidates:(id)a3;
- (void)setRemovedPredictionCandidates:(id)a3;
- (void)setTypedString:(id)a3;
@end

@implementation TITraceLogRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_removedPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_rawPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_finalCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_removedCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_rawCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_finalAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_removedAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_rawAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_logText, 0);
  objc_storeStrong((id *)&self->_recordUUID, 0);

  objc_storeStrong((id *)&self->_parsedSections, 0);
}

- (void)setFinalPredictionCandidates:(id)a3
{
}

- (NSArray)finalPredictionCandidates
{
  return self->_finalPredictionCandidates;
}

- (void)setRemovedPredictionCandidates:(id)a3
{
}

- (NSArray)removedPredictionCandidates
{
  return self->_removedPredictionCandidates;
}

- (void)setRawPredictionCandidates:(id)a3
{
}

- (NSArray)rawPredictionCandidates
{
  return self->_rawPredictionCandidates;
}

- (void)setFinalCompletionCandidates:(id)a3
{
}

- (NSArray)finalCompletionCandidates
{
  return self->_finalCompletionCandidates;
}

- (void)setRemovedCompletionCandidates:(id)a3
{
}

- (NSArray)removedCompletionCandidates
{
  return self->_removedCompletionCandidates;
}

- (void)setRawCompletionCandidates:(id)a3
{
}

- (NSArray)rawCompletionCandidates
{
  return self->_rawCompletionCandidates;
}

- (void)setFinalAutocorrectionCandidates:(id)a3
{
}

- (NSArray)finalAutocorrectionCandidates
{
  return self->_finalAutocorrectionCandidates;
}

- (void)setRemovedAutocorrectionCandidates:(id)a3
{
}

- (NSArray)removedAutocorrectionCandidates
{
  return self->_removedAutocorrectionCandidates;
}

- (void)setRawAutocorrectionCandidates:(id)a3
{
}

- (NSArray)rawAutocorrectionCandidates
{
  return self->_rawAutocorrectionCandidates;
}

- (void)setRecordType:(id)a3
{
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSArray)parsedSections
{
  return &self->_parsedSections->super;
}

- (void)setTypedString:(id)a3
{
}

- (NSString)typedString
{
  return self->_typedString;
}

- (void)setParsingStatus:(unint64_t)a3
{
  self->_parsingStatus = a3;
}

- (unint64_t)parsingStatus
{
  return self->_parsingStatus;
}

- (void)setLogVersion:(unint64_t)a3
{
  self->_logVersion = a3;
}

- (unint64_t)logVersion
{
  return self->_logVersion;
}

- (void)setContext:(id)a3
{
}

- (NSArray)context
{
  return self->_context;
}

- (void)setLogText:(id)a3
{
}

- (NSString)logText
{
  return self->_logText;
}

- (void)setRecordUUID:(id)a3
{
}

- (NSUUID)recordUUID
{
  return self->_recordUUID;
}

- (void)addParsedSection:(id)a3
{
}

- (unint64_t)parse
{
  return 0;
}

- (TITraceLogRecord)initWithRecordUUID:(id)a3 context:(id)a4 logText:(id)a5 logVersion:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TITraceLogRecord;
  v13 = [(TITraceLogRecord *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    recordUUID = v13->_recordUUID;
    v13->_recordUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_logText, a5);
    v13->_logVersion = a6;
    v13->_parsingStatus = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parsedSections = v13->_parsedSections;
    v13->_parsedSections = v16;
  }
  return v13;
}

- (NSString)logTextWithHeader
{
  return (NSString *)[NSString stringWithFormat:@"RECORD ID: %@\n\n%@\n", self->_recordUUID, self->_logText];
}

- (TITraceLogRecord)initWithRecordUUID:(id)a3 logText:(id)a4 logVersion:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TITraceLogRecord;
  id v10 = [(TITraceLogRecord *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    recordUUID = v10->_recordUUID;
    v10->_recordUUID = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_logText, a4);
    v10->_logVersion = a5;
    v10->_parsingStatus = 0;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parsedSections = v10->_parsedSections;
    v10->_parsedSections = v13;
  }
  return v10;
}

@end
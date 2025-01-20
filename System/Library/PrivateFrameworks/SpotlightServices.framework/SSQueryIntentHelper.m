@interface SSQueryIntentHelper
- (BOOL)resultSetHasAppSectionWithinTop3;
- (BOOL)resultSetHasSuggestions;
- (BOOL)resultSetHasTopHits;
- (NSSet)retrievedBundleIDs;
- (NSString)quIntentLabel;
- (NSString)topHitResultBundleId;
- (SFResultSection)nextSectionForIntent;
- (id)description;
- (int)intentNextSection;
- (int)intentPostRetrieval;
- (int)intentPrefixLength;
- (int)intentQU;
- (int)intentStrength;
- (int)intentType;
- (int64_t)resultSetSectionCount;
- (void)setIntentNextSection:(int)a3;
- (void)setIntentPostRetrieval:(int)a3;
- (void)setIntentPrefixLength:(int)a3;
- (void)setIntentQU:(int)a3;
- (void)setIntentStrength:(int)a3;
- (void)setIntentType:(int)a3;
- (void)setNextSectionForIntent:(id)a3;
- (void)setQuIntentLabel:(id)a3;
- (void)setResultSetHasAppSectionWithinTop3:(BOOL)a3;
- (void)setResultSetHasSuggestions:(BOOL)a3;
- (void)setResultSetHasTopHits:(BOOL)a3;
- (void)setResultSetSectionCount:(int64_t)a3;
- (void)setRetrievedBundleIDs:(id)a3;
- (void)setTopHitResultBundleId:(id)a3;
@end

@implementation SSQueryIntentHelper

- (id)description
{
  v3 = NSString;
  v4 = +[SSQueryIntent intentString:self->_intentPrefixLength];
  v5 = +[SSQueryIntent intentString:self->_intentPostRetrieval];
  v6 = +[SSQueryIntent intentString:self->_intentNextSection];
  v7 = +[SSQueryIntent intentString:self->_intentQU];
  v8 = +[SSQueryIntent intentString:self->_intentType];
  v9 = +[SSQueryIntent intentStrengthString:self->_intentStrength];
  v10 = [v3 stringWithFormat:@"prefixBased\t%@\tpostRetrieval\t%@\tnextSection\t%@\tQU\t%@\tfinal\t%@\tStrength\t%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (int)intentPrefixLength
{
  return self->_intentPrefixLength;
}

- (void)setIntentPrefixLength:(int)a3
{
  self->_intentPrefixLength = a3;
}

- (int)intentPostRetrieval
{
  return self->_intentPostRetrieval;
}

- (void)setIntentPostRetrieval:(int)a3
{
  self->_intentPostRetrieval = a3;
}

- (int)intentNextSection
{
  return self->_intentNextSection;
}

- (void)setIntentNextSection:(int)a3
{
  self->_intentNextSection = a3;
}

- (int)intentQU
{
  return self->_intentQU;
}

- (void)setIntentQU:(int)a3
{
  self->_intentQU = a3;
}

- (int)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(int)a3
{
  self->_intentType = a3;
}

- (SFResultSection)nextSectionForIntent
{
  return self->_nextSectionForIntent;
}

- (void)setNextSectionForIntent:(id)a3
{
}

- (NSSet)retrievedBundleIDs
{
  return self->_retrievedBundleIDs;
}

- (void)setRetrievedBundleIDs:(id)a3
{
}

- (NSString)topHitResultBundleId
{
  return self->_topHitResultBundleId;
}

- (void)setTopHitResultBundleId:(id)a3
{
}

- (BOOL)resultSetHasTopHits
{
  return self->_resultSetHasTopHits;
}

- (void)setResultSetHasTopHits:(BOOL)a3
{
  self->_resultSetHasTopHits = a3;
}

- (BOOL)resultSetHasSuggestions
{
  return self->_resultSetHasSuggestions;
}

- (void)setResultSetHasSuggestions:(BOOL)a3
{
  self->_resultSetHasSuggestions = a3;
}

- (BOOL)resultSetHasAppSectionWithinTop3
{
  return self->_resultSetHasAppSectionWithinTop3;
}

- (void)setResultSetHasAppSectionWithinTop3:(BOOL)a3
{
  self->_resultSetHasAppSectionWithinTop3 = a3;
}

- (int64_t)resultSetSectionCount
{
  return self->_resultSetSectionCount;
}

- (void)setResultSetSectionCount:(int64_t)a3
{
  self->_resultSetSectionCount = a3;
}

- (int)intentStrength
{
  return self->_intentStrength;
}

- (void)setIntentStrength:(int)a3
{
  self->_intentStrength = a3;
}

- (NSString)quIntentLabel
{
  return self->_quIntentLabel;
}

- (void)setQuIntentLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quIntentLabel, 0);
  objc_storeStrong((id *)&self->_topHitResultBundleId, 0);
  objc_storeStrong((id *)&self->_retrievedBundleIDs, 0);
  objc_storeStrong((id *)&self->_nextSectionForIntent, 0);
}

@end
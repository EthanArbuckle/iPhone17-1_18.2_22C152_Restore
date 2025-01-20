@interface TIAlignedTyping
- (BOOL)isAutocompleteTriggerForPreviousEntry;
- (BOOL)isRevisedAutocompleteEntry;
- (NSArray)documentStates;
- (NSArray)inlineCompletions;
- (NSArray)inserted;
- (NSArray)predicted;
- (NSArray)touched;
- (TIContinuousPath)path;
- (void)setDocumentStates:(id)a3;
- (void)setInlineCompletions:(id)a3;
- (void)setInserted:(id)a3;
- (void)setPath:(id)a3;
- (void)setPredicted:(id)a3;
- (void)setTouched:(id)a3;
@end

@implementation TIAlignedTyping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);
  objc_storeStrong((id *)&self->_touched, 0);
}

- (void)setPath:(id)a3
{
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (void)setDocumentStates:(id)a3
{
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setInserted:(id)a3
{
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInlineCompletions:(id)a3
{
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setPredicted:(id)a3
{
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setTouched:(id)a3
{
}

- (NSArray)touched
{
  return self->_touched;
}

- (BOOL)isRevisedAutocompleteEntry
{
  v3 = [(TIAlignedTyping *)self touched];
  if ([v3 containsObject:@"<Autocorrect>"]) {
    BOOL v4 = ![(TIAlignedTyping *)self isAutocompleteTriggerForPreviousEntry];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isAutocompleteTriggerForPreviousEntry
{
  v2 = [(TIAlignedTyping *)self touched];
  v3 = [v2 lastObject];
  char v4 = [v3 isEqualToString:@"<Autocorrect>"];

  return v4;
}

@end
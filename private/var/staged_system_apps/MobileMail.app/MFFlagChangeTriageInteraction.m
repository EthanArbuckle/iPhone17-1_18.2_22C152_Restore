@interface MFFlagChangeTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7;
+ (id)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7;
- (BOOL)flagState;
- (BOOL)supportsSelectAll;
- (id)updateReason;
- (int64_t)reason;
- (void)setReason:(int64_t)a3;
@end

@implementation MFFlagChangeTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  v8 = [super interactionWithMessageListItemSelection:a3 undoManager:a4 origin:a5 actor:a6];
  [v8 setReason:a7];

  return v8;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  [super interactionWithMessageListItems:a3 undoManager:a4 origin:a5 actor:a6];
  [v8 setReason:a7];

  return v8;
}

+ (id)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  v8 = [super interactionWithQuery:a3 undoManager:a4 origin:a5 actor:a6];
  [v8 setReason:a7];

  return v8;
}

- (BOOL)flagState
{
  v2 = [(MFTriageInteraction *)self triageAction];
  unsigned __int8 v3 = [v2 flagState];

  return v3;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return @"flagChanged";
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end
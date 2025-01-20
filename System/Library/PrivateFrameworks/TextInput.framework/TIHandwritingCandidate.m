@interface TIHandwritingCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isInlineCompletionCandidate;
- (TIHandwritingCandidate)initWithCandidate:(id)a3 forInput:(id)a4 uniqueID:(unint64_t)a5 completionUniqueID:(unint64_t)a6;
- (TIHandwritingCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIHandwritingCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)completionUniqueID;
- (unint64_t)uniqueID;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIHandwritingCandidate

- (unint64_t)completionUniqueID
{
  return self->_completionUniqueID;
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIHandwritingCandidate;
  id v4 = a3;
  [(TIKeyboardCandidateSingle *)&v5 encodeWithCandidateResultSetCoder:v4];
  objc_msgSend(v4, "encodeUInt64:", self->_uniqueID, v5.receiver, v5.super_class);
  [v4 encodeUInt64:self->_completionUniqueID];
}

- (TIHandwritingCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  objc_super v5 = [(TIKeyboardCandidateSingle *)&v7 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    v5->_uniqueID = [v4 decodeUInt64];
    v5->_completionUniqueID = [v4 decodeUInt64];
  }

  return v5;
}

- (BOOL)isInlineCompletionCandidate
{
  unint64_t v3 = [(TIHandwritingCandidate *)self uniqueID];
  if (v3) {
    LOBYTE(v3) = [(TIHandwritingCandidate *)self completionUniqueID] != 0;
  }
  return v3;
}

- (TIHandwritingCandidate)initWithCandidate:(id)a3 forInput:(id)a4 uniqueID:(unint64_t)a5 completionUniqueID:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TIHandwritingCandidate;
  v8 = [(TIKeyboardCandidateSingle *)&v11 initWithCandidate:a3 forInput:a4];
  v9 = v8;
  if (v8)
  {
    v8->_uniqueID = a5;
    v8->_completionUniqueID = a6;
    [(TIKeyboardCandidate *)v8 setTypingEngine:6];
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  [(TIKeyboardCandidateSingle *)&v7 encodeWithCoder:v4];
  unint64_t uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v4 encodeInt64:uniqueID forKey:@"uniqueID"];
  }
  unint64_t completionUniqueID = self->_completionUniqueID;
  if (completionUniqueID) {
    [v4 encodeInt64:completionUniqueID forKey:@"completionUniqueID"];
  }
}

- (TIHandwritingCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  objc_super v5 = [(TIKeyboardCandidateSingle *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t uniqueID = [v4 decodeInt64ForKey:@"uniqueID"];
    v5->_unint64_t completionUniqueID = [v4 decodeInt64ForKey:@"completionUniqueID"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIHandwritingCandidate;
  id result = [(TIKeyboardCandidateSingle *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 28) = self->_uniqueID;
    *((void *)result + 29) = self->_completionUniqueID;
  }
  return result;
}

+ (int)type
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
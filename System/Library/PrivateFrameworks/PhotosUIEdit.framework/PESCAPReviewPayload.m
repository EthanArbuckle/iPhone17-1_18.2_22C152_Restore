@interface PESCAPReviewPayload
+ (id)legacyPayloadWithReason:(int64_t)a3;
- (NSString)adjustmentsDescription;
- (NSString)filename;
- (PESCAPReviewPayload)initWithActionType:(int64_t)a3 reason:(int64_t)a4 score:(double)a5 adjustmentsDescription:(id)a6;
- (double)score;
- (id)debugDescription;
- (int64_t)actionType;
- (int64_t)reason;
- (void)setAdjustmentsDescription:(id)a3;
- (void)setFilename:(id)a3;
@end

@implementation PESCAPReviewPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_adjustmentsDescription, 0);
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setAdjustmentsDescription:(id)a3
{
}

- (NSString)adjustmentsDescription
{
  return self->_adjustmentsDescription;
}

- (int64_t)reason
{
  return self->_reason;
}

- (double)score
{
  return self->_score;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (id)debugDescription
{
  if ([(PESCAPReviewPayload *)self actionType] == 1)
  {
    v3 = NSString;
    int64_t v4 = [(PESCAPReviewPayload *)self actionType];
    v5 = @"Smart C&P";
    if (!v4) {
      v5 = @"Legacy C&P";
    }
    v6 = v5;
    [(PESCAPReviewPayload *)self score];
    v8 = [v3 stringWithFormat:@"%@ - %f", v6, v7];
  }
  else
  {
    unint64_t v9 = [(PESCAPReviewPayload *)self reason] - 1;
    if (v9 > 6) {
      v8 = @"Unknown";
    }
    else {
      v8 = off_2642BEC30[v9];
    }
    if ([(PESCAPReviewPayload *)self reason] == 6)
    {
      v10 = NSString;
      [(PESCAPReviewPayload *)self score];
      v8 = [v10 stringWithFormat:@"%@ - %f", v8, v11];
    }
  }
  return v8;
}

- (PESCAPReviewPayload)initWithActionType:(int64_t)a3 reason:(int64_t)a4 score:(double)a5 adjustmentsDescription:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PESCAPReviewPayload;
  v12 = [(PESCAPReviewPayload *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_actionType = a3;
    v12->_reason = a4;
    v12->_score = a5;
    objc_storeStrong((id *)&v12->_adjustmentsDescription, a6);
  }

  return v13;
}

+ (id)legacyPayloadWithReason:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithActionType:0 reason:a3 score:0 adjustmentsDescription:-1.0];
  return v3;
}

@end
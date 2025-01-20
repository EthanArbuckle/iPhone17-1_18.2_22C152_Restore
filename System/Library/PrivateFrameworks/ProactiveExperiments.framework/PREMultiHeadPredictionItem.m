@interface PREMultiHeadPredictionItem
+ (BOOL)supportsSecureCoding;
- (NSNumber)score;
- (NSString)label;
- (PREMultiHeadPredictionItem)initWithCoder:(id)a3;
- (PREMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PREMultiHeadPredictionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSNumber)score
{
  return self->_score;
}

- (id)description
{
  if (self->_label)
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"<PREMultiHeadPredictionItem score:%@ label:%@>", self->_score, self->_label];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PREMultiHeadPredictionItem;
    v2 = [(PREMultiHeadPredictionItem *)&v4 description];
  }

  return v2;
}

- (PREMultiHeadPredictionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREMultiHeadPredictionItem;
  v5 = [(PREMultiHeadPredictionItem *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    if (!v6)
    {
      v10 = 0;
      goto LABEL_6;
    }
    score = v5->_score;
    v5->_score = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  score = self->_score;
  id v5 = a3;
  [v5 encodeObject:score forKey:@"score"];
  [v5 encodeObject:self->_label forKey:@"label"];
}

- (PREMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PREMultiHeadPredictionItem.m", 23, @"Invalid parameter not satisfying: %@", @"score" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PREMultiHeadPredictionItem;
  v10 = [(PREMultiHeadPredictionItem *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_score, a3);
    objc_storeStrong((id *)&v11->_label, a4);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
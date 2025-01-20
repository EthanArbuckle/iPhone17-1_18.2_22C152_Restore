@interface TPSSubscriptionLabel
+ (id)labelsFromUnlocalizedLabels:(id)a3 localizedLongLabels:(id)a4 localizedBadgeLabels:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSubscriptionLabel:(id)a3;
- (NSString)localizedBadgeLabel;
- (NSString)localizedLongLabel;
- (NSString)unlocalizedLongLabel;
- (TPSSubscriptionLabel)initWithUnlocalizedLabel:(id)a3 localizedLongLabel:(id)a4 localizedBadgeLabel:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation TPSSubscriptionLabel

+ (id)labelsFromUnlocalizedLabels:(id)a3 localizedLongLabels:(id)a4 localizedBadgeLabels:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v11 = [v7 count];
  if (v11 == [v8 count])
  {
    uint64_t v12 = [v9 count];
    if (v12 == [v8 count])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __93__TPSSubscriptionLabel_labelsFromUnlocalizedLabels_localizedLongLabels_localizedBadgeLabels___block_invoke;
      v15[3] = &unk_1E6EB2530;
      id v16 = v8;
      id v17 = v9;
      id v18 = v10;
      [v7 enumerateObjectsUsingBlock:v15];
    }
  }
  v13 = (void *)[v10 copy];

  return v13;
}

void __93__TPSSubscriptionLabel_labelsFromUnlocalizedLabels_localizedLongLabels_localizedBadgeLabels___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [TPSSubscriptionLabel alloc];
  id v7 = [a1[4] objectAtIndex:a3];
  id v8 = [a1[5] objectAtIndex:a3];
  id v9 = [(TPSSubscriptionLabel *)v6 initWithUnlocalizedLabel:v5 localizedLongLabel:v7 localizedBadgeLabel:v8];

  [a1[6] addObject:v9];
}

- (TPSSubscriptionLabel)initWithUnlocalizedLabel:(id)a3 localizedLongLabel:(id)a4 localizedBadgeLabel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSSubscriptionLabel;
  uint64_t v12 = [(TPSSubscriptionLabel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unlocalizedLongLabel, a3);
    objc_storeStrong((id *)&v13->_localizedLongLabel, a4);
    objc_storeStrong((id *)&v13->_localizedBadgeLabel, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TPSSubscriptionLabel *)self localizedLongLabel];
  id v5 = [(TPSSubscriptionLabel *)self localizedBadgeLabel];
  v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(TPSSubscriptionLabel *)self unlocalizedLongLabel];
  uint64_t v4 = [v3 hash];
  id v5 = [(TPSSubscriptionLabel *)self localizedLongLabel];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(TPSSubscriptionLabel *)self localizedBadgeLabel];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TPSSubscriptionLabel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSSubscriptionLabel *)self isEqualToSubscriptionLabel:v4];
  }

  return v5;
}

- (BOOL)isEqualToSubscriptionLabel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TPSSubscriptionLabel *)self localizedBadgeLabel];
  uint64_t v6 = [v4 localizedBadgeLabel];
  if ([v5 isEqual:v6])
  {
    id v7 = [(TPSSubscriptionLabel *)self localizedLongLabel];
    unint64_t v8 = [v4 localizedLongLabel];
    if ([v7 isEqual:v8])
    {
      id v9 = [(TPSSubscriptionLabel *)self unlocalizedLongLabel];
      id v10 = [v4 unlocalizedLongLabel];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (NSString)localizedLongLabel
{
  return self->_localizedLongLabel;
}

- (NSString)unlocalizedLongLabel
{
  return self->_unlocalizedLongLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedLongLabel, 0);
  objc_storeStrong((id *)&self->_localizedLongLabel, 0);
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
}

@end
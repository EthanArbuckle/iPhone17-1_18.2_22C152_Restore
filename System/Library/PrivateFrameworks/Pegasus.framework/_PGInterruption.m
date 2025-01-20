@interface _PGInterruption
- (BOOL)isEqual:(id)a3;
- (NSString)attribution;
- (_PGInterruption)initWithReason:(int64_t)a3 attribution:(id)a4;
- (id)description;
- (int64_t)reason;
- (unint64_t)hash;
@end

@implementation _PGInterruption

- (_PGInterruption)initWithReason:(int64_t)a3 attribution:(id)a4
{
  v6 = (__CFString *)a4;
  v17.receiver = self;
  v17.super_class = (Class)_PGInterruption;
  v7 = [(_PGInterruption *)&v17 init];
  v8 = v7;
  if (v7)
  {
    v7->_reason = a3;
    uint64_t v9 = [(__CFString *)v6 copy];
    attribution = v8->_attribution;
    v8->_attribution = (NSString *)v9;

    v11 = [MEMORY[0x1E4F4F758] builder];
    v12 = [v11 appendInteger:a3];
    v13 = v12;
    if (v6) {
      v14 = v6;
    }
    else {
      v14 = &stru_1F0E4F210;
    }
    v15 = [v12 appendString:v14];
    v8->_bs_hash = [v15 hash];
  }
  return v8;
}

- (unint64_t)hash
{
  return self->_bs_hash;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)attribution
{
  return self->_attribution;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8 && [v8 reason] == self->_reason)
  {
    uint64_t v9 = [v8 attribution];
    if ([v9 isEqualToString:self->_attribution])
    {
      BOOL v10 = 1;
    }
    else
    {
      v11 = [v8 attribution];
      BOOL v10 = v11 == self->_attribution;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  unint64_t reason = self->_reason;
  if (reason > 4) {
    id v8 = @"invalid";
  }
  else {
    id v8 = off_1E610C3B0[reason];
  }
  attribution = (__CFString *)self->_attribution;
  if (!attribution) {
    attribution = @"<nil>";
  }
  BOOL v10 = [v3 stringWithFormat:@"%@: %@ - %@", v5, v8, attribution];

  return v10;
}

- (void).cxx_destruct
{
}

@end
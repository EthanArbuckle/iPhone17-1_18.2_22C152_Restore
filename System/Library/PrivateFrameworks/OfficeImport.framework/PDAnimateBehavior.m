@interface PDAnimateBehavior
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)attributeNames;
- (PDAnimateBehavior)init;
- (id)description;
- (id)target;
- (unint64_t)hash;
- (void)setAttributeNames:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation PDAnimateBehavior

- (PDAnimateBehavior)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimateBehavior;
  return [(PDTimeNode *)&v3 init];
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  return self->mTgtElement;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (v6)
  {
    mTgtElement = self->mTgtElement;
    v9 = [v6 target];
    BOOL v10 = v9 == 0;

    if ((mTgtElement != 0) == v10)
    {
      char v14 = 0;
    }
    else
    {
      v11 = self->mTgtElement;
      if (v11)
      {
        v12 = [v7 target];
        char v13 = [(PDAnimationTarget *)v11 isEqual:v12];

        if (self->mTgtElement) {
          char v14 = v13;
        }
        else {
          char v14 = 1;
        }
      }
      else
      {
        char v14 = 1;
      }
    }
    mAttributeNames = self->mAttributeNames;
    v16 = [v7 attributeNames];
    LOBYTE(mAttributeNames) = v14 | [(NSMutableArray *)mAttributeNames isEqualToArray:v16];

    if (mAttributeNames)
    {
      v18.receiver = self;
      v18.super_class = (Class)PDAnimateBehavior;
      LOBYTE(v7) = [(PDTimeNode *)&v18 isEqual:v4];
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PDAnimationTarget *)self->mTgtElement hash];
  return [(NSMutableArray *)self->mAttributeNames count] ^ v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDAnimateBehavior;
  v2 = [(PDTimeNode *)&v4 description];
  return v2;
}

- (NSMutableArray)attributeNames
{
  return self->mAttributeNames;
}

- (void)setAttributeNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAttributeNames, 0);
  objc_storeStrong((id *)&self->mTgtElement, 0);
}

@end
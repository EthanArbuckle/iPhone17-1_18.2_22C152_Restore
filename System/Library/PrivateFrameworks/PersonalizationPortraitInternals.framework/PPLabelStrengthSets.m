@interface PPLabelStrengthSets
+ (id)labelStrengthSetsWithWeakSet:(id)a3 strongSet:(id)a4;
- (NSSet)strong;
- (NSSet)weak;
- (PPLabelStrengthSets)initWithWeakSet:(id)a3 strongSet:(id)a4;
@end

@implementation PPLabelStrengthSets

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strong, 0);
  objc_storeStrong((id *)&self->_weak, 0);
}

- (NSSet)strong
{
  return self->_strong;
}

- (NSSet)weak
{
  return self->_weak;
}

- (PPLabelStrengthSets)initWithWeakSet:(id)a3 strongSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLabelStrengthSets;
  v9 = [(PPLabelStrengthSets *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weak, a3);
    objc_storeStrong((id *)&v10->_strong, a4);
  }

  return v10;
}

+ (id)labelStrengthSetsWithWeakSet:(id)a3 strongSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithWeakSet:v7 strongSet:v6];

  return v8;
}

@end
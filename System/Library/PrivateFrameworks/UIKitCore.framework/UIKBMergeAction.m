@interface UIKBMergeAction
+ (id)mergeActionWithOrderedKeyList:(id)a3 factors:(id)a4;
+ (id)mergeActionWithRemainingKeyName:(id)a3 disappearingKeyName:(id)a4 factors:(id)a5;
- (NSArray)orderedKeyList;
- (NSString)disappearingKeyName;
- (NSString)remainingKeyName;
- (UIKBGeometry)factors;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisappearingKeyName:(id)a3;
- (void)setFactors:(id)a3;
- (void)setOrderedKeyList:(id)a3;
- (void)setRemainingKeyName:(id)a3;
@end

@implementation UIKBMergeAction

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[UIKBMergeAction allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_remainingKeyName copy];
  remainingKeyName = v4->_remainingKeyName;
  v4->_remainingKeyName = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_disappearingKeyName copy];
  disappearingKeyName = v4->_disappearingKeyName;
  v4->_disappearingKeyName = (NSString *)v7;

  uint64_t v9 = [(NSArray *)self->_orderedKeyList copy];
  orderedKeyList = v4->_orderedKeyList;
  v4->_orderedKeyList = (NSArray *)v9;

  uint64_t v11 = [(UIKBGeometry *)self->_factors copy];
  factors = v4->_factors;
  v4->_factors = (UIKBGeometry *)v11;

  return v4;
}

+ (id)mergeActionWithRemainingKeyName:(id)a3 disappearingKeyName:(id)a4 factors:(id)a5
{
  uint64_t v7 = (NSString *)a3;
  v8 = (NSString *)a4;
  uint64_t v9 = (UIKBGeometry *)a5;
  v10 = objc_alloc_init(UIKBMergeAction);
  remainingKeyName = v10->_remainingKeyName;
  v10->_remainingKeyName = v7;
  v12 = v7;

  disappearingKeyName = v10->_disappearingKeyName;
  v10->_disappearingKeyName = v8;
  v14 = v8;

  factors = v10->_factors;
  v10->_factors = v9;

  return v10;
}

+ (id)mergeActionWithOrderedKeyList:(id)a3 factors:(id)a4
{
  uint64_t v5 = (NSArray *)a3;
  v6 = (UIKBGeometry *)a4;
  uint64_t v7 = objc_alloc_init(UIKBMergeAction);
  orderedKeyList = v7->_orderedKeyList;
  v7->_orderedKeyList = v5;
  uint64_t v9 = v5;

  factors = v7->_factors;
  v7->_factors = v6;

  return v7;
}

- (NSString)remainingKeyName
{
  return self->_remainingKeyName;
}

- (void)setRemainingKeyName:(id)a3
{
}

- (NSString)disappearingKeyName
{
  return self->_disappearingKeyName;
}

- (void)setDisappearingKeyName:(id)a3
{
}

- (NSArray)orderedKeyList
{
  return self->_orderedKeyList;
}

- (void)setOrderedKeyList:(id)a3
{
}

- (UIKBGeometry)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_orderedKeyList, 0);
  objc_storeStrong((id *)&self->_disappearingKeyName, 0);
  objc_storeStrong((id *)&self->_remainingKeyName, 0);
}

@end
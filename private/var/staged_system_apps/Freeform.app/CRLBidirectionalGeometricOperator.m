@interface CRLBidirectionalGeometricOperator
- (CRLBidirectionalGeometricOperator)init;
- (id)valueForKey:(id)a3 swapped:(BOOL)a4;
- (void)executeBidirectionalOperation:(id)a3;
- (void)setOrientationDependentValueForKey:(id)a3 withStandardValue:(id)a4 andSwappedValue:(id)a5;
@end

@implementation CRLBidirectionalGeometricOperator

- (CRLBidirectionalGeometricOperator)init
{
  v12.receiver = self;
  v12.super_class = (Class)CRLBidirectionalGeometricOperator;
  v2 = [(CRLBidirectionalGeometricOperator *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mStandardValues = v2->mStandardValues;
    v2->mStandardValues = v3;

    v5 = v2->mStandardValues;
    v6 = +[NSNumber numberWithBool:0];
    [(NSMutableDictionary *)v5 setValue:v6 forKey:@"kCRLBidirectionalGeometricOperatorValuesAreSwapped"];

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mSwappedValues = v2->mSwappedValues;
    v2->mSwappedValues = v7;

    v9 = v2->mSwappedValues;
    v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v9 setValue:v10 forKey:@"kCRLBidirectionalGeometricOperatorValuesAreSwapped"];
  }
  return v2;
}

- (void)setOrientationDependentValueForKey:(id)a3 withStandardValue:(id)a4 andSwappedValue:(id)a5
{
  mStandardValues = self->mStandardValues;
  id v9 = a5;
  id v10 = a3;
  [(NSMutableDictionary *)mStandardValues setValue:a4 forKey:v10];
  [(NSMutableDictionary *)self->mSwappedValues setValue:v9 forKey:v10];
}

- (void)executeBidirectionalOperation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v6 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A9900;
  block[3] = &unk_1014CAE00;
  id v7 = v4;
  block[4] = self;
  id v12 = v7;
  dispatch_group_async(v5, v6, block);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A9970;
  v9[3] = &unk_1014CAE00;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_group_async(v5, v6, v9);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)valueForKey:(id)a3 swapped:(BOOL)a4
{
  uint64_t v4 = 8;
  if (a4) {
    uint64_t v4 = 16;
  }
  v5 = [*(id *)((char *)&self->super.isa + v4) valueForKey:a3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSwappedValues, 0);

  objc_storeStrong((id *)&self->mStandardValues, 0);
}

@end
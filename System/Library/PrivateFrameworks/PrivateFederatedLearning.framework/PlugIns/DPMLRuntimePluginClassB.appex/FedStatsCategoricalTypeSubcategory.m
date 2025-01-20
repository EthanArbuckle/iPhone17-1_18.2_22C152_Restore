@interface FedStatsCategoricalTypeSubcategory
+ (id)categoryWithSuperCategory:(id)a3 index:(unint64_t)a4;
- (FedStatsCategoricalTypeSubcategory)initWithSuperCategory:(id)a3 index:(unint64_t)a4;
- (NSString)superCategory;
- (unint64_t)index;
@end

@implementation FedStatsCategoricalTypeSubcategory

- (FedStatsCategoricalTypeSubcategory)initWithSuperCategory:(id)a3 index:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FedStatsCategoricalTypeSubcategory;
  v8 = [(FedStatsCategoricalTypeSubcategory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_superCategory, a3);
    v9->_index = a4;
  }

  return v9;
}

+ (id)categoryWithSuperCategory:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithSuperCategory:v6 index:a4];

  return v7;
}

- (NSString)superCategory
{
  return self->_superCategory;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
}

@end
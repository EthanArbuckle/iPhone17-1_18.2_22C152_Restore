@interface spotlight_l3_1Output
- (MLMultiArray)id_features;
- (MLMultiArray)y;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (spotlight_l3_1Output)initWithY:(id)a3 id_features:(id)a4;
- (void)setId_features:(id)a3;
- (void)setY:(id)a3;
@end

@implementation spotlight_l3_1Output

- (spotlight_l3_1Output)initWithY:(id)a3 id_features:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)spotlight_l3_1Output;
  v9 = [(spotlight_l3_1Output *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_y, a3);
    objc_storeStrong((id *)&v10->_id_features, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F18643A0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"y"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(spotlight_l3_1Output *)self y];
LABEL_5:
    id v7 = (void *)v6;
    id v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"id_features"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(spotlight_l3_1Output *)self id_features];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (MLMultiArray)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
}

- (MLMultiArray)id_features
{
  return self->_id_features;
}

- (void)setId_features:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_id_features, 0);
  objc_storeStrong((id *)&self->_y, 0);
}

@end
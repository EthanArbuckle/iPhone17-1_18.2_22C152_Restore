@interface beam_bridge_2022_v2_1Output
- (MLMultiArray)cell_leaf_fully_connected_BiasAdd;
- (MLMultiArray)leaf_leaf_predictions_probabilities;
- (NSSet)featureNames;
- (beam_bridge_2022_v2_1Output)initWithCell_leaf_fully_connected_BiasAdd:(id)a3 leaf_leaf_predictions_probabilities:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setCell_leaf_fully_connected_BiasAdd:(id)a3;
- (void)setLeaf_leaf_predictions_probabilities:(id)a3;
@end

@implementation beam_bridge_2022_v2_1Output

- (beam_bridge_2022_v2_1Output)initWithCell_leaf_fully_connected_BiasAdd:(id)a3 leaf_leaf_predictions_probabilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)beam_bridge_2022_v2_1Output;
  v9 = [(beam_bridge_2022_v2_1Output *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cell_leaf_fully_connected_BiasAdd, a3);
    objc_storeStrong((id *)&v10->_leaf_leaf_predictions_probabilities, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10025BDB8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"cell_leaf_fully_connected_BiasAdd"])
  {
    uint64_t v5 = [(beam_bridge_2022_v2_1Output *)self cell_leaf_fully_connected_BiasAdd];
LABEL_5:
    v6 = (void *)v5;
    id v7 = +[MLFeatureValue featureValueWithMultiArray:v5];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"leaf_leaf_predictions_probabilities"])
  {
    uint64_t v5 = [(beam_bridge_2022_v2_1Output *)self leaf_leaf_predictions_probabilities];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (MLMultiArray)cell_leaf_fully_connected_BiasAdd
{
  return self->_cell_leaf_fully_connected_BiasAdd;
}

- (void)setCell_leaf_fully_connected_BiasAdd:(id)a3
{
}

- (MLMultiArray)leaf_leaf_predictions_probabilities
{
  return self->_leaf_leaf_predictions_probabilities;
}

- (void)setLeaf_leaf_predictions_probabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaf_leaf_predictions_probabilities, 0);

  objc_storeStrong((id *)&self->_cell_leaf_fully_connected_BiasAdd, 0);
}

@end
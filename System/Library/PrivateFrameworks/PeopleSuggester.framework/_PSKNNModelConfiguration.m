@interface _PSKNNModelConfiguration
- (NSArray)bundleIds;
- (NSArray)interactionCountMaxDepths;
- (NSArray)interactionHistoryRelativeStartDates;
- (NSArray)interactionMechanisms;
- (NSString)modelName;
- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9;
- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9 shouldExcludeInteractionBlock:(id)a10;
- (id)shouldExcludeInteractionBlock;
- (int64_t)modelType;
- (unint64_t)clusterPruneThreshold;
- (void)setBundleIds:(id)a3;
- (void)setInteractionCountMaxDepths:(id)a3;
- (void)setInteractionHistoryRelativeStartDates:(id)a3;
- (void)setInteractionMechanisms:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelType:(int64_t)a3;
- (void)setShouldExcludeInteractionBlock:(id)a3;
@end

@implementation _PSKNNModelConfiguration

- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9
{
  return [(_PSKNNModelConfiguration *)self initWithInteractionMechanisms:a3 interactionCountMaxDepths:a4 interactionHistoryRelativeStartDates:a5 bundleIds:a6 modelType:a7 clusterPruneThreshold:a8 modelName:a9 shouldExcludeInteractionBlock:0];
}

- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9 shouldExcludeInteractionBlock:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_PSKNNModelConfiguration;
  v19 = [(_PSKNNModelConfiguration *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interactionMechanisms, a3);
    objc_storeStrong((id *)&v20->_interactionCountMaxDepths, a4);
    objc_storeStrong((id *)&v20->_interactionHistoryRelativeStartDates, a5);
    objc_storeStrong((id *)&v20->_bundleIds, a6);
    v20->_modelType = a7;
    v20->_clusterPruneThreshold = a8;
    objc_storeStrong((id *)&v20->_modelName, a9);
    uint64_t v21 = MEMORY[0x1A6243AD0](v18);
    id shouldExcludeInteractionBlock = v20->_shouldExcludeInteractionBlock;
    v20->_id shouldExcludeInteractionBlock = (id)v21;
  }
  return v20;
}

- (NSArray)interactionCountMaxDepths
{
  return self->_interactionCountMaxDepths;
}

- (void)setInteractionCountMaxDepths:(id)a3
{
}

- (NSArray)interactionMechanisms
{
  return self->_interactionMechanisms;
}

- (void)setInteractionMechanisms:(id)a3
{
}

- (NSArray)interactionHistoryRelativeStartDates
{
  return self->_interactionHistoryRelativeStartDates;
}

- (void)setInteractionHistoryRelativeStartDates:(id)a3
{
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (unint64_t)clusterPruneThreshold
{
  return self->_clusterPruneThreshold;
}

- (id)shouldExcludeInteractionBlock
{
  return self->_shouldExcludeInteractionBlock;
}

- (void)setShouldExcludeInteractionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldExcludeInteractionBlock, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_interactionHistoryRelativeStartDates, 0);
  objc_storeStrong((id *)&self->_interactionMechanisms, 0);

  objc_storeStrong((id *)&self->_interactionCountMaxDepths, 0);
}

@end
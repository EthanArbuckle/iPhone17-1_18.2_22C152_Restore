@interface MOEventBundleProcessorResult
+ (BOOL)supportsSecureCoding;
- (MOEventBundleProcessorResult)initWithCoder:(id)a3;
- (NSArray)processedBundles;
- (NSSet)removedAppBundleIds;
- (NSSet)sourceAppBundleIds;
- (id)init:(id)a3 sourceAppBundleIds:(id)a4 removedAppBundleIds:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessedBundles:(id)a3;
- (void)setRemovedAppBundleIds:(id)a3;
- (void)setSourceAppBundleIds:(id)a3;
@end

@implementation MOEventBundleProcessorResult

- (id)init:(id)a3 sourceAppBundleIds:(id)a4 removedAppBundleIds:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MOEventBundleProcessorResult;
  v12 = [(MOEventBundleProcessorResult *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processedBundles, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  processedBundles = self->_processedBundles;
  id v5 = a3;
  [v5 encodeObject:processedBundles forKey:@"coderKeyMOEventBundleProcessorResultBundles"];
  [v5 encodeObject:self->_sourceAppBundleIds forKey:@"coderKeyMOEventBundleProcessorResultSourceBundleIDs"];
  [v5 encodeObject:self->_removedAppBundleIds forKey:@"coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs"];
}

- (MOEventBundleProcessorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MOEventBundleProcessorResult;
  id v5 = [(MOEventBundleProcessorResult *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"coderKeyMOEventBundleProcessorResultBundles"];
    processedBundles = v5->_processedBundles;
    v5->_processedBundles = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"coderKeyMOEventBundleProcessorResultSourceBundleIDs"];
    sourceAppBundleIds = v5->_sourceAppBundleIds;
    v5->_sourceAppBundleIds = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs"];
    removedAppBundleIds = v5->_removedAppBundleIds;
    v5->_removedAppBundleIds = (NSSet *)v19;
  }
  return v5;
}

- (NSArray)processedBundles
{
  return self->_processedBundles;
}

- (void)setProcessedBundles:(id)a3
{
}

- (NSSet)sourceAppBundleIds
{
  return self->_sourceAppBundleIds;
}

- (void)setSourceAppBundleIds:(id)a3
{
}

- (NSSet)removedAppBundleIds
{
  return self->_removedAppBundleIds;
}

- (void)setRemovedAppBundleIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppBundleIds, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIds, 0);
  objc_storeStrong((id *)&self->_processedBundles, 0);
}

@end
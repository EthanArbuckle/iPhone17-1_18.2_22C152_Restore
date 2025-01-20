@interface ICCRCoder
+ (void)_registerClass:(Class)a3 forType:(id)a4 cluster:(BOOL)a5;
+ (void)registerCRClasses;
+ (void)registerClass:(Class)a3 forType:(id)a4;
- (NSDictionary)typeToClassDict;
- (NSMutableOrderedSet)encodedObjects;
- (NSOrderedSet)clusterTypeSet;
- (NSOrderedSet)typeSet;
- (unint64_t)typeIndexForClass:(Class)a3;
- (void)currentDocument;
- (void)setCurrentDocument:(void *)a3;
- (void)setEncodedObjects:(id)a3;
@end

@implementation ICCRCoder

- (NSDictionary)typeToClassDict
{
  return (NSDictionary *)(id)sTypeToClassDict;
}

- (NSOrderedSet)typeSet
{
  return (NSOrderedSet *)(id)sTypeSet;
}

+ (void)registerClass:(Class)a3 forType:(id)a4
{
  id v6 = a4;
  [a1 registerCRClasses];
  [a1 _registerClass:a3 forType:v6 cluster:0];
}

+ (void)registerCRClasses
{
  if (!sTypeSet)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v4 = (void *)sTypeSet;
    sTypeSet = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = (void *)sClusterTypes;
    sClusterTypes = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = (void *)sTypeToClassDict;
    sTypeToClassDict = (uint64_t)v7;

    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.NSNumber" cluster:1];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.NSString" cluster:1];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.NSUUID" cluster:1];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.CRTuple" cluster:0];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.CRRegisterMultiValueLeast" cluster:0];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.CRRegisterMultiValue" cluster:0];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.CRTree" cluster:0];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.CRTreeNode" cluster:0];
    [a1 _registerClass:objc_opt_class() forType:@"com.apple.CRDT.NSData" cluster:1];
    uint64_t v9 = objc_opt_class();
    [a1 _registerClass:v9 forType:@"com.apple.CRDT.NSDate" cluster:1];
  }
}

+ (void)_registerClass:(Class)a3 forType:(id)a4 cluster:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  objc_msgSend((id)sTypeToClassDict, "setObject:forKeyedSubscript:", a3);
  if (v5) {
    [(id)sClusterTypes addObject:v7];
  }
  else {
    [(id)sClusterTypes removeObject:v7];
  }
  [(id)sTypeSet addObject:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterTypeSet, 0);
  objc_storeStrong((id *)&self->_encodedObjects, 0);
}

- (unint64_t)typeIndexForClass:(Class)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v5 = [(ICCRCoder *)self typeSet];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v16 = v7 + v6;
      uint64_t v17 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        v11 = [(ICCRCoder *)self typeToClassDict];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        if ([(id)sClusterTypes containsObject:v10]) {
          char v13 = [(objc_class *)a3 isSubclassOfClass:v12];
        }
        else {
          char v13 = [(objc_class *)a3 isEqual:v12];
        }
        if (v13)
        {
          unint64_t v14 = v17 + v9;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v16;
      if (v6) {
        continue;
      }
      break;
    }
  }
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v14;
}

- (NSMutableOrderedSet)encodedObjects
{
  return self->_encodedObjects;
}

- (void)setEncodedObjects:(id)a3
{
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (NSOrderedSet)clusterTypeSet
{
  return self->_clusterTypeSet;
}

@end
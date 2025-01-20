@interface PLRegionsClustering
+ (id)performClustering:(unint64_t)a3 dataset:(id)a4 progressBlock:(id)a5;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PLRegionsClustering

+ (id)performClustering:(unint64_t)a3 dataset:(id)a4 progressBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  switch(a3)
  {
    case 0uLL:
      v11 = objc_alloc_init(PLRegionsDensityClustering);
      v12 = v11;
      uint64_t v13 = 0;
      goto LABEL_5;
    case 1uLL:
      v12 = objc_alloc_init(PLRegionsDensityClustering);
      [(PLRegionsDensityClustering *)v12 setAlgorithm:0];
      [(PLRegionsDensityClustering *)v12 setRemoveExtensiveClustersContainingDefiniteClusters:0];
      goto LABEL_9;
    case 2uLL:
      v11 = objc_alloc_init(PLRegionsDensityClustering);
      v12 = v11;
      uint64_t v13 = 1;
LABEL_5:
      [(PLRegionsDensityClustering *)v11 setAlgorithm:v13];
      goto LABEL_9;
    case 3uLL:
      v14 = PLRegionsHierarchicalClustering;
      goto LABEL_8;
    case 4uLL:
      v14 = PLRegionsAgglomerativeClustering;
LABEL_8:
      v12 = (PLRegionsDensityClustering *)objc_alloc_init(v14);
LABEL_9:
      if (!v12) {
        goto LABEL_12;
      }
      if (v9) {
        goto LABEL_11;
      }
      goto LABEL_13;
    default:
LABEL_12:
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PLRegionsClustering.m", 67, @"No clustering initialized for algorithm %lu", a3);

      v12 = 0;
      if (v9)
      {
LABEL_11:
        v15 = [(PLRegionsDensityClustering *)v12 performWithDataset:v9 progressBlock:v10];
      }
      else
      {
LABEL_13:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v22 = v19;
          __int16 v23 = 2112;
          v24 = v20;
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ %@ Cannot be called with a nil dataset", buf, 0x16u);
        }
        v15 = 0;
      }

      return v15;
  }
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLRegionsClustering.m", 86, @"%s needs to be implemented by subclasses", "-[PLRegionsClustering performWithDataset:progressBlock:]");

  return (id)MEMORY[0x1E4F1CC08];
}

@end
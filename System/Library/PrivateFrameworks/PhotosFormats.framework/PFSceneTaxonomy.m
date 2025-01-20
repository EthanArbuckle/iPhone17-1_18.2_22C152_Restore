@interface PFSceneTaxonomy
+ (NSString)latestTaxonomyIdentifier;
+ (__CFString)indexNameForIdentifier:(int)a3 forArchivePath:;
+ (id)dataArchivePathForIdentifier:(void *)a3 bundle:;
+ (id)sharedTaxonomy;
- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4;
- (BOOL)loadOrCreateIndex;
- (NSString)description;
- (NSString)digest;
- (PFSceneTaxonomy)initWithDataPath:(id)a3 identifier:(id)a4 localizationBundle:(id)a5 tableName:(id)a6 error:(id *)a7;
- (PFSceneTaxonomy)initWithDataPath:(id)a3 localizationBundle:(id)a4 tableName:(id)a5;
- (PFSceneTaxonomy)initWithIdentifier:(id)a3 error:(id *)a4;
- (PFSceneTaxonomy)initWithLatestTaxonomy;
- (PFSceneTaxonomyNode)rootNode;
- (char)magic;
- (const)indexLabel;
- (id).cxx_construct;
- (id)dataArchivePath;
- (id)indexName;
- (id)localizedStringForKey:(id)a3;
- (id)nodeForExtendedSceneClassId:(unint64_t)a3;
- (id)nodeForName:(id)a3;
- (id)nodeForSceneClassId:(unsigned int)a3;
- (unint64_t)extendedSceneClassIdForName:(id)a3;
- (unint64_t)indexFileVersion;
- (unint64_t)nodeCount;
- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3;
- (void)nodeRefForExtendedSceneClassId:(unint64_t)a3;
- (void)nodeRefForName:(id)a3;
- (void)nodeRefForSceneClassId:(unsigned int)a3;
- (void)rootNodeRef;
@end

@implementation PFSceneTaxonomy

- (id)nodeForName:(id)a3
{
  v4 = [(PFSceneTaxonomy *)self nodeRefForName:a3];
  if (v4) {
    v4 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:v4 taxonomy:self];
  }

  return v4;
}

- (id)nodeForExtendedSceneClassId:(unint64_t)a3
{
  v4 = [(PFSceneTaxonomy *)self nodeRefForExtendedSceneClassId:a3];
  if (v4) {
    v4 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:v4 taxonomy:self];
  }

  return v4;
}

- (id)nodeForSceneClassId:(unsigned int)a3
{
  return [(PFSceneTaxonomy *)self nodeForExtendedSceneClassId:a3];
}

- (PFSceneTaxonomyNode)rootNode
{
  v2 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:[(PFSceneTaxonomy *)self rootNodeRef] taxonomy:self];

  return v2;
}

+ (id)sharedTaxonomy
{
  if (sharedTaxonomy_onceToken[0] != -1) {
    dispatch_once(sharedTaxonomy_onceToken, &__block_literal_global_7058);
  }
  v2 = (void *)sharedTaxonomy_sharedTaxonomy;

  return v2;
}

void __48__PFSceneTaxonomy_Compatibility__sharedTaxonomy__block_invoke()
{
  v0 = objc_alloc_init(PFSceneTaxonomy);
  v1 = (void *)sharedTaxonomy_sharedTaxonomy;
  sharedTaxonomy_sharedTaxonomy = (uint64_t)v0;

  if (!sharedTaxonomy_sharedTaxonomy && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error creating PFSceneTaxonomy.sharedTaxonomy", v2, 2u);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_dataPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&self->_backingFile);
}

- (BOOL)loadOrCreateIndex
{
  v4.receiver = self;
  v4.super_class = (Class)PFSceneTaxonomy;
  [(PFCachingArchiveIndex *)&v4 loadOrCreateIndex];
  return self->_nameMap && self->_sceneMap != 0;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (char)magic
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v2 = [a1 architectureHash];
  id v3 = [a1 dataArchivePath];
  if (stat((const char *)[v3 fileSystemRepresentation], &v12)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (v12.st_mode & 0x8000u) != 0;
  }
  int v5 = v4;

  if (v5)
  {
    int v6 = ((unint64_t)(v12.st_mtimespec.tv_sec ^ v12.st_size) >> 32) ^ LODWORD(v12.st_mtimespec.tv_sec) ^ LODWORD(v12.st_size);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = [a1 dataArchivePath];
      int v10 = *__error();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      __int16 v15 = 1024;
      int v16 = v10;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get file metadata from dataArchivePath %{public}@: %d.", buf, 0x12u);
    }
    int v6 = 0;
  }
  int v11 = v2;
  v7 = -[PFSceneTaxonomy magic]::buffer;
  snprintf(-[PFSceneTaxonomy magic]::buffer, 0x50uLL, "%s%s%02x%08x%08x", "PFSceneTaxonomy", "02", 6, v11, v6);
  return v7;
}

- (unint64_t)indexFileVersion
{
  return 6;
}

- (id)dataArchivePath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dataPath = self->_dataPath;
  if (dataPath)
  {
    id v3 = dataPath;
  }
  else
  {
    localizationBundle = self->_localizationBundle;
    if (localizationBundle)
    {
      +[PFSceneTaxonomy dataArchivePathForIdentifier:bundle:]((uint64_t)PFSceneTaxonomy, self->_identifier, localizationBundle);
      id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v7 = [(PFSceneTaxonomy *)self indexName];
          v8 = [(NSBundle *)self->_localizationBundle bundlePath];
          *(_DWORD *)buf = 138543618;
          int v11 = v7;
          __int16 v12 = 2114;
          v13 = v8;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error finding %{public}@ data archive resource in bundle %{public}@.", buf, 0x16u);
        }
        id v3 = 0;
      }
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)PFSceneTaxonomy;
      id v3 = [(PFCachingArchiveIndex *)&v9 dataArchivePath];
    }
  }

  return v3;
}

+ (id)dataArchivePathForIdentifier:(void *)a3 bundle:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  v7 = +[PFSceneTaxonomy indexNameForIdentifier:forArchivePath:](v6, v4, 1);
  v8 = [v5 pathForResource:v7 ofType:@"bz2"];

  return v8;
}

+ (__CFString)indexNameForIdentifier:(int)a3 forArchivePath:
{
  id v4 = a2;
  self;
  if (!v4 && a3)
  {
    id v4 = +[PFSceneTaxonomy latestTaxonomyIdentifier];
  }
  if (v4)
  {
    id v5 = [@"PFSceneTaxonomyData" stringByAppendingString:@"_"];
    uint64_t v6 = [v5 stringByAppendingString:v4];
  }
  else
  {
    uint64_t v6 = @"PFSceneTaxonomyData";
  }

  return v6;
}

- (id)indexName
{
  dataPath = self->_dataPath;
  if (dataPath)
  {
    id v4 = [(NSString *)dataPath lastPathComponent];
    id v5 = [v4 stringByDeletingPathExtension];
  }
  else
  {
    id v5 = +[PFSceneTaxonomy indexNameForIdentifier:forArchivePath:]((uint64_t)PFSceneTaxonomy, self->_identifier, 0);
  }
  if (self->_forceIndexed)
  {
    uint64_t v6 = [v5 stringByAppendingString:@"-forced"];

    id v5 = (void *)v6;
  }

  return v5;
}

- (const)indexLabel
{
  if (self->_dataPath) {
    return "test scene taxonomy";
  }
  else {
    return "scene taxonomy";
  }
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  id v3 = a3;
  operator new();
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  if (v4 && (localizationBundle = self->_localizationBundle) != 0 && self->_tableName)
  {
    uint64_t v6 = -[NSBundle localizedStringForKey:value:table:](localizationBundle, "localizedStringForKey:value:table:", v4, @"NO LOC");
    if (([@"NO LOC" isEqualToString:v6] & 1) != 0
      || ([@"NULL" isEqualToString:v6] & 1) != 0)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  if ([(PFSceneTaxonomy *)self loadOrCreateIndex])
  {
    id v3 = NSString;
    uint64_t v4 = objc_opt_class();
    tableName = self->_tableName;
    if (self->_dataPath) {
      dataPath = (__CFString *)self->_dataPath;
    }
    else {
      dataPath = @"<default>";
    }
    uint64_t v7 = *((void *)self->_nameMap + 4);
    v8 = [(PFSceneTaxonomy *)self digest];
    objc_super v9 = [v3 stringWithFormat:@"<%@: %p> data:%@ tableName:%@, count:%lu, digest:%@", v4, self, dataPath, tableName, v7, v8];
  }
  else
  {
    objc_super v9 = 0;
  }

  return (NSString *)v9;
}

- (unint64_t)extendedSceneClassIdForName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [(PFSceneTaxonomy *)self nodeRefForName:a3];
  if (v3) {
    return *v3;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136446210;
    uint64_t v6 = "-[PFSceneTaxonomy extendedSceneClassIdForName:]";
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFSceneTaxonomyErrorReturn in %{public}s.", (uint8_t *)&v5, 0xCu);
  }
  return -1;
}

- (void)nodeRefForName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PFSceneTaxonomy *)self loadOrCreateIndex];
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if ((unint64_t)[v4 length] >= 0x201) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"name must be %ld characters or less: %@", 512, v4 format];
    }
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_heap_memory((uint64_t)v18);
    nameMap = self->_nameMap;
    v8 = (char *)[v4 UTF8String];
    if (v18[0]) {
      uint64_t v9 = v18[0] - (void)&v16;
    }
    else {
      uint64_t v9 = 1;
    }
    uint64_t v16 = v9;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::basic_string((uint64_t)v20, v8, &v16);
    unint64_t v10 = boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()((uint64_t)v20);
    unint64_t v11 = 265 * ((~v10 + (v10 << 21)) ^ ((~v10 + (v10 << 21)) >> 24));
    boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<std::pair<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>> const,pf::SceneTaxonomyNode>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,pf::SceneTaxonomyNode,boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>>::find_node_impl<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>(&v19, (uint64_t)nameMap, 2147483649u * ((21 * (v11 ^ (v11 >> 14))) ^ ((21 * (v11 ^ (v11 >> 14))) >> 28)), (uint64_t)v20);
    int64_t v12 = (char *)&v19 - (char *)&v17;
    if (v19 == 1) {
      int64_t v12 = 0;
    }
    uint64_t v17 = v12 + v19;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::~basic_string((uint64_t)v20);
    if (v17 == 1) {
      v13 = 0;
    }
    else {
      v13 = (char *)&v18[-1] + v17;
    }
    if (v13) {
      uint64_t v14 = v13 + 32;
    }
    else {
      uint64_t v14 = 0;
    }
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::~basic_managed_heap_memory(v18);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)nodeRefForExtendedSceneClassId:(unint64_t)a3
{
  unint64_t v13 = a3;
  if (![(PFSceneTaxonomy *)self loadOrCreateIndex]) {
    return 0;
  }
  boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<std::pair<unsigned long long const,boost::interprocess::offset_ptr<pf::SceneTaxonomyNode,long,unsigned long,0ul>>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,unsigned long long,boost::interprocess::offset_ptr<pf::SceneTaxonomyNode,long,unsigned long,0ul>,boost::hash<unsigned long long>,std::equal_to<unsigned long long>>>::find_node_impl<unsigned long long,std::equal_to<unsigned long long>>(&v14, (uint64_t)self->_sceneMap, a3, (uint64_t *)&v13);
  result = 0;
  int64_t v6 = (char *)&v14 - v12;
  if (v14 == 1) {
    int64_t v6 = 0;
  }
  uint64_t v7 = v6 + v14;
  v8 = &v12[v7];
  if (v7 != 1 && v8 != 0)
  {
    uint64_t v10 = *((void *)v8 + 1);
    unint64_t v11 = &v8[v10 + 8];
    if (v10 == 1) {
      return 0;
    }
    else {
      return v11;
    }
  }
  return result;
}

- (void)nodeRefForSceneClassId:(unsigned int)a3
{
  return [(PFSceneTaxonomy *)self nodeRefForExtendedSceneClassId:a3];
}

- (void)rootNodeRef
{
  return [(PFSceneTaxonomy *)self nodeRefForName:@"|_ROOT_|"];
}

- (NSString)digest
{
  if ([(PFSceneTaxonomy *)self loadOrCreateIndex]) {
    id v3 = self->_digest;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (unint64_t)nodeCount
{
  if ([(PFSceneTaxonomy *)self loadOrCreateIndex]) {
    return *((void *)self->_nameMap + 4);
  }
  else {
    return 0;
  }
}

- (PFSceneTaxonomy)initWithDataPath:(id)a3 identifier:(id)a4 localizationBundle:(id)a5 tableName:(id)a6 error:(id *)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
LABEL_4:
    v31.receiver = self;
    v31.super_class = (Class)PFSceneTaxonomy;
    uint64_t v17 = [(PFSceneTaxonomy *)&v31 init];
    v18 = v17;
    if (v17)
    {
      uint64_t v19 = +[PFSceneTaxonomy latestTaxonomyIdentifier];
      char v20 = [v13 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = [v13 copy];
        identifier = v17->_identifier;
        v17->_identifier = (NSString *)v21;
      }
      uint64_t v23 = [v12 copy];
      dataPath = v17->_dataPath;
      v17->_dataPath = (NSString *)v23;

      objc_storeStrong((id *)&v17->_localizationBundle, a5);
      uint64_t v25 = [v15 copy];
      tableName = v17->_tableName;
      v17->_tableName = (NSString *)v25;

      if (PFArchiveFileIsAppleInternal::onceToken[0] != -1) {
        dispatch_once(PFArchiveFileIsAppleInternal::onceToken, &__block_literal_global_11911);
      }
      if (PFArchiveFileIsAppleInternal::isAppleInternal)
      {
        v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        int v28 = [v27 BOOLForKey:@"PFDefaultSceneTaxonomyIsDenylistDisabled"];

        if (v28) {
          v18->_forceIndexed = 1;
        }
      }
    }
    goto LABEL_17;
  }
  uint64_t v16 = +[PFSceneTaxonomy dataArchivePathForIdentifier:bundle:]((uint64_t)PFSceneTaxonomy, v13, v14);
  if (v16)
  {

    goto LABEL_4;
  }
  if (a7)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = [v14 bundlePath];
    *(_DWORD *)buf = 138412546;
    id v33 = v13;
    __int16 v34 = 2112;
    v35 = v30;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error reading scene taxonomy data archive with identifier %@ from %@", buf, 0x16u);
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (PFSceneTaxonomy)initWithDataPath:(id)a3 localizationBundle:(id)a4 tableName:(id)a5
{
  return [(PFSceneTaxonomy *)self initWithDataPath:a3 identifier:0 localizationBundle:a4 tableName:a5 error:0];
}

- (PFSceneTaxonomy)initWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not obtain the bundle containing the scene taxonomy", (uint8_t *)&v14, 2u);
  }
  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = [v8 stringForKey:@"PFSceneTaxonomyData"];

  if ([v9 length])
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        id v15 = @"PFSceneTaxonomyData";
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error locating custom scene taxonomy from user default %@: %@; fallbacking back to default taxonomy",
          (uint8_t *)&v14,
          0x16u);
      }

      uint64_t v9 = 0;
      if (v7) {
        goto LABEL_9;
      }
LABEL_13:

      id v12 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = @"PFSceneTaxonomyData";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "using custom scene taxonomy from user default %@: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_9:
  id v12 = [(PFSceneTaxonomy *)self initWithDataPath:v9 identifier:v6 localizationBundle:v7 tableName:@"scenetaxonomy" error:a4];
LABEL_14:

  return v12;
}

- (PFSceneTaxonomy)initWithLatestTaxonomy
{
  if (-[PFSceneTaxonomy initWithLatestTaxonomy]::onceToken[0] != -1) {
    dispatch_once(-[PFSceneTaxonomy initWithLatestTaxonomy]::onceToken, &__block_literal_global_7208);
  }
  uint64_t v3 = -[PFSceneTaxonomy initWithLatestTaxonomy]::identifier;

  return [(PFSceneTaxonomy *)self initWithIdentifier:v3 error:0];
}

void __41__PFSceneTaxonomy_initWithLatestTaxonomy__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 stringForKey:@"PFSceneTaxonomyIdentifierOverride"];

  if (v1)
  {
    objc_storeStrong((id *)&-[PFSceneTaxonomy initWithLatestTaxonomy]::identifier, v1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      BOOL v5 = v1;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "using scene taxonomy identifier override: %@", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    uint64_t v2 = +[PFSceneTaxonomy latestTaxonomyIdentifier];
    uint64_t v3 = (void *)-[PFSceneTaxonomy initWithLatestTaxonomy]::identifier;
    -[PFSceneTaxonomy initWithLatestTaxonomy]::identifier = v2;
  }
}

+ (NSString)latestTaxonomyIdentifier
{
  return (NSString *)@"99";
}

@end
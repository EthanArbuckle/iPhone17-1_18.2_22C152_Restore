@interface OZCopyFootageInfo
+ (id)fileURLToFootageInfoMap:(void *)a3 includeUnused:(BOOL)a4 destination:(id)a5;
+ (id)fileURLsForNode:(void *)a3;
+ (unint64_t)fileCount:(id)a3;
+ (unint64_t)totalSizeInBytes:(id)a3 forceUpdate:(BOOL)a4;
+ (void)reconnectFootage:(id)a3 scene:(void *)a4;
+ (void)updateSizes:(id)a3 forceUpdate:(BOOL)a4;
- (BOOL)sizeIsValid;
- (BOOL)updateSize:(BOOL)a3 error:(id *)a4;
- (NSMutableDictionary)associatedFilesSourceDestPaths;
- (NSSet)nodeIDs;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (unint64_t)sizeInBytes;
- (void)dealloc;
- (void)scene;
- (void)setAssociatedFilesSourceDestPaths:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setNodeIDs:(id)a3;
- (void)setScene:(void *)a3;
- (void)setSizeInBytes:(unint64_t)a3;
- (void)setSizeIsValid:(BOOL)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation OZCopyFootageInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZCopyFootageInfo;
  [(OZCopyFootageInfo *)&v3 dealloc];
}

+ (void)updateSizes:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(a3, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10++)), "updateSize:error:", v4, 0);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)updateSize:(BOOL)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_sizeIsValid && !a3) {
    return 1;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  self->_sizeInBytes = 0;
  uint64_t v8 = [(NSURL *)self->_sourceURL OZ_imageSequenceURLs];
  if ([(NSOrderedSet *)v8 count])
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = *(void *)"";
    v21[2] = __38__OZCopyFootageInfo_updateSize_error___block_invoke;
    v21[3] = &unk_1E616DF88;
    v21[4] = v7;
    v21[5] = &v26;
    v21[6] = &v22;
    v21[7] = a4;
    [(NSOrderedSet *)v8 enumerateObjectsUsingBlock:v21];
    if (*((unsigned char *)v23 + 24))
    {
      self->_sizeInBytes = v27[3];
      BOOL v9 = 1;
      self->_sizeIsValid = 1;
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return v9;
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    return 0;
  }
  uint64_t v10 = objc_msgSend(v7, "OZ_sizeOfItemAtPath:error:", -[NSURL path](self->_sourceURL, "path"), a4);
  if (!v10) {
    return 0;
  }
  self->_sizeInBytes = [v10 unsignedIntegerValue];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = (void *)[(NSMutableDictionary *)self->_associatedFilesSourceDestPaths keyEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = objc_msgSend(v7, "OZ_sizeOfItemAtPath:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4);
        if (v15) {
          self->_sizeInBytes += [v15 unsignedIntegerValue];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v12);
  }
  BOOL v9 = 1;
  self->_sizeIsValid = 1;
  return v9;
}

uint64_t __38__OZCopyFootageInfo_updateSize_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "OZ_sizeOfItemAtPath:error:", objc_msgSend(a2, "path"), *(void *)(a1 + 56));
  if (result)
  {
    uint64_t result = [(id)result unsignedIntegerValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

+ (id)fileURLsForNode:(void *)a3
{
  objc_super v3 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = *((void *)a3 + 1);
    long long v22 = xmmword_1B7E78C80;
    if (OZFactory::isKindOfClass(v4, (int32x4_t *)&v22))
    {
      uint64_t v6 = *(v3 - 25);
      v5 = v3 - 25;
      uint64_t v7 = (const __CFURL **)(*(uint64_t (**)(void *))(v6 + 1232))(v5);
      PCURL::getAsFileSystemString(v7, (PCString *)&cf);
      uint64_t v8 = PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      if ([(__CFString *)v8 length])
      {
        BOOL v9 = (CFTypeRef *)(*(uint64_t (**)(void *))(*v5 + 1232))(v5);
        v25[0] = (id)CFRetain(*v9);
        return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      }
      return 0;
    }
    if (v11)
    {
      uint64_t v12 = v11;
      (*(void (**)(const __CFURL **__return_ptr))(*(void *)v11 + 1232))(&v20);
      PCURL::getAsFileSystemString(&v20, (PCString *)&cf);
      uint64_t v13 = PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      PCURL::~PCURL((PCURL *)&v20);
      if (![(__CFString *)v13 length]) {
        return 0;
      }
      (*(void (**)(CFTypeRef *__return_ptr, void *))(*(void *)v12 + 1232))(&cf, v12);
      CFTypeRef v24 = (id)CFRetain(cf);
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    }
    else
    {
      unint64_t v15 = v3[1];
      long long v19 = xmmword_1B7E77B70;
      if (OZFactory::isKindOfClass(v15, (int32x4_t *)&v19)
        && (*(unsigned int (**)(void *))(*(v3 - 25) + 296))(v3 - 25))
      {
        return (id)(*(uint64_t (**)(void *))(*(v3 - 25) + 888))(v3 - 25);
      }
      objc_super v3 = v16;
      if (!v16) {
        return v3;
      }
      if (OZFootage::isInUseByUnreplacedDropZonesOnly(v16, 0)) {
        return 0;
      }
      (*(void (**)(const __CFURL **__return_ptr, void *))(*v3 + 1232))(&v20, v3);
      PCURL::getAsFileSystemString(&v20, (PCString *)&cf);
      long long v17 = PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      PCURL::~PCURL((PCURL *)&v20);
      if (![(__CFString *)v17 length]) {
        return 0;
      }
      (*(void (**)(CFTypeRef *__return_ptr, void *))(*v3 + 1232))(&cf, v3);
      CFTypeRef v23 = (id)CFRetain(cf);
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    }
    objc_super v3 = (void *)v14;
    PCURL::~PCURL((PCURL *)&cf);
  }
  return v3;
}

+ (id)fileURLToFootageInfoMap:(void *)a3 includeUnused:(BOOL)a4 destination:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v58 = 0;
  if (a5)
  {
    uint64_t v6 = (OZScene *)*((void *)a3 + 3);
    if (v6)
    {
      v58 = (void *)[MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
      uint64_t v7 = *((void *)v6 + 151);
      v54 = v93;
      memset(v93, 0, sizeof(v93));
      int v94 = 1065353216;
      v91[0] = v7;
      v91[1] = v7;
      v91[2] = (char *)v6 + 1200;
      char v92 = 0;
      v52 = v89;
      memset(v89, 0, sizeof(v89));
      int v90 = 1065353216;
      v85 = (void *)((char *)v6 + 1200);
      uint64_t v86 = v7;
      v87 = (void *)((char *)v6 + 1200);
      char v88 = 0;
      OZScene::unusedSceneNodeFileIDs(v6, (char **)&__p);
      v82[0] = 0;
      v82[1] = 0;
      v81 = (uint64_t *)v82;
      uint64_t v8 = (unsigned int *)__p;
      BOOL v9 = v84;
      while (v8 != v9)
      {
        std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>(&v81, v8, v8);
        ++v8;
      }
      while ((void *)v91[0] != v85)
      {
        uint64_t v10 = *(_DWORD **)(v91[0] + 16);
        unsigned int v57 = v10[20];
        if (a4) {
          goto LABEL_18;
        }
        long long v11 = v82[0];
        if (!v82[0]) {
          goto LABEL_18;
        }
        uint64_t v12 = v82;
        do
        {
          uint64_t v13 = v11;
          uint64_t v14 = v12;
          unsigned int v15 = *((_DWORD *)v11 + 7);
          if (v15 >= v57) {
            uint64_t v12 = (void **)v11;
          }
          else {
            ++v11;
          }
          long long v11 = (void *)*v11;
        }
        while (v11);
        if (v12 == v82) {
          goto LABEL_18;
        }
        if (v15 < v57) {
          uint64_t v13 = v14;
        }
        if (v57 < *((_DWORD *)v13 + 7))
        {
LABEL_18:
          id v16 = +[OZCopyFootageInfo fileURLsForNode:](OZCopyFootageInfo, "fileURLsForNode:", v10, v52, v54);
          id v17 = v16;
          if (v16)
          {
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v99 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v78;
              obuint64_t j = v17;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v78 != v19) {
                    objc_enumerationMutation(obj);
                  }
                  v21 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                  if (objc_msgSend((id)objc_msgSend(v21, "path"), "length"))
                  {
                    long long v22 = (OZCopyFootageInfo *)[v58 objectForKey:v21];
                    if (!v22)
                    {
                      long long v22 = objc_alloc_init(OZCopyFootageInfo);
                      [(OZCopyFootageInfo *)v22 setSourceURL:v21];
                      uint64_t v23 = objc_msgSend((id)objc_msgSend(v21, "path"), "lastPathComponent");
                      -[OZCopyFootageInfo setDestinationURL:](v22, "setDestinationURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(a5, "stringByAppendingPathComponent:", v23)));
                      -[OZCopyFootageInfo setAssociatedFilesSourceDestPaths:](v22, "setAssociatedFilesSourceDestPaths:", [MEMORY[0x1E4F1CA60] dictionary]);
                      [v58 setObject:v22 forKey:v21];
                    }
                    if (v10)
                    {
                      if (v24)
                      {
                        (*(void (**)(const PCURL **__return_ptr))(*(void *)v24 + 1512))(&v60);
                        char v25 = v60;
                        uint64_t v26 = (const PCURL *)v61;
                        while (v25 != v26)
                        {
                          PCURL::PCURL((PCURL *)&v95, v25);
                          PCURL::getAsFileSystemString((const __CFURL **)&v95, &v76);
                          v27 = PCString::ns_str(&v76);
                          PCString::~PCString(&v76);
                          if (v27)
                          {
                            if ([(__CFString *)v27 length])
                            {
                              uint64_t v28 = objc_msgSend(a5, "stringByAppendingPathComponent:", -[__CFString lastPathComponent](v27, "lastPathComponent"));
                              if (([(__CFString *)v27 isEqualToString:v28] & 1) == 0) {
                                [(NSMutableDictionary *)[(OZCopyFootageInfo *)v22 associatedFilesSourceDestPaths] setObject:v28 forKeyedSubscript:v27];
                              }
                            }
                          }
                          PCURL::~PCURL((PCURL *)&v95);
                          char v25 = (const PCURL *)((char *)v25 + 8);
                        }
                        v95 = &v60;
                        std::vector<PCURL>::__destroy_vector::operator()[abi:ne180100]((void ***)&v95);
                      }
                    }
                    if ([(OZCopyFootageInfo *)v22 nodeIDs])
                    {
                      uint64_t v29 = [(OZCopyFootageInfo *)v22 nodeIDs];
                      uint64_t v30 = -[NSSet setByAddingObject:](v29, "setByAddingObject:", [NSNumber numberWithUnsignedInt:v57]);
                    }
                    else
                    {
                      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v57));
                    }
                    [(OZCopyFootageInfo *)v22 setNodeIDs:v30];
                  }
                }
                uint64_t v18 = [obj countByEnumeratingWithState:&v77 objects:v99 count:16];
              }
              while (v18);
            }
          }
        }
        OZObject::iterator_t<OZSceneNode,false,true,OZObject::defaultValidator>::increment(v91);
      }
      uint64_t v31 = (void *)[MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v32 = (void *)[v58 keyEnumerator];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v72 objects:v98 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v73 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = objc_msgSend(v58, "objectForKey:", *(void *)(*((void *)&v72 + 1) + 8 * j), v52);
            v37 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "destinationURL"), "path"), "lastPathComponent");
            uint64_t v38 = objc_msgSend((id)objc_msgSend(v37, "pathExtension"), "lowercaseString");
            if (v38) {
              v37 = objc_msgSend((id)objc_msgSend(v37, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v38);
            }
            v39 = (void *)[v31 objectForKey:v37];
            if (v39) {
              [v39 addObject:v36];
            }
            else {
              objc_msgSend(v31, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObject:", v36), v37);
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v72 objects:v98 count:16];
        }
        while (v33);
      }
      v40 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v52);
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v41 = (void *)[v31 keyEnumerator];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v97 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v69;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v69 != v43) {
              objc_enumerationMutation(v41);
            }
            [v40 addObject:*(void *)(*((void *)&v68 + 1) + 8 * k)];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v97 count:16];
        }
        while (v42);
      }
      long long v67 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v64 = 0u;
      v45 = (void *)[v31 keyEnumerator];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v96 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v65;
        do
        {
          for (uint64_t m = 0; m != v46; ++m)
          {
            if (*(void *)v65 != v47) {
              objc_enumerationMutation(v45);
            }
            uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * m);
            v50 = (void *)[v31 objectForKey:v49];
            v60 = 0;
            v61 = &v60;
            uint64_t v62 = 0x2020000000;
            uint64_t v63 = 0;
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = *(void *)"";
            v59[2] = __71__OZCopyFootageInfo_fileURLToFootageInfoMap_includeUnused_destination___block_invoke;
            v59[3] = &unk_1E616DFB0;
            v59[5] = v49;
            v59[6] = &v60;
            v59[4] = v40;
            [v50 enumerateObjectsUsingBlock:v59];
            _Block_object_dispose(&v60, 8);
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v96 count:16];
        }
        while (v46);
      }
      std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v81, v82[0]);
      if (__p)
      {
        v84 = (unsigned int *)__p;
        operator delete(__p);
      }
      std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table(v53);
      std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)v54);
    }
  }
  return v58;
}

uint64_t __71__OZCopyFootageInfo_fileURLToFootageInfoMap_includeUnused_destination___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    while (1)
    {
      unint64_t v4 = (void *)[*(id *)(a1 + 40) stringByDeletingPathExtension];
      int v5 = objc_msgSend((id)objc_msgSend(a2, "destinationURL"), "OZ_isImageSequenceURL");
      uint64_t v6 = NSString;
      uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      if (v5)
      {
        uint64_t v8 = [v6 stringWithFormat:@"(%@)[", v7];
        uint64_t v9 = [v4 rangeOfString:@"[" options:4];
        uint64_t v11 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v8);
      }
      else
      {
        uint64_t v11 = [v4 stringByAppendingString:objc_msgSend(v6, "stringWithFormat:", @" %@", v7)];
      }
      uint64_t v12 = (void *)v11;
      uint64_t v13 = [*(id *)(a1 + 40) pathExtension];
      if (v13) {
        uint64_t v12 = (void *)[v12 stringByAppendingPathExtension:v13];
      }
      if (([*(id *)(a1 + 32) containsObject:v12] & 1) == 0) {
        break;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    [*(id *)(a1 + 32) addObject:v12];
    uint64_t result = objc_msgSend(a2, "setDestinationURL:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "destinationURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", v12));
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

+ (unint64_t)fileCount:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = objc_msgSend(a3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      uint64_t v11 = objc_msgSend(v10, "OZ_imageSequenceURLs");
      if ([v11 count]) {
        uint64_t v12 = [v11 count];
      }
      else {
        uint64_t v12 = 1;
      }
      v7 += v12
          + objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v10), "associatedFilesSourceDestPaths"), "allKeys"), "count");
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);
  return v7;
}

+ (unint64_t)totalSizeInBytes:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  +[OZCopyFootageInfo updateSizes:a3 forceUpdate:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(a3, "keyEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = (void *)[a3 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      if ([v11 sizeIsValid]) {
        v8 += [v11 sizeInBytes];
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v7);
  return v8;
}

+ (void)reconnectFootage:(id)a3 scene:(void *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = (void *)[a3 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          uint64_t v11 = (void *)[v10 nodeIDs];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = *(void *)"";
          v12[2] = __44__OZCopyFootageInfo_reconnectFootage_scene___block_invoke;
          v12[3] = &unk_1E616DFD8;
          v12[4] = v10;
          v12[5] = a4;
          [v11 enumerateObjectsUsingBlock:v12];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

void __44__OZCopyFootageInfo_reconnectFootage_scene___block_invoke(uint64_t a1, void *a2)
{
  Node = OZScene::getNode(*(OZScene **)(a1 + 40), [a2 unsignedIntValue]);
  unint64_t v4 = Node[1];
  long long v25 = xmmword_1B7E78C80;
  if (OZFactory::isKindOfClass(v4, (int32x4_t *)&v25))
  {
    uint64_t v6 = *(Node - 25);
    uint64_t v5 = Node - 25;
    uint64_t v7 = (const __CFURL **)(*(uint64_t (**)(void *))(v6 + 1232))(v5);
    PCURL::getAsFileSystemString(v7, &v24);
    uint64_t v8 = PCString::ns_str(&v24);
    PCString::~PCString(&v24);
    uint64_t v9 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
    if ([(__CFString *)v8 isEqualToString:v9]) {
      return;
    }
    PCURL::PCURL((PCURL *)&v23, v9);
    PCURL::PCURL((PCURL *)&v24, &v23, 0);
    PCString::~PCString(&v23);
    (*(void (**)(void *, PCString *))(*v5 + 1224))(v5, &v24);
  }
  else
  {
    if (v10) {
      (*(void (**)(void *, void))(*(void *)v10 + 1488))(v10, *(void *)(a1 + 32));
    }
    if (v11)
    {
      uint64_t v12 = v11;
      (*(void (**)(PCString *__return_ptr))(*(void *)v11 + 1232))(&v24);
      PCURL::getAsFileSystemString((const __CFURL **)&v24, &v23);
      long long v13 = PCString::ns_str(&v23);
      PCString::~PCString(&v23);
      long long v14 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
      if (([(__CFString *)v13 isEqualToString:v14] & 1) == 0)
      {
        PCURL::PCURL((PCURL *)&v22, v14);
        PCURL::PCURL((PCURL *)&v23, &v22, 0);
        PCString::~PCString(&v22);
        (*(void (**)(void *, PCString *))(*(void *)v12 + 1400))(v12, &v23);
        PCURL::~PCURL((PCURL *)&v23);
      }
    }
    else
    {
      if (!v15) {
        return;
      }
      long long v16 = v15;
      (*(void (**)(PCString *__return_ptr))(*(void *)v15 + 1232))(&v24);
      PCURL::getFilename((const __CFURL **)&v24, &v23);
      PCURL::getAsFileSystemString((const __CFURL **)&v24, &v22);
      long long v17 = PCString::ns_str(&v22);
      PCString::~PCString(&v22);
      uint64_t v18 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
      if (([(__CFString *)v17 isEqualToString:v18] & 1) == 0)
      {
        PCURL::PCURL((PCURL *)&v21, v18);
        PCURL::PCURL((PCURL *)&v22, (const PCString *)&v21, 0);
        PCString::~PCString((PCString *)&v21);
        v21 = 0;
        Instance = (PMMediaManager *)PMMediaManager::getInstance(v19);
        if (!PMMediaManager::open(Instance, (const __CFURL **)&v22, &v21, 0)) {
          OZFootage::setClipMinimal(v16, v21);
        }
        PCURL::~PCURL((PCURL *)&v22);
      }
      PCString::~PCString(&v23);
    }
  }
  PCURL::~PCURL((PCURL *)&v24);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSSet)nodeIDs
{
  return self->_nodeIDs;
}

- (void)setNodeIDs:(id)a3
{
}

- (BOOL)sizeIsValid
{
  return self->_sizeIsValid;
}

- (void)setSizeIsValid:(BOOL)a3
{
  self->_sizeIsValid = a3;
}

- (unint64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(unint64_t)a3
{
  self->_sizeInBytes = a3;
}

- (NSMutableDictionary)associatedFilesSourceDestPaths
{
  return self->_associatedFilesSourceDestPaths;
}

- (void)setAssociatedFilesSourceDestPaths:(id)a3
{
}

- (void)scene
{
  return self->_scene;
}

- (void)setScene:(void *)a3
{
  self->_scene = a3;
}

@end